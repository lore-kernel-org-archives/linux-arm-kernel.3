Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3590C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DOjKltCz1QNVwOIoEShbQiGKzqPC0dP5/3g+O8TKjp0=; b=3Fi8qZGIt2uBA91RjrUlo9A1ge
	eQL4br5XBcm/GKkEnE7Fc0ha6yJNBxXA/LDMIATT00sb+mQWdVhRjq91vkOAaSTrLlEUXs0vtr6wt
	Dv06ORO2AKEvmk1QzacCVOLJexRbwUdD5mdDP5q7Ccc0UfVlSZP9XOdT0BsPZ1bNGGVFV5bVVKGgw
	bK6auM/RgUt8MskTGNPsxsD4eLhuiqRYqDh10cDUH9UilPOeDHIU1nmQRnPfbdVJZX9jX99crfg4a
	XECwQQGYe8Dz+H32dLPgqsdydxhuvfSIacKyOIEtd8yowlEOfh5Bk/ekZRG1tY1X82u1u9E7uNVW0
	f6XGSwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4M7n-00000002heF-1Rcd;
	Mon, 14 Apr 2025 15:53:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4M5r-00000002hLF-2yXp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 15:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DOjKltCz1QNVwOIoEShbQiGKzqPC0dP5/3g+O8TKjp0=; b=PcXZCXdbGGiG4woiG67mKrNeg6
	SIYWqpQjaE7qfLvDSK+hNYZDmZwySIWvwbbRvvxoA7+5bVHE3A6H/Ncgg8XtnnxjOuZxDFGDxugX0
	Dpr2I2T6V5Hu05lFmPP32g2UmEFhgpn3SsjDdFw2UrnzyRZpUR2lW4EH4iuhCdf3nirJb+FT+XIZ2
	5QKA41xIB1Yo6WOAUuLrSG0eV9oo55BQ93gq/WxjidY5u3pyTalFwrcMW0vb6oza8fN01+OO7vC+X
	Ermi3eIhqanEdJYrjKZHETEtiBKnyi7hR5+ivf7QPyhxhpGkIcb/6A8JtuL4g7dHbV9ddcQLSYPsB
	3z59kyYA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34436)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4M5j-0006nt-2b;
	Mon, 14 Apr 2025 16:51:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4M5e-0007sk-10;
	Mon, 14 Apr 2025 16:51:18 +0100
Date: Mon, 14 Apr 2025 16:51:18 +0100
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
Subject: [PATCH net-next 0/2] net: stmmac: ingenic: cleanups
Message-ID: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_085131_747896_A81623C0 
X-CRM114-Status: UNSURE (   6.80  )
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

Another series for another stmmac glue platform.

Convert Ingenic to use the stmmac platform PM ops and the
devm_stmmac_pltfr_probe() helper.

 .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 46 ++++------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

