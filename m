Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F3C55175
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW7bs2MRC4TfK11mM/JgOqcRFeZlE0gDd8izLcP9xkk=; b=JfKO8ILLve4D0HIgYQafBdDEx3
	2SHvbCn2ljs0/jynDAeTk8gMnvjow45cZR2dueQU4SaOfAfKDTvdcdC1McXIR9G9hQ8M4ck90c0ZE
	UmPgOiPjXOcywrYJJYCzjKdcRr1Ey2G3KDv1Bb9bRyHY/ZepIPTaEzLWZAJMjKMvIhfOyG6Fj1nd5
	BcYXrV/VzUkJRO5c8UG1wz8Vk2WyXGbe1LIdg+KWMWJ8fuAHu0HPRTmwsMcVDV2pVvBHVEFktkA7n
	6H+8REWKdJztEbk/MIoOl7+bdEBA78ifZiJ+GGU2xBaCFrOvnDNrJm4BGggL0Xxa2K/nRoMSX4YIU
	n5PcKpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98u-0000000EfD5-2TH3;
	Sat, 01 Aug 2026 12:48:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98s-0000000EfAc-3hSb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:48:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD1164395C;
	Sat,  1 Aug 2026 12:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B8F1F00ADE;
	Sat,  1 Aug 2026 12:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785588521;
	bh=ZW7bs2MRC4TfK11mM/JgOqcRFeZlE0gDd8izLcP9xkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BIbo0MPDkPAbmtJvVBqKyT2bKAiQ6J/t3w7bXroAsz+2DDH4O97lEdkARcrSH/tIm
	 T1+WCDsWPsOOx7MBhTRcA56JeKDcnSJyIpR4qfQ/UuM9nxzbG+FsOzQJFwFY0gB2Qe
	 3fGqoQYa095QOMLGM6udYV3a/claO6ZdhI1+2jo7egTMKyacGLKEkK2xIKDZgGbA0W
	 1LQTYf7MtgH6DYSoBbDSGIDYAqU/o+plSIRnizxM0IUd3XIx6+Ky0sR+hnIKVczI02
	 iLEOav5xah377aVT06A8S9hA0EKzTD8fLxhc8UR1T49AUQOh0fhb8ZX60Bxy6igqPb
	 cbNI7GygG+Eeg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wq98p-0000000BGK2-3fvn;
	Sat, 01 Aug 2026 12:48:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/6] KVM: arm64: Consider SCTLR_EL2.M when mapping the L1 VNCR page
Date: Sat,  1 Aug 2026 13:48:15 +0100
Message-ID: <20260801124818.366274-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801124818.366274-1-maz@kernel.org>
References: <20260801124818.366274-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, imv4bel@gmail.com, stable@vger.kernel.org
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

We record a VNCR TLB even when SCTLR_EL2.M is 0 in order to make
our life easier. But this is not something that the architecture
anticipate.

As a consequence, a hypervisor is free to set VNCR_EL2 to
some PA when SCTLR_EL2.M==0, use it to run a guest which indirectly
accesses the VNCR page, then eventually set SCTLR_EL2.M==1 with
the same VA. Yes, this is odd, but apparently legal.

A common trick in HW is to invalidate the TLBs on SCTLR_ELx.M being
flipped. But doing this is a not a good idea for us (we'd need to
trap SCTLR accesses), and wouldn't scale as we nest deeper.

Instead, use the fact that the S1 MMU being off at the point of
translation is cached in our TLB, and simply ignore it if it
doesn't match the current MMU state.

Fixes: 2a359e072596f ("KVM: arm64: nv: Handle mapping of VNCR_EL2 at EL2")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/kvm_nested.h | 7 +++++++
 arch/arm64/kvm/at.c                 | 2 --
 arch/arm64/kvm/nested.c             | 3 +++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 012d711034d17..cc48817a5bf7a 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -388,6 +388,8 @@ struct s1_walk_result {
 	bool	failed;
 };
 
+#define S1_MMU_DISABLED		(-127)
+
 static inline void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
 {
 	wr->fst		= fst;
@@ -396,6 +398,11 @@ static inline void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
 	wr->failed	= true;
 }
 
+static inline bool s1_mmu_disabled(struct s1_walk_result *wr)
+{
+	return wr->level == S1_MMU_DISABLED;
+}
+
 int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 		       struct s1_walk_result *wr, u64 va);
 int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa,
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 640f2dc00a8ba..0926426b87989 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -11,8 +11,6 @@
 #include <asm/kvm_mmu.h>
 #include <asm/lsui.h>
 
-#define S1_MMU_DISABLED		(-127)
-
 static int get_ia_size(struct s1_walk_info *wi)
 {
 	return 64 - wi->txsz;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 035cda256e2a5..d7dba02dc84fe 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1578,6 +1578,9 @@ static void kvm_map_l1_vncr(struct kvm_vcpu *vcpu)
 	if (!vt->valid)
 		return;
 
+	if (!(vcpu_read_sys_reg(vcpu, SCTLR_EL2) & SCTLR_ELx_M) != s1_mmu_disabled(&vt->wr))
+		return;
+
 	if (read_vncr_el2(vcpu) != vt->gva)
 		return;
 
-- 
2.47.3


