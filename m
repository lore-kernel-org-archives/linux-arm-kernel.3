Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE949CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fPJtDEet4RE6KaO4E+4C8FkxyWVGuKa6Vq/LffNt8Ik=; b=HseFew6YlmKP9DWHPV9pevihFX
	cW7OkAxCxFiiE7e3K0gnzcKIzrx9dbJmAUOOZrfBug5nuAvfWofAkDTbZKj3QhSdgDs6MkCkGCXEe
	+qLyqwpcVV5Yqh2Oy7ze2MzJ/n4gzzXCYrvzYF09no5WpwJPttd3205tGNXM26Ew1Fgz90aVB9vUf
	ALqvhGOXK3hXDNN87/5Fo8ymQlJIyXFn+X3UfYyepld72caDqqTM5fAK9lPCxQVQo291exB9dsc5L
	jdYOfAHZEkIyLwcw+IhA61E7G1Wze/ZMY0H9xRU0QJu2Il3/tES+dyPTEZIPIgOXwKjQIqEJw8qGc
	PB02zpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P5R-0000000516U-2ykV;
	Thu, 16 Oct 2025 14:36:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P5M-0000000515c-1atT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 14:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fPJtDEet4RE6KaO4E+4C8FkxyWVGuKa6Vq/LffNt8Ik=; b=Mk3o5Xnu0mfRYLBKtACPEes6a+
	3VEONcD3uGAgNcGuHxPUkokzCoRNJwBQjum9MbMk/RaO9G408ufGkWyq/dY4qtsvlko5X6rIYxygR
	UJ+vsvGoiyMBMJi1YZkQO9aj07bhYwUpqLtuGP9WFzPfYwOirgrcjpiayEH5UmhBPG4wQav10R9jd
	25iZmbaQ0dIHkpGlbRpSLbCbPnBjIhQmx97XVSDu047cpAFKzFdG/J71Uxw/7JsKJMjZT8pROJZI+
	QIIWmdtkTUmSO+Pw6nuJ4AUrguR+GNyKBDEsv7pxW5sRNOyI8PiIgaS96cNv/Mc0UunOPlLT+n5fZ
	PHWMshLQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33188)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v9P4o-000000006PA-1sUg;
	Thu, 16 Oct 2025 15:35:34 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v9P4c-000000003LK-0iHI;
	Thu, 16 Oct 2025 15:35:22 +0100
Date: Thu, 16 Oct 2025 15:35:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
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
Subject: [PATCH net-next v2 00/14] net: stmmac: phylink PCS conversion
Message-ID: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_073608_580451_0D8105A6 
X-CRM114-Status: GOOD (  27.88  )
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

This series is radical - it takes the brave step of ripping out much of
the existing PCS support code and throwing it all away.

I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
flag with Bartosz Golaszewski, and the conclusion I came to is that
this is to workaround the breakage that I've been going on about
concerning the phylink conversion for the last five or six years.

The problem is that the stmmac PCS code manipulates the netif carrier
state, which confuses phylink.

There is a way of testing this out on the Jetson Xavier NX platform as
the "PCS" code paths can be exercised while in RGMII mode - because
RGMII also has in-band status and the status register is shared with
SGMII. Testing this out confirms my long held theory: the interrupt
handler manipulates the netif carrier state before phylink gets a
look-in, which means that the mac_link_up() and mac_link_down() methods
are never called, resulting in the device being non-functional.

Moreover, on dwmac4 cores, ethtool reports incorrect information -
despite having a full-duplex link, ethtool reports that it is
half-dupex.

Thus, this code is completely broken - anyone using it will not have
a functional platform, and thus it doesn't deserve to live any longer,
especially as it's a thorn in phylink.

Rip all this out, leaving just the bare bones initialisation in place.

However, this is not the last of what's broken. We have this hw->ps
integer which is really not descriptive, and the DT property from
which it comes from does little to help understand what's going on.
Putting all the clues together:

- early configuration of the GMAC configuration register for the
  speed.
- setting the SGMII rate adapter layer to take its speed from the
  GMAC configuration register.

Lastly, setting the transmit enable (TE) bit, which is a typo that puts
the nail in the coffin of this code. It should be the transmit
configuration (TC) bit. Given that when the link comes up, phylink
will call mac_link_up() which will overwrite the speed in the GMAC
configuration register, the only part of this that is functional is
changing where the SGMII rate adapter layer gets its speed from,
which is a boolean.

From what I've found so far, everyone who sets the snps,ps-speed
property which configures this mode also configures a fixed link,
so the pre-configuration is unnecessary - the link will come up
anyway.

So, this series rips that out the preconfiguration as well, and
replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.

We then move the sole PCS configuration into a phylink_pcs instance,
which configures the PCS control register in the same way as is done
during the probe function.

Thus, we end up with much easier and simpler conversion to phylink PCS
than previous attempts.

Even so, this still results in inband mode always being enabled at the
moment in the new .pcs_config() method to reflect what the probe
function was doing. The next stage will be to change that to allow
phylink to correctly configure the PCS. This needs fixing to allow
platform glue maintainers who are currently blocked to progress.

Please note, however, that this has not been tested with any SGMII
platform.

I've tried to get as many people into the Cc list with get_maintainers,
I hope that's sufficient to get enough eyeballs on this.

Changes since RFC:
- new patch (7) to remove RGMII "pcs" mode
- new patch (8) to move reverse "pcs" mode to stmmac_check_pcs_mode()
- new patch (9) to simplify the code moved in the previous patch
- new patch (10) to rename the confusing hw->ps to something more
  understandable.
- new patch (11) to shut up inappropriate complaints about
  "snps,ps-speed" being invalid.
- new patch (13) to add a MAC .pcs_init method, which will only be
  called when core has PCS present.
- modify patch 14 to use this new pcs_init method.

Despite getting a couple of responses to the RFC series posted in
September, I have had nothing testing this on hardware. I have tested
this on the Jetson Xavier NX, which included trial runs with enabling
the RGMII "pcs" mode, hence the new patches that rip out this mode. I
have come to the conclusion that the only way to get stmmac changes
tested is to get them merged into net-next, thereby forcing people to
have to run with them... and we'll deal with any fallout later.

Changes since v1:
- added Andrew's reviewed-bys
- added additional comments to patch 3, 11 and 14.
No code changes.

 drivers/net/ethernet/stmicro/stmmac/Makefile       |  2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h       |  5 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  6 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  6 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 65 ++-------------------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 66 ++-------------------
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 25 +-------
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  4 ++
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 68 +---------------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 24 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 47 +++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 23 ++++++--
 include/linux/stmmac.h                             |  1 -
 15 files changed, 104 insertions(+), 245 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

