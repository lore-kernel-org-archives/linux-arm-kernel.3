Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8937FCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9mlUuiZUBrX7aQtqBT3TxfiZmcQldNbBylxYkZ/v1U=; b=MjhKd/rAGoD3QhkTdbBpFatsE8
	0kp1l6wom2gQLi2RrlzMkYMFFEf558w/IiWhiiRjg3GBVgI/QX5ji8MYD5ZkyHh1uYTQlJM0Uf/i0
	t3iX6wSA4GY+Q9RXDShnQFfy4i9AZJFsy8z+epbRfaVZo2nqm+QNmzeudUItmnXDgnFDIv5yh6NcG
	Y3AfHjs1/Fe8J1cDW9/yaurFX43czdImaq0serpI8prBTyjcb1WPUu54aSVZiYaX2hNzxdlIgbXbv
	RxPAPx8VYkXMPH+7Om/6U2SFzYoV3oNx8KyRSCY65dgP/jlRNshlMbOFYujzSKaEghVA36vO2KL+9
	Bowbo0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfCA-00000002ZKi-1NvQ;
	Thu, 11 Sep 2025 11:10:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfC7-00000002ZGn-1fdl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B9mlUuiZUBrX7aQtqBT3TxfiZmcQldNbBylxYkZ/v1U=; b=sje16V5F0iMZanbBcmAqQrsS+H
	LTbYvk0irpitUgvghLte94X0OH3TP2Y5bsTe/UIo0gCKmSv0XOXenx7QINhtl5Xeppact3h2hAAwn
	NtWL9vgnOGzBirX2k8nDpp499kJPT3PstKyRxinO0f6ngXDYSeZflQS/WVnsFXu3FJurOmPrTE2Ri
	3YZ+oZ7Gh1zN7N5ov/ZHJ+TLoCgqBeQIG4JV0tlF1bRjIRyrFRvfvfAXxhGxRasA1gWTb2esYSKjZ
	szcJpZcwiwG3zJC3diRrLtNw1v8LWpBKxV6063GXeG8eLaQ41esjYsKYVAXRLsLHj8WoPM+/jkH3u
	3BocF60g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42850 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uwfBp-000000002tp-1aHi;
	Thu, 11 Sep 2025 12:10:09 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uwfBn-00000004j92-3nj1;
	Thu, 11 Sep 2025 12:10:08 +0100
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
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
	Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
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
Subject: [PATCH net-next v2 07/11] net: stmmac: move stmmac_init_ptp()
 messages into function
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uwfBn-00000004j92-3nj1@rmk-PC.armlinux.org.uk>
Date: Thu, 11 Sep 2025 12:10:07 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_041027_444629_9647181F 
X-CRM114-Status: GOOD (  11.66  )
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


