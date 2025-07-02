Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629E9C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H0vokW/WVWIh/diYEqZYuuuvilgnskYyUw0dTfGNSpI=; b=ehyV2+XmKg+YMS5mStGbDeMQUV
	x3ZkiuxKwVHH3NHlJ5pcT/zuuhR8T4K8A5TXAEQGOHSCIwA8ichUkGFLdgDHVyob+NYebQE+xMJ+Q
	GHu3oD07bVHRvUCbf+E7JZr2xAF1bw4W94NxLiUjHOKxHL65FfG/FQGh5wdNlqgH3Qc7pQU+mMVSW
	jgK0oJLA2TvyePUZ7nEZCR3f64oWchijqEhfFGMXRA4z6oCc5Bvf8a5u5FsY9QfWhSyrMig1cDcSs
	Y72twYkCQNAtdRYYwAGDRDXrI2xe1X23+6+T+I/Jn59TxB4saT+IKnE5qcBe3iuag+ZgW0T2vfXaE
	n0sMi8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Qq-00000009JII-2AMh;
	Wed, 02 Jul 2025 18:43:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2MT-00000009IDZ-0jLs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:39:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2350fc2591dso1776375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481552; x=1752086352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0vokW/WVWIh/diYEqZYuuuvilgnskYyUw0dTfGNSpI=;
        b=UueRx6HWEwDylkoW/2QFG+RTowPiQwdgK+wGhsJmD/6UbcfVDDBfoR6RrOPOVCjuUm
         cRsjcT5EAccJY2QB70y54JBF/vvwDswVujIn0YKe5dgeByWkJl7q31Agt9SjAMSYgAel
         1RzWVuCiPAVLWeoFFXwWYS8+rkNjK+40wuO4OJTVSZ8HpnK1zxNG/oOcFrce4FF2V9C9
         9pIdw2Uw0mnBaSVh4ESMN+jBNCSEMc0K0FqaX3loMIcuqw0GZ1IFxW6ZLjHk3xWifaXb
         oNEQAY3IXVXoQl3v8vHf9ELHggPLGOhfV6HYmlErB3Lr7+uQwkRfXJIIkh4Lyfc8AcET
         QREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481552; x=1752086352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0vokW/WVWIh/diYEqZYuuuvilgnskYyUw0dTfGNSpI=;
        b=QhQSZar8gnQdU0jlLbmrSo+eFXYlyJVXKuzfNYtrN7ibiXXiReXdc+x221YbHiHwlN
         NTEVrQ8l+EcdcuqPNu2ORSlccHZXhj85baskTLpMdsR5aphlZigjGP8V/DxXF7nRjkT+
         EIjjKvxND6qdZTCKScnOUcRixRgLwpWN0wwnJoS4YrSuHwjvcvi3yBOGUeDQ0ZQUurhw
         n+sT2ixrDZNbP51q0H7QXx+/eH4nki7aOWob8YabjmA3kF9V4vR6JvJ2MBvB7BrXxCvf
         kXVSkKi8ivw/njnxXEYz4fzpWHsOnCIxKgAafP8AIfLYdvstof4G1669UNq/0okqZf/8
         mMqw==
X-Forwarded-Encrypted: i=1; AJvYcCXRe49xOO1vizRFRDR5J8hw7GnBogF/wmrnA7uXdy/e3XpyrzYfrH3umQaXcUfqScI3z/FMIyO+IGa3/xvv2gpp@lists.infradead.org
X-Gm-Message-State: AOJu0YwntTJqyZETZBrzEAgyXlx7LUt0lSNroavmS09gYppqxSkD1obg
	7muBPwazR2UHm59hswoNGyIeJ76EcP0YDx/NAAGm1EW7YU4qeDvoHY8I4xtBesInFC0=
X-Gm-Gg: ASbGncvnZ0kYyjVxe5ky3xr/bNbdFnp/PegbeUjJ5U3igezoTrMJPxV3bX1vaQ8F6on
	6uQlmGY6zUKYiyZ0x3yQQu7qRwP6GX2kOz0dKNEVJGfTJJN4pYJQEB825lyGDvfu7m8Pe4IsZuL
	dm0UO1btYJ5weF3J5OcHhCuqRDykvxB79kqBzA6/426du/GbtSbFYxDGqHwoO7N0Mcwy1Wxn2OY
	ryLjj4rEm8W50PrpuQDX5UL3+7hLfnnJl0lGN4mCDPLG7/F6beTWT83DP2UV1elScmUD9W36EH2
	DpTluqDOqqKfCnJtdWgOvWFsXKoi+S8+GALOIyLkmN0ZzdRGSwwePifkbK4H87nbW+4aqzlORee
	pNd18ehfv+OaR/X4bNO2MuvM=
X-Google-Smtp-Source: AGHT+IGquOgZW20g+Jug5sdpx4963ZXWIcFE/S5pAht3IG0Kq6KeWcjOPzHMuBzGwiWByDwygshOwQ==
X-Received: by 2002:a17:903:1105:b0:235:f059:17de with SMTP id d9443c01a7336-23c793f0bc4mr7420165ad.15.1751481552430;
        Wed, 02 Jul 2025 11:39:12 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:11 -0700 (PDT)
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
Subject: [PATCH v8 00/10] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed,  2 Jul 2025 20:35:58 +0200
Message-ID: <20250702183856.1727275-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113913_228952_F9AB3CFA 
X-CRM114-Status: GOOD (  11.51  )
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

This patch series adds basic support for Microchip LAN969x SoC.

It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
which allows to avoid the need to change dependencies of the drivers that
are shared for Microchip SoC-s in the future.

DTS and further driver will be added in follow-up series.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Move to using ARCH_MICROCHIP as suggested by Arnd
* Dropped any review tags due to changes

Robert Marko (10):
  arm64: Add config for Microchip SoC platforms
  ARM: at91: select ARCH_MICROCHIP
  arm64: lan969x: Add support for Microchip LAN969x SoC
  mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
  tty: serial: atmel: make it selectable for ARCH_MICROCHIP
  spi: atmel: make it selectable for ARCH_MICROCHIP
  i2c: at91: make it selectable for ARCH_MICROCHIP
  dma: xdmac: make it selectable for ARCH_MICROCHIP
  char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
  crypto: atmel-aes: make it selectable for ARCH_MICROCHIP

 arch/arm/mach-at91/Kconfig     |  4 +++
 arch/arm64/Kconfig.platforms   | 49 ++++++++++++++++++++++++----------
 drivers/char/hw_random/Kconfig |  2 +-
 drivers/crypto/Kconfig         |  2 +-
 drivers/dma/Kconfig            |  2 +-
 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/mfd/Kconfig            |  2 +-
 drivers/spi/Kconfig            |  2 +-
 drivers/tty/serial/Kconfig     |  2 +-
 9 files changed, 46 insertions(+), 21 deletions(-)

-- 
2.50.0


