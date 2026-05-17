Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7758CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 23:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cV5K+hC6U/LO0fJpISy/X05UeT2K9Cbw0OM6/rSxBSo=; b=39BhfElw1yKxcaqkYMMoSPufOx
	pk1ApmAqnNK5aYjjdDXVZdEysq2Hsm2g/VeA/6irPGOlF9ZJWraLBjVXQAG2MbJZLy5N5o6ytgmOl
	pOW6j7kkdKzdPTKMC7EABW57EXNVqWB5pY3p7WuZyVmyXh7tPtdY46AMHmipoW82FsEiKNsJEK/W4
	3Beomf+KmXq8l+pDOyz2dBilZEtsYSLreFf1f/vFs48/nDpW62TrM9NSerHBQJZnQY7bAa0oc8CKC
	nYgfMxLdlVtIWT7/C8niz/sS1oeSU2L0NasirJ5m5Zx4vfb4snrLgn4k+9GxwpdNsPIh6Y0TpEUi9
	wE8pcKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl6s-0000000DgJz-36jb;
	Sun, 17 May 2026 23:41:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl6p-0000000DgJ1-1o3P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 23:41:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso1439385f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061281; x=1779666081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cV5K+hC6U/LO0fJpISy/X05UeT2K9Cbw0OM6/rSxBSo=;
        b=ItjJw8KpsNff5+xi2osJnPllEqqNPc34U+nJwzaaWobCJmnwqh1miWOXvsiNRzJy4A
         ZiDE2kZ7YdOgeDw7JTv2DVIlmf3QGBtEhF9SH9qymsOLIErZX5zRT/E2RzkCDblwPgzy
         0WIwCRJ6PzDti8tD+qTE+pwpFNAguL7zWb8YKe5SqDZPwXxFvSykQiI5eO4oKH6CiutH
         qo3kaIh4NyfeoO20VzMcgqD9Y5Wy2QeGArOyNruz0Qz/oQpp5If0mINWXYRX+jLabY+L
         q+15KCOVa5KjZp5tbJHOf+2qEIOe9dDT/PfISsi1db87tFilQCGSE8iD0pPv/LDLEX9t
         BK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061281; x=1779666081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV5K+hC6U/LO0fJpISy/X05UeT2K9Cbw0OM6/rSxBSo=;
        b=Eg0+OjGZASbrSv/IiRsjVXidJpZsG7cYVlgQdPai7yhTEbkrKAuX6czc5+Fuk+4J1+
         716/fdmIQpXW1ATYwQ5TFXd/C+h2hmujUp4m1feuvkudIjVIbqoKp9mcTGISCqP7rOwD
         qgNMvjNO7QHx684Vxtq6W0Rri54pfH/+BtsZXpstw6STsyDrS2DPDfN5SCrYbn0fQ6ZO
         wO4UjDpfOf8bsvj/8xxi2WrWjMZ5OYyLMnIskD3p/Rxvfbvv6UMwLePvOnT9yBjsKwDl
         30bSWXQ6Xk+sBEBj28KXIkh/whIs27DEm7SqtaS+lerulc6tC8DYhhODbYudWTmYV/ic
         LVCw==
X-Forwarded-Encrypted: i=1; AFNElJ/6YH98BzCmztd6PTuRBsfYbmoIM5CsnczeG0WkFchk0pgUlnOHROlUUHBsLdl0tgVT/DdO49s3z3cV5cxBtpe0@lists.infradead.org
X-Gm-Message-State: AOJu0YxDVCR0jRf6UPUCSENLA4lh5TlSoyE4YL/rEDNp1ZWW36e44F/w
	qBe9CyJD9W65KGy5UtIIPL1UgM3c15gv1XvEE+TuMsriLVWnL3lptLPs
X-Gm-Gg: Acq92OEkYX4BwpbLkKACWE7fmYS9Ld86Hu0ZCyVpak9Zh4CnT47Mqd77owTHV6QhJoM
	kvUokjVngY39uW69u+d3B1jfHU5DJSOZZsywOqC2J9zYWWSG9ca/zocnUeMJLhfIEkaScIU09O2
	huE9+vE//LLYDQvsK0VibwNDFTB9PA6itV3WMnfcjxoSz7Irb7C5iZ3+tNyRM4LwCvmXYaSzk5D
	V2IjgQlBt5xFb51US9ywEFALA/KQX9GIqpWev0fkn25jNybqmlyepki4SbpGgs/M2pgUs8U/IXY
	IHVdl0ACfasEA18rW45Z0dqHtvilsPFRds9dEguVQDN8j2eFDFqvbC58PYxsyDCRdjV6oYTJn0z
	yX78ug5BbkSP4XjEBNxPUUECRzrY5ovcc2nyaCbErgnRCktmvviYdFLNwwIokEjolxNPu8o7hAT
	II23PxLptbo6qdAHXIczjRwXn/xHulKDZUs50K1na/8E8Ct5NHsRRozo5chk3y7eZG+KhZ6OLtZ
	h7eqWVzB1Y=
X-Received: by 2002:a05:6000:25c6:b0:446:189c:ac4e with SMTP id ffacd0b85a97d-45e5c59f684mr18961084f8f.34.1779061280824;
        Sun, 17 May 2026 16:41:20 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:19 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Add support for Baijie Helper A133 board
Date: Mon, 18 May 2026 01:41:26 +0200
Message-ID: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_164123_517992_D8510BB4 
X-CRM114-Status: GOOD (  13.76  )
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
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
- https://lore.kernel.org/all/20260510201644.4143710-1-alexander.sverdlin@gmail.com/
v1:
- https://lore.kernel.org/all/20260503191842.2736130-1-alexander.sverdlin@gmail.com/


Alexander Sverdlin (5):
  dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
  dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
  arm64: dts: allwinner: a100: Add LRADC node
  arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
  arm64: defconfig: Enable Allwinner LRADC input driver

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |   9 +
 .../allwinner/sun50i-a133-baijie-core.dtsi    | 190 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   | 133 ++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 342 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

-- 
2.54.0


