Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D968DCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ga2wjic9T8VzJuXCWKH+Uj/T9PGjvabNwcCK7WxQpK0=; b=o/G4dgEuLHpCde7Tvl+bbD6Rc6
	+7xn2OVb1XlFeAPlYXXQ8rfZNva6Gh9np82HF+iUcEGwifqS708pl8r9FAshau5gtS5TK+0lOkV54
	OHeGkOsbPkufj+utvgZhgm4HUzGaKnkiFPPRJEyGV19S2C8X3KOguE1Gf5DD57/kplDF7sBleRhlN
	zn2JnD5dAJpMrGtseoWlCNdfIwNHBapAV+vOW3wJT0Ww0rdA3ySUPJNOcsHbb5gTSBUNZu96NNsEz
	IW1eB28dD+i2zsWPCAovMF+HJ/8YczduRQWVLbu+O3mHzTEg5YEHnsFCbB8Pu+JFs19auI6er0B+P
	Xw6m0xfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZTp-000000038wu-3BKl;
	Wed, 22 Oct 2025 14:06:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZTo-000000038wN-2cQm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Oct 2025 14:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ga2wjic9T8VzJuXCWKH+Uj/T9PGjvabNwcCK7WxQpK0=; b=Gat0gP1FPtLhdLMGLXRNLMBJkM
	H1obw/Jnq04PM8GCRifUVJw1nNpyF2o7esK1pHtXNDSw6vjKD/yfX1rvEh3NK+3do3TouvIPLJD40
	4gB1NNXXTI8pg4d2nr6MMt82Jih6ydHy2acfTfmQ0pBd+uX/4QQnAvCMu9ZHUnoSTeZ+qe4J6TeBH
	aJ6vAaLJ6Gfvtcru5YbbBtxIn1/HKvyqbQKFfN87BuTcgdEbwRuhvUMGEPo2X/DKFlUfwYdqalTEu
	I9lIJlA6x4ytkk9IxD0Iccdgtj5bxvLLMCZXndObVOWw9ZGVxsLqFtvu416bY6kOfVpkmMcLoEURs
	aFp23O6w==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYc5-00000000byK-1jQZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:10:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED47E4E4127B;
	Wed, 22 Oct 2025 14:06:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0FC1606DC;
	Wed, 22 Oct 2025 14:06:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87CC2102F2432;
	Wed, 22 Oct 2025 16:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761141966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Ga2wjic9T8VzJuXCWKH+Uj/T9PGjvabNwcCK7WxQpK0=;
	b=uhgD8tnXycbKWWz5/zQAf9epeYRRcbjwqUoYWkhSy+Q7x5JzjSwiDg4V1UBIqksCE44Q/A
	hweWz1G8s6OwRRYaQFO25S/OcoQjoL7mdqn7RQXBY2tlc1fC+ONVDuEdwwe7bsO2F3h9lo
	H5PzwXHW8NeYz3TVLMrpmGK855qDx7pf5wCqJ/Bftal8BNMjLD8iOzOrh+jQQBtxF27td3
	ASxenBJlVqMtIyleCBai2rQPTb16hBit41QDcxU8ja5nWvQvHUCry9UGBrhKabn3Ixy5ln
	w5EzkMIAHgrO86PS2sp3SbM10IjWv8rlZmnir+b08i3EbNptabQ62SVpIm71MQ==
Message-ID: <6bff48d0-dd19-48d4-91e6-0d991365b8f9@bootlin.com>
Date: Wed, 22 Oct 2025 16:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/6] net: phylink: add phylink managed MAC
 Wake-on-Lan support
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_141049_543687_15FD1A43 
X-CRM114-Status: GOOD (  40.39  )
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



On 17/10/2025 14:04, Russell King (Oracle) wrote:
> Add core phylink managed Wake-on-Lan support, which is enabled when the
> MAC driver fills in the new .mac_wol_set() method that this commit
> creates.
> 
> When this feature is disabled, phylink acts as it has in the past,
> merely passing the ethtool WoL calls to phylib whenever a PHY exists.
> No other new functionality provided by this commit is enabled.
> 
> When this feature is enabled, a more inteligent approach is used.
> Phylink will first pass WoL options to the PHY, read them back, and
> attempt to set any options that were not set at the PHY at the MAC.
> 
> Since we have PHY drivers that report they support WoL, and accept WoL
> configuration even though they aren't wired up to be capable of waking
> the system, we need a way to differentiate between PHYs that think
> they support WoL and those which actually do. As PHY drivers do not
> make use of the driver model's wake-up infrastructure, but could, we
> use this to determine whether PHY drivers can participate. This gives
> a path forward where, as MAC drivers are converted to this, it
> encourages PHY drivers to also be converted.
> 
> Phylink will also ignore the mac_wol argument to phylink_suspend() as
> it now knows the WoL state at the MAC.
> 
> MAC drivers are expected to record/configure the Wake-on-Lan state in
> their .mac_set_wol() method, and deal appropriately with it in their
> suspend/resume methods. The driver model provides assistance to set the
> IRQ wake support which may assist driver authors in achieving the
> necessary configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 80 +++++++++++++++++++++++++++++++++++++--
>  include/linux/phylink.h   | 26 +++++++++++++
>  2 files changed, 102 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 9d7799ea1c17..939438a6d6f5 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -93,6 +93,9 @@ struct phylink {
>  	u8 sfp_port;
>  
>  	struct eee_config eee_cfg;
> +
> +	u32 wolopts_mac;
> +	u8 wol_sopass[SOPASS_MAX];
>  };
>  
>  #define phylink_printk(level, pl, fmt, ...) \
> @@ -2562,6 +2565,17 @@ void phylink_rx_clk_stop_unblock(struct phylink *pl)
>  }
>  EXPORT_SYMBOL_GPL(phylink_rx_clk_stop_unblock);
>  
> +static bool phylink_mac_supports_wol(struct phylink *pl)
> +{
> +	return !!pl->mac_ops->mac_wol_set;
> +}
> +
> +static bool phylink_phy_supports_wol(struct phylink *pl,
> +				     struct phy_device *phydev)
> +{
> +	return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
> +}
> +
>  /**
>   * phylink_suspend() - handle a network device suspend event
>   * @pl: a pointer to a &struct phylink returned from phylink_create()
> @@ -2575,11 +2589,17 @@ EXPORT_SYMBOL_GPL(phylink_rx_clk_stop_unblock);
>   *   can also bring down the link between the MAC and PHY.
>   * - If Wake-on-Lan is active, but being handled by the MAC, the MAC
>   *   still needs to receive packets, so we can not bring the link down.
> + *
> + * Note: when phylink managed Wake-on-Lan is in use, @mac_wol is ignored.
> + * (struct phylink_mac_ops.mac_set_wol populated.)
>   */
>  void phylink_suspend(struct phylink *pl, bool mac_wol)
>  {
>  	ASSERT_RTNL();
>  
> +	if (phylink_mac_supports_wol(pl))
> +		mac_wol = !!pl->wolopts_mac;
> +
>  	if (mac_wol && (!pl->netdev || pl->netdev->ethtool->wol_enabled)) {
>  		/* Wake-on-Lan enabled, MAC handling */
>  		mutex_lock(&pl->state_mutex);
> @@ -2689,8 +2709,24 @@ void phylink_ethtool_get_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
>  	wol->supported = 0;
>  	wol->wolopts = 0;
>  
> -	if (pl->phydev)
> -		phy_ethtool_get_wol(pl->phydev, wol);
> +	if (phylink_mac_supports_wol(pl)) {
> +		if (phylink_phy_supports_wol(pl, pl->phydev))
> +			phy_ethtool_get_wol(pl->phydev, wol);
> +
> +		/* Where the MAC augments the WoL support, merge its support and
> +		 * current configuration.
> +		 */
> +		if (~wol->wolopts & pl->wolopts_mac & WAKE_MAGICSECURE)
> +			memcpy(wol->sopass, pl->wol_sopass,
> +			       sizeof(wol->sopass));
> +
> +		wol->supported |= pl->config->wol_mac_support;
> +		wol->wolopts |= pl->wolopts_mac;
> +	} else {
> +		/* Legacy */
> +		if (pl->phydev)
> +			phy_ethtool_get_wol(pl->phydev, wol);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(phylink_ethtool_get_wol);
>  
> @@ -2707,12 +2743,48 @@ EXPORT_SYMBOL_GPL(phylink_ethtool_get_wol);
>   */
>  int phylink_ethtool_set_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
>  {
> +	struct ethtool_wolinfo w;
>  	int ret = -EOPNOTSUPP;
> +	bool changed;
> +	u32 wolopts;
>  
>  	ASSERT_RTNL();
>  
> -	if (pl->phydev)
> -		ret = phy_ethtool_set_wol(pl->phydev, wol);
> +	if (phylink_mac_supports_wol(pl)) {
> +		wolopts = wol->wolopts;
> +
> +		if (phylink_phy_supports_wol(pl, pl->phydev)) {
> +			ret = phy_ethtool_set_wol(pl->phydev, wol);
> +			if (ret != 0 && ret != -EOPNOTSUPP)
> +				return ret;
> +
> +			phy_ethtool_get_wol(pl->phydev, &w);
> +
> +			/* Any Wake-on-Lan modes which the PHY is handling
> +			 * should not be passed on to the MAC.
> +			 */
> +			wolopts &= ~w.wolopts;

When PHY drivers gets converted to the new model, we'll have to look at
how the .get_wol() behave WRT how they fill-in their wolopts.

The Broadcom driver for example may not set w.wolopts to 0 :

  https://elixir.bootlin.com/linux/v6.17.4/source/drivers/net/phy/broadcom.c#L1121

You'd probably end-up with garbage here then. But not blocking for your series.

> +		}
> +
> +		wolopts &= pl->config->wol_mac_support;
> +		changed = pl->wolopts_mac != wolopts;
> +		if (wolopts & WAKE_MAGICSECURE)
> +			changed |= !!memcmp(wol->sopass, pl->wol_sopass,
> +					    sizeof(wol->sopass));
> +		memcpy(pl->wol_sopass, wol->sopass, sizeof(pl->wol_sopass));
> +
> +		if (changed) {
> +			ret = pl->mac_ops->mac_wol_set(pl->config, wolopts,
> +						       wol->sopass);
> +			if (!ret)
> +				pl->wolopts_mac = wolopts;
> +		} else {
> +			ret = 0;
> +		}
> +	} else {
> +		if (pl->phydev)
> +			ret = phy_ethtool_set_wol(pl->phydev, wol);
> +	}
>  
>  	return ret;
>  }
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 9af0411761d7..59cb58b29d1d 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -156,6 +156,8 @@ enum phylink_op_type {
>   * @lpi_capabilities: MAC speeds which can support LPI signalling
>   * @lpi_timer_default: Default EEE LPI timer setting.
>   * @eee_enabled_default: If set, EEE will be enabled by phylink at creation time
> + * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
> + * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
>   */
>  struct phylink_config {
>  	struct device *dev;
> @@ -173,6 +175,10 @@ struct phylink_config {
>  	unsigned long lpi_capabilities;
>  	u32 lpi_timer_default;
>  	bool eee_enabled_default;
> +
> +	/* Wake-on-Lan support */
> +	bool wol_phy_legacy;
> +	u32 wol_mac_support;
>  };
>  
>  void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
> @@ -188,6 +194,7 @@ void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
>   * @mac_link_up: allow the link to come up.
>   * @mac_disable_tx_lpi: disable LPI.
>   * @mac_enable_tx_lpi: enable and configure LPI.
> + * @mac_wol_set: configure Wake-on-Lan settings at the MAC.
>   *
>   * The individual methods are described more fully below.
>   */
> @@ -211,6 +218,9 @@ struct phylink_mac_ops {
>  	void (*mac_disable_tx_lpi)(struct phylink_config *config);
>  	int (*mac_enable_tx_lpi)(struct phylink_config *config, u32 timer,
>  				 bool tx_clk_stop);
> +
> +	int (*mac_wol_set)(struct phylink_config *config, u32 wolopts,
> +			   const u8 *sopass);
>  };
>  
>  #if 0 /* For kernel-doc purposes only. */
> @@ -440,6 +450,22 @@ void mac_disable_tx_lpi(struct phylink_config *config);
>   */
>  int mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
>  		      bool tx_clk_stop);
> +
> +/**
> + * mac_wol_set() - configure the Wake-on-Lan parameters
> + * @config: a pointer to a &struct phylink_config.
> + * @wolopts: Bitmask of %WAKE_* flags for enabled Wake-On-Lan modes.
> + * @sopass: SecureOn(tm) password; meaningful only for %WAKE_MAGICSECURE
> + *
> + * Enable the specified Wake-on-Lan options at the MAC. Options that the
> + * PHY can handle will have been removed from @wolopts.
> + *
> + * The presence of this method enables phylink-managed WoL support.
> + *
> + * Returns: 0 on success.
> + */
> +int (*mac_wol_set)(struct phylink_config *config, u32 wolopts,
> +		   const u8 *sopass);
>  #endif
>  
>  struct phylink_pcs_ops;

As far as my current WoL knowedge goes, this looks good to me.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


