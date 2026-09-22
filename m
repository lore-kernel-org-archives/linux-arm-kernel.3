Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FCEC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssQctI4h9bdCd7Y/524FINFJI5J01KhR4UPJhm0pNBM=; b=ZJ7z0gX69h/46IGxK/iGq+X9sP
	EIqEECHaF+8iEI+M9KIqbBzFwwrhCgOkrp5IfS+BTKs7k5h5gWAWgGx1APVLs/fCWxupbJaaKAmJE
	Alh4Rt36hcjmxGVOpVLD5qWPXrWgC/SULmnrVhlEPS2s46tLVSkUFSORyk6QF1kodi/0lDR3MzFSp
	PKMQynV7iKZJOpRS6QHTNvT41V65g+pnrXorZbt6fPuBFxS453a1iq+/8OXQWgPYNiQ3eDyTP9WPH
	Y4lR+4S0f11d6ZYp+9aewsAa0asth/V7KIKU8WSBMujhMVMDzaapF0Pb+noSmTuYSEI/ZOdmI2W1e
	lFx/bjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uWF-00000004RUU-3KeO;
	Tue, 22 Sep 2026 07:02:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uWC-00000004RTj-2Paq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:02:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 794674E40ECD;
	Tue, 22 Sep 2026 07:02:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49D5A60580;
	Tue, 22 Sep 2026 07:02:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1E2010329239;
	Tue, 22 Sep 2026 09:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790060536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ssQctI4h9bdCd7Y/524FINFJI5J01KhR4UPJhm0pNBM=;
	b=YFAWr1LLVPWBrxuMYK0hZGy1a9yCo0Nryg9J/+kO3L8XBlB5PwXIeteAPxAyT4nVS9qe4b
	GPOc2KqgV06I4V9vWpO2WPZUpnljfwYP5gKWtfMY3aJ+GGg3rMX5jYtp955pzYzH8GGjrY
	vUAov3HahwFm+Gcex1Z2BBpHI6r4Xii9g9w6/EvWYqPCI8iUzNnoppvERzT3sFdc4ZEaH4
	3zuJKBdjX6sqM6Ylt6v5n2Zr80SEA2eeefyT/7lexB9WbF6VtyjDfz1NEdE6bTIYv7QyRn
	PzY3wJXFJ3ZWHaN8A7l73tH08UG6fl5M67qjFINyf7Enh8Tqfww6Mw6IoX9yow==
Message-ID: <3c1a0626-f3f7-49ea-8029-2c4cbb994ef9@bootlin.com>
Date: Tue, 22 Sep 2026 09:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/3] net: stmmac: sun8i: reset the MAC after
 PHY initialization
To: James Hilliard <james.hilliard1@gmail.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>,
 Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
 <20260921-submit-h616-emac1-v1-v5-1-ada661ed9e9b@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-1-ada661ed9e9b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_000220_909393_F3D4A4C0 
X-CRM114-Status: GOOD (  29.24  )
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

Hi,

On 9/22/26 02:45, James Hilliard wrote:
> The MAC software reset needs a running receive clock from the PHY.
> Resetting the MAC at the end of probe therefore fails when the PHY driver
> has not been loaded or its probe has deferred on a missing supplier. The
> failure removes the MAC and its MDIO bus, so loading the missing driver
> later cannot recover the interface without reprobing the MAC.
> 
> Perform the software reset in the DMA reset callback instead. The stmmac
> core calls it during hardware setup after attaching and initializing the
> PHY, and resumes a suspended PHY before reopening or resuming the MAC.
> Mask interrupts before requesting the reset and retain the existing
> DMA and interrupt-register clearing even if the reset times out. Return
> reset errors through the normal hardware-setup error path.
> 
> Remove the unconditional reset from probe. Keep the separate H3 MDIO-mux
> reset after switching the mux and powering the selected PHY, since it is
> needed to latch the selected interface before MDIO accesses.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested on H2S that it doesn't break the platform,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 53 +++++++++++------------
>  1 file changed, 26 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 48c52eb96233..9598c386bb21 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -269,11 +269,33 @@ static const struct emac_variant emac_variant_h6 = {
>  #define SYSCON_ETCS_EXT_GMII	0x1
>  #define SYSCON_ETCS_INT_GMII	0x2
>  
> +static int sun8i_dwmac_reset(void __iomem *ioaddr)
> +{
> +	u32 v;
> +
> +	v = readl(ioaddr + EMAC_BASIC_CTL1);
> +	writel(v | 0x01, ioaddr + EMAC_BASIC_CTL1);
> +
> +	/* The timeout was previously set to 10ms, but some board (OrangePI0)
> +	 * need more if no cable plugged. 100ms seems OK
> +	 */
> +	return readl_poll_timeout(ioaddr + EMAC_BASIC_CTL1, v,
> +				  !(v & 0x01), 100, 100000);
> +}
> +
>  /* sun8i_dwmac_dma_reset() - reset the EMAC
>   * Called from stmmac via stmmac_dma_ops->reset
>   */
>  static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
>  {
> +	int ret;
> +
> +	writel(0, ioaddr + EMAC_INT_EN);
> +
> +	/* The PHY receive clock must be running for the reset to complete. */
> +	ret = sun8i_dwmac_reset(ioaddr);
> +
> +	/* Leave DMA and interrupts disabled even if the reset timed out. */
>  	writel(0, ioaddr + EMAC_RX_CTL1);
>  	writel(0, ioaddr + EMAC_TX_CTL1);
>  	writel(0, ioaddr + EMAC_RX_FRM_FLT);
> @@ -281,7 +303,7 @@ static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
>  	writel(0, ioaddr + EMAC_TX_DESC_LIST);
>  	writel(0, ioaddr + EMAC_INT_EN);
>  	writel(0x1FFFFFF, ioaddr + EMAC_INT_STA);
> -	return 0;
> +	return ret;
>  }
>  
>  /* sun8i_dwmac_dma_init() - initialize the EMAC
> @@ -738,27 +760,6 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
>  	writel(v, ioaddr + EMAC_TX_FLOW_CTL);
>  }
>  
> -static int sun8i_dwmac_reset(struct stmmac_priv *priv)
> -{
> -	u32 v;
> -	int err;
> -
> -	v = readl(priv->ioaddr + EMAC_BASIC_CTL1);
> -	writel(v | 0x01, priv->ioaddr + EMAC_BASIC_CTL1);
> -
> -	/* The timeout was previously set to 10ms, but some board (OrangePI0)
> -	 * need more if no cable plugged. 100ms seems OK
> -	 */
> -	err = readl_poll_timeout(priv->ioaddr + EMAC_BASIC_CTL1, v,
> -				 !(v & 0x01), 100, 100000);
> -
> -	if (err) {
> -		dev_err(priv->device, "EMAC reset timeout\n");
> -		return err;
> -	}
> -	return 0;
> -}
> -
>  /* Search in mdio-mux node for internal PHY node and get its clk/reset */
>  static int get_ephy_nodes(struct stmmac_priv *priv)
>  {
> @@ -895,7 +896,9 @@ static int mdio_mux_syscon_switch_fn(int current_child, int desired_child,
>  		/* After changing syscon value, the MAC need reset or it will
>  		 * use the last value (and so the last PHY set).
>  		 */
> -		ret = sun8i_dwmac_reset(priv);
> +		ret = sun8i_dwmac_reset(priv->ioaddr);
> +		if (ret)
> +			dev_err(priv->device, "EMAC reset timeout\n");
>  	}
>  	return ret;
>  }
> @@ -1217,10 +1220,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev, "Failed to register mux\n");
>  			goto dwmac_mux;
>  		}
> -	} else {
> -		ret = sun8i_dwmac_reset(priv);
> -		if (ret)
> -			goto dwmac_remove;
>  	}
>  
>  	pm_runtime_put(&pdev->dev);
> 


