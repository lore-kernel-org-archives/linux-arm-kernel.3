Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7619EE7DF1F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1ZuNuSlJDmRwvBPO6I5+v+aogwd40vvcu3+OJFHBik=; b=EHED/UIMwtG3AgUst+UJKWbZfe
	3vvgY1qmKl0foCa/Gdl3PgpQb8VzLbpRhMqGQgq4IAL5VwM1yE+BNITVmI14W/hNAZm0IFmARcqnP
	D8KS+A1Fp55goUGoEHPDOoKjp63tOPTYrh8UEt77+XURLbJtuuPpFGeMv5oe2GcheOWi3z9qeQWht
	ZqYBZVkYwUFooG2QOKpa3u6lV09HRJZxRZf/dWaHKVmJN4vmbNp6CPk429pbWSfSI1p7OkqsGk9Iq
	LZOTqDS/sFS19olN0itYA0SjI1DjgZtPTPapCafzdASF5/rJVNHrFx5Tg5mgIrjs0gtmjPpwjLbDm
	RpYHdNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyu5-00000005RW1-2lc5;
	Mon, 02 Feb 2026 18:44:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytl-00000005R3G-3R6h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3916C444D0;
	Mon,  2 Feb 2026 18:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B423C19425;
	Mon,  2 Feb 2026 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057825;
	bh=TMxnhkrxVCL7qC9tLmZfk4bV97RWnikNWDAXl5k4c8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BoZGswhj4/uh99HlT3J8YRWp5RbBDUUQulz4FmfputDyLnSnBu55kCnHtstg0Lmi7
	 CjmpdvsacxPpQyZa+qfPwOmiXVA2VGg/ggA0nUnteqmXH8IFAuoEgES1yzpbIRLcYB
	 AghmmAVkzNZHiO+yUVfZlIhWEx9tDe/AoOBMM9SByEtzXUmGRL8Rc2ixKyr3/mp8zG
	 wzduS+TNPsFxdG0nMqDUZD5jDR7DZJ20OlXwDddkzA/t+h26A1KvhG0buuSYCNL+Sj
	 BiA6E6vI5tQBUXfLhmao5aggk6UCjK2xt/jGpTUJ07AENsEU/URzUtbInJ0jE8w83h
	 pcmxiObADrmBQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmytj-00000007sAy-1T6P;
	Mon, 02 Feb 2026 18:43:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 19/20] KVM: arm64: Add sanitisation to SCTLR_EL2
Date: Mon,  2 Feb 2026 18:43:28 +0000
Message-ID: <20260202184329.2724080-20-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104345_953065_4ABD5784 
X-CRM114-Status: GOOD (  14.57  )
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

Sanitise SCTLR_EL2 the usual way. The most important aspect of
this is that we benefit from SCTLR_EL2.SPAN being RES1 when
HCR_EL2.E2H==0.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/config.c           | 82 +++++++++++++++++++++++++++++++
 arch/arm64/kvm/nested.c           |  4 ++
 3 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 20ebc1610ac84..771ef1b61f9a9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -495,7 +495,6 @@ enum vcpu_sysreg {
 	DBGVCR32_EL2,	/* Debug Vector Catch Register */
 
 	/* EL2 registers */
-	SCTLR_EL2,	/* System Control Register (EL2) */
 	ACTLR_EL2,	/* Auxiliary Control Register (EL2) */
 	CPTR_EL2,	/* Architectural Feature Trap Register (EL2) */
 	HACR_EL2,	/* Hypervisor Auxiliary Control Register */
@@ -526,6 +525,7 @@ enum vcpu_sysreg {
 
 	/* Anything from this can be RES0/RES1 sanitised */
 	MARKER(__SANITISED_REG_START__),
+	SCTLR_EL2,	/* System Control Register (EL2) */
 	TCR2_EL2,	/* Extended Translation Control Register (EL2) */
 	SCTLR2_EL2,	/* System Control Register 2 (EL2) */
 	MDCR_EL2,	/* Monitor Debug Configuration Register (EL2) */
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 8640f9c9b2e0e..d9f553cbf9dfd 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1123,6 +1123,84 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 static const DECLARE_FEAT_MAP(sctlr_el1_desc, SCTLR_EL1,
 			      sctlr_el1_feat_map, FEAT_AA64EL1);
 
+static const struct reg_bits_to_feat_map sctlr_el2_feat_map[] = {
+	NEEDS_FEAT_FLAG(SCTLR_EL2_CP15BEN,
+			RES1_WHEN_E2H0 | REQUIRES_E2H1,
+			FEAT_AA32EL0),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_ITD	|
+			SCTLR_EL2_SED,
+			RES1_WHEN_E2H1 | REQUIRES_E2H1,
+			FEAT_AA32EL0),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_BT0, REQUIRES_E2H1, FEAT_BTI),
+	NEEDS_FEAT(SCTLR_EL2_BT, FEAT_BTI),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_CMOW, REQUIRES_E2H1, FEAT_CMOW),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_TSCXT,
+			RES1_WHEN_E2H1 | REQUIRES_E2H1,
+			feat_csv2_2_csv2_1p2),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_EIS	|
+			SCTLR_EL2_EOS,
+			AS_RES1, FEAT_ExS),
+	NEEDS_FEAT(SCTLR_EL2_EnFPM, FEAT_FPMR),
+	NEEDS_FEAT(SCTLR_EL2_IESB, FEAT_IESB),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_EnALS, REQUIRES_E2H1, FEAT_LS64),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_EnAS0, REQUIRES_E2H1, FEAT_LS64_ACCDATA),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_EnASR, REQUIRES_E2H1, FEAT_LS64_V),
+	NEEDS_FEAT(SCTLR_EL2_nAA, FEAT_LSE2),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_LSMAOE	|
+			SCTLR_EL2_nTLSMD,
+			AS_RES1 | REQUIRES_E2H1, FEAT_LSMAOC),
+	NEEDS_FEAT(SCTLR_EL2_EE, FEAT_MixedEnd),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_E0E, REQUIRES_E2H1, feat_mixedendel0),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_MSCEn, REQUIRES_E2H1, FEAT_MOPS),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_ATA0	|
+			SCTLR_EL2_TCF0,
+			REQUIRES_E2H1, FEAT_MTE2),
+	NEEDS_FEAT(SCTLR_EL2_ATA	|
+		   SCTLR_EL2_TCF,
+		   FEAT_MTE2),
+	NEEDS_FEAT(SCTLR_EL2_ITFSB, feat_mte_async),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_TCSO0, REQUIRES_E2H1, FEAT_MTE_STORE_ONLY),
+	NEEDS_FEAT(SCTLR_EL2_TCSO,
+		   FEAT_MTE_STORE_ONLY),
+	NEEDS_FEAT(SCTLR_EL2_NMI	|
+		   SCTLR_EL2_SPINTMASK,
+		   FEAT_NMI),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_SPAN,	AS_RES1 | REQUIRES_E2H1, FEAT_PAN),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_EPAN, REQUIRES_E2H1, FEAT_PAN3),
+	NEEDS_FEAT(SCTLR_EL2_EnDA	|
+		   SCTLR_EL2_EnDB	|
+		   SCTLR_EL2_EnIA	|
+		   SCTLR_EL2_EnIB,
+		   feat_pauth),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_EnTP2, REQUIRES_E2H1, FEAT_SME),
+	NEEDS_FEAT(SCTLR_EL2_EnRCTX, FEAT_SPECRES),
+	NEEDS_FEAT(SCTLR_EL2_DSSBS, FEAT_SSBS),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_TIDCP, REQUIRES_E2H1, FEAT_TIDCP1),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_TWEDEL	|
+			SCTLR_EL2_TWEDEn,
+			REQUIRES_E2H1, FEAT_TWED),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_nTWE	|
+			SCTLR_EL2_nTWI,
+			AS_RES1 | REQUIRES_E2H1, FEAT_AA64EL2),
+	NEEDS_FEAT_FLAG(SCTLR_EL2_UCI	|
+			SCTLR_EL2_UCT	|
+			SCTLR_EL2_DZE	|
+			SCTLR_EL2_SA0,
+			REQUIRES_E2H1, FEAT_AA64EL2),
+	NEEDS_FEAT(SCTLR_EL2_WXN	|
+		   SCTLR_EL2_I		|
+		   SCTLR_EL2_SA		|
+		   SCTLR_EL2_C		|
+		   SCTLR_EL2_A		|
+		   SCTLR_EL2_M,
+		   FEAT_AA64EL2),
+	FORCE_RES0(SCTLR_EL2_RES0),
+	FORCE_RES1(SCTLR_EL2_RES1),
+};
+
+static const DECLARE_FEAT_MAP(sctlr_el2_desc, SCTLR_EL2,
+			      sctlr_el2_feat_map, FEAT_AA64EL2);
+
 static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
 	NEEDS_FEAT(MDCR_EL2_EBWE, FEAT_Debugv8p9),
 	NEEDS_FEAT(MDCR_EL2_TDOSA, FEAT_DoubleLock),
@@ -1247,6 +1325,7 @@ void __init check_feature_map(void)
 	check_reg_desc(&sctlr2_desc);
 	check_reg_desc(&tcr2_el2_desc);
 	check_reg_desc(&sctlr_el1_desc);
+	check_reg_desc(&sctlr_el2_desc);
 	check_reg_desc(&mdcr_el2_desc);
 	check_reg_desc(&vtcr_el2_desc);
 }
@@ -1443,6 +1522,9 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 	case SCTLR_EL1:
 		resx = compute_reg_resx_bits(kvm, &sctlr_el1_desc, 0, 0);
 		break;
+	case SCTLR_EL2:
+		resx = compute_reg_resx_bits(kvm, &sctlr_el2_desc, 0, 0);
+		break;
 	case MDCR_EL2:
 		resx = compute_reg_resx_bits(kvm, &mdcr_el2_desc, 0, 0);
 		break;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 96e899dbd9192..ed710228484f3 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1766,6 +1766,10 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	resx = get_reg_fixed_bits(kvm, SCTLR_EL1);
 	set_sysreg_masks(kvm, SCTLR_EL1, resx);
 
+	/* SCTLR_EL2 */
+	resx = get_reg_fixed_bits(kvm, SCTLR_EL2);
+	set_sysreg_masks(kvm, SCTLR_EL2, resx);
+
 	/* SCTLR2_ELx */
 	resx = get_reg_fixed_bits(kvm, SCTLR2_EL1);
 	set_sysreg_masks(kvm, SCTLR2_EL1, resx);
-- 
2.47.3


