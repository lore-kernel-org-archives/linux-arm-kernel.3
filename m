Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D97D6ACD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDdX1bl5lCymW1Raij3h1SHKKmloqC4GtdPMjepmrjc=; b=hBJ9dE/lb9hwAqVqi+9Ic8JE5G
	EqRtM2J9gMy2cGAXAlQk9igD4hYPSitcjQpxRtUFUSOm5LISHiRsFNmTk7hfTa1PCYtkx2x3ufKcC
	4cZHF9ovgT2OtR3vZ57n6AXJBMe+i6aNhwmd/q9jFOEDDq3WwVUwfRieHmvUpqP6kutAWP1bvv/6d
	/w/vbGty4Xd7p53G7WzSqd2JuRHYReemiAad8DBNuQC3YsR2FxMCyqg2bqU7/KlBSoNiHookCkleY
	iXDt4jll6vR4EV1Ru6KFTbdMUmc9MQqlIL4RZcNcT6TUZrfXrHKGZMch/uA6+SLRMB5ki0y70eRsr
	osKrlXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGINd-0000000DIEK-3eCT;
	Wed, 27 Nov 2024 13:46:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIJt-0000000DHL0-1yXA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 13:43:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-434a95095efso5043685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 05:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732714984; x=1733319784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDdX1bl5lCymW1Raij3h1SHKKmloqC4GtdPMjepmrjc=;
        b=wu8ZCS0Z/hPCUcaDIR4GwLsVPtmQ8g34MgVa+m1BHWOCpqxynIr/5Nxin3wFXB+uTi
         HyDdW4sc+Rwf3jlOZmHdjWdQefh7iWWl8yWJECKZQRy0SN79SOCXjnuGQOyaSz2jcfVu
         LTkZUI9ojWpU933iB+UDmiB3CzxTgZtVLJkXkRuIQbUFDyF7/4uik3JAZG3KBPoM5ynS
         Mca6/+rWAuUhVcbqJGalH8ZbgvwXmrICzxTz79CVcELhx6TlKNZHvlLUhzhQVysEmhb3
         FkATMP9ZnbOx8kLE8Fe8NPqHzlpbOrwWn6If1Hb9ojHm3MXHhy2de59o4TJ2B34hMalO
         N2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714984; x=1733319784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDdX1bl5lCymW1Raij3h1SHKKmloqC4GtdPMjepmrjc=;
        b=nehcJM+95JJrPDiRJ9AiVjXBRqhFL4TMsLaAkVTNmNFjDi1XfU7q5rFm7xeyh5jawr
         GdG03a78T4pCUL98x2gjxzU9MhRLNeNIc3LDUyIqvFoE0g7WyJ7szKaL0irC7aib4Jbg
         sb1CcmvbJPjCsoMbjVUZhiHf/wv3qpROfF43x+kYF86CIiC0enGqirERVtg5Q0TeQ3zm
         dWdinAf02ZyHIMnCw96MnXhp8I/LivoScnQfvbpTJtlUCgADe6L07gATs1rrcyPbzl4l
         IKrAk1c+B/xU8dNqSxtX+XkROj1394rWjpxC9rhuk1FF7rDSnJIjlWprn8AziLk4KJr5
         eC7Q==
X-Gm-Message-State: AOJu0YzuLShlLE74qUAXN7oKJQXFygc5MFyQPDsry8iySU2KorXwAftY
	6jse34Hj0o7j4HokDIWqf/AxPRwdM9ekal5ZXktFZYPpZaPlTXY97xA/KDSYAEKWkjpzP+o4lmt
	0
X-Gm-Gg: ASbGncvbh4KJYO27Vy+ElElrek3B1QxWc1TqieMkThXMbUjFLGGKEPHlSbUOLHQUrrs
	7Evt7u6a/rgqb8pSEgIi8eDA1Wm7aS+42jZiG3gceZ7zEjZNA1mvukHK7nFI8A+C1ZSBZB4YbG8
	Gy1L7bBxmkk1lnTPzS6q+H0TGeimZl2oCorWzgp+7QvVKZvKMvpcPu+eTcvt0zutc1ktXwyO77C
	OjsgD9zScrumUPMO0JG7/zRFoS9nW9velvBeS/lubK+7u6LVHFT
X-Google-Smtp-Source: AGHT+IHnIHtF2qzsUAy84w9INuHabsV2StfM6k9CccIqh4w5X+PX/yHdHb7SF224RLo5vdd62N/PQw==
X-Received: by 2002:a05:6000:4008:b0:382:4abd:c3c9 with SMTP id ffacd0b85a97d-385c682052emr2879532f8f.7.1732714983771;
        Wed, 27 Nov 2024 05:43:03 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:9ff7:e7c5:5e0f:c5ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5fa2sm16804645f8f.1.2024.11.27.05.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:43:03 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	james.clark@arm.com,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 4/9] coresight: configfs: Add static type for config attributes
Date: Wed, 27 Nov 2024 13:42:51 +0000
Message-Id: <20241127134256.2254851-5-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127134256.2254851-1-mike.leach@linaro.org>
References: <20241127134256.2254851-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_054305_509151_8130D6CC 
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

Add in a static attribute ci_type and remove dynamic generated ci_type in
preparation for adding in new attributes.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-syscfg-configfs.c       | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
index d0aaecb0f4c7..83da4820be6d 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -790,14 +790,20 @@ static void cscfg_destroy_feature_group(struct config_group *feat_group)
 	kfree(feat_view);
 }
 
-static struct config_item_type cscfg_configs_type = {
+
+static struct config_item_type cscfg_configs_load_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+/* configurations group */
+static struct config_item_type cscfg_configs_grp_type = {
 	.ct_owner = THIS_MODULE,
 };
 
 static struct config_group cscfg_configs_grp = {
 	.cg_item = {
 		.ci_namebuf = "configurations",
-		.ci_type = &cscfg_configs_type,
+		.ci_type = &cscfg_configs_grp_type,
 	},
 };
 
@@ -867,15 +873,10 @@ void cscfg_configfs_del_feature(struct cscfg_feature_desc *feat_desc)
 int cscfg_configfs_init(struct cscfg_manager *cscfg_mgr)
 {
 	struct configfs_subsystem *subsys;
-	struct config_item_type *ci_type;
 
 	if (!cscfg_mgr)
 		return -EINVAL;
 
-	ci_type = cscfg_create_ci_type();
-	if (!ci_type)
-		return -ENOMEM;
-
 	/* dyncamic load and unload initially disabled */
 	cscfg_dyn_load_enabled = false;
 
@@ -884,7 +885,7 @@ int cscfg_configfs_init(struct cscfg_manager *cscfg_mgr)
 
 	subsys = &cscfg_mgr->cfgfs_subsys;
 	config_item_set_name(&subsys->su_group.cg_item, CSCFG_FS_SUBSYS_NAME);
-	subsys->su_group.cg_item.ci_type = ci_type;
+	subsys->su_group.cg_item.ci_type = &cscfg_configs_load_type;
 
 	config_group_init(&subsys->su_group);
 	mutex_init(&subsys->su_mutex);
-- 
2.25.1


