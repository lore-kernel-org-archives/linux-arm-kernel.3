Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8500EC83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvUZO7FvlWPW+SQ9YyArMTwQthW4Z2c8jZOVUNIjFN4=; b=Z1r1749Bx2AbicBzmhhpZb+RGH
	9tlw89DQXGz6+ZaSs2M2w2pGG0zPp1HmUPTxw4/ljUa6KX80TcqIQHOeg1fE2Muqn0YrWrBsB2skO
	lgFUynmZFtK1gZesl3uwIVbM3AsfQ8wwJIEAOkXNYUfeuPiCFKKdYfdJ5xZu7HITrP4FMQnbiqSKL
	sYysEmIAP24aaJk6rOGwSGaNik2Qv90W41Dby+Z8EIQrqIaWchJI8WwKRS2EhSybBhAIudwaT8hwC
	asBzetDcfiQh8WfMI/FOtnhe7xaMAK1lenqVkifq0k1+pII6WdvV8sgyY+eWO6ODhGgdbH9DOnviz
	NK/vdpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Xp-00000009K5C-0Wey;
	Wed, 02 Jul 2025 18:50:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Mn-00000009IIx-2A7b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:39:34 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23c703c471dso2292325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481573; x=1752086373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvUZO7FvlWPW+SQ9YyArMTwQthW4Z2c8jZOVUNIjFN4=;
        b=i1DI7TOcCglt6O4CXuO+naU6Khi0KNASsWc/w9VGN4kT05+S6oAo5VFgLjxu1Cbv5w
         2ClN+QLyVBPbCHl2vpLk5Zl9Gjz8E6v673ZyoJBNpArOO/sLTX8RGMYLZLAuSGdzCYGE
         C3OGfmHxXBDB17z3brJcKH7+UXDyaNYaiYSTg6QzvEGVYw2LFqVpvRKmnxBuK9+D1h2e
         d1y4DwFYMsDuUW2oGFzwKw/b9hzmJIEucVnqewjMcdHYgbb4BzRa6oHwpL4cWawiugoG
         d7xfL3th/w0V7FUvlLKwx0hKAPMBLzqAqIb5HGpM6pfa0MKjFtB/dwd2k7MclityM3kX
         xZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481573; x=1752086373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvUZO7FvlWPW+SQ9YyArMTwQthW4Z2c8jZOVUNIjFN4=;
        b=T/hlB9q7Xl8sGNiHfXIHG+i3JGxDQwXmQ7dcKVbEvxfA1i3sPCOqhMK63KXItohGsN
         xFxYvV52Z2FxDLzPdTrQtMy21dYACK8tp745zmBpF2ikrhjc5lMHEF6fHwr/Xe3vyBNg
         //PnoawOohu3rqKP6TVfG7VKDACan3YB8WsyHU491zv1SoCQPTnTqZk0AHBdqnpjkvim
         3L5+2h0a8yx2m2hBd8zBrA3AtmCmDkD3rT1+UCXVgo9Jsmbhkz8/s8uKGwoaXUvpVZQv
         +IilJNkAfyM3IY2ZPz8XewvECtIJCzXDb8+XUkCAMFK8nkirHVfo0gAj8Cdfql8+mm2H
         +e/w==
X-Forwarded-Encrypted: i=1; AJvYcCVdRurb2589I3xLAmVu3cb5LTtc9pmGARSKcX6jl1mR60pM6zW0Zf8lgsIf/WbdckTsLaoGMkWb7ADY721MFWsj@lists.infradead.org
X-Gm-Message-State: AOJu0YzzkBiMBVJ4VYAuUs2hPLGkVz1t2yndFnOFSICEp4yHU53jb79J
	zeEdXbs75aQt/qQZ6hT+yqJg9xxUCDFPSXy8UFKX22RLjJrDj48lq3mLNNc1n4fJR9o=
X-Gm-Gg: ASbGncutZmNsWKVTMmpS3KxempUR+hZvPzplT31Dn/6Js0eMu6N8Q+GBWZ8RkG2nCWg
	IBC1afzxbtHLMQdTVebtnNKPKvoXhaCPFRirIaO//9VkqSrww8KzJKGlYpErkxV6u0ySJoWPR59
	2F/ERemgyNxVwcxG65RckDs4YkY4d1o3FWdd68UhnfxItCxHhmVbaClS92UWoeUnFPdYsK6Capc
	Zouxb2eifYwDqarISFxh0N40aN3jzl6d4xH//Sil//XNIcG8xkgzj5lvMnUkfT9QGlpSy3R1V6J
	K2wtGP67eNy1SIWmIwgPMAEdZ6JVYxoKS+iCM5i5G4FSC45/02N9C+JWHVd0OsEl2erEC5yfKE4
	ggA8dmxDlmsaxcc6T0Ur+aME=
X-Google-Smtp-Source: AGHT+IHgAEOa6mf+31gGe4dh9PyI8zLR+UZCgE3uY8g7x79OUwcJ315/76XmuML+S/JTyWRQqdR46Q==
X-Received: by 2002:a17:902:f68b:b0:234:adce:3eb8 with SMTP id d9443c01a7336-23c793c0f84mr9871445ad.12.1751481572766;
        Wed, 02 Jul 2025 11:39:32 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:32 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 03/10] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed,  2 Jul 2025 20:36:01 +0200
Message-ID: <20250702183856.1727275-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113933_565668_D1AB04B6 
X-CRM114-Status: UNSURE (   9.82  )
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

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Place LAN969x under ARCH_MICROCHIP as suggested by Arnd and drop review
tags due to this

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index f2d5d7af89bf..083e9815259c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -165,6 +165,20 @@ menuconfig ARCH_MICROCHIP
 
 if ARCH_MICROCHIP
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_SPARX5
 	bool "Microchip Sparx5 SoC family"
 	select PINCTRL
-- 
2.50.0


