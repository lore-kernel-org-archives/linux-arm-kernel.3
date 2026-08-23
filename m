Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF012C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 07:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d76hSxmuaOFdQA12QBnAjVEJYYylYbR4s4u+o28nAZM=; b=EIBRdNW0iifMAOuBR5Ii6B1PMt
	dkWjap+gHl2ikN3CHaTaQSONs3CPSsoCT9eSYmzaaEJe6UTV3n8qJXKSk1yp12gxvfrDlExvZ6f4v
	V1i6X4KCoeG9zq+wvWfs9hl2GMr7L1zppWcs3Y7RQm6Jqod8S9oP+2cTlBH0hV8/XqCCmgIa3KTRm
	RPOELe854BnUcPgzl7lXLCdJJk/vn4Ru5DCRUBTcimeC+mhr0pLpVnw3GJqQzZdPHL8C/yK0+Op72
	c3bwaWz5wChki5rODbP07uEblC4jB7+G+L5NuNUahGoQNmxir6SOgcPMVj1CezdY9+vjWgCnlHFsa
	N96keOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy2xz-0000000F9yq-0x9f;
	Sun, 23 Aug 2026 07:50:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy2xv-0000000F9yC-3Kja
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 07:50:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51C2B1A17BE;
	Sun, 23 Aug 2026 07:50:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2286B60378;
	Sun, 23 Aug 2026 07:50:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1858B11C77DF9;
	Sun, 23 Aug 2026 09:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787471401; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=d76hSxmuaOFdQA12QBnAjVEJYYylYbR4s4u+o28nAZM=;
	b=GE+BuqPWdq+dCDRIuQsUYk33c5ZLhde79ZffEBZQCz4ZKPPwsC0q8UuaKH4+gKL4zaEXJB
	1HGQELhX0VrKd2x8epsfb01d8IAjHMgmTknXGGUHsY18CKgAFm/jXrouRi+OJu3V27SHg8
	vQzJ1iiC60EP4P1U2gkdvhRmPW3XzrFBQzK3gKnbcdd1Fa6HKzpoab3RZ/w3zIjGxPKC3K
	V4oRt+wj1N47FVMwHa8wl7x6wgy1DQ5WlNSk7gSnn2wOt0VEVKzyLVz2LJBJ8QTH/Da9/P
	WhUxL38B/fD5s+noP9s16NJ5TlMcFLuFIOehHo12fe4+MDZST+/Dw9Ojhf7ELA==
Message-ID: <c632ca88-f5e5-4595-b507-955d1a2fcab7@bootlin.com>
Date: Sun, 23 Aug 2026 09:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/6] net: stmmac: Enable double VLAN processing
 only when supported
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shuah@kernel.org, joabreu@synopsys.com, yi.fang.gan@intel.com,
 jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_005004_001054_F90528C1 
X-CRM114-Status: GOOD (  15.66  )
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

On 8/21/26 19:09, Ovidiu Panait wrote:
> stmmac_vlan_update() turns on double/S-VLAN processing whenever an
> 802.1ad VLAN is registered, without checking whether the MAC actually
> supports double VLAN processing. That capability is reported in
> dma_cap.dvlan.
> 
> This was found while investigating a separate bug in the double VLAN RX
> stripping path. The outer 802.1ad tags were unexpectedly stripped by the
> MAC (because the ESVL bit was set).
> 
> Check dma_cap.dvlan before enabling EDVLP/ESVL/DOVLTC bits, so that double
> VLAN processing is enabled only on supported hardware. Also, advertise
> NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only when
> dma_cap.dvlan is set.
> 
> Fixes: 3cd1cfcba26e ("net: stmmac: Implement VLAN Hash Filtering in XGMAC")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> v2 changes:
> - Advertised NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only
>   when dma_cap.dvlan is set (reported by Sashiko).
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 16fe56a1f617..880cf3fab913 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6820,6 +6820,9 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
>  	if (!netif_running(priv->dev))
>  		return 0;
>  
> +	if (!priv->dma_cap.dvlan)
> +		is_double = false;
> +
>  	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
>  }
>  
> @@ -7954,14 +7957,18 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
>  #ifdef STMMAC_VLAN_TAG_USED
>  	/* Both mac100 and gmac support receive VLAN tag detection */
> -	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
> +	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
> +	if (priv->dma_cap.dvlan)
> +		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> +
>  	if (dwmac_is_xmac(priv->plat->core_type)) {
>  		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		priv->hw->hw_vlan_en = true;
>  	}
>  	if (priv->dma_cap.vlhash) {
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> -		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
> +		if (priv->dma_cap.dvlan)
> +			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
>  	}
>  	if (priv->dma_cap.vlins)
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;


