Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA382C5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmVFCcINo8dSBhPa7d8TGtMF2u5YqyQvFzNhxp21aEQ=; b=zjBfux/QJydIRdBAKIQcicjkJn
	zqE1u1Buti+XTKItuVXyAnK+JX7QxZMDb1a+90I8lJBnve3ipDUwYr9SVPQ8Y9kA0rMuzG4Kq/eGY
	k9we4tRmjlc/Zc9ESwNUM89QZyLzxIyusc415IKa9bYv/JOu+JOCcTQA+SjWFqJtriYYwX4Dp7gPM
	WtklHYJ4SWqh/foKzcsWU8MhWHH0bywKX9xG1nTEkSC8LPkLtk6BsjcraH/VZmGY338fZ+5oQ/kTX
	S8Q4l7R08ClA09DLEX9NPyx/iNjoocJLe6mBLNMuzepm2iaFnojS63SuwvdrbeoMV3rUNVEJ0flOC
	g5hj/tKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIzv-0000000CeNO-3XYb;
	Fri, 21 Aug 2026 06:45:03 +0000
Received: from out-47.mta1.migadu.com ([2001:41d0:203:375::2f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIzp-0000000CeKh-2lHX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 06:45:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ANW+Z5vBE34Npmai57MGv7FNNjJXI8weYqTeGPekhFI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787294695; v=1; x=1787899495;
 b=e3LMqpyhwn8hLPEW2CRjzoMPiPCKdlQGKZIfdNzp+czCqa6tfs+R4U+PDu5r3R+T4FPKRB9b
 sNItbJQS669zUBtfjJ02LTbJJ3lghTR/CIZJc9m1f8ivru0on1x3S4WD35N6sSKl1LOTDagFA5I
 saYBJyHFsFcwA3echh2hKrBk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 9de2999b3da40509;
	Fri, 21 Aug 2026 06:44:55 +0000
X-Mizu-Trace-ID: 9de2999b3da40509
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] KVM: arm64: vgic-its: Free the caches when GITS_BASER changes
Date: Fri, 21 Aug 2026 07:44:42 +0100
Message-Id: <20260821064445.615838-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260821064445.615838-1-fuad.tabba@linux.dev>
References: <20260821064445.615838-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_234457_836818_1A184898 
X-CRM114-Status: GOOD (  15.64  )
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

A guest that disables the ITS and re-points or shrinks GITS_BASER<n>
with VALID still set keeps the devices and collections it mapped
against the old table, as KVM frees them only when VALID is cleared.
The contents of the table are IMPLEMENTATION DEFINED, so a write that
gives GITS_BASER<n> a different address or size may lose whatever the
old value described. Free the list whenever the stored value changes,
and drop the translation cache with it.

The cache is not empty just because the ITS is disabled: its->enabled
is written under the cmd_lock, while vgic_its_resolve_lpi() tests it
under the its_lock, so an injection can still cache an entry after the
ITS was disabled. Hence the invalidation inside the its_lock section.

Test for a change rather than a write: its_restore_enable() rewrites
GITS_BASER<n> from its probe-time cache on resume, and KVM reports
GITS_TYPER.HCC as 0, so nothing re-maps the boot CPU's collection
afterwards.

Fixes: 36d6961c2b481 ("KVM: arm/arm64: vgic-its: Free caches when GITS_BASER Valid bit is cleared")
Suggested-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/all/87ecg9owwa.wl-maz@kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index f6538b1976f9b..d5ede640812c4 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1649,7 +1649,7 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
 				      unsigned long val)
 {
 	const struct vgic_its_abi *abi = vgic_its_get_abi(its);
-	u64 entry_size, table_type;
+	u64 old, entry_size, table_type;
 	u64 reg, *regptr, clearbits = 0;
 
 	/* When GITS_CTLR.Enable is 1, we ignore write accesses. */
@@ -1672,7 +1672,9 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
 		return;
 	}
 
-	reg = update_64bit_reg(*regptr, addr & 7, len, val);
+	old = *regptr;
+
+	reg = update_64bit_reg(old, addr & 7, len, val);
 	reg &= ~GITS_BASER_RO_MASK;
 	reg &= ~clearbits;
 
@@ -1682,7 +1684,8 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
 
 	*regptr = reg;
 
-	if (!(reg & GITS_BASER_VALID)) {
+	/* The ITS driver rewrites an unchanged GITS_BASER<n> on resume. */
+	if (reg != old) {
 		/* Take the its_lock to prevent a race with a save/restore */
 		mutex_lock(&its->its_lock);
 		switch (table_type) {
@@ -1693,6 +1696,8 @@ static void vgic_mmio_write_its_baser(struct kvm *kvm,
 			vgic_its_free_collection_list(kvm, its);
 			break;
 		}
+		/* A concurrent injection may have cached a translation. */
+		vgic_its_invalidate_cache(its);
 		mutex_unlock(&its->its_lock);
 	}
 }
-- 
2.39.5


