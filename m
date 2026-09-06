Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D48C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 06:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=; b=hMYOSZfHjguWMy1XPz9JSR4YR+
	9LbDpV7uc8hncc6GjPHp6QxjLBAGgLSJw0O+pLSB15uu8lUFxIFt3zr7m0JfRJTg2uCnLr0Mp0PPZ
	UHSE8ltadbcjuPKixT6feWAPDj73xDynlgwMPqQIqB3v3YgJim5mcp2BmNn2tG/kLrfmuzW3CDQPn
	WScmH+yh814nLaRL1Gxalcx9AhAG/pOrUiaitrcWHZClQuW4BeJHJIrJetWQ3EZ3wwZVIqtdReWSW
	upqSKLJhgX4jns/zsNCvE037QgzSnVSdbbU2/ZByghW6NPOHqIREDD0j5IkXq6RaXol/hcAsHL/Jc
	0/6UbzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Dl-00000004kPp-1F9I;
	Sun, 06 Sep 2026 06:19:17 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Dj-00000004kNz-0M28
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 06:19:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2caced6038eso23740805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 23:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675554; x=1789280354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=;
        b=XcWEfa79I3g3VYJ3uuIl6sXwczCsO3vGopWfAtey9FSOLQjyjl3T04/IyixcsSdqow
         MMkrp2u4LUVCTgMSsvMZN2FhIIoZIxiduCs3uIRJQKuuRP/mjLFcolw8S9PU3QdnZah/
         J4gROJPEGUyLLF9Q0qeDTub/uylG40pcG+9j/L9dKdykm24jJEnV/vGylrnFxaV+x4AN
         T2YZv9oRFV2IRehAsJKz5OuIC94X+vhzjZAT8asMqf+kHCaIIxDQ9TKQy4hlAbdJAjVZ
         DTTKW4M+TzOx8DZfOWTkYe1NqSRvBCDVSSrxo44W0hWTHlzWUT6j1UWgn4WRt4vT/LSs
         RX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675554; x=1789280354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=;
        b=nrXRpSVSjdnaqgtrzQF9VdeHBscUBWc3ATcgFinfGVvWywEcg8hOorSvUNcq/9z4bE
         letT+p0iVY/+qOMi88f5aUO+cnbsuOa0Cs3CCBVpO1p9qwpGYdV5Q3ShAlPjqMtkuhvC
         pMo1j4anSEovp6lpfnXCQWQvct5cdYUACbfsUZDyznBfrwmKQuxiWkT1z3pKwOOjsJkY
         ZBjr6gq3rLKBOb2clilgLuGx4Sv3Fw72aDo+EMixmBHg2iT0/Np5yxh2NA1QI4D/1eGV
         Lj+7ZGhIBgxNJ8oGs2nj3rPZpK+Z8+El0xp5gJprHV7s6ganme9H5bX1vu5EpfMUhflw
         RTcw==
X-Forwarded-Encrypted: i=1; AKwUvByHi2ArjTWErYxFX3KEGipBIerkA/b1NcuazbmKshdEBte0rTs8PIsnIiYg9C9WBvwN8fu6vq5MDBi5HZ4T/Cl6@lists.infradead.org
X-Gm-Message-State: AFuF++nh7qTR4piz48voEq2fBWVNPnPFq84VO26/dcwHL0Y8Gw/yUeu7
	ZqvGBLOI1fye5gK8YOe8F0dBTSOtUlBkm0rcInw8OxKcYlZCzFSUMQDz
X-Gm-Gg: AYBFou3NWZYfYCFgIVHL9eefPIQ+EbrbVl7TKOR2jygBp7UNSvfVTxPxhzvPKG6Q+44
	CMA1zsbVZa8C5raly+w0V2+3bRu6frDyO2i+vJTiIYPZasuhvkeK55fImOrbxCsK+X3p1Jzq8gp
	6uu7qwpBAqeKKr3JgaE6hyQAMEass6fGZsyQaviGZicCCylWlUqkmZBJFoEqE9bq1zL0zULptjK
	vTSSpdZy8Upp8tRnSRIH2T/jYuSNthI3D/f4mHaWQr7YqTMIPy+S1yzlocg9W+L9zx+wVTUMYTw
	eLU5istHxkAdSwoEQMZgpjl3mPXXbIXs2PsdT34zcfBYYQNfDiE6+NduyXesyL7Wt9sshw4BA3N
	0gZmJtdCRSOCbAd/4XrKl2ZObXSie/bFoRpPwjyDUI8ahwFVhS6Zj8k9EzCbVkHpX0lI1ULruKo
	ORN7LMbB7gCJ2cn1S5PQ1CLKFFN0puGrh9OBdE7jxMQudIHLmd0/0Hmn9mzbk=
X-Received: by 2002:a17:902:da85:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2dafad14a8fmr205668835ad.0.1788675553947;
        Sat, 05 Sep 2026 23:19:13 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:19:13 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 5/5] power: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:54 +0530
Message-ID: <20260906061755.5103-6-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231915_126933_139684AE 
X-CRM114-Status: GOOD (  14.61  )
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

Replace PTR_ERR() and %ld/%li with %pe and pass the original pointer
directly to dev_info(), dev_warn(), dev_err() and dev_dbg(). The %pe
format specifier prints a symbolic error name (e.g. -ENOMEM) when
CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back gracefully
and prints the raw integer value. This makes messages more readable
without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/axp20x_battery.c      | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/cw2015_battery.c      | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/power/reset/macsmc-reboot.c b/drivers/power/reset/macsmc-reboot.c
index 9fc36fa68676..7b8460a55e9d 100644
--- a/drivers/power/reset/macsmc-reboot.c
+++ b/drivers/power/reset/macsmc-reboot.c
@@ -221,8 +221,8 @@ static int macsmc_reboot_probe(struct platform_device *pdev)
 		if (IS_ERR(cell)) {
 			if (PTR_ERR(cell) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
-			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%ld)\n",
-				 nvmem_names[i], PTR_ERR(cell));
+			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%pe)\n",
+				 nvmem_names[i], cell);
 			/* Non fatal, we'll deal with it */
 			cell = NULL;
 		}
diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index ee8701a6e907..915b6f6881db 100644
--- a/drivers/power/supply/axp20x_battery.c
+++ b/drivers/power/supply/axp20x_battery.c
@@ -1123,8 +1123,8 @@ static int axp20x_power_probe(struct platform_device *pdev)
 						       axp20x_batt->data->bat_ps_desc,
 						       &psy_cfg);
 	if (IS_ERR(axp20x_batt->batt)) {
-		dev_err(&pdev->dev, "failed to register power supply: %ld\n",
-			PTR_ERR(axp20x_batt->batt));
+		dev_err(&pdev->dev, "failed to register power supply: %pe\n",
+			axp20x_batt->batt);
 		return PTR_ERR(axp20x_batt->batt);
 	}
 
diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index 34a57dd5c3cf..d423a8bdc0c2 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -808,8 +808,8 @@ static void cpcap_charger_init_optional_gpios(struct cpcap_charger_ddata *ddata)
 		ddata->gpio[i] = devm_gpiod_get_index(ddata->dev, "mode",
 						      i, GPIOD_OUT_HIGH);
 		if (IS_ERR(ddata->gpio[i])) {
-			dev_info(ddata->dev, "no mode change GPIO%i: %li\n",
-				 i, PTR_ERR(ddata->gpio[i]));
+			dev_info(ddata->dev, "no mode change GPIO%i: %pe\n",
+				 i, ddata->gpio[i]);
 			ddata->gpio[i] = NULL;
 		}
 	}
diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply/cw2015_battery.c
index 1bcb60cf763d..48643f7bf503 100644
--- a/drivers/power/supply/cw2015_battery.c
+++ b/drivers/power/supply/cw2015_battery.c
@@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
 
 	cw_bat->regmap = devm_regmap_init_i2c(client, &cw2015_regmap_config);
 	if (IS_ERR(cw_bat->regmap)) {
-		dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
-			PTR_ERR(cw_bat->regmap));
+		dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
+			cw_bat->regmap);
 		return PTR_ERR(cw_bat->regmap);
 	}
 
diff --git a/drivers/power/supply/intel_dc_ti_battery.c b/drivers/power/supply/intel_dc_ti_battery.c
index cb6fa8d88b43..5819df23a543 100644
--- a/drivers/power/supply/intel_dc_ti_battery.c
+++ b/drivers/power/supply/intel_dc_ti_battery.c
@@ -349,7 +349,7 @@ static int dc_ti_battery_probe(struct platform_device *pdev)
 
 	chip->vbat_channel = devm_iio_channel_get(dev, "VBAT");
 	if (IS_ERR(chip->vbat_channel)) {
-		dev_dbg(dev, "devm_iio_channel_get() ret %ld\n", PTR_ERR(chip->vbat_channel));
+		dev_dbg(dev, "devm_iio_channel_get() ret %pe\n", chip->vbat_channel);
 		return dev_err_probe(dev, -EPROBE_DEFER, "Waiting for VBAT IIO channel\n");
 	}
 
diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index 67fdb4335338..c8e242341d04 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -613,7 +613,7 @@ static int smb_get_iio_chan(struct smb_chip *chip, struct iio_channel *chan,
 	}
 
 	if (IS_ERR(chan)) {
-		dev_err(chip->dev, "Failed to chan, err = %li", PTR_ERR(chan));
+		dev_err(chip->dev, "Failed to chan, err = %pe", chan);
 		return PTR_ERR(chan);
 	}
 
-- 
2.43.0


