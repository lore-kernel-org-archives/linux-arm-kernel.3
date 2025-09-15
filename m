Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AA8CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHsUCr4i8UhCQb2y5R9WQbHyBv0jhhdzFC3tSiuocDo=; b=o6XpGLlxksaP2FeC75xMFTDYn+
	nrptk0KUHQU9yWGrl7k9Ca4og9czETNAL1h8D0G401ZM54gin1jM7h71QaKZNvXMYXgc4Vsa2Sb74
	mR8fA91qXqcz0elyk8nMo17QmpOS9uDH81wwcnN55AOBPyly0lM8NmJhRkiZFXmkR2UI68ZBPtGQ/
	ZLETJLSB81hvtIg65yQYO93ta+Yb8BfnhEbd8DFpZaMgqnwDnDxjxn4Gu0L4V14GZeqfnWpcQB2FB
	uxrWxZ6qLfVdTiH9kg4dNN1j6lIWq3VC2nY3Qpy0dlLth2Ioqzac1Pzg6T0Mw/IIQ9a12JXFd/2nN
	HKTr4TbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XI-00000003foX-3wM9;
	Mon, 15 Sep 2025 10:34:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6X1-00000003fUq-2xmJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 021D31BF7;
	Mon, 15 Sep 2025 03:33:51 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9847A3F66E;
	Mon, 15 Sep 2025 03:33:57 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:32 +0100
Subject: [PATCH v3 09/31] coresight: etm4x: Add flag to control single-shot
 restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-9-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=2609;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ZTk34RINFCmnOdD2U0fG4zW2ruH1wPvW9njxuVJcg+E=;
 b=7nsWmd5Z1jNGRpd9FdT8irnOVdvZ4J8DvUNqHycy7vbHONfYnJwnZO89uInl5scLCdSGG+Uvv
 tX8GL5hu0X3Ca38HJaIkPK+IQhocomq1N3khnBRHPVsVFqCe2XOYDUz
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033359_877383_CCA29BF3 
X-CRM114-Status: GOOD (  12.74  )
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

Add a new argument restart_ss to etm4_enable_hw(). When passed as true,
it resets the TRCSSCSRn.STATUS bit to 0 to re-enable single-shot
control.

No functional change. This is a preparation for a subsequent change.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index fbcd0fcd1992cd600d2eb8c95ae9a5adf0c287da..f61c9924ad0496be2e41c84172c2bbe348df7b60 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -487,7 +487,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 	return 0;
 }
 
-static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
+static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)
 {
 	int i, rc;
 	struct etmv4_config *config = &drvdata->config;
@@ -562,9 +562,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
 
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		/* always clear status bit on restart if using single-shot */
-		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
-			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
+		if (restart_ss) {
+			/* always clear status bit on restart if using single-shot */
+			if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
+				config->ss_status[i] &= ~TRCSSCSRn_STATUS;
+		}
 		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
 		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
 		if (etm4x_sspcicrn_present(drvdata, i))
@@ -628,7 +630,7 @@ static void etm4_enable_hw_smp_call(void *info)
 		return;
 	}
 
-	arg->rc = etm4_enable_hw(arg->drvdata);
+	arg->rc = etm4_enable_hw(arg->drvdata, true);
 
 	/* The tracer didn't start */
 	if (arg->rc)
@@ -867,7 +869,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
 
 	/* And enable it */
-	ret = etm4_enable_hw(drvdata);
+	ret = etm4_enable_hw(drvdata, true);
 
 out:
 	/* The tracer didn't start */
@@ -1833,7 +1835,7 @@ static int etm4_starting_cpu(unsigned int cpu)
 		etm4_os_unlock(etmdrvdata[cpu]);
 
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
-		etm4_enable_hw(etmdrvdata[cpu]);
+		etm4_enable_hw(etmdrvdata[cpu], true);
 	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }

-- 
2.34.1


