Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CFDC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejx7UzIy/ha4XsDoZ22DLZHvDBVGCnO/qaRmPG94r1s=; b=a8q/0ZQUDAqgFHiKT5k0sIe3Y7
	X4JmsaCTHfCi8q4LLatMLVjvUHSSiSTc+ZMaIzwVufRnMa2GVAKEy/TwrZKKjGfBsbrX1GnnUq467
	/ls8xOwrR13MMnWDaDuR/AMF3Of/cTXKdeKlm4juTdxk+k3NPIlQ3Klfbx6lcHaUtXM38esJdJxlk
	kPZXvC6BSC927Rt8NeGGPjkOX279r1XGspR3u8xZldx/5JkJmsX5LSYbBIl9LRkBHEKD89Xx+MmmO
	h55qzvc612DxcgfwvqmJsyyw1XzSGvsCpwrGOA4HyD5WiDaSJksYMI3DrblKkLBnUOHQGUZuFFp9D
	V7bfSlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1S6D-0000000FUuy-3aJQ;
	Sun, 06 Apr 2025 15:39:53 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RzO-0000000FUAe-0Kub
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 15:32:51 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30c091b54aaso33159891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 08:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743953568; x=1744558368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejx7UzIy/ha4XsDoZ22DLZHvDBVGCnO/qaRmPG94r1s=;
        b=JJzdwlPOUcOCn25m6qWvJ6Aj+4q8FMnRddvjWjs/TyqdiaAgPkpx7hS3+fGieurFwT
         HXUSygI7duYSQ4ah6+W6R/huiQWYgxvvpeIX1JYI/L8QAbqpn4EdbFtOtxGND/Y8CNLQ
         2ppVZQyt38Q4KtJKv9WdYfYqk7CNmnHFSrBN6j26COw90cg6isKBwuAUIErWpEX/AfKv
         cXAmD1j9YA4E4Okoiuoq1a7vQVqKPZTwmUJrA+OsdCPU6hVYjWTBjhtB5VDlTUjB5yfg
         nLS9s2zhhwyGg6TTb2oOpXNpmFWzq3UT2pfsYBwnEMaPwF6j/QkLbbjZgWz1GnUdOFOh
         1WjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743953568; x=1744558368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejx7UzIy/ha4XsDoZ22DLZHvDBVGCnO/qaRmPG94r1s=;
        b=hSZgNkBtQeJk9q/RIAiFZU04UtcvRzRud6io3kmrZasdpzjaIRfrgyRSf8lTya4DoR
         +4+q+NQ1BXwuHBx5KhGo2MC08xMEEKiUCJ2OVDw3cn7E64fARc0pGggCbov+M3HC8XIv
         So+i0NUPOCAJrv5XidzJzcxTjDlNhxM2LnL/HU+4fWXuwuL2z1cVcnDPT9qUQHdvUyrO
         pxK/q9hxx0LeHTRMhiN51C7qZySGC7Pn387YMcUpUOtALIC/BaEK5UgF3dDmQa4VlpTf
         MwAwMG40mOlPz723tMnSdRqd7D810Y74LxdoP5jcAaKjVd2shFueLFBBYoqzSx8SgO2e
         CIRw==
X-Forwarded-Encrypted: i=1; AJvYcCVYWBted+4BxcrcgokH7FoAsmMc9wTds5BTtQmgoqLfQ0E8lIooUDFIQjU5HUlJl301gZARf6OSan7Vo28ZFCyQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyWT0anu8TEyDkHs0Fdo9soHfec3UGas3NOaoFoLGzjJnNXZw46
	Y3WPEHqHsllOE7GfbTNsTxykuY0XmIcvCVaMx4wcPk99aS4ypdP2gG6kHemSq/w=
X-Gm-Gg: ASbGncvnfXQk98en1DY1G8H5ipbRIYDh2WHon9DrJe/U+yq15KpsjXgefJXpOd3+P+o
	dzhEGwrnpmI9XJmHF292hcY5Jn92O4Ocrk6JGnDNzFr3IXDbHzIEIiDyJtWoVguA3H/l/LtemBD
	pZ1PUK0L3bdwdFkqr1fQ8ZW9GK7qPiiIGdTTdueFL/gxratxV92NtGD2YvdxkHg7CV6aslsos8y
	X62qiYnWoI5MbkFo6QdIDENPOjDNyQ5+WR+roRmoyQwVakbKhpRK2cgZBUjHCjLFkiQNJfug4hs
	DBdSd80g4PoBghg1BzTjgp/X/52EI8Vx374MgY55tXtXPq9NP6v7uyE=
X-Google-Smtp-Source: AGHT+IG4UfmmllvK8v3gDCB/1PCYbzn5UK3BAxYEZRnyxkcG0076NiwRReAE0eyQC894t+mrcq9ZWQ==
X-Received: by 2002:a05:6512:3510:b0:549:4e79:d4c0 with SMTP id 2adb3069b0e04-54c298480f7mr995890e87.53.1743953568149;
        Sun, 06 Apr 2025 08:32:48 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671fa8sm989747e87.218.2025.04.06.08.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 08:32:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 06 Apr 2025 17:32:43 +0200
Subject: [PATCH v2 03/12] ARM: dts: bcm6846: Add interrupt to RNG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-bcmbca-peripherals-arm-v2-3-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
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
X-CRM114-CacheID: sfid-20250406_083250_120045_4452EAEF 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
index e0e06af3fe891df3c3d8c2005cf1980d33a7762b..d36d0a791dbf4ca3442797691957c3247c7187e7 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
@@ -196,6 +196,7 @@ uart0: serial@640 {
 		rng@b80 {
 			compatible = "brcm,iproc-rng200";
 			reg = <0xb80 0x28>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		leds: led-controller@800 {

-- 
2.49.0


