Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB84E7DF1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zKBmtbAXRxmlW+zXMtgUYtzAC9WxneMI2dSb5ys4zA=; b=eRPOPbgqH+fnp/wLDT7levnwxU
	JUyc8j9GmKiSwcuNYW0lfdh7bSw8nhf315HyxjusMKQDTthP786B/i4bPdrcIilMlYRaP14mFxwv1
	7O76ngtAEaDepR/nx9jvxOwaG35caUgCsZ1Kg/NXZ6sEYGZXQ/9RPVU/LXAtedFGIFU7Hy42MtWsU
	DAVwua69aXpxJDqsFFnjTKr3Ta1tO4CAO0qHf7cGswik22sgBUZrjJlU2YHvHX2ScMTfaZTvPdHTw
	ngE7U5nmuBjQFLNlvZaeqHZrc4UWrtsujBCW+v7QP5pA2UIwdFCZRSh6BEesc1Ji5qHIVM6P2J64e
	3rnUUusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytk-00000005R0n-2sE0;
	Mon, 02 Feb 2026 18:43:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyti-00000005Qxn-24qK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79C19600BB;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B12FC19422;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057821;
	bh=OSxH32TQzryKo3od0stS3xvAyRicv7+HSLT6GHC//Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rV1Gbqkowyj0pAlqGBjth4/chueJfCVe686kdAxiKO9k6qpSqZk9LJFy/Cgc4T747
	 Hu46aGquen8EjbmdtSPAkRXHDTEuDVyo0ivtQgNYwHuVEuv26PXscj317MkpJeLqfo
	 TUT57AgKyaQdvZhdgvADO9pNwt0t6c4cLa53YGlgyZUc7I7cIwIj0IIA0HOuIyJAii
	 OguDr/rgaV+FfYyi5fM7GpJLW6gjfZWUipbYf+zgFeeMjAkKa3gLfRQVps8M7JtqRS
	 jr4PVrmZj+SLrPvHONuNOi75IIt/f6po0fsfYQ/MAx4/hyBaUzXP/6sCBS1tKH4Sft
	 PdYNfcUs5h3hQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmyte-00000007sAy-3tW5;
	Mon, 02 Feb 2026 18:43:39 +0000
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
Subject: [PATCH v2 01/20] arm64: Convert SCTLR_EL2 to sysreg infrastructure
Date: Mon,  2 Feb 2026 18:43:10 +0000
Message-ID: <20260202184329.2724080-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
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

Convert SCTLR_EL2 to the sysreg infrastructure, as per the 2025-12_rel
revision of the Registers.json file.

Note that we slightly deviate from the above, as we stick to the ARM
ARM M.a definition of SCTLR_EL2[9], which is RES0, in order to avoid
dragging the POE2 definitions...

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h       |  7 ---
 arch/arm64/tools/sysreg               | 69 +++++++++++++++++++++++++++
 tools/arch/arm64/include/asm/sysreg.h |  6 ---
 3 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 939f9c5bbae67..30f0409b1c802 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -504,7 +504,6 @@
 #define SYS_VPIDR_EL2			sys_reg(3, 4, 0, 0, 0)
 #define SYS_VMPIDR_EL2			sys_reg(3, 4, 0, 0, 5)
 
-#define SYS_SCTLR_EL2			sys_reg(3, 4, 1, 0, 0)
 #define SYS_ACTLR_EL2			sys_reg(3, 4, 1, 0, 1)
 #define SYS_SCTLR2_EL2			sys_reg(3, 4, 1, 0, 3)
 #define SYS_HCR_EL2			sys_reg(3, 4, 1, 1, 0)
@@ -837,12 +836,6 @@
 #define SCTLR_ELx_A	 (BIT(1))
 #define SCTLR_ELx_M	 (BIT(0))
 
-/* SCTLR_EL2 specific flags. */
-#define SCTLR_EL2_RES1	((BIT(4))  | (BIT(5))  | (BIT(11)) | (BIT(16)) | \
-			 (BIT(18)) | (BIT(22)) | (BIT(23)) | (BIT(28)) | \
-			 (BIT(29)))
-
-#define SCTLR_EL2_BT	(BIT(36))
 #ifdef CONFIG_CPU_BIG_ENDIAN
 #define ENDIAN_SET_EL2		SCTLR_ELx_EE
 #else
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index a0f6249bd4f98..969a75615d612 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3749,6 +3749,75 @@ UnsignedEnum	2:0	F8S1
 EndEnum
 EndSysreg
 
+Sysreg	SCTLR_EL2	3	4	1	0	0
+Field	63	TIDCP
+Field	62	SPINTMASK
+Field	61	NMI
+Field	60	EnTP2
+Field	59	TCSO
+Field	58	TCSO0
+Field	57	EPAN
+Field	56	EnALS
+Field	55	EnAS0
+Field	54	EnASR
+Res0	53:50
+Field	49:46	TWEDEL
+Field	45	TWEDEn
+Field	44	DSSBS
+Field	43	ATA
+Field	42	ATA0
+Enum	41:40	TCF
+	0b00	NONE
+	0b01	SYNC
+	0b10	ASYNC
+	0b11	ASYMM
+EndEnum
+Enum	39:38	TCF0
+	0b00	NONE
+	0b01	SYNC
+	0b10	ASYNC
+	0b11	ASYMM
+EndEnum
+Field	37	ITFSB
+Field	36	BT
+Field	35	BT0
+Field	34	EnFPM
+Field	33	MSCEn
+Field	32	CMOW
+Field	31	EnIA
+Field	30	EnIB
+Field	29	LSMAOE
+Field	28	nTLSMD
+Field	27	EnDA
+Field	26	UCI
+Field	25	EE
+Field	24	E0E
+Field	23	SPAN
+Field	22	EIS
+Field	21	IESB
+Field	20	TSCXT
+Field	19	WXN
+Field	18	nTWE
+Res0	17
+Field	16	nTWI
+Field	15	UCT
+Field	14	DZE
+Field	13	EnDB
+Field	12	I
+Field	11	EOS
+Field	10	EnRCTX
+Res0	9
+Field	8	SED
+Field	7	ITD
+Field	6	nAA
+Field	5	CP15BEN
+Field	4	SA0
+Field	3	SA
+Field	2	C
+Field	1	A
+Field	0	M
+EndSysreg
+
 Sysreg	HCR_EL2		3	4	1	1	0
 Field	63:60	TWEDEL
 Field	59	TWEDEn
diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index 178b7322bf049..f75efe98e9df3 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -847,12 +847,6 @@
 #define SCTLR_ELx_A	 (BIT(1))
 #define SCTLR_ELx_M	 (BIT(0))
 
-/* SCTLR_EL2 specific flags. */
-#define SCTLR_EL2_RES1	((BIT(4))  | (BIT(5))  | (BIT(11)) | (BIT(16)) | \
-			 (BIT(18)) | (BIT(22)) | (BIT(23)) | (BIT(28)) | \
-			 (BIT(29)))
-
-#define SCTLR_EL2_BT	(BIT(36))
 #ifdef CONFIG_CPU_BIG_ENDIAN
 #define ENDIAN_SET_EL2		SCTLR_ELx_EE
 #else
-- 
2.47.3


