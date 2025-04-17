Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E96CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhxMWPj+qtZbea/r5PJbfSNdgUxYzfVBkN39ZGiZkB4=; b=jKy2DqJw+sehdMoOm+3Yb5zAIs
	ngO8+HToB99bZgQxYeUxsATDyF5yzmI10icwpsD2afYvnQzJWtPjCgux9eagbWqvts9O5RRnrNyrR
	D81J3QffSvtzGjADeJfdM9PW/ibXC/6m3O/4FSTSfq9k5IygjdrZRfCBaY/JbmpMJebPiWm4U50vf
	ArAsQTS4zuN3GqzPdGErNQDQ8SL/ySHtZvF2A3iYn5cOg9KNmHeyjcQmIG1M4bvBqvjlBn88GL3+n
	OMjGWU7E9xZnjEqQGPKL5VeQv5TZ6AJKLjMkXfspvhag6Dls6v1RnCzXIZ50nImrW2dIeLTtonBuO
	spEYx93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RWj-0000000DZvU-21rp;
	Thu, 17 Apr 2025 15:51:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QtG-0000000DS1g-17pQ;
	Thu, 17 Apr 2025 15:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 587095C0449;
	Thu, 17 Apr 2025 15:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A143C4CEE4;
	Thu, 17 Apr 2025 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744902657;
	bh=k9KzxT8RtT8j3vaMkxgHq/WZQBArYVHXFWM5CAfhicI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qPejttI5AeQmQ210H5IK7GP2nZk1Lu3IhtfKUVo2lfCfjpV+D5LcW9X/KYQ0NX55Z
	 Sd87CLpI0klQQpkfg3OzJv9YpNfxLEuBlXNByX2pe7TkIMWS6El/h9V5OeatNhAtbJ
	 ZOGpfuEsNyUnQ/wYzJDAo8sNKJJUewOglfBsC0kXRIn581ucRmt+OrpaJuLA2ymSRr
	 j6n9DsikYoUnOi/pvSRiYN/aQfP5KZJ4MtW5+tckyPPIGTDLAL3Khsa5ve7cF6IRi9
	 BXJH1U2/p1lY0AevN2ZKY3l1tklGxf075KWiZ0ejZFtvhaB3J3DgN+YnpNopLDDRXJ
	 6QjYLxDdQzzDQ==
Date: Thu, 17 Apr 2025 08:10:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Florian Fainelli
 <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 4/5] net: ethernet: mtk_eth_soc: net: revise
 NETSYSv3 hardware configuration
Message-ID: <20250417081055.1bda2ff6@kernel.org>
In-Reply-To: <28929b5bb2bfd45e040a07c0efefb29e57a77513.1744764277.git.daniel@makrotopia.org>
References: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
	<28929b5bb2bfd45e040a07c0efefb29e57a77513.1744764277.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_081058_367268_5ED5DEA7 
X-CRM114-Status: GOOD (  12.99  )
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

On Wed, 16 Apr 2025 01:51:42 +0100 Daniel Golle wrote:
> +		/* PSE should not drop port8, port9 and port13 packets from WDMA Tx */
> +		mtk_w32(eth, 0x00002300, PSE_DROP_CFG);
> +
> +		/* PSE should drop packets to port8, port9 and port13 on WDMA Rx ring full */

nit: please try to wrap at 80 chars. There's really no need to go over
on comments. Some of us stick to 80 char terminals. 

> +		mtk_w32(eth, 0x00002300, PSE_PPE_DROP(0));
> +		mtk_w32(eth, 0x00002300, PSE_PPE_DROP(1));
> +		mtk_w32(eth, 0x00002300, PSE_PPE_DROP(2));
>  
>  		/* GDM and CDM Threshold */
> -		mtk_w32(eth, 0x00000707, MTK_CDMW0_THRES);
> +		mtk_w32(eth, 0x08000707, MTK_CDMW0_THRES);
>  		mtk_w32(eth, 0x00000077, MTK_CDMW1_THRES);
>  
>  		/* Disable GDM1 RX CRC stripping */
> @@ -4064,7 +4076,7 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
>  		mtk_w32(eth, 0x00000300, PSE_DROP_CFG);
>  
>  		/* PSE should drop packets to port 8/9 on WDMA Rx ring full */
> -		mtk_w32(eth, 0x00000300, PSE_PPE0_DROP);
> +		mtk_w32(eth, 0x00000300, PSE_PPE_DROP(0));
>  
>  		/* PSE Free Queue Flow Control  */
>  		mtk_w32(eth, 0x01fa01f4, PSE_FQFC_CFG2);
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 39709649ea8d1..eaa96c8483b70 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -151,7 +151,12 @@
>  #define PSE_FQFC_CFG1		0x100
>  #define PSE_FQFC_CFG2		0x104
>  #define PSE_DROP_CFG		0x108
> -#define PSE_PPE0_DROP		0x110
> +#define PSE_PPE_DROP(x)		(0x110 + ((x) * 0x4))
> +
> +/* PSE Last FreeQ Page Request Control */
> +#define PSE_DUMY_REQ		0x10C

This really looks like misspelling of DUMMY, is it really supposed 
to have one 'M' ?

