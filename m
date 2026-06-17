Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C83CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8P7vXNq4wkq1xDq5yQzXyrqbp4ldFR6VhF8iMgSEOp0=; b=LyQE0gjMMLIJWoXTJ84KzIqBOm
	cOR7ntrGUQ9orsMJEOWd/PI4UHUrdNsbwvqNqUJKejFH8zabcE1qsZVi4ZY9vDlJZ2YpuWnr2mu6A
	uHe+htEFQl2bXsknIIgRSuw2PrTzcLGUebEJcfHyioqFC4xM+wOcsYQ8VhPCKcFJOpz/QzIZN0Rro
	vNLsWK+NMrRAOM0n1jnrkMtSdNkDpXk9xd9jZKO7biIxYDlu5TwWV7qbz+IrTEeD9R7DZ5wnT3gus
	ZVhsZt3Zyj2uiS5E9fKXitc03y9UFE9lgKoLPO+si0pV6aIZ5YLRmh+MBrHjntnaikyW2jWMBK3tA
	GxTOwT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpqm-0000000HNO6-3jcK;
	Wed, 17 Jun 2026 12:58:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpqm-0000000HNNk-1HrY;
	Wed, 17 Jun 2026 12:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15B3843A3B;
	Wed, 17 Jun 2026 12:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEAA3C2BCB0;
	Wed, 17 Jun 2026 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781701116;
	bh=iK2ZWTSF7L93Etn4Phm9syUtj0nmrXOQvs6fpSsNjdo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uFVnfYIw44Rju20GmDv1agE2BQdk0vOcHXQnRiklAoydXPbuMS0bVKDvnT2o1+qpG
	 GxvB9qiojRisB0rTz6u5bpW0buwedz6XNYmGPCooWYEd02T6BU0MgqMC1XsrUYjtmf
	 O6Jegj346CF6Qm3CVvtn/tOcJQ0bS5PLUWIk7K/NNN60eguudEUYGs5aV00cZIUmAQ
	 rC+BUWpWq+YRGHvXnC81lEnI516lXi7Pewh1Md44UKvErmRkMd8RlfJGJf26fNylYN
	 PdnlFR7DkRWdyD4VHr6nCAYmwBTJOz6p3+72yDLIkAZ5+qz1Yzx1UxoZuUqll9F6vE
	 jIEbQ67r9538g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC79CD98E2;
	Wed, 17 Jun 2026 12:58:35 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH v4 0/3] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
Date: Wed, 17 Jun 2026 14:58:27 +0200
Message-Id: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTU7DMBAF4KtUXjPIv7HTFfdALCb2hAxUaWWbC
 FTl7jhFCASbLN/o6XtzFYUyUxHHw1VkWrjweW7B3h1EnHB+JuDUstBSd9JpC/nVuBAg1QK5noD
 qBIlKzDxQOwKeGAtERUkFP/jopGjUJdPI77eZx6evXN6GF4p1s7fGxKWe88ftj0Vtve9Jt29yU
 aAAuzEmdJ3B6B8umBPPfD9TFdvoon+z/U5WgwTbeym1Dcqa8T9rftgG72RNYwOG4Pxg+oR/2HV
 dPwFlosSemgEAAA==
X-Change-ID: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3702;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=iK2ZWTSF7L93Etn4Phm9syUtj0nmrXOQvs6fpSsNjdo=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqMpn4fSKiL6WLMJiO4lZ7wl5/feW3yruuYoEgB
 W04aHyAtzaJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCajKZ+BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7emxXwf/e94Y0R4VyLNLAv8lziyAVCXu4rrDeRG
 WPGnCHi0bhGdF/Yd1WZZoEHaNBvOA6eHWv8S3mRRHu42gd/nb9JWavMEVrRls1/loicvt5Xx7c2
 5bEfo7vMHQ3+IcP6haGXT487ZV31xbthuA3kqGdCNCT5Wr4YFXVoFKPOKnmhgHLb7R0u74OpAqe
 s9fW4Kt9/ffhqWcthbG9OX3XrKxrsJAmbAhpHqsyBK3+EwUaucMFZo5dVQuKjUaCn1zMwWMtKfQ
 a4GpYWcg/a2lky/qb0AVe8C2pAfI4x7bRO5dW6HWJSdVyBGoyHCg/gt7PSmHA/QZFHHMP1GIRm4
 80pmFQzWo6A==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
NICs whose PCI function nodes are not described in the DT. Describing
them allows for stable ethernetN aliases (matching the GMAC alias
convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
inject mac-address properties from its ethaddr/ethNaddr env, so MACs
stay stable across boots and U-Boot and kernel MAC match.

Patch 1 adds a DT binding for Realtek RTL8125 family PCIe Ethernet
controllers.

Patch 2 describes the on-board RTL8125 function nodes on the
FriendlyElec NanoPC-T6 (and variants).

Patch 3 describes the on-board RTL8125 function nodes on the Radxa
ROCK 5B / 5B+ / 5T family done based on lspci output provided by
helpful Armbian folks.

---
Changes in v4:
- binding: simplify the binding YAML ref Sashiko's and Krzysztof's
  reviews
- binding: describe only the RTL8125 + rename to match ref Heiner's
  review.
- dt: fix the bus-range according to Sashiko's review.
- Link to v3: https://patch.msgid.link/20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net

Changes in v3:
- new patch: add a DT binding for Realtek r8169 family PCIe Ethernet
  controllers, per Sebastian Reichel's review (the "pciVVVV,DDDD" OF
  spelling still needs a binding when used in a board DT).
- new patch for Rock5 series, and include a brief rationale in each.
- retitle the series, since it now covers a few boards and a binding
  rather than just DeviceTree changes for the NanoPC-T6.
- drop the v2 "rename vcc3v3_pcie2x1l0 regulator" patch from this
  series; it will be sent separately as it is not relevant to this.
- Link to v2: https://patch.msgid.link/20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-0-49700248143f@pardini.net

Changes in v2:
- fix: pcie2x1l0, not pcie2x1l1; indirectly caught by Sashiko's review [1]
- while-at-it: rename regulator vcc3v3_pcie2x1l0 to l1
- Link to v1: https://patch.msgid.link/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7@pardini.net

[1] https://sashiko.dev/#/patchset/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7%40pardini.net

To: Heiner Kallweit <hkallweit1@gmail.com>
To: nic_swsd@realtek.com
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>

---
Ricardo Pardini (3):
      dt-bindings: net: add Realtek RTL8125 PCIe Ethernet
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPC-T6
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on Radxa ROCK 5 family

 .../devicetree/bindings/net/realtek,rtl8125.yaml   | 43 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 +++++++++++++++
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 15 ++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 18 +++++++++
 5 files changed, 107 insertions(+)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



