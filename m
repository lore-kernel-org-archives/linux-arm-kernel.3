Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D0ED637A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 18:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRSsyiVRXVuj9Plcgs97NkJBdvJMyvNwRVL0mSw0o3s=; b=SAeaZjXrEoET8k
	aQ9eaWaNeWodbIJY4EYJ+SX9nKuJqcsSoEl/jYAts3FlEiFsf+ryi5/69dn1pzqbeoS6KmH22wosu
	rdtvLXFAoc4RzSnNbHvmbsDXOrihWtVLrRjlwOYlJjjIpBjnwhW5Rjr9Ak0ERbt1WIujtzPgA/NPK
	wGkiDEpAPkR7jGrzmtMCDuLfUbS0Bq+HNGN5CDBnLoJk93ZRPw6fWSzlckm5UsdQsP/Rop0e2JySy
	xCSriEoViwhc8JwwfwbtF1l/Sy3OB2jx86gL3PywhoLPBFdEiYdtgICM3AH2zzBOjPt8hxI1jpYoJ
	NNi6QVNB3PLaYV6omaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBI2i-00000007hMN-2fLT;
	Wed, 13 Nov 2024 18:24:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHz5-00000007gsW-2cnx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 18:20:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d4fd00574so731124f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 10:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731522054; x=1732126854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRSsyiVRXVuj9Plcgs97NkJBdvJMyvNwRVL0mSw0o3s=;
        b=pZVAtWr2m/07pZSojlWQkyJI7F7Chd0F+xWwdRsmFG5AZCXp3hmhR7Ogoew2/Jol0p
         hfbKAAk5nhbLybuYqD/O0U2N2KGJGCa5tROK/oCJe6R8tNfLLp8IllpDMO9OguG0+22i
         If6VJIbd8gqXMcdXkxX4tXA8eTH3Q0gYx77kZDVpV5JJTvIP2Ukq7UCLlAPfYD2hWSPT
         fM6DtBT1VT3rDnB7tsOCPb/ZT4FMSZ/242UMnOlXHaFVo51eGQPq/2bDv99zNafCDvvp
         QOhm43Gk6fjN/7KeEajubsC0r7HF2r30/TfvJXhi1EzNHpc9WjuEnt3+ptvaGRbASafp
         FTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731522054; x=1732126854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRSsyiVRXVuj9Plcgs97NkJBdvJMyvNwRVL0mSw0o3s=;
        b=Tc3FRbcK/nj4rjiXoEwIW2IzFzfy0m8rwBc5PUF5x9bK3ERDqC/f7S4CRLRvw0zArJ
         tmmOW+/ek8VrOm+cw4Q0cAy4WvX1RHQfV3moJ2hmu+YUPtpA+BkY6QWaQYD9mhbSFrWJ
         5GPcccsLYJFVJwEH6X2dUIfePehdBg5zNYLanPl2FhWeWBdf1t1L2pDesJGNpCfyht/B
         iDuD85HFzeLs8GTgDQN3Li1Df/hs9qZQDa0p4yM6o2w7qjT0oye5rwZ7vT6gz9iv5cVP
         3dM82/CAxfZByFcHG0nUmocUo1JcQrLo2jRQt9gakjy7jl8U45S72hEBMPSk/EAfgf2l
         j26A==
X-Forwarded-Encrypted: i=1; AJvYcCVG4Pn5vPd4jPjhMZlb3yLC9XkuALlPufMc1MJxGAyimUKOoVa+HEAjBNKRM3e6jHt9wo0G+YTc6V5nSDMr3L4T@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsd6Fz3N0r7JEU9c+HSDFswMKFKCG8sZF1OgK9xWHetH3g3/ln
	O6VHdx22PU9qAZ8g5yYVaAhwUegCLMkuntYrTjQWz6fxOGYGO/M2vst4/GiffFg=
X-Google-Smtp-Source: AGHT+IGs42OiyjmTYqrzp5AjQ4xqYDDNdjCkuNv3dM1AQd51DZTiBOSiBwMp2YgjVpVfGFa/6J9trg==
X-Received: by 2002:a5d:598c:0:b0:371:8685:84c with SMTP id ffacd0b85a97d-382140394cdmr310076f8f.15.1731522054097;
        Wed, 13 Nov 2024 10:20:54 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9978c6sm19009502f8f.50.2024.11.13.10.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 10:20:53 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Subject: [RESEND GIT PULL v2] Microchip AT91 DT updates for v6.13
Date: Wed, 13 Nov 2024 20:20:49 +0200
Message-Id: <20241113182050.2176500-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
References: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_102055_690281_B6CB0036 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.13

for you to fetch changes up to 371a47c9a58a13e339fce2a3118c9ee6a8422258:

  ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board (2024-11-05 13:51:12 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.13

It contains:
- device tree support for the Microchip SAM9X7 SoC and the Microchip
  SAM9X75 Curiosity board
- enable power monitor support for SAM9X60-EK, SAMA5D2-ICP,
  SAMA7G45 Curiosity, SAMA7G5-EK boards
- updates the uart nodes with missing properties
- device tree cleanups

Changes in v2:
- added SAM9X7 support

----------------------------------------------------------------
Alexander Dahl (2):
      ARM: dts: microchip: Add trng labels for all at91 SoCs
      ARM: dts: microchip: Unify rng node names

Andrei Simion (4):
      ARM: dts: microchip: sam9x60: Add missing property atmel,usart-mode
      ARM: dts: microchip: Rename the eeprom nodename
      ARM: dts: microchip: Rename the pmic node
      ARM: dts: microchip: Rename LED sub nodes name

Mihai Sain (4):
      ARM: dts: microchip: sam9x60ek: Add power monitor support
      ARM: dts: microchip: sama5d2_icp: Add power monitor support
      ARM: dts: microchip: sama7g54_curiosity: Add power monitor support
      ARM: dts: microchip: sama7g5ek: Add power monitor support

Varshini Rajendran (3):
      ARM: dts: at91: sam9x7: add device tree for SoC
      dt-bindings: arm: add sam9x75 curiosity board
      ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board

 .../devicetree/bindings/arm/atmel-at91.yaml        |    6 +
 arch/arm/boot/dts/microchip/Makefile               |    3 +
 arch/arm/boot/dts/microchip/aks-cdu.dts            |   12 +-
 arch/arm/boot/dts/microchip/animeo_ip.dts          |    8 +-
 .../boot/dts/microchip/at91-kizbox2-common.dtsi    |    2 +-
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts     |   37 +-
 .../boot/dts/microchip/at91-sam9x75_curiosity.dts  |  324 ++++++
 .../arm/boot/dts/microchip/at91-sama5d27_som1.dtsi |    2 +-
 .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi   |    2 +-
 .../boot/dts/microchip/at91-sama5d29_curiosity.dts |    2 +-
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts   |   33 +-
 .../arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts |    2 +-
 .../boot/dts/microchip/at91-sama5d2_xplained.dts   |    2 +-
 .../boot/dts/microchip/at91-sama5d3_xplained.dts   |    2 +-
 .../boot/dts/microchip/at91-sama7g54_curiosity.dts |   31 +
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts     |   33 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts       |    6 +-
 arch/arm/boot/dts/microchip/at91sam9260ek.dts      |    6 +-
 arch/arm/boot/dts/microchip/at91sam9261ek.dts      |    6 +-
 arch/arm/boot/dts/microchip/at91sam9263ek.dts      |    6 +-
 arch/arm/boot/dts/microchip/at91sam9g20ek.dts      |    4 +-
 .../boot/dts/microchip/at91sam9g20ek_common.dtsi   |    2 +-
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi       |    2 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   14 +-
 arch/arm/boot/dts/microchip/sam9x7.dtsi            | 1220 ++++++++++++++++++++
 arch/arm/boot/dts/microchip/sama5d2.dtsi           |    2 +-
 arch/arm/boot/dts/microchip/sama5d3.dtsi           |    2 +-
 arch/arm/boot/dts/microchip/sama5d34ek.dts         |    2 +-
 arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi    |    2 +-
 arch/arm/boot/dts/microchip/sama5d4.dtsi           |    2 +-
 30 files changed, 1735 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
 create mode 100644 arch/arm/boot/dts/microchip/sam9x7.dtsi

