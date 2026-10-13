Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27C4CC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z44din17cJmCqvPR4BN51vI9SOkOKyZHXSMY5xyKRno=; b=FMyzgdp63Sycu89eCS4Xf3baJU
	1iosuMIEyphZF19tNRvDQxRRAKGQjkSGqnTZL4o9EFVUwIetrvmF6Y/C2NeyOjqPH3sy8vVLnkQcI
	tKnA+Y8XIM6zDRnqGEAIJRsqZqx3UR9vy5ka9+v9/rgwSiEZlLyMwjS/kYAdbEQdShz3W8ClVZ29N
	aQDyz5IuwOkFbmknEGrJO21sbKBmQ5p5dND0oLygtF/pdFZjer8leRqFNovtB9fWSEoOl08cGrJHL
	B5v8pskfdm3Q8yfYDwyStxJLHclG+G/JSDQ3QTQjLf0Wfkeph3LQ+Tn+N+7DwUK6XVZN8pNzjPgaA
	qKl4/ekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGePH-0000000DKua-3Lg2;
	Tue, 13 Oct 2026 15:27:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGePF-0000000DKst-2J4Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:27:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FCF04367F;
	Tue, 13 Oct 2026 15:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514D01F00893;
	Tue, 13 Oct 2026 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905229;
	bh=z44din17cJmCqvPR4BN51vI9SOkOKyZHXSMY5xyKRno=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BiEqHr34vzUNANK5ywY88Cv9IYK3TSrEQFfZ+Dax3G03sTcRh1nnqJeMrhfmSCGoW
	 6jnEgGidMIOWuw3aLLs+gcQ9zMDXblCpjpqkbcJ8hT/qpWl5qZsXOiXkov3W8oEmtQ
	 /lk3BF7XVDe/uDB6PpiS9+lHipTktgzVtIHHb0sxEkS3q8li7iZgfja7xkcEBKdMht
	 f/iW4Qdg23IDINCbTmgPvAx/Aca8E2Nu2MVWEmJruQok+G4tRdqSd+y1D1svl48A78
	 7bDS60Y/CbIHDV7okS58iqtD/AKYgl5SOu5/t3mtUdDoBz5dBOyEzOGMwFJ6EFyooN
	 kIAH2eWhGbfUw==
Subject: Re: [PATCH net-next 2/2] net: stmmac: disable TX checksum offload for
 jumbo frames on bugged cores
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, boon.leong.ong@intel.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Tue, 13 Oct 2026 15:27:07 +0000
Message-ID: <179190522792.434549.2113659711683261245@kernel.org>
In-Reply-To: <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message's premise doesn't match the tree.

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but
  stmmac_xdp_xmit_xdpf() never looks at priv->plat->tx_coe when deciding…

--

net: stmmac: disable TX checksum offload for jumbo frames on bugged cores

This patch turns off TX checksum insertion in stmmac_xdp_xmit_xdpf() for
frames longer than ETH_FRAME_LEN on bugged_jumbo cores. It is meant to
match the stmmac_fix_features() workaround that the skb path already uses.

> The XDP TX
> path bypasses that workaround, so once XDP is allowed at MTU >
> ETH_DATA_LEN, jumbo frames sent via XDP_TX or redirected into the
> device would leave the interface with a full checksum insertion enabled
> on those cores - exactly what the workaround is meant to avoid.

[Severity: Low]
Can this scenario happen in the current tree? XDP still can't be used with
a jumbo MTU. stmmac_xdp_set_prog() refuses to attach a program when the MTU
is above ETH_DATA_LEN:

drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c:stmmac_xdp_set_prog() {
    ...
	if (prog && dev->mtu > ETH_DATA_LEN) {
		/* For now, the driver doesn't support XDP functionality with
		 * jumbo frames so we return error.
		 */
		NL_SET_ERR_MSG_MOD(extack, "Jumbo frames not supported");
		return -EOPNOTSUPP;
	}
    ...
}

stmmac_change_mtu() also refuses a jumbo MTU while XDP is enabled:

	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
		netdev_dbg(priv->dev, "Jumbo frames not supported for XDP\n");
		return -EINVAL;
	}

The redirect case looks limited too. Devmap checks every frame with
xdp_ok_fwd_dev(dev, xdp_get_frame_len(xdpf)), which caps the length at
mtu + hard_header_len + VLAN_HLEN. At MTU 1500 that is 1518 bytes.
Redirected frames therefore reach the new ETH_FRAME_LEN check only when
they are 1515 to 1518 bytes long, which is VLAN-tagged normal-size
traffic, not jumbo.

The one path that seems to reach the new check today is XDP_TX after the
program grows the frame. At MTU 1500, stmmac_rx() still sets frame_sz to
at least PAGE_SIZE:

	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;

A program can therefore use bpf_xdp_adjust_tail() to grow a frame past
1514 bytes and return XDP_TX. stmmac_xdp_xmit_xdpf() never checks that
length against the MTU.

Could the commit message describe the trigger that exists today, and say
whether the bugged_jumbo erratum covers it? If this patch depends on a
separate change that allows XDP at a jumbo MTU, could the message say so?
The Fixes: tag reads as if the problem can be hit now.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca61ab449e32b..0e29c5d04714c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5276,6 +5276,14 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
>  		return STMMAC_XDP_CONSUMED;
>  	}
>  
> +	/* Disable TX checksum offload for jumbo frames on cores where
> +	 * checksum insertion is broken for oversized frames, matching the
> +	 * stmmac_fix_features() workaround used by the skb path.
> +	 */
> +	if (priv->plat->bugged_jumbo &&
> +	    xdp_get_frame_len(xdpf) > ETH_FRAME_LEN)
> +		csum = false;

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch. The
comment says this matches stmmac_fix_features(), but that function also
turns off TX checksum offload when tx_coe is unset:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_fix_features() {
    ...
	if (!priv->plat->tx_coe)
		features &= ~NETIF_F_CSUM_MASK;
    ...
}

In stmmac_xdp_xmit_xdpf(), csum comes only from the per-queue flag:

	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;

stmmac_hw_init() clears tx_coe when threshold DMA mode is forced:

		/* TXCOE doesn't work in thresh DMA mode */
		if (priv->plat->force_thresh_dma_mode)
			priv->plat->tx_coe = false;

stmmac_dma_operation_mode() then runs TX in threshold mode
(txmode = tc).

On platforms with snps,force_thresh_dma_mode, do XDP_TX and ndo_xdp_xmit
frames still request full checksum insertion through
stmmac_prepare_tx_desc() in a DMA mode where the driver treats TX COE as
broken? Should the XDP path also check priv->plat->tx_coe here?

>  	while (true) {
>  		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
>  		int len = frag ? skb_frag_size(frag) : xdpf->len;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1%40oss.qualcomm.com

