Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43342CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9mlUuiZUBrX7aQtqBT3TxfiZmcQldNbBylxYkZ/v1U=; b=R5rYL14kwsc17sZv7Mbga3rIkI
	gcgOTNPYpuUUriMZcrFy5JhSnSjpS9klJOzT+MdZCiCw44ZanKL6LZb7o3rnGUFuizln57aOwjiFN
	7D42IkG9cqPMVORZXsY3eUZ/kkkRRBBNp7ZLgbGmCo7Dyp5PQcVMzewl9ol4BML0wL1V0Ls9PU4Kt
	YskRf9d5gS068JtNL/CSQ5HYi7As8AixakfJZen8ZtdorWOcU98d+MGExy06aRdnbtBYLLwF/CV0V
	SoPvgHX4+fkrL604/XiQd4nUOuo4xh5t8Af+uZbfRH9pEGAsfPgLZTZgtxVwv/xf9/Np4kd0fMllW
	jqKLfS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw274-0000000961w-2HL4;
	Tue, 09 Sep 2025 17:26:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1W0-00000008e0u-3GrO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B9mlUuiZUBrX7aQtqBT3TxfiZmcQldNbBylxYkZ/v1U=; b=Xasu243PE4+x7EhdTuRRpFFaIp
	ajSpEcHYhC+X/gI0bD4m31dEWya8hehFCIefFOTrcYNUMv9TyUS7jMW67dsEdLi8kYIHL2Z4m+ETA
	fYhwXXZhqjmBORtYbHcEL8m+LxvH+VQZQpQ2YidZK3HEjL2ktP8MXxVuW5PCC0LuayiNpUCetaBjM
	oFakpvKCOKu9LUF22clin5BpCjVgQMzrjcQ5nYwh3XVhb0iKRoS2mq/KVf2D6iFNdtt8+FTrQI7e/
	BX+ilGhFcvX2ZeXmlmJTj3jSdrgz49Lclzjk2s48pNMushYZlar5sY27eRK7mT/PqXkWrUAXH8GTM
	EA231OLg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55550 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uw1Vh-0000000005E-2psl;
	Tue, 09 Sep 2025 17:48:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uw1Vf-00000004MCR-2eUl;
	Tue, 09 Sep 2025 17:47:59 +0100
In-Reply-To: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
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
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next 07/11] net: stmmac: move stmmac_init_ptp() messages
 into function
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uw1Vf-00000004MCR-2eUl@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:47:59 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_094820_815053_8BFA9C04 
X-CRM114-Status: GOOD (  11.76  )
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

Move the stmmac_init_ptp() messages from stmmac_hw_setup() to
stmmac_init_ptp(), which will allow further cleanups.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index cb058e4c6ea9..716c7e21baf1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -788,8 +788,13 @@ static int stmmac_init_ptp(struct stmmac_priv *priv)
 		priv->plat->ptp_clk_freq_config(priv);
 
 	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE);
-	if (ret)
+	if (ret) {
+		if (ret == -EOPNOTSUPP)
+			netdev_info(priv->dev, "PTP not supported by HW\n");
+		else
+			netdev_warn(priv->dev, "PTP init failed\n");
 		return ret;
+	}
 
 	priv->adv_ts = 0;
 	/* Check if adv_ts can be enabled for dwmac 4.x / xgmac core */
@@ -3497,12 +3502,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 				    ERR_PTR(ret));
 	}
 
-	ret = stmmac_init_ptp(priv);
-	if (ret == -EOPNOTSUPP)
-		netdev_info(priv->dev, "PTP not supported by HW\n");
-	else if (ret)
-		netdev_warn(priv->dev, "PTP init failed\n");
-	else if (ptp_register)
+	if (stmmac_init_ptp(priv) == 0 && ptp_register)
 		stmmac_ptp_register(priv);
 
 	if (priv->use_riwt) {
-- 
2.47.3


