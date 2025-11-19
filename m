Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACE3CF394B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEWvhI86IGkr275YCXI4U9akHZM2f251P0zZm4c5HV0=; b=gqxLUIDVBYILsCweEvmdDu3syj
	HNnkOF0xmSptXZ5kovIo9wF9BCVALJU0WXgwTSEVchM6lAwm9l41f67jMh6cPy/yQ5cG6RtkoNlZy
	dS7gxxeYjKcz52CeiKenEc3c/Ke6j82gYFuCXHrrr1ENl6C4KjmTDF5+fm8gROdu5tUvEcGJSQzc8
	SGDhqbAvbEPUcSDswgU+ZdPHp8/WDogqSOpVZM9ckOK0DmzdNzuLdTdhhqTG2IWo9Sa/nM7tRrnBt
	4N4mRMgxbW7b84e6VkhX4xszTQRFyi3ylj0W/jFRKQ8i7hnfAnxCRjBtzOsMC/qZA2pHWzpdbYwVd
	MZRjhS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkOE-00000003XPJ-2lac;
	Wed, 19 Nov 2025 15:46:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNZ-00000003WYV-23Lr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b38693c4dso3139496f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567155; x=1764171955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEWvhI86IGkr275YCXI4U9akHZM2f251P0zZm4c5HV0=;
        b=j9MYeQdY1lGuLx8O2cJIE6Ojd4dW7orT6DYIZOdBk0koGfVU7GTiam7q/73xPkV4oW
         0Y8x+oEbBrXQv+DeJVwrkXOKBnBzDLhScvrVrVHJ+Gul7uyLlckhouU5mAYuPwg3iLbV
         YXT9NcsqhdBt5FLgUCPnxNnLk5n+r+2SYk8vYUCYy1e5/sGFpFV+hzoE1a7UKlPhTBx1
         8XrIbz/+kmW80mpwDHt8YKdBP2g7LZqm7Dvnh947CPw1VCjpqYSjr20EISFEKdAogY85
         vaA+zm9DBqfIsdDShLXv2DXxj8b4WqZIPKufzWlDbe+DYy4IXz1WZjroKbXzUXcsK76z
         TbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567155; x=1764171955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEWvhI86IGkr275YCXI4U9akHZM2f251P0zZm4c5HV0=;
        b=CfmI7ZuccKvkuEs1KrkPhvsXwPquzljK4g7BApRrDPAvdTPiMhuRSXEwjBybl61u0X
         hg5r8Z67qowAYSb6RiAWExRArXDjBNFZCgj8RL/2XLAqrLlezmYNjcJODX7YeCJizozT
         qu2Q01VlQ0Licgqx3/uxvr0OEm6sSqM2ZQOLRRqh8zlE1JMUul5GHpZF/4ExxGkOQ+r2
         Tegnc+sFXXc0QlZZHxk7Db6hZRBFlEx1aKND5FBY8QcPB1rAoAxMezaZJ0KoiDuhPZBY
         uu9rFfnIeDcMjSj2FctPGa2ua/nxsOcsJd/QIDL5vs3lvWWVWCMqKRVtU07RAG89+yWK
         ItnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3wFem4H+UrLiLLB5aGeDjHNQN+T/kT6ry6/vgRr8+Cc4iTmPfv3PfH9X2NfcncK7U27DL4EaFGwpJZKjwhHHI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw01jBsbDl2LY5TBl54khkr9CTO3BaSAq/4n3jzUyzLXQIpkfJE
	IYEsC2PDgcXf4HP5Up+F4126nwTB7wP6Ns3Fxv4vVKws14pBG+DVp7cZhoJ3NILHSao=
X-Gm-Gg: ASbGncsc9XfxvZloTlreIYcAy57KF7KYcruTLGfS7qvTl0U5d+7eKuwU3BTj+3E2fFT
	O3GTviw/j1NJMUbNrQ0MYmoeT2Ke0LSUUtVGEsdBvYDvHEeSTXU9qcqvRMWg/TIhV1+wGJ1XJRZ
	NJXrAqWEXFky5ZDSsPZOqrXjpKy0XQLtHrFSAj72UjPx5/ACV9O1mSRp+CIDSd3cHyRLJWhQT5w
	OG5kXcxZNQ0XXgrmgx3Zpi2AOg4og0cQbTaGKRSt6J1n/3oGsKWpkIHoaXsvkuyGkWc2UbwGBiV
	RxZIV6vG/p/y5oKE154Y7VhlXynCUUM1QGyTBp9sMuitOI6RJIUHh4O+2ogRiqb0RhTLpR2uqZI
	phQxSBUbVzIfZfWlp4v6+3UXBm5U+Os5GdsVc/qSByFLaT3E6DttoCvaueew4k6S0SmOEKEMPfX
	VC8FFjejeeASS1QdnDcKJwOmn8bvTPbmw9DxWMYrPO
X-Google-Smtp-Source: AGHT+IGkk7cUbQZnXjGag8yPABXUYogSDTvlv9CsdaEjFL1fCOMxhsVRR8P5cnyld7ERa3Ar7rkUkQ==
X-Received: by 2002:a05:6000:22c1:b0:42b:3ab7:b8a4 with SMTP id ffacd0b85a97d-42b5938b4b1mr19940877f8f.33.1763567155275;
        Wed, 19 Nov 2025 07:45:55 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:54 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 22/26] remoteproc: qcom: Extract minidump definitions into a header
Date: Wed, 19 Nov 2025 17:44:23 +0200
Message-ID: <20251119154427.1033475-23-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074557_629402_70D32C7A 
X-CRM114-Status: GOOD (  19.24  )
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

Extract the minidump definitions into a header such that the
definitions can be reused by other drivers.
No other change, purely moving the definitions.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/remoteproc/qcom_common.c  | 56 +------------------------
 include/linux/soc/qcom/minidump.h | 68 +++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 55 deletions(-)
 create mode 100644 include/linux/soc/qcom/minidump.h

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 8c8688f99f0a..4f1c8d005c97 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -18,6 +18,7 @@
 #include <linux/rpmsg/qcom_smd.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/minidump.h>
 #include <linux/soc/qcom/smem.h>
 
 #include "remoteproc_internal.h"
@@ -28,61 +29,6 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_NUM_OF_SS           10
-#define MAX_REGION_NAME_LENGTH  16
-#define SBL_MINIDUMP_SMEM_ID	602
-#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
-#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
-#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
-
-/**
- * struct minidump_region - Minidump region
- * @name		: Name of the region to be dumped
- * @seq_num:		: Use to differentiate regions with same name.
- * @valid		: This entry to be dumped (if set to 1)
- * @address		: Physical address of region to be dumped
- * @size		: Size of the region
- */
-struct minidump_region {
-	char	name[MAX_REGION_NAME_LENGTH];
-	__le32	seq_num;
-	__le32	valid;
-	__le64	address;
-	__le64	size;
-};
-
-/**
- * struct minidump_subsystem - Subsystem's SMEM Table of content
- * @status : Subsystem toc init status
- * @enabled : if set to 1, this region would be copied during coredump
- * @encryption_status: Encryption status for this subsystem
- * @encryption_required : Decides to encrypt the subsystem regions or not
- * @region_count : Number of regions added in this subsystem toc
- * @regions_baseptr : regions base pointer of the subsystem
- */
-struct minidump_subsystem {
-	__le32	status;
-	__le32	enabled;
-	__le32	encryption_status;
-	__le32	encryption_required;
-	__le32	region_count;
-	__le64	regions_baseptr;
-};
-
-/**
- * struct minidump_global_toc - Global Table of Content
- * @status : Global Minidump init status
- * @md_revision : Minidump revision
- * @enabled : Minidump enable status
- * @subsystems : Array of subsystems toc
- */
-struct minidump_global_toc {
-	__le32				status;
-	__le32				md_revision;
-	__le32				enabled;
-	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
-};
-
 struct qcom_ssr_subsystem {
 	const char *name;
 	struct srcu_notifier_head notifier_list;
diff --git a/include/linux/soc/qcom/minidump.h b/include/linux/soc/qcom/minidump.h
new file mode 100644
index 000000000000..25247a6216e2
--- /dev/null
+++ b/include/linux/soc/qcom/minidump.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm Minidump definitions
+ *
+ * Copyright (C) 2016 Linaro Ltd
+ * Copyright (C) 2015 Sony Mobile Communications Inc
+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QCOM_MINIDUMP_H__
+#define __QCOM_MINIDUMP_H__
+
+#define MAX_NUM_OF_SS           10
+#define MAX_REGION_NAME_LENGTH  16
+#define SBL_MINIDUMP_SMEM_ID	602
+#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+
+/**
+ * struct minidump_region - Minidump region
+ * @name		: Name of the region to be dumped
+ * @seq_num:		: Use to differentiate regions with same name.
+ * @valid		: This entry to be dumped (if set to 1)
+ * @address		: Physical address of region to be dumped
+ * @size		: Size of the region
+ */
+struct minidump_region {
+	char	name[MAX_REGION_NAME_LENGTH];
+	__le32	seq_num;
+	__le32	valid;
+	__le64	address;
+	__le64	size;
+};
+
+/**
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
+ * @status : Subsystem toc init status
+ * @enabled : if set to 1, this region would be copied during coredump
+ * @encryption_status: Encryption status for this subsystem
+ * @encryption_required : Decides to encrypt the subsystem regions or not
+ * @region_count : Number of regions added in this subsystem toc
+ * @regions_baseptr : regions base pointer of the subsystem
+ */
+struct minidump_subsystem {
+	__le32	status;
+	__le32	enabled;
+	__le32	encryption_status;
+	__le32	encryption_required;
+	__le32	region_count;
+	__le64	regions_baseptr;
+};
+
+/**
+ * struct minidump_global_toc - Global Table of Content
+ * @status : Global Minidump init status
+ * @md_revision : Minidump revision
+ * @enabled : Minidump enable status
+ * @subsystems : Array of subsystems toc
+ */
+struct minidump_global_toc {
+	__le32				status;
+	__le32				md_revision;
+	__le32				enabled;
+	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+};
+
+#endif
-- 
2.43.0


