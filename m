Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA5AC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/swx3LGqK3zylPhLSB8zekv9Y7WyYK6xowxUquS2k5E=; b=lHdyY65XmZd7DpWW5EwbQ4kwok
	srX7llQ+MlB7KJu0MB76a7dZ0ZFhevjMMobEDKCL0PEDzey8zp1e0u7CO3mQihvzfaTMDSp/nPU0P
	hUjXhr7G1Fp7iTw4YO1wP0fbmEJtj6mzBlBFzsmv6098nBprRDm9TLhnQGR0UsmrYcR4VKGwUlbph
	UDKWo7z2U7DsrS0TiK9qeO7sezFu3sRGC47X/MKSlPrgrKOvF5o2H8Je1ODDhjdPOLA23jHzlA6NP
	sbH9DjoctFOOFHxLMr2BJFr5fcUN8KfzdXPgOwhYpLO9Txx5WPYrpM8l43kh0jfqGBwc102tChyyu
	1e3RW5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Jsd-0000000CZtA-03J6;
	Thu, 17 Sep 2026 21:42:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JsV-0000000CZpY-3i9q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:42:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DB451476;
	Thu, 17 Sep 2026 14:42:43 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE9D73F7B4;
	Thu, 17 Sep 2026 14:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789681367; bh=JBtsMsEWMNLNADwgEQVSFvPtiXOMRzZv66KQLvRb/3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RGMe4ec0GnMldFTCsRadt9jQTsoquZh1dSTBA5mHUebCdNDTIgVjxhP95G7609gFW
	 NVunWx1akWr5N7Qv+HgMo02/WBKEsoI9/yR/1lHW9IQG/FIBhl93qNp3hbUfElbku4
	 kgW+8sGXgFxTHOad2HE1iuYY2LuZ8EwHl2zrLCZw=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	James Clark <james.clark@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 2/4] arm64: sysreg: Add TCR_EL2 to sysreg infrastructure
Date: Thu, 17 Sep 2026 22:42:12 +0100
Message-ID: <20260917214215.74135-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917214215.74135-1-weilin.chang@arm.com>
References: <20260917214215.74135-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_144248_050608_EC056FFC 
X-CRM114-Status: GOOD (  10.64  )
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

Convert TCR_EL2 to the sysreg infrastructure with data extracted from
Registers.json of the BSD licenced AARCHMRS
(AARCHMRS_OPENSOURCE_A_profile_FAT-2026-06).

There are two formats of TCR_EL2 based on whether the effective value of
HCR_EL2.E2H is 0 or 1. For the E2H == 1 case, prefix the macros with
"VHE_". For the E2H == 0 case, the macros are left unprefixed.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_arm.h |  13 ----
 arch/arm64/include/asm/sysreg.h  |   1 -
 arch/arm64/tools/sysreg          | 125 +++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 4bfbd827c5aa..690c13d0b068 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -108,19 +108,6 @@
 #define MPAMHCR_HOST_FLAGS	0
 
 /* TCR_EL2 Registers bits */
-#define TCR_EL2_DS		(1UL << 32)
-#define TCR_EL2_RES1		((1U << 31) | (1 << 23))
-#define TCR_EL2_HPD		(1 << 24)
-#define TCR_EL2_HA		(1 << 21)
-#define TCR_EL2_TBI		(1 << 20)
-#define TCR_EL2_PS_SHIFT	16
-#define TCR_EL2_PS_MASK		(7 << TCR_EL2_PS_SHIFT)
-#define TCR_EL2_PS_40B		(2 << TCR_EL2_PS_SHIFT)
-#define TCR_EL2_TG0_MASK	TCR_TG0_MASK
-#define TCR_EL2_SH0_MASK	TCR_SH0_MASK
-#define TCR_EL2_ORGN0_MASK	TCR_ORGN0_MASK
-#define TCR_EL2_IRGN0_MASK	TCR_IRGN0_MASK
-#define TCR_EL2_T0SZ_MASK	0x3f
 #define TCR_EL2_MASK	(TCR_EL2_TG0_MASK | TCR_EL2_SH0_MASK | \
 			 TCR_EL2_ORGN0_MASK | TCR_EL2_IRGN0_MASK)
 
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d494..3499e5fab39e 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -514,7 +514,6 @@
 
 #define SYS_TTBR0_EL2			sys_reg(3, 4, 2, 0, 0)
 #define SYS_TTBR1_EL2			sys_reg(3, 4, 2, 0, 1)
-#define SYS_TCR_EL2			sys_reg(3, 4, 2, 0, 2)
 #define SYS_VTTBR_EL2			sys_reg(3, 4, 2, 1, 0)
 
 #define SYS_HAFGRTR_EL2			sys_reg(3, 4, 3, 1, 6)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index e2d37ee221b8..5093598ac5f7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -5561,6 +5561,131 @@ Res0    6
 Field   5:0     T0SZ
 EndSysreg
 
+Sysreg	TCR_EL2		3	4	2	0	2
+Prefix	VHE
+Res0	63:62
+Field	61	MTX1
+Field	60	MTX0
+Field	59	DS
+Field	58	TCMA1
+Field	57	TCMA0
+Field	56	E0PD1
+Field	55	E0PD0
+Field	54	NFD1
+Field	53	NFD0
+Field	52	TBID1
+Field	51	TBID0
+Field	50	HWU162
+Field	49	HWU161
+Field	48	HWU160
+Field	47	HWU159
+Field	46	HWU062
+Field	45	HWU061
+Field	44	HWU060
+Field	43	HWU059
+Field	42	HPD1
+Field	41	HPD0
+Field	40	HD
+Field	39	HA
+Field	38	TBI1
+Field	37	TBI0
+Field	36	AS
+Res0	35
+Field	34:32	IPS
+Enum	31:30	TG1
+	0b01	16K
+	0b10	4K
+	0b11	64K
+EndEnum
+Enum	29:28	SH1
+	0b00	NONE
+	0b10	OUTER
+	0b11	INNER
+EndEnum
+Enum	27:26	ORGN1
+	0b00	NC
+	0b01	WBWA
+	0b10	WT
+	0b11	WBnWA
+EndEnum
+Enum	25:24	IRGN1
+	0b00	NC
+	0b01	WBWA
+	0b10	WT
+	0b11	WBnWA
+EndEnum
+Field	23	EPD1
+Field	22	A1
+Field	21:16	T1SZ
+Enum	15:14	TG0
+	0b00	4K
+	0b01	64K
+	0b10	16K
+EndEnum
+Enum	13:12	SH0
+	0b00	NONE
+	0b10	OUTER
+	0b11	INNER
+EndEnum
+Enum	11:10	ORGN0
+	0b00	NC
+	0b01	WBWA
+	0b10	WT
+	0b11	WBnWA
+EndEnum
+Enum	9:8	IRGN0
+	0b00	NC
+	0b01	WBWA
+	0b10	WT
+	0b11	WBnWA
+EndEnum
+Field	7	EPD0
+Res0	6
+Field	5:0	T0SZ
+EndPrefix
+Res0	63:34
+Field	33	MTX
+Field	32	DS
+Res1	31
+Field	30	TCMA
+Field	29	TBID
+Field	28	HWU62
+Field	27	HWU61
+Field	26	HWU60
+Field	25	HWU59
+Field	24	HPD
+Res1	23
+Field	22	HD
+Field	21	HA
+Field	20	TBI
+Res0	19
+Field	18:16	PS
+Enum	15:14	TG0
+	0b00	4K
+	0b01	64K
+	0b10	16K
+EndEnum
+Enum	13:12	SH0
+	0b00	NONE
+	0b10	OUTER
+	0b11	INNER
+EndEnum
+Enum	11:10	ORGN0
+	0b00	NC
+	0b01	WBWA
+	0b10	WT
+	0b11	WBnWA
+EndEnum
+Enum	9:8	IRGN0
+	0b00	NC
+	0b01	WBWA
+	0b10	WT
+	0b11	WBnWA
+EndEnum
+Res0	7:6
+Field	5:0	T0SZ
+EndSysreg
+
 Sysreg	TCR_EL12        3	5	2	0	2
 Mapping	TCR_EL1
 EndSysreg
-- 
2.43.0


