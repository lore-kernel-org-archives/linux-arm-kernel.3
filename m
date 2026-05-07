Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9324DCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2lKTW+i8UJBtkHL3OH6w7/0rjCssXD0R+ErNGJjjE6E=; b=J3yTLxFmAA+QYhPUJZXQvQJEBg
	4a0fC8ggRqCe2isSbDTDn0/MNw07QhzkMxmRCD0gWSsHFZYuBsNgSthiP36dyop1EsyBUK7rd9AUD
	IItc+Mlfm8axdYt4al5W4AuCU8UfVw6ZkNK1zCMkJaW8Y064oQbMZoVYG8fs7nu8dGLNN66ayB29/
	Ub8HqzRD1p60ClQ0/G8ILKPT88UgDNGLolAsIiqz3g4nygoqIS7+IjigDKynmFQfmtrdV9PZDH88P
	yylV9tt2rRZFbARyJL3FkJ9u+d+KMyFOsXzSmfT4T305SYEzZe4MIJh0tULTquiw9ILJaF5rv/pVh
	N/GiTO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwMu-00000003YGQ-0zJo;
	Thu, 07 May 2026 10:54:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwMs-00000003YFm-1UfI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 May 2026 10:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=2lKTW+i8UJBtkHL3OH6w7/0rjCssXD0R+ErNGJjjE6E=; b=BIFKE04wUQjJjZ0VYj4+6I61zR
	TyBiKheG5Ty7DLPxT4PVAtq4q3/tyiQO4d6h3m+/EolX6pnM7bupLnAAItPWSMJ5+lYypXIYPJDVn
	zXSmMKWpzXwJaavWFbxk1R0gR6AihebOtJ2zer3Hn0TD6GK7+F6OP1vUuY92zgc27eRC/4+6mSkiv
	7WUvTlROskaSYKyc3RymqHRtxPEIPM0T3+Kb2SLCP6fI5owYudgYtP1MmtEHtCe9tgnTIssCtirej
	o1rxa1nNbgCkdvCbYvViZNSMeAkmyHVx2KWYbJBk3oxYf4ZKFkNgSa0z8bggnkQD2EykOQ9AT2e23
	nEB8NKtQ==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwMn-00000003HUn-1bX8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 10:54:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48374014a77so8190315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 03:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778151244; x=1778756044; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lKTW+i8UJBtkHL3OH6w7/0rjCssXD0R+ErNGJjjE6E=;
        b=aRhLbwl5HRf1Xg30pSdnEkKSPqHSOPMNKRinT2sncYC7OMjscsaVjxw8jUPX9j/woV
         DswoUs5JcEGZgb5x7BdUsyuWNG27aHM+p2Xd14crYwgYWXO6y5DaRERADxa8aiFvDGW9
         +4Au7syI0kgtFe77F1OYx84jMjuoC31hoCaU31YjpyvjxCfP/xyEthTdjyZ1udCT/GGa
         VOF4V+bxkSUdqF3hqVt2o7mRka+P7e/sbRuwdanybBkKvmX6jX35gx9+Qn+NK8gEsWDv
         qs90TJ/Jp9+/WzlzcxMRHomWpLSYuc6n23gV9NI2lhKy0S2J3BBffuCeLpO8olB4SJlh
         BzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151244; x=1778756044;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lKTW+i8UJBtkHL3OH6w7/0rjCssXD0R+ErNGJjjE6E=;
        b=izg84PPFDubyAwWmiRM9PAcq8QeaJFLvH3/HttKTmkwSGXyHcWhYP46RlQIvUBowXe
         InfNBYWeV+utRFAH3rPiWs4S308n3t/oLUKL1mjRxojmsEURtN0UxxZQZaE+1usySqHC
         RzgTA4HDi7xnJKIh4fp0EBCYCcazpi8tL3NgRruN6ZbN4UWJJlN5Esz+AgdjPXgNgOrH
         IJagkyyRdy2yy5UAxRo09vYQp5qTncTHENOdOg6t0pbS4x+nQCwS055JG0wPaetRJ3Q8
         yMKiFEdwh1DCwUY2cPltgnNcg6Obcw/FsA87jjElVXBvu09jYpjldiM1oaUzi1NolHlm
         Fvtw==
X-Forwarded-Encrypted: i=1; AFNElJ/gfBcTfnLgWbNCtf0TONui4rECW/vRz83qCd9n+6kbgAEirgXbJu08yAbksxUtKo1bFQdC0f0AVRHW+w8jvXn5@lists.infradead.org
X-Gm-Message-State: AOJu0YzwtRFSMiHufY3TXRTG48j6AXUPhQE8aCtXMBJ0nL1VswkyUfml
	xtokGPucYK5LNenyf7siuqsWyWrhaKJh2CZMi/mjqLoZEsgRplYjepRZp0Makwq9KOMB26xzb7c
	WlkXY3AU=
X-Gm-Gg: AeBDiet8RlCoJtaRyEJ0pl/8yk3uPpJqDUcfT7FZ2sBRo6z+Cwu7+fk++PxiLrgLZu7
	LuYWx7EAdcpqJbNpvnioyEOm5sNGMdcx9NyTNt+u/AEMB3t4GaB+reuwQvP+BQTBYPeR1TUTtY2
	Ii6i9DKaBr7mIpT3Au0yJpIyobr/ibJrcY6Nm7p2j+tdoc8G5Az9Phn3CiR5czl2XyvL6ZPH+bp
	1bzS5SCmTl/wtu5kuuiRVcTTm9evca+I9jpEBQJqs0MHwq/bTQQC1VEZ7eYoVJXRsc7/Yq+8+26
	pWOH0U5Nn8ltzQcKhJzY6wEza8l3pdyFbjDPZlnx22FM1izRPhYW8VeLagf6ULsB403fZQUUnJX
	zfKaDqLllb/7aa3SH/QfWz6hpkCx/YbATj9u8mjL0C0m2SbSgsxg1x1SEo+hv40vgZN7DDihvUm
	06wJXd6bD0sXB0nKKXPMxjDQKF00z1
X-Received: by 2002:a05:600c:3b17:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-48e51e20705mr110818075e9.9.1778151243546;
        Thu, 07 May 2026 03:54:03 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538ca8c0sm107180055e9.13.2026.05.07.03.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:54:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 07 May 2026 11:53:45 +0100
Subject: [PATCH] coresight: trbe: Hide enable_sink sysfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-james-cs-hide-trbe-enable-v1-1-b4e40439f44c@linaro.org>
X-B4-Tracking: v=1; b=H4sIADhv/GkC/x3MywrCMBBG4Vcps3Ygjb0EX0VcpMlfO1KjZEQKJ
 e/e0OW3OGcnRRYo3ZqdMv6i8kkV7aWhsPj0BEusJmvsYHoz8Mu/oRyUF4ngX57ASH5awdfg4ug
 6jDY6qv03Y5btfN8fpRzB3uI8awAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_115405_903183_128866EF 
X-CRM114-Status: GOOD (  21.96  )
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

TRBE doesn't support sysfs mode, but the enable_sink file can still be
successfully written to enable the device, and only attempting to enable
the source would later fail.

Avoid misleading users by adding a flag that devices can use to hide
either the enable_sink or enable_source files, and set it for TRBE.

Don't set it for ETE as it's possible that ETE could appear on the
legacy bus and work with sysfs, and writing to enable_source already
reports EINVAL if the device doesn't support sysfs mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c  |  1 +
 drivers/hwtracing/coresight/coresight-sysfs.c | 19 +++++++++++++------
 drivers/hwtracing/coresight/coresight-trbe.c  |  7 +++++++
 include/linux/coresight.h                     | 10 ++++++++--
 4 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..5244ff579ef6 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1341,6 +1341,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->ops = desc->ops;
 	csdev->access = desc->access;
 	csdev->orphan = true;
+	csdev->no_sysfs_mode = desc->flags & CORESIGHT_DESC_NO_SYSFS_MODE;
 
 	csdev->dev.type = &coresight_dev_type[desc->type];
 	csdev->dev.groups = desc->groups;
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index d2a6ed8bcc74..5729f16df2c4 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -387,16 +387,23 @@ static ssize_t label_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(label);
 
-static umode_t label_is_visible(struct kobject *kobj,
-				   struct attribute *attr, int n)
+static umode_t coresight_attr_is_visible(struct kobject *kobj,
+					 struct attribute *attr, int n)
 {
 	struct device *dev = kobj_to_dev(kobj);
+	struct coresight_device *csdev = to_coresight_device(dev);
 
 	if (attr == &dev_attr_label.attr) {
 		if (fwnode_property_present(dev_fwnode(dev), "label"))
 			return attr->mode;
 		else
 			return 0;
+	} else if (attr == &dev_attr_enable_sink.attr ||
+		   attr == &dev_attr_enable_source.attr) {
+		if (csdev->no_sysfs_mode)
+			return 0;
+		else
+			return attr->mode;
 	}
 
 	return attr->mode;
@@ -410,7 +417,7 @@ static struct attribute *coresight_sink_attrs[] = {
 
 static struct attribute_group coresight_sink_group = {
 	.attrs = coresight_sink_attrs,
-	.is_visible = label_is_visible,
+	.is_visible = coresight_attr_is_visible,
 };
 __ATTRIBUTE_GROUPS(coresight_sink);
 
@@ -422,7 +429,7 @@ static struct attribute *coresight_source_attrs[] = {
 
 static struct attribute_group coresight_source_group = {
 	.attrs = coresight_source_attrs,
-	.is_visible = label_is_visible,
+	.is_visible = coresight_attr_is_visible,
 };
 __ATTRIBUTE_GROUPS(coresight_source);
 
@@ -433,7 +440,7 @@ static struct attribute *coresight_link_attrs[] = {
 
 static struct attribute_group coresight_link_group = {
 	.attrs = coresight_link_attrs,
-	.is_visible = label_is_visible,
+	.is_visible = coresight_attr_is_visible,
 };
 __ATTRIBUTE_GROUPS(coresight_link);
 
@@ -444,7 +451,7 @@ static struct attribute *coresight_helper_attrs[] = {
 
 static struct attribute_group coresight_helper_group = {
 	.attrs = coresight_helper_attrs,
-	.is_visible = label_is_visible,
+	.is_visible = coresight_attr_is_visible,
 };
 __ATTRIBUTE_GROUPS(coresight_helper);
 
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 1511f8eb95af..75c1fa6ab620 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1289,6 +1289,13 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
 	desc.ops = &arm_trbe_cs_ops;
 	desc.groups = arm_trbe_groups;
 	desc.dev = dev;
+	/*
+	 * ETE isn't connected to TRBE with a link like other Coresight devices
+	 * and the TRBE driver has been written to always assume Perf mode, so
+	 * Prevent sysfs from being used.
+	 */
+	desc.flags = CORESIGHT_DESC_NO_SYSFS_MODE;
+
 	trbe_csdev = coresight_register(&desc);
 	if (IS_ERR(trbe_csdev))
 		goto cpu_clear;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2131febebee9..ccd99a480477 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -141,6 +141,8 @@ struct csdev_access {
 		.base		= (_addr),	\
 	})
 
+#define CORESIGHT_DESC_NO_SYSFS_MODE	BIT(0)
+
 /**
  * struct coresight_desc - description of a component required from drivers
  * @type:	as defined by @coresight_dev_type.
@@ -163,6 +165,7 @@ struct coresight_desc {
 	const struct attribute_group **groups;
 	const char *name;
 	struct csdev_access access;
+	u32 flags;
 };
 
 /**
@@ -260,7 +263,6 @@ struct coresight_trace_id_map {
  *		device's spinlock when the coresight_mutex held and mode ==
  *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
  *		spinlock.
- * @orphan:	true if the component has connections that haven't been linked.
  * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
  *		by writing a 1 to the 'enable_sink' file.  A sink can be
  *		activated but not yet enabled.  Enabling for a _sink_ happens
@@ -276,6 +278,8 @@ struct coresight_trace_id_map {
  * @config_csdev_list:  List of system configurations added to the device.
  * @cscfg_csdev_lock:	Protect the lists of configurations and features.
  * @active_cscfg_ctxt:  Context information for current active system configuration.
+ * @orphan:	true if the component has connections that haven't been linked.
+ * @no_sysfs_mode:	Device can't be activated from sysfs, only via Perf.
  */
 struct coresight_device {
 	struct coresight_platform_data *pdata;
@@ -286,7 +290,6 @@ struct coresight_device {
 	struct device dev;
 	atomic_t mode;
 	int refcnt;
-	bool orphan;
 	/* sink specific fields */
 	bool sysfs_sink_activated;
 	struct dev_ext_attribute *ea;
@@ -300,6 +303,9 @@ struct coresight_device {
 	struct list_head config_csdev_list;
 	raw_spinlock_t cscfg_csdev_lock;
 	void *active_cscfg_ctxt;
+	/* flags */
+	bool orphan : 1;
+	bool no_sysfs_mode : 1;
 };
 
 /*

---
base-commit: 551bb2fd5e4ed63d33aa11f07102cce5179b7595
change-id: 20260506-james-cs-hide-trbe-enable-3c8d784e72d8

Best regards,
-- 
James Clark <james.clark@linaro.org>


