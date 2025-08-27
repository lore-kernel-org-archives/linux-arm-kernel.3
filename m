Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DE5CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7HaJk396OO093SxPHpUQb4seLkO7bxlhi3QdP8wBr4=; b=qfEAVsNrYWw1sJu6ob50FN0Ggy
	1d9PW4hT5gRi6QFzPvlCzl3GV0OyQBOqaJ3fkE9Rphra8nIsvaOOfqoYok/rQ67N3SlpZfzbcePNL
	WkixULGXH313vd3JisFN1H7iP14qT+Wz9+mFArRNQWFuNSG5ockA5kpRMe7JT000Q4xZR1lWD7mn7
	na2XyYvRrW+RYWL+GVxiKK65i20zD1OP0oZe82G8ZPFLbcS5L2vMStKMCVtpw7a8joYg3zgf0gPOR
	11yt3gTHL0GTdGVdQ6pdoJuR4Wc9v45oV6siG4SstfSe9cQb4LY0uR/9DmbcudowJkVK1IY9xzYB9
	o/tuN2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urC0C-0000000ElId-0ySA;
	Wed, 27 Aug 2025 08:59:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBvm-0000000EkZY-0phW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 08:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K7HaJk396OO093SxPHpUQb4seLkO7bxlhi3QdP8wBr4=; b=NSQxECPtX7C8dbMwGLyP+ulZGG
	nmPrcJ3zBoC0HPaOQA+Q8HyRz/Vvegz770b9uvYukTd7GO4uphNs/Qd8HOiNJCNOY5JdcrUD64XgQ
	G0PWImYty0TG6jzGQC+a8z7YUJhvZ2eBOaapcQ24ZrONV2gavsycOmR4rWaZNdRld0cHg10FUGkdI
	eUZpYaCVNsg8l6gvEulFCQ5oLvMGeyThNNn2TJZk/1rLrmNEWjVZv10gKCE72cU7QFjKA8/UGHVje
	TZt2zHacB08u68Ma3nx7FPW9m3WbamOSFIQqPY8WL4p/v2IwFeYW//mKB4o/k/t+UPE7wlNyNHxt+
	TfxY4yKw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51196 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1urBvg-000000000G1-23Bx;
	Wed, 27 Aug 2025 09:54:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1urBvf-000000002ii-37Ce;
	Wed, 27 Aug 2025 09:54:51 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: minor cleanups to
 stmmac_bus_clks_config()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>
Date: Wed, 27 Aug 2025 09:54:51 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_015458_238588_6CEA716D 
X-CRM114-Status: GOOD (  13.32  )
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

stmmac_bus_clks_config() doesn't need to repeatedly on dereference
priv->plat as this remains the same throughout this function. Not only
does this detract from the function's readability, but it could cause
the value to be reloaded each time. Use a local variable.

Also, the final return can simply return zero, and we can dispense
with the initialiser for 'ret'.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 429a871d7378..88f5d637f033 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -149,33 +149,34 @@ static void stmmac_exit_fs(struct net_device *dev);
 
 int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
 {
-	int ret = 0;
+	struct plat_stmmacenet_data *plat_dat = priv->plat;
+	int ret;
 
 	if (enabled) {
-		ret = clk_prepare_enable(priv->plat->stmmac_clk);
+		ret = clk_prepare_enable(plat_dat->stmmac_clk);
 		if (ret)
 			return ret;
-		ret = clk_prepare_enable(priv->plat->pclk);
+		ret = clk_prepare_enable(plat_dat->pclk);
 		if (ret) {
-			clk_disable_unprepare(priv->plat->stmmac_clk);
+			clk_disable_unprepare(plat_dat->stmmac_clk);
 			return ret;
 		}
-		if (priv->plat->clks_config) {
-			ret = priv->plat->clks_config(priv->plat->bsp_priv, enabled);
+		if (plat_dat->clks_config) {
+			ret = plat_dat->clks_config(plat_dat->bsp_priv, enabled);
 			if (ret) {
-				clk_disable_unprepare(priv->plat->stmmac_clk);
-				clk_disable_unprepare(priv->plat->pclk);
+				clk_disable_unprepare(plat_dat->stmmac_clk);
+				clk_disable_unprepare(plat_dat->pclk);
 				return ret;
 			}
 		}
 	} else {
-		clk_disable_unprepare(priv->plat->stmmac_clk);
-		clk_disable_unprepare(priv->plat->pclk);
-		if (priv->plat->clks_config)
-			priv->plat->clks_config(priv->plat->bsp_priv, enabled);
+		clk_disable_unprepare(plat_dat->stmmac_clk);
+		clk_disable_unprepare(plat_dat->pclk);
+		if (plat_dat->clks_config)
+			plat_dat->clks_config(plat_dat->bsp_priv, enabled);
 	}
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_bus_clks_config);
 
-- 
2.47.2


