Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6933E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oil+pdTHskyP2FjYnUhKUvs1V9F50IglDEsPw8QJlTE=; b=Re7BzF14bgL+KmFIbzcvmFf3V3
	vFf9IqQu8pjDLDD+E3S5M4XjQg4PaFAszYZKAHVZvUAucz76owg8g/E7ECH5kJu7/TQcndVLKZFSm
	JXAslXU9o5Z5c2YDVYzp1ItRR24gf1SrzzNxA0z9t3rPwZjRAw1ivZgODn+hSTuO/Ate7yR4/dT+o
	8TsaPJl0KT4ppvNyH1bluVsJ3m6xL/nJEqs7pQFKG9c5FvvraCrJO+M0ehhUuu5ZNJLl2SvpNgcA+
	xYX+mJAAHZktsZUV8CSjsFEdYoWNrP56VPrvPfZkjVG7A1Jib4SQuJGQMcdgYzfRvCeXlMO3QNiwm
	nxAN0SgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHKb-0000000G6qu-4AdZ;
	Fri, 10 Jan 2025 15:53:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGtk-0000000Fuh6-2GT5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736522768; x=1768058768;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TzosbwHEdnIy/bEAra2YOoleYUa+ANh4p0cWMT0d+EE=;
  b=mBxtx82iFN2fN8wixnrdR75uOda+ahC6CUbpqmZQo73CChvpVV6s3Pdv
   oFwUCvk0mnHnOYtF27464VwUsBNx6NBvTljThrSR83Fy20jnQinfMqsq+
   Yi8Yznp2OcQTgQ5FHCwctrUzSNVMHG0xNXy6E/srQKZwwD3JlN9mopF6d
   VRpWxMOARa4697p+WV/YQ+Hy2zhMRcOJ44OSAHZA0bhMPlQmlkSktVNgh
   E0s9KPABJVHW81xQBToNLe6mAYrgPvQzpbUV7tsZV2xdruuElBtw7gLJj
   Vh504aRq7DZS5fJa0joZmrpnaCuiOSUxpwQMtyJhOVsafVW2fdz4Vh/XT
   w==;
X-CSE-ConnectionGUID: 5GPtyWRDTC6ZDj4SFqiVRA==
X-CSE-MsgGUID: Q023PzxzSBSbN5Hp498PUg==
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="203886120"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jan 2025 08:26:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 Jan 2025 08:25:52 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 10 Jan 2025 08:25:52 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v6 0/3] Add support for SAMA7D65
Date: Fri, 10 Jan 2025 08:25:39 -0700
Message-ID: <cover.1736522006.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_072608_712706_F385B11D 
X-CRM114-Status: GOOD (  19.16  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This series adds support for the SAMA7D65 SoC.

V2 of this series [1].
V3 of this series [2].
V4 of this series [4].
V5 of this series [6].

For the pinctrl and pit64 timers those will have DTB warnings due to
those bindings not being in the .yaml format.

Changes v1->v2:
- V1 set was sent incorrectly as multiple seprate patches v2 took all
  those patches and put them in 1 thread.

Changes v2->v3:
- Correct the patch order to follow correct practice.
- Correct flexcom dt-binding commit messge to reflect the changes in the
  coding style.
- Add missing SoB tags to patches.
- Moved export clocks to DT patch to be included with the clock binding
  patch.
- Separate Kconfig changes and defconfig changes into different patches
  and removed unused Kconfig params.
- Correct confusing SoB and Co-developed chain.
- Removed unsued nodes in DTSI file and sorted includes
  alphanumerically.
- Fix incorrect dts formatting.
- Separate dts and pinmux changes into two patches.
- Combine PLL and MCK changes into core clock driver patch.
- Correct formatting in main clock driver.
- MMC dt-binding changes are applied for next so have been removed from
  the set [3].

Changes v3->v4:
- Collect all tags from maintainers.
- Correct compile error on 11/13 and correct location of vendor specific
  properties.
- Add USB and UTMI selections to 12/13 to prevent compile errors due to
  functions in the clock driver that use the USB clock system.
- Add "microchip,sama7g5-pinctrl" compatible string as a fall back in
  9/13.
- Add missing kfree() to 8/13 to correctly handle error case.
- Replace bad spacing with correct tab formatting on 7/13.

Changes from v4->v5:
- Remove patches that have been applied [5].
- Update pinctrl dt-binding to use fallback formatting.

Changes from v5->v6:
- Remove patches that have been applied [6].
- Correct incorrect spacing formatting on pinctrl dt-binding.
- Reintroduce flexcom to the thread since it was removed due to an error
  in collecting applied patches.

Note:
- For the SDHCI DTB error that patch has been removed do to it being
applied see [3].
- There are DTB errors on microchip,sama7d65-pit64b and
  microchip,sama7d65-pinctrl, this is due to those bindings being .txt
  files.

1) https://lore.kernel.org/linux-arm-kernel/cover.1732030972.git.Ryan.Wanner@microchip.com/T/#m9691b4d58b62f36f6cbac1d06883c985766c2c0d
2) https://lore.kernel.org/linux-arm-kernel/cover.1733505542.git.Ryan.Wanner@microchip.com/T/#m3b52978236907198f727424e69ef21c8898e95c8
3) https://lore.kernel.org/linux-arm-kernel/cover.1732030972.git.Ryan.Wanner@microchip.com/T/#mccf6521c07e74e1c7dc61b09ae0ebdbbdde73a28
4) https://lore.kernel.org/linux-arm-kernel/70d429086fd8e858d79ca2824ad8cc4a09e3fe5d.1734723585.git.Ryan.Wanner@microchip.com/T/#m918b8db23c8d30981263846a02dafc085e17de14
5) https://lore.kernel.org/linux-arm-kernel/70d429086fd8e858d79ca2824ad8cc4a09e3fe5d.1734723585.git.Ryan.Wanner@microchip.com/T/#m69b8f11536e3b0ca3d69d125d0670c90412d4317
6) https://lore.kernel.org/linux-arm-kernel/20250107160850.120537-1-Ryan.Wanner@microchip.com/T/#m54eaea3dc49c687865e3db33e286eeb29edd7cf0

Dharma Balasubiramani (3):
  dt-bindings: serial: atmel,at91-usart: add microchip,sama7d65-usart
  dt-bindings: pinctrl: at91-pio4: add microchip,sama7d65-pinctrl
  dt-bindings: mfd: atmel,sama5d2-flexcom: add
    microchip,sama7d65-flexcom

 .../devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml   | 9 ++++-----
 .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt         | 1 +
 .../devicetree/bindings/serial/atmel,at91-usart.yaml     | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.43.0


