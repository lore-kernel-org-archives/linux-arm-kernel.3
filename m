Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7B0C54F55
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sZt5YLqMGYmF4dq+vgkm2en+jsRgo3VE/Xyvbam/bDk=; b=qDEKlMDNaJFbBZ
	iUhQlWKrkp89vOYojbZEV2YjD1lv9w0gs+v+TULev8ES7/irHyd+PKeM7iyLdUmKExW70hnHfVHSp
	IPlneA2eUKPsr8xpO0AUOXOoQE9zZC564Hpjb6Ez+2R3oCyGhymgc2YVl9txNwD0aXJ0GyV9W08JI
	0g3eqZkBglsVF4c/6TLPLG5Z9Hmg7RjQs/u1a4lbnrGvG8mmWTLboPlDSSjtVQCNtWf6gbfnj4W5M
	vWWaGYl1mYD7l9tF9oPTDQZgVFdo+jZhW+vpiFfHWcbVYlhu3JzRl91uZW2v5RV8k1b7qn7QxFo+l
	FFR4YRwbafr0vFFzZp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51W-00000008Dil-0oeW;
	Wed, 29 Jul 2026 14:12:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51T-00000008Dgy-3JIC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:12:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso696040f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334358; x=1785939158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZt5YLqMGYmF4dq+vgkm2en+jsRgo3VE/Xyvbam/bDk=;
        b=AsIyLdupwpCM+479y6VyVVc6FVP1LTklzA2WWBRpITDywQ0WNP41yQ+WlqFfoCYMSv
         trTYf4p6YwCf4Yzvd8WmGDVuokSFdqZa7SqPoPysjxza4Glz4RBH97JuM78HSCI2QUyi
         Uf29vKRODhGA6TUv6wiCuL1OsGflAQ0QFuR/twSTSn6D4M2ixTblvu7GbFmJhNZrfRJI
         mi7HAcGyk1sNyp+hz5mVuGWyvd2w5P0/au38wwNtxONjqgkRMxP1wwNRE4tMbIntrGQb
         nA/DUiZu529WFipPzVXc+1H3UzryxH1xvWDoQMaGJurOE1hxMAdHdxagR8urn+G7qKHZ
         ctng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334358; x=1785939158;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZt5YLqMGYmF4dq+vgkm2en+jsRgo3VE/Xyvbam/bDk=;
        b=eItjhtP+WNF8UhNhUWb4rdxMoOMji/b72E0H7Bz5LFaWKGJfNL3ivJQYfQo7mSU0Hn
         mIgpwqupIlL2zWHQWZmobVdaGU8EmjUAN3/NQ7YmIIYC4llLSypRQfEf4lcm2j/TRn/h
         MiEY2YZQylbpeTIYTBRLP6Tac2RMiP/k10AcfFG3Fu5RWX7MK9Es4uJ5k9jc3ptAYHyZ
         Jx7J7+6Y2UP0+M7FYuWIBAzylgv+GU4Rftl5DrFsOie7WrnInsRp9vYRvhEkq6MsFX4x
         T6bK+qBLlD8orLEPJHF5zD+zhf/ho7HgIce5CItcn0avbCK9ylk8CquEDsq9U/TkiNtO
         4qYQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIpNrRGQWO1YP78Ae0EJmfRHyRfduEbDCd72mjnSl4nmXUYp8Raa6y/heJEvQ/DGQzOT0OvJuOrXCNeDrW3HoU@lists.infradead.org
X-Gm-Message-State: AOJu0YxlS4pKDyr6k6HVB83lOghndl8JV2r+Lqtu6LbO6uH3FwjuSULZ
	E3oCB0RG/uXgpsiGPPZDN8ERCY2zkNPFv+yss37MwUmRGekPME0q2yYz
X-Gm-Gg: AR+sD12B0Jl4oSyS8RWJnsKeEXDJGd9sv1YfQ6tfgDnn2gIRelAEZzUCMiodYL0hVVu
	v2jKY+dj6U/pe2NGZbwwXgWkuNzF2U1UCJuCVKgTG9ytJ8Wnv/UL+ljazPQbLSpWZ5vEUumboTt
	guSDPnSXLtmI2ZdvCPRTOh56zq8McBFbxOVBLeMEgGwU6SI8liSbRS15cjJHSmfwkIncd1nAyD+
	llyJua5Pv2l/n9gZuiZWQ4PBWp97fy+xGg4zwbUA6wxygoTPR88+C0MVx6pApGWHQltNEg0KHH6
	XAPYzhAaVHU/lX9zcEXubNMqBDsymoAZrObHxFJhlXSaGz9VAjEJrmOGOs7J69xHhX4h/R4nc3W
	0zf8eZDFLfmjGE4uJHWvdRI29xHqoOnm2mM3J3rmcWarUYqLgIIQRW8XTfmNjAmP3s9buAuBL/S
	3u7Pk/B+dLyVs83w+kgCV+0M2x6wZU0b/3Ckfe/Lgrvtyc+dL3MMelYjbzcI78uhHMwKXWYFR7H
	j5MtFvIOJU90PY4NuV0iw==
X-Received: by 2002:a05:6000:2c0a:b0:47f:9464:86c3 with SMTP id ffacd0b85a97d-47fb1ee73e1mr8634331f8f.57.1785334357591;
        Wed, 29 Jul 2026 07:12:37 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:37 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 16:12:31 +0200
Message-ID: <20260729141234.65037-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_071239_841625_DFEE9EB8 
X-CRM114-Status: GOOD (  13.98  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2 or 4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to its specifications and original device tree, the board is
a revised version of the ODROID-N2 with Wi-Fi, Bluetooth and an Amlogic
A311D instead of the original S922X. The device tree therefore builds on
meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi, mirroring
meson-g12b-odroid-n2-plus.dts. It extends those descriptions with the
board-specific AP6256 wiring. The status LED is green instead of the
original ODROID-N2 blue and has inverted polarity.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTB was built, validated against the amlogic.yaml binding using
DT_SCHEMA_FILES, and boot-tested twice on the board. The AP6256 Wi-Fi
interface enumerates and operates with the GPIOX_16 reset and PWM clock
description present. Removing the wifi32k and pwm_ef descriptions causes
the SDIO Wi-Fi device to stop working on this board.

---
Changes in v2:
- Investigated the apparent GPIOX_16 overlap between the SDIO power
  sequence reset and the 32.768 kHz PWM clock. Retained the description
  after two successful hardware tests; removing the clock description
  prevents the AP6256 Wi-Fi device from working.
- Sort the new DTB entry alphabetically in the Amlogic Makefile.
- Sort the "orbbec" entry alphabetically in vendor-prefixes.yaml.

---
Changes in v3:
- Polished meson-g12b-zora-p1.dts.
  - Use proper comment with /* and */.
  - Use the new bindings with function and color properties instead of
    label in leds node.
  - Include dt-bindings/leds/common.h.

---
Changes in v4:
- Dropped unnecessary sentences from patch 1 and 2.
- Renamed "wifi32k" node to "clock-32768" as updated guidelines suggest.

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 105 ++++++++++++++++++
 4 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0


