Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7ECCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 23:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xW1dxTd8NyrL7lbjp/qc/XxHtVScSA6Hd7pfnwOLOAA=; b=UCZo4ALatkgYpMM1BC6y9WE3l2
	IXBwEw8P/rmUB73qzPmeP1/KSOE9A4lffJayW6RVp2GBhrqOIdBVxo2pOiqCVKQjeti+O42Ouq4N3
	6Yt1HZTyVTDOY5uQ0/KI6o8CvT5VWQeO3E7J6wJ4lyMQPr6ERkq3QR64RkEn+BTjQcEApW1TXSs+F
	MhDtO4A2wyWC4qkVTWgPdAlrJuhdibPHkvjmvH8bjYK6EhIMZDF4rB8GyQmWERAmSSvz0Kad+/KCm
	IDF48ed6Z0aUqBfRhJB/1YNjJSKINbJRsqTmHi+FlTg9vpORyd9wIOZJBOYBUE+mQAMh9Pvvmttzv
	/yttXvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOlq-000000006YK-0zIt;
	Tue, 05 May 2026 23:01:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOlo-000000006Xr-3Bme
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 23:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6E6F6024D;
	Tue,  5 May 2026 23:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08C4C2BCB4;
	Tue,  5 May 2026 23:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778022099;
	bh=TOsgZidNydoUzgTM+1EuHaM/bvAX00thORvreJ4TqgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YD0KAqX+YqR0BXylMqXB69uZfYGRk4eJEsAXommXcCOD0B7gydO416tlQKkq/npV0
	 9ynvA6r8FuzBnTvvk6XF9698pQiiW8K0My53fhAnXb50tkROpn+8fOR4Iv2OoZvA5y
	 i/fAutC9FAa6S/j/XplJIiQOjs5lZ5rsN/mgcWyCtL2NOh/zaxOa5AdfqVupjND4A3
	 /hs9byYi6XiMdD1T31ZELydq5eVdh+pOvFLAGZPwv+NercPxQ3HbEjafX7MMeZgZcv
	 kLvEa4nyFTDjCt6C1KjW9am2DNbuMNq5BLOTPQk+WXhfQuLKONtQtG4TJnr6OoiMVE
	 cmQKC4ZP77R0w==
From: Jakub Kicinski <kuba@kernel.org>
To: m-malladi@ti.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	vadim.fedorenko@linux.dev,
	haokexin@gmail.com,
	jacob.e.keller@intel.com,
	horms@kernel.org,
	arnd@arndb.de,
	parvathi@couthit.com,
	afd@ti.com,
	basharath@couthit.com,
	vladimir.oltean@nxp.com,
	rogerq@kernel.org,
	danishanwar@ti.com,
	pabeni@redhat.com,
	edumazet@google.com,
	davem@davemloft.net,
	andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srk@ti.com,
	vigneshr@ti.com
Subject: Re: [PATCH net-next v5 2/2] net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge
Date: Tue,  5 May 2026 16:01:37 -0700
Message-ID: <20260505230137.1369192-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430111723.497113-3-m-malladi@ti.com>
References: <20260430111723.497113-3-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

This patch adds driver support for viewing and changing the MAC Merge
sublayer parameters via the .get_mm(), .set_mm() and .get_mm_stats()
ethtool ops, and extends emac_get_stat_by_name() to return u64.

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
> index b715af21d23a..6a08c40adde5 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c

[ ... ]

> @@ -294,6 +293,109 @@ static int emac_set_per_queue_coalesce(struct net_device *ndev, u32 queue,
>  	return 0;
>  }
>  
> +static int emac_get_mm(struct net_device *ndev, struct ethtool_mm_state *state)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth_qos_iet *iet = &emac->qos.iet;
> +	enum icssg_ietfpe_verify_states verify_status;
> +
> +	if (emac->is_sr1)
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&iet->fpe_lock);
> +	state->tx_enabled = iet->fpe_enabled;
> +	state->tx_min_frag_size = iet->tx_min_frag_size - ETH_FCS_LEN;

Can emac_get_mm() return sensible values on first call?

Looking at icssg_qos_init() in icssg_qos.c:

    void icssg_qos_init(struct net_device *ndev)
    {
        struct prueth_emac *emac = netdev_priv(ndev);
        struct prueth_qos_iet *iet = &emac->qos.iet;

        iet->emac = emac;
        mutex_init(&iet->fpe_lock);
    }

Only emac and the mutex are initialized, so iet->tx_min_frag_size and
iet->verify_time_ms remain zero (netdev_priv() is zero-initialized).

On first invocation state->tx_min_frag_size becomes 0 - ETH_FCS_LEN,
which wraps to 0xFFFFFFFC and is then reported to userspace via
ETHTOOL_A_MM_TX_MIN_FRAG_SIZE.

There is a follow-on effect in ethnl_set_mm() (net/ethtool/mm.c) which
calls get_mm first and copies tx_min_frag_size and verify_time into
cfg via mm_state_to_cfg().  If the user does not pass
ETHTOOL_A_MM_TX_MIN_FRAG_SIZE, cfg.tx_min_frag_size stays at
0xFFFFFFFC.  emac_set_mm() then hands that value to
icssg_qos_validate_tx_min_frag_size(), where:

    min_frag_size += ETH_FCS_LEN;   /* 0xFFFFFFFC + 4 == 0 */
    if (min_frag_size < 64)
        return -EINVAL;  /* "tx_min_frag_size must be at least 64 bytes" */

so the first ethtool --set-mm invocation fails with a misleading
diagnostic unless the user specifies every tunable explicitly.

The verify_time_ms = 0 case behaves similarly and is rejected by
icssg_qos_validate_verify_time().

Should icssg_qos_init() seed iet->tx_min_frag_size (e.g. 64 including
FCS) and iet->verify_time_ms (e.g. 128) to sane defaults?

> +	state->tx_active = iet->fpe_active;
> +	state->verify_enabled = iet->mac_verify_configure;
> +	state->verify_time = iet->verify_time_ms;
> +	verify_status = iet->verify_status;
> +	mutex_unlock(&iet->fpe_lock);
> +
> +	state->pmac_enabled = true;
> +	/* 64Bytes is the minimum fragment size supported
> +	 * by the firmware. <64B leads to min frame errors
> +	 */
> +	state->rx_min_frag_size = 64;

Is the unit of rx_min_frag_size consistent with tx_min_frag_size here?

The 64 byte floor includes FCS, but the tx_min_frag_size reported just
above is iet->tx_min_frag_size - ETH_FCS_LEN, i.e. excluding FCS.

Peer drivers report rx_min_frag_size without FCS, for example
mscc/ocelot_mm.c and stmmac_ethtool.c use ETH_ZLEN (60), and
enetc_ethtool.c uses ethtool_mm_frag_size_add_to_min(lafs).

The inconsistency also means a user echoing the reported rx value back
as tx_min_frag_size would hit icssg_qos_validate_tx_min_frag_size()
because 64 + 4 = 68 is not a multiple of 64.

Should this be 64 - ETH_FCS_LEN (or ETH_ZLEN) to match the uAPI
convention?

[ ... ]

> +	return 0;
> +}
> +
> +static int emac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
> +		       struct netlink_ext_ack *extack)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth_qos_iet *iet = &emac->qos.iet;
> +	int err;
> +
> +	if (emac->is_sr1)
> +		return -EOPNOTSUPP;
> +
> +	if (!cfg->pmac_enabled)
> +		NL_SET_ERR_MSG_MOD(extack, "preemptible MAC is always enabled");

Should this path also return an error?

The extack is set but control falls through, all remaining fields are
applied, icssg_config_ietfpe() runs, and the function returns 0.  A
caller doing "ethtool --set-mm ethN pmac-enabled off" sees success even
though emac_get_mm() hardcodes state->pmac_enabled = true and the
request was ignored.

Peer drivers (enetc, igc, ocelot, am65-cpsw) either honour
pmac_enabled or return -EOPNOTSUPP.  Would returning -EOPNOTSUPP (or
-EINVAL) here be more consistent with the ethtool convention that a
non-empty extack accompanies a non-zero return?

> +
> +	err = icssg_qos_validate_tx_min_frag_size(cfg->tx_min_frag_size, extack);
> +	if (err)
> +		return err;
> +
> +	err = icssg_qos_validate_verify_time(cfg->verify_time, extack);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&iet->fpe_lock);
> +	iet->verify_time_ms = cfg->verify_time;
> +	iet->tx_min_frag_size = cfg->tx_min_frag_size + ETH_FCS_LEN;
> +	iet->fpe_enabled = cfg->tx_enabled;
> +	iet->mac_verify_configure = cfg->verify_enabled;
> +	icssg_config_ietfpe(emac, cfg->tx_enabled);
> +	mutex_unlock(&iet->fpe_lock);
> +
> +	return err;
> +}

Can firmware-level failures in icssg_config_ietfpe() be surfaced to
userspace?

icssg_config_ietfpe() returns void, but it can fail in several ways:

    /* icssg_set_port_state() command failure */
    ret = icssg_set_port_state(emac, ... );
    if (ret) {
        netdev_err(emac->ndev, "TX preempt %s command failed\n", ...);
        ...
        return;
    }

    /* MAC Verify wait timeout */
    ret = icssg_iet_verify_wait(emac);
    if (ret) {
        netdev_err(emac->ndev, "MAC Verification failed with timeout\n");
        return;
    }

    /* Firmware failed to activate FPE */
    val = readb(config + PRE_EMPTION_ACTIVE_TX);
    if (val != 1) {
        netdev_err(emac->ndev, "Firmware fails to activate IET/FPE\n");
        return;
    }

Each case emits only a netdev_err().  emac_set_mm() then returns err,
which is 0 at that point, so "ethtool --set-mm" reports success even
when the hardware rejected the configuration or MAC Verify timed out.

Would it be reasonable to change icssg_config_ietfpe() to return int
and propagate the error (with an extack message) from emac_set_mm()?

[ ... ]

