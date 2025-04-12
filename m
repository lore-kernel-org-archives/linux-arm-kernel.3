Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0495EC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 09:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=73zpcZNzKe8FYfTe+3EaL4lfP342rNv4xALU1Mdg9ZI=; b=p490a4dScVwlf3p+5kjRDWI8R+
	CX6YWnommfTV2rBOfZaI2FV0qZ3MRLnYW7UwIJXlpYLP2cLFPFREwXm1yG2bYu1sr5tLbLQH/kpCc
	OqOJOH//CW+/IjRDr5wE0T97LoDgyKK21NEU9gm2KdJz1UuRZlqZgRMKHkltr8a0qKEQ76tg9x3WP
	wpYPK4kAC/i89vOM6jOyQdzgR4X/EvDOoDKqFSV2zQbVS6f/rgWTbwzHFxjqodRonbO+D4StHPOaK
	dPfmhCn2lC1igQcI+4iptVnYCdw2oVB7ZfvtYzUqR9MkJOlIRAsPk2mfvvNSpou+1bXkQOARZGkum
	b1j8Rz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3XIN-0000000Fip9-0ruu;
	Sat, 12 Apr 2025 09:37:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3XGW-0000000FigA-3yOU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 09:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=73zpcZNzKe8FYfTe+3EaL4lfP342rNv4xALU1Mdg9ZI=; b=k0KAIMTnhYWnkciA3DJxXWVNqJ
	8cAMrVPgalWOqaiY5qYM13rKcaMn3IzWJrGZG72VO8QuZL3YZVzjY2h4nTp0diSeYT14aEvWxjdAK
	TaansuIYENUC6QqjdfHH4SAIbndzr1jDW3wtghGXt8bNpZk3zGYt/CG7/fuHgNUryHrk0LM+5Agl5
	/RdGzml4jqvR+tW+xi8qb/HnyGeMdq9tkHgmptIiqynbMJJx0qMphLii7hHpnarZCzpAXMmsyrByR
	0ghvTQZSlp1QGZozy6iG38tJBEJYFwzTq1H8cUm1TuVK2VzPU4PNRj+pJgpPwni4AJ9S0HMNwQZR6
	cj4Mdd8g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43880)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u3XGM-0004QK-0B;
	Sat, 12 Apr 2025 10:34:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u3XGG-0005Yi-1k;
	Sat, 12 Apr 2025 10:34:52 +0100
Date: Sat, 12 Apr 2025 10:34:52 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next 0/3] net: stmmac: fix setting RE and TE
 inappropriately
Message-ID: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_023508_990152_587FBAE6 
X-CRM114-Status: GOOD (  11.04  )
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

This series addresses inappropriate setting of the receive and transmit
enables in the GMAC control register identified back in
https://lore.kernel.org/r/Z8BboX9RxZBSXRr1@shell.armlinux.org.uk

The databook is clear for the receive enable, that this should not be
set until the initialisation of the MAC and DMA has been completed.
The previous RFC patch series ("net: stmmac: fix resume failures due to
RX clock") which moves phylink_resume() solves that, but we are left
with these enables being set when the link is down. This is not correct.

Sadly, when XDP support was added, new calls to netif_carrier_on() and
netif_carrier_off() were added, which are incorrect in drivers that
make use of phylink - by doing so, the driver has no guarantee that
the .mac_link_up() and .mac_link_down() methods will be called in
sequence anymore. This is fixed in patch 1.

We remove manipulation of the RE and TE bits from the start_tx(),
stop_tx(), start_rx() and stop_rx() methods for each core.

Finally, we remove the stmmac_mac_set() call from stmmac_hw_setup().

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  8 --------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 12 ------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 17 ++++++-----------
 3 files changed, 6 insertions(+), 31 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

