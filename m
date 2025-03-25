Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD4DC36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URH02LmawsBwXwRAzrMyvcfzvtwZFgsdBIdO4zOCg7U=; b=GySUL6m6eBsgZoUNorNcTNiZrH
	wOOpul/A/raEceiGC6cEdw+sZ5P2YQj8QhUH5RVXJp9fw0skOv7FQRUIgq1tC3xmkJlmhm89Ke2k5
	y79farStu8eGQXb8K307Bf1aMFtVCeFEsIQQdzKhL0dEfv6GdPRT3+j5EWDV3Xe+7Wt6wMHSydUnc
	aq4pAPHuPsMGLG5TCxHof3jNIEJLn1BEQTMQI/UoWzvsWh6b6uwoL6OZEope50zPiAUCANdF7AgBt
	2W+QkQ0jHb+SNl90oW9gQfYlkqC7H07aqcmfB25ZN23vpAGZyu1Cll+t6jxYLIazB7QPSXBsFpRvd
	iEYRgMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3HM-00000005n9C-0api;
	Tue, 25 Mar 2025 12:21:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2w8-00000005iRM-1cDM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:59:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394036c0efso34475455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742903955; x=1743508755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URH02LmawsBwXwRAzrMyvcfzvtwZFgsdBIdO4zOCg7U=;
        b=tWaRKz4aH3LqCZj+kTpGtLRY0iPwQzlqLQ8MGdkhHdxicxkzVVgjZwutngmF3GKsiz
         2sWBARsFWsZWfnz5CNurp131xhDTpVzM5No/IxmwZe+vTzycDV5Zi05F8bQbXfHwSFqn
         Ae1hdK3em/Rl4vyBYo1gLbNOdtWKevI3thUVJRpNi05Pa2+6n5F50cf6vwDdrR0WWVIn
         bJO68nghunVvPxp9W4UcHzhC2chXAxmeZhHLB/28R2uff8UbeD6CQqhYubMZbpOpp27f
         53ycpxC5mVbWQ071ADtE0LILuwL01kz5ghQZAeJlIfQa+M+IASkXvHTyhbqkjqhmLmKZ
         SvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903955; x=1743508755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URH02LmawsBwXwRAzrMyvcfzvtwZFgsdBIdO4zOCg7U=;
        b=sduGjWeGsUvUu3AgRZefSj4XbSlR/Bspe876zjvRReiFYqoyF6e6NYWHJcF/kRDora
         2eDCzMt+09JDPNphKn24uBZaBU9Lpx9YKG7QtRo4Px6JmP/bOusatQyjkbqODhHIqltR
         R9hMRD4WBXnylk4f07VlSIg7UMKj7oxV/7u9O56QAzhjJNKtpaxIxVB8WWLFaofHE1PX
         P0Saln28kMheTRtarU+eV1UolXvmnovEx0R3HfvoNv7foyABkGN+JarRP+hDDhWGt0Pu
         De9lfkQFszkQTdaOjCInaR/ylP8xQVVkqZG4bvx4jF0jAZ3PMR1unZ6w/EJGoXq6QQU6
         A/ng==
X-Forwarded-Encrypted: i=1; AJvYcCVK+YL0fma64ZakhdDbFU1rY6+eHSttf+jQAk3BmF31oKIbUvq+1VDwNvsC/bppz7eZT1jl1Rp0/zFXe1BLgzQN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf+qa44DyCHnBg8g7kD6BfbO+/2P6kyIfG5VSBTl+hEupvfHkY
	WTivdrcVXjLMDEKICvyaOvhFi71+Oe546CuwAGdYca2JHUxVE+PGsoccBY21PQw=
X-Gm-Gg: ASbGnctMT8wklY8A2D3I27oUgUCo2nHdfu0Q7ACVLJEgRKAFl+HpaSh+znUbJRLJMS7
	IDHH5xdi3J6IuGmb5FFjMGNSPWyfhBvryrMtZ2ZHnP0oFk0blmuH7S00qd9wLNMDbhbd4x+aVcJ
	UfHGCIcxkVVNtT1UO6yUU/DQ14/UpbmjyMNu2HeJSQTZ9VogfVGfLSF+CRYtodgb2Fyxmr5UguS
	yEcJQEoockA4fWMpdf+83WeIlokFFdvoh2Uq6SMirzfDibEm3j3wtf3kzZdlaVcl71EQc0M65bA
	LzMV6vuPsFqPNVojSEqK+fUsLpObS5yhT4OpUK2pYwPw5ZwPb1i+3Fqoea4=
X-Google-Smtp-Source: AGHT+IFY3J2BU7foR1zefvOJHNkMdBucCAWCq5rxXUSAdx/gx1dyi7mhO9IHsTs2kbA/bhGFxr9hVA==
X-Received: by 2002:a5d:5f8c:0:b0:391:275a:273f with SMTP id ffacd0b85a97d-3997f8f6089mr13909278f8f.4.1742903954627;
        Tue, 25 Mar 2025 04:59:14 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:59:14 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 25 Mar 2025 11:58:52 +0000
Subject: [PATCH v4 7/7] coresight: Remove extern from function declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-james-coresight-claim-tags-v4-7-dfbd3822b2e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250325_045916_436832_C93BE448 
X-CRM114-Status: GOOD (  11.72  )
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

Function declarations are extern by default so remove the extra noise
and inconsistency.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h | 14 +++++------
 include/linux/coresight.h                    | 35 ++++++++++++++--------------
 2 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 6e8cf55aee0a..ce91e0fbb497 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -60,10 +60,8 @@ struct cs_off_attribute {
 	u32 off;
 };
 
-extern ssize_t coresight_simple_show32(struct device *_dev,
-				     struct device_attribute *attr, char *buf);
-extern ssize_t coresight_simple_show_pair(struct device *_dev,
-				     struct device_attribute *attr, char *buf);
+ssize_t coresight_simple_show32(struct device *_dev, struct device_attribute *attr, char *buf);
+ssize_t coresight_simple_show_pair(struct device *_dev, struct device_attribute *attr, char *buf);
 
 #define coresight_simple_reg32(name, offset)				\
 	(&((struct cs_off_attribute[]) {				\
@@ -160,8 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
-extern int etm_readl_cp14(u32 off, unsigned int *val);
-extern int etm_writel_cp14(u32 off, u32 val);
+int etm_readl_cp14(u32 off, unsigned int *val);
+int etm_writel_cp14(u32 off, u32 val);
 #else
 static inline int etm_readl_cp14(u32 off, unsigned int *val) { return 0; }
 static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
@@ -172,8 +170,8 @@ struct cti_assoc_op {
 	void (*remove)(struct coresight_device *csdev);
 };
 
-extern void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
-extern void coresight_remove_cti_ops(void);
+void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
+void coresight_remove_cti_ops(void);
 
 /*
  * Macros and inline functions to handle CoreSight UCI data and driver
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 00134a80d358..8cb07c132b01 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -671,28 +671,27 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
 	local_set(&csdev->mode, new_mode);
 }
 
-extern struct coresight_device *
-coresight_register(struct coresight_desc *desc);
-extern void coresight_unregister(struct coresight_device *csdev);
-extern int coresight_enable_sysfs(struct coresight_device *csdev);
-extern void coresight_disable_sysfs(struct coresight_device *csdev);
-extern int coresight_timeout(struct csdev_access *csa, u32 offset,
-			     int position, int value);
+struct coresight_device *coresight_register(struct coresight_desc *desc);
+void coresight_unregister(struct coresight_device *csdev);
+int coresight_enable_sysfs(struct coresight_device *csdev);
+void coresight_disable_sysfs(struct coresight_device *csdev);
+int coresight_timeout(struct csdev_access *csa, u32 offset, int position, int value);
 typedef void (*coresight_timeout_cb_t) (struct csdev_access *, u32, int, int);
-extern int coresight_timeout_action(struct csdev_access *csa, u32 offset,
-					int position, int value,
-					coresight_timeout_cb_t cb);
+int coresight_timeout_action(struct csdev_access *csa, u32 offset, int position, int value,
+			     coresight_timeout_cb_t cb);
+int coresight_claim_device(struct coresight_device *csdev);
+int coresight_claim_device_unlocked(struct coresight_device *csdev);
 
-extern int coresight_claim_device(struct coresight_device *csdev);
-extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
+int coresight_claim_device(struct coresight_device *csdev);
+int coresight_claim_device_unlocked(struct coresight_device *csdev);
 void coresight_clear_self_claim_tag(struct csdev_access *csa);
 void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
-extern void coresight_disclaim_device(struct coresight_device *csdev);
-extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
-extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
+void coresight_disclaim_device(struct coresight_device *csdev);
+void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
+char *coresight_alloc_device_name(struct coresight_dev_list *devs,
 					 struct device *dev);
 
-extern bool coresight_loses_context_with_cpu(struct device *dev);
+bool coresight_loses_context_with_cpu(struct device *dev);
 
 u32 coresight_relaxed_read32(struct coresight_device *csdev, u32 offset);
 u32 coresight_read32(struct coresight_device *csdev, u32 offset);
@@ -705,8 +704,8 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 			       u64 val, u32 offset);
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
-extern int coresight_get_cpu(struct device *dev);
-extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
+int coresight_get_cpu(struct device *dev);
+int coresight_get_static_trace_id(struct device *dev, u32 *id);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *

-- 
2.34.1


