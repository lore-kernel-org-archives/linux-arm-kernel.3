Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57899D6ACD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwYuMbr1LfJ5VAFpw4rhCtYlWSRl0WXyDX33mfRehWo=; b=B9Y7wxYjwbPWT7+G+66QY0yY9y
	znRKfrGd26e4gvmarScdUvh+ByRpYdHEAk181w+FzVR2kvtEHg+k3FGdTlbuxrXrVbFesIK5DHei0
	rJGFDNlsWO/TwQvIdei/zTOUQS6r/8U+Y1DsawaOzX8d51qNHzT9z1cQWoZse2KAQLUfN8G6oATQE
	6XyansvgHXDuLfBiWkPdPexmcCj1IbmxU3luNzDSJkL9w5//k0ylCNCeFy5YfLjx1qyonm87E+hkb
	v+KB5ro9K7Nnqaq7OxBB3VCOH8Wnng4VOcgCzMIwZ84gX2jHNDIfP0w7qRrHmQAL3iUC0kK+3x6iU
	z0DlsSsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIPX-0000000DIXB-096O;
	Wed, 27 Nov 2024 13:48:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIJu-0000000DHLN-2CfG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 13:43:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3825a721ae5so531867f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 05:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732714985; x=1733319785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwYuMbr1LfJ5VAFpw4rhCtYlWSRl0WXyDX33mfRehWo=;
        b=dhyGZTySjyA3uBl1J+Scd83HNN5zlZrKp+kPj/OACHmk3eIHgUqFqhUBEMlsSrh9ow
         vH9YYAT3nvjR0aXW4JfICLWGLxG8wO/aqKBFur338T8euewSoWl60l83rlpow+dAy8U6
         SfoAcXD3wNKt/QyMqmlSH3s4qfzmQ/HJq/Uf+IivEVkXS1l3jece4CWXwiLKVU8yy7XQ
         aiYgTHmEPICgG1q8uk1pfSHOGRhptdQtd4nWO+cudBEQpQH2F+hI0nvnguPWHXTTFFMJ
         gg1gn1yjzK/aTxWpzBx2eVtHeCpxG4uGC9WX6YkHhe+52y8dLq2XvPYFAw1J+dL4r3LS
         Ljdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714985; x=1733319785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwYuMbr1LfJ5VAFpw4rhCtYlWSRl0WXyDX33mfRehWo=;
        b=uKhCOIpNUqqjk57phbbgHr5zRXdOyl5e2ji9Ffzg9914kTG60ZiUoPvzxv/t/mPAih
         CU77HPfqUTYnqzQb+ax0upRdGkWtIPPBiqSzuRX2mePxmEUNXmaR+cbOztAu9ReJo/cg
         syjeLaP03PhMJ6MxLNPc5ciXfi+qXU8YigpwjpL6fLKJm0F5h0g/0+4NAa9hxIoOAL4n
         scshnvDKN3XOkPFnpbmmTxr940ApkZRs/CCo2fFNKXVQjeX1HtLsiQdZWC3xhOWlz/4W
         spyhOo/PAg7bsJXuh9YnW34R943xaH7dYs6fZsvI0cEEBF9LBfsttab2rYQVFaBu6lex
         gV/w==
X-Gm-Message-State: AOJu0Yytx+QKnAVLUthevD6gKwYDS/i+0S3i627PgvFELa12oX08gj5N
	svkSaZVuf3IzWN85458EY/xi8dG3TbLYun4SF5pQCWESNIff+zXhz182XLWRDhMszhTe/yTXxNU
	P
X-Gm-Gg: ASbGncveGv8Yd2Eisg24BOMbfkc8z/4LizpCOPrjZY7cRgr5Ip+KZiMAh3EEf3VMmzN
	tQA9KK7DFEt3OHnfB5NE6ZQzAoNAqe9wueMRBOCBET5Sv3Hy8H+G1odBIGDjHqTcPcXv0hn1vuV
	E1TDfwKSTrGNB/LuijuCazJfpmUA6XzfK0On3WfS+M+3K4EHnKmzV+MqZ0fXC6yY5AJFa88pFRL
	bnQVcvHG6X+ufa/UJUGUG+sRR6SIVPUuTgHOLxTImSp8i1ov0F4
X-Google-Smtp-Source: AGHT+IHV4zsXiet1ZrBKIrnL9MpU+lNAH9wdVPgHqqFcCo9pkcAoRtI2rRGLhjawXq7Am076lKeAkA==
X-Received: by 2002:a05:6000:156f:b0:382:4a94:af0a with SMTP id ffacd0b85a97d-385c684154fmr2111461f8f.20.1732714984760;
        Wed, 27 Nov 2024 05:43:04 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:9ff7:e7c5:5e0f:c5ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5fa2sm16804645f8f.1.2024.11.27.05.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:43:04 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	james.clark@arm.com,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 5/9] coresight: configfs: Add attributes for unload operations
Date: Wed, 27 Nov 2024 13:42:52 +0000
Message-Id: <20241127134256.2254851-6-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127134256.2254851-1-mike.leach@linaro.org>
References: <20241127134256.2254851-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_054306_578933_6CF938C9 
X-CRM114-Status: GOOD (  15.48  )
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

Add attributes to view last loaded configuration, and to unload
last loaded configuration, if it was loaded as a dynamic config table.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-syscfg-configfs.c     | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
index 83da4820be6d..d7883fe802b5 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -790,9 +790,71 @@ static void cscfg_destroy_feature_group(struct config_group *feat_group)
 	kfree(feat_view);
 }
 
+/* Attributes in configfs that allow load and unload of configuration tables */
+
+static ssize_t
+cscfg_cfg_unload_last_table_store(struct config_item *item, const char *page, size_t count)
+{
+	int err;
+	unsigned long val;
+
+	err = kstrtoul(page, 0, &val);
+	if (err)
+		return err;
+
+	if (val > 0) {
+		/* schedule unload of last dynamic loaded configuration */
+		err = cscfg_sched_dyn_unload_cfg_table();
+		if (!err)
+			err = count;
+	} else
+		err = -EINVAL;
+
+	return err;
+}
+CONFIGFS_ATTR_WO(cscfg_cfg_, unload_last_table);
+
+static ssize_t cscfg_cfg_show_last_load_show(struct config_item *item, char *page)
+{
+	struct cscfg_load_owner_info *owner_info = 0;
+	ssize_t size = 0;
+
+	/* ensure we cannot read last load while loading / unloading */
+	if (!mutex_trylock(&cfs_mutex))
+		return -EBUSY;
+
+	/* check dyn load / unload ops are permitted & no ongoing unload */
+	if (!cscfg_load_ops_permitted()) {
+		size = -EBUSY;
+		goto exit_unlock;
+	}
+
+	/* find the last loaded owner info block */
+	owner_info = cscfg_find_last_loaded_cfg_owner();
+	if (!owner_info) {
+		size = scnprintf(page, PAGE_SIZE,
+				 "Failed to find any loaded configuration\n");
+		goto exit_unlock;
+	}
+
+	/* get string desc of last unload configuration from owner info */
+	size = cscfg_get_owner_info_str(owner_info, page, PAGE_SIZE);
+
+exit_unlock:
+	mutex_unlock(&cfs_mutex);
+	return size;
+}
+CONFIGFS_ATTR_RO(cscfg_cfg_, show_last_load);
+
+static struct configfs_attribute *cscfg_config_configfs_attrs[] = {
+	&cscfg_cfg_attr_unload_last_table,
+	&cscfg_cfg_attr_show_last_load,
+	NULL,
+};
 
 static struct config_item_type cscfg_configs_load_type = {
 	.ct_owner = THIS_MODULE,
+	.ct_attrs = cscfg_config_configfs_attrs,
 };
 
 /* configurations group */
-- 
2.25.1


