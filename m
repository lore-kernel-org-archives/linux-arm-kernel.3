Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40712C83F0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/HlbY0O85zcixYzgYTA8H0Mdv+GR5C9KDIOJVQIiKc=; b=MLQIz6MlnkR9EgRz74hAsfT9gY
	FjS9KwfSLFZ4m+KnS8KxoCyEkGPD1Zbz1GFiwp+ioSuZWvZ8OHd9xba3MjPfRGRvSuttqr3EU1cDE
	amcuRtK/IV+qj7GYRvotRTqGIn7XwY0tbKtDXXXX76bhwtaZAfIIJk7o8UZ/fEgQ1yl5x58MejlC4
	TFKE/oa1VD+4zAURV3ZaGQrS9FPtugRgEf78gUPbt3ELz4Sfrl2Ntuved8Yd/Jv/zRJ2fowJjwbg/
	h3hTExPVmZq4zezTxfMnAkIhl5GaQU4qOqL2igKrelA86j/Cxq5vQ9wnnFWUFKYkoZSj8GWi7iggx
	ABcVQurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzZ-0000000CTIE-2vSS;
	Thu, 03 Jul 2025 20:57:13 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLco-0000000BmOU-3rbb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:13:23 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso131901fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555601; x=1752160401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/HlbY0O85zcixYzgYTA8H0Mdv+GR5C9KDIOJVQIiKc=;
        b=Bz5muc13TZknInWNc6ejUb/2Kloqi1VYlo00RaIwBhaS8JNJ9KMFLNY7fhmIELzAL/
         Bve/+lw1JJKV5Ae6hZrm0uLjzfSvX9uN6/FAh1OhNO+kv0xAUO8446NXYpfCjRA7Y3zd
         ZjAGEpgtswgYqGBqHYD1bwh8q99BXn5X+J1SMd5eaHZPRxygcPbz8N3amk6CgL0iRkd/
         +wsvB9PAYK6uHgmcC+PwWh9zak06bscJfy9Z0wNqLesZUuVKBI4IGvJlC1W6u317AmEP
         fuM8AiYlGJGozCNk6bWD2RMKEeTSHffunkSAy5OwV8F3dmVtGmho6VImkvEeStVzu12u
         oLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555601; x=1752160401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/HlbY0O85zcixYzgYTA8H0Mdv+GR5C9KDIOJVQIiKc=;
        b=iJxrLu2ZDdTcz20FDRVAKBlbVJMI3BDunOSrlgxVcbAWdxpjGr8vS5kyYdzAycAaUg
         E90LoxBEEPpf5UNnT5cl/JCaAQFD7BgU6OOirYzPgUApD0rrOnEI1Uub3ThwokdtvSFq
         w6jzfm/yJBQ62cFL78TeEaRuWlMqx9QLFNPMENKIM7yoXcwWKsdV1TiMA9VGmSudG+Yu
         qxwZS273RPnFpqxFtWV2lnN6RWJ17f2xUeOhRy3yCg8mQ6crXIhJVH3rr9f4954wBkgl
         yNLrrSLQdQyI+8ETgRPqCDNvYZlX+XSrnLcevnV4hbHOsvNq6U0qovmNzsm+V7pk7+I0
         A8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCU/XAp/P4JE/5EYHFSiF8D4F7ByJZtV6RDwN6Cko5fW3R9TikB+OIbbAMAY/iz0hXBXtFua6uISUKYczerhRDj0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8iywE/IskHw/eIX0+Is5XSTDRzMlPwqMO38FUcpoN2pvsf3uf
	tK2HyFzDLZZZvcBiRWT9zE+We52SmyAdCuz/cg4SBkzzke0MtVomr07p
X-Gm-Gg: ASbGncsnlrUVc2nVu1z0vnjvrr8N0k4+M56wB8u0H4c0uAncz06AsUL93+WyIp+Myip
	ADwKRo5+VCaONxzr87ctoYdmtGRmI++wtF2W8vRmpBLhQ6xEH2vw0Fi2kCEqbrtKJIuQgGT8lmL
	k7CDYhlszVpO/9IbbXimLZPYlQaR/5ejb+OPaANIXhj1c3Q3bRXelwqZqKjuh5ffm8k9fWCAuqu
	NbA5o6zSJvUkxaB+EazItphktJLar1ZlgDJmDaVrPiZznHMlgoOy6bkOPEF0tH/9OSaBmaitq3T
	XfFTUtGkcRslxdn+mPWkT4aJZlbaNAqgHElnpL0j8XlP9eLThuiYHHFrscxQ6Lc41kxfDnM=
X-Google-Smtp-Source: AGHT+IFizivHRCGbn2xa6qy5KahETw6sFgoEVp5+fipVdvBjkYyulTltzT89w8oz7cos8x+uQdLuBg==
X-Received: by 2002:a05:6512:aca:b0:553:25e4:274b with SMTP id 2adb3069b0e04-55628344003mr2815796e87.41.1751555601020;
        Thu, 03 Jul 2025 08:13:21 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:20 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 4/8] thermal/drivers/sun8i: replace devm_reset_control_get to devm_reset_control_get_shared_deasserted
Date: Thu,  3 Jul 2025 23:11:28 +0800
Message-ID: <20250703151132.2642378-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081322_958902_50F35E54 
X-CRM114-Status: GOOD (  12.91  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, but they share a common
reset line. We can to use devm_reset_control_get_shared_deasserted() instead
of devm_reset_control_get(). This will simplify the driver.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 45aaf5348..bdd15ee45 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -344,11 +344,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
 	return ret;
 }
 
-static void sun8i_ths_reset_control_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 {
 	struct platform_device *sram_pdev;
@@ -391,19 +386,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 		return PTR_ERR(tmdev->regmap);
 
 	if (tmdev->chip->has_bus_clk_reset) {
-		tmdev->reset = devm_reset_control_get(dev, NULL);
+		tmdev->reset = devm_reset_control_get_shared_deasserted(dev, NULL);
 		if (IS_ERR(tmdev->reset))
 			return PTR_ERR(tmdev->reset);
 
-		ret = reset_control_deassert(tmdev->reset);
-		if (ret)
-			return ret;
-
-		ret = devm_add_action_or_reset(dev, sun8i_ths_reset_control_assert,
-					       tmdev->reset);
-		if (ret)
-			return ret;
-
 		tmdev->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 		if (IS_ERR(tmdev->bus_clk))
 			return PTR_ERR(tmdev->bus_clk);
-- 
2.49.0


