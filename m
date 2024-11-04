Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84A4D1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4GL6OlsCw/1Iw3ML1pJSqsdxrGB8NVV7bwhorGsY4FA=; b=d/0tuhEubbfM3UeO1XDuR+saiF
	JTUz8ULFbl/tw/4LJkCHMzZqybmGX4mKrmjyqYu27bUEMH1hlZoPpjn0Lbh3zCFKIZa53eenKcDBR
	os+c12iyJ9htEHRpwfxS6b0JyE6TjtODYrdg8AyijWBg6fgRll14bmyEd3JyxZ2rLjXNz2ZTmUIq2
	fc8T2AdVOYtZS4JqEOCG+ppim4xZR9k78ZvTBmoeSK0TMlBDu+HY6QKV/GRkaebknSvfpLyoofdhG
	v4MFsbPW8RvexyovAlMq6/zOSBQwgRfMaMjR3DI4J+Z8ogIx4vqUKxH3TFamJeBjWCvRsqQ6H5jo+
	Sdd9Pgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82G9-0000000Epfz-0ULj;
	Mon, 04 Nov 2024 18:57:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Aq-0000000EpD8-3PbB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:51:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2113da91b53so12594715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730746295; x=1731351095; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4GL6OlsCw/1Iw3ML1pJSqsdxrGB8NVV7bwhorGsY4FA=;
        b=mIftWKrmhUXkFV9mf7CgwCtd2NUw+HeaMe6zBtjUJdB/fiDpIoY+2FlcUnD3DzuR8r
         TwsUTRcqQHwpmYOberqX4eKKqDABLnNjf+YA+YBcAOO9Tc6duzE4hZV71VU/hoFf2X8d
         3bURZaWdi58y6ehop0ZIKViA6hj8pwtZ8Nk9yOmwm0ODvRBXDFMQHdW0ABwVlTrWebeD
         hXXes4hJYR9essjZguUIW0pVhq9Zkd9HhInqOqOV85pdQQXaEMnE3I/1xfZVm4rt/M/O
         yD8aMhj9oEoYCYlGKowWQQ7p+Znj1VmqAqFv1qBG0IKbmcbkcK1dwcqg55ivzwmWCXOB
         AykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730746295; x=1731351095;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GL6OlsCw/1Iw3ML1pJSqsdxrGB8NVV7bwhorGsY4FA=;
        b=WCkYDPoVK3G1ZSMFa+Vx8pnlhvjRofH7p765//6mMyYMorl3LkcIixWRm8lb96svca
         goNuiRH9KMPVp+/Yl1YZiA4axVtkpn1WKt4TAnfR8K1xS3WES+2M8xYdBL3EeOdT4SAR
         vPYT8+Y+3S6Gor/hP9V5SzE8wZEwtq6W6sqRnbmI2Rg/rgsJGpb+SAnkNXvJ8GFZpzfh
         UF0iLISB+xoiFXywcJzTrUaQVFuUM7c/O5RyvE/5H4Wm5cRit4YKGcJikKjdmbQ/+E9K
         tBI0fiRuAZbhXY9qsX6GluzXEOFd0TWVa/MU/wZezPRmZxR11mL2RFCJUpjyS8R4EhHF
         +zgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaMmCpGl8uKK83sv4IKGQ7aeC2MwOEnczC8HDoQMABVF4oVKm/EnTLYRLHD8sjVceRtb843fIphU7O+p0FNU2Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzngFuqpv0ZJqlZZorCEF+KcmSSSPlusTnbAHkOj3J+JX6xW/yj
	lhtBfbAt7ZLtFfqa+H7pBCzd7g/NwOc6kJXMKSJoRJ3OtH/Z9Oj4Jvn3QrGZ23c=
X-Google-Smtp-Source: AGHT+IGzpsJFLBBw3vdrPJOV+n4vGe3wFsVOs9lQV6Gx+kfr37V1BYgA0GZsaPx09/UbeM2AdnSQng==
X-Received: by 2002:a17:903:2445:b0:20c:bcd8:5ccb with SMTP id d9443c01a7336-210c6c0610amr475618745ad.30.1730746295454;
        Mon, 04 Nov 2024 10:51:35 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2b39sm64589225ad.145.2024.11.04.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:51:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v6.13
Date: Mon, 04 Nov 2024 10:51:34 -0800
Message-ID: <7hmsieomrt.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_105136_877678_89C0721F 
X-CRM114-Status: GOOD (  10.35  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/dt-signed

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

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       |   3 +--
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |  12 ++++-----
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   6 ++---
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   2 +-
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/am3874-iceboard.dts      |   8 +++---
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
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi |   3 +--
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts       |   1 -
 arch/arm/boot/dts/ti/omap/omap3-evm.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts        |  10 ++++++++
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          |   1 -
 arch/arm/boot/dts/ti/omap/omap3-ldp.dts            |   1 -
 arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi    |   1 -
 arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts         |   2 --
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   1 +
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 211 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 arch/arm/boot/dts/ti/omap/omap4-kc1.dts            |   6 +----
 arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts         |   2 +-
 arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/twl4030.dtsi             |   2 +-
 37 files changed, 248 insertions(+), 56 deletions(-)


