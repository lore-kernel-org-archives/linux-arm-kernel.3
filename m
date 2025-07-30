Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8E3C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pReZwdLuvK2x7nnnNc/6AC+XTJeKDHlZAHO11VcmSA=; b=VdBi9jTwBEkHfqalk1nP6iLZuh
	gtyRE4hZ0Y03C3Iu5NoX3ATj2n07cLAKIH7Pe5VhKnVMKx293clSfNqIs111OuFbIW8QXjtPwjelr
	nYJ3pT0o60vYLecU0pmaoAfq8XUDnUf+95FSbsd5ia8DBfB/brn+rhuQv/oUQ4qciFn8+DM5N3VWx
	OKFOtdl5U8GpmGHiPqNs+B3LXH5VKoKMsgaRoBe9yz5NxseDFf0x6tW5gMif25iMXe5qN3mdrZQFs
	fNNX/dp/eOWe1zkNSUlAWD0So89G292JWSNNvSnCrXy1AmMnJIepn2Ahi0GNGWo2MOIV7YFTgKhgm
	nyOzY8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3I3-000000018Tj-2R95;
	Wed, 30 Jul 2025 09:40:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3A8-00000001755-38vk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 09:31:54 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-af66f444488so451474066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753867911; x=1754472711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pReZwdLuvK2x7nnnNc/6AC+XTJeKDHlZAHO11VcmSA=;
        b=B3fnGVUFtoTLdiuosAUMSZLbhMAVd6KDnwEUDfUY6LthD5YV1dm0OoAvQPy76VUyvP
         ozCr033kqimpdYpq/byiQHP2z47thtVL0V5MITM9/9d2w0cNuBN7RMf6EaXkK8Ekto9/
         cC4aUEnE7aNA7HpxJ/gJvM7ysiKlprslpFm0K8PAQMmY8mtokv1E+2+RfogzWazwCd9b
         /dxjufzSHCeitY8klUpioUPcDkcroThCgtzYocePqYDBmduE/12rqCa2Qb0hfESxWpjA
         ZZSISJkL69dQB1y2XTTVrKzDXbzDHe3ZFg6gSLRTsESuIJNG5p8UGX+bikJB3++A6/cw
         XAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867911; x=1754472711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pReZwdLuvK2x7nnnNc/6AC+XTJeKDHlZAHO11VcmSA=;
        b=gg8BrbIjfXZ+pBStHn01C6Q//Yr3P60W2DuEwfnMpae/N4d+rL/Ht8t39qXVWatIxA
         U8mOmbqQ7e/beV27XuK4W9gS1I6ysGvYjBEous5s0g74AFQT+aHUgrPjaDnxSRpVhVY3
         V+fiMOeoppiZ98oU/VYTSuZG/OJhUXI1fewEjjtohvqO40D1VZdGc9U3+yXRzLw7qzvy
         2U7ySkqXfCMD/5FzHnxQSf4XXxtaRv2hWO+VmgBndEAFoYqgx37uxebXi6QWX/s8BhJF
         MO6CGZePguhFvU6yeCy4guDJjBuuiX9M0by6qFoRMk4JFR7NRDBEVJ/RDtCR1o7vg1Cz
         Teig==
X-Forwarded-Encrypted: i=1; AJvYcCUHP4HqFr7Q0iHwe/fTU106PjM63sxPgb5qPBPz0twiOUQcpnBedyGDPBgOOzIR0gJujbNamvdc7lEjBescBjbK@lists.infradead.org
X-Gm-Message-State: AOJu0YxrM+wN3axAQw/ToMp+sbGu0gd9ySYeHHCqJtMtZypmhGv8lKca
	qyt5HlbD1kG2Tdappo7hYF2llEFm+Qvz9mNWSxsbwuo3FRJVeljIjzOuUNfsbzTGmNo=
X-Gm-Gg: ASbGncuFG1JmBlniMY0+9DhwtxWpiR2gfSQqm+GpTGGE8v0XyhErD2iirrBnv7BSXs9
	gTd3sPtdh9re5IufRXGKvBVt0c3rxpGCH3/6F9jhqa4bqD7hhgU9Kt/XkDVRV/3BvQjOnerJiMY
	07LkuPzDa5EWdcXbDCJrlbwWdgmsQMgY7DMtD1tCpKvHZJWVhxlbCIytnqWddlksBuGcUgUtqIw
	pom6L5ckgoXVvplHhxq2KKl5nKGkEaUregszlWkfEKEnXq8y8Mf/06EgCkU4b/Phz5t0uu/5VNd
	P5RLUB26urjndKcBUFki1O0HScCgoNvU1PEii3hmeBDYmxHNPSRE7WbvfaAAIaahuWC3wzA1b0K
	CJgyIJs/ut1r2eTu/huKCDjPECEqExBnKAnU/wWbJ5go/bItktc1XwPk2pAQSyoI7PGt6iPiX5i
	31FI3ylA==
X-Google-Smtp-Source: AGHT+IFAIKlwhaRCqnP2buBcT0RopLWu8QC5KSLz/f0m4GU4n7vGaomxMURhZGUWklTnaKUlIOKM1w==
X-Received: by 2002:a17:907:3f16:b0:ada:4b3c:ea81 with SMTP id a640c23a62f3a-af8fd957532mr287123966b.39.1753867911166;
        Wed, 30 Jul 2025 02:31:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61536916dbasm4090424a12.43.2025.07.30.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:31:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 30 Jul 2025 10:31:35 +0100
Subject: [PATCH v5 2/2] clk: s2mps11: add support for S2MPG10 PMIC clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250730-s2mpg10-v5-2-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
In-Reply-To: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
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
X-CRM114-CacheID: sfid-20250730_023152_787145_8A6952F8 
X-CRM114-Status: GOOD (  14.59  )
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
2.50.1.552.g942d659e1b-goog


