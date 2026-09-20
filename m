Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B99CC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 19:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDQtWEdo07Gt04m/i2o6WCXb5iRKSj/hWaaSYGuPoFk=; b=44WZpqRCJWOqf5qhmzv4cEE0kM
	9jXIRMgTbADfGB1r+0UIf7lS7dgA7IienXWdCA5428PJHb/pkWSKWW079UdBbk+R1nKmnnxPVqUpT
	g0WkWB4lQXSt/TYmBGB65YicL9YA5iYAbOVvFJZR0M37W1w+ZplQZGrjPm9YXAvwZESoOdnalzx4R
	gUcWuzHQ2PBIfIqqVOJFSFrFhxA1UEIfFf1uCDPJRcd6Q3w3+UzdAFGwHGvd6eRB++SxdxfojNtN0
	B2zJ8DExeuIuRs6DwPv72MTviFQwH/IzFm8+005YiMZceWZeVGVcPvjp4U9DmXe4/KW1Tzs6C0lVS
	Ei4AuwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NU0-00000000JqK-1SHd;
	Sun, 20 Sep 2026 19:45:52 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NTv-00000000JoF-1oNC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 19:45:48 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c2c08ff3f8so1679311b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933546; x=1790538346; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDQtWEdo07Gt04m/i2o6WCXb5iRKSj/hWaaSYGuPoFk=;
        b=e3IJgp5SjKhbGJD01q32ZAL/c+70hny75lYZ/UTuMGu4WCUZUa2jqk/VnmePBHlk2y
         lsKrSAw4gr2Q7oKzxDj84phho7bEQuAVp7ZlZ/rO7R/F4tXQL5VNRjwkgZqcNxxbw369
         ppTa1ys8UuAsVWYam0Wt6ILgfKPICWu7n5Ut1XKlPdVdw1mglp24RNlclpxyyeF/3j8m
         9vscBUFavDabb74tOCavBEFO5QbMepxBKIw03Ch52GEIndEr2ih+bjUau4VzHLNOnP+W
         g7TdZZ5HhTYfwvL1/oLgNZK08yxigthPp0eZigKJFNYv7Tn2L/NEWVseXDIlec0DNuz5
         Onvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933546; x=1790538346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDQtWEdo07Gt04m/i2o6WCXb5iRKSj/hWaaSYGuPoFk=;
        b=nhsjKfxy6VOfAX9iL2tTy+UEHe9YpijwLhQmXRSLC217i689u4CJiummnYn921idD+
         mDO+voEi9RgukqwsMDek5sWJrG64ySqUL6FvtAYDWcQSFrvTt6aHh3Pjc2rtqfVlOXCS
         Ie6/l1cCWKwidst6puw71+AZR66P7/JkWTXOYIKLJ5fSH2VLSN5BrNtLMRE/bt5h3HHm
         e7o1DChDw7y/z2zILeT3GhOV79z9yAogUNHUVN12ZcXFdafYElJAoAU6omTzLKbYGmdf
         L5vcT2qnAfDPSGmbrSyE8ubnAZmU1R7YiLPq9N/yryTRep6oVdT6twz6JTOQMJRO1KWI
         Merw==
X-Forwarded-Encrypted: i=1; AKwUvBzELjDfTjFNKUYmaNrg+h/gIB+wooVTmQY4RvSx3CZQ7JAx7bipNk+IcOgogKxKC2pHDlgm+JFPvuK5pOcOJduK@lists.infradead.org
X-Gm-Message-State: AFuF++lQZ8F7OMb7P3Yc6ItsNI7UuY4qwfuWKeRYnjXxlpxbEvqKSxKy
	CFmhrUQrunux3OOB4Z3D2P5c3ZbFYqNeOHkC+k+THzjbdgDiLX3dCwDo
X-Gm-Gg: AYBFou2S0kGtd4Y4pWlxrXxM1qgmdGRCqdW2secE5Rw9caF9+OiTgZ6/m9ZzHji4uzj
	7akrr2h7H3ZyaUwhlIqyW28Q7O2A+RUYlR8/Eg4G+J4TAjn8SjZjKWwEpGNTnSc5/zEpHPi/yO3
	Y9gzfphFS2Gr49EOQkFLm+gRRJGC6oH27mmFMdoPBY/lia0S6W+tJDhNGJlAMcOiRVuvm64KDQo
	rKN+s5vJ91JM4/GI8lP9FlqGwlr2TUFMVWX4YP9KbacvVJRWTcCe5r9stT4kOOqYBtG4ZzJ3DaX
	Ok7zo9ilZXvs/55QscjioW44r+epiPBMbaSj5zwssBUbJ/fqNkLkZxY7P6B8j1AfRHDHs0Y88eq
	zp04otHDLoaqnv68g6k2MWRx3Vu/86ujt3nPYWE/MoiAUXW4noIC4uSZqvpr5SkEk9aQp8N9YnJ
	KiechStHJIb0mZDhJNfB5W8Qmv7QBJ4s0dCCQqpB+Wp/b+l86Gm1eKCNf4fsw/TGQr+TaGdPusZ
	ggfoAXWC4hcrZd/Xt+Fasbp5oqE7cAdfzYBBSxjIWg5dgVRpIIWlu6B3qdAY5llRBCTlDu3zI9y
	IJnIPNELILdX2KQJfMPXlZsKbSqfNsEvWh/D8orlClD9Ha8n3Ayx7GODYHS0KY8Mo9acuFfu6+X
	SmkW2/nKykDADcV8dLbU5
X-Received: by 2002:a05:6820:160d:b0:6b1:535a:eb8 with SMTP id 006d021491bc7-6ca9a132f99mr8497407eaf.2.1789933546360;
        Sun, 20 Sep 2026 12:45:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:30 -0600
Subject: [PATCH net-next v4 4/6] net: stmmac: sun8i: reset the MAC after
 PHY initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-4-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_124547_486917_73F58366 
X-CRM114-Status: GOOD (  22.87  )
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

The MAC software reset needs a running receive clock from the PHY.
Resetting the MAC at the end of probe therefore fails when the PHY driver
has not been loaded or its probe has deferred on a missing supplier. The
failure removes the MAC and its MDIO bus, so loading the missing driver
later cannot recover the interface without reprobing the MAC.

Perform the software reset in the DMA reset callback instead. The stmmac
core calls it during hardware setup after attaching and initializing the
PHY, and resumes a suspended PHY before reopening or resuming the MAC.
Mask interrupts before requesting the reset and retain the existing
DMA and interrupt-register clearing even if the reset times out. Return
reset errors through the normal hardware-setup error path.

Remove the unconditional reset from probe. Keep the separate H3 MDIO-mux
reset after switching the mux and powering the selected PHY, since it is
needed to latch the selected interface before MDIO accesses.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 53 +++++++++++------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..9598c386bb21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -269,11 +269,33 @@ static const struct emac_variant emac_variant_h6 = {
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
+static int sun8i_dwmac_reset(void __iomem *ioaddr)
+{
+	u32 v;
+
+	v = readl(ioaddr + EMAC_BASIC_CTL1);
+	writel(v | 0x01, ioaddr + EMAC_BASIC_CTL1);
+
+	/* The timeout was previously set to 10ms, but some board (OrangePI0)
+	 * need more if no cable plugged. 100ms seems OK
+	 */
+	return readl_poll_timeout(ioaddr + EMAC_BASIC_CTL1, v,
+				  !(v & 0x01), 100, 100000);
+}
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
 static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
 {
+	int ret;
+
+	writel(0, ioaddr + EMAC_INT_EN);
+
+	/* The PHY receive clock must be running for the reset to complete. */
+	ret = sun8i_dwmac_reset(ioaddr);
+
+	/* Leave DMA and interrupts disabled even if the reset timed out. */
 	writel(0, ioaddr + EMAC_RX_CTL1);
 	writel(0, ioaddr + EMAC_TX_CTL1);
 	writel(0, ioaddr + EMAC_RX_FRM_FLT);
@@ -281,7 +303,7 @@ static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
 	writel(0, ioaddr + EMAC_TX_DESC_LIST);
 	writel(0, ioaddr + EMAC_INT_EN);
 	writel(0x1FFFFFF, ioaddr + EMAC_INT_STA);
-	return 0;
+	return ret;
 }
 
 /* sun8i_dwmac_dma_init() - initialize the EMAC
@@ -738,27 +760,6 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_TX_FLOW_CTL);
 }
 
-static int sun8i_dwmac_reset(struct stmmac_priv *priv)
-{
-	u32 v;
-	int err;
-
-	v = readl(priv->ioaddr + EMAC_BASIC_CTL1);
-	writel(v | 0x01, priv->ioaddr + EMAC_BASIC_CTL1);
-
-	/* The timeout was previously set to 10ms, but some board (OrangePI0)
-	 * need more if no cable plugged. 100ms seems OK
-	 */
-	err = readl_poll_timeout(priv->ioaddr + EMAC_BASIC_CTL1, v,
-				 !(v & 0x01), 100, 100000);
-
-	if (err) {
-		dev_err(priv->device, "EMAC reset timeout\n");
-		return err;
-	}
-	return 0;
-}
-
 /* Search in mdio-mux node for internal PHY node and get its clk/reset */
 static int get_ephy_nodes(struct stmmac_priv *priv)
 {
@@ -895,7 +896,9 @@ static int mdio_mux_syscon_switch_fn(int current_child, int desired_child,
 		/* After changing syscon value, the MAC need reset or it will
 		 * use the last value (and so the last PHY set).
 		 */
-		ret = sun8i_dwmac_reset(priv);
+		ret = sun8i_dwmac_reset(priv->ioaddr);
+		if (ret)
+			dev_err(priv->device, "EMAC reset timeout\n");
 	}
 	return ret;
 }
@@ -1217,10 +1220,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to register mux\n");
 			goto dwmac_mux;
 		}
-	} else {
-		ret = sun8i_dwmac_reset(priv);
-		if (ret)
-			goto dwmac_remove;
 	}
 
 	pm_runtime_put(&pdev->dev);

-- 
2.53.0


