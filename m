Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BA8C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fO8sQXjoxHJcLDPIWMVdxue/Kij3vgguKV5lofaAHus=; b=RtqcKfEk3/OCCJqi2q4XIT9W2/
	KIcdu9rNdCjSsvPJsZc2ReTNf3HEjQRX5dPOGbtg0flGJ8agdke5mwsskLydytjoXLOfRpBX4aGOm
	cv8Ievj9MAoOdsBcgE/yUoqNKmzX6aAbslowPjJF6SdYcdpTMnmtRiAWrRXjJlmAmi8eV9dxHtOLc
	nzwYbfcY52tWylHDbLaKTLf5I7RuYLW4RIIUPQn7nI0ZALqs01zwBrclCDM7t2xvvldDAlpQbPqP5
	R0HyWU4Cz6yHZa0tNCUKxF94h5shqxIw5MwTuHa5g40H2TjVfuQMRmHXeLPjffUDO3iB8a9I164bp
	IJg6nqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHa7-00000007bBn-06Ri;
	Fri, 07 Aug 2026 10:13:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHa2-00000007b9l-0eUm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:13:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so2459189f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786097612; x=1786702412; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fO8sQXjoxHJcLDPIWMVdxue/Kij3vgguKV5lofaAHus=;
        b=yYLiUe1yQ60WDrKFY0WszO3u6EKdqIDMjdszYudU/thMupPnXdz79BqYT78UhgZDNR
         NXZgxhTPrDfgwnCsfuxtgdcKA2+z8wwrHclyVqYHb3YKWMVBBvieyD0A914BxPwOxDkP
         53g3q+w62/eJXQnzmDIfIeXUN5QkBqa0LXTWsAJ+pDWTo0L9+2DCi5fnqSF1GBcvaSqr
         9f/jHj7dArYp96D8BFUCWaEPLqzJ7bV30P6zhaDVl2cA/gY30ls4oz+CsvDbsYOf9z1V
         TCH8VpYhwZ+DaKJDb9NksEPBMBizqQ1MXGCcnPf517hZfpgIH3dNpBfzEiiVV02V/Qlt
         +IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097612; x=1786702412;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fO8sQXjoxHJcLDPIWMVdxue/Kij3vgguKV5lofaAHus=;
        b=RRDt/wbeyngLmBolr3rDoh8QrqL2ebOZpZlj17vTUbDxQxC15uhRA5L/PB5PLqGO5R
         dgrozPAAWdKmKndk1Pr0tymdeFWI0f8JpDhw1HvJoYjrnCLgQfoga191DmbeuV1Oi5+3
         VxyANUAPOhHk/sGS79U52fZA2kGZKyc2t2SYVwY4SllsHr8coDuzVvhWfE6vI+43UUi9
         ZPVB3VB8gWeT4mBis9vAdfNOjOFC373j+eqod5bD+hmKr83J4EoYs3t5IbCVN/+BPUWq
         8pQi5ye1YYJ07wbzSoeoxwuiT13CKsP0CQM3vnr5f5OnEMsbzaU0Up64vTOvremjv/9Z
         vgjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDnNwrSoHcVmh62Bdn1oqw5Jagkal4+aW5ZM9MH+GGqkJmCrcqy88bQAxaZYXOOZxSQrK3IptTH8CmaIif2RHA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ZXB+4Ep745AQYQXsYvhhv7UH/lynBzLckNsLqN3ij2Urz8Kd
	FyKECvzvltkDf2bw6m+NWx4zuL5EhI06CweRRGHZizIeqAhEI9U1Futila4DpLC/8kKqpE8PvXa
	zVHGGl+U=
X-Gm-Gg: AR+sD12VqgrnYMJRGRirZrFwUMsJx/ctGdqQwaElzmnJpWrUwzNj/pxj00DBZYFg306
	F2jbvpZEI4vp5tMFubntde4ipw7ZLdV01CJ9Q2joGi9g29ypZTaGJmA6dacrmc45XZe/W4wOhIl
	fF9zZ07y4jdHpPJbtqKmKy36Zfi2zjwIAT6oAWUIPluZbxPX6f/Zu8e47ELbsLzGcqPDG6cRKlX
	JerEXzd7fTnDGWNH7x8VpFZuxyq0LO9uOwSW7ooP04SRBrgxzKs0Ti3NZtYibKeBQ5dBlI64Gsr
	jLCGcm6GM8NTpsGp/6e+GtwM3LVQPRCAxkNo6ZGt07izUMBIa+qp+XpJ7Liak8eoGdXvzqh8A3F
	18exn6obcscYOrdzJw9J5HnRxcRgCg7Uxqb7IxR0KotjPeq5o1nTjJbtBRX9GQOL7Kzy32/3JH3
	VKrMYCplpKWHwRMkWcW5iU99D3Vb+Vo2CbIGBTSQtgs0kh6mH9MYjCVa7ECo9qW377
X-Received: by 2002:a5d:5e09:0:b0:47f:fb2e:f63d with SMTP id ffacd0b85a97d-47ffb2ef800mr16532855f8f.9.1786097612309;
        Fri, 07 Aug 2026 03:13:32 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm4620706f8f.20.2026.08.07.03.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:13:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 07 Aug 2026 11:13:22 +0100
Subject: [PATCH v2] coresight: trbe: Hide enable_sink sysfs file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-james-cs-hide-trbe-enable-v2-1-0b2af223feed@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMGvdWoC/32NQQ6CMBBFr0K6dkwpFdCV9zAsSjvAGGzNlBAN6
 d2tJG5dvpf89zcRkQmjuBSbYFwpUvAZ1KEQdjJ+RCCXWSipanmSNdzNAyPYCBM5hIV7BPSmnxE
 q27qm1dgo14q8fzIO9Nrbty7zRHEJ/N6v1vJrf9XmT3UtoYReo5a6Og9a2+tM3nA4Bh5Fl1L6A
 OoTbkHDAAAA
X-Change-ID: 20260506-james-cs-hide-trbe-enable-3c8d784e72d8
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_031334_227563_4E788982 
X-CRM114-Status: GOOD (  20.80  )
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
Changes in v2:
- Re-use CORESIGHT_DESC flags in csdev instead of converting to bool.
- Hide all remaining attrs after label instead of only source and sink
  attrs as there aren't any others anyway (Leo).
- Link to v1: https://lore.kernel.org/r/20260507-james-cs-hide-trbe-enable-v1-1-b4e40439f44c@linaro.org
---
 drivers/hwtracing/coresight/coresight-core.c  |  1 +
 drivers/hwtracing/coresight/coresight-sysfs.c | 15 +++++++++------
 drivers/hwtracing/coresight/coresight-trbe.c  |  7 +++++++
 include/linux/coresight.h                     |  4 ++++
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f7b1308a759c..a0c098980096 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1543,6 +1543,7 @@ coresight_init_device(struct coresight_desc *desc)
 	csdev->ops = desc->ops;
 	csdev->access = desc->access;
 	csdev->orphan = true;
+	csdev->flags = desc->flags;
 
 	if (desc->flags & CORESIGHT_DESC_CPU_BOUND) {
 		csdev->cpu = desc->cpu;
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 4b010f8bc4c0..75000fe64fda 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -346,16 +346,19 @@ static ssize_t label_show(struct device *dev,
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
+	} else if (csdev->flags & CORESIGHT_DESC_NO_SYSFS_MODE) {
+		return 0;
 	}
 
 	return attr->mode;
@@ -369,7 +372,7 @@ static struct attribute *coresight_sink_attrs[] = {
 
 static struct attribute_group coresight_sink_group = {
 	.attrs = coresight_sink_attrs,
-	.is_visible = label_is_visible,
+	.is_visible = coresight_attr_is_visible,
 };
 __ATTRIBUTE_GROUPS(coresight_sink);
 
@@ -381,7 +384,7 @@ static struct attribute *coresight_source_attrs[] = {
 
 static struct attribute_group coresight_source_group = {
 	.attrs = coresight_source_attrs,
-	.is_visible = label_is_visible,
+	.is_visible = coresight_attr_is_visible,
 };
 __ATTRIBUTE_GROUPS(coresight_source);
 
@@ -392,7 +395,7 @@ static struct attribute *coresight_link_attrs[] = {
 
 static struct attribute_group coresight_link_group = {
 	.attrs = coresight_link_attrs,
-	.is_visible = label_is_visible,
+	.is_visible = coresight_attr_is_visible,
 };
 __ATTRIBUTE_GROUPS(coresight_link);
 
@@ -403,7 +406,7 @@ static struct attribute *coresight_helper_attrs[] = {
 
 static struct attribute_group coresight_helper_group = {
 	.attrs = coresight_helper_attrs,
-	.is_visible = label_is_visible,
+	.is_visible = coresight_attr_is_visible,
 };
 __ATTRIBUTE_GROUPS(coresight_helper);
 
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index c7cbca45f2de..eca8e13a9744 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1348,6 +1348,13 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
 	desc.dev = dev;
 	desc.cpu = cpu;
 	desc.flags = CORESIGHT_DESC_CPU_BOUND;
+	/*
+	 * ETE isn't connected to TRBE with a link like other Coresight devices
+	 * and the TRBE driver has been written to always assume Perf mode, so
+	 * Prevent sysfs from being used.
+	 */
+	desc.flags |= CORESIGHT_DESC_NO_SYSFS_MODE;
+
 	trbe_csdev = coresight_register(&desc);
 	if (IS_ERR(trbe_csdev))
 		goto cpu_clear;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index add0579cad88..6cd1d01b843b 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -142,6 +142,8 @@ struct csdev_access {
 	})
 
 #define CORESIGHT_DESC_CPU_BOUND	BIT(0)
+/* Device can't be activated from sysfs, only via Perf. */
+#define CORESIGHT_DESC_NO_SYSFS_MODE	BIT(1)
 
 /**
  * struct coresight_desc - description of a component required from drivers
@@ -310,6 +312,8 @@ struct coresight_device {
 	struct list_head config_csdev_list;
 	raw_spinlock_t cscfg_csdev_lock;
 	void *active_cscfg_ctxt;
+	/* CORESIGHT_DESC_[x] flags */
+	u32 flags;
 };
 
 /*

---
base-commit: c8eb4a8dd259fb2b215da32764fa8c6c76519896
change-id: 20260506-james-cs-hide-trbe-enable-3c8d784e72d8

Best regards,
--  
James Clark <james.clark@linaro.org>


