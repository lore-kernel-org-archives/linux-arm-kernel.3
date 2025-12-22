Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8051E6B25B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 22:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8H/ET9silErUYF8U6DtXQB+RjQXJh8rpLhRgmln5Dl0=; b=UQNoRc1O002Pb/lW+gt6DfsMfu
	fvrioMEXQoJ5MO2zUrE13E9ip2aLF0Ahp0H6yJbMoU11K6ZYtIlIbP4GqH5QUn9Egnf9FndaM3ASO
	ltQ0MGq71dYwUEj13k/6Rw2e+heya6RilSOqXc4O8CmqfW+NI2cW7mRn7+rzxBqllQwURnsxjx/uh
	TCURD+uPjuh2T6Sb6BYCpEpDqK+AWBaQrAglNNJDUF9tPL6hrH4H0ttaBgj9GGFF7OFNXc8kLCGHC
	QUV7ON91O2e5nF494jxgu7km8urNpJH+g4xVmK0q00Cm+AJ0mEd5gzj35Hj8L414MJOPx2Dx28Dn9
	df3jFUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXoqE-0000000EFFT-0lFp;
	Mon, 22 Dec 2025 22:57:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXoqD-0000000EFFL-29nj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 22:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8857D60185;
	Mon, 22 Dec 2025 22:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEDCC4CEF1;
	Mon, 22 Dec 2025 22:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766444244;
	bh=NGRCIE+vlZoIki6+EbfCVBdld6vYNFjLSPZEkgP7THo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KPV1VghIh+CsAHRzPbEOVajXwvtYvM9IyUEjB0LYNKMVudKa7IQt75oYaGgsvPH3R
	 bsp2vrCJrX4B9dngdfflZz5TAVoV20gCr48plEYx6tHAtxNk3KqoDyjoS6QSgQvA0O
	 kMFu51xhWzbv0Ki/mUvIJKnwXlkLp5FYES+Ms7uxFs56fPBDPsskvy90XXn4Gyhie1
	 i3D5aERu9AXEGhXm/IDPDqhRrEAYEwVoOQdBbqOcj7g5mpj3pGd+yQyNi/BVTbCSyn
	 6gSqfF+G9IcRjk+QFhdJQwlVifE7S6wZrABaIb7YegTcQ2ngrfxtu33FyK3Qwnsvru
	 r9Mr7WZ8WAe9A==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/11] tools headers: Sync arm64 headers with kernel sources
Date: Mon, 22 Dec 2025 14:57:13 -0800
Message-ID: <20251222225716.3565649-8-namhyung@kernel.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
In-Reply-To: <20251222225716.3565649-1-namhyung@kernel.org>
References: <20251222225716.3565649-1-namhyung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

To pick up changes from:

  b0a3f0e894f34e01 ("arm64/sysreg: Replace TCR_EL1 field macros")
  3bbf004c4808e2c3 ("arm64: cputype: Add Neoverse-V3AE definitions")
  e185c8a0d84236d1 ("arm64: cputype: Add NVIDIA Olympus definitions")
  52b49bd6de29a89a ("arm64: cputype: Remove duplicate Cortex-X1C definitions")

This should address these tools/perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h

Please see tools/include/README.kernel-copies.

Note that this is still out of sync due to is_midr_in_range_list().

Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/arch/arm64/include/asm/cputype.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
index f898c47e551f655c..9b73c1aa3ad747ec 100644
--- a/tools/arch/arm64/include/asm/cputype.h
+++ b/tools/arch/arm64/include/asm/cputype.h
@@ -81,7 +81,6 @@
 #define ARM_CPU_PART_CORTEX_A78AE	0xD42
 #define ARM_CPU_PART_CORTEX_X1		0xD44
 #define ARM_CPU_PART_CORTEX_A510	0xD46
-#define ARM_CPU_PART_CORTEX_X1C		0xD4C
 #define ARM_CPU_PART_CORTEX_A520	0xD80
 #define ARM_CPU_PART_CORTEX_A710	0xD47
 #define ARM_CPU_PART_CORTEX_A715	0xD4D
@@ -93,6 +92,7 @@
 #define ARM_CPU_PART_NEOVERSE_V2	0xD4F
 #define ARM_CPU_PART_CORTEX_A720	0xD81
 #define ARM_CPU_PART_CORTEX_X4		0xD82
+#define ARM_CPU_PART_NEOVERSE_V3AE	0xD83
 #define ARM_CPU_PART_NEOVERSE_V3	0xD84
 #define ARM_CPU_PART_CORTEX_X925	0xD85
 #define ARM_CPU_PART_CORTEX_A725	0xD87
@@ -130,6 +130,7 @@
 
 #define NVIDIA_CPU_PART_DENVER		0x003
 #define NVIDIA_CPU_PART_CARMEL		0x004
+#define NVIDIA_CPU_PART_OLYMPUS		0x010
 
 #define FUJITSU_CPU_PART_A64FX		0x001
 
@@ -171,7 +172,6 @@
 #define MIDR_CORTEX_A78AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A78AE)
 #define MIDR_CORTEX_X1	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X1)
 #define MIDR_CORTEX_A510 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A510)
-#define MIDR_CORTEX_X1C MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X1C)
 #define MIDR_CORTEX_A520 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A520)
 #define MIDR_CORTEX_A710 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A710)
 #define MIDR_CORTEX_A715 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A715)
@@ -183,6 +183,7 @@
 #define MIDR_NEOVERSE_V2 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V2)
 #define MIDR_CORTEX_A720 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720)
 #define MIDR_CORTEX_X4 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X4)
+#define MIDR_NEOVERSE_V3AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3AE)
 #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
 #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
 #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
@@ -222,6 +223,7 @@
 
 #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
+#define MIDR_NVIDIA_OLYMPUS MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_OLYMPUS)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
 #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
@@ -245,7 +247,7 @@
 /* Fujitsu Erratum 010001 affects A64FX 1.0 and 1.1, (v0r0 and v1r0) */
 #define MIDR_FUJITSU_ERRATUM_010001		MIDR_FUJITSU_A64FX
 #define MIDR_FUJITSU_ERRATUM_010001_MASK	(~MIDR_CPU_VAR_REV(1, 0))
-#define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_NFD1 | TCR_NFD0)
+#define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_EL1_NFD1 | TCR_EL1_NFD0)
 
 #ifndef __ASSEMBLER__
 
-- 
2.52.0.351.gbe84eed79e-goog


