Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E27C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9M8AvTrK2pWh59cnOMUJ1rVxg4iaCbNf0ZOrXgyqO0=; b=HAqDa0KI44p/aIdW7edBD0zVPl
	WDRI6/ApB8EywYc/gnbhF3esdGmUGp/rsef20Ky9W1hMoTsFKR40WtKYtD7wQGsclSImf51Vedtff
	TSGhDZSCh5bzjvAtHjhPL1hXUvcszTYUlvMfBQQ9yOViY5qpMCGp3ow+tgwWhdqzDvKr0neStBtPn
	4w73+Sj1zfG1RiCdWrznA4xlHAf0JWs6rcajV9rOK604CCoHus/XYupcBIDdUf3Sc6QOTFfA6V7VJ
	tPIurgfuNG2bWxEz6TBpJDmjJAvvfPTeT76Y3fe8nt58rbBqJyjcCggi7pyldHJkyMP6LAToQ3qXP
	F7Nh5LZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeED-000000067Ub-1zj7;
	Tue, 01 Jul 2025 16:53:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcND-00000005mnw-4BO1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58BE62379;
	Tue,  1 Jul 2025 07:54:00 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E5FD3F66E;
	Tue,  1 Jul 2025 07:54:13 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:36 +0100
Subject: [PATCH v2 11/28] coresight: Populate CPU ID into the
 coresight_device structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-11-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=13308;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=U5MRIOic6bYc6J+Dgu8lIhYsyHE2JHutR2wUNbwbYMM=;
 b=kgKdEi5/xtAi/Hcjb+SC0E1Af+28OLKdUGsKfj9gYzZ5JhdD2jjMx2XWCluF6LyxvefOG+rfn
 x2GoYIUzxISAHGxU3wVJy3L75YdMeJD1S5CcdmdJvx3+o9Mnj3uSSH5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075416_120652_31C214DA 
X-CRM114-Status: GOOD (  14.94  )
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

The coresight_desc structure is a temporary structure for passing the
information to the coresight_device structure during registration.

Introduces a new "cpu" field in both structures to store the CPU ID. For
components that are not CPU bound, set this field to -1.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 1 +
 drivers/hwtracing/coresight/coresight-core.c       | 1 +
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 1 +
 drivers/hwtracing/coresight/coresight-cti-core.c   | 1 +
 drivers/hwtracing/coresight/coresight-dummy.c      | 1 +
 drivers/hwtracing/coresight/coresight-etb10.c      | 1 +
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
 drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
 drivers/hwtracing/coresight/coresight-replicator.c | 1 +
 drivers/hwtracing/coresight/coresight-stm.c        | 1 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
 drivers/hwtracing/coresight/coresight-tpda.c       | 1 +
 drivers/hwtracing/coresight/coresight-tpdm.c       | 1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       | 1 +
 drivers/hwtracing/coresight/coresight-trbe.c       | 1 +
 drivers/hwtracing/coresight/ultrasoc-smb.c         | 1 +
 include/linux/coresight.h                          | 4 ++++
 18 files changed, 21 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 5058432233da1932f1965008fc1b98b560490414..266d1fc2f5a8c572d4a373dc42d752090aa60505 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -565,6 +565,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	catu_desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
 	catu_desc.ops = &catu_ops;
+	catu_desc.cpu = -1;
 
 	coresight_clear_self_claim_tag(&catu_desc.access);
 	drvdata->csdev = coresight_register(&catu_desc);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827552a5c97b6bdd05d22dec4994b22..1a4bde5d6cd8fcfdd43bcafb45aa4dc5f1dd2d34 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1334,6 +1334,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->ops = desc->ops;
 	csdev->access = desc->access;
 	csdev->orphan = true;
+	csdev->cpu = desc->cpu;
 
 	csdev->dev.type = &coresight_dev_type[desc->type];
 	csdev->dev.groups = desc->groups;
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db963310b5e77a095953c83a172cfc7c..f9aaf6f87445a17f7348e7c03bc524834f8e2f20 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -231,6 +231,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.cpu = -1;
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 8fb30dd73fd20ae613a45b1a467f457a046a9412..2c8bf5dbe8b8206c92ae5ea64a26c947ef5b9582 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -931,6 +931,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_desc.ops = &cti_ops;
 	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
+	cti_desc.cpu = drvdata->ctidev.cpu;
 
 	coresight_clear_self_claim_tag(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index aaa92b5081e3d2bb85d57f90ab68a1dc6a1f0dd8..63c14319ad923ba1444c5f5f9d76ca48e308e8e4 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -179,6 +179,7 @@ static int dummy_probe(struct platform_device *pdev)
 
 	desc.pdata = pdev->dev.platform_data;
 	desc.dev = &pdev->dev;
+	desc.dev = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index d5efb085b30d36b51ca591c1b595ef82481f5569..4d59e668d7f6189a4de23064a0a8146a09931b79 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -772,6 +772,7 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etb_groups;
+	desc.cpu = -1;
 
 	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 0f160f2f97344e6a96343cd8658f4f19806193e0..a316e380df263f95c818e8eac44398482847b841 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -892,6 +892,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etm_groups;
+	desc.cpu = drvdata->cpu;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 6ef1f2ea1a805b07bcac70b6034bab85cec604be..0a585d7e0ab873ea4568e3318b0526b77a2e65e7 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2059,6 +2059,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etmv4_groups;
+	desc.cpu = drvdata->cpu;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index b1922dbe9292b02c91ca5730998e59ecdb08fdc7..3cab9b305ea2cdb1fea3d7b63ddf491897039c18 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -273,6 +273,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	desc.ops = &funnel_cs_ops;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 06efd2b01a0f71620eac71166567d14655b58403..1154b7d222381a435f14e217d891377a9bb80a71 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -284,6 +284,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	desc.ops = &replicator_cs_ops;
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
+	desc.cpu = -1;
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index e45c6c7204b4491e0f879bc7d5d445aa1d3118be..93f4b4e70eaf1590eecefa5135eeefda0394259d 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -907,6 +907,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_stm_groups;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 88afb16bb6bec395ba535155228d176250f38625..ebfa93b9a86f3d9b90062bce41a052a63836b6c3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -868,6 +868,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	}
 	dev->platform_data = pdata;
 	desc.pdata = pdata;
+	desc.cpu = -1;
 
 	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 0633f04beb240b4415cf469b3296f52e0a5b1d05..0ed6b7712feef5e606c8d0aadf594ea8be36059c 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -321,6 +321,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = adev->dev.platform_data;
 	desc.dev = &adev->dev;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 7214e65097ec9ac69f6c7c9278bcd28d25945c9e..ec1e9a585f90a02f06db27d6dfb22091eb66cbd9 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1392,6 +1392,7 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.dev = &adev->dev;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	desc.groups = tpdm_attr_grps;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 3e01592884280819c16398cbb5e09cbaee5d3efb..b83be60a156034e05df52084aebc43897ebee34c 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -177,6 +177,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 	desc.ops = &tpiu_cs_ops;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 
 	if (!IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8267dd1a2130d37d9507791620ea7bc8cbcd675c..28450447693147b9afd207679832ac83e2a5848a 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1287,6 +1287,7 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
 	desc.ops = &arm_trbe_cs_ops;
 	desc.groups = arm_trbe_groups;
 	desc.dev = dev;
+	desc.cpu = cpu;
 	trbe_csdev = coresight_register(&desc);
 	if (IS_ERR(trbe_csdev))
 		goto cpu_clear;
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index 26cfc939e5bd810295a336f392ac282ccf316f9f..e5897767d9ae2c21ef39e9280dea211c110bd168 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -483,6 +483,7 @@ static int smb_register_sink(struct platform_device *pdev,
 		return -ENOMEM;
 	}
 	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	desc.cpu = -1;
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 5fd3d08824e5a91a197aa01daf0fc392392f3e55..4b15c67c200624fd46a258628dbff401bd1396d7 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -153,6 +153,7 @@ struct csdev_access {
  *		in the component's sysfs sub-directory.
  * @name:	name for the coresight device, also shown under sysfs.
  * @access:	Describe access to the device
+ * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
  */
 struct coresight_desc {
 	enum coresight_dev_type type;
@@ -163,6 +164,7 @@ struct coresight_desc {
 	const struct attribute_group **groups;
 	const char *name;
 	struct csdev_access access;
+	int cpu;
 };
 
 /**
@@ -261,6 +263,7 @@ struct coresight_trace_id_map {
  *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
  *		spinlock.
  * @orphan:	true if the component has connections that haven't been linked.
+ * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
  * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
  *		by writing a 1 to the 'enable_sink' file.  A sink can be
  *		activated but not yet enabled.  Enabling for a _sink_ happens
@@ -287,6 +290,7 @@ struct coresight_device {
 	atomic_t mode;
 	int refcnt;
 	bool orphan;
+	int cpu;
 	/* sink specific fields */
 	bool sysfs_sink_activated;
 	struct dev_ext_attribute *ea;

-- 
2.34.1


