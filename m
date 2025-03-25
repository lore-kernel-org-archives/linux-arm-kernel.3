Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8420C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+T3WQyKZjc+sTss9oWTNDsgD0VLz9miuiujDFgPAAiM=; b=3g9AXP9TfqFDIWrG3hqRRWSJQg
	zvX744K9xHmAw1hgh2hFkZXAHf1ThaX2D/+qJ+fiyw+xMw+6kI5q23Q3jbat7KHYMK0slaYaAG2Am
	/Y2AjaXogVTNkvUQA/Etaxr2cOEYumr1UC9kY8FfBPblKkcdlsE9AwKNwjnLVPldAmrEWw1pidtB5
	DITSSV9U7CxnVexXgZewnqzfHQxVC3AUKgXUR/XrC20vW1oiDzViK/cKRKerMYpsEq98JIhetML33
	eRDXBZmNu72aqQKhbsFSAvTlZmmQKK8gL/s5lA7yQzzWl0B/bta9TE2oZr5bYLm7zKsTHP0YfbBgP
	oguMKp1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx379-00000005kug-3Aoa;
	Tue, 25 Mar 2025 12:10:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2vz-00000005iO4-2qPo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:59:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3193113f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742903946; x=1743508746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+T3WQyKZjc+sTss9oWTNDsgD0VLz9miuiujDFgPAAiM=;
        b=s73nBJ8gkw0rHcc2pJKO3BpHmmEC9pFy7gjQPTjfmV8ZeBdFdVWtxwA2hJ+ntT92fY
         7vN2V9/eEvWK6p1f1yzWy0QiDVNHxPccKX4aF2k9CTyUQRKZunNckWdLaY+J0OPPpV+4
         Hdu+b0d91HxdP6/5C/nJaHU4GWa4LLKuXl92PDCrkl4cHPcBREneNqUiCPHgvpiWC59Z
         w6RRkzRRONcDfYVg9IVqKfoVGIIp4IAYQGQulOCcpjgLcABrAjIs3Io6yw6dNjynUNbc
         B+E897uZR8coLgIA/BhPVEvw8strVE4Fwte1/cde26vCbdR7k7Pr3uRHxPqWV5zN7Bp2
         ecjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903946; x=1743508746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+T3WQyKZjc+sTss9oWTNDsgD0VLz9miuiujDFgPAAiM=;
        b=ued28axGy+bO/FXitThuM391klcu0iD4pxRMOZMKHnhIA+BfY6a2BpPWp84ehXP7Lr
         hoU45oYS+aa7ZhlydaxFmyQzKU3z6QZSC3YDMyjUwvGtMGhEj3r1XhZMDQfIgp5dXnh8
         wfawfVRdeIKESQ8CGQ5S7s+wA+U4M1PwtgpMm5oy9kL3fegvvJESt4MrvctbMXLdeD4D
         xZSrcQ6BHbdBlCwSVRw9dweCw0xwwVHqf7U1UZEizhq4Hd5r61Xu+1PaXeng1t9f7cv8
         dV1lzZk4yzTFDSEDZRQVM76kt993+ICSO/PKtCgU3R7PBjLhi/qYgf+5Kv3PvdKudhae
         OSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOmqaH3ACPyQi+g5eDs/W9YT5eA7sSFAXtSn8jjm7+sWfirEp7qIgSWV9Wqu8cblal7kwmHDOvjuiKGn3b5kfS@lists.infradead.org
X-Gm-Message-State: AOJu0YzD4q8aStED1X98wP3/xPWg0UObPBOFBaHdJK8oedr29YiAPENe
	cdhrJ70dP1PclUWjeby/oAGj9KI3UEFt8RABHV73/Ds93hx3862ElTNGeT/2jYM=
X-Gm-Gg: ASbGncsb/PbGnHLbvnQO1D/CrX3joL0QGpQGGkNqQdQNOxz+Wj5nR3DMHiaLLCc4rmP
	g7MPb+dIRmHBCp5CrPpt2zjhwxsobshb0GgTtF9w91jdcW7NxIep2roImGUKDU7XjVJdpGnWB6I
	H+zRGGjsfFVQVfu3RahJpbRBLZLxbyD2Jb2osBHlgFBFgaKboPvxfkOXIRfqGdZSOEh+Nzbkhte
	JtNUBlrJ+StmUO/jh9LdkY4o36WTUe+m7VivPI0etHNt6VqgDKCFrtNI0fwGk7Mq68NsMglH40Q
	4LJN4dQcnQ4TjEk6bU+PM7dRB2J3SHBJt36FMkzo0Mpghp2W
X-Google-Smtp-Source: AGHT+IFPGy9vum6o+O8NH5bMurCGa+Js6mdtnSW1DTWQ2JGk0tgT1DLh6k91VuQbSdSQx9wfiBlcYg==
X-Received: by 2002:a5d:5885:0:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-3997f93c495mr13090045f8f.49.1742903945954;
        Tue, 25 Mar 2025 04:59:05 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:59:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:46 +0000
Subject: [PATCH v4 1/7] coresight: Convert tag clear function to take a
 struct csdev_access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-james-coresight-claim-tags-v4-1-dfbd3822b2e5@linaro.org>
References: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
In-Reply-To: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_045907_731536_DE8BE23C 
X-CRM114-Status: GOOD (  16.65  )
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

The self hosted claim tag will be reset on device probe in a later
commit. We'll want to do this before coresight_register() is called so
won't have a coresight_device and have to use csdev_access instead.

Also make them public and create locked and unlocked versions for
later use.

These look functions look like they set the whole tags register as one
value, but they only set and clear the self hosted bit using a SET/CLR
bits mechanism so also rename the functions to reflect this better.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 33 ++++++++++++++++++----------
 include/linux/coresight.h                    |  3 ++-
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..d895815dee1d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -129,34 +129,45 @@ coresight_find_out_connection(struct coresight_device *csdev,
 	return ERR_PTR(-ENODEV);
 }
 
-static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
+static inline u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
 {
 	return csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR);
 }
 
 static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
 {
-	return coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
+	return coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
 }
 
 static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
 {
-	return coresight_read_claim_tags(csdev) != 0;
+	return coresight_read_claim_tags_unlocked(csdev) != 0;
 }
 
-static inline void coresight_set_claim_tags(struct coresight_device *csdev)
+static inline void coresight_set_self_claim_tag_unlocked(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMSET);
 	isb();
 }
 
-static inline void coresight_clear_claim_tags(struct coresight_device *csdev)
+void coresight_clear_self_claim_tag(struct csdev_access *csa)
 {
-	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
+	if (csa->io_mem)
+		CS_UNLOCK(csa->base);
+	coresight_clear_self_claim_tag_unlocked(csa);
+	if (csa->io_mem)
+		CS_LOCK(csa->base);
+}
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
+
+void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
+{
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
 	isb();
 }
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
 
 /*
  * coresight_claim_device_unlocked : Claim the device for self-hosted usage
@@ -176,11 +187,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_any(csdev))
 		return -EBUSY;
 
-	coresight_set_claim_tags(csdev);
+	coresight_set_self_claim_tag_unlocked(csdev);
 	if (coresight_is_claimed_self_hosted(csdev))
 		return 0;
-	/* There was a race setting the tags, clean up and fail */
-	coresight_clear_claim_tags(csdev);
+	/* There was a race setting the tag, clean up and fail */
+	coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -201,7 +212,7 @@ int coresight_claim_device(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_claim_device);
 
 /*
- * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
@@ -211,7 +222,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		return;
 
 	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_claim_tags(csdev);
+		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
 		/*
 		 * The external agent may have not honoured our claim
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..00134a80d358 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -685,7 +685,8 @@ extern int coresight_timeout_action(struct csdev_access *csa, u32 offset,
 
 extern int coresight_claim_device(struct coresight_device *csdev);
 extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
-
+void coresight_clear_self_claim_tag(struct csdev_access *csa);
+void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
 extern void coresight_disclaim_device(struct coresight_device *csdev);
 extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
 extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,

-- 
2.34.1


