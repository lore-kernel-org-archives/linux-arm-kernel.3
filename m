Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20675CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 12:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/t/+tvOcn+brl0Cl6+ieJ2G1mrH7B9eFfBXb6639YFo=; b=fwqiUi2Ya8NMtR7jiE6lRseOso
	Lef02hD2f5knmYEvWHPGVOgwEDqf4A7V0LSyrLSrx8iBn5xkatDD903on4SeyCjmMv6yl5xgHXTyK
	gbxvXXZatph1j9qmsbmAMuyKE+cc2gVDC5EVeYWmZZ8F8+bxkk9LR5X6kdKxf7cTY8rjSfQBYjfyY
	19Yj2QIfUXkq/e9qddC1CDCab5RpEsqK7jzqdjp4n0C3xqz/SsHSKSNarcH3MN3Q1NOlMp5LmetRi
	7tkyHqsJT1hAYteaG6sICKkZXCe9ue+6p2sLh5FWMNy5l3v8s3vKT8wj9lYCpHysawA3zwywkFCZZ
	e7DqspfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXh-0000000DEpv-1r2l;
	Mon, 11 May 2026 11:11:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXd-0000000DEmy-0n3g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ECF91756;
	Mon, 11 May 2026 04:11:10 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07A4B3F85F;
	Mon, 11 May 2026 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497875; bh=mhA0zZqZ1fI2qEpcfgOaVFWTPwxOf0mph5W1c/E0TIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kXWbhZqk96qmQj45i9o7DeGtZC1+jjNEZfrDnxt6Cipq0jLX3rcfAJBoEg660mW1k
	 uxzz/fZAfDFpaU/k/BqfspQ32vwf74zeM+TN/RAef5wg3NIIyRivA+2Rh1BTPaYq0h
	 dgbiqipXuVAB5hnK7ILtBlEXjb9OniatHUdTdV5o=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:48 +0100
Subject: [PATCH v12 04/28] coresight: Populate CPU ID into coresight_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-4-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=7577;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=mhA0zZqZ1fI2qEpcfgOaVFWTPwxOf0mph5W1c/E0TIo=;
 b=jdcbGS+ewMtBl7n9QKONSLzz8Xp2K63UW/A1rSM+VOhGRoJlF/wKeJQAYWYNG53wPS5LNl41j
 9LPqc+4tiY6DYHnPxYTfd206Hj3MmkK0D6xSdcVS8EPnJQEz5/W+YmY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041118_619770_6C50FE3C 
X-CRM114-Status: GOOD (  20.59  )
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
index 48ea882bd10870a6be253ecf0b58860d7a4a0bb0..f8c0c2b05888403318372dc76278910c8a5c7e15 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1347,6 +1347,19 @@ coresight_init_device(struct coresight_desc *desc)
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


