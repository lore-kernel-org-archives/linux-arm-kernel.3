Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5243DC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=02qmxoTPCkOEY4gEDr1T+BbvAQv6lh4lHLzTpSwVizM=; b=HdTjiTOlv8hWrtalA0NsDSLSqy
	xZh55QL1lfI7E8hlqunDZ7NDPhPC4jhXdHJrPDT1E2o9n3HHByeMo0+lM+5Y8vAhU88PyP4pRqKp5
	aU0ZxUQciBH5ldwlGrlw7oUU4+jthrg98J+Orcze/hYEgqLxvotMlq2dv7dcaHt6EF93k057RN7wP
	XOFhFf5fTQ6d0rwJFLBcjtotnc7IlduDtrxJI/uDwmuFqgQ5mxBxGR56tvFmRxjyR/wiDKMSMXEpZ
	6DSszcuWnM1n+XjvC18n+/IJYXHD8FClA6RAm7h/wkaUtOqC6jaVQttJZL5rlXuDdjDKRbyTRPcHO
	1lKR6CVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYTw-0000000H1b4-04j9;
	Sat, 28 Jun 2025 16:32:48 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYHK-0000000H0gV-1o10
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 16:19:48 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-73a45bb28f1so2213695a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Jun 2025 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751127585; x=1751732385; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02qmxoTPCkOEY4gEDr1T+BbvAQv6lh4lHLzTpSwVizM=;
        b=CEYrQo0Xk+/mx+e9L0Cf2RM4oUWIo/LJQWhPgUajROgQL+tn54X2UhCc8WQJZDx++U
         Cmvnrq+ityTY7MlvpB0O3vVXJK/lZLNOaR+u2uMhytJuEDr/ElHDh8zUHQmhaYfJWuzI
         3VWKcSjmxuw8zBwxl1+mWmwRUhee0SQGWPfYwrmPufRSxndK9RMvXXzddH2q1a94z7sm
         Jnp9dOIb17QH64aUV9RtSC9tMwbNbwmQJBcZDr6cpQSgVCmaESCIyncZWefYzDaSx1Ke
         PZYW44jZ2wSeacUY1xBFs97SsyHyXurrPNnz1iZux8YA67weV+zofTxgQaIomkB85CDO
         srGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127585; x=1751732385;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02qmxoTPCkOEY4gEDr1T+BbvAQv6lh4lHLzTpSwVizM=;
        b=WG3fnicv6FIL3YmFcmQscr4QUGTP70eEc4EkC5doWuo5X2NQb+FwaZ2lBSQt/FP/M4
         OKSkpskXJdv8oMkex8hsnFSKs/t2kgo9vIRURT6aLs30Nf7Zjzi5fYDM9DFTEHzv3t5r
         TESt4T6Thr1xpGoW/qs30CS6/HFQCZmQuNIYQMvk1fWtJZxAEW6XaY8dxGAP18KUXcvO
         vZK53YAjFfmNgasu0kSFP6pzgwV7lsWHn4tM7GNJub+gd+R0xSod207KrAVElDe7A/fR
         F96JXcIdELllHsb9RkHBKCg2X2fU1ZwYMTHGaV70yY3v2sIyvyRwqCmiQBU3EYd3E55r
         KTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUod7JAwHhcI8NABXEWicG2p7/gm6ww5mDwAeWmytEjPkCvRp5eeYEKNcA1XVKah/zBaZlkcc3bdWnXxAlB0Pup@lists.infradead.org
X-Gm-Message-State: AOJu0YyOopUwZfIkLFHvFGfTXBFJdUeQumyAfM1N6vgQiwgc78FK9jmB
	6tBnOJBCPIbDWy6wihKXHGS1vyzg7nmOZkvNuJsM76UDFCCdE368/P6az8II2PdEsI4=
X-Gm-Gg: ASbGncsgSpn8Gvkp9Uer3C9vO0eCTy7AVz+/+N8pqSlis9Kbo9k7Hl2qTVLg40QHxXt
	Ryf2Lb/eZcPehLGQqHDC5V8tzb+nyRnXP9SHUQ06RM0A4CMFXFVu9FYQGD3t/AmLEf6oM42jgNJ
	jELEY/J9vh0lO7OVZGNg6Gp44/iOsVduMQ8CKfp7kYBnp/leTy126Yu8TKZOh49lv0NL2pa+Zu2
	qi9MUWbytDja+9HzIQgorkisIBrqOEez4vBnPKknz6cow0AHYfvwFCfy84Dx+TjjO2Dt3MHMjyu
	Cef2CqS9P4x07BjHt8myXR17jqXEQ1KtptGM1mR1582Wa4ezg27zS1HM0h2CrU03guCk
X-Google-Smtp-Source: AGHT+IF/GRiUjQAIk9AU0sawP3ILK/xWPBRSUKey+TEZjxPkpBx4SpFlXcBxLVhPRg/ag4/bSo6+2w==
X-Received: by 2002:a05:6808:1489:b0:403:304:6b06 with SMTP id 5614622812f47-40b344e0c9fmr5292319b6e.10.1751127584590;
        Sat, 28 Jun 2025 09:19:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b338a048fsm838264b6e.24.2025.06.28.09.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:19:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:19:36 -0500
Subject: [PATCH] iio: adc: at91_adc: make at91_adc_caps const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-6-v1-1-fbb1ca5edc8d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABcWYGgC/x3MTQqAIBBA4avErBsoIfu5SrQYdKzZaKhEIN49a
 fkt3iuQOAon2LoCkR9JEnzD2HdgLvIno9hmUIOaBq0WFAlogk8ZLWVCjSPPqyOy66wVtOyO7OT
 9l/tR6wdravaNYgAAAA==
X-Change-ID: 20250628-iio-const-data-6-1e79faad9762
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=1+Bptf8yZBTorOFvY4SAopxHfqpHSudxKBxttKSQoiE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBYZG9Fgb/mnxZmMVaV59gxiSn1NIBN6g4Xn7
 I23mY9oS+uJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAWGQAKCRDCzCAB/wGP
 wLJVB/oC1S9tvbGg5HZadpeuzKJCOx2oWKkqxVsx4eSmnrDnrxegZYGOCwkcDzQ3XS6QduyCOw6
 5lOW/YFh1muzixuAMcIwLML62YRg0CimZp/YUKA8c1zCHQzIQYH6EOZnaue5ccpxTnFAHjA3JVQ
 YjWwsB/anfiVBZiOe2x75yf/P0kKSUurVPYcJDo2G/dfYoqWr48MrsMWvU3ypL4TorMiwX5GS7v
 XrRhfdF73xb2OGu6W13M157p8PH1oK/OkPbnbMXa8S4bGMnsus5RypzfjJEaKZ0MuAUsYmU0wrx
 ONmdJk+84fR0jumVN6J0Vpak8p7Zx3gbXpZqpVKk6lJ9qAWa
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_091946_474120_257BD057 
X-CRM114-Status: GOOD (  12.79  )
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

Add const qualifier to struct at91_adc_caps at91sam*_caps. This is
read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91_adc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 5927756b749a2473e979133fac955cdfd5faaa4d..920dd9ffd27a594a3be90cd6e4a57ef8d437dc3d 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -1226,7 +1226,7 @@ static const struct at91_adc_trigger at91sam9260_triggers[] = {
 	{ .name = "external", .value = 0xd, .is_external = true },
 };
 
-static struct at91_adc_caps at91sam9260_caps = {
+static const struct at91_adc_caps at91sam9260_caps = {
 	.calc_startup_ticks = calc_startup_ticks_9260,
 	.num_channels = 4,
 	.low_res_bits = 8,
@@ -1250,7 +1250,7 @@ static const struct at91_adc_trigger at91sam9x5_triggers[] = {
 	{ .name = "continuous", .value = 0x6 },
 };
 
-static struct at91_adc_caps at91sam9rl_caps = {
+static const struct at91_adc_caps at91sam9rl_caps = {
 	.has_ts = true,
 	.calc_startup_ticks = calc_startup_ticks_9260,	/* same as 9260 */
 	.num_channels = 6,
@@ -1268,7 +1268,7 @@ static struct at91_adc_caps at91sam9rl_caps = {
 	.trigger_number = ARRAY_SIZE(at91sam9x5_triggers),
 };
 
-static struct at91_adc_caps at91sam9g45_caps = {
+static const struct at91_adc_caps at91sam9g45_caps = {
 	.has_ts = true,
 	.calc_startup_ticks = calc_startup_ticks_9260,	/* same as 9260 */
 	.num_channels = 8,
@@ -1286,7 +1286,7 @@ static struct at91_adc_caps at91sam9g45_caps = {
 	.trigger_number = ARRAY_SIZE(at91sam9x5_triggers),
 };
 
-static struct at91_adc_caps at91sam9x5_caps = {
+static const struct at91_adc_caps at91sam9x5_caps = {
 	.has_ts = true,
 	.has_tsmr = true,
 	.ts_filter_average = 3,
@@ -1308,7 +1308,7 @@ static struct at91_adc_caps at91sam9x5_caps = {
 	.trigger_number = ARRAY_SIZE(at91sam9x5_triggers),
 };
 
-static struct at91_adc_caps sama5d3_caps = {
+static const struct at91_adc_caps sama5d3_caps = {
 	.has_ts = true,
 	.has_tsmr = true,
 	.ts_filter_average = 3,

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-6-1e79faad9762

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


