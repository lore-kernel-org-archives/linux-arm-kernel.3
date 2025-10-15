Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8A8CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F8AivNmNX6ytHIHlRjMKoCXQh8wrZGlkylky6XBPiQc=; b=E9gt+0XiOiwTtfs+Yz/0PkHOvE
	9UeI5xPnvpWp0FmhhOOEtfuMdPKpF6rjcK7DPrnGzpRcq+QXzkKOtGR68rRZk6UI6Bqh7Ng44hzu+
	lZZEpV9K7h7coGFOgUGFZCM/pbgEXlDOsqiOWU+jVACDRej/z+/mUA8uFI3TA4aHkMDv1pmjVQTUi
	MOh4f3tjIsTOCHi8PzMkx4ceJZtOhKH7wz827YWglm0CjFoEyDdWqeMWddbdFWKNYhiTcGAKpy2/N
	o50pg22t0kvJlmGcQbzclVAx0jvzJgCaGbcIgG/KwjAZBkAsTZoAk3ZEqU5Rp+BHOcfWKUb/Wx/RY
	mGf5pkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9443-00000002EeP-1oG2;
	Wed, 15 Oct 2025 16:09:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9440-00000002EcX-2jO9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F8AivNmNX6ytHIHlRjMKoCXQh8wrZGlkylky6XBPiQc=; b=JSl3cHHKoZDp+JKzHu7hDUEWlw
	59mlLBmMOXJDVl0p0OuMwUoP6WEKYaTspfWZwwMBcB1GSFJzGee6OMchHlEPUXc+Lkwv9XJfVKUNg
	UGf6+0vAQH0LmaN6JKzr8HupJc5COgTuT1cDtllNsAgs19TaoYZ1SGoZfx18GWaMJGySOgJP0l6iS
	zEVRBEczRTsiwio6cv+4f2ZIO6oFTKf+mWQQQb28D0K7CCA7CD/w2R+hMrUMxEW2L3S6p7iwuabz/
	pgwkwRcKVSp58/aNGiJxOEE05/vwTnZgR2wUivvdpNnLByWxjMWgnksQ654zNpuQYBm+4T0Giptcj
	9BiTBHBw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51416)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v943s-0000000059Q-2LIy;
	Wed, 15 Oct 2025 17:09:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v943n-000000002OD-3sXH;
	Wed, 15 Oct 2025 17:09:07 +0100
Date: Wed, 15 Oct 2025 17:09:07 +0100
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
Subject: [PATCH net-next 0/5] net: stmmac: more cleanups
Message-ID: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_090920_690115_43717420 
X-CRM114-Status: GOOD (  15.12  )
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

The subject for the cover message is wearing thin as I've used it a
number of times, but the scope for cleaning up the driver continues,
and continue it will do, because this is just a small fraction of the
queue.

1. make a better job of one of my previous commits, moving the holding
   of the lock into stmmac_mdio.c

2. move the mac_finish() method to be in-order with the layout of
   struct phylink_mac_ops - this order was chosen because it reflects
   the order that the methods are called, thus making the flow more
   obvious when reading code.

3. continuing on the "removal of stuff that doesn't need to happen",
   patch 3 removes the phylink_speed_(up|down) out of the path that
   is used for MTU changes - we really don't need to fiddle with the
   PHY advertisement when changing the MTU!

4. clean up tc_init()'s initialisation of flow_entries_max - this is
   the sole place that this is written, and we might as well make the
   code more easy to follow.

5. stmmac_phy_setup() really confuses me when I read the code, it's
   not really about PHY setup, but about phylink setup. So, name its
   name reflect its functionality.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 49 +++++++++++-----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  | 14 +++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |  6 +--
 5 files changed, 46 insertions(+), 29 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

