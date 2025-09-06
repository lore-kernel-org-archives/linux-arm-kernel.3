Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC4DCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wi3dPZQB4Mm62oG1T4i9XvgL99OTrsNH2COs9eKtm6A=; b=4nQ5I/ScnU7absDJEzxb4wxgPw
	Uaysue9MFkYl1mcsEr4kTCJmbJmFRxDuFcfTR8iVJpaXgEM7f7PUB2T5Ta9mZ7OSJ1BW9x4bDrMOO
	+GlkGhH8rkXKg945+QWfO7pAF4RprP9BCxh3uDy5yAkHu9c+2/QR8YogSh//Vht4z+SwnQzZNY9DE
	kO9fSN/+FmA0hcWF0x8/UvvbGdrF/oDk6+tDJtew4k+sqEkf7ct8+NQuZNzGblI40KcDFydseHPsN
	im85/Iwh4IO0Y9xseLvJQYsludnctkCSQ/gfsVOxZnBSfLb5rByBI38LqjKQ3UqvNLkfzyHjcOt2k
	8ycVyJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uutOe-00000007ras-0yTs;
	Sat, 06 Sep 2025 13:56:04 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uutLm-00000007qob-1Gx1;
	Sat, 06 Sep 2025 13:53:07 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EB8DA251ED;
	Sat,  6 Sep 2025 15:53:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qmvn1vWBqIBy; Sat,  6 Sep 2025 15:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757166783; bh=sbSOKYEZAbDsrQxHT2FLZ1m3Ipyvre5ODuB7BBRX+l0=;
	h=From:To:Cc:Subject:Date;
	b=O2oYry+iKtFFPltH0qtByVrCX+rYbXZiwAg4qSZ0EzcCsZu9yTLjYwPNtB2JgMlLf
	 2AN+ZmO/k64owytMybq/ymMxVU7uRXrJu0A+pYlIkszCUdVes8+wN2kHoFAT023X+k
	 QChQ9RTgyZYOV0cNY8y6gjusXNMUTy1ZAlSDjkqXXzU+7bPynaKhTnbJnSnrV6P/Pv
	 CXUy2V2tcj/jup4FHOMQos2C70LzmciNKk9rZHPSdQ5rQ5Op2V09e0nbiPU/MLBUu7
	 NRgUi1JYXjUYP9ZxIHUZdfAI/yyBWiUzijh03oEqfOZJdvxw3s8W7A1dsM+laWMhnD
	 Ko3kweRT53T+Q==
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
Subject: [PATCH 0/3] Add PCIe Gen2x1 controller support for RK3528
Date: Sat,  6 Sep 2025 13:52:43 +0000
Message-ID: <20250906135246.19398-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_065306_756108_761755D1 
X-CRM114-Status: UNSURE (   7.14  )
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
[  5]   0.00-10.00  sec  1.09 GBytes   936 Mbits/sec    0            sender
[  5]   0.00-10.00  sec  1.09 GBytes   934 Mbits/sec                  receiver

This series is based on next-20250905. It's worth noting that
commit 727e914bbfbb ("PCI/MSI: Check MSI_FLAG_PCI_MSI_MASK_PARENT in
cond_[startup|shutdown]_parent()") (already contained in next-20250905)
is necessary for normal operation of designware PCIe IP's integrated MSI
controller.

Thanks for your time and review.

Yao Zi (3):
  dt-bindings: PCI: dwc: rockchip: Add RK3528 variant
  arm64: dts: rockchip: Add PCIe Gen2x1 controller for RK3528
  arm64: dts: rockchip: Enable PCIe controller on Radxa E20C

 .../bindings/pci/rockchip-dw-pcie.yaml        |  3 +
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 17 ++++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 56 ++++++++++++++++++-
 3 files changed, 75 insertions(+), 1 deletion(-)

-- 
2.50.1


