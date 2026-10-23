Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D1606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 22:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EmAjzCGj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=co/oit5T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7C0MYqI0nm0JYRHH3Hewaz0VQKQ10OF/daqqZ8+b0gg=; b=EmAjzCGjThkBetbSMYxdYoXI97
	IjTk/tsPmQOXeYVLjJ5wlR5/INbsfR4aWDlvBpelGVYyTfe0UIEbHJr+1C4JmbaWpoP9J6j/dUz8J
	r/IHgNj5qD9T1ZcrQW1k6rxroi3UbU/IPhcaAQ4lcvISGBQf6WaPosewjl3CSIlNQHAlZfI6WEmkS
	YrgifVnYof5Rw0BRHvTn3+imshBTget5rIFQ5ZIu5N/vAQF3eSPQVzJIzFhmaBWm5Lsw0GVlPsTVc
	HxP8aXNPtctesr5XcjQIgGETRcYWGFt3NTe+d6hWVgSZxJnRLYA6o3e2VdTcIza9V2e1lHWlnCSuQ
	KQ7aDzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNxf-0000000H3hD-2N8t;
	Fri, 23 Oct 2026 22:42:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNxd-0000000H3gt-3K0H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 22:42:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E990B6020F;
	Fri, 23 Oct 2026 22:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51331F01825;
	Fri, 23 Oct 2026 22:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795324;
	bh=7C0MYqI0nm0JYRHH3Hewaz0VQKQ10OF/daqqZ8+b0gg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=co/oit5TMIExSZKNTcU0h+g1nlJbKUdgnahhLDp+aujhkBm63BXC8pyPHXWHX/AwF
	 uwLVw1QW95vzDG/bMwzs4xWGKHKRJI3R0FhGOEnmhsVUzRbQDAmFHfiyhsDjcRuSXB
	 vtCCuFnb30I1a08J7f+L5rGUI4iXD2p8BQbj/Ajc+LZGvoMa7vVcPQzImaXO8i+uvG
	 p8+e4JNfHN7R5JgjK3ewRHKdsbHG2mOlq3SKYDmNYo9yT1kd9iWEUi2u9d727I3Aub
	 muvIKTATwGcorLrFvo+XwyTEbuzU7dE3Rd8iVVh8haclUDdTPZnYGZYC5wUlrH7Voc
	 YJFvkiHU+I5fg==
Subject: Re: [PATCH net 2/3] net: stmmac: dwmac1000: don't discard frames with
 only a checksum error
From: netdev-bot+sashiko@kernel.org
To: opensource@grische.xyz
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, o.rempel@pengutronix.de,
 stable@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, aaro.koskinen@nokia.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 23 Oct 2026 22:42:03 +0000
Message-ID: <179279532326.3134.8925339564776340456@kernel.org>
In-Reply-To: <20261020190319.884375-3-opensource@grische.xyz>
References: <20261020190319.884375-3-opensource@grische.xyz>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] enh_desc_get_rx_status()
  (drivers/net/ethernet/stmicro/stmmac/enh_desc.c:209-213) now discards…

--

net: stmmac: dwmac1000: don't discard frames with only a checksum error

This patch changes enh_desc_get_rx_status() so that a descriptor with the
Error Summary bit set is discarded only when one of the L2 error bits is
also set. Frames with only an L3/L4 checksum error then reach the stack as
CHECKSUM_NONE. The patch also removes the per-frame pr_err for
RDES0_IPC_CSUM_ERROR.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> index 0512536012251..5c43d32a2f22b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> @@ -195,9 +195,6 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
>  		if (unlikely(rdes0 & RDES0_OVERFLOW_ERROR))
>  			x->rx_gmac_overflow++;
>  
> -		if (unlikely(rdes0 & RDES0_IPC_CSUM_ERROR))
> -			pr_err("\tIPC Csum Error/Giant frame\n");
> -

[ ... ]

> @@ -209,7 +206,11 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
>  		if (unlikely(rdes0 & RDES0_CRC_ERROR)) {
>  			x->rx_crc_errors++;
>  		}
> -		ret = discard_frame;
> +		if (rdes0 & (RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR |
> +			     RDES0_COLLISION | RDES0_RECEIVE_WATCHDOG |
> +			     RDES0_MII_ERROR | RDES0_CRC_ERROR |
> +			     RDES0_LENGTH_ERROR))
> +			ret = discard_frame;

[Severity: High]
Can this mask let giant frames through when Rx checksum offload is
disabled?

RDES0[7] (RDES0_IPC_CSUM_ERROR) means an IPC checksum error only while
GMAC_CONTROL_IPC is set. With IPC clear, the same bit reports a Giant
Frame. That is an L2 error, and it also sets ES. The pr_err string removed
above ("IPC Csum Error/Giant frame") names both meanings.

dwmac1000_rx_ipc_enable() clears IPC whenever hw->rx_csum is 0:

dwmac1000_rx_ipc_enable() {
    ...
	if (hw->rx_csum)
		value |= GMAC_CONTROL_IPC;
	else
		value &= ~GMAC_CONTROL_IPC;
    ...
}

This happens with "ethtool -K <if> rx off" through stmmac_set_features(),
when the platform has no RX COE, or when the IPC read-back in
stmmac_hw_setup() fails.

In that state, a giant frame where bit 7 is the only ES contributor stays
good_frame here. It is then passed to enh_desc_coe_rdes0() with
ipc_err = 1. That function returns csum_none for status 0x6/0x7 and
good_frame for the "Reserved" 0x2 case. It never returns discard_frame,
so stmmac_rx() passes the oversized frame to XDP and the stack. Before
this patch the frame was dropped.

What happens when the giant frame is larger than dma_buf_sz and spans two
descriptors? One example is threshold DMA mode with
snps,force_thresh_dma_mode, where the FIFO can no longer drop the frame.

The non-LS descriptor returns discard_frame without rx_not_ls. So
stmmac_rx() frees it and resets error and len. The LS descriptor is then
handled as the start of a new frame:

stmmac_rx_buf1_len() {
    ...
	plen = stmmac_get_rx_frame_len(priv, p, coe);
    ...
	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen - len);
}

With len == 0 this reports dma_buf_sz bytes, but DMA only wrote
plen - dma_buf_sz bytes to that buffer. Would the stack then see a frame
whose Ethernet header comes from the middle of the giant frame's payload,
followed by stale page_pool contents?

This also seems to disagree with the commit message:

  "Return discard_frame only for L2 errors."

  "This matches dwmac4, whose Error Summary check does not include the
  checksum bits."

dwmac4_wrback_get_rx_status() still discards RDES3_GIANT_PACKET inside its
ES block, and ndesc_get_rx_status() discards every ES frame.

The later patch in this series that sets DMA_CONTROL_DT ("net: stmmac:
dwmac1000: stop hardware from dropping checksum-error packets") only
affects COE-detected errors, so it doesn't appear to cover this case.

Should bit 7 also count as a discard reason unless IPC (hw->rx_csum) is
enabled?

>  	}
>  
>  	/* After a payload csum error, the ES bit is set.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261020190319.884375-1-opensource%40grische.xyz

