Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D450D149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmDWvCoZ7RJkt3LBlK0ytyCUy3NDKnSPU2karwJr82A=; b=SBLHoDk9ZImDQBAWxERi7ps3NN
	AoPhF4sweGWbr1C9rW09juQzhengHtcR86UdH41MLVcXE35WjJWWbBZ+xLDUja5cJv8gS65Ju+yKX
	K1wrvSt3vLyvQg2ErT1jC3EnhiT33xjMBZ6yEBiO4t/GrfZyPg6NVffSlXLtopZfo7jW5aRkph798
	82XjoBUnWl+kU1xHQe4Akb3zgSP/P8OjJoUvdDy/IS50mcGjAatYpR10V7wZzvvWncw9kJ/uig0Y5
	//rt1YFGRS97JzeAntykF+mPl4brBRlp0ItqhPdqOKqaQf07ZXOGBsbQbEPfme0dyMBeL10YwJSz3
	eauLPnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Pga-00000004u6t-2akT;
	Fri, 25 Oct 2024 19:09:24 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oyx-00000004mov-0FZ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:20 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmDWvCoZ7RJkt3LBlK0ytyCUy3NDKnSPU2karwJr82A=;
	b=GtvuLaGniKuhPHatIPMHOKL3PAWVdOsfWYvQBeWxdgjB6QLj/cIPjRdEvDn0cIc9yDDf1A
	rKRZRSmxTxvnn79TqAM6oF26UVi5MI/TijmZ9zO0fgOh6elsMGWOYxrLXD85SQVtaxiKky
	oMbONfZ6u7KfXH+L7ZHZ0HiS0vdVlP4=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v4 05/18] KVM: arm64: Describe RES0/RES1 bits of MDCR_EL2
Date: Fri, 25 Oct 2024 18:23:40 +0000
Message-ID: <20241025182354.3364124-6-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112419_282419_4B4B5E50 
X-CRM114-Status: GOOD (  11.69  )
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

Add support for sanitising MDCR_EL2 and describe the RES0/RES1 bits
according to the feature set exposed to the VM.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/nested.c           | 37 +++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 07c7d2b7b3a3..ca8fe74920d4 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -464,7 +464,6 @@ enum vcpu_sysreg {
 	/* EL2 registers */
 	SCTLR_EL2,	/* System Control Register (EL2) */
 	ACTLR_EL2,	/* Auxiliary Control Register (EL2) */
-	MDCR_EL2,	/* Monitor Debug Configuration Register (EL2) */
 	CPTR_EL2,	/* Architectural Feature Trap Register (EL2) */
 	HACR_EL2,	/* Hypervisor Auxiliary Control Register */
 	ZCR_EL2,	/* SVE Control Register (EL2) */
@@ -492,6 +491,7 @@ enum vcpu_sysreg {
 
 	/* Anything from this can be RES0/RES1 sanitised */
 	MARKER(__SANITISED_REG_START__),
+	MDCR_EL2,	/* Monitor Debug Configuration Register (EL2) */
 
 	/* Any VNCR-capable reg goes after this point */
 	MARKER(__VNCR_START__),
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index b20b3bfb9cae..d256a495a6ba 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1186,5 +1186,42 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= SCTLR_EL1_EPAN;
 	set_sysreg_masks(kvm, SCTLR_EL1, res0, res1);
 
+	/* MDCR_EL2 */
+	res0 = MDCR_EL2_RES0;
+	res1 = MDCR_EL2_RES1;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP))
+		res0 |= (MDCR_EL2_HPMN | MDCR_EL2_TPMCR |
+			 MDCR_EL2_TPM | MDCR_EL2_HPME);
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, IMP))
+		res0 |= MDCR_EL2_E2PB | MDCR_EL2_TPMS;
+	if (!kvm_has_feat(kvm, ID_AA64DFR1_EL1, SPMU, IMP))
+		res0 |= MDCR_EL2_EnSPM;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, V3P1))
+		res0 |= MDCR_EL2_HPMD;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceFilt, IMP))
+		res0 |= MDCR_EL2_TTRF;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, V3P5))
+		res0 |= MDCR_EL2_HCCD | MDCR_EL2_HLP;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
+		res0 |= MDCR_EL2_E2TB;
+	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
+		res0 |= MDCR_EL2_TDCC;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, MTPMU, IMP) ||
+	    kvm_has_feat(kvm, ID_AA64PFR0_EL1, EL3, IMP))
+		res0 |= MDCR_EL2_MTPME;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, V3P7))
+		res0 |= MDCR_EL2_HPMFZO;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSS, IMP))
+		res0 |= MDCR_EL2_PMSSE;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2))
+		res0 |= MDCR_EL2_HPMFZS;
+	if (!kvm_has_feat(kvm, ID_AA64DFR1_EL1, EBEP, IMP))
+		res0 |= MDCR_EL2_PMEE;
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DebugVer, V8P9))
+		res0 |= MDCR_EL2_EBWE;
+	if (!kvm_has_feat(kvm, ID_AA64DFR2_EL1, STEP, IMP))
+		res0 |= MDCR_EL2_EnSTEPOP;
+	set_sysreg_masks(kvm, MDCR_EL2, res0, res1);
+
 	return 0;
 }
-- 
2.47.0.163.g1226f6d8fa-goog


