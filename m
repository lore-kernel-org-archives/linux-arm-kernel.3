Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50502C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJnt4X6YdY/BFyT2FERwCeV5jxdImTZ9iH94rwv0lzU=; b=js1svGaf9r9hlawhv2ziX1J3DN
	ZBn210hkAzOxZT/AHDW9PdVQHuGeJy+FQvJXpamt/Y5ZCSIIGWADcHC3PpA37E1pGinb1tGYgS+Xx
	Sd6e5d9lHahWH1HqNLO5wKtyWKhQIqdcNausl6GKFjkOQe6xHVREkI62dUwqftA/RXrzJqtv+Pbj5
	cdXLC1RSFXbg7B8kydakh6tpsK+5BvFBS39dI1zZSFRFDgKKKCYZmkQSOMMTR/NZJsnfkjAeAvo2a
	X+QEOxxM0JZQhGa94hzM9FDziEt0+cse3vWp1aqTDhL3+E6pCh2Yt0RKtBNejJJaARMuQl3ESzNRy
	8C2szdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cto-00000008ZfC-1ZuI;
	Wed, 09 Apr 2025 21:23:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB5-00000008Sgy-14Aj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:44 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so16968366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231062; x=1744835862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJnt4X6YdY/BFyT2FERwCeV5jxdImTZ9iH94rwv0lzU=;
        b=XlcMJ0sNCmQKW1Gy6BaQflZdxLDECyxs6Qgl1Q46imCnN4TIRADy21xkBmRG/j/jFZ
         /AMJCJqtYoDgkY58f9kt3eJvdO4iX6FQ5eRxyRptV5tRe9LCzlfp6UD8aHCnRiecjaNq
         nOFjIHT/qgOq2IRJUjIR7hY45e63MpauUbJ5NugfeB/Lmrpr3jI3CdmVCJqE6ZGXcwRl
         l31DIO1s3JjKGkWcQD7uJsixbxjgkrbdmPPe0P/FIJu24DF60+2YlrIwU2jSQZCZucu4
         Six8OFSdDHegpDQZLjf8diaxW4A55PrvChvrdI6RCk6FdNLa0wbprXGu1NdhpbvmsQvj
         7Q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231062; x=1744835862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJnt4X6YdY/BFyT2FERwCeV5jxdImTZ9iH94rwv0lzU=;
        b=L5MJoDofFJbsPkP1IQV5WaL3KK8ehLm+tcT6kJk8VGoy6XxYCAbiC7WS2ToH5ywIHS
         p+64+JC3fZOnhtD6Al3CV5zh7/92w9mWYmoWLG7BH1smy78WwIDgn3xyLBP0KZItkNYQ
         kWByhafVQJRzaw+bGvO/iUE7rJz8VygS1U2qn399zRDSXrwklKjaBHAT3l9sa+XQMaZZ
         wry06aLonZHw8z2CtOOqBPhgRU83Ui0t8tzUCMleZ7sKFaLv872Wz/A7GH/BvdVeIGlQ
         nziVCJpqieS5XvXbq1/emI1g+OEbPvp28XZo+fcsEnhyuMz9hHYmaSwSqk6XZucCQX6A
         wZPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPd5dQ2g7srSUz7mD39vGGLFKT4v8ZgolMnomU3BaSrGfa7FqUWgrIJdHm2fmqB9bCW4NJoCci0pHANE/ggeZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YyDQiRd1vhQw5Zqje0fD7ePH+eHSlRlPNv7/1DjWxMkHq58FxRA
	5zuEgic4jS+FWenFm/eul+t/lmTe92W6TNhA47Wqou8n2DNek3kXk/zRgMTBNFQ=
X-Gm-Gg: ASbGncuCR4KE1SJ6Vo7YVz6q6PzgfmELSL731W1W7cPbhaLGTAcb2l8wX+Guyl5Gcs4
	18ysaLqre0KwJ1ARJ7XkqlNajBNJE7Ti8K1MgPeJmb1YlbF+3OvpESlPE0o/dwREAJGvgJXuoBQ
	6/TgcoU+JSUAIuOBNMctFgXCUOWycaiN/R8csCZQ+MD8N69btxHPRgx4krYAwVmXy8kIg3t9fpk
	LxkAKhRJzGXM8hbFCJer+VADgQH1zIpBH9Zs1FBbS+3IqeiCs95sMY0KineI0PtuF8TuzXAfXak
	zv1cFC5HBqkNuR7TkDf5O74SPX5tboEuS1GhBuBPiN1IS3vR2bmPFjlJx/paoYdaBLKMoI5/uFk
	vbo0mDB/4VZKAnQVp1BpGVc6zWXI=
X-Google-Smtp-Source: AGHT+IGcGvyBEozGeWIYo1Wmu1QpRypnZWsnec23s92Whxrsp0WWnRhv1muM1X5KK7DjvKkeOCkkGA==
X-Received: by 2002:a17:907:7248:b0:ac2:9093:6856 with SMTP id a640c23a62f3a-acabd4db31bmr9024966b.54.1744231061967;
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:45 +0100
Subject: [PATCH v4 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133743_290596_3C216B01 
X-CRM114-Status: GOOD (  14.50  )
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

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3..92c8d36dafcf8a448873567fb3541a1b90cd9837 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -140,6 +141,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	clk_data->num = S2MPS11_CLKS_NUM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -221,6 +225,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -241,6 +246,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.49.0.604.gff1f9ca942-goog


