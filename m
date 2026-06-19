Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3B2CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C6kudj9PMkze5m5TuT0nvcCHYgok1xy7sfZagitJIo=; b=U5KRpGszxxoH5kFQyatgmgjWrp
	C44awng3YbKUoaePMyy/O4TcxPYifV/iELqWTuD2v7yYDIa2j2jztl6+N8QsWYQyUDFqovGeloBbz
	usYon0Jc7b8xrDRpSL6N67TaRGPparTc4fvEOuARAvKxdT9Ld6qmBfwPidJWl6fa3HLyi2p1bBTax
	3dj5F0eH5dWBIOuHtyxEk06+uwAO91dBYXcpQsRpipImFOe7w8rr2ly+9slXrG85N6oUEyES2DVsP
	AOQTPq5hqOrr9/nWYpx77kvLBwy4s1thYfVU5EGALyLP+317vgJ8lb8v9GS0T5ZlqMuo4ytRMqLWb
	osqYorRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabfM-00000002kGz-0Ybt;
	Fri, 19 Jun 2026 16:02:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabfJ-00000002kFr-3GMz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 16:01:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F96E3297;
	Fri, 19 Jun 2026 09:01:50 -0700 (PDT)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3ABCB3F763;
	Fri, 19 Jun 2026 09:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781884914; bh=9+RcqmvkilS9tM+XPseU2iKvTax/zx9A1ruU1wUhN/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ws2hVh06DD5P59ySe+uBkD4g35a0c4PL5jCF/6CHHAo+R87KytdmrahBaXZ9SEL9R
	 pnPNunuAIDxEkQZTFWYliee7mzkWqn7TEoiRpSLun+WUBZ223Vo511MYOH8xVdZbaK
	 CZj6iFvCHMkoVETIJFXeSj+gr3Wxi4UsYUh8KxMM=
From: Mike Leach <mike.leach@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@arm.com>
Subject: [PATCH v3 1/1] coresight: fix issue where coresight component has no claimtags
Date: Fri, 19 Jun 2026 17:01:48 +0100
Message-ID: <20260619160148.499223-2-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619160148.499223-1-mike.leach@arm.com>
References: <20260619160148.499223-1-mike.leach@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_090157_899868_831E0965 
X-CRM114-Status: GOOD (  27.30  )
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

Coresight components have 0 to 8 claim tag bits. ARM recommends 4 and
the implemented claim tag protocol uses two of these.

If a component has insufficient claim tags then the protocol incorrectly
returns an error when attempting to claim a component.

Fix by introducing a claim tag init function that will read CLAIMSET
to establish then actual number of claim tags and save a claim tag info
flag to indicate the level of support in the device.

Additionally this init routine will also clear down any stale self claim
tag bits that are present in the hardware - removing the need for the
additional interface that was added to accomplish this during device probe.

Any device which is not verified to support claim tags, will now get a
success return from the claim/disclaim calls.

Device drivers can also force skipping of claim tag support checks where
hardware does not support any readable registers at the claim tag
location.

Signed-off-by: Mike Leach <mike.leach@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c  |   6 +-
 drivers/hwtracing/coresight/coresight-core.c  | 139 ++++++++++++++++--
 .../hwtracing/coresight/coresight-cti-core.c  |   7 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   9 +-
 .../coresight/coresight-etm3x-core.c          |   8 +-
 .../coresight/coresight-etm4x-core.c          |   8 +-
 .../hwtracing/coresight/coresight-funnel.c    |   7 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   7 +
 .../coresight/coresight-replicator.c          |   9 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |   7 +-
 include/linux/coresight.h                     |  23 ++-
 11 files changed, 205 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 43abe13995cf..d8a0ecc502af 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -574,10 +574,14 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
 	catu_desc.ops = &catu_ops;
 
-	coresight_clear_self_claim_tag(&catu_desc.access);
 	drvdata->csdev = coresight_register(&catu_desc);
 	if (IS_ERR(drvdata->csdev))
 		ret = PTR_ERR(drvdata->csdev);
+
+	ret = coresight_init_claim_tags(drvdata->csdev);
+	if (ret)
+		coresight_unregister(drvdata->csdev);
+
 out:
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f7b1308a759c..b110d1b977d1 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -232,6 +232,34 @@ coresight_find_out_connection(struct coresight_device *csdev,
 	return ERR_PTR(-ENODEV);
 }
 
+/*
+ * Reading CLAIMSET returns a bitfield representing the number of claim tags
+ * implemented from bit 0 to bit nTag-1, valid bits set to 1.
+ *
+ * Claim protocol requires 2 bits so test for MS bit required,
+ * bit 1 -  CORESIGHT_CLAIM_SELF_HOSTED
+ *
+ * return true if sufficient claim tags implemented for protocol
+ */
+static bool coresight_claim_tags_implemented_unlocked(struct csdev_access *csa)
+{
+	u32 claim_bits_impl = FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
+			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
+	return ((claim_bits_impl & CORESIGHT_CLAIM_SELF_HOSTED) != 0);
+}
+
+/* helper for checking if claim tag protocol in use */
+static bool coresight_using_claim_tag_protocol(struct coresight_device *csdev)
+{
+	return (bool)(csdev->claim_tag_info == CS_CLAIM_TAG_STD_PROTOCOL);
+}
+
+/* helper to check initialised */
+static bool coresight_claim_tag_noinit(struct coresight_device *csdev)
+{
+	return (bool)(csdev->claim_tag_info == CS_CLAIM_TAG_UNKNOWN);
+}
+
 static u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
 {
 	return FIELD_GET(CORESIGHT_CLAIM_MASK,
@@ -245,23 +273,97 @@ static void coresight_set_self_claim_tag_unlocked(struct coresight_device *csdev
 	isb();
 }
 
-void coresight_clear_self_claim_tag(struct csdev_access *csa)
+static void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
+{
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
+				     CORESIGHT_CLAIMCLR);
+	isb();
+}
+
+/*
+ * Initialise claim tag protocol.
+ *
+ * Check for existence of claim tags and clear down any stale
+ * existing self claim tag.
+ *
+ * Set claim tag protocol usage flag.
+ *
+ * Automatically unlocks/relocks memory mapped devices.
+ *
+ * Call during device probe.
+ */
+int coresight_init_claim_tags(struct coresight_device *csdev)
 {
+	struct csdev_access *csa;
+
+	if (WARN_ON(!csdev))
+		return -EINVAL;
+
+	/* if previous init or forced ignore claim tag,  no checks needed */
+	if (csdev->claim_tag_info != CS_CLAIM_TAG_UNKNOWN) {
+		if (csdev->claim_tag_info == CS_CLAIM_TAG_IGNORE)
+			dev_dbg(&csdev->dev,
+				"Device set to ignore claim tag protocols\n");
+		return 0;
+	}
+
+	/* get the access method */
+	csa = &csdev->access;
+
+	/* unlock if memory access */
 	if (csa->io_mem)
 		CS_UNLOCK(csa->base);
-	coresight_clear_self_claim_tag_unlocked(csa);
+
+	/* check claim tag validity */
+	if (coresight_claim_tags_implemented_unlocked(csa)) {
+		csdev->claim_tag_info = CS_CLAIM_TAG_STD_PROTOCOL;
+		dev_dbg(&csdev->dev, "Device using standard claim tag protocol\n");
+
+		/* using claim tags so clear down any stale self claim tag */
+		coresight_clear_self_claim_tag_unlocked(csa);
+	} else {
+		csdev->claim_tag_info = CS_CLAIM_TAG_NOT_IMPL;
+		dev_dbg(&csdev->dev, "Device claim tag hardware not implemented\n");
+	}
+
+	/* relock if memory access */
 	if (csa->io_mem)
 		CS_LOCK(csa->base);
+
+	/* return success - caller can check claim_tag_info for state */
+	return 0;
 }
-EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
+EXPORT_SYMBOL_GPL(coresight_init_claim_tags);
+
+struct cs_claim_tag_init_arg {
+	struct coresight_device *csdev;
+	int rc;
+};
 
-void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
+static void coresight_init_claim_tags_smp_call(void *info)
 {
-	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
-				     CORESIGHT_CLAIMCLR);
-	isb();
+	struct cs_claim_tag_init_arg *arg = info;
+
+	arg->rc = coresight_init_claim_tags(arg->csdev);
 }
-EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
+
+/* cpu bound devices (etms) may need to run on bound cpu */
+int coresight_init_claim_tags_cpu_smp(struct coresight_device *csdev, int cpu)
+{
+	int ret = 0;
+	struct cs_claim_tag_init_arg arg = { };
+
+	arg.csdev = csdev;
+	ret = smp_call_function_single(cpu,
+				       coresight_init_claim_tags_smp_call,
+				       &arg, 1);
+
+	if (!ret)
+		ret = arg.rc;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(coresight_init_claim_tags_cpu_smp);
 
 /*
  * coresight_claim_device_unlocked : Claim the device for self-hosted usage
@@ -276,12 +378,18 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
 int coresight_claim_device_unlocked(struct coresight_device *csdev)
 {
 	int tag;
-	struct csdev_access *csa;
 
 	if (WARN_ON(!csdev))
 		return -EINVAL;
 
-	csa = &csdev->access;
+	/* check init complete */
+	if (WARN_ON(coresight_claim_tag_noinit(csdev)))
+		return -EPERM;
+
+	/* check if we are using claim tags on this device */
+	if (!coresight_using_claim_tag_protocol(csdev))
+		return 0;
+
 	tag = coresight_read_claim_tags_unlocked(csdev);
 
 	switch (tag) {
@@ -291,7 +399,7 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 			return 0;
 
 		/* There was a race setting the tag, clean up and fail */
-		coresight_clear_self_claim_tag_unlocked(csa);
+		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
 		return -EBUSY;
 
@@ -338,6 +446,14 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 	if (WARN_ON(!csdev))
 		return;
 
+	/* check init complete */
+	if (WARN_ON(coresight_claim_tag_noinit(csdev)))
+		return;
+
+	/* check if we are using claim tags on this device */
+	if (!coresight_using_claim_tag_protocol(csdev))
+		return;
+
 	if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
@@ -1543,6 +1659,7 @@ coresight_init_device(struct coresight_desc *desc)
 	csdev->ops = desc->ops;
 	csdev->access = desc->access;
 	csdev->orphan = true;
+	csdev->claim_tag_info = CS_CLAIM_TAG_UNKNOWN;
 
 	if (desc->flags & CORESIGHT_DESC_CPU_BOUND) {
 		csdev->cpu = desc->cpu;
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index b2c9a4db13b4..436ae2d8a7b9 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -729,11 +729,16 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
 
-	coresight_clear_self_claim_tag(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	ret = coresight_init_claim_tags(drvdata->csdev);
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		return ret;
+	}
+
 	/* add to list of CTI devices */
 	mutex_lock(&ect_mutex);
 	list_add(&drvdata->node, &ect_net);
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index a827f76b8144..339d902ce88a 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -769,22 +769,25 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.dev = dev;
 	desc.groups = coresight_etb_groups;
 
-	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	ret = coresight_init_claim_tags(drvdata->csdev);
+	if (ret)
+		goto err_unregister_csdev;
+
 	drvdata->miscdev.name = desc.name;
 	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
 	drvdata->miscdev.fops = &etb_fops;
 	ret = misc_register(&drvdata->miscdev);
 	if (ret)
-		goto err_misc_register;
+		goto err_unregister_csdev;
 
 	pm_runtime_put(&adev->dev);
 	return 0;
 
-err_misc_register:
+err_unregister_csdev:
 	coresight_unregister(drvdata->csdev);
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 862ad0786699..3d24bcac14ec 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -756,7 +756,6 @@ static void etm_init_arch_data(void *info)
 	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
 	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
 
-	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
 	etm_set_pwrdwn(drvdata);
 	etm_clr_pwrup(drvdata);
 	CS_LOCK(drvdata->csa.base);
@@ -852,6 +851,13 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	/* init the claim tag protocol - ensure run on correct cpu */
+	ret = coresight_init_claim_tags_cpu_smp(drvdata->csdev, drvdata->cpu);
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		return ret;
+	}
+
 	ret = etm_perf_symlink(drvdata->csdev, true);
 	if (ret) {
 		coresight_unregister(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 14bb31bd6a0b..b053ba7cf021 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1511,7 +1511,6 @@ static void etm4_init_arch_data(void *info)
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
 
-	coresight_clear_self_claim_tag_unlocked(csa);
 	etm4_cs_lock(drvdata, csa);
 	cpu_detect_trace_filtering(drvdata);
 }
@@ -2195,6 +2194,13 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	/* init the claim tag protocol - ensure run on correct cpu */
+	ret = coresight_init_claim_tags_cpu_smp(drvdata->csdev, drvdata->cpu);
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		return ret;
+	}
+
 	ret = etm_perf_symlink(drvdata->csdev, true);
 	if (ret) {
 		coresight_unregister(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3f56ceccd8c9..72f87284219a 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -244,7 +244,6 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		drvdata->base = base;
 		desc.groups = coresight_funnel_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
-		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	dev_set_drvdata(dev, drvdata);
@@ -265,6 +264,12 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	if (res) {
+		ret = coresight_init_claim_tags(drvdata->csdev);
+		if (ret)
+			coresight_unregister(drvdata->csdev);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..fada0e49ed28 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -41,6 +41,13 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_CLAIM_SELF_HOSTED	2
 #define CORESIGHT_CLAIM_INVALID		3
 
+/*
+ * Coresight specification defines a maximum of 8 claim tag bits.
+ * The precise number is implementation defined, and may be obtained by
+ * reading the CLAIMSET register.
+ */
+#define CORESIGHT_CLAIM_BITS_MAX_MASK	GENMASK(7, 0)
+
 #define TIMEOUT_US		100
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
 
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 07fc04f53b88..0ef87715fa2a 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -251,7 +251,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		drvdata->base = base;
 		desc.groups = replicator_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
-		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	if (fwnode_property_present(dev_fwnode(dev),
@@ -276,6 +275,14 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	if (res) {
+		ret = coresight_init_claim_tags(drvdata->csdev);
+		if (ret) {
+			coresight_unregister(drvdata->csdev);
+			return ret;
+		}
+	}
+
 	replicator_reset(drvdata);
 	return 0;
 }
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..45241c934ee6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -864,13 +864,18 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 	desc.pdata = pdata;
 
-	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
 		goto out;
 	}
 
+	ret = coresight_init_claim_tags(drvdata->csdev);
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		goto out;
+	}
+
 	drvdata->miscdev.name = desc.name;
 	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
 	drvdata->miscdev.fops = &tmc_fops;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index add0579cad88..126e0e867e16 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -248,6 +248,20 @@ struct coresight_trace_id_map {
 	raw_spinlock_t lock;
 };
 
+/*
+ * Coresight claim tag info:
+ * CS_CLAIM_TAG_UNKNOWN      - not yet checked.
+ * CS_CLAIM_TAG_STD_PROTOCOL - using standard claim/release protocol.
+ * CS_CLAIM_TAG_NOT_IMPL     - no claim tags available.
+ * CS_CLAIM_TAG_IGNORE	     - force skip of claim tags protocol
+ */
+enum coresight_claim_tag_info {
+	CS_CLAIM_TAG_UNKNOWN,
+	CS_CLAIM_TAG_STD_PROTOCOL,
+	CS_CLAIM_TAG_NOT_IMPL,
+	CS_CLAIM_TAG_IGNORE,
+};
+
 /**
  * struct coresight_device - representation of a device as used by the framework
  * @pdata:	Platform data with device connections associated to this device.
@@ -269,6 +283,7 @@ struct coresight_trace_id_map {
  *		spinlock.
  * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
  * @orphan:	true if the component has connections that haven't been linked.
+ * @claim_tag_info: how the device is using claim tags.
  * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
  *		by writing a 1 to the 'enable_sink' file.  A sink can be
  *		activated but not yet enabled.  Enabling for a _sink_ happens
@@ -297,6 +312,7 @@ struct coresight_device {
 	int refcnt;
 	int cpu;
 	bool orphan;
+	enum coresight_claim_tag_info claim_tag_info;
 	/* sink specific fields */
 	bool sysfs_sink_activated;
 	struct dev_ext_attribute *ea;
@@ -664,15 +680,14 @@ int coresight_timeout(struct csdev_access *csa, u32 offset, int position, int va
 typedef void (*coresight_timeout_cb_t) (struct csdev_access *, u32, int, int);
 int coresight_timeout_action(struct csdev_access *csa, u32 offset, int position, int value,
 			     coresight_timeout_cb_t cb);
-int coresight_claim_device(struct coresight_device *csdev);
-int coresight_claim_device_unlocked(struct coresight_device *csdev);
 
 int coresight_claim_device(struct coresight_device *csdev);
 int coresight_claim_device_unlocked(struct coresight_device *csdev);
-void coresight_clear_self_claim_tag(struct csdev_access *csa);
-void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
 void coresight_disclaim_device(struct coresight_device *csdev);
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
+int coresight_init_claim_tags(struct coresight_device *csdev);
+int coresight_init_claim_tags_cpu_smp(struct coresight_device *csdev, int cpu);
+
 char *coresight_alloc_device_name(const char *prefix, struct device *dev);
 
 bool coresight_loses_context_with_cpu(struct device *dev);
-- 
2.43.0


