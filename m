Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79AFCF394B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSpbaXUaqWLiqfy+NfaAGGWJjeAn2wbHlUnGa/ywEb0=; b=m7rASL3tCiQBTuzeVe2gHf8LWE
	oKLt78jwZaTwzbYmsE8lqUi71DvaDyf6+Cs4Z4EPJbdWsKCAZxl4ySXvDpQ8ZTY9ztmDSO7HC6WGN
	KTOXyX5zVeZh2Mgy2hsXqEhy6irbdC9+2tu97GOBpu1YoeqWIbmJ6r9a6ACZHNfG4xtPOa6KAIvdL
	vjIVlhITCAC3vUVKyEQLjAuoeCCiPkk2+03pWj84JehqIOKQER+6nJEQmBU1axlVcDho9Vco55DPt
	+RACHrrb3u9WiMiQWxfiRvO2kNiKB2I1tBH4SM7BV64q+JiBlNL+XhRubiQLrcI08x+Nz8fbXqs9i
	f6Z+Wcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR7-00000003Yok-3bK8;
	Wed, 19 Nov 2025 15:49:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkQy-00000003Yj4-3LmE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADA7C12FC;
	Wed, 19 Nov 2025 07:49:19 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 879C33F66E;
	Wed, 19 Nov 2025 07:49:25 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 19 Nov 2025 15:48:59 +0000
Subject: [PATCH v5 01/19] coresight: sysfs: Validate CPU online status for
 per-CPU sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-1-f615a301ad0b@arm.com>
References: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
In-Reply-To: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=14945;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=vHNzAhNX71mFqIsrswY5WTXBwRgOICqKEck/V0Uhpx4=;
 b=tsMF/Lf5atm3ZaKTwi14RjD5VobaNJyIinOCJ9mZitKwcctcMPU4/+NqnePHvwBXgeEG6/yNi
 My/lclPwVdLC4s6uyuZv2/n7cftNlUzQHJ3c93or6jBq60yEyqeFxSh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074928_939009_9AA26828 
X-CRM114-Status: GOOD (  15.11  )
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

The current SysFS flow first enables the links and sink, then rolls back
to disable them if the source fails to enable. This failure can occur if
the associated CPU is offline, which causes the SMP call to fail.

Populate CPU ID into the coresight_device structure, for components that
are not CPU bound, set this field to -1.

Validate whether the associated CPU is online for a per-CPU tracer. If
the CPU is offline, return -ENODEV and bail out.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
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
 drivers/hwtracing/coresight/coresight-sysfs.c      | 3 +++
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 2 ++
 drivers/hwtracing/coresight/coresight-tpda.c       | 1 +
 drivers/hwtracing/coresight/coresight-tpdm.c       | 1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       | 1 +
 drivers/hwtracing/coresight/coresight-trbe.c       | 1 +
 drivers/hwtracing/coresight/ultrasoc-smb.c         | 1 +
 include/linux/coresight.h                          | 4 ++++
 20 files changed, 26 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 69b36bae97ab488197f23e6eafe3729ca22445d4..3373ddbfcc9fde7d87034b9f98d66572edb4f31a 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -575,6 +575,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	catu_desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
 	catu_desc.ops = &catu_ops;
+	catu_desc.cpu = -1;
 
 	coresight_clear_self_claim_tag(&catu_desc.access);
 	drvdata->csdev = coresight_register(&catu_desc);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c660cf8adb1c7cafff8f85e501f056e4e151e372..0c48f5c85db6a7ec0377335eaa734527959d57c4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1340,6 +1340,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->ops = desc->ops;
 	csdev->access = desc->access;
 	csdev->orphan = true;
+	csdev->cpu = desc->cpu;
 
 	csdev->dev.type = &coresight_dev_type[desc->type];
 	csdev->dev.groups = desc->groups;
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index abed15eb72b4acb0d6eb743616afe1b414f1f639..9677f43e77830681b9487d47c06c30b43aeff460 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -228,6 +228,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.cpu = -1;
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index bfbc365bb2ef2744efab11c056b8450472957005..7b04e982342c64562a5d42654279d998b4f4c45c 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -932,6 +932,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_desc.ops = &cti_ops;
 	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
+	cti_desc.cpu = drvdata->ctidev.cpu;
 
 	coresight_clear_self_claim_tag(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index 14322c99e29d4696bc27ac2326280026412fe05f..b9a553561437f5bc880a4b1602e34293d083c952 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -179,6 +179,7 @@ static int dummy_probe(struct platform_device *pdev)
 
 	desc.pdata = pdev->dev.platform_data;
 	desc.dev = &pdev->dev;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 6657602d8f2e1b75ea6a8440e35c489d21f4245e..84951468db8bfbcbcf05d21cb1e91bf2603372a6 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -770,6 +770,7 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etb_groups;
+	desc.cpu = -1;
 
 	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index a5e809589d3e382acde24ee457e94e5dcb18ea35..42115c4697d77d5dd86dc01a4da6b7ea076d4558 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -886,6 +886,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etm_groups;
+	desc.cpu = drvdata->cpu;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 560975b70474c3449aa6799fc1a8e05d5ea93495..a3158223de78866f9a7f8180922cf8e7995d048b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2231,6 +2231,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etmv4_groups;
+	desc.cpu = drvdata->cpu;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3b248e54471a38f501777fe162fea850d1c851b3..457291bb24212c502de9aadecb41da218c733c2f 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -263,6 +263,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	desc.ops = &funnel_cs_ops;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e6472658235dc479cec91ac18f3737f76f8c74f0..38518ba862928ea904c953c8303559e349e45200 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -273,6 +273,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	desc.ops = &replicator_cs_ops;
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
+	desc.cpu = -1;
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index e68529bf89c9815a8118955bf3114ad1ed4fb346..e2197ae0a7c8412785ce8b1161311048cbaa3f58 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -901,6 +901,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_stm_groups;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index d2a6ed8bcc74d64dccc735463f14790b4e80d101..7c7d3a3cb9f18a9dfa78eb5c19dda43fa6656271 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -162,6 +162,9 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
 		return -EINVAL;
 	}
 
+	if (coresight_is_percpu_source(csdev) && !cpu_online(csdev->cpu))
+		return -ENODEV;
+
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6203e871fdcb8de569cc6701c52bb..bd783c9dcb56afa0adfa9724e45fcd0c4cfe367b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -868,6 +868,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	}
 	dev->platform_data = pdata;
 	desc.pdata = pdata;
+	desc.cpu = -1;
 
 	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index ff9a0a9cfe96e5f5e3077c750ea2f890cdd50d94..b310f832506db5cd9f2134ff66909f64d4c785ce 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -199,6 +199,8 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.dev = &adev->dev;
 	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
 	desc.groups = coresight_tnoc_groups;
+	desc.cpu = -1;
+
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		coresight_trace_id_put_system_id(drvdata->atid);
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 3a3825d27f861585ca1d847929747f8096004089..430e4c451479443a6cff4f6940e6b0c66ce8806d 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -317,6 +317,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = adev->dev.platform_data;
 	desc.dev = &adev->dev;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 06e0a905a67d7aa36625960711c28717b1d27fda..bb813970c3aaa2e9220e45fd37af0a286f74a74a 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1425,6 +1425,7 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.cpu = -1;
 	if (res)
 		desc.groups = tpdm_attr_grps;
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index aaa44bc521c330f5b2e385279e0cbda6ce72bccb..d83d5bf4cf0f30ccee150b2635dacee3dcf0d24c 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -171,6 +171,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 	desc.ops = &tpiu_cs_ops;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 
 	if (!IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 293715b4ff0eb0abe30f9b477700ca94f81cd4a2..f3e3a39a792f51876f230774658935f031a36169 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1289,6 +1289,7 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
 	desc.ops = &arm_trbe_cs_ops;
 	desc.groups = arm_trbe_groups;
 	desc.dev = dev;
+	desc.cpu = cpu;
 	trbe_csdev = coresight_register(&desc);
 	if (IS_ERR(trbe_csdev))
 		goto cpu_clear;
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index 8f7922a5e534fde57ae4c84f2e72b33749809857..61044bdb3bf785d8938eb3b124072c856bdc2c59 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -484,6 +484,7 @@ static int smb_register_sink(struct platform_device *pdev,
 		return -ENOMEM;
 	}
 	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	desc.cpu = -1;
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2b48be97fcd0d7ea2692206692bd33f35ba4ec79..fcea4f3253671e371570c29a65ef8ec96034f249 100644
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


