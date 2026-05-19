Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C20CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46wuqWHbmWzOblzkekRvajbgmWYIq4L9xVdX0oZO9iI=; b=v/bWOwHAIu5TmFDqaI/wPWU0t5
	f43QpxhWQ96eO6iXmJ0o3Dgxpm0hl/yGPQt8sgNgC6kspAyM6bWx5Rldhk95Z9RmIjIjybB/3U89s
	DrEBLbXEciju7EIyR6U9/6azAEqKVDyzNQS5pK9wvfZgWZ4xHk5ZXRXWBzwb1uqM1Ty7lQNWWopoQ
	ePmLO/ZY+Q3FmWF6t3O8WQxhM9ZdqYcHQ1gxF47YWP9XMmb4TdIzXcKDaoo+vlhqeFVjB2iN8QbFP
	zxmQIb4B4wuwawnDAmP8fSQ0OzANj0KjoWa8qIp/jcV8PiWcbgEIt14sbUOblDKKMJcMyVDK04ZnO
	owkGcwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgG-000000026eG-3IUD;
	Tue, 19 May 2026 15:48:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgB-000000026bv-40pw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:48:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 869381682;
	Tue, 19 May 2026 08:48:17 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64F813F632;
	Tue, 19 May 2026 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779205702; bh=L5LEcFK5G7PWwnsF9wSiJC71qGNuFCzjmOYBEpRvavM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vD9tDzU8wH4w7bxN6ylgvlLyrPudZimFgLLW44Z9GDnP5uIXSEcvuhSlroscryoFC
	 cX0ZEZtsSfLX64vqxRPmQc3G6cqnwF4+9Lkx7ZN4dF58SuO+5cR02Ot8wU249rErvg
	 ffvaqc+DCZv++E8Yr+yCnR5U+8OnKAMSUhq1L1oc=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v7 02/13] coresight: etm4x: fix underflow for nrseqstate
Date: Tue, 19 May 2026 16:48:01 +0100
Message-Id: <20260519154812.254884-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519154812.254884-1-yeoreum.yun@arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_084824_073480_44AB614E 
X-CRM114-Status: GOOD (  12.14  )
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

TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.

Therefore, drvdata->nrseqstate should be checked before entering the loop.

Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-etm4x-core.c | 18 ++++++++++--------
 .../coresight/coresight-etm4x-sysfs.c          |  2 ++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1e3b0344dc00..94b9385e964a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -542,9 +542,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 	etm4x_relaxed_write32(csa, config->vissctlr, TRCVISSCTLR);
 	if (drvdata->nr_pe_cmp)
 		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
+
 	if (drvdata->nrseqstate) {
+		for (i = 0; i < drvdata->nrseqstate - 1; i++)
+			etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
+
 		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
 		etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
 	}
@@ -1896,10 +1898,10 @@ static int etm4_cpu_save(struct coresight_device *csdev)
 	if (drvdata->nr_pe_cmp)
 		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
 
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
-
 	if (drvdata->nrseqstate) {
+		for (i = 0; i < drvdata->nrseqstate - 1; i++)
+			state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
+
 		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
 		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
 	}
@@ -2009,10 +2011,10 @@ static void etm4_cpu_restore(struct coresight_device *csdev)
 	if (drvdata->nr_pe_cmp)
 		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
 
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
-
 	if (drvdata->nrseqstate) {
+		for (i = 0; i < drvdata->nrseqstate - 1; i++)
+			etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
+
 		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
 		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
 	}
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index e9eeea6240d5..0e1ad175aa1e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etmv4_config *config = &drvdata->config;
 
+	if (!drvdata->nrseqstate)
+		return -ENOTSUPP;
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 	if (val >= drvdata->nrseqstate - 1)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


