Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0776BC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IMFk6TBSRPoytsEFWA/L8bAiB5zpBhaDKXVpwxdgx3Y=; b=rHtPDOerUuaPglykGHibbuwpGr
	rW+BlZrmyUu1i0IxeXkxMVVP+VDDZfLcEZOw3jxyxHuhT4P2WwA8CzR4p08GynY483l9pf50YX+I2
	WvXyw1n6AdT1iStYY3esuUYMHJXxVBfgCLNPqJHYIczir5aYJZ4hsvDjPzdyOzVt3frHqvZlHMIHj
	t2Budp0stVj5eOMZ1XVPzDo5bldrDB2Paxti3FU6qcFgcvUE5tHcvv0iQf1BEEleEmsjn1fUREpHL
	lU6PQqUxIW6vwnnud8KbFu2+UcLt5rdGl3aSA9vA/Nr/XkMAFXG48pNzm7qlQcIKzxkdM3lEmKZhg
	/fvJPLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYcy-0000000H24j-12jU;
	Sat, 28 Jun 2025 16:42:08 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYad-0000000H1xO-32bR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 16:39:45 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4079f80ff0fso2474215b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Jun 2025 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751128783; x=1751733583; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IMFk6TBSRPoytsEFWA/L8bAiB5zpBhaDKXVpwxdgx3Y=;
        b=mwFlsJWsxlblJttms/IpHqMrqSSMOM35zLkRpwbHfFDds+F8Q+6uGLdp9qHL+hUjjH
         Basn2wkcXD3lKsaqkoK7/pCpzcYWvldOXZnHi8V6c2r5lvJCrV5QCf1gkMTnqCDpa2bJ
         36jalqwLAHARW7sSjigvl6Pk+b4Ju6sseMRlZ3JESJY33TMJnHHi80yXsNWurQ0NYqfw
         ytSqZIOIYvuWNyRv63qiAoFpKyosz+wmmiDRYn90xSsmtYu0+GJOWN8Cf8SV8+xJioJb
         BQUch7jqsuhPMmB+TvsR/mt071SM6hvhNq/11DkdZQ8qOeker2Rd644dfds/wrkXMt6F
         E7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751128783; x=1751733583;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMFk6TBSRPoytsEFWA/L8bAiB5zpBhaDKXVpwxdgx3Y=;
        b=GZbQaxO/UzmQeTjMBIXO+uc5q3+WxgDrwPShNt1819tOw3SQoxg4XQZlUdRo1DYIvd
         dWjA7lR65cTZaxu6qj3LpyWCpDBbGoj0Y4xlmYmZgUNa6qOnaIxKX3wmLv53UlNUpy3l
         6TwMggX5nPMBZS2K43ltRuJtxWZPTcbs6+IbixUYRQSkE9oy0M/g5m6qQ9/K/Sao/by+
         FuyvldUdb4s89IzWBXfPMil6JaFcl4tULz5DfwpQHykXLhktuYzc9qoLEbesPHathwso
         5YZ0NtaVQj9gIiOb6N5aEAnecdEXuVhLlOKwsnDZDzHxKFAGh3fr14pWkQiOb2PihDQR
         FH8A==
X-Forwarded-Encrypted: i=1; AJvYcCWHxp02kfvBrhz50rB5B3OKmvFmEjDLlwSGSoCJqquerII4UKWkgiYHY364YED+umUKtI8sDWhwfXptBqvSdnpH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj6rOmR02ykaTOAUZhxmLroDVOoB1Rlb58ppPZpg7L1YrvjiA3
	bEudF9gFffbuP1J9KgtEJalNvw4ECT2YR6N+Ny9tWAab3rup/BEPAeCeqxUxmqvh+AE=
X-Gm-Gg: ASbGncvpcMUZHWXd9YFSvdK3FCvI4fJhAuAiX4YtnLB+kDJE5RzbpdNljiWgFnzynR0
	f6QRC7cxIwGbodbvryP0NJ+24JVn+6zRcvpOfgwCfVQkRjSZSd6MpczmXdqYInxEdF8eBUIlSsf
	4rxUxFlOz0cyEefpVhh6b79+7ww2lfV+3XUAyRduwkZGBCJKMwwSKXvW/hphKwAEVNVfIOOGOmQ
	pPvK7Rs/U8OBkTELlaiJnx/cDHBeC3AGOP9St51kh8PPRzYF10nttBQcwqMFqK0/QPGTCmQiV6p
	MqhVaF3tzpdF7pgxsVEMw/mWdoQLzYRZWfotwX9evgY2i/W1ij1tXXxB6CGhkVGvFwqz
X-Google-Smtp-Source: AGHT+IG/xoZFtVbTTOBbDGQ9ZV0tQLObLKh4Adi4IyxX1NpFYvM7jSz8pvzVA7s7N1PFYx+rLy3enw==
X-Received: by 2002:a05:6808:f8f:b0:406:70bb:f25 with SMTP id 5614622812f47-40b1c87a6c5mr9375589b6e.4.1751128782758;
        Sat, 28 Jun 2025 09:39:42 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b338a048fsm845415b6e.24.2025.06.28.09.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:39:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:39:33 -0500
Subject: [PATCH] iio: adc: stm32-adc: make stm32_adc_trig_info const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-10-v1-1-0ba93ac792c8@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMQaYGgC/x3MMQqAMAxA0atIZgNtaEW8ijiUJmqWVloRQby7x
 fEN/z9QpahUmLoHilxaNacG23cQ95A2QeVmIEPeDDSiasaYUz2RwxnQGiQZDTtm8Y6gdUeRVe/
 /OS/v+wFFPZsnYwAAAA==
X-Change-ID: 20250628-iio-const-data-10-2e80d4dde542
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=U/8CNOHGauLsIgkJyowuqKhLhmaCBd6GX/xYox/0+34=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBrHfYdBpf/RErszbzr+6hfxu+RD/bVyFoJwj
 IclktGBs5iJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAaxwAKCRDCzCAB/wGP
 wO0PB/4p5kujQILGatenvEj8+iwGQi6pgb6/Fzf7IdgpkaT8YugDUWjhLwUIfRctbSudWZDNBL1
 NNaMnRe4Wi9Huv+IDIRG5KZwlQ5+j0GRmlMhc2mPf5X/tq4IU321PAna8TnfhqDSLzeY3qAhagu
 8Cx80zHyoUAdBk/7KAY7EowzTt5EV7Hsnd5Za2Z9gxBKwzGEt9VTX9+Id8vzNfJdpT7GBYkqXAz
 VWUcALNxdA84Et3wg44mu5ZD1WMZRaL0DpRCBSwFUo9hrvaNqYOtOUosSJV8hxh9rJhLHH5AExX
 57IN0QLnNW1V45C8dBMUQYeZOiBG9/Q+epD7uEQLv8s8C1el
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_093943_771582_9918FF7E 
X-CRM114-Status: GOOD (  12.56  )
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

Add const qualifier to struct stm32_adc_trig_info. This is read-only
data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 588c69e175f5129030eef9ebfe0eabb6412b1893..b9f93116e114b1c840cbe568f17462b2d25bf2db 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -216,7 +216,7 @@ struct stm32_adc;
 struct stm32_adc_cfg {
 	const struct stm32_adc_regspec	*regs;
 	const struct stm32_adc_info	*adc_info;
-	struct stm32_adc_trig_info	*trigs;
+	const struct stm32_adc_trig_info *trigs;
 	bool clk_required;
 	bool has_vregready;
 	bool has_boostmode;
@@ -383,7 +383,7 @@ static const struct stm32_adc_regs stm32f4_sq[STM32_ADC_MAX_SQ + 1] = {
 };
 
 /* STM32F4 external trigger sources for all instances */
-static struct stm32_adc_trig_info stm32f4_adc_trigs[] = {
+static const struct stm32_adc_trig_info stm32f4_adc_trigs[] = {
 	{ TIM1_CH1, STM32_EXT0 },
 	{ TIM1_CH2, STM32_EXT1 },
 	{ TIM1_CH3, STM32_EXT2 },
@@ -473,7 +473,7 @@ static const struct stm32_adc_regs stm32h7_sq[STM32_ADC_MAX_SQ + 1] = {
 };
 
 /* STM32H7 external trigger sources for all instances */
-static struct stm32_adc_trig_info stm32h7_adc_trigs[] = {
+static const struct stm32_adc_trig_info stm32h7_adc_trigs[] = {
 	{ TIM1_CH1, STM32_EXT0 },
 	{ TIM1_CH2, STM32_EXT1 },
 	{ TIM1_CH3, STM32_EXT2 },

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-10-2e80d4dde542

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


