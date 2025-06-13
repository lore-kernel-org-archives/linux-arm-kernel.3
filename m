Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7204AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=; b=DpA/1IXsqkLM5evsPYCcjfRL34
	JdyrMclRgMls6uZEWJLFJlhQN6ncadFb2GoDvowVbIrRStyqPPixDDCAF+uHy+nC7zeYpPyZpslPW
	5kCYjifokgCqD+HCxkUg/zCiD1/2UXluNuxfy6vATphchb/4fh7jZTICPtv13st+Zn+uQKQh56qrY
	4YKWIujzRwjd9gCQxfSq6QZ84ynqC9M75qeiedxEFHKqZOguhltcMJBiJIxf6KwchEwQxrNcNLtsx
	Kz/zBZtw/pjqO0HXsSuxVfGNmqJr6Vha+7jFGpagS4sr2TJ+6ywrYDNKGoYr34Yt8RvzGlFDs8uYn
	seMJ8G4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9wG-0000000HQEz-1qK8;
	Fri, 13 Jun 2025 19:19:44 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9ZT-0000000HN1k-0Udu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 18:56:12 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-736f1953673so682740a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840970; x=1750445770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=0Y+YpJWpwrGu3Wk916Drt0wutLlfQHXvK7R0Y7aPSeM380rlWBMVPug576y6f0Ehoy
         korPf+vThYL76rwaZWV21h0fEoOByOyg3UfESp97mZ8/HlSQH3dYNffkYNsibgT+v59B
         p3u8Vvs769gelf40oyB0EI1xCbEqxShXKRPDYDBbbaiUf7tyyeg2ZnwgE97V48oapmjy
         wPOdzDde/s9+hXauPdxa4PvohOemV4yai1sH69eM0VGVVn7pGEBhUTX/s1AF7lMB+gDN
         NpkZqEn0Mef4qADI4Vy8FC29jPLhVZWQgvu5K2ufWMP/TAO1a9YezmE4fFAc1pJe5uh4
         iYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840970; x=1750445770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=Jn1cQEurCrQZq1WSJ97EyWjSkPq+FsGGDvC8/0dr7NzBwQ7jd3D8cs5AuqVhYMTjL0
         2TfhzHmaIUM03bHIp16acjEwh6W8wLOKIHIaRV9YA2A8P7RwYcnJWMmiJ/o46RadgEop
         1CmpahrzjWVSTpJHyRxz6fno5hNa8BblROt1ajFNR9Ua+TIlv2Kf9S7mgNy2YbeZHS1W
         umpunRKzRCTfmwFUiVTaQibbyY8XtIRq2C+FuMhvKZwbOleUyq9ct5OpX9m1mNbjsVk7
         GvYeHtajZ33e7mgVCdu6DmJ9APPi5VWtxip6oxDA4CI+/fHY4q/rfbSM/q75tmsTyoYk
         9wIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvScE7q2Qbbb0tz/1ey5YGDFzIXTiGh+y86k8qYqc0dmaK3fW3aOHuGpTh/88gNO2eaSOoHZjajxugXDUOet4C@lists.infradead.org
X-Gm-Message-State: AOJu0YzJRNTvCroXZI7fpLBGthT81UkPdmRvIJ0OBG30QhxSI4dPShwl
	PC08dI2JkvNaeM1ny9RE1cgG7h32Mm5XpQERa1UKKzS618IKqh9M0SbzjfUCwWv1Gwo=
X-Gm-Gg: ASbGncuxJw+xzoNViH1t3NXPqR4Ohsl4MSvEYAOzOUkUPgiI0Cd6nQH7OBHAEMdLCbQ
	hdOl9ohY0fXVlD+WcSNUVZmC9SeLjVLo5wl7v2y6zM2D5llcEfXS0PvadVZaPcMcSbXCkN3/BxG
	zHPrR6EjTMQWHS/1/maQylbF2CpRaGnNFBv6jE0GUqwMc2PNQskiWTBAk0K/tnv8jfiSFqXmn6U
	kOzTcgi0yVvit0Lt8XmarpOaSqVZqzOSgutlc62p8NZ3XEvSrnQGkWtSmrN4g55RoGWTGWfamYu
	vKkoXVGtB6BY5vwbouevxmN3D5HteT/dqnampsCFYq/ikjGDjiAEkDm099gRRMXZ+as=
X-Google-Smtp-Source: AGHT+IEc8pztUfxk7EvjJ4ca8xkYjBhnyFgil/uaxtXzmvi6qgA+H+IzcVrvfK0nGCVD5jHUwQ2P9w==
X-Received: by 2002:a05:6820:60d:b0:610:dff3:425a with SMTP id 006d021491bc7-61110f0e204mr421428eaf.4.1749840970240;
        Fri, 13 Jun 2025 11:56:10 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:08 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 13 Jun 2025 13:55:29 -0500
Subject: [PATCH v5 2/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-gpio-set-array-helper-v5-2-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=K5V5TnWu+110nnHuULWw1Pwd0QiBFgzUapmy9BeC2p8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQ157bdDa74GvX+bG28rLClC1BSRU3wN/Yeg
 GfP5Zo1E3qJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0NQAKCRDCzCAB/wGP
 wAa9CACBPCfBNH+pO03QhAZu48GDH9Pe8785qJwwmYJ8uxbrfK5oNLibo2TDWLSwOA9dhdzlRzK
 UZm3UcyjpEdTCIi+jkzqdhNv4tt/GFRl5mcEx7/G7llmupPdbCHGBxp+pNpfNc4hEkastfYG4oT
 VhVmlesVVRo2sTlipN1chPDsRTi15Timt+SDFDzJle5Bx86/1sHVoVDAP9/xPBvu5CMRk4NxIu1
 6/vA9C3Z/QoZi7Z7NTV3V3Boo2v96y4xxIJpCs37+AmjypU+lyJU0pLMBJvyVE5oeN2JYtxvUEn
 nZz5ep3mokRJK3TjorCi6b7p64tgzyIwpbsnC+RID9iN8bSB
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_115611_153351_0218A256 
X-CRM114-Status: GOOD (  11.60  )
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

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

ts_nbus->data->ndescs is validated to be 8 during probe, so will have
the same value as the hard-coded 8 that is removed by this change.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index d3ee102a13893c83c50e41f7298821f4d7ae3487..b4c9308caf0647a3261071d9527fffce77784af2 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -109,8 +109,7 @@ static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 
 	values[0] = 0;
 
-	gpiod_set_array_value_cansleep(8, ts_nbus->data->desc,
-				       ts_nbus->data->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
 	gpiod_set_value_cansleep(ts_nbus->strobe, 0);
 	gpiod_set_value_cansleep(ts_nbus->ale, 0);
@@ -150,12 +149,11 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	struct gpio_descs *gpios = ts_nbus->data;
 	DECLARE_BITMAP(values, 8);
 
 	values[0] = byte;
 
-	gpiod_set_array_value_cansleep(8, gpios->desc, gpios->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }
 
 /*

-- 
2.43.0


