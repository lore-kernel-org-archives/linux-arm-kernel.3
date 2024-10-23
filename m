Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DF9CF539E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDaqYptTq/HIYorfbUalGFyBuO2O9ev/Tsflb1EHGL0=; b=JiTTTPDXSUAR94Vqhdr0eDktRg
	JDv8qvTGFhsYmk390hvscQ9JJjp5br80Or6ICFL1t2rWTJBVRI+7bvGvN0gW5dT5ab5BZqn7DEoVC
	tpAy6mVtrILPFPyMZ7Wie1RSg2AeRJjZLpWvUMIZ/2vDGLEQQkqPh99+bYeXvB0kz3I32n/U1r3bT
	9T5e/NL4yDem0Ynf5NmAeB0eOpWYE2cknlQ4mzahoUUZExanv2TKFpc0AnoAUU1X3RTkuNQef6WrY
	2zEjYoK2Thud8vSgyid14J0dmFvnw+sThntmlTlHzHjXm8/Y+N3+tJoZWMzU65Zy590uFBbCXx7mm
	EORwEDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dFx-0000000ExHT-0dDV;
	Wed, 23 Oct 2024 15:26:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckN-0000000EpQD-3qXh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HDaqYptTq/HIYorfbUalGFyBuO2O9ev/Tsflb1EHGL0=; b=f3wavUYAhPGI6wwYF13uLMzOGW
	JrXiica4ybt8G2+uXJ/9obk5fuCr4eMcWL5OvMnD2E9HhzhkORWaDRUpBnd8PPQez3AVR2wlnFaBh
	YuRCUgXAZMuh7ADY9x6Qyq2P7LaPoADOqU5kifMTgINecXirdx5Fd9pilO0IgB/iRm0s8J8UYfebu
	d1Aw58UXpmcVfqA4Khq5l4j4Ci9S9L4Ra5Fdy2jGBHZC9pKYNGCVbxxfzi/Nxiv+ishAlnShTjCnB
	RCef/PmhnnzBVKxTgzDIGA/DcajCBuzhgC18Bshne6iWn/5rA0s8PDvgP/rBRi1/zRr+EX+vf0jIl
	ckIrbH/Q==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckJ-00000008Qc2-1000
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D11FEA4501A;
	Wed, 23 Oct 2024 14:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EA2C4CEE8;
	Wed, 23 Oct 2024 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695234;
	bh=iEUI3OefKCYJFOSoEjBNdqE75OBAN4/6dLCG/GX/j98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=buAYQNXrCKLIAniXatriI9shEhovLxcIunYqkjYdAO4TQ+z4lS+RLUCeklqUvF5HC
	 DxkwGBx74vvu7mxF3KOsx+PXOR0qCm+3pVvTCgjChcnaDnJP2+CrRzWjaa12W9sun1
	 VjJOh4+zhQ5yERrX83eZld3HvcumBe/h9NXAWJQcFWKZv/rZZG5kxVvR/h9yipoRma
	 ppEosL4M+ShTtLYD/emgFkBOJnjOtwMpoKkd6y0t/PJ8824cFq58mB/mMucKoIhMvg
	 CJyia2OcJR03DsGP/9Na715TH2IZQ0XfSkmosKqO7jAvEFLdCdb021J1zLQMZOUcrd
	 b50lgrQye4+2A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckD-0068vz-75;
	Wed, 23 Oct 2024 15:53:53 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 18/37] KVM: arm64: Add AT fast-path support for S1PIE
Date: Wed, 23 Oct 2024 15:53:26 +0100
Message-Id: <20241023145345.1613824-19-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_155359_613870_9376F0D3 
X-CRM114-Status: GOOD (  11.37  )
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

Emulating AT using AT instructions requires that the live state
matches the translation regime the AT instruction targets.

If targeting the EL1&0 translation regime and that S1PIE is
supported, we also need to restore that state (covering TCR2_EL1,
PIR_EL1, and PIRE0_EL1).

Add the required system register switcheroo.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index f04677127fbc0..b9d0992e91972 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -412,6 +412,9 @@ struct mmu_config {
 	u64	ttbr1;
 	u64	tcr;
 	u64	mair;
+	u64	tcr2;
+	u64	pir;
+	u64	pire0;
 	u64	sctlr;
 	u64	vttbr;
 	u64	vtcr;
@@ -424,6 +427,13 @@ static void __mmu_config_save(struct mmu_config *config)
 	config->ttbr1	= read_sysreg_el1(SYS_TTBR1);
 	config->tcr	= read_sysreg_el1(SYS_TCR);
 	config->mair	= read_sysreg_el1(SYS_MAIR);
+	if (cpus_have_final_cap(ARM64_HAS_TCR2)) {
+		config->tcr2	= read_sysreg_el1(SYS_TCR2);
+		if (cpus_have_final_cap(ARM64_HAS_S1PIE)) {
+			config->pir	= read_sysreg_el1(SYS_PIR);
+			config->pire0	= read_sysreg_el1(SYS_PIRE0);
+		}
+	}
 	config->sctlr	= read_sysreg_el1(SYS_SCTLR);
 	config->vttbr	= read_sysreg(vttbr_el2);
 	config->vtcr	= read_sysreg(vtcr_el2);
@@ -444,6 +454,13 @@ static void __mmu_config_restore(struct mmu_config *config)
 	write_sysreg_el1(config->ttbr1,	SYS_TTBR1);
 	write_sysreg_el1(config->tcr,	SYS_TCR);
 	write_sysreg_el1(config->mair,	SYS_MAIR);
+	if (cpus_have_final_cap(ARM64_HAS_TCR2)) {
+		write_sysreg_el1(config->tcr2, SYS_TCR2);
+		if (cpus_have_final_cap(ARM64_HAS_S1PIE)) {
+			write_sysreg_el1(config->pir, SYS_PIR);
+			write_sysreg_el1(config->pire0, SYS_PIRE0);
+		}
+	}
 	write_sysreg_el1(config->sctlr,	SYS_SCTLR);
 	write_sysreg(config->vttbr,	vttbr_el2);
 	write_sysreg(config->vtcr,	vtcr_el2);
@@ -914,6 +931,13 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TTBR1_EL1),	SYS_TTBR1);
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR_EL1),	SYS_TCR);
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
+	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, TCRX, IMP)) {
+		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
+		if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1PIE, IMP)) {
+			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
+			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
+		}
+	}
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, SCTLR_EL1),	SYS_SCTLR);
 	__load_stage2(mmu, mmu->arch);
 
-- 
2.39.2


