Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A82D149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wt7hpGsUlZRR1MZ3fpe3CXoXzKibMI0SDo4lB5jVPg=; b=M6m0h2EKI4RoSCYmalq8Qpw0Uh
	wSYmJWC1FlsxqD0hSgGwfqILfxmSJ/GlXtSnDU9Lfc6RJpgvm6ND+Bky4eDuocFyXzwYIZWYiW16a
	tmGafqfSZ2NrNsAPawE2W5IHhbtPaEjnIn8A4Fu8vMlq6PUB9Kslf3zwvSN5vNg2iz8vmTN4p5rG7
	8dapPEjOmriq/7hIVTDr0Ckckex9hxZfhIhePLMirXmyoeg9uE0t6vN7aTJyfaQJOBygm1kWdLUX7
	i5ZFxhfn8to3bADlOSoSX4O11k9tM3eZqXR7iC1QA10xzA05wAlFoyV8/ulr8oHDUFJpgjApTlIHI
	80IXvDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PdU-00000004tYM-3Rvl;
	Fri, 25 Oct 2024 19:06:12 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oyt-00000004mnS-1Eu1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4wt7hpGsUlZRR1MZ3fpe3CXoXzKibMI0SDo4lB5jVPg=;
	b=E0L114QLgltFCgRG6Xy5/Zqz8lHJUkqPukCPSaQz59FYFykUgrTSG+jR7y81Sq2JXIQ2hK
	9f92rYIW3JKXdu53D86AsxWmCXRTNx3pdgWPKb7qPdoI0FDpWWIn9ncUtRs6n+7slEc0rD
	6daq2Kplo1Zu1mSaJPSq2foCC2x4WDI=
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
Subject: [PATCH v4 03/18] arm64: sysreg: Migrate MDCR_EL2 definition to table
Date: Fri, 25 Oct 2024 18:23:38 +0000
Message-ID: <20241025182354.3364124-4-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112415_504909_91E94AF3 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
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

Migrate MDCR_EL2 over to the sysreg table and align definitions with
DDI0601 2024-09.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/kvm_arm.h | 29 --------------------------
 arch/arm64/tools/sysreg          | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 109a85ee6910..fb8d15f299a4 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -311,35 +311,6 @@
 				 GENMASK(19, 18) |	\
 				 GENMASK(15, 0))
 
-/* Hyp Debug Configuration Register bits */
-#define MDCR_EL2_E2TB_MASK	(UL(0x3))
-#define MDCR_EL2_E2TB_SHIFT	(UL(24))
-#define MDCR_EL2_HPMFZS		(UL(1) << 36)
-#define MDCR_EL2_HPMFZO		(UL(1) << 29)
-#define MDCR_EL2_MTPME		(UL(1) << 28)
-#define MDCR_EL2_TDCC		(UL(1) << 27)
-#define MDCR_EL2_HLP		(UL(1) << 26)
-#define MDCR_EL2_HCCD		(UL(1) << 23)
-#define MDCR_EL2_TTRF		(UL(1) << 19)
-#define MDCR_EL2_HPMD		(UL(1) << 17)
-#define MDCR_EL2_TPMS		(UL(1) << 14)
-#define MDCR_EL2_E2PB_MASK	(UL(0x3))
-#define MDCR_EL2_E2PB_SHIFT	(UL(12))
-#define MDCR_EL2_TDRA		(UL(1) << 11)
-#define MDCR_EL2_TDOSA		(UL(1) << 10)
-#define MDCR_EL2_TDA		(UL(1) << 9)
-#define MDCR_EL2_TDE		(UL(1) << 8)
-#define MDCR_EL2_HPME		(UL(1) << 7)
-#define MDCR_EL2_TPM		(UL(1) << 6)
-#define MDCR_EL2_TPMCR		(UL(1) << 5)
-#define MDCR_EL2_HPMN_MASK	(UL(0x1F))
-#define MDCR_EL2_RES0		(GENMASK(63, 37) |	\
-				 GENMASK(35, 30) |	\
-				 GENMASK(25, 24) |	\
-				 GENMASK(22, 20) |	\
-				 BIT(18) |		\
-				 GENMASK(16, 15))
-
 /*
  * FGT register definitions
  *
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 5670e51a6f90..7061cf2d8444 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2414,6 +2414,41 @@ Field	1	AFSR1_EL1
 Field	0	AFSR0_EL1
 EndSysregFields
 
+Sysreg MDCR_EL2		3	4	1	1	1
+Res0	63:51
+Field	50	EnSTEPOP
+Res0	49:44
+Field	43	EBWE
+Res0	42
+Field	41:40	PMEE
+Res0	39:37
+Field	36	HPMFZS
+Res0	35:32
+Field	31:30	PMSSE
+Field	29	HPMFZO
+Field	28	MTPME
+Field	27	TDCC
+Field	26	HLP
+Field	25:24	E2TB
+Field	23	HCCD
+Res0	22:20
+Field	19	TTRF
+Res0	18
+Field	17	HPMD
+Res0	16
+Field	15	EnSPM
+Field	14	TPMS
+Field	13:12	E2PB
+Field	11	TDRA
+Field	10	TDOSA
+Field	9	TDA
+Field	8	TDE
+Field	7	HPME
+Field	6	TPM
+Field	5	TPMCR
+Field	4:0	HPMN
+EndSysreg
+
 Sysreg HFGRTR_EL2	3	4	1	1	4
 Fields	HFGxTR_EL2
 EndSysreg
-- 
2.47.0.163.g1226f6d8fa-goog


