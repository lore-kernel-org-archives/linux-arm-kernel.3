Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5679DC71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CMzg7iQ+idbMFSubiPEdMCVvxhWC4ym1KEexAKd2CM=; b=uCGoq2hDENH707t5JHm8cRGyKv
	uGxpt+kHvC9LFKot/Bj+GJxQDWmesnfz3/fI/5wKMeuHrx1Dw0+o47EC31nwOlD0EW057GvckMRSI
	8B5mMV5DwWv3aKHub7VgmP7dqgkbhdf5OCMDnRpd1EySTjv/Ctq0Wgu9OumoNvfwvP2uzNu2JyIZL
	hpMoWKZ8rPiRBgYNaDlLzrr1NH93ekJjsArx+nbpnsIxrPmSIb5j+DRlYppohlrnj/cAQBFSbw5dt
	FwWuIbnCG8V0D6mFHuFRZjcCeZkizzT0TqPgcLO0i2m0mlmO9PM8thozs5YjfLLcMbmbhZGDFcy3Y
	x3SiR56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMlP-0000000AATW-1Zr4;
	Wed, 11 Jun 2025 14:49:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHxU-00000009VYV-3xzF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:41:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE2C61688;
	Wed, 11 Jun 2025 02:41:04 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C98A3F59E;
	Wed, 11 Jun 2025 02:41:21 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 5/9] kselftest/arm64/mte: check MTE_FAR feature is supported
Date: Wed, 11 Jun 2025 10:41:03 +0100
Message-Id: <20250611094107.928457-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611094107.928457-1-yeoreum.yun@arm.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_024125_021729_085AE5F5 
X-CRM114-Status: GOOD (  11.98  )
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

To run the MTE_FAR test when cpu supports MTE_FAR feature,
check the MTE_FAR_ feature is supported in mte test.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/arm64/mte/mte_common_util.c | 7 +++++++
 tools/testing/selftests/arm64/mte/mte_common_util.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index 83240b980f9c..048b8a507b70 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -6,6 +6,7 @@
 #include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <time.h>
 #include <unistd.h>
 
 #include <linux/auxvec.h>
@@ -26,6 +27,7 @@
 #define INIT_BUFFER_SIZE       256
 
 struct mte_fault_cxt cur_mte_cxt;
+bool mtefar_support;
 static unsigned int mte_cur_mode;
 static unsigned int mte_cur_pstate_tco;
 
@@ -273,6 +275,7 @@ void mte_initialize_current_context(int mode, uintptr_t ptr, ssize_t range)
 	cur_mte_cxt.fault_valid = false;
 	cur_mte_cxt.trig_addr = ptr;
 	cur_mte_cxt.trig_range = range;
+
 	if (mode == MTE_SYNC_ERR)
 		cur_mte_cxt.trig_si_code = SEGV_MTESERR;
 	else if (mode == MTE_ASYNC_ERR)
@@ -325,12 +328,16 @@ int mte_switch_mode(int mte_option, unsigned long incl_mask)
 int mte_default_setup(void)
 {
 	unsigned long hwcaps2 = getauxval(AT_HWCAP2);
+	unsigned long hwcaps3 = getauxval(AT_HWCAP3);
 	unsigned long en = 0;
 	int ret;
 
 	if (!(hwcaps2 & HWCAP2_MTE))
 		ksft_exit_skip("MTE features unavailable\n");
 
+	if (hwcaps3 & HWCAP3_MTE_FAR)
+		mtefar_support = true;
+
 	/* Get current mte mode */
 	ret = prctl(PR_GET_TAGGED_ADDR_CTRL, en, 0, 0, 0);
 	if (ret < 0) {
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index 6b109e84fa39..4e1dd959df9b 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -37,6 +37,7 @@ struct mte_fault_cxt {
 };
 
 extern struct mte_fault_cxt cur_mte_cxt;
+extern bool mtefar_support;
 
 /* MTE utility functions */
 void mte_default_handler(int signum, siginfo_t *si, void *uc);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


