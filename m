Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256D2C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGSEse4hBsw8fgmlESrHlYNGVAkzHzxD7Bn/OzsuEgI=; b=0TznTe5rZvOJCAs5nmnZNhS2ry
	d0v+XDL01M6ULmuic2FBoulbRDXojtYZ4WcRtYBGx398yHAeMINCg2PmSiqVNtFtDgQn+Kzskesd7
	cv6uY0iLLKOSi0rUuH4hdv93+eKFnRd55SHICiVqpnpJIID3SwTxP8YJ5+zelxij8nkUCz50jE2EZ
	p51KiM7f0CPD32cdSSqi4dmZIb2rMBWsFA3mSjUh0OBjR2rdMpteUNYsqR2uCZ8gLpiRNQlHlB48P
	bEN2VGMKPPOZCmdOwlhS+Q9qkXpL9LchbJYd52d7tgFb+BsEgxH9eBn5yP/0SM+1rb8iJAX+n9KEC
	Puxln5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nLy-0000000BmjI-1wSG;
	Thu, 24 Sep 2026 17:35:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nLN-0000000BmOu-0JC6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:34:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 227941E8D;
	Thu, 24 Sep 2026 10:34:45 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 534273F86F;
	Thu, 24 Sep 2026 10:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790271288; bh=vHLQ4omo4chT6BRCPX+W+Il8HrwxmtQtQaFyLV2a5ag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d0YP8BuLBjbJxtowYq+gsSVPYABYnI7wY98YF7zhQNGFdPsfkx+qeRiPHlyEPRJlR
	 rpHkRSk17UJYMINfignlRPDr4MJId8kM3crvTL24uVFuZxkQme7LwxlODRrQ2wiEVn
	 InIwPXB7nApI0L9VP4mkltKcXKeVLqemV3gwzE6k=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 24 Sep 2026 18:33:51 +0100
Subject: [PATCH v12 13/14] coresight: etm3x: rename local config as
 curr_config referring drvdata->curr_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-separate_etm_cfg_v2-v12-13-a2b41d2f7c2b@arm.com>
References: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
In-Reply-To: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7320; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=vHLQ4omo4chT6BRCPX+W+Il8HrwxmtQtQaFyLV2a5ag=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqtV8SVy8goDrZWz1OMdm9o4QYdAffBiZblHNru
 WhyziwmGJ6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarVfEgAKCRBt1cPRWsUx
 M/kwC/9fBdEaxWTRW0CqkVdjAstQU3DHQv1/KSJuTwJalX+xmf0XsiwE0SOCgQ32+2ArqUeuoUl
 wbwEvA+XoM1QpIc4JrlUc6035ySuGT2PBScBOXr07u7G7edrS6jqom9aehrjOWC5D6cGtA+qGtN
 pAKQYfgW6bPhr2/4OrK3JKBf7RBZmDwNC32pd6ld2Qd8rKWqvkri28T7Ykgt7rjJszlMx5xF3/V
 F0OVuG5A+Ya/qsHQIPwovVldIRUw1Z0GfRISmC/zNTqQyaQ46v2Z7rQTRIyDXfb19mrDZYBzD5O
 F7JgrNcvneqH/RDOTE8mpaSUfU84Mquk0x/hEzxuStd4jwCzx09pG4ZyzpBnHL+R8LM3Wom2fRI
 eh4NcgJGlyZZVdNJqjGffWM5dUx6+V5i/m0an+Y1/7znrHVnZq0xekb5lEeuqPZWPyblfaCIvab
 o+HhYJpttVpr4N8FxyN+ZDTT3VzpQmspDS57Ga32o+BNhoM2WQEMwJoX/oBQVUl884ToQ=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103449_791499_4E53694B 
X-CRM114-Status: GOOD (  16.44  )
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

For readability, rename the local config variable to curr_config in
places where it refers to drvdata->curr_config.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 76 +++++++++++-----------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index ca2ba179b6fb..0cad9ecb49b6 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -309,7 +309,7 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 				  struct perf_event *event)
 {
 	const struct etm_caps *caps = &drvdata->caps;
-	struct etm_config *config = &drvdata->curr_config;
+	struct etm_config *curr_config = &drvdata->curr_config;
 	struct perf_event_attr *attr = &event->attr;
 	u8 ts_level;
 
@@ -317,28 +317,28 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 		return -EINVAL;
 
 	/* Clear configuration from previous run */
-	memset(config, 0, sizeof(struct etm_config));
+	memset(curr_config, 0, sizeof(struct etm_config));
 
 	if (attr->exclude_kernel)
-		config->mode = ETM_MODE_EXCL_KERN;
+		curr_config->mode = ETM_MODE_EXCL_KERN;
 
 	if (attr->exclude_user)
-		config->mode = ETM_MODE_EXCL_USER;
+		curr_config->mode = ETM_MODE_EXCL_USER;
 
 	/* Always start from the default config */
-	etm_set_default(config);
+	etm_set_default(curr_config);
 
 	/*
 	 * By default the tracers are configured to trace the whole address
 	 * range.  Narrow the field only if requested by user space.
 	 */
-	if (config->mode)
-		etm_config_trace_mode(config);
+	if (curr_config->mode)
+		etm_config_trace_mode(curr_config);
 
-	config->ctrl = 0;
+	curr_config->ctrl = 0;
 
 	if (ATTR_CFG_GET_FLD(attr, cycacc))
-		config->ctrl |= ETMCR_CYC_ACC;
+		curr_config->ctrl |= ETMCR_CYC_ACC;
 
 	ts_level = max(ATTR_CFG_GET_FLD(attr, timestamp),
 		       ATTR_CFG_GET_FLD(attr, deprecated_timestamp));
@@ -350,7 +350,7 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	}
 
 	if (ts_level)
-		config->ctrl |= ETMCR_TIMESTAMP_EN;
+		curr_config->ctrl |= ETMCR_TIMESTAMP_EN;
 
 	/*
 	 * Possible to have cores with PTM (supports ret stack) and ETM (never
@@ -358,7 +358,7 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	 * - trace will still continue normally otherwise.
 	 */
 	if (ATTR_CFG_GET_FLD(attr, retstack) && (caps->retstack))
-		config->ctrl |= ETMCR_RETURN_STACK;
+		curr_config->ctrl |= ETMCR_RETURN_STACK;
 
 	return 0;
 }
@@ -368,7 +368,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	int i, rc;
 	u32 etmcr;
 	const struct etm_caps *caps = &drvdata->caps;
-	struct etm_config *config = &drvdata->curr_config;
+	struct etm_config *curr_config = &drvdata->curr_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -391,39 +391,39 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	etmcr &= ~ETM3X_SUPPORTED_OPTIONS;
 	etmcr |= caps->port_size;
 	etmcr |= ETMCR_ETM_EN;
-	etm_writel(drvdata, config->ctrl | etmcr, ETMCR);
-	etm_writel(drvdata, config->trigger_event, ETMTRIGGER);
-	etm_writel(drvdata, config->startstop_ctrl, ETMTSSCR);
-	etm_writel(drvdata, config->enable_event, ETMTEEVR);
-	etm_writel(drvdata, config->enable_ctrl1, ETMTECR1);
-	etm_writel(drvdata, config->fifofull_level, ETMFFLR);
+	etm_writel(drvdata, curr_config->ctrl | etmcr, ETMCR);
+	etm_writel(drvdata, curr_config->trigger_event, ETMTRIGGER);
+	etm_writel(drvdata, curr_config->startstop_ctrl, ETMTSSCR);
+	etm_writel(drvdata, curr_config->enable_event, ETMTEEVR);
+	etm_writel(drvdata, curr_config->enable_ctrl1, ETMTECR1);
+	etm_writel(drvdata, curr_config->fifofull_level, ETMFFLR);
 	for (i = 0; i < caps->nr_addr_cmp; i++) {
-		etm_writel(drvdata, config->addr_val[i], ETMACVRn(i));
-		etm_writel(drvdata, config->addr_acctype[i], ETMACTRn(i));
+		etm_writel(drvdata, curr_config->addr_val[i], ETMACVRn(i));
+		etm_writel(drvdata, curr_config->addr_acctype[i], ETMACTRn(i));
 	}
 	for (i = 0; i < caps->nr_cntr; i++) {
-		etm_writel(drvdata, config->cntr_rld_val[i], ETMCNTRLDVRn(i));
-		etm_writel(drvdata, config->cntr_event[i], ETMCNTENRn(i));
-		etm_writel(drvdata, config->cntr_rld_event[i],
+		etm_writel(drvdata, curr_config->cntr_rld_val[i], ETMCNTRLDVRn(i));
+		etm_writel(drvdata, curr_config->cntr_event[i], ETMCNTENRn(i));
+		etm_writel(drvdata, curr_config->cntr_rld_event[i],
 			   ETMCNTRLDEVRn(i));
-		etm_writel(drvdata, config->cntr_val[i], ETMCNTVRn(i));
+		etm_writel(drvdata, curr_config->cntr_val[i], ETMCNTVRn(i));
 	}
-	etm_writel(drvdata, config->seq_12_event, ETMSQ12EVR);
-	etm_writel(drvdata, config->seq_21_event, ETMSQ21EVR);
-	etm_writel(drvdata, config->seq_23_event, ETMSQ23EVR);
-	etm_writel(drvdata, config->seq_31_event, ETMSQ31EVR);
-	etm_writel(drvdata, config->seq_32_event, ETMSQ32EVR);
-	etm_writel(drvdata, config->seq_13_event, ETMSQ13EVR);
-	etm_writel(drvdata, config->seq_curr_state, ETMSQR);
+	etm_writel(drvdata, curr_config->seq_12_event, ETMSQ12EVR);
+	etm_writel(drvdata, curr_config->seq_21_event, ETMSQ21EVR);
+	etm_writel(drvdata, curr_config->seq_23_event, ETMSQ23EVR);
+	etm_writel(drvdata, curr_config->seq_31_event, ETMSQ31EVR);
+	etm_writel(drvdata, curr_config->seq_32_event, ETMSQ32EVR);
+	etm_writel(drvdata, curr_config->seq_13_event, ETMSQ13EVR);
+	etm_writel(drvdata, curr_config->seq_curr_state, ETMSQR);
 	for (i = 0; i < caps->nr_ext_out; i++)
 		etm_writel(drvdata, ETM_DEFAULT_EVENT_VAL, ETMEXTOUTEVRn(i));
 	for (i = 0; i < caps->nr_ctxid_cmp; i++)
-		etm_writel(drvdata, config->ctxid_pid[i], ETMCIDCVRn(i));
-	etm_writel(drvdata, config->ctxid_mask, ETMCIDCMR);
-	etm_writel(drvdata, config->sync_freq, ETMSYNCFR);
+		etm_writel(drvdata, curr_config->ctxid_pid[i], ETMCIDCVRn(i));
+	etm_writel(drvdata, curr_config->ctxid_mask, ETMCIDCMR);
+	etm_writel(drvdata, curr_config->sync_freq, ETMSYNCFR);
 	/* No external input selected */
 	etm_writel(drvdata, 0x0, ETMEXTINSELR);
-	etm_writel(drvdata, config->timestamp_event, ETMTSEVR);
+	etm_writel(drvdata, curr_config->timestamp_event, ETMTSEVR);
 	/* No auxiliary control selected */
 	etm_writel(drvdata, 0x0, ETMAUXCR);
 	etm_writel(drvdata, drvdata->traceid, ETMTRACEIDR);
@@ -562,17 +562,17 @@ static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
 	const struct etm_caps *caps = &drvdata->caps;
-	struct etm_config *config = &drvdata->curr_config;
+	struct etm_config *curr_config = &drvdata->curr_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
 	etm_set_prog(drvdata);
 
 	/* Read back sequencer and counters for post trace analysis */
-	config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
+	curr_config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
 
 	for (i = 0; i < caps->nr_cntr; i++)
-		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
+		curr_config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
 
 	etm_set_pwrdwn(drvdata);
 	coresight_disclaim_device_unlocked(csdev);

-- 
2.43.0


