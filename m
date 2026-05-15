Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374ADCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 19:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7ZgdVSrarspk5Marm9WbR2CB3bVvhe8wethSnJ0ixQ=; b=Ed14C86BnzzwdqQdlDs11VCOPl
	711le2yvkerjepFBSUyXLutVyOu7xghPbQyfpsr5DHDHVBkHf5hTfcJQJY9V+4lbRlS2BgZSaV5ur
	mHQZ3dH+G/UKRq7Y/Lz4vVYKVcP7Bp7t+k/4mOAPsze+2Qb98XyXeVBCCk8vJmzDcpUqtuQDdBtJ1
	1TPfh1q/tswBJ1h8nxCmWm7yYw3gjUt/oQcN9jntaxQUm3s/SP6srn6N0a4DGfLOwi1ZkUnnHsa20
	q4ENe2io8W7ZXfuN48L27RHRvO3YDItxr1I5vdrD8bENKaHoW/iBoay84yI9StLCXL8I8WK9J7Lnv
	ria6LzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxde-000000097mB-3ZA4;
	Fri, 15 May 2026 18:51:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxda-000000097jv-0znj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:51:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 237FF27D3;
	Fri, 15 May 2026 11:51:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BA723F836;
	Fri, 15 May 2026 11:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871113; bh=ygxqfqm6Py3roCBGHbWm4JPS8O0UtfR/lFDMPaXNusg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xxd59QtFeyaMAuKbEMkUY1UcU4Z5p5xWt8LrTCyGfR+xIBOukkvoPbDWFCSNFiCNJ
	 R9YesdutrWq4pg6v738hN9OGJUynQZ90njlqwWg9Ch1zA2Y7+Uz8pCeWxeLZ59+IAJ
	 vW6B6HUMoORBSKO8rdm6ZF6Mxijg0Y50jmFIeNLY=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:27 +0100
Subject: [PATCH v13 04/28] coresight: Populate CPU ID into coresight_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-4-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=7577;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ygxqfqm6Py3roCBGHbWm4JPS8O0UtfR/lFDMPaXNusg=;
 b=Udfj8AkLeFpX3VGff9iqsr23yOOj4YsH9s3QysVrpQ0HfpF6ek1apMu49UuhYgA4/4NS+c+r+
 UM9TOLlZBWYBVYxMbqpgrf1fYUasCuXh2Lz8zm0YzNKEQE64rLwT1xn
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115154_361623_93FFB349 
X-CRM114-Status: GOOD (  20.84  )
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

Add a new flag CORESIGHT_DESC_CPU_BOUND to indicate components that
are CPU bound.  Populate CPU ID into the coresight_device structure;
otherwise, set CPU ID to -1 for non CPU bound devices.

Use the {0} initializer to clear coresight_desc structures to avoid
uninitialized values.

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       |  2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 13 +++++++++++++
 drivers/hwtracing/coresight/coresight-cti-core.c   |  9 ++++++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  2 ++
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  2 ++
 drivers/hwtracing/coresight/coresight-trbe.c       |  2 ++
 include/linux/coresight.h                          |  8 ++++++++
 7 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ce71dcddfca2558eddd625de58a709b151f2e07e..43abe13995cf3c96e70dcf97856872d70f71345a 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -514,7 +514,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	int ret = 0;
 	u32 dma_mask;
 	struct catu_drvdata *drvdata;
-	struct coresight_desc catu_desc;
+	struct coresight_desc catu_desc = { 0 };
 	struct coresight_platform_data *pdata = NULL;
 	void __iomem *base;
 
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d5d18168b48125c91f556f3867f0719592f0ccc8..ffed314d1313518b1db1e702986edb0dfc6644d3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1350,6 +1350,19 @@ coresight_init_device(struct coresight_desc *desc)
 	csdev->access = desc->access;
 	csdev->orphan = true;
 
+	if (desc->flags & CORESIGHT_DESC_CPU_BOUND) {
+		csdev->cpu = desc->cpu;
+	} else {
+		/* A per-CPU source or sink must set CPU_BOUND flag */
+		if (coresight_is_percpu_source(csdev) ||
+		    coresight_is_percpu_sink(csdev)) {
+			kfree(csdev);
+			return ERR_PTR(-EINVAL);
+		}
+
+		csdev->cpu = -1;
+	}
+
 	csdev->dev.type = &coresight_dev_type[desc->type];
 	csdev->dev.groups = desc->groups;
 	csdev->dev.parent = desc->dev;
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 2f4c9362709a90b12a1aeb5016905b7d4474b912..b2c9a4db13b4e5554bca565c17ed299fdfdb30ff 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -659,7 +659,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	void __iomem *base;
 	struct device *dev = &adev->dev;
 	struct cti_drvdata *drvdata = NULL;
-	struct coresight_desc cti_desc;
+	struct coresight_desc cti_desc = { 0 };
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
 
@@ -702,11 +702,14 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	 * eCPU ID. System CTIs will have the name cti_sys<I> where I is an
 	 * index allocated by order of discovery.
 	 */
-	if (drvdata->ctidev.cpu >= 0)
+	if (drvdata->ctidev.cpu >= 0) {
+		cti_desc.cpu = drvdata->ctidev.cpu;
+		cti_desc.flags = CORESIGHT_DESC_CPU_BOUND;
 		cti_desc.name = devm_kasprintf(dev, GFP_KERNEL, "cti_cpu%d",
 					       drvdata->ctidev.cpu);
-	else
+	} else {
 		cti_desc.name = coresight_alloc_device_name("cti_sys", dev);
+	}
 	if (!cti_desc.name)
 		return -ENOMEM;
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index a547a6d2e0bde84748f753e5529d316c4f5e82e2..eb665db1a37d9970f7f55395c0aa23b98a7f3118 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -891,6 +891,8 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etm_groups;
+	desc.cpu = drvdata->cpu;
+	desc.flags = CORESIGHT_DESC_CPU_BOUND;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index a251375db24b17c22490a71f97308119b89a5975..8f270bfc74723f1fc1cead2da1725ab6b50f910e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2291,6 +2291,8 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etmv4_groups;
+	desc.cpu = drvdata->cpu;
+	desc.flags = CORESIGHT_DESC_CPU_BOUND;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 1511f8eb95afb5b4610b8fbdacc8b174b6b08530..14e35b9660d76e47619cc6026b94929b3bb3e02b 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1289,6 +1289,8 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
 	desc.ops = &arm_trbe_cs_ops;
 	desc.groups = arm_trbe_groups;
 	desc.dev = dev;
+	desc.cpu = cpu;
+	desc.flags = CORESIGHT_DESC_CPU_BOUND;
 	trbe_csdev = coresight_register(&desc);
 	if (IS_ERR(trbe_csdev))
 		goto cpu_clear;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2131febebee93d609df1aea8534a10898b600be2..687190ca11ddeaa83193caa3903a480bac3060d1 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -141,6 +141,8 @@ struct csdev_access {
 		.base		= (_addr),	\
 	})
 
+#define CORESIGHT_DESC_CPU_BOUND	BIT(0)
+
 /**
  * struct coresight_desc - description of a component required from drivers
  * @type:	as defined by @coresight_dev_type.
@@ -153,6 +155,8 @@ struct csdev_access {
  *		in the component's sysfs sub-directory.
  * @name:	name for the coresight device, also shown under sysfs.
  * @access:	Describe access to the device
+ * @flags:	The descritpion flags.
+ * @cpu:	The CPU this component is affined to.
  */
 struct coresight_desc {
 	enum coresight_dev_type type;
@@ -163,6 +167,8 @@ struct coresight_desc {
 	const struct attribute_group **groups;
 	const char *name;
 	struct csdev_access access;
+	u32 flags;
+	int cpu;
 };
 
 /**
@@ -260,6 +266,7 @@ struct coresight_trace_id_map {
  *		device's spinlock when the coresight_mutex held and mode ==
  *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
  *		spinlock.
+ * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
  * @orphan:	true if the component has connections that haven't been linked.
  * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
  *		by writing a 1 to the 'enable_sink' file.  A sink can be
@@ -286,6 +293,7 @@ struct coresight_device {
 	struct device dev;
 	atomic_t mode;
 	int refcnt;
+	int cpu;
 	bool orphan;
 	/* sink specific fields */
 	bool sysfs_sink_activated;

-- 
2.34.1


