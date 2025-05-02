Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3769FC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMsYaN25z76lktbBdIck2Jfs8+Pu7kcg9oa4M4iajcs=; b=fL5FxrWksxcAOQaNgbUa4YfAu4
	mk++se3Hz1SFCAuoAz99JQqosbPLrJ0f3T5VlE0mVgRvhfJ7pDnIRKPALhF6AVP36/dI+Vc7Piv3j
	fiKWfnd2fwgcbOep75+PT2LzeOjvOLZJO8c4sxMRfpBwIDyXel5arvCxc65R7Uga2exJMRJogvhZq
	cNIMbnDb3cqdLbpeFKbt111Za95z8DGxZJxAlD+wQps3Ly+ILtM1iVIba87NEXzgZH4dmEL8xkRYQ
	b9K9Ux9Azdqg4aMLpjmNEFTXZ9WRw2hRnU85oNXG1pcQzRWDB8qXHH97GzQWUAUMw8sbPbGLGnRa4
	u0gMWF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqiL-0000000264u-3oqD;
	Fri, 02 May 2025 13:46:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqZC-000000024gP-2x61
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 13:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tMsYaN25z76lktbBdIck2Jfs8+Pu7kcg9oa4M4iajcs=; b=cSFc2TcE8QON1lJEl1vxBmZ+PB
	er39jf7VRDi85a7WRoCkv2VH9aGObtmVv3sbRs3G3Cq/+Efvvf+8HTsfJc65h+YjFClnKvc9zqBrt
	PM07APXmvBWjXXt6dkdSJ1/sG0kCPH/fqicLT3JqUpnOHomK541IZELqMJh56ZRjKpNQTyL8YrB4n
	uHb2PzZOwtOXmJ6daWvzkXmc22gubNo3Uze9xIQmdEVND1tHfjG78gQzrjJBcyuhb+2vKsLFwTj/v
	PXp4vfBXVzwHhvIL0JVkLaJKVE2+OIaRVHf8OAMaSq00hiDDVb29Zhw1FnH//+clAdVC7oQhYWpMV
	2dg53/qA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58384 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uAqYz-0001PF-3D;
	Fri, 02 May 2025 14:36:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uAqYN-002D41-53; Fri, 02 May 2025 14:35:47 +0100
In-Reply-To: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
References: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 4/4] net: stmmac: leave enabling _RE and _TE to
 stmmac_mac_link_up()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uAqYN-002D41-53@rmk-PC.armlinux.org.uk>
Date: Fri, 02 May 2025 14:35:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_063638_795109_82C6C296 
X-CRM114-Status: GOOD (  10.47  )
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

We only need to enable the MAC receiver and transmiter only when the
link has come up.

With commit "net: stmmac: move phylink_resume() after resume setup
is complete" we move the race between stmmac_mac_link_up() and
stmmac_hw_setup(), ensuring that stmmac_mac_link_up() happens
afterwards. This patch is a pre-requisit of this change.

Remove the unnecessary call to stmmac_mac_set(, true) in
stmmac_hw_setup().

Tested-by: Furong Xu <0x1207@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ac27ea679b23..ef2a08342b25 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3533,9 +3533,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 		priv->hw->rx_csum = 0;
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Set the HW DMA mode and the COE */
 	stmmac_dma_operation_mode(priv);
 
-- 
2.30.2


