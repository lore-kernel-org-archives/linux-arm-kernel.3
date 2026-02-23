Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5793DEA4FB5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jo6I6WwhvxOZ29kCdHIrgJPNm4E+2rgwkQRfpR0gnvU=; b=fsG/++RsH20AjrNCyHuTMHd3tv
	0WHnDwW+CLr7+Ja2kjw52MAVrfULr3W44FSwPJ5IVNP4eCJ1IyhU35pR0BF83lBoZj83q8o3Shr9/
	4w4idEi1YPAM+bUlOZzMlFM3Ubs5xVKTxuM5+1nWNou+9aLa9gkBmF86kuKxhX0VZIrFBoEPP+sV6
	mlFm3UAM4i1BzC/0xkGskCWOC1P6kGf9mP7cTb907y0yugn70X01secTWTJ7OSd/uiCU2pcA9bLbg
	rS0FNp9r6LPb/+Vu2mYzbAWfpM6xc2qL4CWdJsDyKuddBUij5+CrYRiHWT+t/eaf4iMGKB12HFd/3
	lCtcGlpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUuC-00000000GWE-02IJ;
	Mon, 23 Feb 2026 12:19:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUuA-00000000GVt-06xO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jo6I6WwhvxOZ29kCdHIrgJPNm4E+2rgwkQRfpR0gnvU=; b=WrtQiZJN9joI1IjQewKQKQQ/1j
	2pcxRHyu5YClzXL6OxklaedthoWE6mR/KepGP3Rh09xcwvaVze75d9/qOfBoGha53kIaB/2eEeZLB
	JRGaqvS80uWPoaBF7z2U5O1z3OoqXVd/dZAlds10StCPBH5oK4uMfN7+0J7ybXuEwX4cTXeCXte8n
	mO2JNmzSSx8FbItgZXUYrAIeb3ktk4jKHYXFg4mxy1QCZoBR6WzgH4soKlpkyPaWsl56YSwoK4VxQ
	06Av/LnOwqiMRbRN06r5ij+FHHWChj2p9hvxBmvYwAQ2ZL9zP5XlW3GEcYbbhqAGvNbDlFXJUBP6c
	6nHIqdRQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55526 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuUu4-00000000430-3vJd;
	Mon, 23 Feb 2026 12:19:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuUu4-0000000Afea-0j9B;
	Mon, 23 Feb 2026 12:19:08 +0000
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: fix timestamping configuration after
 suspend/resume
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuUu4-0000000Afea-0j9B@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 12:19:08 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_041914_067609_110714A0 
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

When stmmac_init_timestamping() is called, it clears the receive and
transmit path booleans that allow timestamps to be read. These are
never re-initialised until after userspace requests timestamping
features to be enabled.

However, our copy of the timestamp configuration is not cleared, which
means we return the old configuration to userspace when requested.
This is inconsistent. Fix this by clearing the timestamp configuration.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

I'm in two minds whether this should go via net or net-next - no one
has noticed that getting the timestamp configuration after resume
doesn't reflect the hardware state. Here's the commit that introduced
the problem:

Fixes: d6228b7cdd6e ("net: stmmac: implement the SIOCGHWTSTAMP ioctl")

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 89ded359a9fe..4c127b6b8c08 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -853,6 +853,7 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 		netdev_info(priv->dev,
 			    "IEEE 1588-2008 Advanced Timestamp supported\n");
 
+	memset(&priv->tstamp_config, 0, sizeof(priv->tstamp_config));
 	priv->hwts_tx_en = 0;
 	priv->hwts_rx_en = 0;
 
-- 
2.47.3


