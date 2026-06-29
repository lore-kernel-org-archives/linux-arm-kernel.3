Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3BFC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+AqSk9mrw8EE4phk7ZM+5/RHqQMiKJOJ6jJ+0oKyYk=; b=g7g+OmJOXQSMYrO/HgHjxhjbXG
	k5SnxP4/55ZFu4ZTU9DL1G/0al9Gka2llHkhPEP0WwVJ1vghJLlSTGVCjgCaPGw7wTLk7QXaPWztU
	tkV8VR5ZJdF2LQVkvlFIaoAr3mwSLFzazCmuRnzH8o1/AD2fjD5HRvv4ZgYeDL5BanP4gnJ8aXtv2
	aBcpv6XKtPwlCSQ7Tvfm1XmLLF4ezfvZSlILnBXFqN54pf2CusTawJOqYK8gYm8FIfqnNuv6gd1Nt
	7NxD7fCs9MAl7NXQec6OErkiRIB6IRoymiZJSSIZ5s2cu9mDGv6fkEehYZqfqJTdvh+alt6HSkpEZ
	CQlF/gUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7rF-0000000E5D6-1SQJ;
	Mon, 29 Jun 2026 09:00:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7qx-0000000E4xe-0dRr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:00:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8CF41A00;
	Mon, 29 Jun 2026 02:00:25 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 904423F836;
	Mon, 29 Jun 2026 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782723630; bh=8b5eZRre3Cu0DB9ohAJCb64s8pk5pPGSHPb1kfc7QcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ddmUQJh4UsrIzx8UvgSOzOiu0CxtjZwG0zZso6ihzecRgZspwctCZWUrxxzJfdMhd
	 D4MbCQTkoYui57nqXC5KODneNAHawFsxwIkCyona1tFrDBpbB6TY8i90zpIzc0l1kq
	 LiVPtkHUp/3BiNXZzXH8lg7i2gTdc1Kp9BWHNSJQ=
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
Subject: [PATCH v8 09/13] coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
Date: Mon, 29 Jun 2026 10:00:02 +0100
Message-ID: <20260629090007.1718746-10-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629090007.1718746-1-yeoreum.yun@arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_020031_280956_48BB1C4C 
X-CRM114-Status: GOOD (  16.21  )
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

In the perf enable path, there are missing cases where
cscfg_csdev_disable_active_config() is not called:

  - Branch broadcast is selected but not supported by the hardware
  - etm4_enable_hw() fails

This can lead to a leak of config_desc->active_cnt.
Fix this by properly calling cscfg_csdev_disable_active_config()
in these error paths.

Fixes: 810ac401db1f ("coresight: etm4x: Add complex configuration handlers to etmv4")
Suggested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm4x-core.c          | 44 +++++++++++--------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 31ac7783fdb8..f32943b0669a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -794,8 +794,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
 	};
 	struct perf_event_attr *attr = &event->attr;
-	unsigned long cfg_hash;
-	int preset, cc_threshold;
+	int cc_threshold;
 	u8 ts_level;
 
 	/* Clear configuration from previous run */
@@ -881,16 +880,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		/* bit[12], Return stack enable bit */
 		config->cfg |= TRCCONFIGR_RS;
 
-	/*
-	 * Set any selected configuration and preset. A zero configid means no
-	 * configuration active, preset = 0 means no preset selected.
-	 */
-	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
-	if (cfg_hash) {
-		preset = ATTR_CFG_GET_FLD(attr, preset);
-		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
-	}
-
 	/* branch broadcast - enable if selected and supported */
 	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
 		if (!caps->trcbb) {
@@ -914,7 +903,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 			    struct coresight_path *path)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int ret;
+	struct perf_event_attr *attr = &event->attr;
+	unsigned long cfg_hash;
+	int ret, preset;
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
 		return -EINVAL;
@@ -925,7 +916,19 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	/* Configure the tracer based on the session's specifics */
 	ret = etm4_parse_event_config(csdev, event);
 	if (ret)
-		goto out;
+		goto err;
+
+	/*
+	 * Set any selected configuration and preset. A zero configid means no
+	 * configuration active, preset = 0 means no preset selected.
+	 */
+	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
+	if (cfg_hash) {
+		preset = ATTR_CFG_GET_FLD(attr, preset);
+		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
+		if (ret)
+			goto err;
+	}
 
 	drvdata->trcid = path->trace_id;
 
@@ -934,16 +937,19 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 
 	/* And enable it */
 	ret = etm4_enable_hw(drvdata);
-
-out:
-	/* Failed to start tracer; roll back to DISABLED mode */
 	if (ret) {
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
-		return ret;
+		if (cfg_hash)
+			cscfg_csdev_disable_active_config(csdev);
+		goto err;
 	}
 
 	csdev->path = path;
 	return 0;
+
+err:
+	/* Failed to start tracer; roll back to DISABLED mode */
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
+	return ret;
 }
 
 static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


