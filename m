Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1CBCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJ2733YwARgE1Qwcji1IsWT4iPJBGi64T05DaYIrqJI=; b=Be/D3vBBxADNvxSCGFRxRhwIfQ
	99UPbHddFH+pdYCvwJ5sqNqWkOFKeujpXF7N5YO3wRLcl+0FCcd91QJzYjTG8rolz4X/uC+gGs6QR
	mh8JfllMkuRpW7MhQ4skmhTDS573HXRocNP6sNlOBNMWBnnyYS5aCBHNarc3+gcaF8KD0bhvaCprY
	swQgFU9TWFJpYFcBQlu8kew5fE5xVpkcpUU3Dzs3q01z8Mzol5CZFcPaTcOr4+hQTG96QmKJsf4U7
	i5vAKOAIH0lzl1DiilL99Dn62WgBouA4Mb42diUiqUYH3CyWK+z7Oc+QOpCp7dW6WpudxALQPYzXy
	e8h3NpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHilL-000000037lt-0Lqm;
	Fri, 16 Oct 2026 14:18:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHilI-000000037lD-04cN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:18:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C7E034E41220;
	Fri, 16 Oct 2026 14:18:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98E7C6075D;
	Fri, 16 Oct 2026 14:18:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1C2F10328528;
	Fri, 16 Oct 2026 16:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792160291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZJ2733YwARgE1Qwcji1IsWT4iPJBGi64T05DaYIrqJI=;
	b=VGpBpV3/mIpN8RCvaqNdFYhlEv8JpqL/IKivBqkMOrjOuWJqcA7bEDCo3rUg6z5C5nrr0s
	454BQNZGYsXDory6vk9waOY9JZE/GvN9H71zUVkhP5rfPxyHm5RvdtCe4ITjX17k1C5cg7
	+Ac6PvEwWTeBz6KayzJ6Fo8clSJR96Y9YrfuBn34m1j8Vqoeari2xi8GCiqKVV/JJcBfmg
	Gcrso3ExZUxSzKGWlkH1yjqfEoQTCdJ2pdHTYX4Bv0+ASeX/CrYt/JA6m+0xe3rl7Q9L7D
	FUM5Zi9+1sB/5MF87OmJkeBdVpM8gdAlU4GZWLq7WOf6dRHcvHkj2X3hO9+oSA==
Message-ID: <6d1d99b5-1c3c-4e59-a0b2-e4d671e594ce@bootlin.com>
Date: Fri, 16 Oct 2026 16:18:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: stmmac: disable TX checksum offload for
 jumbo frames on bugged cores
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071820_202269_96DA7CA5 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Lorenzo,

On 10/12/26 17:24, Lorenzo Bianconi wrote:
> stmmac_xdp_xmit_xdpf() decides TX checksum insertion from the queue COE
> capability only:
> 
> 	csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
> 
> and lets the enhanced descriptor set TX_CIC_FULL accordingly. On the
> bugged_jumbo cores (snps,dwmac-3.40a, snps,dwmac-3.610 and
> snps,dwmac-3.710) hardware checksum insertion is broken for jumbo
> frames; the skb path works around it by clearing NETIF_F_CSUM_MASK in
> stmmac_fix_features() when the MTU exceeds ETH_DATA_LEN, so skbs are
> never marked CHECKSUM_PARTIAL and no checksum is inserted. The XDP TX
> path bypasses that workaround, so once XDP is allowed at MTU >
> ETH_DATA_LEN, jumbo frames sent via XDP_TX or redirected into the
> device would leave the interface with a full checksum insertion enabled
> on those cores - exactly what the workaround is meant to avoid.
> 
> Disable checksum insertion for oversized frames on bugged_jumbo cores in
> the XDP TX path too.
> 
> Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Looks cleaner to me than the alternative patch from Jisheng :

https://lore.kernel.org/netdev/20260929121025.20821-1-jszhang@kernel.org/

It sure seems there're a lot of people interested in getting XDP/XSK
working properly on stmmac :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca61ab449e32..0e29c5d04714 100644
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
> +
>  	while (true) {
>  		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
>  		int len = frag ? skb_frag_size(frag) : xdpf->len;
> 


