Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1C310A1E63
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WUPmq1A5eaO109OW3qO6eHS11Ep2OeWicoobVOUG9AI=; b=zU038fnG2OIgZKtTi/6Aa6E8Kt
	V9Dg+iYrMxPXFq7dVfBGYqHmFvDpS4ZHNxVIxsRW7bD/PDY/D52lVp5r6gByvk8G4KFpgn9S7fhSd
	xZrCjJLjPGXIHle4GaoucLtDGgn4PFMt8BF2NQN63ExTZRENmgHjyrRmeTr874yEeBRTzt7axtIfj
	Un6m8lRUmrRozWkkySShrTJnOVeKxeBrbF07qSl8miqWEdAsfWJJGjV1kopNp40LRjjhiLOC0U0du
	I3CwPonUNc+zqFJLe9uVULVN1MXkOej+gzn+VXuHHRkEDYPZ/vVFCevxRM7Av8yXsmdjJxcOuD6wq
	FFpnK99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63ff-000000075pZ-0M12;
	Fri, 27 Mar 2026 09:40:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63fc-000000075oP-3d4o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WUPmq1A5eaO109OW3qO6eHS11Ep2OeWicoobVOUG9AI=; b=fLfbgQ2UujCA7PbAk0yuuAA5t1
	4MTeVFDKsrj8Gcggwihm9v+awDhPb78uHdVsxMyKgunZybO9QMzqEQt3M3bQOKgHCYjAEGgbMYNQJ
	wkHZRW7Ao8lvat74xIMHKZjhNv1WP1nSV6313Af66dsdjdkGcT/f7XbBNF94EwLDrXY2kYfqDxvIO
	I4SEY4ybTwcm/gp0ouGt59m7uQM9xB9uoHqNrpUASlLIGgk6L5c1NUjFXZcaOmKBrh3FYmOzl3fMh
	OADA9lfdW/Hatqz1qHSQnc+5d59ssjRWHssVbskYH8+g6K3v/YiSTUg0iAWFMIoNfB3cyLOeUUWR2
	HC+VcwQQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34894)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w63fX-000000005xG-0JIU;
	Fri, 27 Mar 2026 09:39:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w63fU-000000007wj-3Q70;
	Fri, 27 Mar 2026 09:39:52 +0000
Date: Fri, 27 Mar 2026 09:39:52 +0000
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
Subject: [PATCH net-next 0/2] net: stmmac: fix and clean up TSO/GSO support
Message-ID: <acZQaDeCoib5S5UA@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_024000_905299_91D0E53C 
X-CRM114-Status: UNSURE (   8.18  )
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

This series:

1. moves setting priv->tso from stmmac_fix_features() to
   stmmac_set_features() as fix_features is not supposed to change
   driver state.

2. simplifies the TSO/GSP test in stmmac_xmit() to simply check if the
   skbuff is a GSO buffer, and whether the gso_type is one that we
   should handle.

A previous version of patch 1 was posted in February:

https://lore.kernel.org/r/E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk/

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 38 +++++++++++------------
 2 files changed, 21 insertions(+), 20 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

