Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0267C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcFckvzN7xNx2cFpkfKVkI9GXO+rMAPN2eeDe+pzM/0=; b=pet3alI9nYg1D94LjuvjhirFFf
	bgGQJfJR86uYPImzUEoEOusc80A0K2QT3+3fBUGLNXeFDhW6PUetS76J4plfUzwuYv81yVLfoS8uL
	07MQjmQQQ09pXDWm++ydfUaYT+46nhu7WyuRMpl8bcI0qcWJsLu3k5vTSSE8ub6s6YJX26ZaHh8D2
	+UjKg/Nv2sF7R9xkMLJtQ74YIl2ISM/YsFrC5oXtpb2ztXx+gNIHMTo5x7LCVPR/mwYaZCYcQSp7s
	6a/IWgYoQSMQxyBacDVoW/s4Ij+8KJws1Y0Ddvo0NGKMHRdl4bzzbSPVv9hZyWS5cwn60doMjHs1d
	0M/P+3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udp1g-0000000HBdB-16l7;
	Mon, 21 Jul 2025 11:49:48 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnSG-0000000Gv1N-2mv8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:09:10 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so6452065a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1753092547; x=1753697347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcFckvzN7xNx2cFpkfKVkI9GXO+rMAPN2eeDe+pzM/0=;
        b=lx/Y7w2yhoiVwwsmru7xQTZnOmHeLaFuyoL2kCM08ZgCcQIkLO3dlbmuvZDjOQMkyt
         GilMXhQgLvPVseUMFBAaef1s9cxkuRq5415vho91Wtbs1KGYqSlPrLyGVMtsqp22A2sj
         VhDnqshRSf1ib9Q3P/FXKiPHbXQS3NFc6u1YSPQCyuOlINTUXTKR0rlt4VFxJE+cd3/B
         S22fHEAXdb7+3vw9b88m0XUkeIZs7n0JqVAoYsrYnmQSNNe6ISPOpng93nEz4bqvue+B
         /p5t+Cg/N28wl1XzSbwUr5JC/i/X4Ypmm9sMOjTTCB6KkzGfKr6PL5CW4xp0RYik2+aP
         jiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753092547; x=1753697347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcFckvzN7xNx2cFpkfKVkI9GXO+rMAPN2eeDe+pzM/0=;
        b=vZ+TdViUxDDQv0NgLaP3RtyBzctlpRYH56OB+GW4BRRM1So0ULSdjfo8I0e/9SXSG9
         cuPA44u3dNnJKajJ/pfmvqAUOqCZXXXxkcvu5i0t+24Pcir6aQDn0z6pK9tp7HwXpMZk
         igviJ/nzJZ+tzOPaiZYj8M9Rh5uI3LemuFBnoN0SwWOp08a4w/mnRBoI1NzWDan/zknd
         KQdyFAYLusn4uyJrptzUIGqUZHT8hpyrrVEus7fP1EXCbDMn3dmvFlkk9gQJ6CPsK3r3
         /NmtFti7FlJXuQKdie9qmHv2VlCXAD3qDHs0opo6WW5L5SxhS2KyhkvHvjTKArECSAtq
         Ki2A==
X-Gm-Message-State: AOJu0Yw823IZE0KrWbagyJcTlNMEfAZk8OBWI2SNht9u98eYLvVlSrnY
	+PmdSrT6vMslJqwoNBms6cctz7niQ1DSMHE3nuT0ddXCncZMOxjpNE1SWXf+80QguKI=
X-Gm-Gg: ASbGncu2PQ4U8KeGk8rOWfSztGZ9nA6rRJ+CRW/HBwHQ7hyY1CQ5+R5BH5XYcJKqRsP
	8YBZTZNJG6grRW3zmBTp9+z/tlw6Wtm3/qImVvVUsNvXKcATx69ycSo/iStWsir6D1PPJBs5OTd
	akFI7f3UZ9O/8bceZW1VgKODnuxUJkpWaMimguqu2LIidnG6qoISLHzBIuLpHLi/5Pu+GQMen6e
	os+GfiqbB9fwHIx4ldkwhzcfOoHBxLnTfxnJuC2X7Y4y8oQYI97jp5wzfCGj3vPNJZDPj5tIlVU
	aN4hJh7vfK7785faYHM3GVvpr7bI4b8xUagAp0p/+jAvu1px/LGOoUSGkLy6UoJTYhYeKBhncQk
	tlsnkuxSabtQjgPL07pAdVLm8rqkhcq1RzoDCFZuC
X-Google-Smtp-Source: AGHT+IED4lOeP8lkzQuySSoVCpa3i6O3/wuUDVMHTM4Hv/8XoOUOgJ3qHR/ltSfjecD9vA8E53VDcg==
X-Received: by 2002:a17:907:1c1e:b0:ae2:60ba:da91 with SMTP id a640c23a62f3a-ae9c99872f5mr2078243266b.15.1753092547094;
        Mon, 21 Jul 2025 03:09:07 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d68a1sm647649766b.46.2025.07.21.03.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:09:06 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 DT updates for v6.17
Date: Mon, 21 Jul 2025 13:09:04 +0300
Message-ID: <20250721100904.568575-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721100904.568575-1-claudiu.beznea@tuxon.dev>
References: <20250721100904.568575-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030908_703978_156D833E 
X-CRM114-Status: GOOD (  10.22  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.17

for you to fetch changes up to 314862edb13d52c481ecc330c9d3fec0507cd9bb:

  ARM: dts: microchip: sama7g5: Add cache configuration for cpu node (2025-07-05 10:43:31 +0300)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.17

This update includes:
- controllers enabled for SAMA7D65 SoC (crypto controllers, PWM, CAN)
- controllers enabled for SAM9X7 SoC (LCD, LVDS)
- cache configuration updates for SAMA5D2, SAMA5D3, SAMA5D4, SAMA7G5,
  SAMA7D65
- cleanups

----------------------------------------------------------------
Dharma Balasubiramani (2):
      ARM: dts: microchip: sam9x7: Add HLCD controller
      ARM: dts: microchip: sam9x7: Add LVDS controller

Ezra Buehler (1):
      ARM: dts: microchip: gardena-smart-gateway: Fix power LED

Fabio Estevam (1):
      ARM: dts: at91-sama5d27_wlsom1: Improve the Wifi compatible

Manikandan Muralidharan (4):
      ARM: dts: microchip: sam9x60ek: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
      ARM: dts: microchip: sama5d27_som1: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
      ARM: dts: microchip: sama5d27_wlsom1: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns
      ARM: dts: microchip: sama5d2_icp: rename spi-cs-setup-ns property to spi-cs-setup-delay-ns

Mihai Sain (5):
      ARM: dts: microchip: sama5d2: Update the cache configuration for CPU
      ARM: dts: microchip: sama5d3: Update the cache configuration for CPU
      ARM: dts: microchip: sama5d4: Update the cache configuration for CPU
      ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
      ARM: dts: microchip: sama7g5: Add cache configuration for cpu node

Ryan Wanner (8):
      ARM: dts: microchip: sama7d65: Add crypto support
      ARM: dts: microchip: sama7d65: Add PWM support
      ARM: dts: microchip: sama7d65: Add CAN bus support
      ARM: dts: microchip: sama7d65: Clean up extra space
      ARM: dts: microchip: sama7d65: Enable CAN bus
      ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
      ARM: dts: microchip: sama7d65: Add clock name property
      ARM: dts: microchip: sam9x7: Add clock name property

Wolfram Sang (1):
      ARM: dts: microchip: use recent scl/sda gpio bindings

 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts     |   2 +-
 .../arm/boot/dts/microchip/at91-sama5d27_som1.dtsi |   2 +-
 .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi   |   4 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   |   2 +-
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts |  35 ++++++
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts     |  18 ++-
 arch/arm/boot/dts/microchip/at91rm9200.dtsi        |   5 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi       |   5 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi       |   4 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi       |   5 +-
 .../at91sam9g25-gardena-smart-gateway.dts          |   2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |   5 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi       |   5 +-
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi        |   8 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi        |  15 +--
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |  37 ++++++
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |   3 +
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |   2 +
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |   3 +
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 140 +++++++++++++++++++++
 arch/arm/boot/dts/microchip/sama7g5.dtsi           |  19 ++-
 21 files changed, 272 insertions(+), 49 deletions(-)

