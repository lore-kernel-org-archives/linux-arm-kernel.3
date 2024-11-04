Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ED4D1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2y3LHlBNTbsSu0Hs3sn5efdwnygjby0IGD43ArzpIfo=; b=fhntkC6elRokLN99KklDqQZmhb
	e0vMEAVSbHEfXwrlpJa6gRKo4dQymL3a5QEVZfVsaovr6dJGoSE+AO2B5SZhoiSqFhtHspnjbKX3B
	HAf36l7wUK5d3u4ljJqs1lmTZ6Bb17zJLvt00j5jwswHmaAsFjuCa9rdUw07ZENsd2hDM6aXLlLjB
	Aepcl88qY8Zz2ydNacdSgWuwMT/QHrXJB6qvxPcKCuAgFw0Lsj0aVRGcrK4p943w8NunA2mwyFuyW
	9NgYzQU6Dy9jrSXcfWNwlip7h5m+4iGtJpIYm+y/CGtxrvmJ/XKI5enByP58l7sZzp3jodI7gBbV/
	gRo4sGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82ej-0000000EsuG-40IU;
	Mon, 04 Nov 2024 19:22:30 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Sz-0000000ErYM-1QK5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:10:22 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-720e94d36c8so1533209b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 11:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730747420; x=1731352220; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2y3LHlBNTbsSu0Hs3sn5efdwnygjby0IGD43ArzpIfo=;
        b=rWPUyvyYoeGbwwZUxuVfNktSXUcTG9RViOUs3xwopaUFZmBEtMTKB4eL6b2kil2DCf
         SHgLMXm6Kb/IHM3jLBFrhA3JbXYxeFHtVdvXkHxR6+hDTC8USgJ0fYv0AJ7zRJP24djj
         bA0pTszlKNQZvOLvko6BlZnf6dI9uU3nEuWNeGN7+sJLNoJ8gcsHHwHM4e2yre5FEbtr
         xWFAWMvkohKjGjalVHzcey4je3LRklBVl7fuCPl6Manj+3FWKso1Z3tTnGkp2bWG0fu5
         amu44xdJlm+EbY23dJaDQQhULMqhvO7rgIwaPucUi9FXkY8PRuXOaAMU4kWwZnDjeXE6
         T3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730747420; x=1731352220;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2y3LHlBNTbsSu0Hs3sn5efdwnygjby0IGD43ArzpIfo=;
        b=V8CTlvz8xPTdCGcR8PDgMcdFfI6wPmc3aVRLvKfBDwTkHSdOGniorBBHiDzTsOr0Q1
         jboJWWhskQrYpMpW7wPVQI8xh/GjHP6D+siMCMInnE/gMqYTi8YtF3wKKryKYfnnFcv+
         P0ExgPPf6fhfsGO1sUfrdlAUt+QP4Wq33jGsUgj5SdDHUZzLVrOZTrpYAKVDmRfVkQ66
         ICTdaGHXwXAEctTTNlFBsXhMmxqOn7dNTaQ3kF5CEv4Jg2Y+9W+SrGJYVjO+SMVpAdq0
         uL4Nwnw6jjPZCiSdUq9m5cB9JZQosin9zK+AuZJIQXfRtq1/WaNZ4TWAqvIuT/GIMeNl
         r3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyn3kZBaoMCTjkEIaC/WY0ygzOjdoqkJE+/ShW8PvFLPVKxVsKMmydM5vhusaZEOnEU1BIxGmef92HFqZ6+crc@lists.infradead.org
X-Gm-Message-State: AOJu0YxA0GM327szVKSTLmmQozDPF28q6O9u66uxeU5gNMVE6R/S+wW+
	JS3LLhsbHUbh/kmy7j79+aeOeqE3QXfsMLxAGLOpPiArREnUPOvqv4ZMXlZnoHY=
X-Google-Smtp-Source: AGHT+IEjWO1rixoyJxbVGtJmuxL0xP1l7hFGkamZjG4E+eqTDpqyz2JlInUTxjamsjs8DazSCd4u+A==
X-Received: by 2002:a05:6a20:7288:b0:1d8:a67e:d323 with SMTP id adf61e73a8af0-1dba423639cmr20344552637.22.1730747420431;
        Mon, 04 Nov 2024 11:10:20 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459f8fb9sm7442891a12.61.2024.11.04.11.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 11:10:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] ARM: dts: OMAP updates for v6.13
Date: Mon, 04 Nov 2024 11:10:19 -0800
Message-ID: <7h8qtyolwk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_111021_415393_37BB39F8 
X-CRM114-Status: UNSURE (   9.61  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/dt-signed-1

for you to fetch changes up to 13746595a1581e09289adf9b5202e237c5e0814b:

  ARM: dts: omap4-kc1: fix twl6030 power node (2024-11-04 10:42:22 -0800)

----------------------------------------------------------------
ARM: dts: OMAP updates for v6.13

Misc. minor updates for OMAP3, OMAP4, AM3 and DRA7 platforms.

----------------------------------------------------------------
Andreas Kemnade (10):
      ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
      ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
      ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
      ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander
      ARM: dts: ti/omap: use standard node name for twl4030 charger
      ARM: dts: ti/omap: dra7: fix redundant clock divider definition
      ARM: ti/omap: omap3-gta04a5: add Bluetooth
      ARM: dts: omap36xx: declare 1GHz OPP as turbo again
      ARM: dts: ti/omap: omap4-epson-embt2ws: add charger
      ARM: dts: omap4-kc1: fix twl6030 power node

Geert Uytterhoeven (1):
      ARM: dts: am335x-bone-common: Increase MDIO reset deassert delay to 50ms

Marcus Folkesson (1):
      ARM: dts: ti: dra7: Remove double include of clock bindings

Rob Herring (Arm) (1):
      ARM: dts: ti/omap: Fix at24 EEPROM node names

Roger Quadros (3):
      ARM: dts: ti: drop linux,mtd-name from NAND nodes
      ARM: dts: ti: omap: am335x-baltos: drop "gpmc,device-nand" from NAND node
      ARM: dts: ti: omap3434-sdp: drop linux,mtd-name from onenand node

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       |   3 +-
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |  12 +--
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   6 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/am3874-iceboard.dts      |   8 +-
 arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts  |   2 +-
 arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts     |   2 +-
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts           |   1 -
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts           |   1 -
 arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts     |   1 -
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |   1 -
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi       |   1 -
 arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi      |   1 -
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi |   3 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts       |   1 -
 arch/arm/boot/dts/ti/omap/omap3-evm.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts        |  10 +++
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/omap3-ldp.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi    |   1 -
 arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts         |   2 -
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   1 +
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 211 +++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm/boot/dts/ti/omap/omap4-kc1.dts            |   6 +-
 arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts         |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/twl4030.dtsi             |   2 +-
 37 files changed, 248 insertions(+), 56 deletions(-)

