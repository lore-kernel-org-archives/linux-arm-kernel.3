Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB86EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 22:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+e2uurcb/jNTpLOh/LSpyQYKF5QSDyXpT+v4HQHojw=; b=murjRzm9V7XoIEGf9qlbjdBvju
	rAJ8cAY3kNC/DkedA4vn1DkoC27gOwkDHBxbjzfP8DwCQ4EMueup9XwpmGuDSDCkch8mtosn7rVv/
	L9epUSdunaTP7yfx6B3v0pLLwsOGMDk6exMLrngUZq7LTQ0O0vPjpOiwtH6FMa2LckzT1qu7J0HIt
	x4veEwQZyq8i/s6gzw4v5TBGqfzZHqtDqZ9ggsmW+XLuyIF06OKAWoBCG1yYIkRsCJM6L0W+NCYSI
	Wzx5VevuWS/OdYqbEBKK3j7HonVMzBdsHoBPd/XqnChVRL33dvetXk5K4aOURrGi2vAxPLo5R1YdE
	AmFrnP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlF0g-000000038uJ-3bSe;
	Thu, 20 Feb 2025 22:27:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEzC-000000038h7-0Tfi;
	Thu, 20 Feb 2025 22:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B1EA5C61EB;
	Thu, 20 Feb 2025 22:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3B2C4CED1;
	Thu, 20 Feb 2025 22:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740090336;
	bh=RJiaUdl2RvW6e22DMN7RYxWmy6sBbotkEMjdbKNhlxo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mt3Te2FtyuZ+yp9KJmQeaNyj3kpDuuTeR+PBQW/1mCbe7JTKrTjx8EGBVUxmw1kh+
	 o7r9iBQwNO5Cm1v3zGj9O0hBG9MCaAcp4bz/hLnbXCrt9I4AFo/m2niXpaOW4ybJPP
	 l/mfC53NKy6Kgjq2SgeFv1sjbhtKpeAtxUwsr/XoyAhREgfPOzuBVhalr2FHwereKU
	 x4h0DbVXYV/sE6NE2lO4efiXAkEAsbPg69xW9l3adGU56I8apAjAMJGGRRxt0iD1rk
	 Efpye7hidjorq4dfja4hFPFvSFSINokwNxIKbJuLkkwhucnnJFFh9ekJ+lgxISlN6q
	 VHraLlyodNQQw==
Date: Thu, 20 Feb 2025 14:25:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 upstream@airoha.com
Subject: Re: [PATCH net-next v5 05/15] net: airoha: Move DSA tag in DMA
 descriptor
Message-ID: <20250220142535.584b0423@kernel.org>
In-Reply-To: <20250217-airoha-en7581-flowtable-offload-v5-5-28be901cb735@kernel.org>
References: <20250217-airoha-en7581-flowtable-offload-v5-0-28be901cb735@kernel.org>
	<20250217-airoha-en7581-flowtable-offload-v5-5-28be901cb735@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_142538_211628_59A5A53E 
X-CRM114-Status: GOOD (  14.03  )
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

On Mon, 17 Feb 2025 14:01:09 +0100 Lorenzo Bianconi wrote:
> +static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
> +{
> +#if IS_ENABLED(CONFIG_NET_DSA)
> +	struct ethhdr *ehdr;
> +	struct dsa_port *dp;
> +	u8 xmit_tpid;
> +	u16 tag;
> +
> +	if (!netdev_uses_dsa(dev))
> +		return 0;
> +
> +	dp = dev->dsa_ptr;
> +	if (IS_ERR(dp))
> +		return 0;
> +
> +	if (dp->tag_ops->proto != DSA_TAG_PROTO_MTK)
> +		return 0;
> +
> +	if (skb_ensure_writable(skb, ETH_HLEN))
> +		return 0;

skb_cow_head() is a lot cheaper (for TCP)

> +	ehdr = (struct ethhdr *)skb->data;
> +	tag = be16_to_cpu(ehdr->h_proto);
> +	xmit_tpid = tag >> 8;

> @@ -2390,8 +2498,10 @@ static int airoha_probe(struct platform_device *pdev)
>  	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
>  		struct airoha_gdm_port *port = eth->ports[i];
>  
> -		if (port && port->dev->reg_state == NETREG_REGISTERED)
> +		if (port && port->dev->reg_state == NETREG_REGISTERED) {
> +			airoha_metadata_dst_free(port);
>  			unregister_netdev(port->dev);

Looks a tiny bit reversed, isn't it?
First unregister the netdev, then free its metadata.

> +		}
>  	}
>  	free_netdev(eth->napi_dev);
>  	platform_set_drvdata(pdev, NULL);
> @@ -2416,6 +2526,7 @@ static void airoha_remove(struct platform_device *pdev)
>  			continue;
>  
>  		airoha_dev_stop(port->dev);
> +		airoha_metadata_dst_free(port);
>  		unregister_netdev(port->dev);

same here

>  	}
>  	free_netdev(eth->napi_dev);

