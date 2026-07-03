Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CACC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJOQnYDmj56BFKnk3PptuIiEN5/cefcVZ6+liIWlLhk=; b=QX0++q+dwIcL7B9jLkrqjrikdo
	m9FZCAEMfonojxO7BgB6vxNDlJcDF9pJBGySMkOewlQaExfumyOL7J9tMBYJDBml+zFcCccRd2ix/
	tJ2KmIyOAaD0mxbFM49t4G4tw5okKjs2iWzD02rdnTGdbxgh5ghYijdzDxOIvHcY8DjE0AOjywc2D
	nuKQKVTrQrxyJxs05YHjQHHjo6FR8CFNCSWq3xtoBadgJcQRz38HQrsj8HqvLTrmoXU/gbr6D2uZR
	2x5AT1LU1UlvBS8bOqCGDvN2Ar1TwiApr0iIz2BHnJUhlfeQXWDxjGOLGzQ9oEMbUA8GOGL1/oBms
	heFZKXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVG-00000006rfy-24Yr;
	Fri, 03 Jul 2026 11:56:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVD-00000006rd2-1MkT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8471013fac2so430659b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079774; x=1783684574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJOQnYDmj56BFKnk3PptuIiEN5/cefcVZ6+liIWlLhk=;
        b=SXJSgSPeJopD4ictZ9CVz3MI/pJH61WBNOauaHHC/P1lAU2WnJBUtZDGO7PyJQi8mV
         J1csRthqb8HRoqh9ExyPvSbDUsLBaF9Rgc83djsxCuXtfx3njdaUmFOOwoW88+SKEzic
         l/2FgkeVJcOz7/pC1a+HYQvSBuZ1390JRC7ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079774; x=1783684574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJOQnYDmj56BFKnk3PptuIiEN5/cefcVZ6+liIWlLhk=;
        b=ZgBgALni2T0Q6Om1WVL3FexLGRZxugQL3c9VAvO4q4Mrfrs+rvoWuTTtyNivtQUYFq
         XUNO7azmz+I3IGKTSoo37F+gohZlK0MIDFCzN+q2GdHftT1/yKxt74Ys4ClEnvoRqqJm
         FXqI5WhKGkvVLNtfi12XlTrGxWw0d/9iZkSBdeeSo9PvaMFT9n9eCPoK24MmbklVOLdd
         mgU9KY1CFIN2S2qMV7hyT3JlNpasRSTJHUUMISFOsX/46SiDb1M2NL0H+8Fm3e5/Y/EQ
         2um1ED5bev6VnzDtFOGy+sD2kEVaQS7Bmb++ZTGsKEbO/jU1ZoQU6p/oud6bpGRcyoLY
         NRMw==
X-Forwarded-Encrypted: i=1; AFNElJ+uFuBw3KOaJwupVGTnF9+1lhcow+VhRG07QEoCYHKXz/ky5XaEYV6jTGaaUM8+tR77Ce4Qv2AUn8Y8ArxLb2II@lists.infradead.org
X-Gm-Message-State: AOJu0YxbBWTc2u21racs1xTk0RNDQIdznyrZGreVo2WzTdPGlXgZFOmS
	v7KgCMDo1cG7VKv6fXLD/Fm7Y39c6+5b0vcTsnDrrDRqBsMZDgAebxXbnNLRSv9WQg==
X-Gm-Gg: AfdE7cnztsEPcTjIZXHNAPBGHTg2qH3FGOJnucqp3kYFOQv22/dMHKgm1ax7hRrKLjo
	UhyIv6sXMLXAxTfqZC+QQFtBDnznaPu96uWz5bteFbky30Xr2jYH1vNQc8BxBkdMw2u+b7osgju
	yo7k9nwqG+y83PMMoKfqZHZwvr1EATDeSQnT/qQxiJ5rAmQtdHL5HAA/nurTUlzzqoOsPfkIc3V
	zlA7djIyx96zVYdVNuPzZxXjaUMbOfkchB+LuOBLAn37y1lckUe05+YTku6dOMWdCZKBFh0fDR5
	srQKVgfURCVIjxRsIVbCFbxMSL2L8T6YbGw2xypbMe/vrKTK0Z7oOHUq5AqDbQS9RmzN0sKE+8X
	9/sCi15AOOi+YxMryBRKW/uZkVZ8enzPHyHO3NUvuqfnCQnq5VG6MQk9YlDhwtCilOLpUdXc1gN
	FSpttRqZaCVPyi653+21yYXq3pnYELQwJo60pMxtuI+Nnz1LZBZskdCV6ilbHlXWsLUb1eGQ==
X-Received: by 2002:a05:6a00:cc9:b0:845:e23f:108 with SMTP id d2e1a72fcca58-847c088ec3fmr9998078b3a.42.1783079774322;
        Fri, 03 Jul 2026 04:56:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Fri,  3 Jul 2026 19:55:54 +0800
Message-ID: <20260703115601.1323491-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045615_391237_D4C7C3FA 
X-CRM114-Status: GOOD (  19.07  )
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Add proper delays after regulator_enable() calls. To avoid impacting
the boot time of existing devices that have the power rails always on,
skip the delay if the regulator supply was already enabled. In this
case the regulator is either always on, was on by default at power up,
or was left on by some other driver, such as the I2C OF component
prober. Either way the controller has had ample time to initialize.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f93dd545d66b..db48d7ef8357 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -47,6 +47,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY	110
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1219,6 +1221,7 @@ static int elan_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct elan_tp_data *data;
 	unsigned long irqflags;
+	bool supply_was_enabled;
 	int error;
 
 	if (IS_ENABLED(CONFIG_MOUSE_ELAN_I2C_I2C) &&
@@ -1250,6 +1253,8 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
+	supply_was_enabled = regulator_is_enabled(data->vcc);
+
 	error = regulator_enable(data->vcc);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
@@ -1263,6 +1268,9 @@ static int elan_probe(struct i2c_client *client)
 		return error;
 	}
 
+	if (!supply_was_enabled)
+		msleep(ETP_POWER_ON_DELAY);
+
 	/* Make sure there is something at this address */
 	error = i2c_smbus_read_byte(client);
 	if (error < 0) {
@@ -1406,11 +1414,16 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
+		bool supply_was_enabled = regulator_is_enabled(data->vcc);
+
 		error = regulator_enable(data->vcc);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
 		}
+
+		if (!supply_was_enabled)
+			msleep(ETP_POWER_ON_DELAY);
 	}
 
 	error = elan_set_power(data, true);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


