Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A11C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xHYaOtwx99ZZgi8ahq47uLXju4A9RCSm3k3c98E5wYI=; b=MCpb8MbSYgsYe5cYLzkCTTQJbd
	easIbLNneiOrsjKrB1Icljlk8m5KGjM8/T7nPIizmjdpycESS+o2+0Zm1dKam23v6PSKt0DGSg3bX
	yKY1aKBigJsXiYgcP8LKnuE3e4GDPOc9lUq7IfmW3PDI5j2EXnWRoyFEPAVNM++0kw1eMdn66rwZI
	g/Hl/0je9rbBw9G5cVGuaT3eNVZHW33aoOAlbN47nM3joTwjeNeUT4ymIfv92/CMJl94sFsRnXCWz
	oKbOfenxaelBWcZV2C9knwr0QxwHFxIp982Dxg27TZGoFd+1cPhyTlvkz/Xhi4Mgzc7QlfUX3KM3K
	NmS2KkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503r-00000009Add-0AxA;
	Wed, 16 Apr 2025 10:32:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4z7e-00000008z3P-1ZGf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 09:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xHYaOtwx99ZZgi8ahq47uLXju4A9RCSm3k3c98E5wYI=; b=fqDJ91iq7sXU6lG5+Xaf6CZH6A
	xRTvrrlxNWtyH0c+78YyIh/ZgKdsGwXDqxKcb62dNl3rpa2u4PVOMq44XrMNxeDq0BAS5sewyupBv
	QJHCLn6hJC3+UWthihjjaKMeue6noJDORmBJEoYkQo5gaZiKl88jLHNh6oEq8x2rqjKtc2HIaLMQx
	Fw8oHP5hUrolWoM1aZJxm78UJTsWTRa/vbdH4bDsazspygcmU3wajRCkaRZ+afPLHv9QHgdRmjVBE
	1uDMeXdD34KCS1xv4qsQDw19plgleDEDZC+VGKwlGbTHuUANj80pifhtN258zEqqhaMqf3gbmTonP
	k+uTnleQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58106)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4z7V-0000yH-0c;
	Wed, 16 Apr 2025 10:31:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4z7Q-0001Hh-0x;
	Wed, 16 Apr 2025 10:31:44 +0100
Date: Wed, 16 Apr 2025 10:31:44 +0100
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 0/5] net: stmmac: socfpga: fix init ordering and
 cleanups
Message-ID: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_023158_411149_F69D8E77 
X-CRM114-Status: GOOD (  12.31  )
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

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 79 +++++-----------------
 1 file changed, 16 insertions(+), 63 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

