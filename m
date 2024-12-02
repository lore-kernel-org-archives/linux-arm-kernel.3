Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F37D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SWv286JLLtaOue4mQfrx4lljgfdeCl/Poe2xcsSj1A=; b=EQFYXfyLqAHRYM12qIqxbQOcIc
	KAUn741coelIFf7K2VBLZc6Uqzeok8040JvcO4E+2mXgaF9kCtv/tbLWZgXy5YSAK3dOXELpBQh3U
	EwOnOnkHqtfz3SmWHBL0Y1fP2WcNa9u9cxi9PN3AWl14EVz8LJfpBLqebgsY6kJi7RXpkCckD1hF0
	PZhUjgjzx4nc17J2Uf9DYqKwl3+zBFFZrzVEbvTUV8hwJJPpnggTwpx70cgrLPqnSP9zFA/iHiowa
	ika9LAYU5b+uO4IMy+BF3nlCeCCjF1YSGEg96Ef++wzlArPrUFjcrGxw0U0hrv8lWOwjH1P8+hnkC
	jcV5BcLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7XG-00000006TRB-3ZJq;
	Mon, 02 Dec 2024 14:36:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TK-00000006Rom-1Cte
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:32:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434aafd68e9so36739205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733149940; x=1733754740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SWv286JLLtaOue4mQfrx4lljgfdeCl/Poe2xcsSj1A=;
        b=AL/CrUQGCZMTJZoOoMAb3RZPb9Oz0/8WRa8uru59FKD0vjLwkdru2DDMMF4GzupGJO
         oIIfvhpF4nSNZTYWTyeH12Za5LbmuPGpL8wFAecOIMbtdZoBq6VXDwjxWi8W7ZqaSH1e
         MxQ2Hg3wQQrOdro0iJk79JTCa6NUTMYzZ93MF5YHV19fnjfiRiEJ3uGlX4r4k4xU6mxB
         tc2pLA0W4NngdmX7mRiTrtwIm6Ygg/8+61CIruO5W0ZZyVL1ydZopLUAYcs4EklME8qV
         5E7rtLoChcSmyzsozJW6Ts35BggXRAMPZYhmghvBHWZa9yd2pP22ArANfCrCDa1HGx61
         bTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149940; x=1733754740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SWv286JLLtaOue4mQfrx4lljgfdeCl/Poe2xcsSj1A=;
        b=XAxRrrvXaJUgqYry4RJ4e383iqNX4EEnx9jtt2XvIh26XQMq3D4aMLp0hmXdoD3Sx3
         9KrS7MngsR0K+oqtUOcVJIxyIsrzGCIOpGzku3wNO59i4kLfgQ44GH3K05XW/sVHhQQD
         Zut3UPOQJXUW/n5herOmllXiDCXG96ePHNAzNC38KOwo9P+vfit0bnU4Fj9IBc40wYAH
         p6ojWhvELUWKxmGF3nwxvfzSz0RvJu0NajJ/kfprlej+iUqfl/mSaXJkQla4hQTfoDoL
         YUPCa6OIi7sMVA7g5MSx+IflI841sC7/EaEPNbOGqjYmIYoIJ51Sld+i1Ms/kjiA4S+/
         Rp7A==
X-Forwarded-Encrypted: i=1; AJvYcCUben7DmYe85/H0mVPM9ylOVww/WtOCADENHAJjFU2kcj1ecXqYNzYfLm1N9EcDV0qDLspNfUUUh9eUvus3GpcD@lists.infradead.org
X-Gm-Message-State: AOJu0YzCTI0z6c5+ArYNcBm4IIXQSvWgLCXDKUl9mylSX8qlSmff/zOL
	xotiuNXSDXdijC8YXQd8jztSmtY3pMBPJIvsK9oBWoPvRhXnIC6X2Ix3qTIx6P4=
X-Gm-Gg: ASbGnctjWKV6trVWhzS3b94BuVSWH+3gxkUjVKQU8H1qH5lyEXIXtYjx72XhWboO2MR
	esDEAtunFQex0PHhjfxrrfpqJhJJBWa6+c/z0CDZPnWMd5W0K5k0gONCibonNblAtCHlje/xX3P
	Vy3LCWXKR+ixV781fYu96a1YsW4FcKLjz2TsoK1PGqb+KYSltZtnNCmDev2O2MdJpPmb6kZBMY1
	0MbjW4ArgD1aZHdBR53FSSmu6VhJXVVx4gza+xR0Q==
X-Google-Smtp-Source: AGHT+IGdEnNzVlMLwDBvV0S4CV4yuBsyp8Dkp7xJueCrLVsr6eLGBmMPHRLxa0QvyyA/TmmOBjlOGA==
X-Received: by 2002:a05:600c:45c9:b0:434:a196:6377 with SMTP id 5b1f17b1804b1-434a9dbed9bmr221354295e9.14.1733149940210;
        Mon, 02 Dec 2024 06:32:20 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:32:19 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:58 +0000
Subject: [PATCH 5/7] arm64: dts: broadcom: Add interrupt-controller flag
 for intc on BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-5-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_063222_357366_4AFFCD5A 
X-CRM114-Status: GOOD (  11.35  )
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

BCM2712 DT was producing dtbinding validation errors of

interrupt-controller@7cd00000: 'interrupt-controller' is a required
property
interrupt-controller@7cd00000: '#interrupt-cells' is a required property

Fix them by adding the required flags.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index f42fad2d8b37..0ba076ab9caf 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -224,6 +224,8 @@ mailbox: mailbox@7c013880 {
 		local_intc: interrupt-controller@7cd00000 {
 			compatible = "brcm,bcm2836-l1-intc";
 			reg = <0x7cd00000 0x100>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		uart10: serial@7d001000 {

-- 
2.34.1


