Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52935E83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UENQcPP3bF2ZA0ADQ4abpHHj29Ib66umM+PFjhQQHc8=; b=uQlnd5f9S94iYIdBXYow+IQYaU
	tiyTJf45yPHNweJ79+ZrbRH3Rm3OeiIgmUBzE5C20ACVcACKr+4aX11m+4JbNm9D1IfinKM2cJlNN
	4LyTwlhOiVLXtb1GfVRmAxdWeV8XLUcjruRK3qTcieUxQWJJ8gm8FwSYgsHKpyiCcXd0vu/pGLyyn
	OSm3sXJmUDb0+xCGrTi6aUPU0Kve2mTf8ogg2wFS6wMVi3Kp1cq032WaK7cKv9btU/eqlV8UjYGxi
	c3agWbtiIKYBJ/BPR2uV8p/hQrO6d+Uy29ZtsGTRP2KV81m0swwtYXkpsb8I1pqyDSwZaZ0LQiLkX
	/0wJ3YDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDE2-00000006R3A-2MWJ;
	Tue, 03 Feb 2026 10:01:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDE0-00000006R1S-1xnE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UENQcPP3bF2ZA0ADQ4abpHHj29Ib66umM+PFjhQQHc8=; b=yH6Ed3idSUHAp6Lx+IkGjLwpve
	IRjQphIw8UGp9DcXazS3s2pSSQmisnwPXCWIM5g944Qvh9hkJbLZ3KL9KnpSQu7/7g7scRNGKGG9K
	6ACw0TVHKzVs6fSG8+naujz/PxO/7DXPII6/qzAAHDg5pAfxw8AgMqe1IhaFXuRfRpazLXlYEc61A
	t2Gm0QLAVG/DjMTUgsg4B9/1l2v8YRuGiO41J6vNgorE4lFVpsLWfxXbQoLFdv4eCq7EktqP8TpLT
	DcGVu5NtOUuJhfjujpEgD/jVfsp/DF6fQOIyCsQnNfM0J9qC6F97F37kL+O3RnNSwWYDmHTBXHThC
	pgsweyRQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57930 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vnDDu-000000004xS-2otx;
	Tue, 03 Feb 2026 10:01:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vnDDt-00000007XxF-3uUK;
	Tue, 03 Feb 2026 10:01:29 +0000
In-Reply-To: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
References: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 4/4] net: stmmac: move serdes power methods to
 stmmac_[open|release]()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vnDDt-00000007XxF-3uUK@rmk-PC.armlinux.org.uk>
Date: Tue, 03 Feb 2026 10:01:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_020136_520712_341D70EE 
X-CRM114-Status: GOOD (  12.74  )
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

Move the SerDes power up and down calls for the non-"after linkup"
case out of __stmmac_open() and __stmmac_release() into the
stmmac_open() and stmmac_release() methods, which means the SerDes
will only change power state on administrative changes or suspend/
resume, not while changing the interface MTU.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 05b0b080bade..d561b0a0f5ac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4134,12 +4134,6 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_reset_queues_param(priv);
 
-	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP)) {
-		ret = stmmac_legacy_serdes_power_up(priv);
-		if (ret < 0)
-			return ret;
-	}
-
 	ret = stmmac_hw_setup(dev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
@@ -4170,7 +4164,6 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_release_ptp(priv);
 init_error:
-	stmmac_legacy_serdes_power_down(priv);
 	return ret;
 }
 
@@ -4196,9 +4189,15 @@ static int stmmac_open(struct net_device *dev)
 	if (ret)
 		goto err_runtime_pm;
 
+	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP)) {
+		ret = stmmac_legacy_serdes_power_up(priv);
+		if (ret < 0)
+			goto err_disconnect_phy;
+	}
+
 	ret = __stmmac_open(dev, dma_conf);
 	if (ret)
-		goto err_disconnect_phy;
+		goto err_serdes;
 
 	kfree(dma_conf);
 
@@ -4207,6 +4206,8 @@ static int stmmac_open(struct net_device *dev)
 
 	return ret;
 
+err_serdes:
+	stmmac_legacy_serdes_power_down(priv);
 err_disconnect_phy:
 	phylink_disconnect_phy(priv->phylink);
 err_runtime_pm:
@@ -4241,9 +4242,6 @@ static void __stmmac_release(struct net_device *dev)
 	/* Release and free the Rx/Tx resources */
 	free_dma_desc_resources(priv, &priv->dma_conf);
 
-	/* Powerdown Serdes if there is */
-	stmmac_legacy_serdes_power_down(priv);
-
 	stmmac_release_ptp(priv);
 
 	if (stmmac_fpe_supported(priv))
@@ -4269,6 +4267,7 @@ static int stmmac_release(struct net_device *dev)
 
 	__stmmac_release(dev);
 
+	stmmac_legacy_serdes_power_down(priv);
 	phylink_disconnect_phy(priv->phylink);
 	pm_runtime_put(priv->device);
 
-- 
2.47.3


