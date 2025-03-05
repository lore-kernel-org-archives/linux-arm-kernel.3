Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C59AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMLAHK58Csl68Ha3iJR2k60QHBUDJOSsDAoiOuJClpk=; b=rcCXYHLmbHtDbC59QO468Z6Ts/
	NZ5q0uYanbLXL+ozi5xf1jy+1tuDhs9DkyzSoxJtmKWwYeICgSX42JGBmonIrNmoXWqNL3Qsg9L0r
	1FYIH6YLqqMs1wQhWFBPadIotjY5Q8dyOoXpmL3oSY+ri33KG4sdKYD24f6zsHZbp1Ougmjd7jPYN
	UMsCatSKxNvcSjtGVbxc6SFwLSEehdwkzOg3n2UBBhcRhBuZtutLTU8pWmO6oGPOVmVdZqmNXdn2d
	9sP6Dvze9NnMRb+5SXxehDHnlfX8Md17ye42I4tRPWSvN4XQ2fZD9RbAkk5m6cHUI3lYfXDN/pvzG
	d54VrIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprNE-00000008clk-42dU;
	Wed, 05 Mar 2025 16:13:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprK5-00000008cIJ-0Mzk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:10:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9C461007;
	Wed,  5 Mar 2025 08:10:27 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8FFFC3F5A1;
	Wed,  5 Mar 2025 08:10:13 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	bwicaksono@nvidia.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 1/3] perf/arm_cspmu: Move register definitons to header
Date: Wed,  5 Mar 2025 16:10:06 +0000
Message-Id: <5a3c796560665b51cb63fec0d473afd8f8d0a836.1741190362.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1741190362.git.robin.murphy@arm.com>
References: <cover.1741190362.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_081017_214006_FFA226E2 
X-CRM114-Status: UNSURE (   9.92  )
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

Implementations may occasionally want to refer to register offsets, so
for the sake of consistency move all of the register definitions to join
the PMIIDR fields in the private header where they can be shared. As an
example nicety, we can then define Ampere's imp-def filters in terms of
the architectural PMIMPDEF range rather than open-coded offsets.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/ampere_cspmu.c |  8 ++---
 drivers/perf/arm_cspmu/arm_cspmu.c    | 45 --------------------------
 drivers/perf/arm_cspmu/arm_cspmu.h    | 46 +++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 49 deletions(-)

diff --git a/drivers/perf/arm_cspmu/ampere_cspmu.c b/drivers/perf/arm_cspmu/ampere_cspmu.c
index f72f5689923c..31cc1a4ac9df 100644
--- a/drivers/perf/arm_cspmu/ampere_cspmu.c
+++ b/drivers/perf/arm_cspmu/ampere_cspmu.c
@@ -10,10 +10,10 @@
 
 #include "arm_cspmu.h"
 
-#define PMAUXR0		0xD80
-#define PMAUXR1		0xD84
-#define PMAUXR2		0xD88
-#define PMAUXR3		0xD8C
+#define PMAUXR0		PMIMPDEF
+#define PMAUXR1		(PMIMPDEF + 0x4)
+#define PMAUXR2		(PMIMPDEF + 0x8)
+#define PMAUXR3		(PMIMPDEF + 0xC)
 
 #define to_ampere_cspmu_ctx(cspmu)	((struct ampere_cspmu_ctx *)(cspmu->impl.ctx))
 
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 81e8b97e9353..769466d55bea 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -40,51 +40,6 @@
 	ARM_CSPMU_EXT_ATTR(_name, arm_cspmu_cpumask_show,	\
 				(unsigned long)_config)
 
-/*
- * CoreSight PMU Arch register offsets.
- */
-#define PMEVCNTR_LO					0x0
-#define PMEVCNTR_HI					0x4
-#define PMEVTYPER					0x400
-#define PMCCFILTR					0x47C
-#define PMEVFILTR					0xA00
-#define PMCNTENSET					0xC00
-#define PMCNTENCLR					0xC20
-#define PMINTENSET					0xC40
-#define PMINTENCLR					0xC60
-#define PMOVSCLR					0xC80
-#define PMOVSSET					0xCC0
-#define PMCFGR						0xE00
-#define PMCR						0xE04
-#define PMIIDR						0xE08
-
-/* PMCFGR register field */
-#define PMCFGR_NCG					GENMASK(31, 28)
-#define PMCFGR_HDBG					BIT(24)
-#define PMCFGR_TRO					BIT(23)
-#define PMCFGR_SS					BIT(22)
-#define PMCFGR_FZO					BIT(21)
-#define PMCFGR_MSI					BIT(20)
-#define PMCFGR_UEN					BIT(19)
-#define PMCFGR_NA					BIT(17)
-#define PMCFGR_EX					BIT(16)
-#define PMCFGR_CCD					BIT(15)
-#define PMCFGR_CC					BIT(14)
-#define PMCFGR_SIZE					GENMASK(13, 8)
-#define PMCFGR_N					GENMASK(7, 0)
-
-/* PMCR register field */
-#define PMCR_TRO					BIT(11)
-#define PMCR_HDBG					BIT(10)
-#define PMCR_FZO					BIT(9)
-#define PMCR_NA						BIT(8)
-#define PMCR_DP						BIT(5)
-#define PMCR_X						BIT(4)
-#define PMCR_D						BIT(3)
-#define PMCR_C						BIT(2)
-#define PMCR_P						BIT(1)
-#define PMCR_E						BIT(0)
-
 /* Each SET/CLR register supports up to 32 counters. */
 #define ARM_CSPMU_SET_CLR_COUNTER_SHIFT		5
 #define ARM_CSPMU_SET_CLR_COUNTER_NUM		\
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 2621f3111148..576249e0deea 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -65,6 +65,52 @@
 /* The cycle counter, if implemented, is located at counter[31]. */
 #define ARM_CSPMU_CYCLE_CNTR_IDX	31
 
+/*
+ * CoreSight PMU Arch register offsets.
+ */
+#define PMEVCNTR_LO			0x0
+#define PMEVCNTR_HI			0x4
+#define PMEVTYPER			0x400
+#define PMCCFILTR			0x47C
+#define PMEVFILTR			0xA00
+#define PMCNTENSET			0xC00
+#define PMCNTENCLR			0xC20
+#define PMINTENSET			0xC40
+#define PMINTENCLR			0xC60
+#define PMOVSCLR			0xC80
+#define PMOVSSET			0xCC0
+#define PMIMPDEF			0xD80
+#define PMCFGR				0xE00
+#define PMCR				0xE04
+#define PMIIDR				0xE08
+
+/* PMCFGR register field */
+#define PMCFGR_NCG			GENMASK(31, 28)
+#define PMCFGR_HDBG			BIT(24)
+#define PMCFGR_TRO			BIT(23)
+#define PMCFGR_SS			BIT(22)
+#define PMCFGR_FZO			BIT(21)
+#define PMCFGR_MSI			BIT(20)
+#define PMCFGR_UEN			BIT(19)
+#define PMCFGR_NA			BIT(17)
+#define PMCFGR_EX			BIT(16)
+#define PMCFGR_CCD			BIT(15)
+#define PMCFGR_CC			BIT(14)
+#define PMCFGR_SIZE			GENMASK(13, 8)
+#define PMCFGR_N			GENMASK(7, 0)
+
+/* PMCR register field */
+#define PMCR_TRO			BIT(11)
+#define PMCR_HDBG			BIT(10)
+#define PMCR_FZO			BIT(9)
+#define PMCR_NA				BIT(8)
+#define PMCR_DP				BIT(5)
+#define PMCR_X				BIT(4)
+#define PMCR_D				BIT(3)
+#define PMCR_C				BIT(2)
+#define PMCR_P				BIT(1)
+#define PMCR_E				BIT(0)
+
 /* PMIIDR register field */
 #define ARM_CSPMU_PMIIDR_IMPLEMENTER	GENMASK(11, 0)
 #define ARM_CSPMU_PMIIDR_PRODUCTID	GENMASK(31, 20)
-- 
2.39.2.101.g768bb238c484.dirty


