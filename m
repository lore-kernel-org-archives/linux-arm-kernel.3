Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22283FD5323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2eZz6n+JSnIZp/Guf2kgufVNYPqAEQOOWO68giC+nE=; b=hdvzA52ZFniGULAM3mVf4eFWe4
	Bq7YQd51tvghYkELY9hUVTZu2xVLik+F5xL7UEcmR25chZgyzeroa8nNOAjtGn05pXAIAjsKNb/rg
	ZfYModL8ORBHI8YiihrouxAHoKAx4j3AvHNrFukgM8p8fDQenOoQtZqQypfxuYoHkW8/H+/dZfdwq
	vLv463Gk8g/bxRIKoGV6rMtm/e4PiU1WKvqKZq4iJg+iKj+jC/t9m8mtUvgEVSd2zBZvPeTmz2EcP
	b9OUp3jyJ80xOfcirFp9GtvjJfYQP+alc8AJHeGwMlGKkSBC7hmskH4biLPq/HPIWZORdOmGAOgb+
	fY+BRaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuX7-00000008B0h-3t0R;
	Fri, 27 Feb 2026 09:53:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuX5-00000008B00-2GcM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b2eZz6n+JSnIZp/Guf2kgufVNYPqAEQOOWO68giC+nE=; b=pxKNgEqG0x7GN2Vk1aTXF7ptT8
	EsoqvMdG+gzQCA7Ggk1HFFYTclr/d94qcYr/xrKQWWIU2U9Nj7PIcxx435d1TAvQAnRhiYUM+RVGX
	J8CRkhyF4IH5dOUgEIm36Ruo+7RpuB+jGGamp+QQS0Y/pabrUnoYBOBDwwSsyb4/6ArKx2qrHIrki
	LRCBAM4AAMBrIfS1ksqxtDPygyDobxt5OAKTUjzaTlz0M/ndWTiDfQvZuwTbt1CKx/VvWo+H1aKLI
	9NgX8n8xIDjCAZ/Y5gymf7Vo4cLtjXi6l2KIkq2AozcBmxJn8HfINv+rS0CdyPmGO4/mV0Bik/egv
	/66nH1hA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51864 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuWz-000000000bv-2HVW;
	Fri, 27 Feb 2026 09:53:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuWy-0000000AvmY-3GWN;
	Fri, 27 Feb 2026 09:53:08 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 01/14] net: stmmac: clean up formatting in
 stmmac_mac_finish()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuWy-0000000AvmY-3GWN@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:08 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015315_579539_193D208B 
X-CRM114-Status: UNSURE (   9.12  )
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

Wrap the arguments for priv->plat->mac_finish() to avoid an overly long
line.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7c5e31492035..2b21cc839146 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -968,7 +968,8 @@ static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
 	if (priv->plat->mac_finish)
-		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
+		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
+				       interface);
 
 	return 0;
 }
-- 
2.47.3


