Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34DECFA753
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wkuSdW/m+K9iRhoxrYgBEQ31vGYgUWWx+sS2BymvibQ=; b=evPsIAkuEBdvCtkMQJ0lmP5E3r
	IMGJOoTiEoFKcjOftXLXba8K1nVF5o9FmWZY2pMmWjGTKG80x5fBheeshjr1i6xufdlNcs4ab+TpI
	4ahrNuPx1Dstsq0u3XpVMRFl5E/01XiODjhRYVJ4oeL07mqkz2PDcRpF2COOO5UjQUKUaeuFnZst4
	QKzZY7EGsP+ehAlGemSGnmuM+v20TOPA2Dp+3c62P6EAaw8owWF060hnlJlTA7c1lO42Q1Yfr/t7c
	qgNyo41VKZhmdJDAgsI4nZTyOzhM8BdGizHeMD+vyz+r6F0y1SkuTWYSMs7JycePjoAwp5AknsnGU
	g4huZdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNoj-00000008Aq9-00fx;
	Fri, 21 Nov 2025 09:52:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNog-00000008ApF-1Lft
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wkuSdW/m+K9iRhoxrYgBEQ31vGYgUWWx+sS2BymvibQ=; b=mqgdmEMee4Tk+iILUqqE7QRP6h
	wyIr9LxGuL2thI/konwyhTmXSxLaxL35reY5/ArzZwKKPNRJAvedOUoEoPLIVPoKfsS9lQrioceD9
	ZNtFQ19zgCBxmo6NFljSXuaeJmAWpiu+mwFt7zTEdSv7Rtw7KL5V7j9/Cfa94ZT5HMj5hiJ6cyxwX
	jIqHEjCykUWoqPYfUT0bPEDlx+QTt6nW4jN2GrgtFmGWQrsrG5gHr+k10kU0VUuAy1BWbYtxQASqH
	9AttjBPWioEMtpmOyitm2tfFmhDNHveKvOFDUoobenEEHnvD7H/i3RKF0bJkLLq2aR1qN/IqTPmqY
	u3LQqTgw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51638 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vMNoY-000000007MR-2F8U;
	Fri, 21 Nov 2025 09:52:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vMNoX-0000000FTBd-3Oup;
	Fri, 21 Nov 2025 09:52:25 +0000
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
Subject: [PATCH net-next] net: stmmac: move stmmac_mac_finish() after
 stmmac_mac_config()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vMNoX-0000000FTBd-3Oup@rmk-PC.armlinux.org.uk>
Date: Fri, 21 Nov 2025 09:52:25 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_015234_381173_FFBBC5F2 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Keep the functions and initialisers in the same order that they exist
in phylink_mac_ops. This is the preferred order for phylink methods
as it arranges the configuration methods by called order.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 970c670fc302..d16e522c1e7d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -932,7 +932,8 @@ static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
 	if (priv->plat->mac_finish)
-		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
+		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
+				       interface);
 
 	return 0;
 }
-- 
2.47.3


