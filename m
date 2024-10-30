Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A43BD5CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71Z6N0f0s9Q9l3FMkhrwHC4fWFLGTTR2mo+j6DbIOd4=; b=sUzM+bjhGLMpnsO6PTx3CfUQ18
	vMWRVwTOAM7QeP6Hy34AtBaM464CQz3b2SPs72SB5qgvpd59dYcq5dXkFAbxPCvCVqe3/86H9w+9U
	9EU5A03F5ENU3JCa3/BTzfLfSJ00EtO/odHeR5ZGih+2vr7l5LGac5L8A8cVETono1OcQlQs+JgPt
	l/iBmha4eHXsB1ZfJtjN069nXrNJMzRRcIyhQDtru3rm8O2eRpeYa29HMG/qvyNDHQyOVdUTkG348
	cJks+1PiHP9nulNPxuWQv0wpIhbxR+G29eK/VLgrT+2C2ee0u2djR9vf2F35wGW4TIt99HpfAEWq9
	+VC6r/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67K1-00000000F1r-3JoQ;
	Wed, 30 Oct 2024 11:57:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67AO-00000000Ch9-14vL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:47:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d4fa7d3baso733798f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730288830; x=1730893630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=71Z6N0f0s9Q9l3FMkhrwHC4fWFLGTTR2mo+j6DbIOd4=;
        b=XeJQ6dG2av7Jy87zeakjSwTV589l/XxEhyEbkj2l0feEGyQbtfdcPllHxFb9AYoRF4
         HdGSbmYHada29LEmc/Kl9e4Lc6r+1z0yeHMB6MITom8h9EHxPkjPP7wF2S3QZe7/FYq1
         tOzxUy7saUQKJ7EJGNrF58dVJn0X2EqUb8WnZAM4GikiA4U5mozZ+Jkxdlxd4qY9hkTR
         2jQL/1sCdfwBU+iB+m4ZOVt2vU1BXFZEBk4xg21I0vYWm4qPNUTqf2qsZhJO/B0R1nGb
         lxfXEAyleFKJ80r+9m81+pa7JTgF7KorYRXRi+96FugiQOvJcibf3pR/maIE/plFAzvh
         NHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730288830; x=1730893630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71Z6N0f0s9Q9l3FMkhrwHC4fWFLGTTR2mo+j6DbIOd4=;
        b=ClxI1B5Xc7wcNP+FZ9gW5G+dtiWEwknMICWcmaERiDOQwPCEqa5/4CghFXqku8wChR
         wIsYpjfs8Mqbnosrq3TEJUIFEKuCJirjBRwPg1fm2pa9cnpsbhtm8k0pACR819FQ9WQW
         8Xc0/iu3HNari8b0XpWuBvqOUnEDUZwQxMQjUUOKF4Wa/cLOiHMg3ZN+huZtdNL29hcj
         PfBVCbt6/GLzSvBZXu2i2B0qQJrGtOflaZVfZVC6RFw+mVfVISw7cmXT39xzPzY5p9WE
         eJIyzyPYDg6K6u6I6a9tsTnnXfgZ09z/7oLb20pgEO4nVEFWN5VRSc9aCdC4wzG7lEgj
         Gvlg==
X-Forwarded-Encrypted: i=1; AJvYcCVJODPWOfyd90CEwwo9thneAdcV0FNpLjsTSKMN2RgSZkOwvR/7JdahWANL4Zon8t8oZsiNVYPa/Akfh8x/wEMw@lists.infradead.org
X-Gm-Message-State: AOJu0YyYtwaKAhpfcvYXechkhBbZect9lIfJZegihRAAQ597adubgx36
	FXVXlFu0uav2GQUcACwqqr2CetI1nzC74razmGiDbvQzUuAyHYoYmmNNNC3s
X-Google-Smtp-Source: AGHT+IH9XhTipE8INCmJM9rDpTSk6gZJf8Rw2L5Pqs2PM2odooDFAsmqFnRjL6M7rtEJXarPjCXh7g==
X-Received: by 2002:a05:6000:18a3:b0:378:c6f5:9e54 with SMTP id ffacd0b85a97d-3806112785amr5406861f8f.5.1730288829817;
        Wed, 30 Oct 2024 04:47:09 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd917f0bsm18906905e9.17.2024.10.30.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:47:08 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:47:06 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v6 3/6] net: stmmac: Refactor FPE functions to
 generic version
Message-ID: <20241030114706.yaevtgpefwfxva5v@skbuf>
References: <cover.1730263957.git.0x1207@gmail.com>
 <cover.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
 <cc87e0e02610a5ebfb0079716061f57fb9678dfc.1730263957.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_044712_379820_1A781DF4 
X-CRM114-Status: GOOD (  24.16  )
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

On Wed, Oct 30, 2024 at 01:36:12PM +0800, Furong Xu wrote:
> FPE implementation for DWMAC4 and DWXGMAC differs only for:
> 1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
> 2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
> 3) Bit offset of Frame Preemption Interrupt Enable
> 
> Refactor FPE functions to avoid code duplication.

I would add "and to simplify the code flow by avoiding the use of
function pointers".

> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index 70ea475046f0..ee86658f77b4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -27,6 +27,20 @@
>  #define STMMAC_MAC_FPE_CTRL_STS_SVER	BIT(1)
>  #define STMMAC_MAC_FPE_CTRL_STS_EFPE	BIT(0)
>  
> +struct stmmac_fpe_reg {
> +	const u32 mac_fpe_reg;		/* offset of MAC_FPE_CTRL_STS */
> +	const u32 mtl_fpe_reg;		/* offset of MTL_FPE_CTRL_STS */
> +	const u32 rxq_ctrl1_reg;	/* offset of MAC_RxQ_Ctrl1 */
> +	const u32 fprq_mask;		/* Frame Preemption Residue Queue */
> +	const u32 int_en_reg;		/* offset of MAC_Interrupt_Enable */
> +	const u32 int_en_bit;		/* Frame Preemption Interrupt Enable */
> +};
> +
> +bool stmmac_fpe_supported(struct stmmac_priv *priv)
> +{
> +	return (priv->dma_cap.fpesel && priv->fpe_cfg.reg);
> +}

This is a separate logical change from just refactoring. Refactoring
changes (which are noisy) should not have functional changes. Could
the introduction and use of stmmac_fpe_supported() please be a separate
patch?

Also, parentheses are not necessary.

> +
>  void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> @@ -38,25 +52,19 @@ void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  
>  	if (is_up && fpe_cfg->pmac_enabled) {
>  		/* VERIFY process requires pmac enabled when NIC comes up */
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> -				     priv->plat->rx_queues_to_use,
> -				     false, true);
> +		stmmac_fpe_configure(priv, false, true);
>  
>  		/* New link => maybe new partner => new verification process */
>  		stmmac_fpe_apply(priv);
>  	} else {
>  		/* No link => turn off EFPE */
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> -				     priv->plat->rx_queues_to_use,
> -				     false, false);
> +		stmmac_fpe_configure(priv, false, false);
>  	}
>  
>  	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
>  }
>  
> -void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
> +static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
>  
> @@ -68,8 +76,7 @@ void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
>  
>  	/* LP has sent verify mPacket */
>  	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER)
> -		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> -					MPACKET_RESPONSE);
> +		stmmac_fpe_send_mpacket(priv, MPACKET_RESPONSE);
>  
>  	/* Local has sent verify mPacket */
>  	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER &&
> @@ -107,8 +114,7 @@ static void stmmac_fpe_verify_timer(struct timer_list *t)
>  	case ETHTOOL_MM_VERIFY_STATUS_INITIAL:
>  	case ETHTOOL_MM_VERIFY_STATUS_VERIFYING:
>  		if (fpe_cfg->verify_retries != 0) {
> -			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> -						fpe_cfg, MPACKET_VERIFY);
> +			stmmac_fpe_send_mpacket(priv, MPACKET_VERIFY);
>  			rearm = true;
>  		} else {
>  			fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
> @@ -118,10 +124,7 @@ static void stmmac_fpe_verify_timer(struct timer_list *t)
>  		break;
>  
>  	case ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED:
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> -				     priv->plat->rx_queues_to_use,
> -				     true, true);
> +		stmmac_fpe_configure(priv, true, true);
>  		break;
>  
>  	default:
> @@ -154,6 +157,9 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
>  	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
>  	timer_setup(&priv->fpe_cfg.verify_timer, stmmac_fpe_verify_timer, 0);
>  	spin_lock_init(&priv->fpe_cfg.lock);
> +
> +	if (priv->dma_cap.fpesel && !priv->fpe_cfg.reg)
> +		dev_info(priv->device, "FPE on this MAC is not supported by driver.\n");

This as well.

>  }
>  
>  void stmmac_fpe_apply(struct stmmac_priv *priv)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> index 25725fd5182f..00e616d7cbf1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> @@ -22,24 +22,21 @@ struct stmmac_priv;
>  struct stmmac_fpe_cfg;
>  
>  void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
> -void stmmac_fpe_event_status(struct stmmac_priv *priv, int status);
> +bool stmmac_fpe_supported(struct stmmac_priv *priv);
>  void stmmac_fpe_init(struct stmmac_priv *priv);
>  void stmmac_fpe_apply(struct stmmac_priv *priv);
> -
> -void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> -			  u32 num_txq, u32 num_rxq,
> -			  bool tx_enable, bool pmac_enable);
> -void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
> -			     struct stmmac_fpe_cfg *cfg,
> +void stmmac_fpe_configure(struct stmmac_priv *priv, bool tx_enable,
> +			  bool pmac_enable);
> +void stmmac_fpe_send_mpacket(struct stmmac_priv *priv,
>  			     enum stmmac_mpacket_type type);

Sorry I noticed this just now. After the refactoring, stmmac_fpe_send_mpacket()
is only used from stmmac_fpe.c, and thus can be unexported and made static.
Same goes for enum stmmac_mpacket_type.

> -int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
> -int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr);
> -void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size);
> +void stmmac_fpe_irq_status(struct stmmac_priv *priv);
> +int stmmac_fpe_get_add_frag_size(struct stmmac_priv *priv);
> +void stmmac_fpe_set_add_frag_size(struct stmmac_priv *priv, u32 add_frag_size);
> +
>  int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
>  				    struct netlink_ext_ack *extack, u32 pclass);
>  
> -void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> -			    u32 num_txq, u32 num_rxq,
> -			    bool tx_enable, bool pmac_enable);
> +extern const struct stmmac_fpe_reg dwmac5_fpe_reg;
> +extern const struct stmmac_fpe_reg dwxgmac3_fpe_reg;
>  
>  #endif

