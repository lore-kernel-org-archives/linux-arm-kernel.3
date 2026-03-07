Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAB6FC9EF4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=142mbsECCtXmYpR3GC+jVCceuUhe350k8xSDlqgPjOw=; b=MNm7UL/SEfDZ2DSg9ZvE2Uo6m4
	8H44VfunaJBGBLbuDs/EURyAhms3bcJOlHRpiOKD5mNE6bEXqS99di7PTfxzw+vmKoTgpT3UftnyH
	x7hd0RVTLDJFlWZStQow1U8iNX++pIQx+HFo4n564x769rH58jsEJYKLFusoKSBy2Mc3X1ldalPMj
	p2K1LMR4wWYb7lOpAQeNjx1r4aisJ5cUdNtxgHXAztb+vlExmAj64FqPJ4KUFLa0mpdhkm01sRcKa
	0qV2OM1SBE0bZDPRuaA233Oi1BLsd0W4m2y8LHz8RSuIs6BOpb+1+knbZBTk5OHYobXvqWGdd4muI
	W20yeEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypQc-000000058NI-1aYU;
	Sat, 07 Mar 2026 11:02:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypQZ-000000058Mw-05Du;
	Sat, 07 Mar 2026 11:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=142mbsECCtXmYpR3GC+jVCceuUhe350k8xSDlqgPjOw=; b=SdgJq7HZDkthwcLffkabiqe7/L
	sVRi0TWbOnfG4FDOdk9YshJkajdUpAuuaBVgEGoVXAkcGqZP9nWrJdUi4ElpaBfBaLYqh568xKrHK
	dAyyfwXh4pXUJHcXZ5+WJ+BqL0QC8AnBGTxtJknaOpbZKPFt+Rgr4nnS0GEZ/x1s+R+OHeZK55PjP
	OoHQvHcCCm9m3LQls+55nAc406l/5NFbNKqAxkYmo9WlNHs0b1jBfDS8vFCKIhhjY0o+fNop32W7I
	yGSGolQz0MYaC7DYfbAdDyv77h00yLcnuGczzIVAhxpiXaSi9UB6KwamL1kDmPLUHXMUOWf0z0KAZ
	jnXoCHPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57216)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vypQM-00000000279-187T;
	Sat, 07 Mar 2026 11:02:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vypQI-000000002KG-0k1L;
	Sat, 07 Mar 2026 11:02:18 +0000
Date: Sat, 7 Mar 2026 11:02:17 +0000
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
Subject: [PATCH net-next 0/7] net: stmmac: start to shrink memory usage
Message-ID: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_030235_087577_C23E3FF9 
X-CRM114-Status: UNSURE (   9.28  )
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

