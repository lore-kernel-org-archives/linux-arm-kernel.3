Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8652C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=; b=p2vdN/afl03XqaX00McmIvhoLk
	kztiNzifp4zOB2VdzzWt/XG1FS4gNNURTx/IDzsXZyn4JbU03PqZLBHuPM+0a/b6qfFJ/Q/APiKyJ
	zHo/xe+tBiydRXkcMONYp3LtRL744DAAq8z2vk1pO8oFUXkq7atDdry3WwnxBOuyeAXz3ys8AmGq1
	AN4I0EFwhcgZX8N/KmxJzwWS82zLzsMMqENB6SSm9hKfLWfvtrEMrXgupPEnlsmvskw3L0TvSW60S
	oyOkGXWHX6e4Arggn81ws73R9lqx1qIpJaFnamQqjDaDo1CyMY4EzE4uWChwFJDbV7pU4+DjaXqxy
	+tLMpryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHCf-0000000CROA-35ZZ;
	Thu, 20 Mar 2025 14:49:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGzN-0000000CP0e-44ZP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 14:35:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so4351295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742481316; x=1743086116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=;
        b=x4LovN8t2aH5bHBl8sN+Rtqk5uhEmEZkwRT3GIjbXFMy95kaoxh9CgWL7bfO6w6CcP
         COy7gOELsIpv6HbkzgfT3ozsxfUtM0ZZ1nIg/whhzXy55LfNBVhtbuaO6uhmRyRJaaPJ
         qdabuKSBLJ1QC8I6u3LrYaSPH88EOj4grATzMEqlvtoNRqXL6IJWoWvhzV871GzvEeVh
         bbT68tPrlKHpCaWmVqaSTHQTMB7n6h0qwx8/TnOwuP9k1J9AjTpQMAfP3CKEejtIkdmZ
         6TNOv35NcDqwQKy3Q6qp+YQG2pa1hE1tGf5aCuancd+ZfMSbfIGSQ7x68Xel2sXo3LIE
         OPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481316; x=1743086116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=;
        b=KdS5O7/M2S4DZLIswMg2+Elbej6Sjq3AVg9mOFXiHrkMmpv+Cj/ZsD0RMMmofoJxBp
         vekWp7R7ipk9KokMwpz9CgDVhIgxkLuBrorGfLvuEpZ1jjpfyo0TSYYR9stofjQsfzS/
         /134/N0jdw+YJhubNfIYGOG/3swk5sJJYazWA3NEtif4poKSoQxaCeDq2Kiwg+SZB6YQ
         +5edDjArtsSdmBwNE6ak95gEeOVXVuLzmXhtlPhD+9d6JDzJ1kwo4Hs4KF9/SdazqgLo
         eV500LDeAE1rayiYCrULa/byS8z3xCso7g9LuktkMNeAASUL+6zHXsVf34O1DBh/H86U
         u5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYBEI/g48afjJAtFx6qi87cVyKHwX11cG92grvE//cyO89zgJZcCIZEJlzaapKaeC2scVnZN39ELUzdu3dbmf2@lists.infradead.org
X-Gm-Message-State: AOJu0YxXB9KTTMFxUaYjjAHjCotPkyyVdQynCtl1aFUGukC5MS2Q6o62
	2YYW+fGvCZyFmEGYj9UuWz+3wXeMKf6d1bfQQvm53EQBOrBtRJWgMzAG+1Uz94s=
X-Gm-Gg: ASbGnctwaVec6Xh8AnMwk4Io8D+G+6bAWIQRwa7ev7jMVzF1z237fxa8jFlpqVEpXGc
	6Udaz9yu38q4kJnIqeOWsYAbim6eRYQEfg0Cfvma8fQM23RgTyKXhzWis6u8bxn42p1Ig+33+Zj
	UuJicVhmPAB0FlrIaarWkH35Du1Mu2JubPVor4O2VzyQQxU7MhuKFF7glhAbGRY0eZmO3m3cDBj
	4bZIW1PviMUAkR289gKaMUV6ds5cwxPYJi4sraoo65qpS0/goOpSChk96QHCnwUJ9zZVLZE/vaz
	gRArtddGXuFkqHAZjWF+zDk7Pomaal8Mhs/kUBzigGNmG7o=
X-Google-Smtp-Source: AGHT+IGWLVpm4TQ0kdAiwRFUVf9LxYmBruxCxdW+BZGKM/2Bj+7qbRWxjTO13KNGwhsfFVq1+NGRWQ==
X-Received: by 2002:a05:600c:b9b:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-43d4378cf45mr58703935e9.9.1742481316328;
        Thu, 20 Mar 2025 07:35:16 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:35:16 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 20 Mar 2025 14:34:16 +0000
Subject: [PATCH v3 7/7] coresight: Remove extern from function declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-james-coresight-claim-tags-v3-7-d3145c153820@linaro.org>
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
In-Reply-To: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_073518_021071_75BC64E5 
X-CRM114-Status: GOOD (  11.45  )
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


