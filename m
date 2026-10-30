Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE8C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D8UwuV3V;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8qTDhP1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pSVuupfgvH55ah2uc/4cO+U4koLlkrLKcG9N9i7AWqQ=; b=D8UwuV3VQngMy8tiSSMbn660X5
	CALAbrN+9KZE8sptSl2ry9DRPXqSiUVRVZ24jwLgDL5LdGsmPDPGIdbwuEzpQEU/3vkR6stqH3quE
	wb2839o0Cv9PY/WLdvBcs+JFfbiNT0HgwWNDEbXhHWmgqCrYqBNtAuRZYr4GJSlLscBO6oae/EPLe
	nIVOQtiRvROWYtT9Ycx6sXGsSwkFbR0JAP2NYCv+IEhoU0cViLvX72YEChZoLv5dWBvAEqurYD9nV
	ITmdskvnqZtS6ydXwgBZmjiiNCBmyxNwVD0Xam/V2PY0nD9DJ1fV1e2tWV+yDB9SCCb6K16qHDma4
	fzcGcX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhNk-0000000B2iD-1Trf;
	Fri, 30 Oct 2026 07:50:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhNb-0000000B2fj-2TrH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:50:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F0D460626;
	Fri, 30 Oct 2026 07:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16F21F0093A;
	Fri, 30 Oct 2026 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793346626;
	bh=pSVuupfgvH55ah2uc/4cO+U4koLlkrLKcG9N9i7AWqQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g8qTDhP14+NRM3nkr8pRXgUEh9V4F3CDNqckyoYIAi1mEj8kq1aooiCIQ3KqrMPMG
	 9TxzAFI7VQtxvTmoc5sWOgZTMcMLYB21UGqXUHRb6nverM2uvja39BdjlxGMvlHF6Y
	 dhk01nI7HFgik9m0nb/4ed8lQusp6Nlzu+IbRIfNMcSGChhyXiGV8iWdzt5PIkBbUP
	 fGZ8RnAVPwZpUhhJ3Jsv/O1MZze3MDVB2A53/7AEMTnX3atNXxdbwY7R3ZGTO+yHlw
	 i2I9tklyW8R9VRGsrsBm5jHoCpnSUL02wSCgRrf6A/ZV6/gKvH8oEOOCMns6Waojd9
	 zv1rnyQTUGi9g==
Subject: Re: [PATCH net v2 4/6] net: stmmac: copy XDP metadata in AF_XDP zero-copy RX
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Fri, 30 Oct 2026 07:50:25 +0000
Message-ID: <179334662537.3134.7910783540285829149@kernel.org>
In-Reply-To: <20261027-stmmac-xdp-fixes-v2-4-10eae8a093a8@oss.qualcomm.com>
References: <20261027-stmmac-xdp-fixes-v2-4-10eae8a093a8@oss.qualcomm.com>
X-sashiko-severity: Medium
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In this patch, stmmac_construct_skb_zc()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5521-5525) copies…

--

net: stmmac: copy XDP metadata in AF_XDP zero-copy RX

This patch changes stmmac_construct_skb_zc() to copy the XDP metadata in
[xdp->data_meta, xdp->data) into the new skb together with the packet
data. The metadata sits right before skb->data, and its length is recorded
with skb_metadata_set().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 71858af6fd66d..d9fc2464a160a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5519,7 +5519,8 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
>  		return NULL;
>  
>  	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> -	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
> +	__skb_put(skb, datasize);
> +	memcpy(skb->data - metasize, xdp->data_meta, datasize + metasize);
>  	if (metasize)
>  		skb_metadata_set(skb, metasize);

[Severity: Medium]
Does the metadata stay valid for VLAN tagged frames that are stripped in
software?

The commit message says:

  This keeps data_meta valid for the stack and TC BPF after eth_type_trans()
  anchors mac_header.

When priv->hw->hw_vlan_en is false, stmmac_dispatch_skb_zc() calls
stmmac_rx_vlan() after the skb is built and before eth_type_trans() runs:

stmmac_dispatch_skb_zc() {
    skb = stmmac_construct_skb_zc(ch, xdp);
    ...
    else
        /* Driver level stripping. */
        stmmac_rx_vlan(priv->dev, skb);
    skb->protocol = eth_type_trans(skb, priv->dev);
    ...
}

For an 802.1Q frame with NETIF_F_HW_VLAN_CTAG_RX set (or 802.1AD with
NETIF_F_HW_VLAN_STAG_RX), stmmac_rx_vlan() moves only the MAC addresses
and then pulls the tag:

stmmac_rx_vlan() {
    ...
    memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
    skb_pull(skb, VLAN_HLEN);
    ...
}

The metadata stays at [D - metasize, D), where D is the original frame
start. eth_type_trans() then sets mac_header to D + VLAN_HLEN. Since
skb_metadata_end() is skb_mac_header(), TC BPF and the stack would see
the window [D + 4 - metasize, D + 4).

Wouldn't that window lose the first 4 bytes of metadata and end with 4
stale destination MAC bytes?

This can happen with AF_XDP zero-copy, an XDP program that calls
bpf_xdp_adjust_meta() and returns XDP_PASS, and a VLAN tagged frame on a
core where hw_vlan_en is false. stmmac_dvr_probe() sets
NETIF_F_HW_VLAN_CTAG_RX for all cores but only sets hw_vlan_en for xmac
cores, so dwmac100/dwmac1000 use software stripping by default.

Before this patch the metadata was not copied at all, so this does not
make things worse than they were. A later patch in the same series, "net:
stmmac: fix VLAN tag stripping on short and non-linear RX frames", changes
stmmac_rx_vlan() to move meta_len + ETH_ALEN * 2 bytes starting at
skb->data - meta_len before skb_pull(), which fixes this case.

Could the commit message mention that the VLAN stripping path is fixed
separately, or could the two patches be reordered?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261027-stmmac-xdp-fixes-v2-0-10eae8a093a8%40oss.qualcomm.com

