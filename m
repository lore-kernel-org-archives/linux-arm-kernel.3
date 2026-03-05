Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68C0F30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QaPGYzKQUu5wFlVK1DuvHnFx34b+ezCgVF0eGZrQXk=; b=ElOOY/nE6+HpELI9cFpiqGtDI/
	Pz3OEhtYFPoJng9uo2hxnl6gscGPXNy3r7eVycrA9JH/FNKRlMZvf5f3IF6iSCnco/Z54iHh57p5O
	Ko8Hi9q6XL3AhL457kPgArXHXDBNfoNeTWiEebXIZ66Oxr8itmGewKng4zex8tp5zXFgXk0htfB5f
	3OvS7m18F2+i68dOA1eTca0cTEYwHQZVPK1QnkAD1n44jvNYRhS3Jq0u3AcZQ6+eBlSh9DaSUEGwX
	4emjn23WPwyMqHrKL/x9c13KCekAMGwPwQPHMdcy07m4B1o5UMgZ7NUDEV4yWR7nj3rte2H5HukWi
	hJcBRHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mE-00000001XiZ-0cPP;
	Thu, 05 Mar 2026 10:17:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mC-00000001XgR-04Jp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:17:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68DA2497;
	Thu,  5 Mar 2026 02:17:42 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A970E3F694;
	Thu,  5 Mar 2026 02:17:46 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:32 +0000
Subject: [PATCH v6 01/19] coresight: sysfs: Validate CPU online status for
 per-CPU sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-1-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=14903;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=VZUG/REwOWxiMb0AT9LbNPj9iboU/oA+6WqHWRUo5tQ=;
 b=z/4/XWrYMaF4vtaaIuCfve5VvewxoZv4Q1C1gO2NHKbKOol6KUHTGs/aU94a+GcTfj7L55aYa
 Ys9L35jCHfeAlnXZ7bOudORoJgCZeHNirCgvr6jjStulvC9GWZ8JPdR
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021752_140874_98D6C856 
X-CRM114-Status: GOOD (  15.98  )
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
index ce71dcddfca2558eddd625de58a709b151f2e07e..8f22f12e260787335cb71b06ba7c8aeccf603fc8 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -573,6 +573,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	catu_desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
 	catu_desc.ops = &catu_ops;
+	catu_desc.cpu = -1;
 
 	coresight_clear_self_claim_tag(&catu_desc.access);
 	drvdata->csdev = coresight_register(&catu_desc);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf64a97b9353b84ba5b76b991676f5f..f191a0fe802ac6ae1342872e01fff463775c8a20 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1341,6 +1341,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->ops = desc->ops;
 	csdev->access = desc->access;
 	csdev->orphan = true;
+	csdev->cpu = desc->cpu;
 
 	csdev->dev.type = &coresight_dev_type[desc->type];
 	csdev->dev.groups = desc->groups;
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01e6d1facb07a1f85623250535ed9c..58113cc1add3fd37afec1b5bc11eb26c0f95b339 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -226,6 +226,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.cpu = -1;
 	raw_spin_lock_init(&drvdata->spin_lock);
 
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 2f4c9362709a90b12a1aeb5016905b7d4474b912..5f4ff84f20912a3f8405448d028c742a7c860d26 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -725,6 +725,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_desc.ops = &cti_ops;
 	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
+	cti_desc.cpu = drvdata->ctidev.cpu;
 
 	coresight_clear_self_claim_tag(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index c176a2f57300fd8cd5d153be5ccb6faaef96023d..788fb28c74a901382a28326ba230455125a471ee 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -176,6 +176,7 @@ static int dummy_probe(struct platform_device *pdev)
 
 	desc.pdata = pdev->dev.platform_data;
 	desc.dev = &pdev->dev;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index b952a1d47f12f44c15cc845914691305713028c4..b8df9e3c93df167dabd39d90b6f9491def0f6b90 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -768,6 +768,7 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etb_groups;
+	desc.cpu = -1;
 
 	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index a547a6d2e0bde84748f753e5529d316c4f5e82e2..2e9e824309bdab5c2983ed1a3e61b27c9d822278 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -891,6 +891,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etm_groups;
+	desc.cpu = drvdata->cpu;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d565a73f0042e3e0b21fcf9cb94009cc25834d3d..add4cc9c1eca42b58d8f9d7bb3dc8d2ea1241ee2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2260,6 +2260,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etmv4_groups;
+	desc.cpu = drvdata->cpu;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3f56ceccd8c9f6deaaf783a06a0d19fb06eff7c4..c281c36a84015a73023ba9db2eae29ce13c6e880 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -261,6 +261,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	desc.ops = &funnel_cs_ops;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 07fc04f53b88fdec7ae18d3000046fe74c0cec9d..e947e8f0e8c4bfc4d85da385663ea3805a9b1df1 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -271,6 +271,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	desc.ops = &replicator_cs_ops;
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
+	desc.cpu = -1;
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index aca6cec7885a551ad5960986b1cdf08baa6b5a94..d60fdec640c760c4648ece8d28636936a1b9fb9b 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -899,6 +899,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
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
index c89fe996af23194c7e59432ce39ce20bb65937cf..5af06ae8b44d0e53a479822f25ab58e692a9696b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -863,6 +863,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	}
 	dev->platform_data = pdata;
 	desc.pdata = pdata;
+	desc.cpu = -1;
 
 	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 96a25877b8240f20921efa979a361eb473c05600..c8530c625c0b04699e82b602e556718717a239f7 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -226,6 +226,8 @@ static int _tnoc_probe(struct device *dev, struct resource *res)
 	desc.dev = dev;
 	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
 	desc.groups = coresight_tnoc_groups;
+	desc.cpu = -1;
+
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		if (drvdata->atid > 0)
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 89c8f71f0aff06e87971976efb23feb0057fcce6..b96dfc697b1d881b853839dce196e3024f489fc3 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -593,6 +593,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.dev = &adev->dev;
 	desc.groups = tpda_attr_grps;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index da77bdaad0a4519bd4e0653cc92e2a333e59e60d..b61cc260ec0b043a96772a47ca0dd536ef12e290 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1423,6 +1423,7 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.cpu = -1;
 	if (res)
 		desc.groups = tpdm_attr_grps;
 	drvdata->csdev = coresight_register(&desc);
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index b8560b140e0fa4bf8bf1e5c60fe67077b11798fd..a5254f36820b9e75047241d8690ff39b0f62b143 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -169,6 +169,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 	desc.ops = &tpiu_cs_ops;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.cpu = -1;
 	drvdata->csdev = coresight_register(&desc);
 
 	if (!IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 1511f8eb95afb5b4610b8fbdacc8b174b6b08530..fc6e3551b7002634bcf6a154080a142dfe32c890 100644
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
index 5776f63468fa05df255d3dd716f621c37424c048..5217a9930e2632a40ba0523438052872cea62aea 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -482,6 +482,7 @@ static int smb_register_sink(struct platform_device *pdev,
 		return -ENOMEM;
 	}
 	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	desc.cpu = -1;
 
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2131febebee93d609df1aea8534a10898b600be2..6810acc8533e0eb0c5d41a7fbe0bbd03eb94057d 100644
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


