Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298E2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMW8ZYmbAyYveksUpaECxL5x4y2TvNw5k0vzt9tGwik=; b=F4db+faZvoJqdn0JC6GE/InGKM
	gZIGTOKbh/b/RQCXjMDvkS0s31rhEZqh6x4SxIixjdCN3cM3Q/soZh83hbuufO9iUBgJVoIaZHk8Q
	Kcxm9hIjuy+9CfIK/2uvvoFxte4FxDsXUgoFPbSa8BqI4uUdt9QQlcdfqT/9/petfIHj99YDl1iEB
	k3d9BNDqde/zpoRveGkEdgZIylPvmpYFgVx0GJxyBv3xB81I30Trvc1qG/WAsogROmtsFJHW1xFim
	GrBZepUxk/Mzcje38jOA8ScrA92emvTPD17fPQOt87XFBjpCUNsph4YUAmNkBcviWuHsBuei1zblM
	e/8GaM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uES6t-00000009MaD-433g;
	Mon, 12 May 2025 12:18:19 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERuu-00000009Ksf-0ZoY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:05:57 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54d6f933152so6040818e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 05:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747051554; x=1747656354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMW8ZYmbAyYveksUpaECxL5x4y2TvNw5k0vzt9tGwik=;
        b=xSmSZdapREYgFRQcexHvWXF80Spl8fvf1rXZny00b1TKE4KKZXXF0OEeNWpUlSbrdn
         JZtbnc5/ptKESRm4Qj/VoIG/vSMoq1F5LnxMcyGZljhUBc6oBrEoNkCa4o18gm/3zgsd
         lywLzZc1G1q38Y52DyHiL5KYyvtgake5f6Yj8JHfxX2R+Yh14lwiGbJ7sUpnuIRUvHpC
         jmoBWqjwHUuabCyOWpGx2EdwwxI4/uU5Wg2suVSvQE4lIELbCYu3Injt2zY+qjdPZIE5
         TDoGqLf5qfKYUYZgbK7ee/5ltGd8GEi7luV7JLm7k9KxURx73dBLN9amg7KWwJYclbZL
         NigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051554; x=1747656354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMW8ZYmbAyYveksUpaECxL5x4y2TvNw5k0vzt9tGwik=;
        b=YVN5ONO6UlHBq773zYtaMHP6OhiYupiEdxUV2f0aakgH+nXAbeOWgmRvBAEgWo60Gy
         ftqPLEUN2RpMQFGvKj8eKHUK9J7uPek/8nN2NEhN0CEAF8Faf6VQFpSlaghH3sRV8umS
         CzEJ36Ikdnrxbg30njEGYO1CIx69EHLe17K2oT1o/OiCCj7946zCjUEQ9ONTvKbXBG7u
         0BRnoiMn27ZXYuMMHPjYN6HS5DySk7HYRL1ybyLKTWwNydwmtfNhLho2M5L/iUlQBmp8
         H+s1rWWXUnOYySksZmhiC9i9LWJv7bSzCTqU+I8jUVZPWBqz5H6LJmAu4/fBI5/MzX9A
         5+8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCRHB3hEexQ3MvfeOZ9QmgSlBs5bzu9I383EDPsZ9scUuwi45rxmub56BUybLyIQQwyvegr1X+KlWTFesAudFl@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ14sqshStqNEDUrQadOl3X1PKtSk2fg+mv9oOf4B9tHWQxRPT
	PKkZ4E+hRVbmQvxiGQTbj76j76fRnyOZPn4MIkU7i4ztgUFSyyU6O2Az6WXQdH8=
X-Gm-Gg: ASbGnct8VMYI9rTWvmAbIil/Y6nImRWzgbWngAgRJozU6e76yxPjBXYs1MmKgZHkFC1
	8YOK8Wtk5+YmVq12lWKIf3c7wujclxMlCzeX/kdtTsOtbbcKjXYkHxICZ1XYAWbXsKRWeQyrDBm
	3OoZkZpnfuyNqeJPftGLDH0MCyacRD4OwibjFv0CTvX+JRjJYsht/LJjqQeXTWulx0N0R1EWQx7
	q58ON060hObpk9E/Gx6zris5FsPzivCOjYoGnKNoxQRsbruizB1ZAjVPVWuP9tdUYJF/8gPCUox
	Ee9qFP7vUdkqHXuPnZkMlOLjD6p+BN4t02hN5tULyzjtq9cluqxRSxT1RuizyQ==
X-Google-Smtp-Source: AGHT+IHxb2O+hRExT7wJM0hdL0T4Go9j50fqYlAT256TZUreuKCMSBufTsDqXxN7OMd7gcH+p4r4lg==
X-Received: by 2002:a05:6512:228b:b0:545:2b68:936e with SMTP id 2adb3069b0e04-54fc67c8ed5mr3411723e87.25.1747051554236;
        Mon, 12 May 2025 05:05:54 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8a3sm1466033e87.189.2025.05.12.05.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 05:05:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 May 2025 14:05:49 +0200
Subject: [PATCH v3 03/12] ARM: dts: bcm6846: Add interrupt to RNG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-bcmbca-peripherals-arm-v3-3-86f97ab4326f@linaro.org>
References: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
In-Reply-To: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Olivia Mackall <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_050556_201136_C5E3297E 
X-CRM114-Status: GOOD (  10.37  )
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

The r200 RNG has an interrupt so let's add it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6846.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
index e0e06af3fe891df3c3d8c2005cf1980d33a7762b..f5591a45d2e4ad64d8f95680aea327771825252b 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
@@ -196,6 +196,7 @@ uart0: serial@640 {
 		rng@b80 {
 			compatible = "brcm,iproc-rng200";
 			reg = <0xb80 0x28>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		leds: led-controller@800 {

-- 
2.49.0


