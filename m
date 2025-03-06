Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF9FC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oil+pdTHskyP2FjYnUhKUvs1V9F50IglDEsPw8QJlTE=; b=i/pF+6BT0MEXkzR8nVdIlbC3cJ
	evVli9eHKRj0yVE/w/B7BWkUnj8AIDVoZpB+hHeQ4S9xikoI6Aj5FeZHKV3Zb/TxX9KF07gK5VnQh
	PxaJ701GvV49E3aiJ8lz1mvUT1bJXR9KAJ+VkTfchLvnNq/DFpLlv0bUg+Xt2Z3oC1JHrqB0yS36V
	l/AppowNrSJV3h1h1q3Ei3E02cWn9dpQGHhVepVPCSW7tl399vW8CnaANRJBwOk/ceC78COcdSRIh
	/4Gx7FW4u/1qubFStVYej66YaWthnVSvk3Qm39sfgTLNB+1RoozmiR9eujciHY5ZSTfGiReRla0No
	lRTOIxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDiu-0000000BQ7J-3Dhr;
	Thu, 06 Mar 2025 16:05:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDhH-0000000BPeX-1GNH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 16:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741277023; x=1772813023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TzosbwHEdnIy/bEAra2YOoleYUa+ANh4p0cWMT0d+EE=;
  b=1j571YjpWEzZRr+FItDsqvniS+ys7EHdGjDOItzkaFK4SlNVuFQLQEBi
   aP7avMCDJqiSPaApK9Sg9fXnEIHRURSzHn/JftSzYtWfdN9iO/eOaYNTW
   paCFGrbeUe49YMvP7cOKGFsfAqAgKInW5tn5xbkWHS5WQtaG/MWzF6ioM
   9efEn5c8DGs3BFJ/G58AcEd1dKUH0fDtm99pTx9k7mrDHH5kI9WKL70bT
   dbpBEWo5yNJSokiHo87LbbZZbh4djkY+3O2bnfs1rGZGr1yj/iAHy3/Bz
   nHoaVOlKH5d/2R7y1IQhcB7X6guPjIHmxx+p3Xnc+wJWG+OPH6Eo7VbSZ
   Q==;
X-CSE-ConnectionGUID: Mtzc/U5nQtqKRw1uIzvygw==
X-CSE-MsgGUID: JOPiCnVkS8msQNbiNLPgKA==
X-IronPort-AV: E=Sophos;i="6.14,226,1736838000"; 
   d="scan'208";a="269901966"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Mar 2025 09:03:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 6 Mar 2025 09:02:57 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 6 Mar 2025 09:02:57 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linus.walleij@linaro.org>, <ryan.wanner@microchip.com>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [RESEND PATCH v6 0/3] Add support for SAMA7D65
Date: Thu, 6 Mar 2025 09:03:17 -0700
Message-ID: <cover.1736522006.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_080343_461452_4C596811 
X-CRM114-Status: GOOD (  17.37  )
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
Message-ID: <20250306160317.enrZum584FuFUSt0j6y8zCbXBSr0gIlWgGgEAjLGy1c@z>

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


