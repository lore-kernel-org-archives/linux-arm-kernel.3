Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DAAC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 18:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLWTLjVNNOaJBBp+6jLPkB34blfAphSZQL2nUEax2lA=; b=lGqnDG1WbBfrKRju3563baWNGu
	6V7KDl1TVFStraMFgruYZ22eRsbPo89jiyB/9A/f/5bdqOkVbOrn11IXK0oJdA9EdGXlARUj3TYjr
	UdyKiU8MBiGaSkTFpc7cECaPwxe3hm9dlAbRUjSYDt0ZKDWqlnkqH3burYJp3JlZJAWYYacZiwDcQ
	HYV73OkIn2//IFGWP6g4kYdUSiXOjg2n+kBPho+5wX3LjbD0EheUCpgeW80R5U7CocI1095YlV+Qs
	KqEUC294JXaAku0hmkXGcQd89GYkJ1WfdYF5Xlj6zz4rQMA64wbLoOU77SHIOwcwB8FHB7ScpDvCx
	rneWEkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtzN-0000000Gigb-3ca1;
	Sun, 27 Sep 2026 18:52:41 +0000
Received: from mail-oo2-x2a.google.com ([2607:f8b0:4864:31::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtzF-0000000Gicz-0aEw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 18:52:34 +0000
Received: by mail-oo2-x2a.google.com with SMTP id 006d021491bc7-6d8a0df68dfso193735eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 11:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535152; x=1791139952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLWTLjVNNOaJBBp+6jLPkB34blfAphSZQL2nUEax2lA=;
        b=mxX4YcFAzom292nl89LyaD57cEFWUlRTn+20g9Yj54gFOkd91PSVEuEPvGGdcpSW05
         SSpxorQPYXH9EhP6PGQIvhhAtwaBPpRZufLzruvYuSf/gIDhLmlQZe+x5lo/mxOJyUWD
         G/pibiHJytvMG+dvaocbG9tXAUdYVWzUJlhQN4lmhQJe8Ag7OrRXQijeDY+ZrQUbBjhp
         X05z2fdl4gq5qINsxIDA9ewMqpDxAX23iZ0g5Myneavd8y7ICgUNOo3pJ+P8U+O3FBx1
         U0nkdi7hH+SNgXneLw4ZCefn+lRnRwtmf1sDRh67PYBxFWDzU4kroSiNSVrQUbHmSnWI
         bWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535152; x=1791139952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLWTLjVNNOaJBBp+6jLPkB34blfAphSZQL2nUEax2lA=;
        b=VnMcWgkg4hnHJi5hMypc3+XrQ4m0kDryCLlx4e13QhUH/vo1/A32HhvqGoCszZdOBK
         yby00ZC+u13ba7SDzK/f+edl2LaMLLvS8uX59HepDPGm0e4TCXP0xTumehbUPorrtSLC
         NnHBBkvwu7RkJxO1GgTNHq+KynRrFty3zIdtiBTdLJSqeWbJQp1XhyHsvTDeCZL4qFOJ
         yXfiOqQ9xOTFaXFdx8mSXj1DGI4ccAHKNUGk72cyg9JbvOx8lH24JxhTV3FKeOgUqeXk
         ycR0OtfC4tMUZy6tWFpSa33vNDgUPWghSmze8Tleg6vDw3LRvkIDlrST4+nCdtya2CRS
         ONKA==
X-Forwarded-Encrypted: i=1; AKwUvBwhaJjYlatCPd+PA7XfjK2i1rwTW27T91JGUz4VP8eodo4Sr0uMgnkfKNlWv4XHesumdnpgwes3EVyCb5awVPyv@lists.infradead.org
X-Gm-Message-State: AFuF++lGkF1aQtkW8vPkH9RxHcW7rnN061+rXRde+DrGDoPZBjoJ1H91
	s5vslQNw1wnHdH4MaXYPSfIHMZYuIK0wxqK+ScuVHJA44ZKHpKujhSzx
X-Gm-Gg: AYBFou380Qu3MlZzwY66ttXwYS/1f9AcyxhREyRHAIU7ITi+NtOM2cIyrDAHw4a8RUK
	Ej5uVpQd6efVlawY8U5A1b6lD4+0GWQLlrWDlvNlQ4EUTO2q7JhlnpmAamB6C0IES7zIaX0+mZk
	UntM0AzgDa0xJDX5H+Qu4ULoOgkpsgJ27ImAeKTd2Rth29pDTxefN2IKvRxYNRic/GRSI9F24k1
	iLnYWxguC2CPx6XyStTCdgGEm5iMQGK+IqBA710eOGL1/fYLwoOtd7/QKlxpqiM5LiWUkgV61BG
	dCHaVom3m/CiCvvUDhPwEYepWzh0pZaqPOuJQenXsJNh36qElXSNuZOwqgokXC3K1Qkl9LfoHdA
	vGmJZD5svVykYxKCRk9hSD0Q8mM5/L9i6CCTzT+yibjeeV7raoXgrUXm9JIU1qE+VWwrZaWJ4/E
	ZSYOQdkPccyxXvrIFGn1cK1QS1OeIlYJh0oxNK9Y5eoDKkZEfW+OIKFYiYKCSZ5VfX0637Ozks0
	pfYShPuqVGjTUFOLp4+liSokjaxnns6wgb+CZyC3HKcLqnm0xEBGrMZClqypBV9kZm1WNw4T4si
	53tw6kpCm0P8Fe0fPnh2HloQpnfbdI68YBerr4nVBFLQT/r6ZhnNYrd72yy7GHlTH2iug0wEsr9
	uZguag6eo+uYNcpcCX3hZ
X-Received: by 2002:a05:6820:4c82:b0:6b7:46fa:169a with SMTP id 006d021491bc7-6d43ff69796mr10523773eaf.47.1790535152003;
        Sun, 27 Sep 2026 11:52:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-494877590e5sm4489452fac.13.2026.09.27.11.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:52:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 12:52:19 -0600
Subject: [PATCH net-next v6 1/3] net: stmmac: sun8i: reset the MAC after
 PHY initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-h616-emac1-v1-v6-1-e64971f4e414@gmail.com>
References: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
In-Reply-To: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
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
X-CRM114-CacheID: sfid-20260927_115233_193373_F6C5C193 
X-CRM114-Status: GOOD (  22.66  )
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
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 53 +++++++++++------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 38d7e71de925..5691da796454 100644
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
@@ -899,7 +900,9 @@ static int mdio_mux_syscon_switch_fn(int current_child, int desired_child,
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
@@ -1221,10 +1224,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
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


