Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E73C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=flkrw68MjJZnRHTgaCTuAAE9V9fABxNnM+3EBSfDpyo=; b=AMt3NWQZ56uGgJ3iRN4ON473un
	3jiS5WLM3hAnQRgXwzezei9jbtJPFRU8zY+IJHPIk7ibrJr9d0An0Zu7C0kx4o6y4uBmiI8m6eFdB
	woVLZGynCj355s8v7+5kvr2nXeh0p8x5k7SrWri2PPEApLIsYbyQEE8MopJt71HxdUS27hRLo9nfb
	btdMElT5+ThSsrcGjok4+kIkPJmxg1+TzrVmglTavhl/TkdckvcAsmkMq6J5t2mgZpGMofxvbBtBJ
	N4DBywqK4Ut+Y91BVQu6kTW2v7HMk97q12k/mRHsvI098cxWX+lTGLFqe9Pa25HXajwSLhdxu+mhH
	3Bh60phg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSRs-0000000Anl9-3YAL;
	Thu, 17 Jul 2025 17:31:12 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSIK-0000000Am5D-2jRF;
	Thu, 17 Jul 2025 17:21:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=flkrw68MjJZnRHTgaCTuAAE9V9fABxNnM+3EBSfDpyo=;
	b=yF0aXylHmh5jq94WFyMbEbUmDXeI0HzOd+2CGRVAwrdQ865zSnzcEXcO7EECZNL2leVgUjdUz84m8LaqqpW1Ptqqli6Q8B0ZKSIX/ILeZ70FL066WuSMCGIyLKJPZ7r02r0vVwXUYiiZ7D5BzbnVjNDqSO7E+RSro42T0z4YD0E=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Thu, 17 Jul 2025 19:20:54 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/5] Add support for NetCube Systems Nagami SoM and its carrier boards
Date: Thu, 17 Jul 2025 19:20:27 +0200
Message-Id: <20250717172035.3508831-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_102120_980730_BF95AF3E 
X-CRM114-Status: GOOD (  13.35  )
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

This series adds support for the NetCube Systems Nagami SoM and its
associated carrier boards, the Nagami Basic Carrier and the Nagami Keypad
Carrier.

Changes in v5:
  - Re-add the non-removable property to the ESP32 interface
  - Add the mmc-pwrseq node for the ESP32 to initialize the ESP32 correctly
  - Remove the unused ehci0 and ohci0 nodes from the Keypad Carrier since
    USB port is peripheral only

Changes in v4:
  - Disable the default interfaces on the card-edge but keep the pinctrl
    definitions for them
  - Split the pinctrl definitions for the SPI interface into the basic spi 
    pins and the hold/wp pins
  - Move some mmc0 properties to the Basic Carrier dts
  - Remove non-removable property from the ESP32 interface
  - Fix typo in the keypad matrix definition

Changes in v3:
  - Add missing dcxo node to the SoM dtsi
  - Rename the multi-led node
  - Change dr_mode to "peripheral" for the Keypad Carrier

Changes in v2:
 - Squash the binding patches into one patch
 - Fix formatting of the phy node in the SoM dtsi
 - Add description on where the phy is located in the SoM dtsi
 - Fix the phy address in the SoM dtsi
 - Move the carrier bindings into the same description as enums

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (5):
  dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier
    board bindings
  riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube
    Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
  ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
  ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier

 .../devicetree/bindings/arm/sunxi.yaml        |   8 +
 arch/arm/boot/dts/allwinner/Makefile          |   3 +
 ...n8i-t113s-netcube-nagami-basic-carrier.dts |  67 +++++
 ...8i-t113s-netcube-nagami-keypad-carrier.dts | 164 ++++++++++++
 .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 242 ++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  48 ++++
 6 files changed, 532 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi

-- 
2.39.5



