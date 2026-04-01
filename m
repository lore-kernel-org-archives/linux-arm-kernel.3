Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02224D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7e//swqwHU8cxAR5zK0XovUJAr7PPmCorHDhD/SbGoE=; b=U9sY4JA4GdiwlghGLbRrQTYoOU
	7fd+kbnyvEig93aRk8EjlZAjPgElOPCc0jmG47dDi7IE8xbSBA4YKTF0LwNaMb90GPxtL8qtgC9Cd
	w28UDZvl5pCHzvoKn+4hiJWwTE6AxtPhmn0KdykP3DODMI4WhV7ihrZ86Zw+2e7pEDYxNVwqvReJT
	3W5abE4EeH7m31uw4pZ0vGYBXpBvsx6Bnyp4Y41zzIzRVySCJjhqXePDaA2Mh40yO42lig4+hi2or
	p077S12drHV+xB1QVBG3jR0qPfaUyM7hWH9wjqXKuT7Uik59VhsIuEBbS+FuKYfF4ZcFgChEYUccJ
	65TM8ohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7puL-0000000ECwM-0BWu;
	Wed, 01 Apr 2026 07:22:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7puI-0000000ECsW-0S8x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7e//swqwHU8cxAR5zK0XovUJAr7PPmCorHDhD/SbGoE=; b=DWllS1wtCsr/wuu8J3LmNYkVaS
	yorU2v7Cu5jHVhdQObSTEnlCMqGNYp8nG9h0W1evG9+RAriihKpkLMiv9/pZuSRixRhkfGUyeRIIl
	yB7mhiu7o0oI5go87sIb6b9yvv/OD0EMXm91i8iE3onYWpInA8tZvNEv4XlilPSQGCWTdM/iANjH5
	/hRbVGKgXxFMopr0GIzcrI1Aye8JPnfPjeN85g3QLFfBY4cmp8tmkjtH33SZpQZBNmheKR/4A3UM5
	HObAWBsVXa4d11wCc9oGLLts1K2xmKGwmdepxk6Xzt95HBIGVd2rMyijZEQrTwjDjXtIv1ZsZigZs
	/LW3ZgIQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56898 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w7puA-000000002jU-4BQj;
	Wed, 01 Apr 2026 08:22:23 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w7pu8-0000000Eau5-3Zne;
	Wed, 01 Apr 2026 08:22:20 +0100
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
Subject: [PATCH net-next v2 14/14] net: stmmac: move "TSO supported" message
 to stmmac_set_gso_features()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w7pu8-0000000Eau5-3Zne@rmk-PC.armlinux.org.uk>
Date: Wed, 01 Apr 2026 08:22:20 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_002230_288386_76E42885 
X-CRM114-Status: GOOD (  10.88  )
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

Move the "TSO supported" message to stmmac_set_gso_features() so that
we group all probe-time TSO stuff in one place.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 406c32142d90..3e01f968115d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4391,6 +4391,9 @@ static void stmmac_set_gso_features(struct net_device *ndev)
 	const struct stmmac_dma_cfg *dma_cfg;
 	int txpbl;
 
+	if (priv->dma_cap.tsoen)
+		dev_info(priv->device, "TSO supported\n");
+
 	if (!(priv->plat->flags & STMMAC_FLAG_TSO_EN))
 		return;
 
@@ -7469,9 +7472,6 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 		devm_pm_set_wake_irq(priv->device, priv->wol_irq);
 	}
 
-	if (priv->dma_cap.tsoen)
-		dev_info(priv->device, "TSO supported\n");
-
 	if (priv->dma_cap.number_rx_queues &&
 	    priv->plat->rx_queues_to_use > priv->dma_cap.number_rx_queues) {
 		dev_warn(priv->device,
-- 
2.47.3


