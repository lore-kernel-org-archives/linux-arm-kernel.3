Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A89C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J49rRWK+qTk3ZnrtvyvNoD7HOLGONSLhcd4y/Bizufk=; b=RCgdZJjbli5zXI5ZadG1VYjrJt
	iCQA4mW8V//yhVtbvKRjxh7NhXiJg7gOg9BDeUpZMVZzNvscoqFCHzY0fRUe0E8RsEY6MZEqfrEYR
	klvu+EwhddyxLz0x1Ik2U1CXCrAuP1tSTPRLsGrNpdegsuMlV5vED7vnSXfr7fWGc2kQu6SLv6Ulk
	7BBxxC+ItlZxvcDxDhmAYeGwzz3aYMW769I2QlVYH0+qk8/0+iyb4WZ+ywiceIjmtrVbAUmdOtTq+
	ClyLJi4PLtXpueHycORFd1v1ayu4AkqtP9fOv7iLqa4fgnpVrzUo2ietywIWq0NfenZHQbVrKFKNu
	J0KTkq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfQwc-00000005k5B-3ZJU;
	Thu, 02 Jul 2026 23:35:46 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfQwV-00000005k4j-3BSa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 23:35:45 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 27B0B7623E;
	Thu,  2 Jul 2026 23:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783035336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J49rRWK+qTk3ZnrtvyvNoD7HOLGONSLhcd4y/Bizufk=;
	b=YgssDtrEEmGzdbbzS2YgPuyqF/rCu/UGawglGjkbRyTyveZMYhkUWuz0/HhgD1h7Oogamp
	/IQiYzUA1/5DTTZ8jw4yCh+/f4SSZy36Jd1f2clLCaHHDmsUjJcULv/GdgTZLkl/sj+ByE
	2NFenXWytz65z0tVvinp+UlUu5wPXFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783035336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J49rRWK+qTk3ZnrtvyvNoD7HOLGONSLhcd4y/Bizufk=;
	b=5121OBXHUo21gfnnQcH+v7dnhd/ubWpmOt/vrYAf7kWlDg8KavOXqs8RXX7V/2k0JyR4z/
	dlb4cmtrruVT+WCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YgssDtrE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5121OBXH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783035336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J49rRWK+qTk3ZnrtvyvNoD7HOLGONSLhcd4y/Bizufk=;
	b=YgssDtrEEmGzdbbzS2YgPuyqF/rCu/UGawglGjkbRyTyveZMYhkUWuz0/HhgD1h7Oogamp
	/IQiYzUA1/5DTTZ8jw4yCh+/f4SSZy36Jd1f2clLCaHHDmsUjJcULv/GdgTZLkl/sj+ByE
	2NFenXWytz65z0tVvinp+UlUu5wPXFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783035336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J49rRWK+qTk3ZnrtvyvNoD7HOLGONSLhcd4y/Bizufk=;
	b=5121OBXHUo21gfnnQcH+v7dnhd/ubWpmOt/vrYAf7kWlDg8KavOXqs8RXX7V/2k0JyR4z/
	dlb4cmtrruVT+WCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AFBD779AA;
	Thu,  2 Jul 2026 23:35:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wlNIG8f1Rmo6QgAAD6G6ig
	(envelope-from <clopez@suse.de>); Thu, 02 Jul 2026 23:35:35 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64))
Subject: [PATCH] KVM: arm64: vgic: Fix race between LPI release and re-registration
Date: Fri,  3 Jul 2026 01:35:14 +0200
Message-ID: <20260702233514.2581921-1-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 27B0B7623E
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_163539_984643_3ED2C1F9 
X-CRM114-Status: GOOD (  20.92  )
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
                                              xa_lock_irqsave(..);
                                              old_irq = xa_load(&dist->lpi_xa, intid);
                                              vgic_try_get_irq_ref(old_irq) == false
                        new IRQ inserted -->  __xa_store(&dist->lpi_xa, intid, ..)
                                              xa_unlock_irqrestore(..);
  xa_lock_irqsave(..);
  vgic_release_lpi_locked()
      __xa_erase(&dist->lpi_xa, irq->intid);   <-- BUG: new IRQ is erased
      kfree_rcu(old_irq)

During the deferred release path, the old IRQ can be leaked:

  CPU0 (Releasing LPI)                    CPU1 (Adding new LPI)
  ====================                    =====================
  vgic_put_irq_norelease()
      __vgic_put_irq()
          refcount_dec_and_test()
      irq->pending_release = true
                                          vgic_add_lpi()
                                              xa_lock_irqsave(..);
                                              old_irq = xa_load(&dist->lpi_xa, intid);
                                              vgic_try_get_irq_ref() == false
                 BUG: old IRQ overwritten --> __xa_store(&dist->lpi_xa, intid, ..)
                                              xa_unlock_irqrestore(..);

  vgic_release_deleted_lpis()
      xa_lock_irqsave(..);
      xa_for_each() { .. } <-- old IRQ with pending_release = true
                               is gone, so it cannot be released

Fix both issues with two coordinated changes. On the release path,
erase and free the IRQ only if the xarray entry still contains the IRQ
being released. On the registration path, if a dead LPI is encountered
(non-NULL entry with refcount=0), release the old structure after
storing the new one. This ensures that whichever CPU acquires the
xarray lock first, it will take on the responsibility of releasing a
to-be-cleaned-up LPI.

Reported-by: Claude:claude-opus-4-6
Fixes: 3a08a6ca7c37 ("KVM: arm64: vgic-v3: Use bare refcount for VGIC LPIs")
Fixes: d54594accf73 ("KVM: arm64: vgic-v3: Erase LPIs from xarray outside of raw spinlocks")
Signed-off-by: Carlos López <clopez@suse.de>
---
 arch/arm64/kvm/vgic/vgic-its.c | 10 +++++++++-
 arch/arm64/kvm/vgic/vgic.c     | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 67d107e9a77d..42983d5211cc 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -116,7 +116,15 @@ static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
 		kfree(irq);
 		irq = oldirq;
 	} else {
-		ret = xa_err(__xa_store(&dist->lpi_xa, intid, irq, 0));
+		/*
+		 * The entry is either empty or contains an IRQ whose refcount is 0
+		 * but has not yet been freed by vgic_release_lpi_locked(). Evict the
+		 * IRQ and free it, if there is one.
+		 */
+		oldirq = __xa_store(&dist->lpi_xa, intid, irq, 0);
+		ret = xa_err(oldirq);
+		if (!ret && oldirq)
+			kfree_rcu(oldirq, rcu);
 	}
 
 	xa_unlock_irqrestore(&dist->lpi_xa, flags);
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 5a4768d8cd4f..b7f6b6c4dcf2 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -131,9 +131,19 @@ struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid)
 
 static void vgic_release_lpi_locked(struct vgic_dist *dist, struct vgic_irq *irq)
 {
+	struct vgic_irq *old;
+
 	lockdep_assert_held(&dist->lpi_xa.xa_lock);
-	__xa_erase(&dist->lpi_xa, irq->intid);
-	kfree_rcu(irq, rcu);
+
+	/*
+	 * Free the IRQ if it is still present in the xarray, as its entry could have
+	 * been overwritten after the refcount was dropped, but before the xarray lock
+	 * was acquired. If the cmpxchg fails, vgic_add_lpi() grabbed the lock first
+	 * and freed the old IRQ along the way.
+	 */
+	old = __xa_cmpxchg(&dist->lpi_xa, irq->intid, irq, NULL, 0);
+	if (old == irq)
+		kfree_rcu(irq, rcu);
 }
 
 static __must_check bool __vgic_put_irq(struct kvm *kvm, struct vgic_irq *irq)

base-commit: 1ee27dacbe5dc4def481794d899d67b0d4570094
-- 
2.51.0


