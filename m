Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4007ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4qHh0SKCML66MNRzOdx5c40VzjCCEykcjU71IxLqCM=; b=GjxTmE2KEJMEKj7c5LwBDKp1pg
	s21FopiPk21HZFKSVFts0ibyBEKIKhWx4wJpXufZghaJxrLrgmcMMqHA37e3qqrb+WS5DWcMYFHsu
	tPjDAhI+MJu9aiav7hp9URXGbhEOMlFXuZJDWfaFMcLzQecIvStdicZZ8gHYcQpCfhy7USmS027Lt
	hfyYsKREA4WqeYpdHN2j2JfaBDhGA1KcRS/4y2xaJVJaJttgsYl2p9/3oGPDomEooSuVxH9mTKUjr
	aByfEMK6Nf8b0DHNhJs1lbbLLCILJpySOJKOJvhoixHrxiSvLQ7uOLFhN77NrOOGJErRZFqIUI2gB
	/w8Kq8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Mp-00000002rur-2dYJ;
	Wed, 15 Oct 2025 20:45:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Mm-00000002ruA-3bdw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 20:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V4qHh0SKCML66MNRzOdx5c40VzjCCEykcjU71IxLqCM=; b=xZiJDm8GSZk7IPE6k2ZlvGYy09
	2vvPl1kjspU6dp7WSofd+ttfV/tOvvkYU0hleUAzhJnG4MdCF1qKYKhlnRWxZPpp21fQz70SLMpD6
	aoTstzQjDMnFX7EdJNElHgwAfEhll5o+xAOQdNgxV7jcAj0HycPphyzyIpxLIcsAFy4I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98MJ-00B4XL-DQ; Wed, 15 Oct 2025 22:44:31 +0200
Date: Wed, 15 Oct 2025 22:44:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 01/14] net: stmmac: remove broken PCS code
Message-ID: <26d9cccd-2351-483f-a417-03d484fd25a4@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92ME-0000000AmGD-1VsS@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92ME-0000000AmGD-1VsS@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_134501_048090_EA72432E 
X-CRM114-Status: GOOD (  37.92  )
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

On Wed, Oct 15, 2025 at 03:20:02PM +0100, Russell King (Oracle) wrote:
> Changing the netif_carrier_*() state behind phylink's back has always
> been prohibited because it messes up with phylinks state tracking, and
> means that phylink no longer guarantees to call the mac_link_down()
> and mac_link_up() methods at the appropriate times.  This was later
> documented in the sfp-phylink network driver conversion guide.
> 
> stmmac was converted to phylink in 2019, but nothing was done with the
> "PCS" code. Since then, apart from the updates as part of phylink
> development, nothing has happened with stmmac to improve its use of
> phylink, or even to address this point.
> 
> A couple of years ago, a has_integrated_pcs boolean was added by Bart,
> which later became the STMMAC_FLAG_HAS_INTEGRATED_PCS flag, to avoid
> manipulating the netif_carrier_*() state. This flag is mis-named,
> because whenever the stmmac is synthesized for its native SGMII, TBI
> or RTBI interfaces, it has an "integrated PCS". This boolean/flag
> actually means "ignore the status from the integrated PCS".
> 
> Discussing with Bart, the reasons for this are lost to the winds of
> time (which is why we should always document the reasons in the commit
> message.)
> 
> RGMII also has in-band status, and the dwmac cores and stmmac code
> supports this but with one bug that saves the day.
> 
> When dwmac cores are synthesised for RGMII only, they do not contain
> an integrated PCS, and so priv->dma_cap.pcs is clear, which prevents
> (incorrectly) the "RGMII PCS" being used, meaning we don't read the
> in-band status. However, a core synthesised for RGMII and also SGMII,
> TBI or RTBI will have this capability bit set, thus making these
> code paths reachable.
> 
> The Jetson Xavier NX uses RGMII mode to talk to its PHY, and removing
> the incorrect check for priv->dma_cap.pcs reveals the theortical issue
> with netif_carrier_*() manipulation is real:
> 
> dwc-eth-dwmac 2490000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> dwc-eth-dwmac 2490000.ethernet eth0: PHY [stmmac-0:00] driver [RTL8211F Gigabit Ethernet] (irq=141)
> dwc-eth-dwmac 2490000.ethernet eth0: No Safety Features support found
> dwc-eth-dwmac 2490000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
> dwc-eth-dwmac 2490000.ethernet eth0: registered PTP clock
> dwc-eth-dwmac 2490000.ethernet eth0: configuring for phy/rgmii-id link mode
> 8021q: adding VLAN 0 to HW filter on device eth0
> dwc-eth-dwmac 2490000.ethernet eth0: Adding VLAN ID 0 is not supported
> Link is Up - 1000/Full
> Link is Down
> Link is Up - 1000/Full
> 
> This looks good until one realises that the phylink "Link" status
> messages are missing, even when the RJ45 cable is reconnected. Nothing
> one can do results in the interface working. The interrupt handler
> (which prints those "Link is" messages) always wins over phylink's
> resolve worker, meaning phylink never calls the mac_link_up() nor
> mac_link_down() methods.
> 
> eth0 also sees no traffic received, and is unable to obtain a DHCP
> address:
> 
> 3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group defa
> ult qlen 1000
>     link/ether e6:d3:6a:e6:92:de brd ff:ff:ff:ff:ff:ff
>     RX: bytes  packets  errors  dropped overrun mcast
>     0          0        0       0       0       0
>     TX: bytes  packets  errors  dropped carrier collsns
>     27686      149      0       0       0       0
> 
> With the STMMAC_FLAG_HAS_INTEGRATED_PCS flag set, which disables the
> netif_carrier_*() manipulation then stmmac works normally:
> 
> dwc-eth-dwmac 2490000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> dwc-eth-dwmac 2490000.ethernet eth0: PHY [stmmac-0:00] driver [RTL8211F Gigabit Ethernet] (irq=141)
> dwc-eth-dwmac 2490000.ethernet eth0: No Safety Features support found
> dwc-eth-dwmac 2490000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
> dwc-eth-dwmac 2490000.ethernet eth0: registered PTP clock
> dwc-eth-dwmac 2490000.ethernet eth0: configuring for phy/rgmii-id link mode
> 8021q: adding VLAN 0 to HW filter on device eth0
> dwc-eth-dwmac 2490000.ethernet eth0: Adding VLAN ID 0 is not supported
> Link is Up - 1000/Full
> dwc-eth-dwmac 2490000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
> 
> and packets can be transferred.
> 
> This clearly shows that when priv->hw->pcs is set, but
> STMMAC_FLAG_HAS_INTEGRATED_PCS is clear, the driver reliably fails.
> 
> Discovering whether a platform falls into this is impossible as
> parsing all the dtsi and dts files to find out which use the stmmac
> driver, whether any of them use RGMII or SGMII and also depends
> whether an external interface is being used. The kernel likely
> doesn't contain all dts files either.
> 
> The only driver that sets this flag uses the qcom,sa8775p-ethqos
> compatible, and uses SGMII or 2500BASE-X.
> 
> but these are saved from this problem by the incorrect check for
> priv->dma_cap.pcs.
> 
> So, we have to assume that for every other platform that uses SGMII
> with stmmac is using an external PCS.
> 
> Moreover, ethtool output can be incorrect. With the full-duplex link
> negotiated, ethtool reports:
> 
>         Speed: 1000Mb/s
>         Duplex: Half
> 
> because with dwmac4, the full-duplex bit is in bit 16 of the status,
> priv->xstats.pcs_duplex becomes BIT(16) for full duplex, but the
> ethtool ksettings duplex member is u8 - so becomes zero. Moreover,
> the supported, advertised and link partner modes are all "not
> reported".
> 
> Finally, ksettings_set() won't be able to set the advertisement on
> a PHY if this PCS code is activated, which is incorrect when SGMII
> is used with a PHY.
> 
> Thus, remove:
> 1. the incorrect netif_carrier_*() manipulation.
> 2. the broken ethtool ksettings code.
> 
> Given that all uses of STMMAC_FLAG_HAS_INTEGRATED_PCS are now gone,
> remove the flag from stmmac.h and dwmac-qcom-ethqos.c.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

