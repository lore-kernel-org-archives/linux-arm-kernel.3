Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33100CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQf/A4ruU9gIb5FvsawDggEwo1Hergfzti0vWW30RV8=; b=p4AEbSxOwwazOpOJaC2Y5iOEfD
	4scwKAMt8xI0RpY2yDhNJfKDYdFzJMa2E9cI/h/5a36C2VJae/4ecHgIHPzn3Xxp/gFYsxn2F86T+
	48diguzud/Y9/4IC8czIkc+KslmJZ9iK9RihlD9gprstkdWQzuE47nl0BhIZkn9Nm91ULhOw46WDn
	gIGL90n3usbaIS2PqeFVcU4hXz7xk22oaZqMBiBwTgNcXlayRRbGLi2EnSXCHEuftqPyZWlsuW/lQ
	M3CxyskcXaC+FRt7NwL8RZAIobOgv2eIR2r4qRpy42FMZhpBRHLpDOmCEk4/Nmn301KediC3JFrdx
	U+oz99vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc82z-00000006sGR-1ywE;
	Tue, 23 Jun 2026 20:48:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc82w-00000006sFY-1LA7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:48:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4908b92904fso3576245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247716; x=1782852516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQf/A4ruU9gIb5FvsawDggEwo1Hergfzti0vWW30RV8=;
        b=jqI9pCV2SDY9nf57xQqtMFHALq03b4vL4UcmwSW+Q1uPd3UAnYYruKUyXNC+2Hdkti
         2VpzJe303/b7fOwbiTDeGbjQH+mFJiUy9+BcrkcnYE0Xj9oIwQDiVj6Xu76KLczoEy07
         ocKzRpoEoUdwEF5dnyeTfuK6Ajujgo4cpyWyjAm6t2a7TqjK521uApoXGioI2bnIkl49
         j91A/YNNewv29SlmIRjPOUx2eKJVIQ4QDR+ZST4vss7XyqP1NW5BJdJhKGXjQoveCACo
         sblJyFcFGd4VnbmOXn7ZmkN/oFScXXhgmm/slqit7p3/1ZL5MQHf/JR+xF1Cz3lJ2jjB
         MmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247716; x=1782852516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQf/A4ruU9gIb5FvsawDggEwo1Hergfzti0vWW30RV8=;
        b=JSjzITQQNjrCzh1Man1ZUceetuVeCJakt3ehZi3ZotraDEgcVkxOmLrPxOvk9gyFKu
         OlNeS+iM/ozkYALhQstc6V49LCDOpbssCm60CUnmxXg3eCU3wM86o5wvUZSN5hJn2NOI
         LTycOL8yYYf31eqNC9YhtYMTxk+xUYcLysHmYXz7bp2JnccC2gzErtrrFW2oRKhMDpJY
         fE5ZADP9JQxBvkER6BNOfAhNXyS0J6qXCRFr5DWb/Qmn6nIp0mXWEVDpY8q65k7w3nDg
         7Z8Gy6Hz3807eNMCXUAWl6eFWvKxGKTLDar5HGFUHRrsgpJ8EKf3jwpUzEWnGY7MljsN
         CMew==
X-Gm-Message-State: AOJu0YwcwMpI8KPDxYH16FTp9pZXe4nKC1oUXWTrHoz/JVnQ/tTNIw5h
	1U/igpyCvSmMPMr63kecVRDSFhCJo4HP0XJYcsK4XOr6GwYtA4/+pEJKEn4W4aD8zA4=
X-Gm-Gg: AfdE7cmxsYzltugqLi2hGtLundXEOoRNrkLY/k5V5jGCQeAzGvoXPGCXTtFvUP2IEHC
	HYgZdDAqKDeOfuMYF8qVjgGaGBI6RL0MRQsF5KRe9QNMXxGryU13S0sJ+Zob8GZgk7hNkH4xAxD
	B3YEmDOfqDBrswdMyfRn6MZCbtxIrcy9PZYgxvQjaMcYliYxhiLm861U/Blq9rqkGXXZzhLwHuu
	x7fVwtFRE130gcqzBIpBL1mq6JaUk6eHnrRz5tO+cZn2QvzDshoEgZJ601WQJH4hzfY15PMMyKW
	CxIyEu0aCKAQf+T2OgGgHhKDZ1n18T5SqudR2cPxp7YM0rx+euzWFjsdTX2zkKQKJO8IgvXq0aZ
	W8OonDv6UMAptkz1X7OXxQXUWDdOG1oYL7//GJM43tk495ogxUShh3DAgLAalJdneivE2ow8WE9
	V/ErD29Pokb1yFcwQYbRp/rlEAHkbGQvWxaZZKPP2Q5w==
X-Received: by 2002:a05:600c:8208:b0:492:5030:5e7b with SMTP id 5b1f17b1804b1-4925b3533bemr68648165e9.10.1782247716007;
        Tue, 23 Jun 2026 13:48:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:34 -0700 (PDT)
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
Subject: [PATCH v5 0/6] Add support for Baijie Helper A133 board
Date: Tue, 23 Jun 2026 22:48:12 +0200
Message-ID: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_134838_383352_40CE8EA0 
X-CRM114-Status: GOOD (  15.43  )
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
v5:
- sun50i-a100.dtsi: reflowed "compatible" property of lradc node
- dropped "reserve RAM for ATF" patch [v4 6/7]
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
- https://lore.kernel.org/all/20260605070923.3045073-1-alexander.sverdlin@gmail.com/
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

Alexander Sverdlin (6):
  arm64: defconfig: Enable Allwinner LRADC input driver
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
  arm64: dts: allwinner: a100: Add LRADC node
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../input/allwinner,sun4i-a10-lradc-keys.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  10 +
 .../sun50i-a133-helperboard-core.dtsi         | 197 ++++++++++++++++++
 .../dts/allwinner/sun50i-a133-helperboard.dts | 148 +++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 8 files changed, 366 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts

-- 
2.54.0


