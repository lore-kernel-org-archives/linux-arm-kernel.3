Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2077C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZo/Vf2nfNDcmG+nIAIhHl9y6tDEIrgynlevHozqoJM=; b=psnpFhlqCB3bPTRDoW9tjBwScb
	bcfZnL14iQiQs1EFeYGgzdFc607+8RCOpjQoUgHkKtTfTJd4CviZe08COqi9ETlPyZhTP8Ie5cmgq
	JZe2aRPFFnXDulKAYNtjjFIYZNcA/+9HzmcHbw9qZt71Z872oMt8/k0RFR0ytOiNDCrV57d5j9tUu
	rieRZ5S32fWOl3OHyhT26WgWYVx4+FbG/TjqVYwkzBk0+32+P9HsWryR5DN0VkHrp/j29RPS6nBZZ
	Ns6u3ndeuOcJW3ejViCj0BLi0Dq8zp+Nt26Og3ZNSa/9XoC0RqRrmjvYmstp5sOXdq4q1HPPd7ojm
	1KLUdRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQ3T-000000099rw-3tNd;
	Wed, 12 Mar 2025 17:39:43 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQ1o-000000099kj-0sji
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 17:38:01 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so24954a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741801078; x=1742405878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZo/Vf2nfNDcmG+nIAIhHl9y6tDEIrgynlevHozqoJM=;
        b=VQ85iKRK4/jPbUZd7GIxUs9c2usZe4IMGhoklZzFHSbiMvmTT+dFYTXSNzRxCUnPyh
         VYmcw+4WSGu3BDSWSxR+PlSX0GdNZcJK3vTAE9TLIrrObXKIlnngyrLDe8WHNU61tzDh
         viXWGY+UESO7KMMY0qYmDIfB/ZUGAVDANl2/vUy8PVdHhmBM39ezYYBxdFRBt0ELfgnI
         0NtBL+cbNK94oP4g4owSqcIuju0htky8hfV6OLpNVKW98PaY+EzuGTLTVmQ90XVzMPoh
         E0USvXfbUXQaIzCdV+62D6VL7wr++X3UJ1WwS6WKEPWe5foo4B5D5D951ZLNHDsg3o0c
         YAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801078; x=1742405878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZo/Vf2nfNDcmG+nIAIhHl9y6tDEIrgynlevHozqoJM=;
        b=NLm4Byq9flpHWgAgFdX2ngcrB/jljM662fdBISLfQNXFUJloGNu/q5t2bY53D0nPwi
         LyXMdjUCTbTnKmY8PyrvpLO+1ja68cCLKoORwyCht0EXnAbspTJiGjgivXyFXmje+eS+
         wEYTn3VqkqHZYinX7bGh6IDvyf5CwrhbN2pq1YC5bi4MN75SqOalR7XucVmQIekRMA5u
         yGBUmKyBzFyZ+3kb199lBQ8YmaGh7mLOULtMZk9hA1gOevzFZVlyRM8+WtthK52xsJGu
         13OaMdGRQVRK7p5zQLQe+1yheTPmFbfvuXWZ0L83Fmt9T+eSjprpJZxAledUgFuxIaXL
         iBUg==
X-Gm-Message-State: AOJu0YxjUmPebMpLEcoGciQpT3ex4ohjHTOAB8hHGYS35g33UeG18hav
	f26GIT7NB1UehDsEbvMlCfJV8tIzbxX8QC+4GWOFuatCfiJhD8Ynry36SZlQphw=
X-Gm-Gg: ASbGncsyzi+CkBMiQkL/xFlu3GObTuGlUjud7d8/clh4bQvNbx5YWJiumJl8Xyftx7z
	E8hfChsbedoRzxLSc70xbEY56c7yKitec+hCNM1vsKxZZMstiwCC/EdSFUvKNKKmBEyt/97wcWB
	WLyc0Ymlsoqd6yCtz3m2m6chY8UwIL94f5xSwPeDJ7y7YtcrAN3kEJaeSu2nOdW0uKkZOuFDbw7
	mZ5F2LGSEDtxUpWtQ/s+40LjZVxJiC/oFBTWb7YYy8e6OZrTsSFrM4zj99dAmEGB+2E7gIzAYWj
	hI0t5EGy27Yka5XJmB2VVopTCp3VhWOhB9lVEJ7N+b3VuW4XpF2OcNkewNPOIK0e
X-Google-Smtp-Source: AGHT+IGHW6rlhJd7UC+xU0sUPHcpDtU+1R/5lMJkXMDs9qwKf5djMrhnun5gLlA5mSNp9l8ykGaf0g==
X-Received: by 2002:a17:906:dac2:b0:ac2:c26:5608 with SMTP id a640c23a62f3a-ac252747d18mr2588907966b.8.1741801077846;
        Wed, 12 Mar 2025 10:37:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2ede516d6sm92760866b.49.2025.03.12.10.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:37:57 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 DT updates for v6.15
Date: Wed, 12 Mar 2025 19:37:54 +0200
Message-ID: <20250312173755.975074-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_103800_360169_D90855CA 
X-CRM114-Status: UNSURE (   9.78  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.15

for you to fetch changes up to 6aafec3d215f59e8c4b00d0c2a97988ed5edbb2a:

  ARM: dts: microchip: sama7g5: add ADC hw trigger edge type (2025-03-04 20:39:29 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.15

This update includes:
- more controllers enabled for SAMA7D65 SoC (DMA, reset controller,
  shutdown controller, RTC, watchdog)
- power monitor device enabled for SAMA7D65 Curiosity board
- device tree cleanups

----------------------------------------------------------------
Mihai Sain (2):
      ARM: dts: microchip: sama7d65: Add flexcom 10 node
      ARM: dts: microchip: sama7d65_curiosity: Add power monitor support

Nayab Sayed (1):
      ARM: dts: microchip: sama7g5: add ADC hw trigger edge type

Ryan Wanner (9):
      ARM: dts: microchip: sama7d65: Add chipID for sama7d65
      ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
      ARM: dts: microchip: sama7d65: Enable DMAs
      ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
      ARM: dts: microchip: sama7d65: Add Shutdown controller support
      ARM: dts: microchip: sama7d65: Add RTC support for sama7d65
      ARM: dts: microchip: sama7d65: Add SFRBU support to sama7d65
      ARM: dts: microchip: sama7d65: Enable shutdown controller
      ARM: dts: microchip: sama7d65: Add watchdog for sama7d65

Wolfram Sang (7):
      ARM: dts: at91: calao_usb: fix wrong polarity for LED
      ARM: dts: at91: calao_usb: remove heartbeat for User LEDs
      ARM: dts: at91: use correct vendor name for Calao boards
      ARM: dts: at91: calao_usb: fix button nodes
      ARM: dts: at91: usb_a9g20_lpw: use proper mmc node name
      ARM: dts: microchip: usb_a9263: fix wrong vendor
      ARM: dts: microchip: fix faulty ohci/ehci node names

 arch/arm/boot/dts/microchip/aks-cdu.dts            |  2 +-
 arch/arm/boot/dts/microchip/animeo_ip.dts          |  2 +-
 arch/arm/boot/dts/microchip/at91-foxg20.dts        |  2 +-
 arch/arm/boot/dts/microchip/at91-qil_a9260.dts     |  2 +-
 arch/arm/boot/dts/microchip/at91-sam9_l9260.dts    |  2 +-
 .../boot/dts/microchip/at91-sama5d27_som1_ek.dts   |  4 +-
 .../arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts |  4 +-
 .../boot/dts/microchip/at91-sama5d2_xplained.dts   |  4 +-
 .../boot/dts/microchip/at91-sama5d3_xplained.dts   |  4 +-
 .../boot/dts/microchip/at91-sama5d4_ma5d4evk.dts   |  4 +-
 .../boot/dts/microchip/at91-sama5d4_xplained.dts   |  4 +-
 arch/arm/boot/dts/microchip/at91-sama5d4ek.dts     |  4 +-
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts | 73 +++++++++++++++++
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts     |  1 +
 arch/arm/boot/dts/microchip/at91-vinco.dts         |  4 +-
 arch/arm/boot/dts/microchip/at91rm9200.dtsi        |  2 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9260ek.dts      |  2 +-
 arch/arm/boot/dts/microchip/at91sam9261.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9261ek.dts      |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9263ek.dts      |  2 +-
 .../boot/dts/microchip/at91sam9g20ek_common.dtsi   |  2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |  4 +-
 arch/arm/boot/dts/microchip/at91sam9m10g45ek.dts   |  4 +-
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi       |  2 +-
 arch/arm/boot/dts/microchip/at91sam9n12ek.dts      |  2 +-
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi        |  4 +-
 arch/arm/boot/dts/microchip/ethernut5.dts          |  2 +-
 arch/arm/boot/dts/microchip/evk-pro3.dts           |  2 +-
 arch/arm/boot/dts/microchip/mpa1600.dts            |  2 +-
 arch/arm/boot/dts/microchip/pm9g45.dts             |  4 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |  4 +-
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |  4 +-
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |  4 +-
 arch/arm/boot/dts/microchip/sama5d3xmb.dtsi        |  4 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |  4 +-
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 95 ++++++++++++++++++++++
 arch/arm/boot/dts/microchip/tny_a9260.dts          |  2 +-
 arch/arm/boot/dts/microchip/tny_a9260_common.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/tny_a9263.dts          |  2 +-
 arch/arm/boot/dts/microchip/tny_a9g20.dts          |  2 +-
 arch/arm/boot/dts/microchip/usb_a9260.dts          |  2 +-
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi  | 11 +--
 arch/arm/boot/dts/microchip/usb_a9263.dts          | 11 +--
 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 10 +--
 arch/arm/boot/dts/microchip/usb_a9g20.dts          |  2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi  |  2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts      |  4 +-
 50 files changed, 243 insertions(+), 82 deletions(-)

