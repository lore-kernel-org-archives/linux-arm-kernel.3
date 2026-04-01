Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CB1D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+HY1v6K7+3S1W+xgQPRi1IM8CgGBePKt4HiS0CKizY=; b=4lhApiLNn6rVjLEC1tidP1sWrB
	aYC8IPyG7/mAOLmXJtjeCZ4OrnJSgCsB5GlAYyENwhG0VMI5XEvtMcdhNsP/YWN6WttKBs0ObKwsw
	EwtVznCVka6oLWAUvdzXaDiWmmrnvrnj7RGT73KtZTW7RxSTiFzKTDLogqzJLmBH1xhAR2uYG2Cj3
	A3kfAycV1RUdnjeKMQou0d3VI+FErt1G7vafmpEIPT/EHhWKwqcPUFxK1hw03FU1/CgDWQaibqeOj
	hZmUh6eW2xr/5r0wR6jQvYtzt+LGdk6zuN+VW/PJwOpeInOnYsEPTTQB/sJB849jLycJHxlOqfSql
	L12Cs8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptJ-0000000ECBC-0UGZ;
	Wed, 01 Apr 2026 07:21:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ptG-0000000EC9d-0WLK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n+HY1v6K7+3S1W+xgQPRi1IM8CgGBePKt4HiS0CKizY=; b=xga1V+rYa68nBzhLxefeYUC+YP
	PV10PJJvnsU6aFTZ/33/qdzmMT+jVnnQwl8ush7XUjanooN909UKCYw7cqbkWyOQpBO//mRGMbrNN
	ig//Mazu4aOlpa/8u7PykA538opRYxsEbpGk8lWNsFVgaYN2ly79lBNufzh+RE+QgqhwrRGrBVO8a
	Km3UQXHRMzfFB4dZ67sXDQb5HIqW1F6U3AXVhHGQc80FlZDIJ0MF4U4n2BWFqgvzEoa/OVm+7iMqZ
	+Yu4VrN1zSnL6tuFvIbxx2EEFakuBH+hDZv2UTPKO3wxE946aaPVMYcXbr5okw/CV2ahhfUgMBP/z
	JFijIxHw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37596 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7ptA-000000002fk-0Y28;
	Wed, 01 Apr 2026 08:21:20 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7pt9-0000000East-1YAO;
	Wed, 01 Apr 2026 08:21:19 +0100
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 02/14] net: stmmac: fix .ndo_fix_features()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7pt9-0000000East-1YAO@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:21:19 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002126_164800_DDDCABDE 
X-CRM114-Status: GOOD (  12.99  )
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

netdev features documentation requires that .ndo_fix_features() is
stateless: it shouldn't modify driver state. Yet, stmmac_fix_features()
does exactly that, changing whether GSO frames are processed by the
driver.

Move this code to stmmac_set_features() instead, which is the correct
place for it. We don't need to check whether TSO is supported; this
is already handled via the setup of netdev->hw_features, and we are
guaranteed that if netdev->hw_features indicates that a feature is
not supported, .ndo_set_features() won't be called with it set.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index cd76f62e1b6e..c80b4a375ddb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6073,14 +6073,6 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
 		features &= ~NETIF_F_CSUM_MASK;
 
-	/* Disable tso if asked by ethtool */
-	if ((priv->plat->flags & STMMAC_FLAG_TSO_EN) && (priv->dma_cap.tsoen)) {
-		if (features & NETIF_F_TSO)
-			priv->tso = true;
-		else
-			priv->tso = false;
-	}
-
 	return features;
 }
 
@@ -6107,6 +6099,8 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
+	priv->tso = !!(features & NETIF_F_TSO);
+
 	if (features & NETIF_F_HW_VLAN_CTAG_RX)
 		priv->hw->hw_vlan_en = true;
 	else
-- 
2.47.3


