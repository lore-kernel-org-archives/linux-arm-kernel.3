Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AEDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz0hbAq7fEga5zRohMAv5O8tOvXUWgvThRUc5VepeC8=; b=sletuocgaLUzVElk2EgDat9Rqz
	q3wCG8khQIEFIQeV4/m9iFAw6VO/loPpaTdJWy/PQag00l8i2os0sS8ZFvbT2AAIq+G2M2MqSCoE3
	FeqWYB79IF3WzRNfEUxWiYBRusaEFZtlCX2waBG9EgEn83Cv6mQqRwzinH9i6VVJMksLZVbvyhvTC
	rcZoqCRcEiaZZbh0qy60BCQJQyM444C4zTwIIii5hAEl/PrnduPhq41f0cEDPRuKzaq/4OS19lUBt
	2DQlMhu7urLrvlxWkc3xobcxkLIFD+7e3DFwm9dyoYk/uM/lGrogvbZU/xvNgDBTjknItYsInd7zv
	1a0AfURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27D-000000096HO-0eUT;
	Tue, 09 Sep 2025 17:26:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1WF-00000008e4z-0Vz4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rz0hbAq7fEga5zRohMAv5O8tOvXUWgvThRUc5VepeC8=; b=fOGqQAiHccsvB7ENctq9tyL9Hy
	vGSFLvDRw+4U/XUQETE04K0cyRdoCpe8ELqAeyOth0cDv6pfiS9+aYDk1BVw2mqdapKuMTTUkbaEs
	8gR0XMZjLqCzNwxLiSnBbkAT0I6+uowSOJExq5lko/5u8TKQIqqjQed0GLyx/PFYAqDk9kWbIclBn
	s5MR6orvBn8GuW+h1Xm4OkmTbJlF4YLyIoiQvPJK7VRLs7oqXDs53W0l4jKUNnsBwHUMKoykQu0Ic
	SyQBLba2QqPsCkdGDq54mhgnvk+KKOWys9n3XeDVBnbwE2fmboR1puh4NJBNI/9ZpSQGsi6LZLXBJ
	r375amDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55444 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uw1W2-0000000006H-0lfA;
	Tue, 09 Sep 2025 17:48:22 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uw1W0-00000004MCp-0Iuc;
	Tue, 09 Sep 2025 17:48:20 +0100
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
Subject: [PATCH net-next 11/11] net: stmmac: move timestamping/ptp init to
 stmmac_hw_setup() caller
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uw1W0-00000004MCp-0Iuc@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:48:20 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_094835_161161_B86F96FE 
X-CRM114-Status: GOOD (  11.58  )
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

Move the call to stmmac_init_timestamping() or stmmac_setup_ptp() out
of stmmac_hw_setup() to its caller after stmmac_hw_setup() has
successfully completed. This slightly changes the ordering during
setup, but should be safe to do.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ff12c4b34eb6..8c8ca5999bd8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3436,7 +3436,7 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
  *  0 on success and an appropriate (-)ve integer as defined in errno.h
  *  file on failure.
  */
-static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
+static int stmmac_hw_setup(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 rx_cnt = priv->plat->rx_queues_to_use;
@@ -3507,11 +3507,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	stmmac_mmc_setup(priv);
 
-	if (ptp_register)
-		stmmac_setup_ptp(priv);
-	else
-		stmmac_init_timestamping(priv);
-
 	if (priv->use_riwt) {
 		u32 queue;
 
@@ -4000,12 +3995,14 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
-	ret = stmmac_hw_setup(dev, true);
+	ret = stmmac_hw_setup(dev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto init_error;
 	}
 
+	stmmac_setup_ptp(priv);
+
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
@@ -7917,7 +7914,7 @@ int stmmac_resume(struct device *dev)
 	stmmac_free_tx_skbufs(priv);
 	stmmac_clear_descriptors(priv, &priv->dma_conf);
 
-	ret = stmmac_hw_setup(ndev, false);
+	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		mutex_unlock(&priv->lock);
@@ -7925,6 +7922,8 @@ int stmmac_resume(struct device *dev)
 		return ret;
 	}
 
+	stmmac_init_timestamping(priv);
+
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_rx_mode(ndev);
-- 
2.47.3


