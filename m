Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F98CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=; b=mosi3uYHgm4gNPOxV+i1nyoeS8
	x3hILijj4jYHfDffQvvgSazofoNpjmdjVXVw2yiFouvf3uqx/6d7yJpf0CynxWYC0zAz2hq7w2MGf
	MHxzgPhFA8qVUs0ZD7vZazr/HBLWZFKh5xt/zLsIAcPIxcUnBwGn8TjLa+EuxhzWzb+3TkhbmoYyc
	6+1pz3Kd5VWz2Fquza9ZzWHiLexK4N1joksH4LlFLoSMIGmKjkKKGvm5dUITEFsdZfsDk5CDqLNz5
	XIF8UkLoXGVXzQIMokBsbVWQjxRAftGu79UZ/gvajlAszos/ByPL+EJ1lNKJaPlbojoSz7vNHx1g8
	F30OhFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZwz-00000006Yqv-1Dz2;
	Tue, 18 Mar 2025 16:37:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZi8-00000006VtE-1v5j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:22:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-390effd3e85so4863809f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742314955; x=1742919755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=;
        b=yAGHp1Kg8/oH07UZo1f0fDXa0dRQCe5ypDzWksJXvaz0PNIrb31BYDZcwcIW1yJzaD
         DfhxJtqKCVwETvL3fLkwhzZmLWG6ZFw9SfvfyfK0dq0JeM/sH+/2v0q0Nw3LO3ZgNAJN
         AE28EXDnAcvkL/QFFuTEyySXNEuanvLXMbAMuUeN9hayHcy7BKcf+OFrpji0tJZehx5O
         1KSPOeAq+sjymzFfqyOJz31HgTslipHgJ+jAYh5enFrwCNdV54gDEcjmdfWhts59pTMt
         u1Ym3FXIveuU8blGBjh4z6DWv9l93UuwJdPdsEk9a25fAvqUk095IgphTdld8Wp2vCG9
         fQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314955; x=1742919755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktzMOZYNlwNiDxoE8omHkFi9oPhb83P0wnx9jkyg590=;
        b=j7nR0uWh1rTwXRkw/It9J9Hga+TPz/LCxSqmM8XIKH6CqVgvsck0bwfP5rCBm0HDH9
         XLybrwkfla04ph83LMuRvtGZ252DGkva0XWsYs05lX1N9oZBxOR3MvkoO2Nc76Y4LFgD
         4WjGCO856nsv6dxEzn5eIro2wCggcpKCAQGLMGaDJXubtXWVriChsSf67cv6+Vq9GyoU
         RYKYwYcQQPaGCC9UIVkSe00kM0sc6DiGWI1j2b3mX0v19jUwM4dzXoD7sFdBA7b64J0p
         JTu4UIit1/5UeYN7gsID35n7wkTyHSDHxkkjQQTYs9v4mxj0QyMn+6Tr665pk6Jwtm3g
         xy3g==
X-Forwarded-Encrypted: i=1; AJvYcCWRm3+TOc+9QuHSD4QiaZjDSkSfIVQDBqV03HyEhb0sGHk7roFfwTYK/UDVYXtAlLO7EVFvCTLgWFTuuYdbVXSk@lists.infradead.org
X-Gm-Message-State: AOJu0YwHP7NMRiUskzS52T21LfyQB/3F0/O7w95XG/Ul9Nop3vjFaT17
	z+71x/JfZVVzjz0m3E+fVX3aCjDrayDp+/OcHlHozgRazKH39fzHdJs2VqdPPXB0PfAeAKgBTuL
	j
X-Gm-Gg: ASbGncu4gqIan5s/og5CLOTx+KIILO4C8i0Q4ENApVd2hzzx4y+0mkvV44nWTnwV5xv
	hAzk5yvq8S8sqpqxOQDHOM48xM723QKmJjVLXfBPLoXZB3ET7IM5nhboZprfQ76ioS9vIsb5OR6
	HkQLBFirzxE11isKq3YSk0GSicoaXmOOS7gh+FXWLauXdmvthNpam+imKdRvcFZZLrUafs1mcMu
	PHs/2Kc5C4895xpXrJyLlZqxSLOvX4MUWsrUlS/Yhx7Tp00cC4Te6RzFc4eRNKBtx8sAyTrIklb
	mG0h3dcRZ5JZVoIIlREjtkpG9vpe4GvadVaK94ZmYYclG6Q=
X-Google-Smtp-Source: AGHT+IGJ+MGp/aQ7ouZ/3tsk70ncM8V1wNpnssWoc4eHTIu28PpPLIFGuzYHt7Mmu48slGPW7y2ccA==
X-Received: by 2002:a5d:5e0c:0:b0:390:fe4b:70b9 with SMTP id ffacd0b85a97d-3971daeb6cdmr13373876f8f.21.1742314954910;
        Tue, 18 Mar 2025 09:22:34 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:22:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:22:02 +0000
Subject: [PATCH v2 8/8] coresight: Remove extern from function declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-james-coresight-claim-tags-v2-8-e9c8a9cde84e@linaro.org>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
In-Reply-To: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
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
X-CRM114-CacheID: sfid-20250318_092236_497826_980F3DFA 
X-CRM114-Status: GOOD (  11.68  )
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


