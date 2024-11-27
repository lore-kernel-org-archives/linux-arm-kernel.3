Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54128D6ACD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7kJgHNm01IKskzLmLKRceDBFi0cAMzANbqkhR3ncBI=; b=MIVjmbWV+wdYmV6utz05I29Bbh
	PYyzfpF0TId7jJxDSoen98pgA5/gZ6pUUX4TwY3QRGqPi7rZCoXf53MdWK33fUfhJNyNZ25f83ySR
	3ZH9mWFvM3pV9QYKHuQnzUwk0cTo/n3vHTOe0yGDpy/neRw1XSiy2mgeqMo5BK7wTfQW+NWI6SaTJ
	4q6mbuspDdKatl5d9xLl8a7M/kQ1fEupwhUYOdc+2DTkHmExEzBAeIANLWkUuC1eqtSEcKUBNbBnC
	1pFPdRm/5wzj4/t8WhdkPOkBBBBCIKdm4jP2pSfqkCNRr1WpDazfkUptQZwhqGIZQRoDvtKhFLUNK
	9VVQeLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIRQ-0000000DIn8-1PLU;
	Wed, 27 Nov 2024 13:50:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIJw-0000000DHMt-3fGj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 13:43:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38245e072e8so6521148f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 05:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732714987; x=1733319787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7kJgHNm01IKskzLmLKRceDBFi0cAMzANbqkhR3ncBI=;
        b=yWc9INJ7saVU3VB+yA0XPxL1DE91OecoxA61+JCDP0ajiwoK84+2CNqcZ8uy7vqNe6
         9ka0z/ndomo7EUUnNYBSx1YDgZdPo30NISbxOlx4UCNEbPLwj+fKN+vDsCdarCkqOU8U
         jyQGKPTGkU+bLgHiACc12rasIb2AbFqiZLLjoxisUZIcXahOJizX5f1ynhONEpaiqEXm
         xtaBmWutKqrGf81EpI17kE1us4g01ykX8+pnQxPGhma7irnRzSZNegXBi6qwPyxVVD7R
         m7Uv1Mbtu0mLDTiswGBDM4fFBPv64t1dITPg2p0SbBW/wsZadeIdEZBqBnNBhfi/tCdz
         caOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714987; x=1733319787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7kJgHNm01IKskzLmLKRceDBFi0cAMzANbqkhR3ncBI=;
        b=KE5VPLLml5yNJvbbRVkrHw/Z+Z8mUuDPbEn3Yx9uvlnqHJPwG2lXD1G/CHif3HrFCy
         aOIlklc52iHCTlGDhqAvST3Y2eVps/am8FP2lRyYdCyqrvgdAV8xIboZxATpuW8KWgTG
         asPXKS6Iglybmc2QmOI3uPYMbM4WJlBdTGuyo566AX+/Htp63IlwYXymhwWiJoyNGdSt
         RkDkQAdOGrcMN4U9bl0WVkWaavErfAXg9q8bQhGdwgpRCFvvxXEPyay1eoV6zWgLQPHF
         B6+sbe9Sdqvm3VSCH03gAQ1W++5gmK1QyGl5lmOOBUDMeSA08cNPHmk1d7sQUC1SGecb
         0DaQ==
X-Gm-Message-State: AOJu0YzMjVcH2Hl2E7bURFcxD25BFdFTQnpPkksT+d/EGm6EOWhOY3oh
	NtWsBKz8jYbR5Mcnl9SldK/1dtp3MxndlUjPGl3SPCNGUtEYgYjXQbToYbDvJOQVeYEyFAlYTO3
	v
X-Gm-Gg: ASbGncuxXmwIfZJYHdBJ1MEG/xtSfs7iOCz5L3sBJsrfEGLJ8G/4zqKcBt5gvhvtw5N
	r1ICQAIPa5T+Np+kdkRTY0/BeKufhZKydmAN2MrwAwgxlnVZ5fUzPV5lo8E29vi4vDZpbV9NRY/
	w2JWbt3nTkamDsD3PWrgDDzq7PGmXqpTeeU320Izop3xwRzkYbJ2bN/wK2X79BxcyRQFxd64JtQ
	0a5xpwlJqGa0CZ4OTAhMrwYqutTCZnsTHvlv9xEqooPD/2WUNlz
X-Google-Smtp-Source: AGHT+IHEffJbV5FU44Sg2vjvGFPHX08rvjIkS/DbTK9x0xFkC61oO4Ei4XnSE2bObrNaR7appe2FPw==
X-Received: by 2002:a05:6000:156f:b0:382:495c:dee5 with SMTP id ffacd0b85a97d-385c6ed9398mr2565246f8f.37.1732714986968;
        Wed, 27 Nov 2024 05:43:06 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:9ff7:e7c5:5e0f:c5ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5fa2sm16804645f8f.1.2024.11.27.05.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:43:06 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	james.clark@arm.com,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 7/9] coresight: config: extract shared structures to common header file
Date: Wed, 27 Nov 2024 13:42:54 +0000
Message-Id: <20241127134256.2254851-8-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127134256.2254851-1-mike.leach@linaro.org>
References: <20241127134256.2254851-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_054308_915468_26DCE86F 
X-CRM114-Status: GOOD (  32.63  )
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

Extract shared user space and kernel common structures from
coresight-config.h into common header file coresight-config-desc.h

Abstract memory allocation in coresight-config-table.c to allow read
table functions to be run in userspace and kernel drivers.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-config-desc.h         | 105 ++++++++++++++++
 .../coresight/coresight-config-table.c        |  66 +++++-----
 .../hwtracing/coresight/coresight-config.h    | 119 ++++--------------
 3 files changed, 165 insertions(+), 125 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-config-desc.h

diff --git a/drivers/hwtracing/coresight/coresight-config-desc.h b/drivers/hwtracing/coresight/coresight-config-desc.h
new file mode 100644
index 000000000000..4a487743d7e2
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-config-desc.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020-2022 Linaro Limited, All rights reserved.
+ * Author: Mike Leach <mike.leach@linaro.org>
+ */
+
+#ifndef _CORESIGHT_CORESIGHT_CONFIG_DESC_H
+#define _CORESIGHT_CORESIGHT_CONFIG_DESC_H
+
+/* Coresight Descriptors common to kernel and userspace applications */
+/*
+ * Register type flags for register value descriptor:
+ * describe how the value is interpreted, and handled.
+ */
+#define CS_CFG_REG_TYPE_STD		0x80	/* reg is standard reg */
+#define CS_CFG_REG_TYPE_RESOURCE	0x40	/* reg is a resource */
+#define CS_CFG_REG_TYPE_VAL_PARAM	0x08	/* reg value uses param */
+#define CS_CFG_REG_TYPE_VAL_MASK	0x04	/* reg value bit masked */
+#define CS_CFG_REG_TYPE_VAL_64BIT	0x02	/* reg value 64 bit */
+#define CS_CFG_REG_TYPE_VAL_SAVE	0x01	/* reg value save on disable */
+
+/*
+ * flags defining what device class a feature will match to when processing a
+ * system configuration - used by config data and devices.
+ */
+#define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
+#define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
+
+/* flags defining device instance matching - used in config match desc data. */
+#define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
+
+/*
+ * Limit number of presets in a configuration
+ * This is related to the number of bits (4) we use to select the preset on
+ * the perf command line. Preset 0 is always none selected.
+ * See PMU_FORMAT_ATTR(preset, "config:0-3") in coresight-etm-perf.c
+ */
+#define CS_CFG_CONFIG_PRESET_MAX 15
+
+/**
+ * Parameter descriptor for a device feature.
+ *
+ * @name:  Name of parameter.
+ * @value: Initial or default value.
+ */
+struct cscfg_parameter_desc {
+	const char *name;
+	u64 value;
+};
+
+/**
+ * Representation of register value and a descriptor of register usage.
+ *
+ * Used as a descriptor in the feature descriptors.
+ * Used as a value in when in a feature loading into a csdev.
+ *
+ * Supports full 64 bit register value, or 32 bit value with optional mask
+ * value.
+ *
+ * @type:	define register usage and interpretation.
+ * @offset:	the address offset for register in the hardware device (per device specification).
+ * @hw_info:	optional hardware device type specific information. (ETM / CTI specific etc)
+ * @val64:	64 bit value.
+ * @val32:	32 bit value.
+ * @mask32:	32 bit mask when using 32 bit value to access device register - if mask type.
+ * @param_idx:	parameter index value into parameter array if param type.
+ */
+struct cscfg_regval_desc {
+	struct {
+		u32 type:8;
+		u32 offset:12;
+		u32 hw_info:12;
+	};
+	union {
+		u64 val64;
+		struct {
+			u32 val32;
+			u32 mask32;
+		};
+		u32 param_idx;
+	};
+};
+
+/**
+ * Dynamically loaded descriptor arrays.
+ *
+ * For builtin or module loaded configurations / features these are
+ * statically defined at compile time.
+
+ * For a dynamic load at runtime, using a config table, (e.g. load from
+ * configfs) we create the arrays dynamically so need a structure to
+ * manage these.
+ *
+ * @config_descs: array of config descriptor pointers.
+ * @feat_descs:	  array of feature descriptor pointers.
+ * @load_name:	  user readable name which may be used to unload later.
+ *		  Will be name of first config if present, or first feature.
+ */
+struct cscfg_table_load_descs {
+	struct cscfg_config_desc **config_descs;
+	struct cscfg_feature_desc **feat_descs;
+	char *load_name;
+};
+
+#endif  /* _CORESIGHT_CORESIGHT_CONFIG_DESC_H */
diff --git a/drivers/hwtracing/coresight/coresight-config-table.c b/drivers/hwtracing/coresight/coresight-config-table.c
index 0a8f017d76d2..6216dffc9f9e 100644
--- a/drivers/hwtracing/coresight/coresight-config-table.c
+++ b/drivers/hwtracing/coresight/coresight-config-table.c
@@ -79,6 +79,7 @@ static int cscfg_table_read_elem_str(const u8 *buffer, const int buflen, int *bu
 				     struct cscfg_table_elem_str *elem_str)
 {
 	int used = *buf_used;
+	const u8 *str;
 
 	if ((buflen - used) < sizeof(u16))
 		return -EINVAL;
@@ -88,11 +89,13 @@ static int cscfg_table_read_elem_str(const u8 *buffer, const int buflen, int *bu
 	if ((buflen - used) < elem_str->str_len)
 		return -EINVAL;
 
+	str = buffer + used;
+
 	/* check for 0 termination */
-	if (buffer[used + (elem_str->str_len - 1)] != 0)
+	if (str[elem_str->str_len - 1] != 0)
 		return -EINVAL;
 
-	elem_str->str = kstrdup((char *)(buffer + used),  GFP_KERNEL);
+	elem_str->str = cscfg_strdup((char *)str);
 	used += elem_str->str_len;
 
 	*buf_used = used;
@@ -103,12 +106,13 @@ static int cscfg_table_alloc_desc_arrays(struct cscfg_table_load_descs *desc_arr
 					 int nr_features, int nr_configs)
 {
 	/* arrays are 0 terminated - nr_configs & nr_features elements */
-	desc_arrays->config_descs = kcalloc(nr_configs + 1,  sizeof(struct cscfg_config_desc *),
-					    GFP_KERNEL);
+	desc_arrays->config_descs = cscfg_calloc(nr_configs + 1,
+						 sizeof(struct cscfg_config_desc *));
 	if (!desc_arrays->config_descs)
 		return -ENOMEM;
-	desc_arrays->feat_descs = kcalloc(nr_features + 1, sizeof(struct cscfg_feature_desc *),
-					  GFP_KERNEL);
+
+	desc_arrays->feat_descs = cscfg_calloc(nr_features + 1,
+					       sizeof(struct cscfg_feature_desc *));
 	if (!desc_arrays->feat_descs)
 		return -ENOMEM;
 	return 0;
@@ -123,24 +127,24 @@ static void cscfg_table_free_config_desc(struct cscfg_config_desc *config_desc)
 		return;
 
 	/* free presets */
-	kfree(config_desc->presets);
+	cscfg_free((void *)config_desc->presets);
 
 	/* free feat ref strings */
 	if (config_desc->nr_feat_refs) {
 		/* each string */
 		for (i = 0; i < config_desc->nr_feat_refs; i++)
-			kfree(config_desc->feat_ref_names[i]);
+			cscfg_free((void *)config_desc->feat_ref_names[i]);
 
 		/* and the char * array */
-		kfree(config_desc->feat_ref_names);
+		cscfg_free((void *)config_desc->feat_ref_names);
 	}
 
 	/* next the strings */
-	kfree(config_desc->name);
-	kfree(config_desc->description);
+	cscfg_free((void *)config_desc->name);
+	cscfg_free((void *)config_desc->description);
 
 	/* finally the struct itself */
-	kfree(config_desc);
+	cscfg_free((void *)config_desc);
 }
 
 static int cscfg_table_read_elem_config(const u8 *buffer, const int buflen, int *buf_used,
@@ -165,7 +169,7 @@ static int cscfg_table_read_elem_config(const u8 *buffer, const int buflen, int
 		return 0;
 
 	/* we have a config - allocate the descriptor */
-	config_desc = kzalloc(sizeof(struct cscfg_config_desc), GFP_KERNEL);
+	config_desc = cscfg_zalloc(sizeof(struct cscfg_config_desc));
 	if (!config_desc)
 		return -ENOMEM;
 
@@ -177,7 +181,7 @@ static int cscfg_table_read_elem_config(const u8 *buffer, const int buflen, int
 
 	/* allocate load name if not set */
 	if (!desc_arrays->load_name)
-		desc_arrays->load_name = kstrdup(config_desc->name, GFP_KERNEL);
+		desc_arrays->load_name = cscfg_strdup(config_desc->name);
 
 	/* read the description string */
 	err = cscfg_table_read_elem_str(buffer, buflen, &used, &elem_str);
@@ -195,7 +199,7 @@ static int cscfg_table_read_elem_config(const u8 *buffer, const int buflen, int
 	/* read the array of 64bit presets if present */
 	nr_preset_vals = config_desc->nr_total_params * config_desc->nr_presets;
 	if (nr_preset_vals) {
-		presets = kcalloc(nr_preset_vals, sizeof(u64), GFP_KERNEL);
+		presets = cscfg_calloc(nr_preset_vals, sizeof(u64));
 		if (!presets)
 			return -ENOMEM;
 
@@ -210,8 +214,8 @@ static int cscfg_table_read_elem_config(const u8 *buffer, const int buflen, int
 
 	/* read the array of feature names referenced by the config */
 	if (config_desc->nr_feat_refs) {
-		config_desc->feat_ref_names = kcalloc(config_desc->nr_feat_refs,
-						      sizeof(char *), GFP_KERNEL);
+		config_desc->feat_ref_names = cscfg_calloc(config_desc->nr_feat_refs,
+							   sizeof(char *));
 		if (!config_desc->feat_ref_names)
 			return -ENOMEM;
 
@@ -255,17 +259,17 @@ static void cscfg_table_free_feat_desc(struct cscfg_feature_desc *feat_desc)
 		return;
 
 	/* free up the register descriptor array */
-	kfree(feat_desc->regs_desc);
+	cscfg_free((void *)feat_desc->regs_desc);
 
 	/* free up the parameters array */
-	kfree(feat_desc->params_desc);
+	cscfg_free((void *)feat_desc->params_desc);
 
 	/* name and description strings */
-	kfree(feat_desc->name);
-	kfree(feat_desc->description);
+	cscfg_free((void *)feat_desc->name);
+	cscfg_free((void *)feat_desc->description);
 
 	/* finally the struct itself */
-	kfree(feat_desc);
+	cscfg_free((void *)feat_desc);
 }
 
 static int cscfg_table_read_elem_feature(const u8 *buffer, const int buflen, int *buf_used,
@@ -280,7 +284,7 @@ static int cscfg_table_read_elem_feature(const u8 *buffer, const int buflen, int
 	u32 val32;
 
 	/* allocate the feature descriptor object */
-	feat_desc = kzalloc(sizeof(struct cscfg_feature_desc), GFP_KERNEL);
+	feat_desc = cscfg_zalloc(sizeof(struct cscfg_feature_desc));
 	if (!feat_desc)
 		return -ENOMEM;
 
@@ -300,7 +304,7 @@ static int cscfg_table_read_elem_feature(const u8 *buffer, const int buflen, int
 
 	/* allocate load name if not set previously by config  */
 	if (!desc_arrays->load_name)
-		desc_arrays->load_name = kstrdup(feat_desc->name, GFP_KERNEL);
+		desc_arrays->load_name = cscfg_strdup(feat_desc->name);
 
 	/* read the description string */
 	err = cscfg_table_read_elem_str(buffer, buflen, &used, &elem_str);
@@ -323,8 +327,8 @@ static int cscfg_table_read_elem_feature(const u8 *buffer, const int buflen, int
 		nr_regs_bytes = ((sizeof(u32) + sizeof(u64)) * feat_desc->nr_regs);
 		if ((buflen - used) < nr_regs_bytes)
 			return -EINVAL;
-		feat_desc->regs_desc = kcalloc(feat_desc->nr_regs,
-					       sizeof(struct cscfg_regval_desc), GFP_KERNEL);
+		feat_desc->regs_desc = cscfg_calloc(feat_desc->nr_regs,
+						    sizeof(struct cscfg_regval_desc));
 		if (!feat_desc->regs_desc)
 			return -ENOMEM;
 
@@ -338,8 +342,8 @@ static int cscfg_table_read_elem_feature(const u8 *buffer, const int buflen, int
 
 	/* parameter descriptors - string + 64 bit value */
 	if (feat_desc->nr_params) {
-		feat_desc->params_desc = kcalloc(feat_desc->nr_params,
-						 sizeof(struct cscfg_parameter_desc), GFP_KERNEL);
+		feat_desc->params_desc = cscfg_calloc(feat_desc->nr_params,
+						      sizeof(struct cscfg_parameter_desc));
 		if (!feat_desc->params_desc)
 			return -ENOMEM;
 		for (i = 0; i < feat_desc->nr_params; i++) {
@@ -421,7 +425,7 @@ void cscfg_table_free_load_descs(struct cscfg_table_load_descs *desc_arrays)
 	}
 
 	/* finally free up the load descs pointer arrays */
-	kfree(desc_arrays->config_descs);
-	kfree(desc_arrays->feat_descs);
-	kfree(desc_arrays->load_name);
+	cscfg_free(desc_arrays->config_descs);
+	cscfg_free(desc_arrays->feat_descs);
+	cscfg_free(desc_arrays->load_name);
 }
diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index ea3aaf0d129b..8b298e9a3776 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -10,101 +10,10 @@
 #include <linux/coresight.h>
 #include <linux/types.h>
 
-/* CoreSight Configuration Management - component and system wide configuration */
-
-/*
- * Register type flags for register value descriptor:
- * describe how the value is interpreted, and handled.
- */
-#define CS_CFG_REG_TYPE_STD		0x80	/* reg is standard reg */
-#define CS_CFG_REG_TYPE_RESOURCE	0x40	/* reg is a resource */
-#define CS_CFG_REG_TYPE_VAL_PARAM	0x08	/* reg value uses param */
-#define CS_CFG_REG_TYPE_VAL_MASK	0x04	/* reg value bit masked */
-#define CS_CFG_REG_TYPE_VAL_64BIT	0x02	/* reg value 64 bit */
-#define CS_CFG_REG_TYPE_VAL_SAVE	0x01	/* reg value save on disable */
-
-/*
- * flags defining what device class a feature will match to when processing a
- * system configuration - used by config data and devices.
- */
-#define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
-#define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
-
-/* flags defining device instance matching - used in config match desc data. */
-#define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
-
-/*
- * Limit number of presets in a configuration
- * This is related to the number of bits (4) we use to select the preset on
- * the perf command line. Preset 0 is always none selected.
- * See PMU_FORMAT_ATTR(preset, "config:0-3") in coresight-etm-perf.c
- */
-#define CS_CFG_CONFIG_PRESET_MAX 15
-
-/**
- * Parameter descriptor for a device feature.
- *
- * @name:  Name of parameter.
- * @value: Initial or default value.
- */
-struct cscfg_parameter_desc {
-	const char *name;
-	u64 value;
-};
-
-/**
- * Representation of register value and a descriptor of register usage.
- *
- * Used as a descriptor in the feature descriptors.
- * Used as a value in when in a feature loading into a csdev.
- *
- * Supports full 64 bit register value, or 32 bit value with optional mask
- * value.
- *
- * @type:	define register usage and interpretation.
- * @offset:	the address offset for register in the hardware device (per device specification).
- * @hw_info:	optional hardware device type specific information. (ETM / CTI specific etc)
- * @val64:	64 bit value.
- * @val32:	32 bit value.
- * @mask32:	32 bit mask when using 32 bit value to access device register - if mask type.
- * @param_idx:	parameter index value into parameter array if param type.
- */
-struct cscfg_regval_desc {
-	struct {
-		u32 type:8;
-		u32 offset:12;
-		u32 hw_info:12;
-	};
-	union {
-		u64 val64;
-		struct {
-			u32 val32;
-			u32 mask32;
-		};
-		u32 param_idx;
-	};
-};
-
-/**
- * Dynamically loaded descriptor arrays.
- *
- * For builtin or module loaded configurations / features these are
- * statically defined at compile time.
+/* common descriptor definitions */
+#include "coresight-config-desc.h"
 
- * For a dynamic load at runtime, using a config table, (e.g. load from
- * configfs) we create the arrays dynamically so need a structure to
- * manage these.
- *
- * @config_descs: array of config descriptor pointers.
- * @feat_descs:	  array of feature descriptor pointers.
- * @load_name:	  user readable name which may be used to unload later.
- *		  Will be name of first config if present, or first feature.
- */
-struct cscfg_table_load_descs {
-	struct cscfg_config_desc **config_descs;
-	struct cscfg_feature_desc **feat_descs;
-	char *load_name;
-};
+/* CoreSight Configuration Management - component and system wide configuration */
 
 /**
  * Device feature descriptor - combination of registers and parameters to
@@ -280,4 +189,26 @@ void cscfg_csdev_disable_config(struct cscfg_config_csdev *config_csdev);
 /* reset a feature to default values */
 void cscfg_reset_feat(struct cscfg_feature_csdev *feat_csdev);
 
+
+/* Kernel allocators for descriptors in common config table read code  */
+static inline void *cscfg_calloc(size_t num, size_t size)
+{
+	return kcalloc(num, size, GFP_KERNEL);
+}
+
+static inline char *cscfg_strdup(const char *str)
+{
+	return kstrdup(str, GFP_KERNEL);
+}
+
+static inline void *cscfg_zalloc(size_t size)
+{
+	return kzalloc(size, GFP_KERNEL);
+}
+
+static inline void cscfg_free(void *mem)
+{
+	kfree(mem);
+}
+
 #endif /* _CORESIGHT_CORESIGHT_CONFIG_H */
-- 
2.25.1


