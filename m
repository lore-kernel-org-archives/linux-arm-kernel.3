Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234D1C021A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLT+7yARFu+ZZe2jU+yKN61UJYeQ0L2gWO4wNTXz1Ac=; b=jj/upFCZC6CT+aFtoKVDlc2ZWp
	1NqFuHZWsbdjaa6xHngGFQOb3vKKabE7CQhUM92q3UqlWHgaDCK35cBAiK+j0izpYUVE2IjwC7rkC
	Uv+XXUamPF/o90FXcnpntvL5vXiNmms4m7MiXRswaJKl4Z7Sw8Cb056YSDwsijWC9FMRm8YYErU7Y
	5Bs/+Hk8p9Dz4IpjUPRTyApHRT111s+m0hZYw03UYMcJv2fx6jw4tVMqmGmTO1JQk2mOp52SlibRh
	Nsg3Jn0T6m8QwV6LzV+QHUbnY4x9/nmHPwvlPyL2RKYGH131SjNf7S+KB5rrDjlKpELBrW5QPAdXt
	iqV1zz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnvj-00000003R8V-3A8d;
	Tue, 11 Feb 2025 10:55:51 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnhC-00000003O0M-0uI6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:40:51 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso37013355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 02:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270448; x=1739875248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLT+7yARFu+ZZe2jU+yKN61UJYeQ0L2gWO4wNTXz1Ac=;
        b=PGIl4ioaWMtnFzruSmqNN00L+/8FzW+7sTaxOF9UtY6XEFRIPLSjOuq5noCiQuAHRP
         xjfJ6YOqHDZD4Zqe0N34Il8GfEsXXKvFjAYgr8ACgjLBFngn/GKKT7P2JE2prHSnff6F
         W1Za6LIG7RP3ITFgl5+QevylJMEPFv5MtY6nzvTVwemXp2ExtpBb7vEJDSFH5gknZdy0
         Be8Am+A8xAaYVpaYDPUnyeClUbfi8e/ngrhdo4io0z57EO0mlkZB33Btdw4zl8ZO7jNf
         Q/+3NgxVspxzXxU7rQGm9O9kuzdf6Xc5te1HzsWc0HwAbHuGzEfhDwayRQsnfK4bMx/H
         UW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270448; x=1739875248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLT+7yARFu+ZZe2jU+yKN61UJYeQ0L2gWO4wNTXz1Ac=;
        b=Lcwonu7oApijU1kf2A5iT7jbJZjCs9AxZUrJBJDt0KsX9YyK5gzp+bS5RlgD/ywx0N
         wpRMKMCoYebid4uMK1m3nmVWiCgIzwYKgW5xUh+2eU0N4oZAVhH1AeexwoRSmkBkCgzA
         rPmOklfwuYlUbAoYTjAbUrvL/LocMvFfYVt7Etz54rGH9gNbvZuNMtR1a1kz6s1+tk7l
         l+4tORFPSzgzkrep0V/YP0e8ujkUQuq+vdrriJi3ILW4p5ZjRQTJxoEVicJXq2166g2h
         vAo7MU5Tl5bcgEm5VuUT2EP+8O60vt4yY9q+Br0IJSlrXtlTeLYqSRDcwhrjswDL8j2c
         FzRw==
X-Forwarded-Encrypted: i=1; AJvYcCWrWGqinpkFtl7y545l4s1uru+zC0xXOXiW6mK/V37UznSd4hAxmYYJuQJbviI4qPU9mfWEgsaSTDxwXDroJBA7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx29lchIovGuz8CJo5fR6gEsKtF5Fva69apI2xmDhaD/EpDgtAh
	wGEQGHZZ3e1Qz05wV8pvjoQo5ZtUu3X6DFb8a8PTIA0vx4YIS4xjsTQL21y/s0k=
X-Gm-Gg: ASbGnctEC6UBN5vCxbmgt2E3ySgUA8vVmOG0H0IZHy3EORepsQM1GklyLLQZWILXHJ4
	epzsI9EHcVs4ZwlXYGsllBiapqU9EQv27LpOmAyF7HrgFXb5b8zYjFhAC1zPune3MG/fupN6jPA
	EzKHWoshCxQUk4amkX7cb7YdbHNJF8mBK3eyDTS18csMrjm8h+89AEJyliaTrFgiRUZNTW3KHKn
	xuEEgpaz0woLvoM0PztOf56hnkIzb5H59cBmgQZ6Ot2FQjtYJrGylYiQBQMmkjVZbJAJLgGTEvw
	/RHAnUImTIwA
X-Google-Smtp-Source: AGHT+IGy0JfOP/A4JgJKJRQpoAKt5qMwRlzYsOwuh7SYJBs/gpNnWiLYzgaWj+n9Q0QUYJ0DnLVjhw==
X-Received: by 2002:a5d:6da1:0:b0:38d:d946:db15 with SMTP id ffacd0b85a97d-38dd946de79mr6670134f8f.5.1739270448056;
        Tue, 11 Feb 2025 02:40:48 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 7/7] coresight: Remove extern from function declarations
Date: Tue, 11 Feb 2025 10:39:43 +0000
Message-Id: <20250211103945.967495-8-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024050_252160_EA39EC7C 
X-CRM114-Status: GOOD (  11.91  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-priv.h | 14 ++++-----
 include/linux/coresight.h                    | 33 +++++++++-----------
 2 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index a83113225797..e09071a720f0 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -57,10 +57,8 @@ struct cs_off_attribute {
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
@@ -155,8 +153,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
-extern int etm_readl_cp14(u32 off, unsigned int *val);
-extern int etm_writel_cp14(u32 off, u32 val);
+int etm_readl_cp14(u32 off, unsigned int *val);
+int etm_writel_cp14(u32 off, u32 val);
 #else
 static inline int etm_readl_cp14(u32 off, unsigned int *val) { return 0; }
 static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
@@ -167,8 +165,8 @@ struct cti_assoc_op {
 	void (*remove)(struct coresight_device *csdev);
 };
 
-extern void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
-extern void coresight_remove_cti_ops(void);
+void coresight_set_cti_ops(const struct cti_assoc_op *cti_op);
+void coresight_remove_cti_ops(void);
 
 /*
  * Macros and inline functions to handle CoreSight UCI data and driver
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 11808aee9d1d..2b43698c0b25 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -642,26 +642,23 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
 	local_set(&csdev->mode, new_mode);
 }
 
-extern struct coresight_device *
-coresight_register(struct coresight_desc *desc);
-extern void coresight_unregister(struct coresight_device *csdev);
-extern int coresight_enable_sysfs(struct coresight_device *csdev);
-extern void coresight_disable_sysfs(struct coresight_device *csdev);
-extern int coresight_timeout(struct csdev_access *csa, u32 offset,
-			     int position, int value);
-
-extern int coresight_claim_device(struct coresight_device *csdev);
-extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
-
-extern void coresight_disclaim_device(struct csdev_access *csa);
-extern void coresight_disclaim_device_unlocked(struct csdev_access *csa);
+struct coresight_device *coresight_register(struct coresight_desc *desc);
+void coresight_unregister(struct coresight_device *csdev);
+int coresight_enable_sysfs(struct coresight_device *csdev);
+void coresight_disable_sysfs(struct coresight_device *csdev);
+int coresight_timeout(struct csdev_access *csa, u32 offset, int position, int value);
+
+int coresight_claim_device(struct coresight_device *csdev);
+int coresight_claim_device_unlocked(struct coresight_device *csdev);
+
+void coresight_disclaim_device(struct csdev_access *csa);
+void coresight_disclaim_device_unlocked(struct csdev_access *csa);
 int coresight_reset_claim_unlocked(struct csdev_access *csa);
 int coresight_reset_claim(struct csdev_access *csa);
 
-extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
-					 struct device *dev);
+char *coresight_alloc_device_name(struct coresight_dev_list *devs, struct device *dev);
 
-extern bool coresight_loses_context_with_cpu(struct device *dev);
+bool coresight_loses_context_with_cpu(struct device *dev);
 
 u32 coresight_relaxed_read32(struct coresight_device *csdev, u32 offset);
 u32 coresight_read32(struct coresight_device *csdev, u32 offset);
@@ -674,8 +671,8 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
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


