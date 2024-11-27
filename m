Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993A7D6ACD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyZuZfXEwO8d6lRLKEFPF6ZWKWzWzABGPH32iU5IC2w=; b=EeV96ZIaJaQXu7q+jQ/WTj/Iwn
	ngFP1jXXu2n7qGN01pBKL6OmmPArIXx4ffwfAgLct1hmmsGfrGoARM5D18gfJ/Rr0usGaortRZk/3
	O9PCmloZRo/G76PlyemYCKN+Ue09Ul7CUj0AhUg5w9KtI+wZQYg8kYQjB2lIepCD6NFVqIVlkwO8V
	zBRpQS0M4s5LNTM3ZfisfTLfcO/FIwgW6paKj0hzg7bHjX4ccOopp6lWTNO2qe+g8oOtJA368HDRS
	unc0CppvrmITPYbFIoycfA4LXYlj8P4L3jVN2HkrSc8UGtUznLGfMl3z5W7ryJZIZQR/YaSOaZQOS
	SjI89Ncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIMi-0000000DI7B-104k;
	Wed, 27 Nov 2024 13:46:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIJr-0000000DHJz-2A4U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 13:43:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434aa472617so7087635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 05:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732714982; x=1733319782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyZuZfXEwO8d6lRLKEFPF6ZWKWzWzABGPH32iU5IC2w=;
        b=ISv6KUe39O3ibh3iAiIUXP0NR4UwQrgQIGPdJGJ2l6CnklXDa+8jgsnGSjVEk6fqVz
         wL1a9AAXGMxDl1WUHNRL4ahm/mfN/uLcIdsdKu0XMOOliOttrGbQSmoG01UCNQsDXRwv
         jWA0GFJfO3EEG0pgxvf9ocKLlnBXLG+IJZkhZlgnJrteBz59bOPZkO2mEQ7z1YiAr4QK
         Gnmknj90Zb+teIyo7gym9xiGOIfc0sF9X4iZqnbKZDDizYhV7j83FlTEDz38sUGxp6mJ
         Zo9ewLFu7MsSQFUNemwACyyGERKBD8YASMgAB5D6Fjj9HwlKJLFHxDtgnKLRWFpxwSio
         GpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714982; x=1733319782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyZuZfXEwO8d6lRLKEFPF6ZWKWzWzABGPH32iU5IC2w=;
        b=VY2sWsMkLJM7VUma43d5D1ixCTl89oNtMRa2Ni1a0jZxxv+KSbrN1OwfDsjdAf6UTc
         51WYV87XiM2Zu8BEP+VmmoPXRTnXu/C1CMCx093ZsOYwf2ygOqjN7rHin+G0wKVRcqKA
         bMcqaKOqazUUyVaRQM4DNA3Q+Q8gbzi/E6PgHwx3krcfsH/BOP8EH118P4lZtIxytfDx
         15q/c4w7zCVic2Y9f533e/NcKaiFDpV3B1GzLzQYVZzqM4vN1U5pDe2LsvGgk9EHyYMH
         YNB62WSUZnG4kII5WzvNcJZW28FZs2mw/z9p/tcddmeocVOOuy9z59N2y3Hi8dIrryYm
         b68w==
X-Gm-Message-State: AOJu0YzLce5pONcmBO7DlxRRaLI5grvmWE9d7B/JqczbE5l34e1QCYzi
	txFHcGgnlsCBvSikvdcQR77Ao5ERMgv1RAwZ0h9ibRewJ+aDzJTc89MyEd+Nkfclnz91Wtl5wXD
	t
X-Gm-Gg: ASbGncuTrhvVkZQ8Rwpouv4kA+cWgzjdjhsgGdfXOqO4oAwLMkKvQHCgrUbJG8QcQvH
	KKXjmV0Z6MYimKVTxgCiG8sRxRNzZDxl9slLyGHxucZEEGBhzks4HdiYWcNjPQBMfWBqy0KPj0s
	qdPIBiGzyiulgvbpoPDpvEbtah5BfE/5mjkNXR726KwgmKPMTuvyYKPdXAhHGX5084eRyzSRXm/
	jMqsLwzEanQwW8E6wGSzYdhe4RF71HNMmOQMnK3vHb1nRqbIixK
X-Google-Smtp-Source: AGHT+IGBVYI2t/KGowZk4skZcgBiYypH1fP6FHAu95XaFsNOk9JsQ26I9KCwHiJ4umfksH9uVkQHgw==
X-Received: by 2002:a05:600c:6d46:b0:434:a5d1:9917 with SMTP id 5b1f17b1804b1-434a9de4533mr23641915e9.21.1732714981728;
        Wed, 27 Nov 2024 05:43:01 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:9ff7:e7c5:5e0f:c5ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5fa2sm16804645f8f.1.2024.11.27.05.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:43:01 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	james.clark@arm.com,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 2/9] coresight: configfs: Update memory allocation / free for configfs elements
Date: Wed, 27 Nov 2024 13:42:49 +0000
Message-Id: <20241127134256.2254851-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127134256.2254851-1-mike.leach@linaro.org>
References: <20241127134256.2254851-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_054303_553321_12A56E80 
X-CRM114-Status: GOOD (  23.44  )
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

Previously, the objects backing the configfs directories and files were
created using devm managed memory on the coresight device.

Now we are adding configfs load/unload, configurations can be loaded
many times over the lifetime of the device, so it is more appropriate to
use normally allocated and freed memory.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-syscfg-configfs.c     | 119 +++++++++++++-----
 1 file changed, 88 insertions(+), 31 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
index 433ede94dd63..6e8c8db52d39 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -14,7 +14,7 @@ static inline struct config_item_type *cscfg_create_ci_type(void)
 {
 	struct config_item_type *ci_type;
 
-	ci_type = devm_kzalloc(cscfg_device(), sizeof(*ci_type), GFP_KERNEL);
+	ci_type = kzalloc(sizeof(*ci_type), GFP_KERNEL);
 	if (ci_type)
 		ci_type->ct_owner = THIS_MODULE;
 
@@ -175,6 +175,19 @@ static struct config_item_type cscfg_config_preset_type = {
 	.ct_attrs = cscfg_config_preset_attrs,
 };
 
+
+/* walk list of presets and free the previously allocated memory */
+static void cscfg_destroy_preset_groups(struct config_group *cfg_view_group)
+{
+	struct cscfg_fs_preset *cfg_fs_preset;
+	struct config_group *p_group;
+
+	list_for_each_entry(p_group, &cfg_view_group->default_groups, default_groups) {
+		cfg_fs_preset = container_of(p_group, struct cscfg_fs_preset, group);
+		kfree(cfg_fs_preset);
+	}
+}
+
 static int cscfg_add_preset_groups(struct cscfg_fs_config *cfg_view)
 {
 	int preset_num;
@@ -186,11 +199,12 @@ static int cscfg_add_preset_groups(struct cscfg_fs_config *cfg_view)
 		return 0;
 
 	for (preset_num = 1; preset_num <= config_desc->nr_presets; preset_num++) {
-		cfg_fs_preset = devm_kzalloc(cscfg_device(),
-					     sizeof(struct cscfg_fs_preset), GFP_KERNEL);
+		cfg_fs_preset = kzalloc(sizeof(struct cscfg_fs_preset), GFP_KERNEL);
 
-		if (!cfg_fs_preset)
+		if (!cfg_fs_preset) {
+			cscfg_destroy_preset_groups(&cfg_view->group);
 			return -ENOMEM;
+		}
 
 		snprintf(name, CONFIGFS_ITEM_NAME_LEN, "preset%d", preset_num);
 		cfg_fs_preset->preset_num = preset_num;
@@ -204,14 +218,10 @@ static int cscfg_add_preset_groups(struct cscfg_fs_config *cfg_view)
 
 static struct config_group *cscfg_create_config_group(struct cscfg_config_desc *config_desc)
 {
-	struct cscfg_fs_config *cfg_view;
-	struct device *dev = cscfg_device();
+	struct cscfg_fs_config *cfg_view = NULL;
 	int err;
 
-	if (!dev)
-		return ERR_PTR(-EINVAL);
-
-	cfg_view = devm_kzalloc(dev, sizeof(struct cscfg_fs_config), GFP_KERNEL);
+	cfg_view = kzalloc(sizeof(struct cscfg_fs_config), GFP_KERNEL);
 	if (!cfg_view)
 		return ERR_PTR(-ENOMEM);
 
@@ -220,12 +230,21 @@ static struct config_group *cscfg_create_config_group(struct cscfg_config_desc *
 
 	/* add in a preset<n> dir for each preset */
 	err = cscfg_add_preset_groups(cfg_view);
-	if (err)
+	if (err) {
+		kfree(cfg_view);
 		return ERR_PTR(err);
-
+	}
 	return &cfg_view->group;
 }
 
+static void cscfg_destroy_config_group(struct config_group *group)
+{
+	struct cscfg_fs_config *cfg_view = container_of(group, struct cscfg_fs_config, group);
+
+	cscfg_destroy_preset_groups(&cfg_view->group);
+	kfree(cfg_view);
+}
+
 /* attributes for features view */
 
 static ssize_t cscfg_feat_description_show(struct config_item *item, char *page)
@@ -314,6 +333,17 @@ static struct config_item_type cscfg_param_view_type = {
 	.ct_attrs = cscfg_param_view_attrs,
 };
 
+/* walk the list of default groups - which were set as param items and remove */
+static void cscfg_destroy_params_group_items(struct config_group *params_group)
+{
+	struct cscfg_fs_param *param_item;
+	struct config_group *p_group;
+
+	list_for_each_entry(p_group, &params_group->default_groups, default_groups) {
+		param_item = container_of(p_group, struct cscfg_fs_param, group);
+		kfree(param_item);
+	}
+}
 /*
  * configfs has far less functionality provided to add attributes dynamically than sysfs,
  * and the show and store fns pass the enclosing config_item so the actual attribute cannot
@@ -322,15 +352,16 @@ static struct config_item_type cscfg_param_view_type = {
 static int cscfg_create_params_group_items(struct cscfg_feature_desc *feat_desc,
 					   struct config_group *params_group)
 {
-	struct device *dev = cscfg_device();
 	struct cscfg_fs_param *param_item;
 	int i;
 
 	/* parameter items - as groups with default_value attribute */
 	for (i = 0; i < feat_desc->nr_params; i++) {
-		param_item = devm_kzalloc(dev, sizeof(struct cscfg_fs_param), GFP_KERNEL);
-		if (!param_item)
+		param_item = kzalloc(sizeof(struct cscfg_fs_param), GFP_KERNEL);
+		if (!param_item) {
+			cscfg_destroy_params_group_items(params_group);
 			return -ENOMEM;
+		}
 		param_item->feat_desc = feat_desc;
 		param_item->param_idx = i;
 		config_group_init_type_name(&param_item->group,
@@ -343,27 +374,22 @@ static int cscfg_create_params_group_items(struct cscfg_feature_desc *feat_desc,
 
 static struct config_group *cscfg_create_feature_group(struct cscfg_feature_desc *feat_desc)
 {
-	struct cscfg_fs_feature *feat_view;
-	struct config_item_type *params_group_type;
+	struct cscfg_fs_feature *feat_view = NULL;
+	struct config_item_type *params_group_type = NULL;
 	struct config_group *params_group = NULL;
-	struct device *dev = cscfg_device();
-	int item_err;
-
-	if (!dev)
-		return ERR_PTR(-EINVAL);
+	int err = -ENOMEM;
 
-	feat_view = devm_kzalloc(dev, sizeof(struct cscfg_fs_feature), GFP_KERNEL);
+	feat_view = kzalloc(sizeof(struct cscfg_fs_feature), GFP_KERNEL);
 	if (!feat_view)
 		return ERR_PTR(-ENOMEM);
 
 	if (feat_desc->nr_params) {
-		params_group = devm_kzalloc(dev, sizeof(struct config_group), GFP_KERNEL);
+		params_group = kzalloc(sizeof(struct config_group), GFP_KERNEL);
 		if (!params_group)
-			return ERR_PTR(-ENOMEM);
-
+			goto exit_err_free_mem;
 		params_group_type = cscfg_create_ci_type();
 		if (!params_group_type)
-			return ERR_PTR(-ENOMEM);
+			goto exit_err_free_mem;
 	}
 
 	feat_view->feat_desc = feat_desc;
@@ -373,11 +399,36 @@ static struct config_group *cscfg_create_feature_group(struct cscfg_feature_desc
 	if (params_group) {
 		config_group_init_type_name(params_group, "params", params_group_type);
 		configfs_add_default_group(params_group, &feat_view->group);
-		item_err = cscfg_create_params_group_items(feat_desc, params_group);
-		if (item_err)
-			return ERR_PTR(item_err);
+		err = cscfg_create_params_group_items(feat_desc, params_group);
+		if (err)
+			goto exit_err_free_mem;
 	}
 	return &feat_view->group;
+
+exit_err_free_mem:
+	kfree(feat_view);
+	kfree(params_group_type);
+	kfree(params_group);
+	return ERR_PTR(err);
+}
+
+static void cscfg_destroy_feature_group(struct config_group *feat_group)
+{
+	struct cscfg_fs_feature *feat_view;
+	struct config_group *params_group = NULL;
+
+	feat_view = container_of(feat_group, struct cscfg_fs_feature, group);
+
+	/* params group is the first item on the default group list */
+	if (!list_empty(&feat_group->default_groups)) {
+		params_group = list_first_entry(&feat_group->default_groups,
+						struct config_group, default_groups);
+		cscfg_destroy_params_group_items(params_group);
+		/* free the item type, then the group */
+		kfree(params_group->cg_item.ci_type);
+		kfree(params_group);
+	}
+	kfree(feat_view);
 }
 
 static struct config_item_type cscfg_configs_type = {
@@ -403,6 +454,8 @@ int cscfg_configfs_add_config(struct cscfg_config_desc *config_desc)
 	err =  configfs_register_group(&cscfg_configs_grp, new_group);
 	if (!err)
 		config_desc->fs_group = new_group;
+	else
+		cscfg_destroy_config_group(new_group);
 	return err;
 }
 
@@ -410,6 +463,7 @@ void cscfg_configfs_del_config(struct cscfg_config_desc *config_desc)
 {
 	if (config_desc->fs_group) {
 		configfs_unregister_group(config_desc->fs_group);
+		cscfg_destroy_config_group(config_desc->fs_group);
 		config_desc->fs_group = NULL;
 	}
 }
@@ -434,9 +488,11 @@ int cscfg_configfs_add_feature(struct cscfg_feature_desc *feat_desc)
 	new_group = cscfg_create_feature_group(feat_desc);
 	if (IS_ERR(new_group))
 		return PTR_ERR(new_group);
-	err =  configfs_register_group(&cscfg_features_grp, new_group);
+	err = configfs_register_group(&cscfg_features_grp, new_group);
 	if (!err)
 		feat_desc->fs_group = new_group;
+	else
+		cscfg_destroy_feature_group(new_group);
 	return err;
 }
 
@@ -444,6 +500,7 @@ void cscfg_configfs_del_feature(struct cscfg_feature_desc *feat_desc)
 {
 	if (feat_desc->fs_group) {
 		configfs_unregister_group(feat_desc->fs_group);
+		cscfg_destroy_feature_group(feat_desc->fs_group);
 		feat_desc->fs_group = NULL;
 	}
 }
-- 
2.25.1


