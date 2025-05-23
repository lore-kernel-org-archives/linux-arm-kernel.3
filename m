Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C789CC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ptipst+jgUVMZThwfnH2tLuY1vSwuKeNOIIYU0B7Lc=; b=sX3dzh1ZVMmR5srrY8etXPbl6N
	FMk5gOV2d/vC7hXfO9hgCeOvTa2Bh5Z/xgcsWZsHV0V1wU47bB3eDN6fSca/LbbJNwQBoP2jwY6VR
	OXbOTzgupUFeCP/0ylmrvk2o1zD2DNKwlDoivi0BgZWJCTMO3lW/dcDfNDh7chawMgK5oyC4vuLXl
	WydKEppScOwb83zntM7+i8lMa5m9INWq5U0yhgX1hzJJf00Se1I/Zqel+j5q2IQ/AE2TYo3KLIai9
	X9uuP0KOpKsYzDBUwEuJYdqu06TgfASksi5L/ohsJpxmMNNy6AuIldFsaHaMoz7u9774NpQ2urFO+
	Q1z6hQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbK-000000045lq-1e45;
	Fri, 23 May 2025 14:42:22 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISe0-00000003zMa-2nYj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:05 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54e816aeca6so12729984e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007663; x=1748612463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ptipst+jgUVMZThwfnH2tLuY1vSwuKeNOIIYU0B7Lc=;
        b=jOqKv7FDrlGfKigtAENi33CkgQPnxtD4lhTZT3syaF2YeEah4MTSIsfuNALVQJox4i
         vw5fSo1NO5LIZ7NHaUdrjwUjjLe9/poN2WedRkOXgcKlBs+xze9XVcKmuDFpvkYswS04
         SKIIZbLDwLftuz1bZKgvFH3hHTdHYUMnvaa0cLxHZns0sCzP0M/TkCvMgTWB5BGgjcw/
         MiyzgJm2+6nz0O53o2R9YLPKfRYLTYrZjDG4ddalfGDAV9tEMJ3PU5+HUIzEOBKrmaX6
         xfKD1AOUlno9rFhOf60yxqMNIRjJtRs+p0DLhfvDof6Xb0sBC9cWiy796AiCbjbVpvhc
         hZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007663; x=1748612463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ptipst+jgUVMZThwfnH2tLuY1vSwuKeNOIIYU0B7Lc=;
        b=XQuI8Xd8sxZwiflQfPBjfnS/RV2P38NXHrajntpo1HObA4tj2dHm5Jkp4g1EVsksct
         8Xwm6s8VRUfgKGfd9gPoeQG4CmV4pv7JRQNn+B5pWmeMHIKi6So6v/gjWQq9njxus01B
         EBKcX8rBoKd4qFwePAygUV6FhYBGa1C1edosHwVwB+EgbQItOcSU8QAEO8zWSog8MEPP
         1jlDn6h4ewx0FoABvTxCAJ85O0cAwQrDqadpsl6Evu3/tF3XCfpbxkW51n75fpq7tYdz
         rFwV09VVdVYjSwhIJjluUGxKwlv2Osz2GMu6WuKBNkuWaTo9nx8X/W04ZyAa3v59Qqde
         etyA==
X-Forwarded-Encrypted: i=1; AJvYcCUKiAjbWCbC99IM0AO6uRQZ7vnj0ooxH7ymP7onIxTGLCAybfe7FY+pULvFREQIIREiPZ8TlnyXxbfo25PES/mA@lists.infradead.org
X-Gm-Message-State: AOJu0YxcMXXwnI+mQf3j5hNC5M4feWie8IDf4ynkp8sboYH6RHXKdeBY
	yFnJylvCda3RKW5Rqwa0tkgrSizJb51gvQw21QGETr6ovTGaTVTiApdhf00d49uzHWM=
X-Gm-Gg: ASbGncviU6PL+sh4XmUeNQbjpE4g1CiS9Ffi7OIXaOEnjbkG/zO93hGZ7TngCamc0hV
	3E72w2TrcpYuRfMq85VOjgQfJxORUKWCHVrrAx4C8QYIt+hY/j9e8cMa9HvCgfpzBnXLArKhNJ8
	99srTdKN9I1hR3FeMCLy7B12Yv4/F7NKZTGwNN7Z0MYNq3/S0oRtsepEHtymiCeedPLwRDKJ6P+
	/a8yu8xPAhVOGGYxWHX7UdkjgxdJZD47rhiGcY9mf9b7drOuM3+XuXZUk+mGbhE4b/HlWmuzp95
	lB/nmUs1IYzliWaAChlEstAiI6NhoJGw8OeRg+B7cCkqKsqb50YphFbaTqON6TSPFFd85fkthYZ
	HNBG+H5xG/+Tifre+KvIw1cKAAg==
X-Google-Smtp-Source: AGHT+IGfBRDW1UMlFuEvFbwkjGLGnQiQkt71IPhxmMxhJWvlHH9jDUn6RGcLspRvscDDVp9YdgMBPw==
X-Received: by 2002:a05:6512:39c9:b0:549:9143:4e8d with SMTP id 2adb3069b0e04-550e719835cmr10282215e87.8.1748007662658;
        Fri, 23 May 2025 06:41:02 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:01 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/21] driver core: Export get_dev_from_fwnode()
Date: Fri, 23 May 2025 15:40:11 +0200
Message-ID: <20250523134025.75130-15-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064104_710194_2676F43C 
X-CRM114-Status: GOOD (  14.13  )
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

It has turned out get_dev_from_fwnode() is useful at a few other places
outside of the driver core, as in gpiolib.c for example. Therefore let's
make it available as a common helper function.

Suggested-by: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/base/core.c    | 8 ++++++--
 include/linux/device.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d2f9d3a59d6b..51512ab8a6e9 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1881,8 +1881,6 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
-
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
 	struct device *dev;
@@ -5255,6 +5253,12 @@ void device_set_node(struct device *dev, struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(device_set_node);
 
+struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode)
+{
+	return get_device((fwnode)->dev);
+}
+EXPORT_SYMBOL_GPL(get_dev_from_fwnode);
+
 int device_match_name(struct device *dev, const void *name)
 {
 	return sysfs_streq(dev_name(dev), name);
diff --git a/include/linux/device.h b/include/linux/device.h
index 79e49fe494b7..f6ca813eebbe 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1086,6 +1086,7 @@ void device_set_node(struct device *dev, struct fwnode_handle *fwnode);
 int device_add_of_node(struct device *dev, struct device_node *of_node);
 void device_remove_of_node(struct device *dev);
 void device_set_of_node_from_dev(struct device *dev, const struct device *dev2);
+struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode);
 
 static inline struct device_node *dev_of_node(struct device *dev)
 {
-- 
2.43.0


