Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0299C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 04:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iAil2Ima9vwIDQC9z+K6FsSpkSoOPe+iPvxYMjSXBbw=; b=dX2VWkf7tAYMIveAQQGFNNc82t
	01YN7A85GxXkUERLMDHvGXtEmHncV9LkSKLPEwg4u4IsY4w8mB3JMFxVDHEABEZJ8Jfo7mS3sx8to
	YS/fu22sXuX27qbLS7SM8RJkgSaIlMWKQ8D78WQl+xCqZ/grUSrC2Fh0T3ZbjSCLb4nIs/CRaBclk
	zCSFYSUH3+q1EW6W9n9FG2vHwrPZDtNMR6ODz4KeKuiaizMlSTR6v3iAiD1SGb3QW6GqVFxSgwNnY
	HeCtbhYQQ/eB1O0wfwUJqiudY+xLJWYz/F+YCc8VIB9UxhKDYKAaNFzjKl0H+DprfoLWnt6yAEszA
	FR9SIjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVLH-00000006GfF-0qCU;
	Thu, 27 Feb 2025 04:17:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVJj-00000006GM5-2mxS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 04:16:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96C2B1515;
	Wed, 26 Feb 2025 20:16:26 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BABE13F6A8;
	Wed, 26 Feb 2025 20:16:08 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	robh@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: [boot-wrapper] aarch64: Enable access into FEAT_PMUv3p9 registers from EL2 and below
Date: Thu, 27 Feb 2025 09:46:03 +0530
Message-Id: <20250227041603.2029058-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_201611_743696_9AF86DCF 
X-CRM114-Status: UNSURE (   7.95  )
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

FEAT_PMUv3p9 adds system register PMUACR_EL1 and similarly FEAT_PMUv3_ICNTR
adds system registers PMICFILTR_EL0 and PMICNTR_EL0. But access into these
system registers from EL2 and below exception levels, will trap into EL3
unless MDCR_EL3.EnPM2 is set.

Enable access to FEAT_PMUv3p9 registers when they are implemented.

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 2 ++
 arch/aarch64/init.c            | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index e049cda..b04bf71 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -56,6 +56,7 @@
 #define MDCR_EL3_SBRBE_NOTRAP_NOPROHIBIT	(UL(3) << 32)
 #define MDCR_EL3_ENPMSN				BIT(36)
 #define MDCR_EL3_EBWE				BIT(43)
+#define MDCR_EL3_EnPM2				BIT(7)
 
 #define SCR_EL3_RES1			BITS(5, 4)
 #define SCR_EL3_NS			BIT(0)
@@ -87,6 +88,7 @@
 #define ID_AA64DFR0_EL1_PMSVER		BITS(35, 32)
 #define ID_AA64DFR0_EL1_TRACEBUFFER	BITS(47, 44)
 #define ID_AA64DFR0_EL1_BRBE		BITS(55, 52)
+#define ID_AA64DFR0_EL1_PMUVER		BITS(11, 8)
 #define ID_AA64DFR0_EL1_DEBUGVER	BITS(3, 0)
 
 #define ID_AA64ISAR0_EL1_TME		BITS(27, 24)
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index 54e4cc4..fe7ed5f 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -152,6 +152,9 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64DFR0_EL1, DEBUGVER) >= 11)
 		mdcr |= MDCR_EL3_EBWE;
 
+	if (mrs_field(ID_AA64DFR0_EL1, PMUVER) >= 0b1001)
+		mdcr |= MDCR_EL3_EnPM2;
+
 	msr(MDCR_EL3, mdcr);
 
 	if (mrs_field(ID_AA64PFR0_EL1, SVE)) {
-- 
2.25.1


