Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CEBC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PtNSXbrjAqX1ETKqGC0hsqRJlbWzz6AdVkI/xZ4cO4k=; b=B3n+1ljYCOXK5tc24ggy02lUDp
	oU4obqADZIwrKTpLRbQ6HZ+h4TariT9Kyfv/fKLbFu3LfBswT3kC971oBBaLn5n+X9uE2utadDB4O
	SZtrxqgZXhywNZuuwr1Zti6UTBYl6od2zS/i441u09EEGy1fUgfdDuBPqWKw1e3S7e1pnAsV3/OD5
	+NkH7szi+KuvGzyy9kh6rk8HWJYPrz+HFEJ8OP8zFLIsjYjmTzSR1nyAunxk3+BkYx9pFjvn5oqKe
	Qfylwh9Hc3H2+ziANbHMJqULsecOwQIuPyEfiUVNmGOdirP2RSJAEYdaxofc53dh74uEuOFq3zU+l
	ifad2H/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVBP-00000008pqA-2Dan;
	Wed, 09 Jul 2025 13:49:59 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSiX-00000008S9w-3gWW;
	Wed, 09 Jul 2025 11:12:04 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 47E96602FD;
	Wed,  9 Jul 2025 11:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1752059516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PtNSXbrjAqX1ETKqGC0hsqRJlbWzz6AdVkI/xZ4cO4k=;
	b=dBZOM+0IrzwKOXnf/Ex3f3pncZ2AShVv0GO6sszPMAQXCInYkYR3F2XVV79Rt8ybmzQF/u
	NU7HTJBEcER646kZmk6pPYUn8c7YaTjzBsrAPfCf+7uH29+37KJQGWGGB3hZY0FwBPM/ao
	xoN8k3YxR4ZybXxDSyLfKBqMMF2yBW4=
Received: from frank-u24.. (fttx-pool-217.61.157.99.bambit.de [217.61.157.99])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id DF9A91226D4;
	Wed,  9 Jul 2025 11:11:55 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v9 00/13] further mt7988 devicetree work
Date: Wed,  9 Jul 2025 13:09:36 +0200
Message-ID: <20250709111147.11843-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_041202_204670_A3B8AB88 
X-CRM114-Status: GOOD (  17.60  )
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

From: Frank Wunderlich <frank-w@public-files.de>

This series continues mt7988 devicetree work

- Extend cpu frequency scaling with CCI
- GPIO leds
- Basic network-support (ethernet controller + builtin switch + SFP Cages)

depencies (i hope this list is complete and latest patches/series linked):

support interrupt-names is optional again as i re-added the reserved IRQs
(they are not unusable as i thought and can allow features in future)
https://patchwork.kernel.org/project/netdevbpf/patch/20250619132125.78368-2-linux@fw-web.de/

needs change in mtk ethernet driver for the sram to be read from separate node:
https://patchwork.kernel.org/project/netdevbpf/patch/c2b9242229d06af4e468204bcf42daa1535c3a72.1751461762.git.daniel@makrotopia.org/

for SFP-Function (macs currently disabled):

PCS clearance which is a 1.5 year discussion currently ongoing

Daniel asked netdev for a way 2 go:
https://lore.kernel.org/netdev/aEwfME3dYisQtdCj@pidgin.makrotopia.org/

e.g. something like this (one of):
* https://patchwork.kernel.org/project/netdevbpf/patch/20250610233134.3588011-4-sean.anderson@linux.dev/ (v6)
* https://patchwork.kernel.org/project/netdevbpf/patch/20250511201250.3789083-4-ansuelsmth@gmail.com/ (v4)
* https://patchwork.kernel.org/project/netdevbpf/patch/ba4e359584a6b3bc4b3470822c42186d5b0856f9.1721910728.git.daniel@makrotopia.org/

full usxgmii driver:
https://patchwork.kernel.org/project/netdevbpf/patch/07845ec900ba41ff992875dce12c622277592c32.1702352117.git.daniel@makrotopia.org/

first PCS-discussion is here:
https://patchwork.kernel.org/project/netdevbpf/patch/8aa905080bdb6760875d62cb3b2b41258837f80e.1702352117.git.daniel@makrotopia.org/
some more here:
https://lore.kernel.org/netdev/20250511201250.3789083-4-ansuelsmth@gmail.com/

and then dts nodes for sgmiisys+usxgmii+2g5 firmware

when above depencies are solved the mac1/2 can be enabled and 2.5G phy/SFP slots will work.

changes:
v9:
- dropped patches already applied (cci,gpio-leds,unused pins)
- added patches to add RSS IRQs, IRQ-names and sram-node for mt7986
  note: mt7981 does not have a ethernet node yet
- set minItems for Filogic (MT798x) IRQs/Names to 8
  needed to update MT7986 binding example because of this
- add sram:false to non-Filogic SoCs

v8:
- splitted binding into irq-count and irq-names and updated description
- fixed typo in mt7621 section "interrupt-namess"
- splitted binding changes into fixes (mac) and additions (sram)
- dropped change of reg (simple count to description)
- change ethernet register size to 0x40000

v7:
- fixed rebasing error while splitting dt-binding patch

v6:
binding:
- split out the interrupt-names into separate patch
- update irq(name) min count to 4
- move interrupt-names up
- add sram-property
- drop second reg entry and minitems as there is only 1 item left

dts:
- fix whitespace-errors for pdma irqs (spaces vs. tabs)
- move sram from eth reg to own sram node (needs CONFIG_SRAM)

v5:
- add reserved irqs and change names
- update binding for 8 irqs with different names (rx,tx => fe1+fe2, rx-ringX => pdmaX)
  (dropped Robs RB due to this change again, sorry)

v4:
  net-binding:
    - allow interrupt names and increase max interrupts to 6 because of RSS/LRO interrupts
      (dropped Robs RB due to this change)

  dts-patches:
  - add interrupts for RSS/LRO and interrupt-names for ethernet node
  - eth-reg and clock whitespace-fix
  - comment for fixed-link on gmac0
  - drop phy-mode properties as suggested by andrew
  - drop phy-connection-type on 2g5 board
  - reorder some properties
  - update 2g5 phy node
    - unit-name dec instead of hex to match reg property
    - move compatible before reg
    - drop phy-mode

v3:
  - dropped patches already applied (SPI+thermal)
  - added soc specific cci compatible (new binding patch + changed dts)
  - enable 2g5 phy because driver is now merged
  - add patch for cleaning up unnecessary pins
  - add patch for gpio-leds
  - add patch for adding ethernet aliases

v2:
  - change reg to list of items in eth binding
  - changed mt7530 binding:
    - unevaluatedProperties=false
    - mediatek,pio subproperty
    - from patternProperty to property
  - board specific properties like led function and labels moved to bpi-r4 dtsi

Frank Wunderlich (13):
  dt-bindings: net: mediatek,net: update mac subnode pattern for mt7988
  dt-bindings: net: mediatek,net: allow up to 8 IRQs
  dt-bindings: net: mediatek,net: allow irq names
  dt-bindings: net: mediatek,net: add sram property
  dt-bindings: net: dsa: mediatek,mt7530: add dsa-port definition for
    mt7988
  dt-bindings: net: dsa: mediatek,mt7530: add internal mdio bus
  arm64: dts: mediatek: mt7986: add sram node
  arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt
    names
  arm64: dts: mediatek: mt7988: add basic ethernet-nodes
  arm64: dts: mediatek: mt7988: add switch node
  arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
  arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
  arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  24 +-
 .../devicetree/bindings/net/mediatek,net.yaml |  64 +++-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  20 +-
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |  11 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  86 ++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 285 +++++++++++++++++-
 7 files changed, 497 insertions(+), 12 deletions(-)

-- 
2.43.0


