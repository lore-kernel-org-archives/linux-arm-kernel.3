Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC72C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epD9LhruE07/QoJcSKVg/dbrndAnrXPsihPLPnVDq64=; b=C1EuE/ZAPlDR9YnaPCHJho1cok
	FyK1/xy2nDIu9k8Pq4NHjH6UKEzOfy2J+JvesEZKn9xvmBC+daNG0OellIbpGN3piuqo3sy52jXaz
	eQqLvX1pmPqfctB2JNV+w5tT77315RIgr0y1FIPa7xg6pei1zZd3sGKtMv5Mb+RMin2PSBvdXWLT+
	2KHX66qdALIOjC6kqBV0FuCPgE13hKcRxS+LzJrlaJWY8392izqAxHgIcTAEmexUA4XtxKyAYgTPz
	NHZHVih4/k+tL3/s6srrAXLQEbAzJqQDHQLdBy0vvLA7yyqCAojs/LeLPJWcB33AkAXM+rv1zHflN
	0Ma0w1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GKZ-0000000C903-1mDk;
	Thu, 17 Sep 2026 17:55:31 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GKR-0000000C8wj-1sOW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:55:24 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466ccbd478bso544290fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667722; x=1790272522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epD9LhruE07/QoJcSKVg/dbrndAnrXPsihPLPnVDq64=;
        b=XxeA8cGngKf/Va8YszxAbjF72LMDVxv/X38bdsnHuBzOBHaviyXBWMFaoPnMUVN0h4
         4V0xFlKVenO6zQX0Z3FL4e4HJPZc4bewgOtMCbLf+YeADkFSJOruARtPR27gTadk16Us
         W8ZBCxLkYKm67b1HFnQZetQB0pYGqrzh+6IzXWafsNUjoOe2o6e8U23812hQeF1PHLbh
         iTEQYCKqKoeMRVmsPHclulXIZ0KNupR586vAcOxcHI57Hi2CA+YcKaj9P8n4fV+ZYZlb
         qGZQNwcjvHLxNnZvsXutwEvN/399TB+EjjddqPXSIfx99/dIzumv9U4u8Q7rUId8EDNu
         bIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667722; x=1790272522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epD9LhruE07/QoJcSKVg/dbrndAnrXPsihPLPnVDq64=;
        b=aFOMfThCMY5Z+rqH9kLIUYSpZnek7gqvRgb1ckjh3Rsx4AimRZDPkGOdkFftgj7yln
         XKICFo454BL0psmtwO4iRPbvRpgiyObgT3TeRf9hPZBxCLEUR/+DFbPI71ZMGpgLdCfz
         BF5HFJkZTX35/27rgAHJK0b/x3VEOFLsWT1gj8DfcObFsy3ihJTh8I93Y88Z3D161/Gg
         gayhAjyazGQLM87Xde9YKK9Hcu3Q4NLDFAe5hZ3F3yyq6qwk3WRT8k7UDJdelKk/4r2P
         chSmtE4HsP5SOm9h7iqBU+H0vj8y0sXLrmHdMDxqZ/U9vJ9Rhe3p0AXbpbuLH/NCu0Ll
         BNcg==
X-Forwarded-Encrypted: i=1; AKwUvBzTpNQb5m2iYaed1hBDCLnHxDXINJba1nCRINoH7yCUEYEPSm8q5byUnw4B6K+pfNITW4lT2hxUOv9yG3BykM0o@lists.infradead.org
X-Gm-Message-State: AFuF++maS7jfdQx5Bll9dj5ns00hPmCOeYKHxgswuCv96fUAbBrkz3v4
	tRr869Kj7MUKCamTfC9AR31avuubPA6MFURM3VY9qg6Kc4hAPrAmhpHS
X-Gm-Gg: AYBFou3h2bfOfyVsEP5pgno1M0zLKS7P0ZHLM14xpMCXSgtjkYVrorrp6GuIRoP8kdu
	nxZ4OyEgkynX5WaP0cuWgzNvE6WlvQV3NVVS5j4MFAbiHKF6suCRiUjt9+Y+C+9SDqReJjHa3g1
	fxH/S/aUz16QD7HVV6LOiFgZFprXIPeJW+X6oh3SlOObPTVtOnrSiCZNWamHlP/k/VE7StcbCsl
	4JZ7w6mwxIK71PrRieclxDAuxMJTf/1n7/oDj3UHyvJyH5aMCcGfiKWeyKmPQXyDicmkIS2ioHW
	sW5HceWAGLqlvOH+v/IZMt74ynUWbN6Yqo6qF2FIa54nCGsCVs8FskRb47LFyRUFHCFCOKFCe9E
	pN6Yh9qbczm+Zw9NXkP6+cuF1IYGRidOvJ6LoPIkND2pK3HA9MLaxb91dKyBS3AVca6+zUFtRsJ
	t77nbbinERZLWEiQTDaq7LRVOQ/ZYnUMndkAh0xkC1xi+tQCH/ifWoKvBNCwHOqqbU3lVFC6XZY
	YCN1+qo8hoIeDeKxVoTfFs5WQhvleTdIRuIhVYgp52wjbTbXi16BAYX5lZpKPw+TmFHM6WFF1tr
	IUwe7e+t9hIQ6Tu9L1JrisyBKN/beA33slqH7aSqfhMESUSpbef8PGfdWwL94nCHKM7Z9lWkWUt
	kQh4Min/IuuMwNU9Ol9MErfudZ/bsRw9Q
X-Received: by 2002:a05:6870:224b:b0:475:e0a7:9f27 with SMTP id 586e51a60fabf-48476e837dcmr7230581fac.21.1789667722195;
        Thu, 17 Sep 2026 10:55:22 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:12 -0600
Subject: [PATCH net-next v3 1/3] net: stmmac: sun8i: reset the MAC after
 PHY initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-1-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_105523_505000_B62AC209 
X-CRM114-Status: GOOD (  20.64  )
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
Keep the existing register clearing after a successful reset and return
reset errors through the normal hardware-setup error path.

Remove the unconditional reset from probe. Keep the separate H3 MDIO-mux
reset after switching the mux and powering the selected PHY, since it is
needed to latch the selected interface before MDIO accesses.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 50 +++++++++++------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..4523a14f5e0c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -269,11 +269,32 @@ static const struct emac_variant emac_variant_h6 = {
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
+	/* The PHY receive clock must be running for the reset to complete. */
+	ret = sun8i_dwmac_reset(ioaddr);
+	if (ret)
+		return ret;
+
 	writel(0, ioaddr + EMAC_RX_CTL1);
 	writel(0, ioaddr + EMAC_TX_CTL1);
 	writel(0, ioaddr + EMAC_RX_FRM_FLT);
@@ -738,27 +759,6 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
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
@@ -895,7 +895,9 @@ static int mdio_mux_syscon_switch_fn(int current_child, int desired_child,
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
@@ -1217,10 +1219,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
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


