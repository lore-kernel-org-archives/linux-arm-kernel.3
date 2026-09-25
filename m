Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C772CC98328
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOTd0QsZFwY/1NPCwglWY7eTyUnFOT12GMBT8oi99Wk=; b=dnWDDCgP508aye3k4yGX6JUzpi
	zfx58JLGM9fTh90M15Fq4KbbqeEjRfQp8YDnypmlx2rTB+IcF6BgS2nFxHBpTptVAHqj/VGAiGNWb
	M6XTKLx+ntPYI2c2aMjbEgx0EGpB3RFenahk0DiXvWmaYmsNm8NzT8OkcUBnqGhtG/ZLRJ6yY0TK5
	xsIcg7/PtaGkgCfrevPEVHuTJG6TbLLEsja++1jCdm4tazV7B8FX9836pd/daDnA7ZLR7n+k8aVMf
	epQRbbn37c0EFzDMQ1P+FfH/c7zctF0whe1pX9vvHx61kvFsG2fNKbcVZNhjNrr4Gx/f/oFa0q26S
	928uSX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABLh-0000000EEho-1HqN;
	Fri, 25 Sep 2026 19:12:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABLA-0000000EETi-3Hrq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:12:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 869BB43BA5;
	Fri, 25 Sep 2026 19:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4538E1F0089A;
	Fri, 25 Sep 2026 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790363532;
	bh=pOTd0QsZFwY/1NPCwglWY7eTyUnFOT12GMBT8oi99Wk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fSQC067Y7GVhB5Jepd7waKyynC6keHTYYOTNdqToOBdFbHbBtOKKPJbyaMQsxGlc7
	 zF8Mkwr9sK0OFKn+rialddblW1WR99QFqHzXXZUhZ8W7rGvIscREfBMbO5g9pu9zfp
	 bS764VizpInXL14FTzguX4+COYLJ5ugCEiautA74xQOhIzJosn77BbzJnbZ0Ykg8Vb
	 /GuwiT3JUHB9i46Zi9tVDrZwf49qTNs+bFkCMLYNHo6ctW5i2GOYgPLvRPObXC97W9
	 2yJSBKmD+GDymLZhhMnq9pd2Tw1FLz0ci+Q/ea5bvEBaiGarrLKFJjYABy4Vx+1LCY
	 Cnfx6oyrzlXog==
Subject: Re: [PATCH net v3 09/10] net: stmmac: retain PHY and PM ownership
 during ethtool reopening
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 qiangqing.zhang@nxp.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ansuelsmth@gmail.com,
 yangtiezhu@loongson.cn, chenhuacai@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, fancer.lancer@gmail.com, quic_jsuraj@quicinc.com,
 richardcochran@gmail.com, Joao.Pinto@synopsys.com, vladimir.oltean@nxp.com,
 boon.leong.ong@intel.com, weifeng.voon@intel.com, yoong.siang.song@intel.com,
 richard.genoud@bootlin.com, alastair@d-silva.org, mripard@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 zhaojinming@uniontech.com, lorenzo.bianconi@oss.qualcomm.com,
 dinghui1111@163.com
Date: Fri, 25 Sep 2026 19:12:09 +0000
Message-ID: <179036352982.2160803.2753579871439489009@kernel.org>
In-Reply-To: <20260924-submit-stmmac-reset-fixes-v1-v3-9-c031e3f3a282@gmail.com>
References: <20260924-submit-stmmac-reset-fixes-v1-v3-9-c031e3f3a282@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In commit "net: stmmac: retain PHY and PM ownership during
  ethtool reopening", a failed hardware setup during a live ethtool…
- [Low] The commit message says the old behaviour lets 'an MTU change ...
  quiesce NAPI which is already disabled'.
- [Low] After a failed live channel change, the netdev core and the
  driver disagree on queue counts.

--

net: stmmac: retain PHY and PM ownership during ethtool reopening

This commit changes the stmmac ethtool ring size and channel count paths.
They now detach the device and release only the datapath, then reopen
through a new stmmac_reopen() helper that keeps the PHY attachment and the
runtime-PM reference. On failure the previous ring sizes or queue counts are
restored and the device stays detached.

> the PHY attachment and runtime-PM reference have already been dropped, but
> the next ordinary close drops them again. The device also remains present,
> allowing an MTU change to quiesce NAPI which is already disabled.

[Severity: Low]
Is this description accurate for this tree?

With the old code, a failed ethtool reopen is stmmac_release() followed by a
failed stmmac_open(). After that, priv->datapath stays
STMMAC_DATAPATH_DOWN. A later jumbo MTU change calls __stmmac_release(),
which returns early:

    if (priv->datapath == STMMAC_DATAPATH_DOWN)
        return;

An earlier patch in this series added that guard ("net: stmmac: keep
datapath state coherent after reinitialization failure"). So
stmmac_quiesce() and napi_disable() never run. MTU changes that don't need
jumbo buffers don't touch the datapath at all.

The real hazard looks different. stmmac_change_mtu() goes on to call
__stmmac_open(), which restarts DMA, IRQs and phylink. At that point
stmmac_release() has already disconnected the PHY and dropped the
runtime-PM reference.

This patch does close that, because dev_set_mtu_ext() returns -ENODEV for a
detached device. Could the commit message describe that consequence instead?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d56b7f911db0a..d17c68f55caf6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -7658,13 +7660,37 @@ static void stmmac_napi_del(struct net_device *dev)
>  	}
>  }
>  
> -int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
> +/* Rebuild only the datapath. The administratively-up device still owns its
> + * PHY attachment and runtime-PM reference, even if this reopen fails.
> + */
> +static int stmmac_reopen(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
> -	int ret = 0, i;
> +	struct stmmac_dma_conf *old_conf = priv->dma_conf;
> +	struct stmmac_dma_conf *dma_conf;
> +	int ret;
>  
> -	if (netif_running(dev))
> -		stmmac_release(dev);
> +	dma_conf = stmmac_setup_dma_desc(priv, dev->mtu);
> +	if (IS_ERR(dma_conf))
> +		return PTR_ERR(dma_conf);
> +
> +	ret = __stmmac_open(dev, dma_conf);
> +	if (ret) {
> +		priv->dma_conf = old_conf;
> +		free_dma_desc_resources(priv, dma_conf);
> +		kfree(dma_conf);
> +		return ret;
> +	}

[Severity: Medium]
Can this failure path leave the PHY powered up while phylink is stopped and
the MAC is disabled?

Before the reopen, __stmmac_release() goes through phylink_stop() and
phy_stop(). That suspends the PHY unless WoL is set.

__stmmac_open() then resumes the PHY before hardware setup. stmmac always
sets config->mac_requires_rxc = true, so phylink_prepare_resume() calls
phy_resume():

__stmmac_open()
    phylink_prepare_resume(priv->phylink);
    ...
    ret = stmmac_hw_setup(dev, false);
    if (ret < 0) {
        ...
        goto init_error;
    }
    ...
init_error:
    stmmac_stop_all_dma(priv);
    stmmac_mac_set(priv, priv->ioaddr, false);
    return ret;

stmmac_hw_setup() can fail, for example when the DMA software reset times
out. The init_error label then skips phylink_stop(), and the error branch
above only frees the replacement dma_conf.

The old path was stmmac_open() error -> phylink_disconnect_phy() ->
phy_detach() -> phy_suspend(). That put the PHY back into power-down.

With this change the PHY can stay powered and bring up a link with the
partner, while the host has no carrier and the MAC is off. This seems to
last until the interface is taken down. At that point __stmmac_release()
returns early on STMMAC_DATAPATH_DOWN, and only phylink_disconnect_phy() in
stmmac_release() suspends the PHY.

phylink_stop() already handles an instance that is already stopped. The
commit "net: phylink: allow stopping a suspended instance" added this
branch:

drivers/net/phy/phylink.c:phylink_stop() {
    if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state)) {
        if (pl->phydev)
            phy_suspend(pl->phydev);
        return;
    }
    ...
}

Would calling phylink_stop() on this failure path undo the power-up and
still keep the PHY attached and the runtime-PM reference held?
stmmac_reopen() is not changed later in the series, so this remains at the
end of the series.

> +
> +	kfree(old_conf);
> +	netif_device_attach(dev);
> +	return 0;
> +}

[ ... ]

> @@ -7676,9 +7702,31 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
>  									rx_cnt);
>  
>  	stmmac_napi_add(dev);
> +}
> +
> +int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
> +{
> +	struct stmmac_priv *priv = netdev_priv(dev);
> +	u8 old_rx = priv->plat->rx_queues_to_use;
> +	u8 old_tx = priv->plat->tx_queues_to_use;
> +	int ret = 0;
> +
> +	if (netif_running(dev)) {
> +		if (!netif_device_present(dev))
> +			return -ENETDOWN;
> +		netif_device_detach(dev);
> +		__stmmac_release(dev);
> +	}
> +
> +	stmmac_set_queues(dev, rx_cnt, tx_cnt);
>  
>  	if (netif_running(dev))
> -		ret = stmmac_open(dev);
> +		ret = stmmac_reopen(dev);
> +	if (ret) {
> +		stmmac_set_queues(dev, old_rx, old_tx);

[Severity: Low]
Does this leave dev->real_num_rx_queues and dev->real_num_tx_queues at the
new counts while the driver goes back to the old ones?

__stmmac_open() can fail after stmmac_hw_setup() has already succeeded, for
example when stmmac_request_irq() fails. By then stmmac_hw_setup() has
already run this with the new counts:

    netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
    netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);

stmmac_set_queues(dev, old_rx, old_tx) restores
priv->plat->rx/tx_queues_to_use, the RSS table and the NAPI instances. It
does not restore the core real_num_* values.

Until the next ndo_open re-syncs them in stmmac_hw_setup(), the core (sysfs
queue kobjects, XPS/RPS, xsk qid bounds) sees the new topology and the
driver sees the old one. The old code never restored the plat values, so
both sides stayed consistent.

Does this partial restore match what the commit message describes as
restoring the "channel topology after failure"?

> +		netdev_err(dev, "failed reopening after channel change: %pe; interface remains detached\n",
> +			   ERR_PTR(ret));
> +	}
>  
>  	return ret;
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282%40gmail.com

