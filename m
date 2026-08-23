Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47476C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fhUMIAyhHyUqTny7qIQebeim9hGmWBvshZ2J8DNqrQ=; b=qZVoFstj9RzPtjGb/Vg0nyQRP7
	j1gfZ0iCSacrmvL2wWddOIXtYTVCGqMfFXH1iWuVKR0qzLr00uYzTDGYONigin52VtIE6yyNRoDCJ
	023QtJQWEmrTem4MPD3lvo6shYj+vos20+BEm+OjcakNYeNTekCpaZkxEY+fUwzTss0L8cLYVlk2Z
	mQStoBpQT9gnVmgWC0MrK7b7wkatOOAV+WRaoBJP3UgEcvhhj52NOGiMlqQgnf3V+5xwvWqV1sgxE
	nw+0vpNe0busHgoumeLnreQNVpCfiPTIb7Xgy5DP6WRjjXmBCCGO1+lEb3jXgZYeKg8hx5OWUvT6X
	iYw+RDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy30q-0000000FACk-36q2;
	Sun, 23 Aug 2026 07:53:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy30o-0000000FACK-0fxI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 07:53:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B0CE04E41360;
	Sun, 23 Aug 2026 07:52:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7AE4460378;
	Sun, 23 Aug 2026 07:52:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1525511C77E04;
	Sun, 23 Aug 2026 09:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787471574; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0fhUMIAyhHyUqTny7qIQebeim9hGmWBvshZ2J8DNqrQ=;
	b=plJijy2n0SbryKMd9AR/5KgVmzUabWpxH7JMMgRN2K+TOZwa0S3GQqNsr776OnuQFQqjjk
	aVCM5FvJl9w9Co/WAZvA5Jkjm56NEuv5SP4WoqB5NOp+46c/TA6svpMdpRG6NIAFXLd1Ga
	TujJqqWbXPDpKOvIPRs+ZZyQxWT5vbKyzeRe5FWc3qTcu+O39VkxpZS+9opViyO3ejZyQn
	XiPyN6yVSZ9ZB/p17VtqVxEQhh+Tg28QL8Me/zrX3oPIpf/WImc7HAurQOyqd//+BDISk6
	7Q/udo9c/BOLVcL3i3BwX5Y0cSdjQfrqYEdF5F+qqdZY9JeNwhGVwOCViLdwzw==
Message-ID: <44aa070c-830b-4d5e-bc02-cba5f10c585a@bootlin.com>
Date: Sun, 23 Aug 2026 09:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 3/6] net: stmmac: Move double VLAN handling to a
 dedicated op
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shuah@kernel.org, joabreu@synopsys.com, yi.fang.gan@intel.com,
 jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-4-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260821170959.79708-4-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_005302_515265_DFE90FFA 
X-CRM114-Status: GOOD (  19.81  )
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
> The double VLAN bits (EDVLP, ESVL, DOVLTC) are currently handled inside
> update_vlan_hash(). This ties the double VLAN state to the hash filter
> update, even though the two features are independent: hash filtering is
> controlled by dma_cap.vlhash and double vlan by dma_cap.dvlan.
> 
> In preparation for removing double vlan support from dwmac4, move the
> double vlan logic into a separate update_dvlan_state() VLAN operation.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

This is some nice code simplification, no more is_double everywhere, thanks!

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> v2 changes: None.
> 
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 ++-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +--
>  .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 45 ++++++++-----------
>  3 files changed, 25 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 6f26dbf95ce1..66837caafa84 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -632,8 +632,8 @@ struct stmmac_est_ops {
>  
>  struct stmmac_vlan_ops {
>  	/* VLAN */
> -	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
> -				 bool is_double);
> +	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash);
> +	void (*update_dvlan_state)(struct mac_device_info *hw, bool enable);
>  	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
>  	void (*rx_hw_vlan)(struct mac_device_info *hw, struct dma_desc *rx_desc,
>  			   struct sk_buff *skb);
> @@ -650,6 +650,8 @@ struct stmmac_vlan_ops {
>  
>  #define stmmac_update_vlan_hash(__priv, __args...) \
>  	stmmac_do_void_callback(__priv, vlan, update_vlan_hash, __args)
> +#define stmmac_update_dvlan_state(__priv, __args...) \
> +	stmmac_do_void_callback(__priv, vlan, update_dvlan_state, __args)
>  #define stmmac_enable_vlan(__priv, __args...) \
>  	stmmac_do_void_callback(__priv, vlan, enable_vlan, __args)
>  #define stmmac_rx_hw_vlan(__priv, __args...) \
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 880cf3fab913..802f9e67a4bc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6820,10 +6820,10 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
>  	if (!netif_running(priv->dev))
>  		return 0;
>  
> -	if (!priv->dma_cap.dvlan)
> -		is_double = false;
> +	if (priv->dma_cap.dvlan)
> +		stmmac_update_dvlan_state(priv, priv->hw, is_double);
>  
> -	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
> +	return stmmac_update_vlan_hash(priv, priv->hw, hash);
>  }
>  
>  /* FIXME: This may need RXC to be running, but it may be called with BH
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> index 983a90cb9767..1e47ae62093e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> @@ -161,8 +161,20 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
>  		vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
>  }
>  
> -static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> -			     bool is_double)
> +static void vlan_update_dvlan_state(struct mac_device_info *hw, bool enable)
> +{
> +	void __iomem *ioaddr = hw->pcsr;
> +	u32 value;
> +
> +	value = readl(ioaddr + VLAN_TAG);
> +	if (enable)
> +		value |= VLAN_EDVLP | VLAN_ESVL | VLAN_DOVLTC;
> +	else
> +		value &= ~(VLAN_EDVLP | VLAN_ESVL | VLAN_DOVLTC);
> +	writel(value, ioaddr + VLAN_TAG);
> +}
> +
> +static void vlan_update_hash(struct mac_device_info *hw, u32 hash)
>  {
>  	void __iomem *ioaddr = hw->pcsr;
>  	u32 value;
> @@ -173,21 +185,9 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
>  
>  	if (hash) {
>  		value |= VLAN_VTHM | VLAN_ETV;
> -		if (is_double) {
> -			value |= VLAN_EDVLP;
> -			value |= VLAN_ESVL;
> -			value |= VLAN_DOVLTC;
> -		} else {
> -			value &= ~VLAN_EDVLP;
> -			value &= ~VLAN_ESVL;
> -			value &= ~VLAN_DOVLTC;
> -		}
> -
>  		writel(value, ioaddr + VLAN_TAG);
>  	} else {
>  		value &= ~(VLAN_VTHM | VLAN_ETV);
> -		value &= ~(VLAN_EDVLP | VLAN_ESVL);
> -		value &= ~VLAN_DOVLTC;
>  		value &= ~VLAN_VID;
>  
>  		writel(value, ioaddr + VLAN_TAG);
> @@ -236,8 +236,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
>  	writel(value, ioaddr + VLAN_TAG);
>  }
>  
> -static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
> -				      bool is_double)
> +static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash)
>  {
>  	void __iomem *ioaddr = hw->pcsr;
>  
> @@ -253,15 +252,6 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
>  		value = readl(ioaddr + VLAN_TAG);
>  
>  		value |= VLAN_VTHM | VLAN_ETV;
> -		if (is_double) {
> -			value |= VLAN_EDVLP;
> -			value |= VLAN_ESVL;
> -			value |= VLAN_DOVLTC;
> -		} else {
> -			value &= ~VLAN_EDVLP;
> -			value &= ~VLAN_ESVL;
> -			value &= ~VLAN_DOVLTC;
> -		}
>  
>  		value &= ~VLAN_VID;
>  		writel(value, ioaddr + VLAN_TAG);
> @@ -275,8 +265,6 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
>  		value = readl(ioaddr + VLAN_TAG);
>  
>  		value &= ~(VLAN_VTHM | VLAN_ETV);
> -		value &= ~(VLAN_EDVLP | VLAN_ESVL);
> -		value &= ~VLAN_DOVLTC;
>  		value &= ~VLAN_VID;
>  
>  		writel(value, ioaddr + VLAN_TAG);
> @@ -285,6 +273,7 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
>  
>  const struct stmmac_vlan_ops dwmac_vlan_ops = {
>  	.update_vlan_hash = vlan_update_hash,
> +	.update_dvlan_state = vlan_update_dvlan_state,
>  	.enable_vlan = vlan_enable,
>  	.add_hw_vlan_rx_fltr = vlan_add_hw_rx_fltr,
>  	.del_hw_vlan_rx_fltr = vlan_del_hw_rx_fltr,
> @@ -295,11 +284,13 @@ const struct stmmac_vlan_ops dwmac_vlan_ops = {
>  
>  const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
>  	.update_vlan_hash = dwxgmac2_update_vlan_hash,
> +	.update_dvlan_state = vlan_update_dvlan_state,
>  	.enable_vlan = vlan_enable,
>  };
>  
>  const struct stmmac_vlan_ops dwxgmac210_vlan_ops = {
>  	.update_vlan_hash = dwxgmac2_update_vlan_hash,
> +	.update_dvlan_state = vlan_update_dvlan_state,
>  	.enable_vlan = vlan_enable,
>  	.add_hw_vlan_rx_fltr = vlan_add_hw_rx_fltr,
>  	.del_hw_vlan_rx_fltr = vlan_del_hw_rx_fltr,


