Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A5FC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mHfyftPnrfhvR2Ntml4St86c0F/ZubW4Z9YdS0+Y/vk=; b=cjW7hGe7rwqDnE
	xcnm+X0JEcXbqJ2uLktG+fajjasS+Kqx1YJ04yZSjClmYlMLfBZdhbMzj6wnHsuDnuXu/Iock0fG9
	ZQBUzwVbf93OizFl1+EWJfDKUxe/HVVxwoe8M3yRgDWwmwriVG6BP6Ap+AIQ0Bfc+JjmSX3Jn67tq
	ej4WR+if05Ztd3WO8iQ9NY2id/CD1Cca45oAFbXeV/R7Jm45ILHpUysdHfserV9/x2uXkP2wtYlej
	bGy+UvXXXGfn9MTjiXRcMSYQCRMttjch+pMljsXCEqBHRafq1S/ATH/VM5rA7KuzKj1ibEkadKgOr
	xanvpp4WOMhIlUN/5MNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RT-00000008kBU-1At0;
	Wed, 29 Jul 2026 17:51:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RQ-00000008k9B-2k3J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:51:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so12777355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347498; x=1785952298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHfyftPnrfhvR2Ntml4St86c0F/ZubW4Z9YdS0+Y/vk=;
        b=Cs8T/7zG/INDhju7TNePurpX8i+XtZ0xsrmjuhIyFtgz0YNDIqcU5x/l1WsrHzmdxC
         FjeqjdjqMh+JZ39Ox+wY5Bohom/cykkuoHPTH7S84YOfKNoDSdRMCYrzXYgBOc78KjYz
         krAufL4IzVsoforj1HhZzWTAfYlIxusIZYKwMhwR2cwIBoptXeL9EQWDCRL9XrYNxODt
         IoNj+jTLfaPAJK3iIrJ5mIKGaIep1Au8DKkje1I9JVOK6KNxssRkRx412QDnluyNyZfC
         qmsG0yqJqMkKn2fqtNbcNZVQHBTuiDpNANAtqDrTt7JW9xFmNxdJuQOEjLv+eaLw3+j8
         +ExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347498; x=1785952298;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mHfyftPnrfhvR2Ntml4St86c0F/ZubW4Z9YdS0+Y/vk=;
        b=dQTRF9kyZmU6NTi/FZtUBvK8YehjlNPktXhtB59zX5X9bVAquGm2m6o76k5RldYyZk
         XJfb11b2uqFP25MhFrmbYxUDf8h0gCePxuhXsJXxIm6mVHPmaJOAcDNjKpaSZzXYedL8
         fTcJrzfn4acmlXIOvkZmQSH+/xOAE0STrgjmlayhAHFIPtEx8a5++FDgZvmlQObUgNYz
         RJQAE68hVpXfgLfNeLTg5uhqfrAZqPgZPJDJqs5u4QsZYEZncxLgk4PUAuDVAS0NHpSM
         qw0rjdCuxiQV69CD7iGqctZM0OmccyUGuzrFRhBbi/driuh2WWYeUxKtwzedFUdP7mAA
         27vg==
X-Forwarded-Encrypted: i=1; AHgh+RpgH4CWJl0qv3RRDUlQNQFE6V6iXBrp0EalShQDpVHTl8iDfzIMNTIJoZ8NBcTzw+6+kmsy2iAG+UViNHZ7MYYW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9u7eiAWDrEnEwJjhHknxXr30wknCgKrztw02u1bl5h/Js/Dwz
	DDnpXXo45TyJ75lwLuSmVhWvelX3zbwrS6x/NwZ0NQM8CHaU77t8TroO
X-Gm-Gg: AR+sD10Dy0YKaoFL6uHPqC5gsVXn+gnkSa2Y4Xx9wQyXxaPIUaVqHfo/o4yVTbf9AmH
	WzHctZU2Q2dcSQ6GbtYeKECh0flQw35Pm6PrkcV1sxMl3oVqozODwc6PkpgWv90NrfUSLtSznc7
	CPbUE/0q8wmAzOczTTQ7teBVQWOacWzRgbROyUUXPyO63V5DrEisz1G6xlXnp74hljkeH+05hcg
	777Y1jCFmUZbz4XKE0c9gotpNMVEiBOceA3My2Cj6Srqrxe+Y4zyaOcQNIqKGu79CYzr48qYT1T
	n+sM+qvB9jnxDUOfGF5Uq7egvUu3tsFLiFxiORs6DgafEuLda7g1r5gvDLlN+zRfgP34I+IgaOZ
	rrNcz7Mdm2CptnEh3NEBqSjM3z8eWJayAdXpR/PQ/tB4tdCjTJA5PjJZR3EcNkCdJj+esMwzS5Y
	DPyP5W086LWhnJ0fyaWdN5Dtkdk6k8qe+Mra0IVyudA/bt6yh40qGgKs6C5a2Kqj6qLfDkQO+5l
	0HCwf7mTKmkI5tDMWOQnw==
X-Received: by 2002:a05:600c:4693:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-496c643bc85mr87358905e9.17.1785347498162;
        Wed, 29 Jul 2026 10:51:38 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:37 -0700 (PDT)
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
Subject: [PATCH v5 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 19:51:31 +0200
Message-ID: <20260729175134.92909-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105140_711595_BBD94411 
X-CRM114-Status: GOOD (  14.14  )
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
---
Changes in v5:
- Add Krzysztof Kozlowski's Acked-by on patch 1/3 (given during v3
  review, was accidentally dropped in v4).

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


