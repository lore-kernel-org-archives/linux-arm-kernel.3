Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F54FCF8860
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvsnOCyzN4LpczEh4//zPJYkbcLLNoJ6YTsG55obw4U=; b=UsMt1FzPzUGAhUjn3VxfsUrnwS
	4DQUFdcPe7ZEuArnyv7BylDBg18izZiPdYaR8kEupC3x0lRwiww2HXsPh2W1BtN/u+CO9a+83f4OQ
	8CBEY8SIziv4YpEjZbpIKC2U9SwK/BfZoaiGThVoNCBzs2ZdqpALvwD00DsmSCeTYdKMPBdFwQmJp
	ZXm8gEvExzT7vUAmrLMSQZXw6Mvu3KnajjnGYf1wsDitti93NnpODhjda5YoR6Sw9MuOIbp7vc+8n
	dHduHn4nH6KuTiQFX/4frtH+Tb8iuA5MPO03GuL1129cTnCEsZmxELDFA0CXYVuXOJePXrP3wVCf1
	Yl+msHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4lr-00000006jW3-24p9;
	Thu, 20 Nov 2025 13:32:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4lp-00000006jUI-0v4E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E9B9443BA;
	Thu, 20 Nov 2025 13:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2ACC113D0;
	Thu, 20 Nov 2025 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645540;
	bh=wlKEE5GiVsbHV+gUnHjwyZRW7fH0p33E9YQIzRx9NlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wyxl4vDfAT0G8/LxgrZQ7tG4LrFLc0D54CBGU+1wS5g78GSsQzxkwcYmDoVqx8YfJ
	 9cnC/M5k/hXFt1wz+WmYCd+aGr5NFGKRav2ebLMnXfdFR71hhxP7ek/fELzYFalGzm
	 CLLcKLZ1qeg0LZ3SCJMmXQRl7uo+z+Wb/NmbxecWYwdNf2G8ufXpcXcWu5eFLna03W
	 77LCDi3aL7st132vInX9xQWCsEHt5rIsJZlRCa7EjjAOUMBBOiMwkFrt0WtZiKjdPl
	 PwOQ9MRL++gADNhykU+Av5PWUnvqBSJ8RfPIpC0Z3GF+n4Df1u1OiUCPGyvM+hesCL
	 PfDGup1vyZPrA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM4ll-00000006tUG-45LY;
	Thu, 20 Nov 2025 13:32:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/5] KVM: arm64: Add routing/handling for GMID_EL1
Date: Thu, 20 Nov 2025 13:31:58 +0000
Message-ID: <20251120133202.2037803-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120133202.2037803-1-maz@kernel.org>
References: <20251120133202.2037803-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_053221_297218_1F9AFB56 
X-CRM114-Status: GOOD (  12.14  )
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

HCR_EL2.TID5 is currently ignored by the trap routing infrastructure,
and we currently don't handle GMID_EL1 either (the only register trapped
by TID5).

Wire both the trap bit and a default UNDEF handler.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 8 ++++++++
 arch/arm64/kvm/sys_regs.c       | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 834f13fb1fb7d..616eb6ad68701 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -70,6 +70,7 @@ enum cgt_group_id {
 	CGT_HCR_ENSCXT,
 	CGT_HCR_TTLBIS,
 	CGT_HCR_TTLBOS,
+	CGT_HCR_TID5,
 
 	CGT_MDCR_TPMCR,
 	CGT_MDCR_TPM,
@@ -308,6 +309,12 @@ static const struct trap_bits coarse_trap_bits[] = {
 		.mask		= HCR_TTLBOS,
 		.behaviour	= BEHAVE_FORWARD_RW,
 	},
+	[CGT_HCR_TID5] = {
+		.index		= HCR_EL2,
+		.value		= HCR_TID5,
+		.mask		= HCR_TID5,
+		.behaviour	= BEHAVE_FORWARD_RW,
+	},
 	[CGT_MDCR_TPMCR] = {
 		.index		= MDCR_EL2,
 		.value		= MDCR_EL2_TPMCR,
@@ -665,6 +672,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_CCSIDR2_EL1,	CGT_HCR_TID2_TID4),
 	SR_TRAP(SYS_CLIDR_EL1,		CGT_HCR_TID2_TID4),
 	SR_TRAP(SYS_CSSELR_EL1,		CGT_HCR_TID2_TID4),
+	SR_TRAP(SYS_GMID_EL1,		CGT_HCR_TID5),
 	SR_RANGE_TRAP(SYS_ID_PFR0_EL1,
 		      sys_reg(3, 0, 0, 7, 7), CGT_HCR_TID3),
 	SR_TRAP(SYS_ICC_SGI0R_EL1,	CGT_HCR_IMO_FMO_ICH_HCR_TC),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e67eb39ddc118..84e6f04220589 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3397,6 +3397,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
 	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
+	{ SYS_DESC(SYS_GMID_EL1), undef_access },
 	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
 	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
-- 
2.47.3


