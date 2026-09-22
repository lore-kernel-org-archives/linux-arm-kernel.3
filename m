Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFA2C982FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36RoBHrGwE33gPaLsCa4JqDBN5flOBzjbxVU/7LN+fs=; b=QtCs79AFB36NyFZqK+Fo+XI/SS
	LcLjHXWkRAeLIqbzLHVXWCc62C5Egdnmhm9UU/L3LP+xDQD0gdnuijM3GOTITV03A5ones0jT+j3u
	0O2EcrceoOlLdrt1d8OCKceVz6ym6vNiOAq6XdNNhowPBECflcwPsOctLLXG+0+PPLRiQRzg04Rqm
	891ZoITaAaBrH0zlOS/VkYcgOXeCVY4xYNoPaoSKvtc86ACJLxu/1NUFOoOCP3ovq9183YSPSpnwn
	TuNfq11Q4/at9AVqL53/g0jh/MAfdIKAHH87u5KPu7KuBAGyWKUW0NbNQuQO7TTvmpnox8dX5b2DA
	KsMR7GKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qbT-000000041rF-1WVr;
	Tue, 22 Sep 2026 02:51:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qbS-000000041r5-1MnO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:51:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 416616022A;
	Tue, 22 Sep 2026 02:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504D01F000FF;
	Tue, 22 Sep 2026 02:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790045489;
	bh=36RoBHrGwE33gPaLsCa4JqDBN5flOBzjbxVU/7LN+fs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ShfbejLWYT5Pto442bf9M8iuF8OwXhPqxB/ZFYcDAW8JG4hfSbTlPvPaZNTV158AN
	 6guZPlQVL1jn0leaqRPdUjjhJZNCJrqoK6exnG8X7Dgpus+fZZhMyzq+bSui2qju1/
	 waqBTIjw0ngKdPWGbbCOMPTXKLdxOA/I5FXrz4V5Gs/jYJILHvSQsH2m4M31BJTglS
	 AjGovBLT1v6TZyZYiszMBGHxfDcb4ryoA523G3QNJ9OQXi8/WCyAKtMnw1qr1bc69f
	 jyhlv2zgvKowgpPJIKpl4BGop7JmizxLssZ2zFN69WsJxlDXllomQ57yK2ceKkb1ej
	 BeB/DsaLs+YAg==
Subject: Re: [PATCH net-next] net: stmmac: Setup TBS only if HW supports it
From: netdev-bot+sashiko@kernel.org
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, kuba@kernel.org, pabeni@redhat.com,
 edumazet@google.com, davem@davemloft.net, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Date: Tue, 22 Sep 2026 02:51:27 +0000
Message-ID: <179004548784.2160803.5129187589966240478@kernel.org>
In-Reply-To: <20260918023530.31971-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260918023530.31971-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 2 (1) · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch is a bug fix (it prevents a descriptor-format
  mismatch where the Tx ring is laid out with the 32-byte `struct…
- [Medium] The new gate in stmmac_setup_dma_desc() (stmmac_main.c:4128)
  only checks the chip-wide capability bit `priv->dma_cap.tbssel`; it…

Pre-existing issues:
- [High] On a partial per-queue allocation failure the unwind helpers
  touch queues that were never allocated and dereference NULL.
- [Medium] In stmmac_setup_dma_desc() (stmmac_main.c:4138-4158), when
  alloc_dma_desc_resources() fails because the *TX* stage failed, the…
- [Low] `dma_cap.tbs_ch_num` is populated only by
  dwxgmac2_get_hw_feature() (dwxgmac2_dma.c:457).

--

net: stmmac: Setup TBS only if HW supports it

The change makes stmmac_setup_dma_desc() consult priv->dma_cap.tbssel
before honoring the per-queue tbs_en flag from platform glue, so that
STMMAC_TBS_AVAIL (and with it the enhanced Tx descriptor stride) is only
set when the MAC reports the TBSSEL hardware capability bit.

A few questions about the change and the surrounding allocation path
below.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index bf9e7e4cb1c3..c2c88660e422 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4125,12 +4125,14 @@ stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
>  		dma_conf->dma_rx_size = DMA_DEFAULT_RX_SIZE;
>  
>  	/* Earlier check for TBS */
> -	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++) {
> -		struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[chan];
> -		int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;
> +	if (priv->dma_cap.tbssel) {

[Severity: Medium]
This reads as a fix for a real Tx-path descriptor format mismatch, but the
commit message carries only a Signed-off-by: trailer and no Fixes: tag, no
reported symptom and no affected controller.

Two anchors look plausible:

  579a25a854d4 ("net: stmmac: Initial support for TBS") introduced the
  unconditional

      tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;

  ba39b344e924 ("net: ethernet: stmicro: stmmac: generate stmmac dma conf
  before open") moved it into stmmac_setup_dma_desc().

Could a Fixes: tag and a note on which controller and symptom were observed
be added, so the target tree (net vs net-next) and stable backporting are
decidable?

> +		for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++) {
> +			struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[chan];
> +			int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;
>  
> -		/* Setup per-TXQ tbs flag before TX descriptor alloc */
> -		tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;
> +			/* Setup per-TXQ tbs flag before TX descriptor alloc */
> +			tx_q->tbs |= tbs_en ? STMMAC_TBS_AVAIL : 0;
> +		}
>  	}

[Severity: Medium]
Is a chip-wide TBSSEL check sufficient here, given that TBS is a per-channel
property in hardware?

dwxgmac2_get_hw_feature() decodes a channel count next to the selector bit:

    dma_cap->tbs_ch_num = ((hw_cap & XGMAC_HWFEAT_TBSCH) >> 28) + 1;
    dma_cap->tbssel = (hw_cap & XGMAC_HWFEAT_TBSSEL) >> 27;

and common.h documents tbs_ch_num as "Number of DMA channels enabled for
TBS". dwmac-socfpga.c also states this explicitly for a shipping part:

    default:
        /* Tx Queues 0 - 5 doesn't support TBS on Agilex5 */
        break;

Meanwhile dwmac-intel.c, dwmac-imx.c, dwmac-mediatek.c,
dwmac-qcom-ethqos.c and stmmac_pci.c set tbs_en on every Tx queue above 0.
On a core where TBSSEL reads 1 but only the top channels are synthesized for
TBS, doesn't STMMAC_TBS_AVAIL still get set on the non-TBS channels, so
stmmac_get_tx_desc_size() still returns sizeof(struct dma_edesc) and the ring
is still allocated with the enhanced stride while EDSE cannot stick on those
channels?

tbs_ch_num currently has no consumer outside stmmac_dma_cap_show(), so
nothing in the allocation path looks at it.

The -EIO produced by dwmac4_enable_tbs():

    value = readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs,
                                               chan)) & DMA_CONTROL_EDSE;
    if (en && !value)
        return -EIO;

is discarded at both call sites, stmmac_hw_setup() and
stmmac_enable_tx_queue():

    stmmac_enable_tbs(priv, priv->ioaddr, enable, chan);

so a residual per-channel mismatch would be neither prevented nor logged.
Does that make the commit message statement

    "Gating on dma_cap.tbssel in stmmac_setup_dma_desc() prevents the
     enhanced descriptor allocation at the earliest point, which is the only
     place the mismatch can be avoided cleanly."

too strong, since the same place could also gate per channel and/or act on
the stmmac_enable_tbs() return value?

Separately, a platform that requested tbs_en on a core without TBSSEL now
silently loses it. Would a netdev_warn() there help platform owners notice
the behaviour change?

[Severity: Low]
This is a pre-existing issue and not introduced by this patch, but it is
related to the capability the gate now depends on: tbs_ch_num is populated
only by dwxgmac2_get_hw_feature(). dwmac4_get_hw_feature() sets only

    dma_cap->tbssel = (hw_cap & GMAC_HW_FEAT_TBSSEL) >> 27;

and leaves tbs_ch_num at 0, while stmmac_dma_cap_show() prints both fields:

    seq_printf(seq, "\tNumber of DMA Channels Enabled for TBS: %d\n",
               priv->dma_cap.tbs_ch_num);

So on a dwmac4-class core with TBSSEL == 1, debugfs reports TBS as supported
immediately followed by a TBS channel count of 0. Should
dwmac4_get_hw_feature() decode the channel count too?

>  
>  	ret = alloc_dma_desc_resources(priv, dma_conf);

[Severity: Medium]
This isn't a bug introduced by this patch, but it sits in the path the patch
touches: when alloc_dma_desc_resources() fails on the Tx stage, are the Rx
page pools leaked?

    static int alloc_dma_desc_resources(struct stmmac_priv *priv,
                                        struct stmmac_dma_conf *dma_conf)
    {
            int ret = alloc_dma_rx_desc_resources(priv, dma_conf);

            if (ret)
                    return ret;

            ret = alloc_dma_tx_desc_resources(priv, dma_conf);

            return ret;
    }

alloc_dma_tx_desc_resources() unwinds only the Tx side, and back in
stmmac_setup_dma_desc() the error path is:

    alloc_error:
            kfree(dma_conf);
            return ERR_PTR(ret);

free_dma_desc_resources() is bypassed, and dma_conf is the only reference to
the Rx page pools, buf_pool arrays, coherent Rx rings and xdp_rxq_info
registrations at that point, since the memcpy into priv->dma_conf happens
later in __stmmac_open().

[Severity: High]
This isn't a bug introduced by this patch either, but on the same allocation
path: can the partial-failure unwind dereference NULL?

alloc_dma_tx_desc_resources() does:

            ret = __alloc_dma_tx_desc_resources(priv, dma_conf, queue);
            if (ret)
                    goto err_dma;
    ...
    err_dma:
            free_dma_tx_desc_resources(priv, dma_conf);

free_dma_tx_desc_resources() then walks every Tx queue, including those never
allocated, and __free_dma_tx_desc_resources() unconditionally does:

            /* Release the DMA TX socket buffers */
            dma_free_tx_skbufs(priv, dma_conf, queue);

which reaches stmmac_free_tx_buffer():

            if (tx_q->tx_skbuff_dma[i].buf &&
                tx_q->tx_skbuff_dma[i].buf_type != STMMAC_TXBUF_T_XDP_TX) {

For the queue whose first kzalloc_objs() failed, and for all higher queues
that were never reached, tx_skbuff_dma is still NULL because dma_conf comes
from kzalloc. Doesn't that oops? And if it were guarded, the following

            dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);

would be called with a NULL address and a zero dma handle for a ring that was
never allocated.

The Rx side looks the same: __free_dma_rx_desc_resources() unconditionally
calls dma_free_rx_skbufs(), and stmmac_free_rx_buffer() dereferences
rx_q->buf_pool[i] with buf_pool == NULL.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260918023530.31971-1-muhammad.nazim.amirul.nazle.asmade%40altera.com

