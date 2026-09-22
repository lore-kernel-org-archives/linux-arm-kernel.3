Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590A7C982F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuhLhvmyUunUsMDDWLfZKTjtEMkziUs08QZF8zYObXw=; b=RS3xTP7IM3AV4y3VwvlzpakStU
	H4xaXw/zFX3vNDRaQ51vF63XQ/Va7vapHDh380rggR1mO1maCU8MaXWBzK0142cKKvcdQGL5mIoZE
	7c7ESHebNhJFUYirs5iQprFXmzYrcbGb4xlF2iZm0q88faCxUwcxRFiDl6IPkpjwWjDyAg9irF35Z
	bq0BnBHQxtJ1As907w8WQgomMp5INP2tW+yzFnYaeSpyBWyZbwGQL6WTBFynZ9G2O1UG3x7PEY2dV
	MeCuXZuG/kOnjJx/54voOIbwnDzg6z2w1sBdQ7Zc7Dun9yDTb0JUYra3jorONkP5Hki2DeE6Y3X2a
	LbqkhTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8odc-00000003o6M-3OZM;
	Tue, 22 Sep 2026 00:45:36 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8odV-00000003o3V-23Rm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:45:30 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c3b639adbcso2781937b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 17:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037928; x=1790642728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuhLhvmyUunUsMDDWLfZKTjtEMkziUs08QZF8zYObXw=;
        b=VGm2YzGZja0x/MyIpE43swaLhMnq798wRfjnG1Zma5duId67f2PUwwiHgxgeBsawYm
         oJuF7AW2lXxP2Q3H00mBYsmgHWrLAWnJtc7aP+PcMyZY7I8wErqSqFwqJaOYPj6HXnwD
         nDBMq9ZuLZf2QvdOVICFd4ozb+DRaTa9kQITlW7CwFRHGbdiAkqxEXZHEyLX39lXRNUa
         hAQFYbHwGX+b+qB7qgastC7ibnuxnV0kZgNbmGCedG/ryiCg+qFByR+6Oudeb2PWVL5D
         cWXq6f67SgY6hqcWB1mc75hvf1IVAsc/wtQRGmAmzFHbKWArwqg6gVVjwOPyfjKGlJ6M
         xC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037928; x=1790642728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuhLhvmyUunUsMDDWLfZKTjtEMkziUs08QZF8zYObXw=;
        b=myaz3MeeE62gr7P1Y/tqH0SUTyCfh8zCAkQPqT+QE943BLOrsEbe72O5sBOqvzEvEq
         iB/PgwCQt8xJGZesUSo/GthxMtVWQQ/RUJdsufLq3e8Hr72IABG/YAuYuijJ1dMt+2hD
         V6+sh2fNJ2uxxrv9OhzJ0TLo1CfPPIYFSJ3PWxTmAGm6CjqLTN+0P4WDw5gRkVUzAO/Y
         nq0t+9jkYwmNwbfL8b+24m0K7SOGJFR8DPAnjW8zUFbwyLgHcDxjQaufSLbtvZy7/k/8
         wMMCbWEywizzwhizgxS9zM1mGTVAmcXDHLTEUXJKaAFeCH1BGGQcFvXxwe7r7dAUYFom
         Rtgg==
X-Forwarded-Encrypted: i=1; AKwUvBzXHWZzvAPFW3FiFzZZI0yGbpynoz96Q5VKA7qTkPbFgxsRxucn7TvVjhvZlGc1dFjWt//yhx8RKtOCazJlzRzB@lists.infradead.org
X-Gm-Message-State: AFuF++lbDiIlkTdzTtm/FvgdOv161bQcbh5ZL2S1Hgiuj/x0aG6CqHrr
	mUwKXyu4nOAfE2rjr02Gi6EYMmiRSm52wLIGW/xA1voE6DOn1War6aCQ
X-Gm-Gg: AYBFou1YZxoTSZQi0BjQ6yoi6i8H8JiEUh91wFJ0g3sRw+ReZIt7lgkN0bLdzFE/3fd
	UG4gTFS/AYlu3rt692wKCYS4gKYLZsWdWFaLJ1mUZcCHfVG8nguMzQFuAbwbtszSLr76DHQh9ih
	oH9NsdxEwF76AL/zXL5ea/PDZxD1PUlH1QBag88qz1d4z2YYpHym16tiRz1GxrQ2iYPSbneKPX5
	ygA8fvtlIWnsE/CqcOTOUem+Hx6peX+HThKT6jyhC2ntRS+HnsU1E82h3FMPjiOKfTKQd/MLbAj
	BVxPDIArKAptPxKkaOWFkAjLWGuSjorZLpj5AKYaBKelrnfAdhtni4yYJeyBfVOcBo/NGSqxaxL
	pt8YDiHohLteJWP1kNCF6PhIbBM4kx7lDf47yGeB/ldlUkMgnR8eUFIQQbH2qxuZo0DdDinYYa6
	UMOHHF1QDcyT6HKB0D1xFlWX5040nB0t/9Vkd6BgzBhUSvzwEMVt9bUYdcpoA8GVAAMKdHx4Yxr
	XiiBcXmwnYmV+5EG5K3jqKeRI1sOnrCKuE4azVjz2CM2AhUZIrb9wtkXOa9sYI8MB/8ZVtaEBeS
	h1sXeb0Wk/3lD39IjRqe+8r0htfWJhb6+ZwEzSPXnPVK80EPjQ06wAm58AYUUORNGzNkBd4f47R
	HcrCQ81tcnhhrPf1CefR7FfIW98EEa/ea
X-Received: by 2002:a05:6808:5243:b0:4b3:7fa3:890b with SMTP id 5614622812f47-4ccf6a788a9mr11024712b6e.2.1790037928310;
        Mon, 21 Sep 2026 17:45:28 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:45:24 -0600
Subject: [PATCH net-next v5 1/3] net: stmmac: sun8i: reset the MAC after
 PHY initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-h616-emac1-v1-v5-1-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_174529_550660_1DFF1A7A 
X-CRM114-Status: GOOD (  22.98  )
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

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
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


