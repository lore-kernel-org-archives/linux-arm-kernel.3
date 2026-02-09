Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870A1E7E0BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 18:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk4fZxsBzVqx3qbWFeVaK9KeBF5VSTNahf43VPArjws=; b=O2qK0LNTfBsLqm1NdCfTQohPhf
	hQysK5KoUy+40KDgoL9tEt39vcdSuRVXKw3LlmAtKMH1ocUTWf1BqvtbGodW9T+RRaRAk/723Zlff
	iHUQvO3Pkec6ozc32KecCaRY/bfhmY8nsZRjx5rWAxr9pIjvggL57Tt4g2lkfzyTJnE/94Fyw3Wtz
	MAOaHWM/I98rMLg13DTrKIwDGUpqofqa9S4lHB2tnmEcmvImRqPBk5iWFY7Z4FS8jXLIMe38MgKRV
	40LHvMMN6XiSMLXKr3x4lCASPL6PnDJLkwqoH9o5MDqJut9kKWI1SWitRrT5sYC1Y90jic/eA1JcN
	GmRHQ/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZp-0000000Foum-1Vx9;
	Mon, 09 Feb 2026 18:01:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZm-0000000FosZ-0jWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 18:01:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65DA7497;
	Mon,  9 Feb 2026 10:01:27 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2F2B3F63F;
	Mon,  9 Feb 2026 10:01:31 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 18:01:13 +0000
Subject: [PATCH 3/8] coresight: cti: Access ASICCTL only when implemented
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_cti_refactor_v1-v1-3-db71ab4d200b@arm.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770660084; l=3803;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=+Hax1VUIcrCW2M8ZfXMlOZC8hL7iMepxnP5H9FptC1Q=;
 b=oDxoU9opTJCRf7l2p678AZ+s68q01RPrJwq4Sp+ioa2AH7ocZbVSpB+jZ9fpv/XFWMOQUUMGw
 Zb2YdIWFEG/COOxkMwGZ3kSn1+fFw7w4sUiX6YRhWIYlKSr1Sz2A35T
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_100134_299134_EC355865 
X-CRM114-Status: GOOD (  16.86  )
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

According to the Arm ARM (DDI 0487 L.b), ASICCTL is implemented only
when CTIDEVID.EXTMUXNUM is non-zero.

Based on CTIDEVID.EXTMUXNUM, add a flag 'asicctl_impl' to indicate
whether the register is implemented, and access ASICCTL conditionally
based on the flag.

Allow the sysfs node to be visible only when the register is
implemented.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  |  5 ++++-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 13 +++++++++++++
 drivers/hwtracing/coresight/coresight-cti.h       |  2 ++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 2d8b1cbe5bf5c9ce0383dc90335f0085b22a7f61..1950e9b757ae4879a2671ddaf5675c54aa7956d5 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -77,7 +77,8 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* other regs */
 	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
-	writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
+	if (config->asicctl_impl)
+		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
 	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
 
 	/* re-enable CTI */
@@ -230,6 +231,8 @@ static void cti_set_default_config(struct device *dev,
 	config->trig_filter_enable = true;
 	config->ctigate = GENMASK(config->nr_ctm_channels - 1, 0);
 	config->enable_req_count = 0;
+
+	config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
 }
 
 /*
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 9a997b2f090472761e9734fffc534663df8b06c6..c15a580f6e90f57b1376e0b883a27700966feb1a 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -537,6 +537,18 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	NULL,
 };
 
+static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
+					     struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (attr == &dev_attr_asicctl.attr && !drvdata->config.asicctl_impl)
+		return 0;
+
+	return attr->mode;
+}
+
 /* CTI channel x-trigger programming */
 static int
 cti_trig_op_parse(struct device *dev, enum cti_chan_op op,
@@ -1174,6 +1186,7 @@ static const struct attribute_group coresight_cti_mgmt_group = {
 
 static const struct attribute_group coresight_cti_regs_group = {
 	.attrs = coresight_cti_regs_attrs,
+	.is_visible = coresight_cti_regs_is_visible,
 	.name = "regs",
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 64f7324f098e8b5f90c6554e3872e3bf01988717..7a3e7f806dcb093e504f1aacb3b29564bea28f6c 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -119,6 +119,7 @@ struct cti_device {
  * @nr_trig_max: Max number of trigger signals implemented on device.
  *		 (max of trig_in or trig_out) - from ID register.
  * @nr_ctm_channels: number of available CTM channels - from ID register.
+ * @asicctl_impl: true if asicctl is implemented.
  * @enable_req_count: CTI is enabled alongside >=1 associated devices.
  * @hw_enabled: true if hw is currently enabled.
  * @hw_powered: true if associated cpu powered on, or no cpu.
@@ -140,6 +141,7 @@ struct cti_config {
 	/* hardware description */
 	int nr_ctm_channels;
 	int nr_trig_max;
+	bool asicctl_impl;
 
 	/* cti enable control */
 	int enable_req_count;

-- 
2.34.1


