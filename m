Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8662EFCD70
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ten1uDei4vcUNTz7WaFaOkJ2TgTa4kazv/d2FQhK9d4=; b=YLiHU5VkS3evTSr/PsKtoeS6lX
	JdtrcKxsArtsyXuPgPKYiXATlo83EzRpftgQ7F2v9Lt5CxpyLCu3GDFjoidA4Y2Gc2D8aNpk8K9VT
	gnFVcE3pKP2SFMT9pCb4STCjkUsyexfls3jYK1LV024cAlMqExJ5fTZrBzkunpGYD2jY/xVt6UATc
	Dk+CbApHU7f9XR0EGAVnVBZZJi2uHg0Dh051q4JbktIRo2ORPV6MSp7Qj8YR+iC3r9xF/yMquPe8G
	/ayvm+xXsAJGWrE2H6sIjtOLQejunJCNaAAYWv3aZPwPzDzzno3KguZPO+DEcFOsedaeP4p1s7aCI
	C8QpsYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX4i-00000006z29-0vf5;
	Mon, 09 Mar 2026 09:38:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX4f-00000006z0w-0kT6;
	Mon, 09 Mar 2026 09:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ten1uDei4vcUNTz7WaFaOkJ2TgTa4kazv/d2FQhK9d4=; b=XNO7P4n+74b32BXj8s7Erkc6iR
	C0gpgQ3CyJ/fgq5hADmRh8qc0DZ0ocPWj9/+H2R2K6aahQIQY3QGcjHPlpT5S+gsPrwlQ0dGegv7n
	qUb6c30OGZObfNHJgOh6lMlcnGBE7UpxUu6sWBr/fRAMdd3VTHiNLGVqh6VYvY9L0fYrIhq0peczM
	PRu0+AvWHLy/Xxojy3sws3OFrXBGpJLh7gNwGVXAfgIP7PS7oFtxA4v8/o/FFi/bSHhCODOMtvckY
	WrTniwza8Q9I7GAp99vMPoeGwgAIKWcHUJa05F/iQQR0usv09krwDaD+q90alxeh2zCCSbBsWVkG8
	KKWQrpbg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56676)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vzX4L-000000003TL-1Y7v;
	Mon, 09 Mar 2026 09:38:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vzX4E-000000004CG-0wpW;
	Mon, 09 Mar 2026 09:38:26 +0000
Date: Mon, 9 Mar 2026 09:38:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next v2 0/7] net: stmmac: start to shrink memory usage
Message-ID: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_023853_214573_1BD41667 
X-CRM114-Status: GOOD (  10.98  )
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

Start shrinking stmmac's memory usage by avoiding using "int" for
members that are only used for 0/1 (boolean) values, or values that
can't be larger than 255.

In addition, as struct stmmac_dma_cfg is approximately a cache line,
shrinks below a cache line as a result of this patch set, and is
required, there is no point separately allocating this from
struct plat_stmmacenet_data. Embed it into the end of this struct
and set the existing pointer to avoid large wide-spread changes.

Lastly, add documentation for struct stmmac_dma_cfg, and document
the stmmac clocks as best we can given the driver history.

v2:
- fix error in commit message for patch 5
- fix typo in comment in patch 6

 drivers/net/ethernet/stmicro/stmmac/common.h       |   4 +-
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   6 +-
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |   8 +-
 .../net/ethernet/stmicro/stmmac/dwmac-motorcomm.c  |   4 -
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c  |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   4 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 227 +++++++++++----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   |  11 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  43 ++--
 include/linux/stmmac.h                             |  93 +++++++--
 23 files changed, 239 insertions(+), 200 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

