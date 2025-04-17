Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC20BC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZomCEYUh4rjq0ptDxJtUhMsfqwCF7A2KJ07pH99EdY0=; b=ajFOwK/eqW1if18/jzxhOIYNP6
	k2pH09HeMiyrXBfCSXWo45Af4yPSjVOqqqKjcHG9h68dPJ64/Ce/UNWPk1RbIfQYXNvKTsXDJ7x0o
	iXZiA7woHeiCSm58M/Ak4D9/O2iw4te1+fn8vKI35nuf8ikILuhYgdiprXwy7/Xk6zD31YHI6dQa2
	uOFeruWd63SfH4inTXy//lzsMc81x5LYqlpxHIOWrJ4kyoUf86u1E81IRWQhXRp07I4eWdOkzrz22
	H5YYyI/Wyde8qQt39+zcOKXyzhUA1u0mtPu3DvmhdzSA6YWILEMAZPxMCBWI/UYrCV4+2pvsJFCuE
	Mrd6pokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5T4Y-0000000Dr31-44eB;
	Thu, 17 Apr 2025 17:30:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Snv-0000000DnN8-0ybO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZomCEYUh4rjq0ptDxJtUhMsfqwCF7A2KJ07pH99EdY0=; b=izM0g8vSWwufEyG5SWarbIebxk
	I/OVmx9UlBhZSqaYFVpr75u5SHUBGxBLliZuDD9PrCmsxFG92vJdIGxm1lAqnGQk17FSvtb9VuZBt
	bSZgaTA66Zy8ctTAP6x/PJnquXVznkP1t38RN5Uz9HeE/llCGzoPoNU5O7+Ns0ysHJO2Ts/+biYRc
	C2E9D5w0+SwC507xnfCM77aSmPnDTAZu4ZBWL16XCAfQ2ME1kANgnBr2/ok+BMX8XLA22dzP9rFwy
	iQiKW8o6MM7Lr+SX0WQ+UVwg+cCn2jV+zNmtvs4JNwkGhTlNRiUQKdm35K7h33Q40xPyEyvK+cW1K
	K1KabXbw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48948)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u5Sno-0007g2-2q;
	Thu, 17 Apr 2025 18:13:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u5Snk-0002cd-1C;
	Thu, 17 Apr 2025 18:13:24 +0100
Date: Thu, 17 Apr 2025 18:13:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v3 0/5] net: stmmac: socfpga: fix init ordering and
 cleanups
Message-ID: <aAE2tKlImhwKySq_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_101335_271438_746C1782 
X-CRM114-Status: GOOD (  12.57  )
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

This series fixes the init ordering of the socfpga probe function.
The standard rule is to do all setup before publishing any device,
and socfpga violates that. I can see no reason for this, but these
patches have not been tested on hardware.

Address this by moving the initialisation of dwmac->stmmac_rst
along with all the other dwmac initialisers - there's no reason
for this to be late as plat_dat->stmmac_rst has already been
populated.

Next, replace the call to ops->set_phy_mode() with an init function
socfpga_dwmac_init() which will then be linked in to plat_dat->init.

Then, add this to plat_dat->init, and switch to stmmac_pltfr_pm_ops
from the private ops. The runtime suspend/resume socfpga implementations
are identical to the platform ones, but misses the noirq versions
which this will add.

Before we swap the order of socfpga_dwmac_init() and
stmmac_dvr_probe(), we need to change the way the interface is
obtained, as that uses driver data and the struct net_device which
haven't been initialised. Save a pointer to plat_dat in the socfpga
private data, and use that to get the interface mode. We can then swap
the order of the init and probe functions.

Finally, convert to devm_stmmac_pltfr_probe() by moving the call
to ops->set_phy_mode() into an init function appropriately populating
plat_dat->init.

v2: fix oops when calling set_phy_mode() early.
v3: fix unused variable warnings in patch 2, add Maxime's r-b and t-b
    to all but patch 2.

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 79 +++++-----------------
 1 file changed, 16 insertions(+), 63 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

