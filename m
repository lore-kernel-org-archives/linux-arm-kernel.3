Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D13CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PA1o6oE0F9zZwdMce+o8anbD6M7oOwlVqzhsMPXWt28=; b=qCVt0gJhGNdp1dTbDsTWxUg1z9
	gSIOuHAAMOaxwhbfJJURPWJ6ytbQgcyHJcbCZoeSiWeIXKs/IbzuXr51QnVc9Z9x8w8RhJGd9Xf9u
	TempI6izeY/dQirQKlCFAHeOQpumnk9sDTOf717zP1G003j+hZIE9azM+kzm8t4uW19nBPQ4rYs1z
	/8CgiyT2zHa+Gzvqfx1D2loBcNK9LfbamutCHkQz2SePXFmiYg2144oUIS32znZAi6JczGtjZrK9Q
	X9PYqwokXuqqvfAntx33lWgwD80PtlBApIbFuIh5VdYaB+DKAJVpkfP7+QbG1talO3Ai26JVVoXf3
	MeQJGSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v940B-00000002D1F-0t1v;
	Wed, 15 Oct 2025 16:05:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9408-00000002D09-0hv0;
	Wed, 15 Oct 2025 16:05:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7354549303;
	Wed, 15 Oct 2025 16:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6BBC4CEF8;
	Wed, 15 Oct 2025 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760544317;
	bh=Gsi0Fb9yJJuxxwo7bA+daxNM2dy6o/NwoPi7kEACJ2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6kMa/ayePxi1R4uhvRso+pLhDsSDr7/y+656DaWuAAcdzjq+77FB/unoNtlJVmHQ
	 8wrtyDoKeyyuXFgZ/mXhpgxqpRH1Jpa9MWK4k25urSaOA71bO+7Lm6Qk312TrprH8Z
	 6W8wJUA9GoIpCa9QY5A0FPn/q4VTsJyfGq4ST+11/NaftwpZA1lyWV2eJ8WTdy67jk
	 r73KZ/f7EA3uzNhojBetEkCg6mIq/K0e/uqVQc+LbEQmDhgAgo04/i3VHoLzn++4fJ
	 IS/RupSu/bj2YhAnh88z1bAWooGetsSA4ffktLsFXYoWAcyfpRxTUcFT3zide8xuZI
	 yA2udmQwI/PYA==
Date: Wed, 15 Oct 2025 17:05:12 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 11/12] net: airoha: Refactor src port
 configuration in airhoha_set_gdm2_loopback
Message-ID: <aO_GOE0jPMlcP-VR@horms.kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
 <20251015-an7583-eth-support-v1-11-064855f05923@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-an7583-eth-support-v1-11-064855f05923@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_090520_244931_DC11C1F6 
X-CRM114-Status: GOOD (  24.86  )
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

On Wed, Oct 15, 2025 at 09:15:11AM +0200, Lorenzo Bianconi wrote:
> AN7583 chipset relies on different definitions for source-port
> identifier used for hw offloading. In order to support hw offloading
> in AN7583 controller, refactor src port configuration in
> airhoha_set_gdm2_loopback routine and introduce get_src_port_id
> callback.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c  | 75 +++++++++++++++++++++----------
>  drivers/net/ethernet/airoha/airoha_eth.h  | 11 +++--
>  drivers/net/ethernet/airoha/airoha_regs.h |  5 +--
>  3 files changed, 60 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 5f6b5ab52e0265f7bb56b008ca653d64e04ff2d2..76c82750b3ae89a9fa81c64d3b7c3578b369480c 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1682,11 +1682,14 @@ static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
>  	return 0;
>  }
>  
> -static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
> +static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
>  {
>  	u32 pse_port = port->id == 3 ? FE_PSE_PORT_GDM3 : FE_PSE_PORT_GDM4;
>  	struct airoha_eth *eth = port->qdma->eth;
>  	u32 chan = port->id == 3 ? 4 : 0;
> +	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
> +	u32 nbq = port->id == 3 ? 4 : 0;
> +	int src_port;

I think this code could benefit for names (defines) for port ids.
It's a bit clearer in airoha_en7581_get_src_port_id(). But the
numbers seem kind of magic in this function.

>  
>  	/* Forward the traffic to the proper GDM port */
>  	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(2), pse_port);
> @@ -1709,29 +1712,23 @@ static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
>  	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(2));
>  	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(2));
>  
> -	if (port->id == 3) {
> -		/* FIXME: handle XSI_PCE1_PORT */
> -		airoha_fe_rmw(eth, REG_FE_WAN_PORT,
> -			      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
> -			      FIELD_PREP(WAN0_MASK, HSGMII_LAN_PCIE0_SRCPORT));
> -		airoha_fe_rmw(eth,
> -			      REG_SP_DFT_CPORT(HSGMII_LAN_PCIE0_SRCPORT >> 3),
> -			      SP_CPORT_PCIE0_MASK,
> -			      FIELD_PREP(SP_CPORT_PCIE0_MASK,
> -					 FE_PSE_PORT_CDM2));
> -	} else {
> -		/* FIXME: handle XSI_USB_PORT */
> +	src_port = eth->soc->ops.get_src_port_id(port, nbq);
> +	if (src_port < 0)
> +		return src_port;
> +
> +	airoha_fe_rmw(eth, REG_FE_WAN_PORT,
> +		      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
> +		      FIELD_PREP(WAN0_MASK, src_port));
> +	airoha_fe_rmw(eth, REG_SP_DFT_CPORT(src_port >> 3),
> +		      SP_CPORT_MASK(src_port & 0x7),
> +		      FE_PSE_PORT_CDM2 << __ffs(SP_CPORT_MASK(src_port & 0x7)));

Likewise, 3 and 0x7 a bit magical here.

> +
> +	if (port->id != 3)
>  		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
>  			      FC_ID_OF_SRC_PORT24_MASK,
>  			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));

... and 2 here.

> -		airoha_fe_rmw(eth, REG_FE_WAN_PORT,
> -			      WAN1_EN_MASK | WAN1_MASK | WAN0_MASK,
> -			      FIELD_PREP(WAN0_MASK, HSGMII_LAN_ETH_SRCPORT));
> -		airoha_fe_rmw(eth,
> -			      REG_SP_DFT_CPORT(HSGMII_LAN_ETH_SRCPORT >> 3),
> -			      SP_CPORT_ETH_MASK,
> -			      FIELD_PREP(SP_CPORT_ETH_MASK, FE_PSE_PORT_CDM2));
> -	}
> +
> +	return 0;
>  }

...

> @@ -3055,11 +3057,38 @@ static const char * const en7581_xsi_rsts_names[] = {
>  	"xfp-mac",
>  };
>  
> +static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port, int nbq)
> +{
> +	switch (port->id) {
> +	case 3:
> +		/* 7581 SoC supports PCIe serdes on GDM3 port */
> +		if (nbq == 4)
> +			return HSGMII_LAN_7581_PCIE0_SRCPORT;
> +		if (nbq == 5)
> +			return HSGMII_LAN_7581_PCIE1_SRCPORT;
> +		break;
> +	case 4:
> +		/* 7581 SoC supports eth and usb serdes on GDM4 port */
> +		if (!nbq)
> +			return HSGMII_LAN_7581_ETH_SRCPORT;
> +		if (nbq == 1)
> +			return HSGMII_LAN_7581_USB_SRCPORT;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}

...

