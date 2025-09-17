Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39507CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+JFxy0ygOdW3l3nHRVIFlZWqg48U5vYOHIigwzCCL4=; b=ODu5tUCoY3CPgXvDzLMXb6WqAz
	g2YnFKKBOVm1qa6OFwwmI4T36z4y0h72G0ph0cgrtjQeVR4K6YlcUBj5DAe3BScmvffWs6mHiKwow
	tqw469+gu/CTIXmIaynv3zo6ZAmQQUKOyvNavjDh6Bnfp5UpHdz5vPXY2yd7GtuW4B4m2baY+iYBY
	bDSHM1H9LG7fwJiKnb7Q+aAbCsXbrMKY2iMxWn1qnw991ZaoY5gs21nDeReO2aT6SMVVaGsm0Jgk2
	5XBDU5CyoxqNrJ9jBqHAJ/FsomWcRyZ3CNIstCUr+C7M+DqMeEXo865YStw0F59YLPih7X0Ev28ao
	XjnqH1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytK4-0000000CJMp-0koc;
	Wed, 17 Sep 2025 14:39:52 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytJv-0000000CJGk-1ULM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:39:44 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-62fa0653cd2so161530a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119981; x=1758724781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+JFxy0ygOdW3l3nHRVIFlZWqg48U5vYOHIigwzCCL4=;
        b=mKP2Dr630aoABLf+fzEnaL2N981KfOPyqsS8I2pWt4MS7/l7OZW9po97wvZYfey1km
         QJVFfPmra6h8W8nSEHeNlbeW7LFQGtWMMvb0pj8VGR8qtg/8+cZYhMsR/c1mTnayPTsM
         3Ch7LIG4GOp9AjANviw3a/KBrZgYDFFU8Z8UjDrOvEAKYW3VXNSV5JrnzjgyCG1/4p0t
         eToqC4bNjFhagXOe6sryXsuyfvFKVXMVPe7VDxqeIetksaQrGL7HarvQ8WTRyOyR7mDL
         euRdrlwhxPye1Wupyu/Ye/ODT5PzWqeE8FaQgSHT/v1s69tfsZVf30jbNQoaDy2fS6jM
         iHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119981; x=1758724781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+JFxy0ygOdW3l3nHRVIFlZWqg48U5vYOHIigwzCCL4=;
        b=o1Uiyx8/3pS/1qjmdMhKPAI44yyzsn/xl0jSS9fl/A+1JkyKO5SQYrpV240IVMIY57
         DPCDTRdqlpCIHuuszZR2sa8D5unBrxBOzxlgG5QplkLRA7sYViuPRMBepZbFVodWyIJN
         QeoFMJKbqA0W+hUOhgs9oFAQadxgSRhc0lzSjvha/vOZ9wDXa4opCMBNEO0AGIjlG1YD
         M31NMNFvac6ISRGRY/CFtvX4WxAfaB3WugOC3bT4GI64Q7l6foWWagl/IXWTh/CoPccx
         W72eYXb5tA3/O5CWBgYFkt5fKY4mLgsp0OuQyQ9B0pamsKiSBhJjAj8oUkYM7fcXJtlD
         NjsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP20jDs4XFaImfzLG/RVsitAeWyJ5aou5Hu4DMck5hYCHsVHypyHt1mfPRz/36JWrBsLdHzhPeW4hQ6Rfe3uCx@lists.infradead.org
X-Gm-Message-State: AOJu0YygKMEr6RSUX23X8wTYjKNyf2T5cQfwGVXD2i9fC8huzD/oS5M9
	bEmT127zctmu4bP+RPosPMNhHbafuyQ/NxJKLNGiI69AKMESs6N+89OWIM1LUprRvz0=
X-Gm-Gg: ASbGnctmmZEZmsT8ZLLzvQC8gIvQveXnvBxPCRtrzdu9bIUCOamRoSVO3orVBlw/Tgl
	B8wxzZIFUXlkIXW0Uy4FGvTEnifBGcbMecG3U3R0aoTzH44SgLNfk7fnyS+PJSZ9oEO3OxTgAiE
	6GASxrJGZUxTIP6bQTK0pZeS4UuJ+sS/E5MpKox3yYcSuqCOr5HC508QVBVnIU5rkygmmA6Lnd8
	u0Fd26GWhEQG6+qXeuRpH3n3Ee6QNaGDI7/a+aqf8p8zmmXBJKf9cjKKbL/jSjV7ytr8Ty10LEa
	+Crn/ZXWrpHAaChqrpzAfj+h+0Ls9Cm6AsfbHf76NoH7a8lPvVZqVbBFw7TzVANKXIVqc7EXBj9
	PAHJXTrFxm0l2iycHhz3BSg0wvTt476QdRbMUy126wXoUuRBKJj2zta3HP9oi7x26zCn/MQXW4Y
	vxkgO+m4wQv9vQ
X-Google-Smtp-Source: AGHT+IE8VEnZlDl0+bIWDG3i7/q7d7hKEqhb51w8SDDyxzRAyEBFsV4sp9akw/faDA2uEjEVnVB25w==
X-Received: by 2002:a05:6402:5210:b0:628:12e9:5e41 with SMTP id 4fb4d7f45d1cf-62f84685255mr2219366a12.29.1758119981486;
        Wed, 17 Sep 2025 07:39:41 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f317bf9f0sm7112464a12.49.2025.09.17.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:39:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Sep 2025 15:39:33 +0100
Subject: [PATCH RESEND v5 2/2] clk: s2mps11: add support for S2MPG10 PMIC
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-s2mpg10-v5-2-9f9c9c4a44d9@linaro.org>
References: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
In-Reply-To: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
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
X-CRM114-CacheID: sfid-20250917_073943_410386_0678D4E3 
X-CRM114-Status: GOOD (  14.16  )
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
index d4e9c3577b35dec8d9ec67c489b7b5ae27211f55..ff7ce12a5da6b437b5c92b9a32dcaf9423647cde 100644
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
2.51.0.384.g4c02a37b29-goog


