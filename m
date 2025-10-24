Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5044CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBETHKNkRC/ncD/Rqzzbsi7AlwBDem+TkHmHlyBoMbg=; b=ZGgAIPFEQoqQjx6UZuTFMlnp+B
	i7CFDjNDzrYSZleZTutrlHG3+iQXPb0ZwX5jfwZsrkMzmITCCEd29kd3MOm/KslTiTmsyheaV8JKD
	93xAbQIsvo4t70Vj9r1eTZgg2pc/bgg8n4aPk6yYNMIeQl7/tdTme6MKZYYp4YHHAdnV8OMdeypqS
	kkyCVLUlCPQ/+HfzaQmCsVr1a6xVaRSGddYr1wM1SOdAl/XMMdGwSVuh0C9HrSLDaUnk1T3FSi914
	5y0FBcAP/yeW3tQLGfEtJM4TLBEeFoyfyY1fV6M3E21zPdICqUtpRF2hqWhhe1XTRC0F1lVRXsOx8
	86vhEqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHEX-00000009PYd-3SOq;
	Fri, 24 Oct 2025 12:49:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHEU-00000009PVm-0MZ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XBETHKNkRC/ncD/Rqzzbsi7AlwBDem+TkHmHlyBoMbg=; b=I4l+ZSk6aQbXkxZCrJ+etgUNAN
	Im5UoLqe/H9F9jhri1UH8EjeS8QZmlq6etfeX+H1PG78pjZ1/ei4MjdmN7VocwECwm5j9ZbbhywNe
	rQoMGyAgEOsH3dXS2QjxBaqIPBv1OysimHMejkWrjbPVXM9rbAaxjlbes/Z9TEfxja2jBhQfGYRjp
	bgTZlu9kY+ha+39y8t+YxDlOwHT9VTlmo36iCOEDhGwJ70OnaydsTIkbk0n1u10YVsvQXueTEN9bl
	sOeHwUVsqS3ylMhFQMUlHKjJR5MPHQBV085yYSOOB23cleE0SnkRzHIakcP/4ztK2z9nsLmM9izto
	zu9GzXTw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56358 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vCHEP-000000007aa-12ZY;
	Fri, 24 Oct 2025 13:49:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vCHEO-0000000BPTy-2Bhn;
	Fri, 24 Oct 2025 13:49:20 +0100
In-Reply-To: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next v2 4/8] net: stmmac: move stmmac_get_*id() into
 stmmac_get_version()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vCHEO-0000000BPTy-2Bhn@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Oct 2025 13:49:20 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_054926_124218_924FB6FA 
X-CRM114-Status: UNSURE (   9.14  )
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

Move the contents of both stmmac_get_id() and stmmac_get_dev_id() into
stmmac_get_version() as it no longer makes sense for these to be
separate functions.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 699c94acfeff..c156edb54ae6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -18,19 +18,6 @@ struct stmmac_version {
 	u8 dev_id;
 };
 
-static u32 stmmac_get_id(struct stmmac_priv *priv, u32 reg)
-{
-	dev_info(priv->device, "User ID: 0x%x, Synopsys ID: 0x%x\n",
-			(unsigned int)(reg & GENMASK(15, 8)) >> 8,
-			(unsigned int)(reg & GENMASK(7, 0)));
-	return reg & GENMASK(7, 0);
-}
-
-static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 reg)
-{
-	return (reg & GENMASK(15, 8)) >> 8;
-}
-
 static void stmmac_get_version(struct stmmac_priv *priv,
 			       struct stmmac_version *ver)
 {
@@ -55,9 +42,13 @@ static void stmmac_get_version(struct stmmac_priv *priv,
 		return;
 	}
 
-	ver->snpsver = stmmac_get_id(priv, version);
+	dev_info(priv->device, "User ID: 0x%x, Synopsys ID: 0x%x\n",
+		 (unsigned int)(version & GENMASK(15, 8)) >> 8,
+		 (unsigned int)(version & GENMASK(7, 0)));
+
+	ver->snpsver = version & GENMASK(7, 0);
 	if (core_type == DWMAC_CORE_XGMAC)
-		ver->dev_id = stmmac_get_dev_id(priv, version);
+		ver->dev_id = (version & GENMASK(15, 8)) >> 8;
 }
 
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
-- 
2.47.3


