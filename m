Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0F3CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMD7QeI6W9dNWnhJIzqLT3zAaxfnJWvzAjRZUvW7yTQ=; b=aRfPcdvwp7ikCLE2A1+v4IbHa2
	w8N3t/aNia9cqlqoy0ggPeVxXFTiin2432vQjQrN9yWgqlmTGpgJbYq5EArMEePTVY00zFbcPwhji
	VChxrxZuIzBUurZXFJlMzmeKNOWb6/qPqKlcS3MAopmfytOORAMrepMD3M5U7GPC4zbP9P9M7KFIk
	C8tEAP7iyaUJdIDt75CWR0IQB+0iSeHlVmXsDo+10TGIb9UpQ9sxvk0dT2qaK/CW2bOslRkoAEtpd
	FXC9Ys/uo6739TVSO5DFswcg2rVXTMwIYlgqk5Fsu4xlQTm8x5Iws9SCyc6H9iyehFbqvF5VTDBby
	mNRn46xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Vf-0000000DHMl-3O2T;
	Mon, 01 Sep 2025 16:35:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3zT-0000000CajH-35P2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:50:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so1485396e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731030; x=1757335830; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMD7QeI6W9dNWnhJIzqLT3zAaxfnJWvzAjRZUvW7yTQ=;
        b=Xtlo6C4pj8Z6u4hoM0HAiZ8iGbhFWWPnlMwm6MbWMswO+tOeA8rInWt5ySZ6StNVDz
         IDV8kHIhS45cww98NPdsFMtRJTE22PhBFb0UWF8wN92x2/HZChxOV7P3S7MFvYOywxz+
         G/BVRmicxcJF7kpWu1kZlFiWL9ns5W4BceIvWs4MQJJtf7HFVVkVK2cpb+v5iTHYcgHx
         HoGpEgprsEUcPoSVWYL56dEOEvXElXjfOZVcTwqyaO5m1ZTDgJFgSSV7rkt8uLjBicuT
         8TTia4i7VyurJcifp/tkwDMWfkXNvxPrpku/XzsVbagLBeh9qj80kZeHH5UXYvzdcggq
         6tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731030; x=1757335830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMD7QeI6W9dNWnhJIzqLT3zAaxfnJWvzAjRZUvW7yTQ=;
        b=Sr7qwMNGbFfHQUcVvy/1zNatVO6fY5PgR55e+/yPIPzkUqVW5GvenOMr3IjaE9WQUY
         lFdmxpbep4jzvzkahaOX5i6RrTuGGy+6CZC9K7NVFoCS83HmKYtRNUJ+dfRY0eWeFOkF
         o8eCifhFXhu4ffxK0FZVDtJwahS6SjEmpyoaBm/6YD7pvHd9yWVlJ36w2UXPIksE+6jv
         HQ0LphupVaTYLjYB2nvisY2TrMLuhJo/D7ypSMQpNq+knQzPhQM81Q2RAo6iPur3LRea
         lb4MaZkn8XVlL4sQOKFSkWMaHebOUJ/72S7ixNsKHBiDosvb56k3qm7fTC6re5hqY6q+
         qWhw==
X-Gm-Message-State: AOJu0YyBwgRJyaplzrVuXOjtrlWF/L3mrAQ84qr6v5p7l5ylEX7VHKP/
	bkqIgx9nkyO2ibwJ2eaVwXuyklCqLGnDGBDdeL6ZYJIjtUw4mf1hUdzuJ8c62gmGyNQ=
X-Gm-Gg: ASbGncuypMoVXtA7Ud56divAeWAwfmkur19hkPIKuSpDtXVWiF1O3jhBFwCVuwW5KCC
	6KDytH/KBQaU/CIfjuh/4w6QNmGoCnc0yvk/Kq9Eeuz5POR9GHXZ/VJUMIIgOQr9vcB4TfMUD2k
	yXt0tLznyeIQ8kbbwXTOaXw8QfwL2eRfPkIP1iEnSilST6C9/nqKBaGB9Et4BNIT8rQCkH0aOjM
	r58uSpEnjXtDo7dQaqCwHVutVhhBjt/JtPYCkp3WB7pMP79CBmKFkHVmuMfBdNJBOGbHoSHOrzZ
	zdNlTuc5N6viaeT1WgD9TmJfK8D15FhL88GRD+aAm6RaOgQDAchIhNdPgnxXq385efRzg1P+CMp
	R44af1ab2vg8sBVmIMxFxxYSdmXfkBiEh
X-Google-Smtp-Source: AGHT+IEe5KSMPkXWCL+fJFfVTeOZXO49x5SOj2AM0WTVRO7fI+wxVkVUUWYRVWolqYonkpMcNu6tPg==
X-Received: by 2002:a05:6512:2347:b0:55f:42b8:b00 with SMTP id 2adb3069b0e04-55f708a2b65mr2256954e87.12.1756731029923;
        Mon, 01 Sep 2025 05:50:29 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774bc3fsm2926155e87.59.2025.09.01.05.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:50:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Sep 2025 14:50:27 +0200
Subject: [PATCH 2/8] ARM: dts: bcm63138: Fix RNG and DMA IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-bcmbca-i2c-dts-v1-2-ad81f60d4276@linaro.org>
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_055031_779412_FBB970E4 
X-CRM114-Status: GOOD (  12.60  )
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

The RNG and DMA IRQs are wrong: these begin at
ISR_TABLE3_OFFSET at 94, and are at 94+21 and 94+23
respectively.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63138.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
index 4ec568586b14c89daceddea8f17381f72f512a93..d7410bb1b5a8e221d7ca1f2f299ce6d2bc40b763 100644
--- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
@@ -244,7 +244,7 @@ gpio4: gpio@110 {
 		rng@300 {
 			compatible = "brcm,iproc-rng200";
 			reg = <0x300 0x28>;
-			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		serial0: serial@600 {
@@ -317,7 +317,7 @@ pl081_dma: dma-controller@d000 {
 			// The magic B105F00D info is missing
 			arm,primecell-periphid = <0x00041081>;
 			reg = <0xd000 0x1000>;
-			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 			memcpy-burst-size = <256>;
 			memcpy-bus-width = <32>;
 			clocks = <&periph_clk>;

-- 
2.50.1


