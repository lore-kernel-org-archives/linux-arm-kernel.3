Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF821C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHCxXWPnzYyjoLRwh7NLGv9YF8OLiGlKRXFEoR8cvTk=; b=q8EX8k+yrl0aE6SCsp++DXIKPN
	mix8qQ3RdwJk/WtLZXQDl4B0WZ4OtBpQUDhZOT9HOExt1/b1uJ2aJcrm/pdMV0Ltdo1fXReRaqQ4o
	3Y6S0x10GxpxQCqZXrcCPmD/2M1mtbls34ZU48tpoWiXuDA/2SRj3nxa2LoSWojota+TWhnx67xQ+
	mkiRenbiUcrO1ZnlG+7jGGDdstNVJghHpyfrZGVQcTFFBCZ0kq/P0rHRuNJpt2mZ23bgX4BNlGsM4
	SAA9YQv5y4Awpei9dN7ToGtMQqyCEDf2gWO+DouFrXeGF91gOtnTlDUblRUz6nKcBtSdrz0VP6bze
	wng46f7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcze-00000006vqw-0A4Z;
	Fri, 03 Jul 2026 12:27:42 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfczZ-00000006vp1-3wTL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:27:39 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 17F94760B5;
	Fri,  3 Jul 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50FE9779AA;
	Fri,  3 Jul 2026 12:27:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4DHYELeqR2rGIwAAD6G6ig
	(envelope-from <clopez@suse.de>); Fri, 03 Jul 2026 12:27:35 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
Subject: [PATCH v4 1/2] KVM: arm64: vgic: Fix race between LPI release and re-registration
Date: Fri,  3 Jul 2026 14:26:00 +0200
Message-ID: <20260703122601.2617577-3-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260703122601.2617577-2-clopez@suse.de>
References: <20260703122601.2617577-2-clopez@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 17F94760B5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_052738_117719_DBC04AF7 
X-CRM114-Status: GOOD (  17.86  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Fix a potential race between decrementing an LPI's reference count and
evicting that structure from the LPI xarray.

LPI structures are maintained in the VGIC LPI xarray (dist->lpi_xa).
When the reference count of an LPI structure drops to zero,
vgic_release_lpi_locked() removes the structure from the xarray and
frees it under the xarray lock.

However, the release of an LPI can race with a concurrent LPI
re-registration with the same INTID via vgic_add_lpi() on another CPU,
since the reference count drop and the xarray eviction are not performed
in a single atomic step. This can happen e.g. if the guest issues a
DISCARD while the LPI is still referenced from a vCPU's active-pending
list (ap_list), and the same INTID is re-mapped via MAPTI.

Particularly, vgic_release_lpi_locked() is called from two distinct
paths: direct release via vgic_put_irq(), and deferred release via
vgic_release_deleted_lpis(). During direct release, the issue can result
in deleting a newly registered LPI from the xarray:

  CPU0 (Releasing LPI)                    CPU1 (Adding new LPI)
  ====================                    =====================
  vgic_put_irq()
      __vgic_put_irq()
          refcount_dec_and_test()
                                          vgic_add_lpi()
                                              xa_lock_irqsave()
                                              old_irq = xa_load(.., intid)
                                              vgic_try_get_irq_ref(old_irq) == false
                        new IRQ inserted -->  __xa_store(.., intid, ..)
                                              xa_unlock_irqrestore()
  xa_lock_irqsave();
  vgic_release_lpi_locked()
      __xa_erase(.., irq->intid)   <-- BUG: new IRQ is erased
      kfree_rcu(old_irq)

During the deferred release path, the old IRQ can be leaked:

  CPU0 (Releasing LPI)                    CPU1 (Adding new LPI)
  ====================                    =====================
  vgic_put_irq_norelease()
      __vgic_put_irq()
          refcount_dec_and_test()
      irq->pending_release = true
                                          vgic_add_lpi()
                                              xa_lock_irqsave()
                                              old_irq = xa_load(.., intid)
                                              vgic_try_get_irq_ref(oldirq) == false
                 BUG: old IRQ overwritten --> __xa_store(.., intid, ..)
                                              xa_unlock_irqrestore()

  vgic_release_deleted_lpis()
      xa_lock_irqsave()
      xa_for_each() { .. } <-- old IRQ with pending_release = true
                               is gone, so it cannot be released

To fix the direct release path, move the reference count drop inside
the xarray lock, making sure that vgic_add_lpi() never encounters the
to-be-released LPI.

To fix the deferred release path, since the refcount drop must happen
under a raw spinlock, the same solution does not work. Instead, update
vgic_add_lpi(), so that if it evicts a non-NULL refcount=0 LPI from the
xarray, it takes on the responsibility of releasing it. If this happens,
vgic_release_deleted_lpis() will iterate the xarray normally and will
simply not find the already released structure.

Reported-by: Claude:claude-opus-4-6
Fixes: 3a08a6ca7c37 ("KVM: arm64: vgic-v3: Use bare refcount for VGIC LPIs")
Fixes: d54594accf73 ("KVM: arm64: vgic-v3: Erase LPIs from xarray outside of raw spinlocks")
Signed-off-by: Carlos López <clopez@suse.de>
---
 arch/arm64/kvm/vgic/vgic-its.c | 10 +++++++++-
 arch/arm64/kvm/vgic/vgic.c     | 10 ++++++----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 67d107e9a77d..577286069368 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -116,7 +116,15 @@ static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
 		kfree(irq);
 		irq = oldirq;
 	} else {
-		ret = xa_err(__xa_store(&dist->lpi_xa, intid, irq, 0));
+		/*
+		 * The entry is either empty or contains a dead LPI (refcount=0)
+		 * from the deferred release path, pending cleanup by
+		 * vgic_release_deleted_lpis(). Evict and free it if present.
+		 */
+		oldirq = __xa_store(&dist->lpi_xa, intid, irq, 0);
+		ret = xa_err(oldirq);
+		if (!ret && oldirq)
+			kfree_rcu(oldirq, rcu);
 	}
 
 	xa_unlock_irqrestore(&dist->lpi_xa, flags);
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 5a4768d8cd4f..cc09e0c45b46 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -167,12 +167,14 @@ void vgic_put_irq(struct kvm *kvm, struct vgic_irq *irq)
 		guard(spinlock_irqsave)(&dist->lpi_xa.xa_lock);
 	}
 
-	if (!__vgic_put_irq(kvm, irq))
+	if (!irq_is_lpi(kvm, irq->intid))
 		return;
 
-	xa_lock_irqsave(&dist->lpi_xa, flags);
-	vgic_release_lpi_locked(dist, irq);
-	xa_unlock_irqrestore(&dist->lpi_xa, flags);
+	if (refcount_dec_and_lock_irqsave(&irq->refcount,
+					  &dist->lpi_xa.xa_lock, &flags)) {
+		vgic_release_lpi_locked(dist, irq);
+		xa_unlock_irqrestore(&dist->lpi_xa, flags);
+	}
 }
 
 static void vgic_release_deleted_lpis(struct kvm *kvm)
-- 
2.51.0


