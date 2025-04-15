Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2ABC369B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 05:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kVuF3/DNXF3QjN/z8vNYlHmSLMpNtBoaruzQNxSDhrk=; b=3HCo4BXxTxyzY/dah24bMR/TLT
	ilubi8FX1HILDMSlXbdggHxgkpKnCnsm75nn7/Pxfk8M2CfwKadZEOeNnT1zEuIh6k64IwtFN2XAN
	6qgQD+bOWHRywYRunFz/kvCvDELHfTQfFR143oQVIpX1eVSW9dKDKixnKYCzVHnNqg+FjYH6aZYHB
	3u2fc02HUry85MiBr9UQ13p/IyDEaE+ctI1PIBhmCIq/JjzVlnTQWbqmP3oDZoLQZWLhfXv80p+87
	9JjIEY2ji7xj1ItfXhLpu8jvzKjt7mltq5gffuEGGmEJfNwnKuNZhwLernZVFVnU/VyzTovd9Zo+3
	BQ/gDfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Yvw-00000004Z7l-3bor;
	Tue, 15 Apr 2025 05:34:08 +0000
Received: from mail-m49224.qiye.163.com ([45.254.49.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YhN-00000004XJw-2sSe;
	Tue, 15 Apr 2025 05:19:07 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e6d9647;
	Tue, 15 Apr 2025 13:18:58 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Frank Wang <frank.wang@rock-chips.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Johan Jonker <jbx6244@gmail.com>,
	ulf.hansson@linaro.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Yao Zi <ziyao@disroot.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	linux-watchdog@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Jimmy Hon <honyuenkwun@gmail.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/7] rockchip: Add rk3562 SoC and evb support
Date: Tue, 15 Apr 2025 13:18:48 +0800
Message-Id: <20250415051855.59740-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkseVk8dTEpJT00eQ0xLTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0hMVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9637e2e37803afkunm11e6d9647
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogg6Fjo5CDJNLBopGgwjCjg3
	CDMKCT1VSlVKTE9PTUJPSE9JT09KVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQU9JSEw3Bg++
DKIM-Signature: a=rsa-sha256;
	b=aqgjzf0YeZvYGty2CdsOQnp7mCSRn3ztKgzIpqn882Rkfvdv/XFgXiMTPO8h/TNVg0DJDZO+Xd5aJp7UieaQKqUZiD5gaAaEPOpbmP/J4xAgK0kxtGFaVaAdYbjnM69LaA4Qgln+GGUQSg+yxD20zafuuF/Xwow3Vag5PLsWcMA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=kVuF3/DNXF3QjN/z8vNYlHmSLMpNtBoaruzQNxSDhrk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_221906_430001_7ED95D56 
X-CRM114-Status: GOOD (  14.30  )
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


Patch series V4 remove patches already landed, and remove dts nodes for
modules still under review.

This patch set adds rk3562 SoC and its evb support.

I have split out patches need driver change for different subsystem.
And all the modules with dt-binding document update in this patch set
do not need any driver change. I put them together to make it clear we
have a new SoC and board to use the new compatible. Please pick up the
patch for your subsystem, or please let me know if the patch has to
send separate.

Test with USB, PCIe, EMMC, SD Card.

This patch set is base on the patch set for rk3576 evb1 support.

V3:
https://lore.kernel.org/linux-rockchip/20250227111913.2344207-1-kever.yang@rock-chips.com/
V2:
https://lore.kernel.org/linux-rockchip/b4df8a73-58a2-4765-a9e4-3513cb2bc720@rock-chips.com/T/


Changes in v4:
- Collect ack tag
- remove gmac and otp nodes
- remove gmac nodes

Changes in v3:
- Rebase the change base on rk3576 pcie patches
- Collect reveiw tag
- Collect the Acked-by tag
- remove i2c/serial/spi alias
- add soc node

Changes in v2:
- Update in sort order
- remove grf in cru
- Update some properties order

Finley Xiao (2):
  arm64: dts: rockchip: add core dtsi for RK3562 Soc
  arm64: dts: rockchip: Add RK3562 evb2 devicetree

Kever Yang (5):
  dt-bindings: PCI: dwc: rockchip: Add rk3562 support
  dt-bindings: watchdog: Add rk3562 compatible
  dt-bindings: rockchip: pmu: Add rk3562 compatible
  dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
  dt-bindings: arm: rockchip: Add rk3562 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../bindings/pci/rockchip-dw-pcie.yaml        |    9 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  488 ++++
 .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1263 +++++++++
 9 files changed, 4126 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi

-- 
2.25.1


