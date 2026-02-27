Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0025FD5323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G4AOdtDSBTVKcUGqRwL58Pt4pHFgHiIpoKmDb5710ZY=; b=JTTEdkE+b9/sgIIsv++cU5sFwF
	OvzYM5MEbX890cIK1yfTs/W5M4TMelukS9hA8qRH9KLPEw9bt1/2OosiQbPDiHt6lG7VhsVc/gk3m
	xWSXDSSu1zYQ8TOQGPPADlLXJVPIvhLY7uyNiJ1UtYAwHOUIHHDXNvKlzacWM5P7vpSwfNUs3s/Ck
	u0eIxB7XNeuaGxG092ZP1xD0e+uhvJuZn0BFa0J6sG0lrCMNEkFzj1XtxC+hBRqPCSWgD3Qs1MDnB
	awdyX92+hkIh7SPlqQJkd9f5fOBAokPJxDZwT0aLrGE9D607JuCK2GNlyNU8YmlcoiQme+Mgx6NT2
	rZD7hvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuWi-00000008Axi-2Vhx;
	Fri, 27 Feb 2026 09:52:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuWf-00000008AxJ-29Kt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G4AOdtDSBTVKcUGqRwL58Pt4pHFgHiIpoKmDb5710ZY=; b=CAHh7uFXnhy7PVKqbwANdh3hnP
	HJFpuvTH9l+NloCx5hJ7jBicJQnI9RpafLAVn0lxbbX/7DkSPzi0+AxOBd6Og0EFekz+tuuvOKidC
	GCU5+FG17cCUzKT1OBx+Tc/2XzSwV4Rz/2IMQC61U65nRev47kaNE4/YdlUq4DPtJDVoGHNT+t5nZ
	CLp+A2awkOrFqDx8CBnkSaeWfHphTx1rlYemr6dqG1di185JbE/SedWEyiJsdwds185H+DCBNdW7m
	zfQ/C+wt+b4CjXBA3xDMiLPK9cpSNXwY5o7/++0/9DbTZdrh3qe7Xwzz9PhFizozbraP20EdQXEvH
	qcgWPQgQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45912)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvuWY-000000000bc-3D2O;
	Fri, 27 Feb 2026 09:52:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvuWV-000000002z1-0ab9;
	Fri, 27 Feb 2026 09:52:39 +0000
Date: Fri, 27 Feb 2026 09:52:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 00/14] net: stmmac: further cleanups
Message-ID: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015249_554116_49EB5976 
X-CRM114-Status: GOOD (  12.24  )
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

Yet another bunch of patches cleaning up the stmmac driver.

We start off by cleaning up the formatting for stmmac_mac_finish(). Then
remove a plat_dat->port_node which is redundant, followed by several
descriptor methods that aren't called.

We then remove useless dwmac4 interrupt definitions, and realise that
v4.10 definitions are the same as v4.0, so get rid of those as well.
We also remove the write-only priv->hw->xlgmac member.

Next, we change priv->extend_desc and priv->chain_mode to be a boolean
and document what each of these are doing. Also do the same for
dma_cfg->fixed_burst and dma_cfg->mixed_burst.

Then, move the initialisation of dma_cfg->atds into stmmac_hw_init()
as this is where we have all the dependencies for this known, and
simplify its initialisation. Also comment what this is doing.

Finally, move the check that priv->plat->dma_cfg is present and the
programmable burst limit is set into the driver probe rather than
checking it each time we are just about to reset the dwmac core.
It is unnecessary to keep checking this. This makes a platform glue
driver fail early when it hasn't setup everything that's required
rather than when attempting to bring the netdev up for the first time.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 19 -----------
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |  8 -----
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 36 +++-----------------
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c   | 18 ----------
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c     | 18 ----------
 drivers/net/ethernet/stmicro/stmmac/hwif.c         |  9 +----
 drivers/net/ethernet/stmicro/stmmac/hwif.h         | 11 ------
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c    | 18 ----------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  9 +++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 39 +++++++++++-----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |  7 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  3 --
 include/linux/stmmac.h                             |  5 ++-
 16 files changed, 37 insertions(+), 170 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

