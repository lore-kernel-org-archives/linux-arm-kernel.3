Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF51CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6wf5wsEaBEbi7V4bTOA8WpiI2FMdMe2pmDS666iTnCU=; b=sp35RYf6n5WvPxynT0QCS25wiq
	y3E67kMfFN9H2dEpGPL04G4m91eu2p6CF2DbVMd7KsxdVxuZ70PIC+N/DChj8Qtsl85cG81hHqyz8
	b+5sbVqUQumhRNV4we0pzyETuyZt/yZpzl15VBDQVA7ea4AAFwu9qGphcXeQ++FRkhCXLYWzRkuwq
	TUQLeY/G7/ilLk9qq9fgtPSWgNfG70QoAfjWRcf5SYKEauXJeosYazwhVHTDc2rF14PLTHjJCjJpB
	+0ophtGJ0RYUxL7sxAzxV5DCfEYsv/lXp6zk14kubYQVNHhxcIFQ5r+dO1JA/QmxFB+YgH7hK1Cxs
	3r3Vb+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgr-00000000Crh-1sGl;
	Fri, 05 Jun 2026 07:10:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgo-00000000Cqi-3oZP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:10:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so8325035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643397; x=1781248197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wf5wsEaBEbi7V4bTOA8WpiI2FMdMe2pmDS666iTnCU=;
        b=OpiXapPzDT1VA5IpzEoZNuMET/CrUjaYv1vyxxLc/7lh7LaQWDASkSc7jAM+R9JnOO
         zVuGirkeVbY2BAbdGXQx2f1FR0CGUXKf5huF6fco+x/waTcZwSvirLhd33qHVwd5YkzT
         1XSSelNxEcBGXsWWFfA6uwQCbgeSeu2unk3XVeB2KjIFVdvWCT1MxJRS1PkGxPqfNZLZ
         DTFaO0Cii03JhAYc6uHmitg+PgY9kXfznYoSjfsd0lJD7LP15JzmRjOnFZk6wEUd1Nny
         52n1W3qzU4ZFVmA7WywEWu758/v9w4HGrrHLvDt8tSUr1CfR7/lQ847KBchTAdzXTnHm
         jSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643397; x=1781248197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wf5wsEaBEbi7V4bTOA8WpiI2FMdMe2pmDS666iTnCU=;
        b=DIfhR+MNhR6FGLBmL0uRbs3fnrEo/VqgEIGY+PdBiJiYfpekzXLUaZBWllhSNiPgoI
         t2ZxFBE80NYFb43PnH3G5rkw7sdiSR6683wgLEhL7HdysYBs4+0NhaHnm69SEKZoM/CF
         V+Rh2+xFfHjzkRn0S1Amfn4I9GxSClpjyTJ5jbFBIMu/qlEAyfZkiRgPNxKAzpjY2qO3
         9Rjb7z9zKdvP2Rw4dbbyJNuTFaDyCgwvD2ssHdPNcoV2gCZMBJIsbmgJJKl4zqXd6673
         UY0yFw7LVRJUmrxzK5bEVeiyDhkYMfHnTNqyRihJu+UDTiEJ/F9Iprhkt0D1t6ubGTOA
         xIhg==
X-Gm-Message-State: AOJu0YwTOGd0jc7c3b/7cayOy7xI+lc7PBy2CWvVDcPdI9GKtaYNSLcv
	lDbcV0rVWTGWnc4N6LiOq30NaMJ53ET+kCEDfBAgBIJixvuj5q8BZdXDnCmH/6dR8Jg=
X-Gm-Gg: Acq92OHtc7cWbMGxLn4xzB6SQQPsrffmoGsWQn5LLxxESouRptuPVqb5kmBgS0vskCi
	HJ4mLBUXT9iHLIHSTuVtdNp//49FhifHeDxHGD4UFeWl4ulgTJfUgnzU6ITxmMlaUKOQFfA8Y1X
	ZkO2J+/mtA6KRxtxafsQzRdOVTHLifws1T347DCp6d48dKxK620F2YPFdJ0uodXjdnl1gsv9jT6
	T20cz8HxqrvK0u+DS+tz34yG0KYvYrBLp3DXptRxsbqPXR+cHYldPjqD+7scLJK97xR94sUYsZv
	IhqdUV/MH8nMNNrkHNVT97eK+JmD/i4BupiE9L0cYXERiAd6fZJ0eMmux3x1NxS0DWmqcRrYKrI
	HGQ8tvlQ6Kp2g816zkJ8pfvFUQLK9VUZhYugascqSf56MVZALVnjdVaszN12/u1muQY67/KBrFR
	Q8wDVEQAV7A+OFiYMgdqP/hKpwWwpPPMjFZvF8HDQikWAHofGMzrloC3CmW/OXKrHg7qEeq3jkx
	8wbz3MkyUcSS0sl2Ee0nA==
X-Received: by 2002:a05:600c:354a:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-490c2607c39mr29819615e9.31.1780643396855;
        Fri, 05 Jun 2026 00:09:56 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:09:56 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 0/7] Add support for Baijie Helper A133 board
Date: Fri,  5 Jun 2026 09:09:14 +0200
Message-ID: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_000959_000997_6F7BAE0C 
X-CRM114-Status: GOOD (  15.54  )
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

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- USB-C OTG port in peripheral mode (via onboard hub)
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet, LRADC-connected buttons.

UART1 can only be used for Bluetooth module, but BT-WiFi combo Allwinner
AW869A chip has not mainline driver currently.

Link: https://szbaijie.com/index/product/product_detail.html?product_id=23&language=en

Changelog:
v4:
- reserve RAM for ATF
- sun4i-lradc-keys: Add A100/A133 compatible
- dt-bindings: renamed "Baijie Helper A133" -> "Baijie A133 HelperBoard"
- dt-bindings: renamed "baijie,helper-a133" -> "baijie,helperboard-a133"
- dt-bindings: introduced allwinner,sun50i-a100-lradc
- reserve RAM for ATF
- renamed "sun50i-a133-baijie-helper.dtb" -> "sun50i-a133-helperboard.dtb"
- added "model" property into root of sun50i-a133-helperboard-core.dtsi
- added "cap-mmc-highspeed" and "max-frequency" into &mmc2
- added "x-powers,drive-vbus-en" and "*-supply" into &axp803
- dropped all "regulator-enable-ramp-delay" properties
- replaced &reg_dcdc3 with a "polyphased" comment
- exact DRAM voltage in &reg_dcdc5
- disabled &reg_dcdc6 to avoid "[   31.710641] dcdc6: disabling"
- added &reg_vdd5v "root" regulator
- added "disable-wp" into &mmc0
- commented &usb_otg
- assigned usb1_vbus-supply in &usbphy
v3:
- added lradc node to sun50i-a100.dtsi
- enabled LRADC driver in arm64 defconfig
- added my copyrights into the newly introduced DTs
- all DT nodes sorted alphabetically
- all always-on regulators commented/propetly named
- all regulators got proper voltages (not default ranges)
- ADC-sensed buttons K1..K5 added
- re-labelled "eth_phy" -> "rgmii_phy"
- usbphy 0 switched from host into peripheral mode (downstream from an
  onboard hub)
- typo sun50i-a133-baije-core.dtsi -> sun50i-a133-baijie-core.dtsi
- https://lore.kernel.org/all/20260517234134.2737320-1-alexander.sverdlin@gmail.com/
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
- https://lore.kernel.org/all/20260510201644.4143710-1-alexander.sverdlin@gmail.com/
v1:
- https://lore.kernel.org/all/20260503191842.2736130-1-alexander.sverdlin@gmail.com/

Alexander Sverdlin (7):
  arm64: defconfig: Enable Allwinner LRADC input driver
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
  arm64: dts: allwinner: a100: Add LRADC node
  arm64: dts: allwinner: a100: reserve RAM for ATF
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../input/allwinner,sun4i-a10-lradc-keys.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  25 +++
 .../sun50i-a133-helperboard-core.dtsi         | 197 ++++++++++++++++++
 .../dts/allwinner/sun50i-a133-helperboard.dts | 148 +++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 8 files changed, 381 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts

-- 
2.54.0


