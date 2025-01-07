Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3122E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htW5qn6DvTQCml5FV0+E9wXF615rxk0Wx5RrDokY4q4=; b=w16ZNGZGw3GGjEHg0eERnwTr8c
	FqCktlgyiOGZvdepTSxbNrPI46+0jt8mRVgNtFq3sJwfEdGwRnze1okJ12Miz41wAsDAMp26YsHWn
	t3omNfuirxPaVAmbCm7wDv2H8VdSJBPwT8Podr/myZooSkUrQqqsbltlPaiSysNrJZM4vIgqigO/n
	i8e9zfCf1L58ZyV0gQwbF4LS/MZVCmP7GDDYI4lhNl00nYSPTuX6C4As1F8NprR3v9r1cWeRaySIV
	LKs4CPGFqlhXpSwWJY04cBXm/X3bgFNCfpScGSGBwCuuLPw6rMVNW6eC2atJekKgxv6qmJECRhQM5
	8UwFP7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVClJ-00000005hrU-2M7T;
	Tue, 07 Jan 2025 16:49:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCS1-00000005dQu-2mLz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=htW5qn6DvTQCml5FV0+E9wXF615rxk0Wx5RrDokY4q4=; b=g7LZS4O03GoODV7ZMw6IA3/zKa
	E4/SqypXx8d5THWhxizbJvTu3vtq/sCdhTBYEKCBqeUPKNbHtvLc9s4lBljDKLNhu1Am5eGj1afTN
	fGSv4A6fTeQPDySGkNcAP0ob3121fj1J0dwufxIQZxgI2ecWh5yXfJ7u/LxZuPArPp2tj8Hu3INhr
	+N9JXoHkqAbfBDXs3UXJysgXnbY4RVETGqs5gYCCebKri3wZkH4xjy6JPYAueV/B+bwBh2F5rEViQ
	L4Bcb/uuuswzRiFsDsD7FsjCwx6wUvp2e7hZii1fGblspNK6pTiPs72KDe5Bs+txDAYA0IgAZ9X6i
	UoBgIYqw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50278 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVCRw-0007mG-2e;
	Tue, 07 Jan 2025 16:29:00 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVCRt-007Y3T-OJ; Tue, 07 Jan 2025 16:28:57 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 06/18] net: stmmac: remove redundant code from
 ethtool EEE ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVCRt-007Y3T-OJ@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:28:57 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082905_705306_7569A465 
X-CRM114-Status: GOOD (  13.60  )
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

Setting edata->tx_lpi_enabled in stmmac_ethtool_op_get_eee() gets
overwritten by phylib, so there's no point setting this.

In stmmac_ethtool_op_set_eee(), now that stmmac is using the result of
phylib's evaluation of EEE, there is no need to handle anything in the
ethtool EEE ops other than calling through to the appropriate phylink
function, which will pass on to phylib the users request.

As stmmac_disable_eee_mode() is now no longer called from outside
stmmac_main.c, make it static.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h         | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 9 ---------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 2 +-
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 984e708d019f..2eee3c5c4d1e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -405,7 +405,6 @@ void stmmac_dvr_remove(struct device *dev);
 int stmmac_dvr_probe(struct device *device,
 		     struct plat_stmmacenet_data *plat_dat,
 		     struct stmmac_resources *res);
-void stmmac_disable_eee_mode(struct stmmac_priv *priv);
 int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt);
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
 int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 0429a99a8114..693f59c3c47a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -898,8 +898,6 @@ static int stmmac_ethtool_op_get_eee(struct net_device *dev,
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
 
-	edata->tx_lpi_enabled = priv->tx_lpi_enabled;
-
 	return phylink_ethtool_get_eee(priv->phylink, edata);
 }
 
@@ -911,13 +909,6 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
 
-	if (priv->tx_lpi_enabled != edata->tx_lpi_enabled)
-		netdev_warn(priv->dev,
-			    "Setting EEE tx-lpi is not supported\n");
-
-	if (!edata->eee_enabled)
-		stmmac_disable_eee_mode(priv);
-
 	return phylink_ethtool_set_eee(priv->phylink, edata);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3135bfdbee3c..1ccfa40ceddd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -432,7 +432,7 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
  * Description: this function is to exit and disable EEE in case of
  * LPI state is true. This is called by the xmit.
  */
-void stmmac_disable_eee_mode(struct stmmac_priv *priv)
+static void stmmac_disable_eee_mode(struct stmmac_priv *priv)
 {
 	if (!priv->eee_sw_timer_en) {
 		stmmac_lpi_entry_timer_config(priv, 0);
-- 
2.30.2


