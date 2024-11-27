Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA1ED6ACD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NiDU4+PesaIdwCfPunSw0bMrPrm9AGZnmPORKEPq5c=; b=u0W7EefCcTAguMr7j3PBJ8uTay
	OtRMMFXLn3YusqF/Mj9PfUylI52/YT3uspPoPSU1izYzCPiz/RKHYjR7rbpFKKqU3Ms6ni2OQ+hb7
	oxQ2oiZ/UHPTsMkWxUBaA1z72bqE49M5pzdnSZ1fN/rEDObwjbJAtuk+gqgGqGjUXtsaPkAn3x9vW
	lDEzKLC4MWGvsBctdh+kr5RFymhd4T9//aDjW1lJmi8Fgn1WlzlC+iiqEoxb1bmVReXeqgFZqBfgT
	BBlv9TYnw0NOa8+wM0YvEuYwi+Oh0Ru/KG/jtylShuSujitb6e1Rf79tQivh3qVlfmj6LH7rmWAD9
	3zPXy2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIQT-0000000DIgU-39MM;
	Wed, 27 Nov 2024 13:49:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIJv-0000000DHMI-2SHp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 13:43:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4349cc45219so33982635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 05:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732714986; x=1733319786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NiDU4+PesaIdwCfPunSw0bMrPrm9AGZnmPORKEPq5c=;
        b=g2UeBP1oPXLndQlXsJMOmpss3bbhXsOHNGp7ESCCYJ1H3yiJJlzDG4xAMBRV/1y9iK
         bQabDqFJMu3rzQ5jJwcQCmVWGRvQSenISNbX16xO9Ds66X60tAISWd39Ppt5wcxRvKTn
         YLrQhO/HQIXvJMM61bi4+qAR/RhRPBCsoWAnz4o87TzwgIJ/LZs4tZ2R79F8jGkQHbSt
         wynPFpenXLlUP4y9WuPAHHfUJTLivSjQ1n1qOWQtuf2kVTVjyfq+W6D3SRGEw8YB480T
         hiaMIp5mziTCVnJdt8ws3v+beH753nmZs40QW2HEF4wJU2bIX+e1x3UHZMiltb2v6Y++
         wT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714986; x=1733319786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NiDU4+PesaIdwCfPunSw0bMrPrm9AGZnmPORKEPq5c=;
        b=RTXi6q/Q2r5z3tb0uK7drB/wlX4gwU6XnfbDqIfaVUdU0s8CxztJbz+hS80xrqxyVv
         5s1KJuhtH2N7BCRbdsdu0dvGqd10YWIR0Qisaz9KNXnCJLKvA47y0PF5HLyRZ5bnPNXh
         NVLjWAErfhC9sZ14a5Ij9ncpgQDLS8sHNi8D57lE1ZMpGvAIlWuVB7AdSUD5d9yeB/qM
         JIQJsLsE2CdrGBSCQbYL4+G/yHkuOA+4BN6W5lgJES5kqyYj03zWh6XYuseo2RX24dYk
         ymDoFoHqzV6hxCCw0WIUvQqvARC98ITeiOB5QEU3cd0wi1d0sv64p9LFYVhUx+n8agpP
         tg4g==
X-Gm-Message-State: AOJu0Yw+LVkFdqWyeaTtE3FGEbLhiXTyJGj+Di8cMXkaGDZyeRniGORB
	AHZApbv7uHGB46o7lZZmunypaunCIt8dk73Wjg8tOZb+fHmVSNLrDmG8MGXGXz9cJTw02LFgmTO
	i
X-Gm-Gg: ASbGncvwAUoYO4AgywjaroByTgrZ5abopBfHLN1aktqd6ONvTxQuRt7Gwx1HRLY++Op
	ZT1c890ZTmdQUbBOP0yFmWerPUbeONdO1iBAXUZ0l2z2neW7SUbz8q8m2fzuRKRC/IaZxBIgP4E
	k+Dnc+t3nShiOiXeEnL6VIcCTZdqcaYPLY00s503TQvxBwV1b2Ou0RKmVknkz9h1Th7Qq+OfJ5i
	I+jv9YhCVjCTgvrc89HclsVIl8go+vU/L+6RmZAvEhpAiD8zGOJ
X-Google-Smtp-Source: AGHT+IE989jzkeAsumQF9Xor81wjfIshk1Fi9eocD3+gjibZ7MizC96YWhPR+VcT19M8dHkWDMMcxA==
X-Received: by 2002:a05:600c:350c:b0:434:a781:f5e2 with SMTP id 5b1f17b1804b1-434a9dc0c94mr29355435e9.8.1732714985815;
        Wed, 27 Nov 2024 05:43:05 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:9ff7:e7c5:5e0f:c5ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5fa2sm16804645f8f.1.2024.11.27.05.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:43:05 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	james.clark@arm.com,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 6/9] coresight: configfs: Add attribute to load a configuration table
Date: Wed, 27 Nov 2024 13:42:53 +0000
Message-Id: <20241127134256.2254851-7-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127134256.2254851-1-mike.leach@linaro.org>
References: <20241127134256.2254851-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_054307_621708_AC249BB0 
X-CRM114-Status: GOOD (  12.96  )
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

Add in a binary attribute to allow load of a configuration table.
Calls API function to load and validate incoming table.

Use of binary attribute in this way is modelled on the load of
ACPI tables which also use a binary configfs attribute.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-syscfg-configfs.c        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
index d7883fe802b5..ce8eabc86701 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -791,6 +791,16 @@ static void cscfg_destroy_feature_group(struct config_group *feat_group)
 }
 
 /* Attributes in configfs that allow load and unload of configuration tables */
+static ssize_t cscfg_cfg_load_table_write(struct config_item *item, const void *buffer, size_t size)
+{
+	int err = 0;
+
+	err = cscfg_dyn_load_cfg_table(buffer, size);
+	if (err)
+		return err;
+	return size;
+}
+CONFIGFS_BIN_ATTR_WO(cscfg_cfg_, load_table, NULL, CSCFG_TABLE_MAXSIZE);
 
 static ssize_t
 cscfg_cfg_unload_last_table_store(struct config_item *item, const char *page, size_t count)
@@ -846,6 +856,11 @@ static ssize_t cscfg_cfg_show_last_load_show(struct config_item *item, char *pag
 }
 CONFIGFS_ATTR_RO(cscfg_cfg_, show_last_load);
 
+static struct configfs_bin_attribute *cscfg_config_configfs_bin_attrs[] = {
+	&cscfg_cfg_attr_load_table,
+	NULL,
+};
+
 static struct configfs_attribute *cscfg_config_configfs_attrs[] = {
 	&cscfg_cfg_attr_unload_last_table,
 	&cscfg_cfg_attr_show_last_load,
@@ -855,6 +870,7 @@ static struct configfs_attribute *cscfg_config_configfs_attrs[] = {
 static struct config_item_type cscfg_configs_load_type = {
 	.ct_owner = THIS_MODULE,
 	.ct_attrs = cscfg_config_configfs_attrs,
+	.ct_bin_attrs = cscfg_config_configfs_bin_attrs,
 };
 
 /* configurations group */
-- 
2.25.1


