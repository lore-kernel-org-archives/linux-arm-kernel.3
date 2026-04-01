Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D9110F9313
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDT9YyzadrAK77QEKuKo/Xe1ni28vixHZOGwkrJcGp0=; b=tuwN93jXbXODcuRmeNO3kBpDFl
	qR2QPPn8jNUI1Iot4cPm6ydKIuA6JmhD+4fw/qUX2r+kK+lpihMMvFmTZGR2YF85TF0SfvQY9vZhE
	YmkfVxYott9ZyeChcpzaH5+j6hDxs99Xvbm3uVjyrxCbTbEYgMNdMc/WNJ9Rs/HheRJ4DQzjarYhl
	Ndab/UqkBiaXK6yeO7qvSPeIRUPy9iJTSUYay8Bk5g5NckCDoiA651j/hv12H1gIbiSyXJVAfuDaU
	NLG//JFxJEmaXmn0wsv0atnfUUccITxl+xJ2CSi0h43yf1flByxQkJgn2aRnk2CPW2DngheRZn3bE
	rXPaFobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx0-0000000FuVx-1B7n;
	Wed, 01 Apr 2026 18:05:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zwv-0000000FuUL-41QG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 18:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eDT9YyzadrAK77QEKuKo/Xe1ni28vixHZOGwkrJcGp0=; b=EXsspOuVL5kX0OvFyPZBkC94sG
	OT3OU+ISRQ34mpEdeymYRdNI8aH6+rTO60mrw2+DrjJ520ijcKJXrCNd0N7QUKCOE9gY1X93wWRnZ
	xkFYyQAm61W+Zk/aVTWVRANGUY0iJPof76K1oWy0AMAN1FX8CWEUo/M9M/qaSaZV+VBdNEnguD8IL
	Xk29XDYPMaFp5WUbTeDeQ79PtyATQCs4+Sb6ipZ+/kwXX8J6w1SHxsF9PGX+IDJaqVfAXJ+CbXfaS
	U8mvZ4ZT2dbsZXzqDyWbJP6zE/JQbSrWK6slms11DrywPJplOX6pXxnoUWIiZc4ZeCrS9VsWXu+87
	72wZAS0A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zws-000000014Uu-2jMI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:05:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A649A31DB;
	Wed,  1 Apr 2026 11:05:43 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EFEE3F7D8;
	Wed,  1 Apr 2026 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066749; bh=wuIOb+cDh234533My52vyK95qdFsi1W9Ip5I1aRd3tM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bLUqI2MC7pP0GsXfCoT5QveqvxSEVPULPzustS/HXXew0bdNdcBCoqsXvLXZU9OTt
	 /2AJkbhAY3dOUXkqLuBG6/5X25G0YOLaExgXL3WL/xqNZ2IAK9nFNT20iQDs/6WBvQ
	 WXKTExsqVLUt2YGr1a/w8M0HsJMyLUXVJzi+mVfU=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:31 +0100
Subject: [PATCH v9 02/20] coresight: Populate CPU ID into coresight_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-2-091d73e44072@arm.com>
References: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
In-Reply-To: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=7382;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=wuIOb+cDh234533My52vyK95qdFsi1W9Ip5I1aRd3tM=;
 b=MaeguSUadKJo1jYug11oxUripsdNE1iWcA0L7gXtg4qcyRRPGGP8nEhu7FfFkaOE8nEl1l8a3
 xlQw4gzw8neAsipMDGCU++P0ttmxP2aI/4+VoO3FNXGSgHDyhfmIWt3
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_190551_104545_239573EC 
X-CRM114-Status: GOOD (  20.86  )
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
index 5452de9367d450de399a2107016c3fddb894fc82..89911fc27128b2bb78c8ba704f2af5a5d4efe83c 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1338,6 +1338,19 @@ coresight_init_device(struct coresight_desc *desc)
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
index d565a73f0042e3e0b21fcf9cb94009cc25834d3d..b1e0254a534027d7ede8591e56be28745d0b9974 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2260,6 +2260,8 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
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


