Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66860CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fU3eKDw5HrigqKS3lfMy85hLViyXx2yevkh3+N1gsQY=; b=K/si+HYSVprVy/rtRK9mh5QJMv
	FXjnq5J6d5Wdas6t81FuKOxona0fuaOvQMBv7J28dJ7NfpZNIbZFUS4bj6xeDCJd7XD7BoKiwNfxL
	C1TXOWpL8auAkCuIgox7bYu4a7Ln+CzGdxvCBgFb+LVvfr55DVp1nm/GLicjwUERF5KoZ+uAUyJSo
	3qUfJnAacIo519y3oXWGbPtdeaPZR1btAxr++C7xDhREjfgOEoqhKO360Ou4fWQ/x/eUIizpwQWkE
	4pHxip3ulHCd2aV4sFBacbOEe3+F+Y0ccSvX3jGZbO8pase+eRxhQMsGn6iFSdloJEW+1oR0DVXBF
	pBKbtrdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyX-00000004wTm-36TH;
	Thu, 08 Oct 2026 19:40:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyT-00000004wSO-0AsN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:40:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so31771685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488415; x=1792093215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fU3eKDw5HrigqKS3lfMy85hLViyXx2yevkh3+N1gsQY=;
        b=MR7lV3/Ri6mOpc3/DCO8YmspqS8MQnuCss7CSzXtJ0Yp19TRTwWjT6Os2AOpduiIwH
         sq5H/SYzV+eiapd1LWLWlauoicC/WCzT65/W4jTGPm569sHkuZ2NP7nVvFY98H/DOcur
         9NB2HCLYXKUTSwGUBhOxWLiXj7uIEOWAI5OFR5e1E+RRVNTULn70rbnyFqIYPlnyWyAJ
         Js/GmcLH6BVd23fyhS2vDhxYVIpRQBb02xybsdb2jYv1nV58D+0pYCsrfsHlfHXKqWQA
         tAJlFrJdRJe62fX2ZIqSIA3zBUToH8Vp5BaDg9HMu2OhE7th9CZ2p4QfajoCOMWi80sN
         Js8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488415; x=1792093215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fU3eKDw5HrigqKS3lfMy85hLViyXx2yevkh3+N1gsQY=;
        b=qtShJd4PanJUZaNUqYflS0zPPYBrLlZbDmYFRMr3xGBr/8mC5a/KO+kcxZrO0Ma9l6
         2fQJmlxj22szWLBK1UYxrMfGjMqbGOMqklqBTnsK+QTdnwmtyRQLdnpl+E3bsqGnF7bc
         hw3mq2VIT/eOUG4wdl6xA3mwVAX5GKlGz0TTS6h4jYgyjU7pSTQO2woYlZHS9gXtTjKL
         sjJtg1MQ4eOkKuY3ZEo9q3MAl2Rk9XUOzxj8FC1znMRKjDsEgfB7qTxyQoNOJNe3o3w9
         xXidrkBseeStGzH8seoON2CkTWy4t5C8f0plUu+rV+/XFT8dGFzXZQIkVeRvtPq+W9N8
         lwAQ==
X-Forwarded-Encrypted: i=1; AKwUvByAr6dHp5N1DOhsVmFQDs0gZ4QZoQzZxUGzzAbo9mVYcquXD4Chs/0Y2f5QOgolGIB+hFcSKyDHWS/KS8gKBg6b@lists.infradead.org
X-Gm-Message-State: AFuF++mBQ5xKCevBk5b91nciqqfa6EzKNTw7unU2W7AsR4LlOE/k6gnc
	fAvsNzwIigT5Zj4/+wz/tBSyCTK3AmQJh+JwjKjtsbPIsyDoUoYUYBpE
X-Gm-Gg: AYBFou2/8F3kXyRn0dWjztuShHOVLhFUePDFfulFpIsG9f046Hdnfd9fCJGK+Aeiyo7
	Rrqk8wEByvi2mFZqF1CsEJg+BMRUKl/ULwFB+NKbhJ62Qm24uGa6o7tjDGS7lTwMdg8Cc/y5+ak
	iKPth5GSh6eBA/EKNX7O5tjBErU7YpS6gpiCtJ9dBdJp7rMaBYIyVB1Dcq59gVrLiRTT4MwTZzY
	MU8zLNJ/lui8w9P2ERcyytTlKkKjAjzd5iBEK9WTfHij6AroZ+KRkauMUUoGi473dGDrt4vMRZ9
	xFPUCTQGWTtP/gw9zYUd1zqmT746Xuy7P5rp3NIUAhga+Obzyt0YaIaDfwGy88FbYQDpKDGnc/m
	C0OX9IFawZmDTZaDELJWb6hkJ62eNx60B7mwbWMBujYHOT4qUXiakZJM5yeYGBiOCysDIOa5HkC
	3mS50skeNjEkTEecmFLHxkLqlAjQL3nJtFnN/2hrqo4TaoPoTPwEmFkC/RNCRn/hyH2aSzVh8ZQ
	1NAQY/gJEOE6ancQ34B1m6ZflgFdiz57yVsCat/Q1XGEbUkZwMqIy/avkp0SaUstw741NDcgI1H
	cHPu455mY0FKHAP6Vz3rIQ==
X-Received: by 2002:a05:600c:8b8b:b0:4a0:1c10:12ee with SMTP id 5b1f17b1804b1-4a1800d41c1mr107383655e9.3.1791488414203;
        Thu, 08 Oct 2026 12:40:14 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 00/13] ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL support
Date: Thu,  8 Oct 2026 21:37:40 +0200
Message-ID: <cover.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124017_580895_F5320998 
X-CRM114-Status: GOOD (  24.61  )
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

VAR-SOM-6UL already has mainline support on the Concerto-Board with
i.MX6UL and i.MX6ULL. This series extends that support with additional
module configurations, the Symphony-Board carrier and i.MX6ULZ variants.
It also adds support for DART-6UL on VAR-6ULCustomBoard with i.MX6UL,
i.MX6ULL and i.MX6ULZ.

The 90 new DTBs describe reference configurations with alternative
storage, wireless and audio assemblies. These choices change the devices
connected to the same SoM interfaces and require different controller,
pin or device-node descriptions: eMMC versus NAND, SD card versus SDIO
wireless, and the available wireless modules and audio codecs. They do
not enumerate every possible combination of fitted and unfitted optional
peripherals. The four existing Concerto DTBs remain available with their
original names and compatible strings.

Reuse and extend the existing modular VAR-SOM-6UL DTSI files, including
the separate Ethernet, SD card, SAI2, Broadcom and LVDS descriptions.
Retain kernel-managed Broadcom power/reset sequencing and Bluetooth,
and preserve the existing LVDS graph and panel timings. A small DART
wrapper selects its PWM1 backlight connection. The display files are
not included by i.MX6ULZ boards, which lack a display controller.

The existing Concerto boards gain a 3.3 V ADC reference, I2C GPIO bus
recovery, an external touchscreen description and an explicit WM8904
codec and sound card. SoC-specific wrappers place the SNVS pins under
the appropriate IOMUX controller.
Extract the eMMC description without changing its pinctrl states, and
update its consumers in the same patch. The shared Ethernet files use
the PHY reset timing validated by Variscite: 10 ms asserted and a
100 ms wait after deassertion, for existing and new Concerto variants.

The Micrel binding change in patch 5 is needed by the Ethernet PHY
descriptions in this series. The existing boolean definition of
micrel,rmii-reference-clock-select-25-mhz conflicts with the dt-schema
unit check for properties ending in -mhz. The binding now accepts <1>
for 25 MHz selection and limits the property to the applicable PHYs.
Patch 4 changes the Micrel driver to test for property presence without
warning about the numeric value. This preserves its runtime behavior.

Patches 1-3 document the board compatibles for each SoC. Patches 4-5
update the Micrel driver and binding. Patches 6-9 extend the module,
audio, storage/wireless and carrier descriptions, updating existing
Concerto users alongside the corresponding changes. Patch 10 shares
the PHY reference clock and updates the PHY properties. Patches 11-13
add the new board DTS files together with their Makefile targets.

v4->v5:
 - Rebase onto 31f9ec9f3873.
 - Clarify that VAR-SOM-6UL support is extended, while DART-6UL support
   is new, and explain the scope of the 90 additional DTBs.
 - Reuse the existing modular VAR-SOM-6UL files instead of replacing
   them. Update existing consumers in the same patches as the changes
   to their shared descriptions, rather than in a later conversion patch.
 - Retain the kernel-managed Broadcom regulator, MMC power sequence
   and Bluetooth node. Rename the Wi-Fi file to identify Broadcom and
   add keep-power-in-suspend.
 - Preserve the original LVDS graph and panel timings. Move the panel
   node into its existing option file, add the DART PWM1 wrapper and
   omit display files on i.MX6ULZ.
 - Reuse the original SAI2 file for both codec options. Extract eMMC
   with its default, 100 MHz and 200 MHz pinctrl states intact, and
   reuse the existing SD card option.
 - Correct IW61x pinctrl to match GPIO5_IO02 and GPIO5_IO06, and use
   SoC-specific SNVS pinctrl locations for the existing Concerto boards.
 - Keep Ethernet options separate. Share the PHY reference clock for
   Symphony and apply the validated reset timing to all Concerto variants.
 - Order the new i.MX6ULZ fallback compatibles as fsl,imx6ulz followed
   by fsl,imx6ull; leave the existing EVK and BSH entries unchanged.
 - Collect Reviewed-by tags for the i.MX6UL and i.MX6ULL board bindings
   and an Acked-by tag for the Micrel binding.

v3->v4:
 - Split the board binding by SoC, keep the existing Concerto compatibles
   while adding new variants, and use the binding's items/enum style.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles; keep the SoM options before the carrier name.
 - Add each SoC's sorted DTB Makefile targets alongside its board DTS
   files, replacing the separate Makefile patch.

v2->v3:
 - Add a Micrel driver fix before the binding change so the numeric
   RMII clock select property does not cause a warning at PHY probe.
 - Specify the 3.3 V ADC reference supply voltage on both modules.
 - Share identical storage and wireless option DTSI files between the
   VAR-SOM-6UL and DART-6UL, and drop unused address and size cells from
   the IW61x SDIO host.
 - Move the Symphony Type-C interrupt pinctrl to the SoC-appropriate
   IOMUX controller, specify falling-edge interrupts for the Type-C
   controller and touchscreens, and disable the actual backlight node
   on the i.MX6ULZ Concerto-Board.
 - Update board includes for the shared option files and sort the
   Variscite DTB targets in the Makefile.

v1->v2:
 - Share the WM8904 codec description between VAR-SOM-6UL and DART-6UL,
   keeping the DART-specific microphone routing in a small wrapper.
 - Consolidate the identical WM8731 descriptions into one shared DTSI
   and update the board includes.

Stefano Radaelli (13):
  dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
  dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
  dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
  net: phy: micrel: Check RMII clock select property presence
  dt-bindings: net: micrel: Fix RMII clock select property type
  ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL files
  ARM: dts: imx6ul: Add Variscite WM8904 and WM8731 support
  ARM: dts: imx6ul: Add Variscite storage and wireless options
  ARM: dts: imx6ul: Extend Variscite carrier board descriptions
  ARM: dts: imx6ul: Share Variscite PHY clock and update PHY options
  ARM: dts: imx6ul: Add Variscite i.MX6UL board variants
  ARM: dts: imx6ull: Add Variscite i.MX6ULL board variants
  ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants

 .../devicetree/bindings/arm/fsl.yaml          | 122 +++++++-
 .../devicetree/bindings/net/micrel.yaml       |  27 +-
 arch/arm/boot/dts/nxp/imx/Makefile            |  92 +++++-
 ...x6ull-var-dart-6ulcustomboard-sd-card.dtsi |  31 ++
 ...mx6ul-imx6ull-var-dart-6ulcustomboard.dtsi | 240 +++++++++++++++
 .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   |  17 ++
 .../dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi  | 207 +++++++++++++
 .../dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi  |  64 ++++
 .../dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi  |  63 ++++
 ...imx6ul-imx6ull-var-som-symphony-board.dtsi | 275 ++++++++++++++++++
 .../imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi    |  43 +++
 .../nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi    |  50 ++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi    |  68 +++++
 .../imx/imx6ul-var-dart-6ulcustomboard.dtsi   |  18 ++
 ...l-var-dart-emmc-sd-card-6ulcustomboard.dts |  21 ++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts |  21 ++
 .../nxp/imx/imx6ul-var-dart-lvds-panel.dtsi   |  30 ++
 ...l-var-dart-nand-sd-card-6ulcustomboard.dts |  21 ++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts |  21 ++
 .../arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi |  44 +++
 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 103 +++----
 .../imx/imx6ul-var-som-concerto-board.dtsi    |  38 +++
 .../imx/imx6ul-var-som-concerto-common.dtsi   |  67 ++---
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |   7 +-
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |   7 +-
 ...ul-var-som-emmc-sd-card-concerto-board.dts |  22 ++
 ...ul-var-som-emmc-sd-card-symphony-board.dts |  20 ++
 ...som-emmc-sd-card-wm8731-concerto-board.dts |  22 ++
 ...som-emmc-sd-card-wm8731-symphony-board.dts |  20 ++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts |  22 ++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts |  20 ++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts |  22 ++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts |  20 ++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts |  22 ++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts |  20 ++
 .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |   6 +-
 .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     |  26 +-
 .../nxp/imx/imx6ul-var-som-lvds-panel.dtsi    |  24 ++
 ...ul-var-som-nand-sd-card-concerto-board.dts |  22 ++
 ...ul-var-som-nand-sd-card-symphony-board.dts |  20 ++
 ...som-nand-sd-card-wm8731-concerto-board.dts |  22 ++
 ...som-nand-sd-card-wm8731-symphony-board.dts |  20 ++
 ...-var-som-nand-wifi-brcm-concerto-board.dts |  22 ++
 ...-var-som-nand-wifi-brcm-symphony-board.dts |  20 ++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts |  22 ++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts |  20 ++
 ...var-som-nand-wifi-iw61x-concerto-board.dts |  22 ++
 ...var-som-nand-wifi-iw61x-symphony-board.dts |  20 ++
 .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |  10 +
 .../imx/imx6ul-var-som-symphony-board.dtsi    |  96 ++++++
 ...ifi.dtsi => imx6ul-var-som-wifi-brcm.dtsi} |   1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi |  13 +
 .../imx/imx6ull-var-dart-6ulcustomboard.dtsi  |  18 ++
 ...l-var-dart-emmc-sd-card-6ulcustomboard.dts |  21 ++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts |  21 ++
 ...l-var-dart-nand-sd-card-6ulcustomboard.dts |  21 ++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts |  21 ++
 .../boot/dts/nxp/imx/imx6ull-var-dart.dtsi    |  44 +++
 .../imx/imx6ull-var-som-concerto-board.dtsi   |  38 +++
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |   7 +-
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |   7 +-
 ...ll-var-som-emmc-sd-card-concerto-board.dts |  22 ++
 ...ll-var-som-emmc-sd-card-symphony-board.dts |  20 ++
 ...som-emmc-sd-card-wm8731-concerto-board.dts |  22 ++
 ...som-emmc-sd-card-wm8731-symphony-board.dts |  20 ++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts |  22 ++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts |  20 ++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts |  22 ++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts |  20 ++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts |  22 ++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts |  20 ++
 ...ll-var-som-nand-sd-card-concerto-board.dts |  22 ++
 ...ll-var-som-nand-sd-card-symphony-board.dts |  20 ++
 ...som-nand-sd-card-wm8731-concerto-board.dts |  22 ++
 ...som-nand-sd-card-wm8731-symphony-board.dts |  20 ++
 ...-var-som-nand-wifi-brcm-concerto-board.dts |  22 ++
 ...-var-som-nand-wifi-brcm-symphony-board.dts |  20 ++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts |  22 ++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts |  20 ++
 ...var-som-nand-wifi-iw61x-concerto-board.dts |  22 ++
 ...var-som-nand-wifi-iw61x-symphony-board.dts |  20 ++
 .../imx/imx6ull-var-som-symphony-board.dtsi   |  96 ++++++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  15 +-
 .../imx/imx6ulz-var-dart-6ulcustomboard.dtsi  |  18 ++
 ...z-var-dart-emmc-sd-card-6ulcustomboard.dts |  21 ++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts |  21 ++
 ...z-var-dart-nand-sd-card-6ulcustomboard.dts |  21 ++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts |  21 ++
 .../boot/dts/nxp/imx/imx6ulz-var-dart.dtsi    |  51 ++++
 .../imx/imx6ulz-var-som-concerto-board.dtsi   |  38 +++
 ...lz-var-som-emmc-sd-card-concerto-board.dts |  21 ++
 ...lz-var-som-emmc-sd-card-symphony-board.dts |  21 ++
 ...som-emmc-sd-card-wm8731-concerto-board.dts |  21 ++
 ...som-emmc-sd-card-wm8731-symphony-board.dts |  21 ++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts |  21 ++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts |  21 ++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts |  21 ++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts |  21 ++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts |  21 ++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts |  21 ++
 ...lz-var-som-nand-sd-card-concerto-board.dts |  21 ++
 ...lz-var-som-nand-sd-card-symphony-board.dts |  21 ++
 ...som-nand-sd-card-wm8731-concerto-board.dts |  21 ++
 ...som-nand-sd-card-wm8731-symphony-board.dts |  21 ++
 ...-var-som-nand-wifi-brcm-concerto-board.dts |  21 ++
 ...-var-som-nand-wifi-brcm-symphony-board.dts |  21 ++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts |  21 ++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts |  21 ++
 ...var-som-nand-wifi-iw61x-concerto-board.dts |  21 ++
 ...var-som-nand-wifi-iw61x-symphony-board.dts |  21 ++
 .../imx/imx6ulz-var-som-symphony-board.dtsi   |  30 ++
 .../arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi |  51 ++++
 drivers/net/phy/micrel.c                      |   2 +-
 131 files changed, 3952 insertions(+), 142 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-lvds-panel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-symphony-board.dtsi
 rename arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-wifi.dtsi => imx6ul-var-som-wifi-brcm.dtsi} (98%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-symphony-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-concerto-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-symphony-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3


