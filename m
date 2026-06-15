Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B022CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGbxXT/pVHsXNvjvWTH/s4OWFo76S/tTWfx5JzOHeK4=; b=aZFAzXz+tlNFGB2MwhGt7K4hVK
	xqLOzqVKr99wtTca1uxr7bQli+ln5QkNEGyExXXOr1EY+2Ffp7m/v0exmuZjGuwilVAbHKCcxhg7l
	NxDABTZrj2QHRnQx+gTMsVLYTjEq2/Tmn+njadpYf2LACw8Xrn0SPXSxM3QS2fXRDBJTjC2Vbs5cP
	MP3k0nfoCUtQaD+qJ9wyArBA5bwSn5Js/CDw8JLpxpSZgGINLSlgwTxZe3vTFBnQ1HpPgT4QP1urp
	vNL5EQPL5c1VCuBwSJuqrNvLQ7nYrBhkP4wfTiX0lN16htuoS6yCDED00tTsQ33NYYwCTrC9IqA4Y
	mNEj8wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGS6-0000000Evfv-0QgD;
	Mon, 15 Jun 2026 23:10:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGS4-0000000EvfO-30LW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:10:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC3C2600AB;
	Mon, 15 Jun 2026 23:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6101F00A3A;
	Mon, 15 Jun 2026 23:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781565043;
	bh=dGbxXT/pVHsXNvjvWTH/s4OWFo76S/tTWfx5JzOHeK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iGwr7zBN59E45Eq1/uBBOSQAj5QlUIhTt+JY8W2hohvuo97pXwr84Q/rmZhcMkpWu
	 sOd3jRMj68zipH4xBUKX5bM3thTkTsOc0DFe3IZU+zZxxSKafKovjKeu6/sHzfBcb/
	 dAbDOPF8trhoMdJhrz0yHG/BdEeY3KhmLhawHyzYozrZ0g8mwhYIvK4AP/9vMoGwfp
	 4zdVBq3uBtNe7GiujazQvYNraasQpbJhdyy8MXhJ/qtn/5/b4VEciNfXnOYZDYim4+
	 E6TD19Zt8+p5gshPmKN1dypjUnjp15XbGCuXlXQnUm50QUmgN0HqmqnRz+CvL3bZFW
	 CI5pZH4GSXQIg==
From: Jakub Kicinski <kuba@kernel.org>
To: m-malladi@ti.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	elfring@users.sourceforge.net,
	haokexin@gmail.com,
	vadim.fedorenko@linux.dev,
	devnexen@gmail.com,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	arnd@arndb.de,
	basharath@couthit.com,
	afd@ti.com,
	parvathi@couthit.com,
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
Subject: Re: [PATCH net-next v7 2/2] net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge
Date: Mon, 15 Jun 2026 16:10:41 -0700
Message-ID: <20260615231041.1007484-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610052511.781752-3-m-malladi@ti.com>
References: <20260610052511.781752-3-m-malladi@ti.com>
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
Subject: net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

This patch wires up the ethtool MAC Merge ops (.get_mm, .set_mm,
.get_mm_stats) for the ICSSG PRU Ethernet driver and adds five firmware
preemption counters that feed both the new MM stats and the existing
ethtool -S table.

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
> index b715af21d23a..0620782318ab 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
> @@ -294,6 +294,103 @@ static int emac_set_per_queue_coalesce(struct net_device *ndev, u32 queue,

[ ... ]

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
> +	if (!cfg->pmac_enabled) {
> +		NL_SET_ERR_MSG_MOD(extack, "preemptible MAC is always enabled");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	mutex_lock(&iet->fpe_lock);
> +	iet->verify_time_ms = cfg->verify_time;
> +	iet->tx_min_frag_size = cfg->tx_min_frag_size;
> +	iet->fpe_enabled = cfg->tx_enabled;
> +	iet->mac_verify_configure = cfg->verify_enabled;
> +	err = icssg_config_ietfpe(ndev, cfg->tx_enabled);
> +	mutex_unlock(&iet->fpe_lock);
> +
> +	return err;
> +}

[Medium]
Can the cached software state in iet diverge from the hardware here when
icssg_config_ietfpe() fails?

The new fields (verify_time_ms, tx_min_frag_size, fpe_enabled,
mac_verify_configure) are written to iet before icssg_config_ietfpe() is
called, but the error paths in icssg_config_ietfpe() only roll back a
subset of state:

icssg_qos.c:icssg_config_ietfpe() {
    ...
disable_tx:
        icssg_set_port_state(emac, ICSSG_EMAC_PORT_PREMPT_TX_DISABLE);
fallback:
        writeb(0, config + PRE_EMPTION_ENABLE_TX);
        writeb(0, config + PRE_EMPTION_ENABLE_VERIFY);
        iet->verify_status = ICSSG_IETFPE_STATE_DISABLED;
        iet->fpe_active =  false;
        return ret;
}

iet->fpe_enabled is left set to cfg->tx_enabled even though the hardware
TX preempt path has been disabled.

Two follow-on effects appear to come from this:

emac_get_mm() reports state->tx_enabled = iet->fpe_enabled, so userspace
sees tx_enabled=true after a set_mm that returned an error and left FPE
disabled in hardware.

icssg_qos_link_state_update() drives icssg_iet_change_preemptible_tcs(),
which calls icssg_config_ietfpe(emac->ndev, iet->fpe_enabled) on every
link transition, so the failed configuration is retried each link-up
without further user action.

Would it make sense to stage cfg into local variables, only commit them
to iet after icssg_config_ietfpe() returns success, or otherwise
restore the previous iet fields on the error return?

> +static void emac_get_mm_stats(struct net_device *ndev,
> +			      struct ethtool_mm_stats *s)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +
> +	if (emac->is_sr1)
> +		return;
> +
> +	if (!emac->prueth->pa_stats)
> +		return;
> +
> +	emac_update_hardware_stats(emac);
> +
> +	/* MACMergeHoldCount stats is not tracked by the firmware */
> +	s->MACMergeFrameAssOkCount = emac_get_stat_by_name(emac, "FW_PREEMPT_ASSEMBLY_OK");
> +	s->MACMergeFrameAssErrorCount = emac_get_stat_by_name(emac, "FW_PREEMPT_ASSEMBLY_ERR");
> +	s->MACMergeFragCountRx = emac_get_stat_by_name(emac, "FW_PREEMPT_FRAG_CNT_RX");
> +	s->MACMergeFragCountTx = emac_get_stat_by_name(emac, "FW_PREEMPT_FRAG_CNT_TX");
> +	s->MACMergeFrameSmdErrorCount = emac_get_stat_by_name(emac, "FW_PREEMPT_BAD_FRAG");
> +}

[ ... ]

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/ethernet/ti/icssg/icssg_stats.h
> index 5ec0b38e0c67..8073deac35c3 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
> @@ -189,6 +187,11 @@ static const struct icssg_pa_stats icssg_all_pa_stats[] = {
>  	ICSSG_PA_STATS(FW_INF_DROP_PRIOTAGGED),
>  	ICSSG_PA_STATS(FW_INF_DROP_NOTAG),
>  	ICSSG_PA_STATS(FW_INF_DROP_NOTMEMBER),
> +	ICSSG_PA_STATS(FW_PREEMPT_BAD_FRAG),
> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_ERR),
> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_TX),
> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_OK),
> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_RX),
>  	ICSSG_PA_STATS(FW_RX_EOF_SHORT_FRMERR),
>  	ICSSG_PA_STATS(FW_RX_B0_DROP_EARLY_EOF),
>  	ICSSG_PA_STATS(FW_TX_JUMBO_FRM_CUTOFF),

[Medium]
Are these five new entries duplicating values that already have a
standard uAPI?

The same five firmware counters are exposed through the new
.get_mm_stats callback as the standardized MAC Merge stats
(MACMergeFrameAssOkCount, MACMergeFrameAssErrorCount, MACMergeFragCountRx,
MACMergeFragCountTx, MACMergeFrameSmdErrorCount in struct
ethtool_mm_stats), and adding them to icssg_all_pa_stats[] also
publishes them via emac_get_strings() / emac_get_ethtool_stats() as
ethtool -S strings.

Documentation/networking/statistics.rst describes ethtool -S as the
private-driver-stats interface; counters that have a standard uAPI are
expected to flow only through that uAPI.

Could the firmware-register lookup table used by emac_get_stat_by_name()
be separated from the ethtool -S string table, so the new preemption
counters feed get_mm_stats without also showing up under ethtool -S?

