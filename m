Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBB8C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXyDR2aoGmqa/ry9trMCWOUWtnS28B+S6u9akER2pfc=; b=MkuZKxKIajri7Mt5mY/YlZrsuU
	8jFg8Bc337vw8WjzTuPAFYhznidg77GOWokHb1P+Wb+xBha1nvuC9Y/Me/F6pXzvhEVkuZQVfwX1x
	y/DCjeuJ1r7AG60l6wn6qSZ4BbGdsgB5fvb/1H3Kt0awx0rnr3sVOPEg+cj/LN80nwb1UVAKiPpSC
	zNFha+9g+t1kM9ApI6T2NOw0bKQFIaKSaEgwIr7yUR73vG3GldY+gx4jCyjgY6DDWcBM8TSALrERw
	GJ1WQizwungu670EzrwOqHAgvpcSgFKBHKOBzVYB1/zGh/hf2fCps5fGtMFER1iOaMNmu+7rH/H+Y
	XTRzVfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYt-00000009aSK-2nZT;
	Wed, 16 Sep 2026 15:28:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rYs-00000009aRv-27l9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:28:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 442D7433F1;
	Wed, 16 Sep 2026 15:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3705B1F000FF;
	Wed, 16 Sep 2026 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572518;
	bh=VXyDR2aoGmqa/ry9trMCWOUWtnS28B+S6u9akER2pfc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DuUH8HDe+nfP4a1Pr6P8JoxW7zaLtc5d88vNkBwDNx5oMReJwdDYrQnDcWEkal/TD
	 CJz+mqGqkSruqxyd5Ff0Em+SqmaskRc1LS8RR4DHq1vezQHXG5QMLCBWIceb4Op5T1
	 vsiKBHA9I72aFggw8SCPlyaxLgsUYt49sJU1k6f7aOFpvYqNhAaRE3zW/u3w1jUtmP
	 5hIDSvZ1GpJbHiM14ral/arSJpmAjGuI0wiGBOAaGy5ec8OdU+z3FQ7RwYpT1/UM6j
	 fCs4naHGJnp8KToAn5RevHB+LHYyyJ65XJ6yWPNoCU9IX7479F/H4LFiWhiH6sz4GR
	 8lmpxOFnv79/A==
Subject: Re: [PATCH net v5] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, rayagond@vayavyalabs.com, treding@nvidia.com,
 linux@armlinux.org.uk, qiangqing.zhang@nxp.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 16 Sep 2026 15:28:36 +0000
Message-ID: <178957251673.22033.10412264976351408309@kernel.org>
In-Reply-To: <20260914-stmmac-ptp-error-propagate-v5-1-81149897e65d@oss.qualcomm.com>
References: <20260914-stmmac-ptp-error-propagate-v5-1-81149897e65d@oss.qualcomm.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 1 (1) · Medium: 3 (3) · Low: 0

- [High] The claimed propagation of stmmac_init_timestamping() failures
  is vacuous: after this patch stmmac_init_tstamp_counter()…
- [Medium] The patch splits the hardware-timestamping gate across peer
  sites of the same uAPI.
- [Medium] In stmmac_resume(), when priv->ptp_enabled is true but
  stmmac_init_ptp_clk_freq() fails (clk_ptp_rate came back as 0), the…
- [Medium] The patch makes 'interface operational with an unconfigured
  PTP reference clock' an explicitly supported state (stmmac_setup_ptp()…

Pre-existing issues:
- [High] The new ptp_error unwind adds another way for __stmmac_open() to
  fail *after* `memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf))`…
- [Medium] stmmac_init_timestamping() hardcodes `STMMAC_HWTS_ACTIVE |
  PTP_TCR_TSCFUPDT` (fine update), overwrites priv->systime_flags and…
- [Medium] stmmac_get_ts_info() reports `info->phc_index = 0` when
  priv->ptp_clock is NULL, whereas the ethtool core uses -1 to express…
- [Medium] If clk_prepare_enable(priv->plat->clk_ptp_ref) fails in
  stmmac_pltfr_noirq_resume() (stmmac_platform.c:990), the function…

--

net: stmmac: propagate PTP init failures in __stmmac_open() and stmmac_resume()

This makes stmmac_setup_ptp() return an error code so that PTP setup
failures are propagated by __stmmac_open() and stmmac_resume(), factors the
timestamping capability test into stmmac_check_timestamp_cap(), moves the
platform PTP clock rate configuration into stmmac_init_ptp_clk_freq(), and
gates the noirq suspend/resume PTP reference clock handling on a new
priv->ptp_enabled flag.

A few questions below.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 7582fca637419..4fc96b317d79c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h

[ ... ]

> @@ -419,6 +421,11 @@ int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
>  
>  struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev);
>  
> +static inline bool stmmac_check_timestamp_cap(struct stmmac_priv *priv)
> +{
> +	return priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp;
> +}
> +
>  static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
>  {
>  	return !!priv->xdp_prog;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 154cc0c7623da..7758b854700a3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -1007,8 +1007,7 @@ static int stmmac_get_ts_info(struct net_device *dev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if ((priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
> -
> +	if (stmmac_check_timestamp_cap(priv)) {
>  		info->so_timestamping = SOF_TIMESTAMPING_TX_SOFTWARE |
>  					SOF_TIMESTAMPING_TX_HARDWARE |
>  					SOF_TIMESTAMPING_RX_HARDWARE |

[Severity: Medium]
This is a pre-existing issue and not something this patch introduces, but
this branch of stmmac_get_ts_info() reports phc_index = 0 when
priv->ptp_clock is NULL:

	if (priv->ptp_clock)
		info->phc_index = ptp_clock_index(priv->ptp_clock);
	else
		info->phc_index = 0;

The ethtool core expresses "no PHC" with -1 (ethtool_init_tsinfo() and
ethtool_op_get_ts_info() both set info->phc_index = -1), so index 0 is
reported to userspace as a real PHC that usually belongs to another
device.

The patch makes the unregistered-PHC case a normal outcome, since
stmmac_setup_ptp() now returns success without registering the clock when
no rate is available. Should the else branch leave the core's -1 in place?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 62c3441911e71..0cc6eafa19a3d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -653,7 +653,8 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
>  	u32 ts_master_en = 0;
>  	u32 ts_event_en = 0;
>  
> -	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
> +	if (!priv->plat->clk_ptp_rate ||
> +	    !(priv->dma_cap.time_stamp || priv->adv_ts)) {
>  		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
>  		priv->hwts_tx_en = 0;
>  		priv->hwts_rx_en = 0;

[Severity: Medium]
Should the clk_ptp_rate requirement be applied to the peer sites of the
same uAPI too?

The set path now returns -EOPNOTSUPP when clk_ptp_rate is zero, while
stmmac_hwtstamp_get() and stmmac_get_ts_info() were converted to
stmmac_check_timestamp_cap(), which only tests dma_cap.time_stamp /
dma_cap.atime_stamp.

On the configuration this patch newly declares supported (PTP-capable
silicon, no PTP clock rate, so stmmac_setup_ptp() returns 0 without
registering the PHC) ethtool -T still advertises
SOF_TIMESTAMPING_TX_HARDWARE / SOF_TIMESTAMPING_RX_HARDWARE plus the full
rx_filters list and SIOCGHWTSTAMP still succeeds, but every SIOCSHWTSTAMP
is rejected.

That state looks reachable at probe time, since stmmac_probe_config_dt()
does:

	plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);

which yields 0 when the CSR clock lookup only warned and stmmac_clk is
NULL and no ptp_ref clock is described.

> @@ -843,7 +844,7 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
> +	if (!stmmac_check_timestamp_cap(priv))
>  		return -EOPNOTSUPP;
>  
>  	*config = priv->tstamp_config;
> @@ -866,11 +867,6 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
>  {
>  	struct timespec64 now;
>  
> -	if (!priv->plat->clk_ptp_rate) {
> -		netdev_err(priv->dev, "Invalid PTP clock rate");
> -		return -EINVAL;
> -	}
> -
>  	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
>  	priv->systime_flags = systime_flags;

[Severity: High]
With this check moved out, does stmmac_init_tstamp_counter() still have any
failure path left? The remainder is:

	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
	priv->systime_flags = systime_flags;

	stmmac_update_subsecond_increment(priv);

	ktime_get_real_ts64(&now);

	stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec, now.tv_nsec);

	return 0;

stmmac_update_subsecond_increment() is void and discards the status of
config_addend(), and the int returned by the stmmac_init_systime() callback
is dropped, so the function looks like it can only return 0.

If that is the case, stmmac_init_timestamping() can only return 0 as well,
and then the netdev_warn("PTP init failed") branch, the

	ret = stmmac_init_timestamping(priv);
	if (ret) {
		clk_disable_unprepare(priv->plat->clk_ptp_ref);
		return ret;
	}

block in stmmac_setup_ptp(), the goto error_stop_dma in stmmac_resume() and
the whole new error_stop_dma label are unreachable.

The failure named in the commit message ("the MAC system time counter is
left in its post-reset, non-running state") is exactly what init_systime()
reports:

drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c:init_systime() {
	...
	return readl_poll_timeout_atomic(ioaddr + PTP_TCR, value,
				 !(value & PTP_TCR_TSINIT),
				 10, 100000);
}

When that times out with -ETIMEDOUT, execution still reaches
stmmac_ptp_register() and priv->ptp_enabled = true, so the interface comes
up with a stopped time base that TAPRIO/EST offload will arm against.
Should the hwif return values be checked so the only genuinely propagated
error is not just the clk_prepare_enable() one?

> @@ -885,26 +881,37 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
>  	return 0;
>  }
>  
> +static int stmmac_init_ptp_clk_freq(struct stmmac_priv *priv)
> +{
> +	if (priv->plat->ptp_clk_freq_config)
> +		priv->plat->ptp_clk_freq_config(priv);
> +
> +	if (!priv->plat->clk_ptp_rate) {
> +		netdev_info(priv->dev, "PTP clock rate not configured\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * stmmac_init_timestamping - initialise timestamping
>   * @priv: driver private structure
> - * Description: this is to verify if the HW supports the PTPv1 or PTPv2.
> - * This is done by looking at the HW cap. register.
> - * This function also registers the ptp driver.
> + *
> + * Description: initialise the hardware timestamping counter, reset the
> + * timestamping configuration and derive the advanced timestamping flags from
> + * the HW capabilities. The caller must have ensured a valid PTP reference
> + * clock rate (see stmmac_init_ptp_clk_freq()); the configured state is valid
> + * as long as the interface is open and not suspended, and this function is
> + * re-run on resume.
> + *
> + * Return: 0 on success, a negative errno otherwise.
>   */
>  static int stmmac_init_timestamping(struct stmmac_priv *priv)
>  {
>  	bool xmac = dwmac_is_xmac(priv->plat->core_type);
>  	int ret;
>  
> -	if (priv->plat->ptp_clk_freq_config)
> -		priv->plat->ptp_clk_freq_config(priv);
> -
> -	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
> -		netdev_info(priv->dev, "PTP not supported by HW\n");
> -		return -EOPNOTSUPP;
> -	}
> -
>  	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE |
>  					       PTP_TCR_TSCFUPDT);
>  	if (ret) {

[Severity: Medium]
This isn't a bug introduced by this patch, but since the resume path is
being reworked to re-run stmmac_init_timestamping() under
if (priv->ptp_enabled), the hardcoded PTP_TCR_TSCFUPDT here reverts a
devlink-configured coarse mode after every suspend/resume, while
stmmac_dl_ts_coarse_get() keeps reporting the old value:

	priv->tsfupdt_coarse = ctx->val.vbool;
	...
	ctx->val.vbool = priv->tsfupdt_coarse;

The same function also does:

	memset(&priv->tstamp_config, 0, sizeof(priv->tstamp_config));
	priv->hwts_tx_en = 0;
	priv->hwts_rx_en = 0;

so an active SIOCSHWTSTAMP configuration is dropped across suspend as
well. I see from the v4/v5 notes that the subsecond increment rework was
deliberately deferred, so this is noted only for completeness.

> @@ -937,24 +944,48 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
>  	return 0;
>  }
>  
> -static void stmmac_setup_ptp(struct stmmac_priv *priv)
> +static int stmmac_setup_ptp(struct stmmac_priv *priv)
>  {
>  	int ret;
>  
> +	if (!stmmac_check_timestamp_cap(priv)) {
> +		netdev_info(priv->dev, "PTP not supported\n");
> +		return 0;
> +	}
> +
>  	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		netdev_warn(priv->dev,
>  			    "failed to enable PTP reference clock: %pe\n",
>  			    ERR_PTR(ret));
> +		return ret;
> +	}
>  
> -	if (stmmac_init_timestamping(priv) == 0)
> -		stmmac_ptp_register(priv);
> +	if (stmmac_init_ptp_clk_freq(priv)) {
> +		clk_disable_unprepare(priv->plat->clk_ptp_ref);
> +		return 0;
> +	}

[Severity: Medium]
This path makes "interface up with clk_ptp_rate == 0 and clk_ptp_ref
disabled" a supported state. Is the devlink runtime setter still safe in
that state?

stmmac_dl_ts_coarse_set() ("phc_coarse_adj", CAP_NET_ADMIN) has no
clk_ptp_rate or ptp_enabled check:

	/* In Coarse mode, we can use a smaller subsecond increment, let's
	 * reconfigure the systime, subsecond increment and addend.
	 */
	stmmac_update_subsecond_increment(priv);

and that helper divides by the rate:

	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);

as does the hwif callback it invokes:

drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c:config_sub_second_increment() {
	if (value & PTP_TCR_TSCFUPDT)
		data = (2000000000ULL / ptp_clock);
	else
		data = (1000000000ULL / ptp_clock);
	...
}

Devlink is only registered when clk_ptp_rate was nonzero at probe, but a
platform ptp_clk_freq_config() callback can turn it into zero later, e.g.

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:ethqos_ptp_clk_freq_config() {
	...
	plat_dat->clk_ptp_rate = clk_get_rate(plat_dat->clk_ptp_ref);
}

after which this return 0 (and the goto init_coalesce in stmmac_resume())
keeps the interface and its registered devlink params alive. A subsequent
devlink dev param set then divides by zero and programs PTP_SSIR/addend
with clk_ptp_ref disabled. Should the rate requirement be extended to the
devlink setter as well?

> +
> +	ret = stmmac_init_timestamping(priv);
> +	if (ret) {
> +		clk_disable_unprepare(priv->plat->clk_ptp_ref);
> +		return ret;
> +	}
> +
> +	stmmac_ptp_register(priv);
> +	priv->ptp_enabled = true;
> +
> +	return 0;
>  }
>  
>  static void stmmac_release_ptp(struct stmmac_priv *priv)
>  {
> +	if (!priv->ptp_enabled)
> +		return;
> +
>  	stmmac_ptp_unregister(priv);
>  	clk_disable_unprepare(priv->plat->clk_ptp_ref);
> +	priv->ptp_enabled = false;
>  }

[ ... ]

> @@ -4161,10 +4192,12 @@ static int __stmmac_open(struct net_device *dev,
>  	ret = stmmac_hw_setup(dev);
>  	if (ret < 0) {
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> -		goto init_error;
> +		return ret;
>  	}
>  
> -	stmmac_setup_ptp(priv);
> +	ret = stmmac_setup_ptp(priv);
> +	if (ret)
> +		goto ptp_error;
>  
>  	stmmac_init_coalesce(priv);
>  
> @@ -4189,7 +4222,10 @@ static int __stmmac_open(struct net_device *dev,
>  		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
>  
>  	stmmac_release_ptp(priv);
> -init_error:
> +ptp_error:
> +	stmmac_stop_all_dma(priv);
> +	stmmac_mac_set(priv, priv->ioaddr, false);
> +
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue that the patch does not introduce, but the new
ptp_error return adds one more way to leave __stmmac_open() after

	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));

has aliased priv->dma_conf to the caller's descriptor and page pool
pointers. On the reopen path the caller then frees them:

stmmac_change_mtu() {
	...
			free_dma_desc_resources(priv, dma_conf);
			kfree(dma_conf);
			...
			return ret;
}

__free_dma_rx_desc_resources() only clears buf_alloc_num and xsk_pool, so
dma_rx/dma_erx, buf_pool and page_pool stay set in priv->dma_conf. Since
the netdev remains netif_running() after a failed ndo_change_mtu, a later
ip link set down runs:

__stmmac_release() {
	...
	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
	...
	free_dma_desc_resources(priv, &priv->dma_conf);
}

Can this free the same dma_free_coherent()/buf_pool/page_pool objects a
second time? The ptp_error path also skips stmmac_init_coalesce(), so the
txtimers in the freshly zeroed dma_conf were never passed to
hrtimer_setup() before hrtimer_cancel() runs on them.

[ ... ]

> @@ -8346,14 +8381,19 @@ int stmmac_resume(struct device *dev)
>  	ret = stmmac_hw_setup(ndev);
>  	if (ret < 0) {
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> -		stmmac_legacy_serdes_power_down(priv);
> -		mutex_unlock(&priv->lock);
> -		rtnl_unlock();
> -		return ret;
> +		goto error_unlock;
>  	}
>  
> -	stmmac_init_timestamping(priv);
> +	if (priv->ptp_enabled) {
> +		if (stmmac_init_ptp_clk_freq(priv))
> +			goto init_coalesce;
>  
> +		ret = stmmac_init_timestamping(priv);
> +		if (ret)
> +			goto error_stop_dma;
> +	}
> +
> +init_coalesce:
>  	stmmac_init_coalesce(priv);

[Severity: Medium]
When priv->ptp_enabled is true and stmmac_init_ptp_clk_freq() fails here,
the interface is resumed via init_coalesce with an info-level log only.
Does that leave software and hardware state inconsistent?

stmmac_hw_setup() has just done the DMA/MAC software reset, so PTP_TCR
(TSENA), PTP_SSIR, the addend and the system time registers are back at
reset values and the counter is stopped, yet:

 - priv->ptp_clock stays registered and priv->ptp_enabled stays true, so a
   PHC whose time never advances remains exposed to userspace
 - stmmac_pltfr_noirq_resume() re-enables clk_ptp_ref because
   ptp_enabled is true
 - priv->hwts_tx_en/hwts_rx_en/systime_flags/sub_second_inc/default_addend
   still describe the pre-suspend hardware configuration
 - priv->plat->clk_ptp_rate stays 0 for the code that divides by it, e.g.
   stmmac_update_subsecond_increment()

The open path handles the same failure differently: it also disables
clk_ptp_ref and leaves the PHC unregistered, so software and hardware
agree. Should resume unregister the PHC and clear ptp_enabled instead of
continuing?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 6128ed1bd521a..19d4815544990 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

[ ... ]

> @@ -984,6 +985,9 @@ static int __maybe_unused stmmac_pltfr_noirq_resume(struct device *dev)
>  		if (ret)
>  			return ret;
>  
> +		if (!priv->ptp_enabled)
> +			return 0;
> +
>  		ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
>  		if (ret < 0) {
>  			netdev_warn(priv->dev,

[Severity: Medium]
This is a pre-existing issue rather than something the patch adds, but with
the new gating the two flags can now disagree. If clk_prepare_enable() here
fails, the function returns the error with priv->ptp_enabled still true, so
no PTP clock reference is held while the flag says one is.

A later close or driver removal then passes the new gate in
stmmac_release_ptp():

	if (!priv->ptp_enabled)
		return;

	stmmac_ptp_unregister(priv);
	clk_disable_unprepare(priv->plat->clk_ptp_ref);

and calls clk_disable_unprepare() without a matching enable. Should the
failure path clear priv->ptp_enabled?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914-stmmac-ptp-error-propagate-v5-1-81149897e65d%40oss.qualcomm.com

