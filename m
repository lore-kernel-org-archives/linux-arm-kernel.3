Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353DDEB7EA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bM3W6A9RFTPFmoR9cUfC7hMGa2UFu2pNm437NiJy6M=; b=vbWKq3HvtUq9bKWAr2+Z65W/dj
	QChCFbPVzuGOFYA08Zw39Acg5IRmEvL2meF3AtLwueJhuz/PnD0IwX35+Xs58Xs5+3KfLmI5N+Jd0
	meT7JmBjLZpmt92n0Jy8zneJqT5P28bDQoifIPJnOWJ3grBIG8skPmvuxF/ADKVmcIZ1/0iTFxDcX
	0pwEx2bDRtt0VMv0U0LARNW4X6vQJfOr1oo0mzc2Z247tkOXvFxtvPb+qnYRnV0HjvKSz8ZbQndGj
	9MNlIFIjwXzCFSddk87Qnz4MkJmJvHDGz9H6+mQCTGdLpSMou8S85AyQkxuwwilExJCmIJidIzKpT
	sx32dxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjQ2-0000000GzOr-3c6P;
	Wed, 04 Mar 2026 10:25:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjQ0-0000000GzOU-09S1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:25:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DAB864E42539;
	Wed,  4 Mar 2026 10:25:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F8045FF5C;
	Wed,  4 Mar 2026 10:25:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 336931036843C;
	Wed,  4 Mar 2026 11:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772619924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4bM3W6A9RFTPFmoR9cUfC7hMGa2UFu2pNm437NiJy6M=;
	b=vB2/vDCiSRj8JWbId/CCxgWJqL4FgXZZXbARpNmRxbkWqrMVrEjxUT741hc7yyqrMZKtSj
	Y7gXwBh1+0O0En7Qpah8iBJ8UzD/RhYIh36kJVa9+H2bYBrSWyDyh3oKSwcTf5EYTUDvyO
	sPspt/HQRldLdUYz4NuHdi7VUu2sAAR1L0EfcjjIbOsWkvpDfj4FyErvGTmuR5+ecmv9qV
	bMAc2rFuWB91dqlFNCm0KA1j7/w+G7ckQZnMVz+QitoqkGGb5x6HiZ+Sf1tU1dpJgjv98I
	ASmxXy4ZgCOIR3HWV+j4sV6DHSiej4UcvsGXcYIoquliQ8HK+nqQlUC264bmfA==
Message-ID: <5053a8db-79f6-48ff-8116-c65710ba24de@bootlin.com>
Date: Wed, 4 Mar 2026 11:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next v2 1/7] net: stmmac: add BASE-X support to
 integrated PCS
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <E1vxhud-0000000BqGK-3U3P@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vxhud-0000000BqGK-3U3P@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_022528_356814_BB33ABA4 
X-CRM114-Status: GOOD (  35.34  )
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

Hello Russell,

On 04/03/2026 09:48, Russell King (Oracle) wrote:
> The integrated PCS supports 802.3z (BASE-X) modes when the Synopsys
> IP is coupled with an appropriate SerDes to provide the electrical
> interface. The PCS presents a TBI interface to the SerDes for this.
> Thus, the BASE-X related registers are only present when TBI mode is
> supported.
> 
> dwmac-qcom-ethqos added support for using 2.5G with the integrated PCS
> by calling dwmac_ctrl_ane() directly.
> 
> Add support for the following to the integrated PCS:
> - 1000BASE-X protocol unconditionally.
> - 2500BASE-X if the coupled SerDes supports 2.5G speed.
> - The above without autonegotiation.
> - If the PCS supports TBI, then optional BASE-X autonegotiation for each
>   of the above.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Haven't tested ofc, but this patch looks good to me (well, my knowledge
about 1000BaseX vs SGMII w.r.t aneg mostly comes from you in the first
place).

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 96 ++++++++++++++++++-
>  .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  1 +
>  include/linux/stmmac.h                        |  1 +
>  3 files changed, 95 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 88fa359ea716..e606dfb85f94 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> @@ -16,6 +16,27 @@
>  #define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
>  #define GMAC_TBI	0x14	/* TBI extend status */
>  
> +static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
> +						     phy_interface_t interface)
> +{
> +	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	unsigned int ib_caps;
> +
> +	if (phy_interface_mode_is_8023z(interface)) {
> +		ib_caps = LINK_INBAND_DISABLE;
> +
> +		/* If the PCS supports TBI/RTBI, then BASE-X negotiation is
> +		 * supported.
> +		 */
> +		if (spcs->support_tbi_rtbi)
> +			ib_caps |= LINK_INBAND_ENABLE;
> +
> +		return ib_caps;
> +	}
> +
> +	return 0;
> +}
> +
>  static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> @@ -36,7 +57,39 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>  					   unsigned int neg_mode,
>  					   struct phylink_link_state *state)
>  {
> -	state->link = false;
> +	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	u32 status, lpa;
> +
> +	status = readl(spcs->base + GMAC_AN_STATUS);
> +
> +	if (phy_interface_mode_is_8023z(state->interface)) {
> +		/* For BASE-X modes, the PCS block supports the advertisement
> +		 * and link partner advertisement registers using standard
> +		 * 802.3 format. The status register also has the link status
> +		 * and AN complete bits in the same bit location. This will
> +		 * only be used when AN is enabled.
> +		 */
> +		lpa = readl(spcs->base + GMAC_ANE_LPA);
> +
> +		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
> +	} else {
> +		state->link = false;
> +	}
> +}
> +
> +static int dwmac_integrated_pcs_config_aneg(struct stmmac_pcs *spcs,
> +					    phy_interface_t interface,
> +					    const unsigned long *advertising)
> +{
> +	bool changed = false;
> +	u32 adv;
> +
> +	adv = phylink_mii_c22_pcs_encode_advertisement(interface, advertising);
> +	if (readl(spcs->base + GMAC_ANE_ADV) != adv)
> +		changed = true;
> +	writel(adv, spcs->base + GMAC_ANE_ADV);
> +
> +	return changed;
>  }
>  
>  static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
> @@ -46,13 +99,28 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
>  				       bool permit_pause_to_mac)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	bool changed = false, ane = true;
> +
> +	/* Only configure the advertisement and allow AN in BASE-X mode if
> +	 * the core supports TBI/RTBI. AN will be filtered out by via phylink
> +	 * and the .pcs_inband_caps() method above.
> +	 */
> +	if (phy_interface_mode_is_8023z(interface) &&
> +	    spcs->support_tbi_rtbi) {
> +		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
> +
> +		changed = dwmac_integrated_pcs_config_aneg(spcs, interface,
> +							   advertising);
> +	}
>  
> -	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
> +	dwmac_ctrl_ane(spcs->base, 0, ane,
> +		       spcs->priv->hw->reverse_sgmii_enable);
>  
> -	return 0;
> +	return changed;
>  }
>  
>  static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
> +	.pcs_inband_caps = dwmac_integrated_pcs_inband_caps,
>  	.pcs_enable = dwmac_integrated_pcs_enable,
>  	.pcs_disable = dwmac_integrated_pcs_disable,
>  	.pcs_get_state = dwmac_integrated_pcs_get_state,
> @@ -84,9 +152,18 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
>  int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
>  					   phy_interface_t interface)
>  {
> +	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +
>  	if (interface == PHY_INTERFACE_MODE_SGMII)
>  		return PHY_INTF_SEL_SGMII;
>  
> +	if (phy_interface_mode_is_8023z(interface)) {
> +		if (spcs->support_tbi_rtbi)
> +			return PHY_INTF_SEL_TBI;
> +		else
> +			return PHY_INTF_SEL_SGMII;
> +	}
> +
>  	return -EINVAL;
>  }
>  
> @@ -104,7 +181,20 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
>  	spcs->int_mask = int_mask;
>  	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
>  
> +	/* If the PCS supports extended status, then it supports BASE-X AN
> +	 * with a TBI interface to the SerDes. Otherwise, we can support
> +	 * BASE-X without AN using SGMII, which is required for qcom-ethqos.
> +	 */
> +	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN)
> +		spcs->support_tbi_rtbi = true;
> +
>  	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, spcs->pcs.supported_interfaces);
> +
> +	/* Only allow 2500BASE-X if the SerDes has support. */
> +	if (priv->plat->flags & STMMAC_FLAG_SERDES_SUPPORTS_2500M)
> +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> +			  spcs->pcs.supported_interfaces);
>  
>  	priv->integrated_pcs = spcs;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index 23bbd4f10bf8..12ea87792fcb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -32,6 +32,7 @@ struct stmmac_pcs {
>  	void __iomem *base;
>  	u32 int_mask;
>  	struct phylink_pcs pcs;
> +	bool support_tbi_rtbi;
>  };
>  
>  static inline struct stmmac_pcs *
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 2fc169c7117e..3a99c4ef420c 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -192,6 +192,7 @@ enum dwmac_core_type {
>  #define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
>  #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
>  #define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
> +#define STMMAC_FLAG_SERDES_SUPPORTS_2500M	BIT(15)
>  
>  struct mac_device_info;
>  


