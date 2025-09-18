Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF6ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YVvS8Kt6a9vBqageSllDdXFhQGD8Nfq6ozb8zY6FSk4=; b=2iyUJ0Yiu56SMDHFG/VLAR70CZ
	sqZ8QbVRWpUg/k5WhnRDq6CmnOKVhfCTwrkbUGE2kraHfsj1rImZmDlsUAOPXISilQnDsjKu38oMX
	D0s2BiK06rrlwd58h1+K5O/GEIDhn90l1Q+TJEp+7b28eA3i4DoaJesPCAmR0JG2ApgvqCMBmHCC2
	EfjSm/eSBhdS1Gf1tJh/syzTRpnex17iq8wuoGySBGOdVBqyiIAZfRTl9qcJvVQolaGN+H6q9ShMB
	ENExBcww5ft5EtKvkHeoPCxenm4XKpbHnYx7+ACtQaIoZWp8tyds8qv0CP5Ry9b1in8n4Y2Uv107N
	8OnTSMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGbW-00000000OLI-0DFN;
	Thu, 18 Sep 2025 15:31:26 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGbT-00000000OJL-2nPP;
	Thu, 18 Sep 2025 15:31:25 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E4EEE2649D;
	Thu, 18 Sep 2025 17:31:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id admD6bqCwlFv; Thu, 18 Sep 2025 17:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1758209480; bh=kNhbnaZz9O0F4p7ucRW4mmMBjCu2zNDrBJriaH3FC64=;
	h=From:To:Cc:Subject:Date;
	b=Er0/+4DATvWq8LChdwoWUu4mCOryZT0oVFxIIV9N4ORORc2hW2iXF8uGNqcFSK2BD
	 4f5fLcc/z2HhRuYUbFvmUR8ppmQ+CkQJKwcUQyidSml1Cf8JIlg3DhFvBvWkARDR9g
	 2j1glEPrNCp5c01KvUQFG45oMHMgu89NFBGV185kUGUrUrFFrZoCsbYcEZTBTYxGp2
	 sJhRH6jt1bfYjMt8H7ZBuQBuPRNwMVwpSSOm3zMmAo+mLL/Msqy16k86jO3t2hPkpv
	 G5HaGRQLY/mWxXcj2vr0eJ2go4fpyTtNmsf0A8jUqEZftedcneQYkayFHuKl802qZD
	 aNdpRxAfMA25w==
From: Yao Zi <ziyao@disroot.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 0/3] Add PCIe Gen2x1 controller support for RK3528
Date: Thu, 18 Sep 2025 15:30:54 +0000
Message-ID: <20250918153057.56023-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083123_836446_F113FE6F 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

Rockchip RK3528 ships one PCIe Gen2x1 controller that operates in RC
mode only. The SoC doesn't provide a separate MSI controller, thus the
one integrated in designware PCIe IP must be used. This series documents
the PCIe controller in dt-binding and describes it in the SoC devicetree.

Radxa E20C board is used for testing, whose LAN GbE port is provided
through an RTL8111H chip connected to PCIe controller. Its devicetree
is adjusted to enable the controller, and IPERF3 shows the interface
runs at full-speed. A typical result looks like

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec    0             sender
[  5]   0.00-10.01  sec  1.10 GBytes   941 Mbits/sec                  receiver

This series is based on next-20250917, thanks for your time and review.

Changed from v1
- Collect review tags
- SoC devicetree
  - Drop redundant PCLK_PCIE_PHY clock for PCIe node
  - Use 32-bit DBI address, adjust SoC ranges property and reorder nodes
  - Align cells of reg and ranges properties
- board devicetree
  - drop redundant pinconf pcie_reset_g
  - Add missing vpcie3v3-supply
- Link to v1: https://lore.kernel.org/all/20250906135246.19398-1-ziyao@disroot.org/

Yao Zi (3):
  dt-bindings: PCI: dwc: rockchip: Add RK3528 variant
  arm64: dts: rockchip: Add PCIe Gen2x1 controller for RK3528
  arm64: dts: rockchip: Enable PCIe controller on Radxa E20C

 .../bindings/pci/rockchip-dw-pcie.yaml        |  3 +
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 12 ++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 56 ++++++++++++++++++-
 3 files changed, 70 insertions(+), 1 deletion(-)

-- 
2.50.1


