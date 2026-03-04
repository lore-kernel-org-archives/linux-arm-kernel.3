Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530ABEB7EB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXAuD3nUVcKQxQuqoS4zKPyRKQFd55XZkokpVdQy2cE=; b=ozMptZ3yC0KDfoQLfQTwVcQe4a
	KVfvk5jnhzhs9ZETSpgkq5XVUBBTrmFEd4zIS5X+veuhVPMnmMEwxbkDfFxT0CJduxoi033Pyx1cl
	YfoH1x0W1AT+BA3Qy7RwE+E3YAei7dHfidWsA+l4AMMRE6e5AM2Ip1g4B1nqpsrG5245uNWs1UJkQ
	6h8OlAgwiwkV8CFI3vY3d8CWUfefhbG1mwXJQQLS74jVShMXkjJcID3UQjPdtzSm/bUv9JGlY7lS/
	BNUZ/js2TuO9LXyTMEi4HXC7n0LBBm/IZEskyQf6NQa60OxW8a4j5mZezElUg6Hp4WOU/16CvqZdP
	oZ7ONldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjNr-0000000GykC-22TZ;
	Wed, 04 Mar 2026 10:23:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjNp-0000000Gyga-3RLI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JXAuD3nUVcKQxQuqoS4zKPyRKQFd55XZkokpVdQy2cE=; b=Da3v+Z3BmPyBn5Iv7+wde9Bv3/
	gSlPdBaktNiDva8cRyRxAnPc7nVVaUT8F6r3HRe9O1asNjcaVA5ZRcAmbXXbdXQvt4EEab07bwQAj
	hghI+IhiiFsuVCJGw0gPNzhvRUvWbBWvTPHdYj7Cl2icO3KTUSvLhbtg2Scbnp/IR/xkPiacOhWNC
	poYzl4m1iNGX5hdt/c/eCyQ7J4jfQIIYoEwXiU1iq9yPjL6VkDmu+uzw/X3rX0lTdNImB3zo1Vy25
	+Xj4TYvc+piZsNqktq1rjGzMjKq5ySISNMPuLoMp40TnsfiT3RcCqRESKt0SBXDWKfkRGfgfoNc+q
	WNvqZ9Ig==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60830 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxjNg-000000006Ml-0Mhs;
	Wed, 04 Mar 2026 10:23:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxjNe-0000000Br1W-1nOG;
	Wed, 04 Mar 2026 10:23:02 +0000
In-Reply-To: <aagH023pvswd0tlT@shell.armlinux.org.uk>
References: <aagH023pvswd0tlT@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next 7/8] net: stmmac: mdio_bus_data->default_an_inband is
 boolean
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxjNe-0000000Br1W-1nOG@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Mar 2026 10:23:02 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_022313_856675_15D9C9DC 
X-CRM114-Status: GOOD (  11.82  )
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

default_an_inband is declared as an unsigned int, but is set to true/
false and is assigned to phylink_config's member of the same name
which is a bool. Declare this also as a bool for consistency.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/stmmac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 2fc169c7117e..678d03d6d3bd 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -86,10 +86,10 @@ struct stmmac_priv;
 struct stmmac_mdio_bus_data {
 	unsigned int phy_mask;
 	unsigned int pcs_mask;
-	unsigned int default_an_inband;
 	int *irqs;
 	int probed_phy_irq;
 	bool needs_reset;
+	bool default_an_inband;
 };
 
 struct stmmac_dma_cfg {
-- 
2.47.3


