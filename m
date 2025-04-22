Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18F9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sCEWE5YUz48Gq8A0R275di6hd8QgsKHgWA1LMwEVN8=; b=yetxC/pS6nZu6LVfQY5Sb7vnTp
	NWNbv987KJZP1VyHecUThr8WY8921xS5QQM2Y6Y06T/i32eu6X15lji4NjgJWD9ILV5cwtMafiP8s
	nxL9rYsdqQIyTMWecyrOUKq3niuZThagcDZ+OZ9XpMCBk3Zrym0MXIvDayy890EP6oLSTzYcQFdNE
	kfbYorsRj42pMk/DiE8ba+1NkXRgIdiKk3gs6k+dEBXNpCbDihhaCMWozPTyPn8FvJjAL2bbkq85E
	aQh79Xv8vfGL4xta7l4fZT33qQAbathjg0wfHU41gL7FIzFITyzjTo2ds7quYXQd3yfKZsvE5+A+E
	vLDw9uag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DtO-00000007Lax-3a8Z;
	Tue, 22 Apr 2025 13:42:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Chr-0000000766e-0Kg6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CAAC61362;
	Tue, 22 Apr 2025 12:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0324C4CEF0;
	Tue, 22 Apr 2025 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324788;
	bh=GGji4VafCMD/lBXJA7bDwwGW/DF92Exp7RIZh0PkNss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZaHbAp5G2WiEZ+SHVfoAsnjnw+jihwof/Eb0h3ImSXj7YZpz3FGM7ISSjSV3jxxQ3
	 LnhTsKzDihTY2wFsgC5/VJwGVfcjJVmhkhLJYPkd3NRJzeisb59YM/uPU5xjkQsKzX
	 mkRAM7reWTAUsajPMduija7pZ2DNwrJ1PEIspg/Lm1RdxdgqXaZokd2ZT+F68wfn/p
	 +L0uM3UiIMG4XpEr8lblQRwq/V58OAcLbzQMni2NKs6S/VqVpNRbnRMuSmaba2GE2H
	 GCmE1/PXzu5kJJvixsXHr/94fkbxRiJ7LDQA6zpP5FL05wXDqk+bbjEm+DFkxtllNr
	 2w6q+Hot8JiLw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7Chm-007c9q-Aa;
	Tue, 22 Apr 2025 13:26:26 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	D Scott Phillips <scott@os.amperecomputing.com>
Subject: [PATCH 3/3] KVM: arm64: Don't feed uninitialised data to HCR_EL2
Date: Tue, 22 Apr 2025 13:26:12 +0100
Message-Id: <20250422122612.2675672-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250422122612.2675672-1-maz@kernel.org>
References: <20250422122612.2675672-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, scott@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

When the guest executes an AT S1E{0,1} from EL2, and that its
HCR_EL2.{E2H,TGE}=={1,1}, then this is a pure S1 translation
that doesn't involve a guest-supplied S2, and the full S1
context is already in place. This allows us to take a shortcut
and avoid save/restoring a bunch of registers.

However, we set HCR_EL2 to a value suitable for the use of AT
in guest context. And we do so by using the value that we saved.
Or not. In the case described above, we restore whatever junk
was on the stack, and carry on with it until the next entry.

Needless to say, this is completely broken.

But this also triggers the realisation that saving HCR_EL2 is
a bit pointless. We are always in host context at the point where
reach this code, and what we program to enter the guest is a known
value (vcpu->arch.hcr_el2).

Drop the pointless save/restore, and wrap the AT operations with
writes that switch between guest and host values for HCR_EL2.

Reported-by: D Scott Phillips <scott@os.amperecomputing.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index c40583edebc4f..7a5267f43b51f 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -492,7 +492,6 @@ struct mmu_config {
 	u64	sctlr;
 	u64	vttbr;
 	u64	vtcr;
-	u64	hcr;
 };
 
 static void __mmu_config_save(struct mmu_config *config)
@@ -515,13 +514,10 @@ static void __mmu_config_save(struct mmu_config *config)
 	config->sctlr	= read_sysreg_el1(SYS_SCTLR);
 	config->vttbr	= read_sysreg(vttbr_el2);
 	config->vtcr	= read_sysreg(vtcr_el2);
-	config->hcr	= read_sysreg(hcr_el2);
 }
 
 static void __mmu_config_restore(struct mmu_config *config)
 {
-	write_sysreg(config->hcr,	hcr_el2);
-
 	/*
 	 * ARM errata 1165522 and 1530923 require TGE to be 1 before
 	 * we update the guest state.
@@ -1271,8 +1267,8 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	__load_stage2(mmu, mmu->arch);
 
 skip_mmu_switch:
-	/* Clear TGE, enable S2 translation, we're rolling */
-	write_sysreg((config.hcr & ~HCR_TGE) | HCR_VM,	hcr_el2);
+	/* Temporarily switch back to guest context */
+	write_sysreg(vcpu->arch.hcr_el2, hcr_el2);
 	isb();
 
 	switch (op) {
@@ -1304,6 +1300,8 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	if (!fail)
 		par = read_sysreg_par();
 
+	write_sysreg(HCR_HOST_VHE_FLAGS, hcr_el2);
+
 	if (!(vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)))
 		__mmu_config_restore(&config);
 
-- 
2.39.2


