Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE11FC5918
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0kOTemb4Ir8iFmG4BMKNV0onk+GgkP+xUU499B2gK8=; b=KJSw5JqSHBtZWUUL5HX9cXfx5a
	gn7fs1gluTJQwjsWoj7eHqdyl9UZTo0Bm/WfJa5nB1CwNB7SHQ48RbLqk3Qd1rNyhseu8IlkSYuM+
	hjXEOEVG72lhtZBqrdM40xWIacXBsuRC/YrRt7wmoa6v8k+Lc5kXHfJ8xUpTfKr+Fmva+SA+wGkrT
	eQv+EgaeuaWWBDDrAtZs2hqrJDsWfEXv/qNFgh1Kall77mspW7GGdYd0c+LYKFQYvJr1Id37ln+vb
	hRaulOy4YmKgYsHoLzEvxdIOEJCT8tvJpkAc0tkXCaJXH4dPDqaDJve4rOgIhvUIZrMo/wyCEpsCr
	CuW3k1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbT-00000005myT-0c6C;
	Thu, 26 Feb 2026 09:24:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbO-00000005mvv-0zR2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 09:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=e0kOTemb4Ir8iFmG4BMKNV0onk+GgkP+xUU499B2gK8=; b=XIJOx6N56FR1IPQmqUVMA4ikVC
	IZkqeWPtI36AUYTx1W/hLbufLCvkHbeGGv4VKpaQGDwftuOcyImPhYisk1uVbFE4dbwklh+/Y1BqH
	KtNR0divqK72uEAU0oDVtyeox4G9cS7IY16ZubrmorMRs7iqYnhwADJIGPqV8lif7HgxF/60GmIv8
	FdRqtHKwDUOHm9imytRrTs+zlYbq5NN8QMPTJ5LsaLYroTePi1uggCWEBHnsw7AM//Kn6icDxiQb1
	lTZ99kXJvQVTM/yXLWZDSMzWHHfSCNE2TfgPXKkC/oD9zRuHk4gaVmQYNqt2Aw6qcScpvgUpjhAnF
	UGy7jtEw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbL-0000000AbTs-13SG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:24:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7CEC1516;
	Thu, 26 Feb 2026 01:23:59 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FEE23F62B;
	Thu, 26 Feb 2026 01:24:04 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 26 Feb 2026 09:23:51 +0000
Subject: [PATCH v2 3/8] coresight: cti: Access ASICCTL only when
 implemented
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm_coresight_cti_refactor_v1-v2-3-b30fada3cfec@arm.com>
References: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
In-Reply-To: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772097837; l=3849;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=rGuLCxcdB51oZkB3MVY5dJcQ0/iYvhTpnGJEDPotNFE=;
 b=NopYtP6OyEKzNL1XEVEYATIrioauyFYSNuqAHV7n7bnBsVZQhuyY96j1ay/2BGNSAG9FPV1af
 8mnblQn5DZQAPfTcgG1lGeAHH18G38G26u7Eg6Fb7UR21Ue8b/e7hgN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_092407_692479_DD52F189 
X-CRM114-Status: GOOD (  16.83  )
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

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  |  5 ++++-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 13 +++++++++++++
 drivers/hwtracing/coresight/coresight-cti.h       |  2 ++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 6a53c3ceebf41645e599017e076d12b8b158b10f..726970d852dee3b962e5147311dfadd0b741cfe0 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -68,7 +68,8 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* other regs */
 	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
-	writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
+	if (config->asicctl_impl)
+		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
 	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
 
 	/* re-enable CTI */
@@ -221,6 +222,8 @@ static void cti_set_default_config(struct device *dev,
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
index 45735526fe55b0e4746ba856443f0fcc807d82bb..a4b3968d8d3d19a20604fb09db14cf41962f5a79 100644
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


