Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EE4F3C24F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 13:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y07gyMyA+v61AkgAjpiX1Hx/H6h+2ViD5prXyk9P3U4=; b=DsT4ixnM7Cp+A8qgNs0Ol5kbZ8
	Wq6WsWz4BDTRHKsqb6gmIwHssmsdn+6WsB+48MAMnbENBplyDJCLtJ8WXu62qpiQg25gp8dS4AzzL
	S9OASsBVa7laHbVa1VPYdFFSwE5VJt9p6DWJ740Mt5iXj220IEJmJNb29n+o4WbyfwGjfH4s8+bTp
	T0Ic9SCe2IhCoh58OZqGiKgpk0E+3z5fKh7ODjQpVJGi7+CjSorFu3k+yrhBklEu07LLa23oGlTTi
	Zw52hfrOJSZTkqJ5wEG/7SfVNf05H9RkrB4RpE9BMWjVMXmcjivC0gGM8uC8Yfctd71ey6vppZWdl
	KGsH0IGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaVU-00000007Mrz-0wvD;
	Mon, 09 Mar 2026 13:18:48 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaVR-00000007MrI-2dG9;
	Mon, 09 Mar 2026 13:18:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7695B284DD7;
	Mon,  9 Mar 2026 14:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773062319; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Y07gyMyA+v61AkgAjpiX1Hx/H6h+2ViD5prXyk9P3U4=;
	b=GjMOdncYe6alUKv1iGSD8mSIJWw9X7w8G8Tw2F5S3/Wz052nxQrUNbclTyhViUsqFhy8uf
	C6/MKgSsiwk2MpOzEieAkEdUbYEUan9KLAJ6Cj/A/75ZTBzlkw5zTzbhwMs8ovUNnySttd
	v4Ne/HYsA2K1D9If9zwt3WXq5sYb64cYAfkGCj2Po4Pxir1dJVnEiQ0YWEYnSI6RgMB7+3
	YJ9p5GYweAJtS0hxLYE+ynGtr2gH7+YVKrdT3D9pdOwL23NOFYR7xlpuAaPel1K521I8lw
	GCEavo2ObQVrYDX3oPynx9/EjTSt4Ex/t3pyfwxOKJd44gMtMK6MlCYlu9KD0A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjd@cjdns.fr,
	tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@nbd.name,
	ansuelsmth@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/8] mips: econet: Add clk/reset and PCIe support
Date: Mon,  9 Mar 2026 13:18:10 +0000
Message-Id: <20260309131818.74467-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_061845_887558_F0595E9A 
X-CRM114-Status: GOOD (  10.44  )
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

Add clock/reset and PCIe support to EcoNet EN751221 and related SoCs.
This builds on the Airoha EN7523 clock driver and the Mediatek PCIe driver.

Patch 6 is upstreaming of Ahmed Naseef's work on EcoNet PCIe, which was
developed to support the EN7528, but which works equally on the EN751221.

There is also a workaround in patch 7 to gracefully handle PCI hardware
which does not advertize a bridge window and instead always reads zero.

Changes in v2:
* clock/econet,en751221-scu.h drop EN751221_MAX_CLKS
* clk-en7523.c add EN751221_MAX_CLKS
* econet,en751221-chip-scu.yaml drop in favor of using mtd/syscon.yaml
* airoha,en7523-scu.yaml drop redundant example
* econet,en751221-pcie-phy.yaml Refer to PHYs as "gen1" and "gen2"
* pcie-mediatek.c Exclude pcie_retrain_link() when building as a module
* en751221.dtsi "econet,en751221-scu" is not a "syscon"
* Rebase to linux-next
* v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/

Caleb James DeLisle (8):
  dt-bindings: clock, reset: Add econet EN751221
  clk: airoha: Add econet EN751221 clock/reset support to en7523-scu
  dt-bindings: phy: Document PCIe PHY in EcoNet EN751221 and EN7528
  phy: econet: Add PCIe PHY driver for EcoNet EN751221 and EN7528 SoCs.
  dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
  PCI: mediatek: Add support for EcoNet EN7528 SoC
  PCI: Skip bridge window reads when window is not supported
  mips: dts: Add PCIe to EcoNet EN751221

 .../bindings/clock/airoha,en7523-scu.yaml     |   7 +-
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../bindings/pci/mediatek-pcie.yaml           |   1 +
 .../phy/econet,en751221-pcie-phy.yaml         |  50 ++++
 MAINTAINERS                                   |   9 +
 arch/mips/boot/dts/econet/en751221.dtsi       | 114 +++++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   |  21 ++
 arch/mips/econet/Kconfig                      |   2 +
 drivers/clk/Kconfig                           |   6 +-
 drivers/clk/clk-en7523.c                      | 238 +++++++++++++++++-
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 118 +++++++++
 drivers/pci/probe.c                           |   6 +
 drivers/phy/Kconfig                           |  12 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-econet-pcie.c                 | 180 +++++++++++++
 .../dt-bindings/clock/econet,en751221-scu.h   |  13 +
 .../dt-bindings/reset/econet,en751221-scu.h   |  49 ++++
 18 files changed, 821 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
 create mode 100644 drivers/phy/phy-econet-pcie.c
 create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
 create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5


