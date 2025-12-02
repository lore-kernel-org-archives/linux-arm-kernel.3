Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F1FD12668
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 18:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlDB69eWnRRNtfEwW4uYE472EuzTZxJ5yjasbdWbheI=; b=aKtIhGCILkrFaTgohvFyAeHv66
	RzjadSdiu+r8iJMnlWQs6YEKXeU81y9NgJbQ65N03YTeXa0++a2MgcGCGQDhV1cftJPKrMNRTnGwv
	uXInWID2A5bpOv651UlovRGSI4rfY+sH//eLbDOsYaX21l1Kbnl3X57As5UKSWghaJcPlKI/HaNCU
	+nx4R42PrHzoLrQUmYTTv0o6tx4IyAZpoupXgPb6XmeSOiIpKDX4h0K8aoCOetGzfCUKizwEs+bNo
	0EIlEeSfTKsJqNSX1A8PdXMZKnkSzUCZakZbrV5w8TseuECGikScvXk1E6yO1TdqCwn0XQ29Ni16p
	lIJq+yBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQVDF-00000005j6j-2kbj;
	Tue, 02 Dec 2025 18:34:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQVDD-00000005j68-0EZn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 18:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33EF540A01;
	Tue,  2 Dec 2025 18:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B28C4CEF1;
	Tue,  2 Dec 2025 18:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764700494;
	bh=Cu6psR00lGqDPUq9cuj2S9rijvgdPxkKstnZaesz5SM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YWPr7HSqlXslcAroHEVvdFJme2us/ctcCU+grKqfbvrZ+U9wGbwILna8HFMawLom/
	 qjesvq7unUgojXZXN/dZGr2KPSBx7FtJTX9iOdnrS0OdTQj6tb6ScxVr3qIdGQOqdM
	 CzNOJ9FY4GhEWL+iNEEINFEqwFiCqMUApkpugMau6ZbWuPDTIfJPhZnWt7TfIlXjig
	 V4H5grinH/K3oBuCPWqIADjiz13w+1anVhG3DNUnrz9Qvc9Z5IrG/J+y1t654YZnrI
	 DqcVHhY1w2p69c6Euw0IUKKTsXodz4O4DaAsGe8kiRUvgO+SYMv4lLtBcCKymp9wrm
	 TtM4OLx09R6Uw==
Date: Tue, 2 Dec 2025 10:34:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: 2694439648@qq.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 hailong.fan@siengine.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, inux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: Modify the judgment condition of
 "tx_avail" from 1 to 2
Message-ID: <20251202103452.0d2df13d@kernel.org>
In-Reply-To: <tencent_4A0CBC92B9B22C699AC2890E139565FCB306@qq.com>
References: <tencent_4A0CBC92B9B22C699AC2890E139565FCB306@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_103455_164635_F86D02F8 
X-CRM114-Status: GOOD (  22.14  )
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

On Tue,  2 Dec 2025 15:43:59 +0800 2694439648@qq.com wrote:
> From: "hailong.fan" <hailong.fan@siengine.com>
> 
>     Under certain conditions, a WARN_ON will be triggered
>     if avail equals 1.
> 
>     For example, when a VLAN packet is to send,
>     stmmac_vlan_insert consumes one unit of space,
>     and the data itself consumes another.
>     actually requiring 2 units of space in total.
> 
>     ---
>     V0-V1:
>        1. Stop their queues earlier
>     V2-V1:
>        1. add fixes tag
>        2. Add stmmac_extra_space to count the additional required space

Why is the commit message indented ? Please looks around the mailing
list and try to follow the format others are using. Or read the
documentation. Either of the two will do.
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#changes-requested

> Fixes: 30d932279dc2 ("net: stmmac: Add support for VLAN Insertion Offload")
> Signed-off-by: hailong.fan <hailong.fan@siengine.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7b90ecd3a..9a665a3b2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4476,6 +4476,15 @@ static bool stmmac_has_ip_ethertype(struct sk_buff *skb)
>  		(proto == htons(ETH_P_IP) || proto == htons(ETH_P_IPV6));
>  }
>  
> +static inline int stmmac_extra_space(struct stmmac_priv *priv,
> +				     struct sk_buff *skb)
> +{
> +	if (!priv->dma_cap.vlins || !skb_vlan_tag_present(skb))
> +		return 0;
> +
> +	return 1;
> +}
> +
>  /**
>   *  stmmac_xmit - Tx entry point of the driver
>   *  @skb : the socket buffer
> @@ -4529,7 +4538,8 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  		}
>  	}
>  
> -	if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
> +	if (unlikely(stmmac_tx_avail(priv, queue) <
> +		nfrags + 1 + stmmac_extra_space(priv, skb))) {

extra logic is likely not worth the single descriptor saving, can you
use the same + 2 as in the condition for stopping the queue, please?

>  		if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queue))) {
>  			netif_tx_stop_queue(netdev_get_tx_queue(priv->dev,
>  								queue));
> @@ -4675,7 +4685,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  		print_pkt(skb->data, skb->len);
>  	}
>  
> -	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 1))) {
> +	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 2))) {

