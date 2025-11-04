Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A18CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/suxWt8zKEBcaByEUedxG3Jk+yz7Nh/6jrGKe+eIgA=; b=qMYyhvm4y0bIQ56CjQ1n1ftcZL
	x9MDpVsrtNBJaXu/waEUxDfmK634TQVC2/9jk1jpe68BIxwbyFEm7UmDusn37hbEflrQrJdBHFyx+
	UZ6duRvtMfHQyXglSzlE5eZPiNF+JaM8DNr+rXV5zUMoOqScDF7Gd5EiMcBSWI8GJemnFdninwA5Y
	Z6RubscjWXDy+PqaKV1J9uxpizLXbTLjDuxMkPvLAGNBQJNrB7SEG5sfGK8Vh6dPwjVipkrZTC82t
	aKxBurw5i81c5xLhH/mQTjnYO7q5sJOiKLiMWaYDV/GRxlN6Tr6URm681uG7aRYpBlmRkPwPmjfZh
	nW7sDt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrn-0000000C3xr-1HAY;
	Tue, 04 Nov 2025 15:22:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIrk-0000000C3w4-0KRJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 968052C41;
	Tue,  4 Nov 2025 07:22:26 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EF6B3F66E;
	Tue,  4 Nov 2025 07:22:32 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:45 +0000
Subject: [PATCH v4 01/15] coresight: sysfs: Validate CPU online status for
 per-CPU sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-1-3d4bba674709@arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=14931;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=q79BJP2mMWX6qpE5+zsMSvxoqA8RHLMe9NbzjyQq3nU=;
 b=apIEzcI34GqZ2WDnpnQG72CQUDqPAcBMMGU1sf4QheqoMitEy5vTic1ZpOMk5cAzkhYXgijzv
 2fK9KS9xxZQAyMeqpTyjAwHDmUSwZxPxfAz1AbPB9TOf15okFesMtPR
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072236_222383_199194FF 
X-CRM114-Status: GOOD (  15.37  )
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
index a3ccb7034ae14d7339bc2549bccadf11e28c45e2..2685e3a883b1f8067de643519b5fc91153123c57 100644
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
index 3267192f0c1c667b0570b9100c3c449064e7fb5e..db325dff884d21cc8d93f32bfe3be5c0491ffc8d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1336,6 +1336,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->ops = desc->ops;
 	csdev->access = desc->access;
 	csdev->orphan = true;
+	csdev->cpu = desc->cpu;
 
 	csdev->dev.type = &coresight_dev_type[desc->type];
 	csdev->dev.groups = desc->groups;
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c586495e9a088a63cec481a82fd9f4ec7c645160..05497a5114785397a98e408466df0b937c87ab61 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -231,6 +231,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.cpu = -1;
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
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
index aaa92b5081e3d2bb85d57f90ab68a1dc6a1f0dd8..653d37cd0bd12a57c78e2615f839e0d8af25d7f0 100644
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
index 35db1b6093d154d67dc567df42f838e2ba3d1d58..8e0bbffdf36215fe82c89a34767e425e03f4a744 100644
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
index d7da5f3b97b3b18d5d6eee0c20a3bdca0c4bec1a..15bf825a346826cd534ef3cd4f41c885c66321da 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2053,6 +2053,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
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
index 5e52324aa9ac7b3de9379bc3f2b349a2cdea83c2..cb02f1bfaf068ec3f50f997bcb94f7d5215ccea8 100644
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
index 333b3cb236859f0feb1498f4ab81037c772143fd..6739deda402ed5024e17add349314d6db793dd13 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -324,6 +324,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
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
index 9463afdbda8ad74eee78c72185fe7603f81b7888..3ade05e268e31dd2572b84e91f9448fcf317f2ab 100644
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
index 43643d2c5bdd0ac432f976dbe666ff0f494033ee..3c82ab4394fde1e3dd4371a9b1703da4d8f6db9d 100644
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
index 3e5e5acd0c7fcde7d312d440da4355faaf682c7b..222597ec7a089e10ad763df206917e90f34bb5c2 100644
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


