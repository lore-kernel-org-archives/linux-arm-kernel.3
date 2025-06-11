Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B27C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=; b=ogOqPMbfjFos70QT5AwC1G+R0D
	GARSkm/N4VgR0GkLBMwtTo6jvJ/85qqoC68irlsLIh2f27ScBF1GqSZp0bEsQI8wL7raLUVrgvc4H
	XTnQbcyrSlRQD+SB11DufuiY4V/0BYFc+eotdVcwIR4PMKcd+r7ECH1xnQqCFaFpWf4GX6PJ3Mq86
	R0fp8Ru+o7PFLACHJ5AC/lS4SxiRAXG9ayUanDsFZ/43C/z+cmDvQbo9br45TVJJ8/Ppdyem2jwiK
	0MFa9n1V87v1Wen5ikOxKRkOX74BQ8sX3DqsxRoySh+/x/y7hmNt1ThBbwAarhrAVmGBNGudvX93t
	wZ5q3aDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUII-0000000BZ45-36YO;
	Wed, 11 Jun 2025 22:51:42 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRuK-0000000B9DI-144e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:18:49 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-401c43671ecso129516b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673127; x=1750277927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=SHY2Omiy9UhHgRNf+dRypeEJk3TYAkFOVNxAUPL1CT8pefPvs6vKMxHsJCR+gcxG3c
         LxqSUf6t7ZgNBMRGDAVvCHT82eh+gVk1xBL3dXWRNdl9J5lW1GpGI8PTht+/pl7YvEgU
         zuFGzPC2jjUA9vga9zgGDW+8rNi0d9acO1kEg/FYMOdoSYNiJ3bvXhRoYCDQ/96IQZIa
         pUkAN/aV2YwF7Z5w8MNwdcY9gza2EqvaN7NmaSoUiuCY4QlLvvxwWjdJs8iMs/00N6UQ
         pJkNRIovhxHvRrkZNQQ44/TXhvqK+tGx4W25LKuXhkwqkYQmmO38+BaxMmDN2rN1941u
         W+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673127; x=1750277927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=JrX66SY7cTqR2Gm7fxaHd8OPmW8i1It1OEcTTnMtm+8Hy5+gUf7utjhfRvebODR9Mc
         QTlRITjBskw9Ir3XZ7Fqu6LERVy7jQRgw98rwfNdJs4pLUKektzZ/C2ooddrcBcxs/p1
         7qHZTI7MSVr2C1Scgbm88Z/h17n4iqZ+XgimaI7gICVSDlOIUbj0LXGXZN8fd4V7nyRu
         3YIOZWOJfCSqFlS3gQw/E5O15n2bDVzuPP7qsx2iKKrObgrulxWl6lSVPOUW/PUU5EXA
         irdqzvseQ6nOKLi5RRwJbdaL/f0Be3BLg7Jrr8/6ImwtpETU0DzbVtDn9/MxR4tZa/iB
         B3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUuaF5alS3EJNGBAc0z9NfQ/XfGnSRdTOEwDD/1+7XPlflvr24Ao1U1yT95Laje8rQY5tHngy0R9Qbtln33wdGG@lists.infradead.org
X-Gm-Message-State: AOJu0YwUChdte7rj1YNQeAHf12nlEiiAi7QT1Jn0wxdzfpeXoK95ewB/
	w+1muPY1I5CZks+6GSEiKUr+reoKmxzcnyn9ouD5wRfeOOLFPrXT+TDTKTzGuO4ig94=
X-Gm-Gg: ASbGnctSPxH+iszvDvl1tvFkwWOG0lBbYTAKTlpC+6zyvhTV+/Jew3ET8OaYhS/ILO9
	TwZYr2QSfg1uj7qOCMCVGyLm4PWXqFB69xE7GEX1I/9avlxhr40eAHucxaTuNJeZLGLeY4J4O//
	wPl+SlBx9YHOAhtlZg3XX81sQ7JRNTozMFZYMM3OqDXt+O1gDKWh23O/mwauz3mDz6SDYad6U7g
	AzsGPCfm0MgTyp0U/CcQ9ZqMh31cpLIOfeK24kW1byOFMQiHYdSq0A8RpTiMK9HJKkZgOq1G4L0
	j8JhcqiXpcuHdOnwLzKMF2Pex+PgPORD+5UwQhtLR+XoSyFZn9v/gm4BoPDpuDfRimcxIM9uZ3L
	tLQA=
X-Google-Smtp-Source: AGHT+IEsgVOS0Cay3UgDCHS5flNsvIDVMlhbLgckyCmrDV07SD5UV63dS599YfSdekLGeOGNrlRAZA==
X-Received: by 2002:a05:6808:1a13:b0:407:9d24:af03 with SMTP id 5614622812f47-40a66048f3bmr626458b6e.14.1749673127379;
        Wed, 11 Jun 2025 13:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d80d967sm467732b6e.4.2025.06.11.13.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:18:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 15:18:10 -0500
Subject: [PATCH v4 2/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpio-set-array-helper-v4-2-fb86a9b499ab@baylibre.com>
References: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
In-Reply-To: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=K5V5TnWu+110nnHuULWw1Pwd0QiBFgzUapmy9BeC2p8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSeSR3WFNtYYJy+OvDmT0FfOVbE2ZWgN1LwSvI
 hhaBWo6iEeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEnkkQAKCRDCzCAB/wGP
 wHGJB/91c9MDNHlXlq7EmskEj83sq+4fEyuAUc3SHN4AMqTJs8bzFLhHYUn3PqHXh4DPulwulNb
 f2NoBOAUwUg87Ss0koyZ3DBw1f4JBL8nHCrvwoK5XUNsCuFClysvag/sDr25+YFa89zZDg7BJuq
 h6uZlbirLJj518mNiTG1gVdiP3ezMybNzNLfuma28EkBum7DzArMY8sLulCIGGeiZ2yRrNGEgY6
 JYYMW1zph/pP1NEfwJWZALncH6owE3WbPnYlL46IA3VO30CqHv7NOJnMWBCXykHmee6Eq9Zg+Zm
 tak73kkf4T1P657GshPZBolIVryP3HqVteJGR2V1K15G1dRO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131848_295400_A44D3BFA 
X-CRM114-Status: GOOD (  11.48  )
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


