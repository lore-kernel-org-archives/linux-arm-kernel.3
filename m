Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A3FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iCGlt1XjQ6QDZy/H4sRD//zFdvPIbzwJDuXqfDTZWiE=; b=W4J6wh71s7+VvnLn0gW4lh3M1B
	PXvuT3AlYlo1P4R0d5nl9QStUr16kmzkH7Bevbg6F+u73hYg+6PWWimQrDkB2mY5O8/r4hhQ80eJI
	nSoj9L0hLzxpDriXYIqCa3ZuVYXFxdPMXUfN9Z/ZYbevzgciCyjFboo4CD6/fPEwPc4setroQRLVX
	dU5V/s/UDbU8WJ76vWtkbGdwW350DUeYtb530j3BNceWpTsaA85eZPFaBikwaZZvc1CHdousKCGld
	eZuzoB1E2J1KNQCfb0YArdLNap/3KxHS2qBiZEG4HSOLqUUGQ+RiN8sade6PEbuM6jPAVcnq9JUvY
	DlfCyZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKsO-00000007lQD-3BRO;
	Tue, 18 Feb 2025 10:30:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKok-00000007jkl-1x5t;
	Tue, 18 Feb 2025 10:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iCGlt1XjQ6QDZy/H4sRD//zFdvPIbzwJDuXqfDTZWiE=; b=HDZagU0Or4bBEC1KIYcsqJYh/t
	12u8YWrIKHC1A5oUovdwvFi/FDdvMnDe/THtbf4y8XcD/uhvsgSmx07Z5awaA/yoe9v1go+Ipe+IT
	nibmkv8+HhR7rAOoPdjYZLPjl2NKEbaWZNYQLZOqhHuBhthsa1TLSeepcdEV25+msAg1JArMcjnFm
	m4nQ0ZJPpH6E9ebcVHtzpwQsuTk0Ovrq1v7AadIt/WJOeskVT5ktiRN36HRfCg8AZkWl+HXd0wEud
	4SSqtUx3Y5WuUskBrOmfMBdGmCRPDLe+JAb7QZcY0WOUCNRSaqxgkhyIkSY3hZ40tn5pHvizppt9B
	+/cSlsLg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35042)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkKmJ-0001Uw-0C;
	Tue, 18 Feb 2025 10:24:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkKm9-0007B7-2G;
	Tue, 18 Feb 2025 10:24:25 +0000
Date: Tue, 18 Feb 2025 10:24:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: netdev@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 0/3] net: stmmac: further cleanups
Message-ID: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_022706_501925_78DFC54C 
X-CRM114-Status: UNSURE (   8.20  )
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

Hi,

This small series does further cleanups to the stmmac driver:

1. Name priv->pause to indicate that it's a timeout and clarify the
units of the "pause" module parameter
2. Remove useless priv->flow_ctrl member and deprecate the useless
"flow_ctrl" module parameter
3. Fix long-standing signed-ness issue with "speed" passed around the
driver from the mac_link_up method.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  8 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  4 +--
 .../net/ethernet/stmicro/stmmac/dwmac-ipq806x.c    |  8 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c  |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  6 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  8 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  |  4 +--
 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 37 +++++++++++-----------
 include/linux/stmmac.h                             |  2 +-
 18 files changed, 50 insertions(+), 53 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

