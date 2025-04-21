Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D62C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=; b=ZrUI0wAxJN7YddsF8jDH1T8/WQ
	4H70Ocot/legl43iswvIxyjFK/Vn9BS3pVkOUFiV1UEYhSwcP/6u9pD0ps4keG7DAIL2+zPk6cQk0
	pdC6Io8sABykC8fC+XvBYA6p8+WhEKTiXuBfNbsQEZBOO9xyTcHlhgU9JPJxBSqtTlIk3fI43517j
	F1+VZXAUbN7EzBJN9HHgL0Uo+U4yhgxmVEKt4xOi+0C+V+0u9DdIFrowi2c81LS4I/ZotL1gspCgz
	8KWexSMZFNClszG9Iv6Z8/UF+pMQHxxzhe/QmVdQBGASiHDDh+LiYHUoIOiIJyhPvqGAxOVLU9Wrh
	hZEmU/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oPl-000000046FH-2A6F;
	Mon, 21 Apr 2025 10:30:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9b-000000044DN-1Vvn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:32 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224171d6826so54820205ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230411; x=1745835211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=GIJ/Svha4Zr+vaQjx42Ifa2gDpeoKSFy6eWniTSiLZlmnu+uupYhpahkvxcbsK3tHJ
         cvkkNkVScdTORt+eBHckFq/C3tk7xPz9/3WVl0HhLyGUkp4UtwxASsimqjjTwcyJPz5l
         stxkdUCFQCjBnzVSPT2Iue3mCLMl9LqCaAQbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230411; x=1745835211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlRUONHPgdRG0yBjPS5/nMKjk95rCFAaXubE+yQQ9K0=;
        b=S/XVBVCam3GClf5bRgQhnQCfsPPthMj9legY9MRFYguXIb7yQnIfno8AhTNmpBJLhO
         Fy6vhEtkXYPDGl47dqfBR2lqHpNF8wqAzsmytJR+V4qLuebWCaMiBvg5+6O1mIGeJZWO
         g2766O3eHsv2H6RAn8Qm3h5e7K22OgbRf2B9by+hYJaW3xaIM3rFpTlYahlR2ha8jiKL
         ACycmYQRIZQLDIR97eJpLTSh+dZMn5P4VkMg6ZD3gZM7Zx0hdcAv77Yzic0pBQX+Pb0K
         CsfC7+YSS6j1NJvzp0UtlkEOiZP1aUUEkISSfg6ohsHZEpunGkm64Jr9nBXArMa2G54Z
         411A==
X-Forwarded-Encrypted: i=1; AJvYcCUyzOuhDRMKi7N/9DZscLK7IDfp3HZbUzs/E6AXQn9bFuLhZJulCWFGqbNFtj+RO1SmJapaRMc0sIixgJoTUNni@lists.infradead.org
X-Gm-Message-State: AOJu0YzR6NqhvjYO7pYckNZJ2BTMb5ZlTFRZvn//LRM7HfKfhXGDc8X7
	OFag4ON++TDvxnkldFAkhn5osQ1LQGqzsRqZTOzc95sY/qZ4u/BwZCFSX4AVnA==
X-Gm-Gg: ASbGncujIZN6Ba9IQheWwnfoBe1PF9S/GxMELATEuG/JlkpiiCh7sKw9rSub3Ba59/L
	pU5XnCVW1gqPf73NuhkzQdX+h2/RTD8A32kmCTvg2565d5hQIEzR+rq7arzaSUD+dw8Z0lmqYFd
	tlYf/uedL+r4k0GYKIZVQ+8dBMQe4xbrAHig5GZo09wrcvwyC/Kk2c3E0dJVX/bUOBUeTpWKIg2
	GJiWlMzPsj90/cE/A45Wj7XK9kH5pkHteQAsMWVoFFVaKJ6iQlSjkCQEDwiohu6//ZTn7jdYyAS
	GGKSF3UtXy/Zx3OtJza8dwH6eeyManiDODpe6lSfbr5H+f8BsZX0LoWxjWg=
X-Google-Smtp-Source: AGHT+IGaSj2NjUkLJYtvrXbaniU4ZUkVXBRJQywqY5KHy1I4U9ywfY/tOoiirvNsMeMMe1Zel8Bsug==
X-Received: by 2002:a17:902:ce86:b0:220:c143:90a0 with SMTP id d9443c01a7336-22c535a7254mr159468475ad.24.1745230410702;
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
Date: Mon, 21 Apr 2025 18:12:46 +0800
Message-ID: <20250421101248.426929-9-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031331_399878_5E2C0DCB 
X-CRM114-Status: GOOD (  12.82  )
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

The MT8186 Squirtle Chromebook is built with one of two possible
touchscreens. Let the prober probe for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 10dbaede0541..f3cd612e5584 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
+DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
 static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
@@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 	},
 };
 
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_touchscreen = {
+	.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
+	.opts = &(const struct i2c_of_probe_simple_opts) {
+		.res_node_compatible = "elan,ekth6a12nay",
+		.supply_name = "vcc33",
+		.gpio_name = "reset",
+		.post_power_on_delay_ms = 10,
+		.post_gpio_config_delay_ms = 300,
+	},
+};
+
 static const struct hw_prober_entry hw_prober_platforms[] = {
 	{
 		.compatible = "google,hana",
@@ -93,6 +105,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,squirtle",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_squirtle_touchscreen,
 	}, {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
-- 
2.49.0.805.g082f7c87e0-goog


