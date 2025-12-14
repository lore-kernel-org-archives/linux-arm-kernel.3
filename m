Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5550FD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 16:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwWNAca6IA5vmr33BT6LB87k+Vr0WcFKaaVLLN0k/Nc=; b=jnq8gywhah115Y65m8tLC96UyL
	jCUz+bEVFSxlzlcckRDjw1e1bLSGlcp4lICsHvVAMWNqgR8MKyd++hHtfUzawecNiPZjO9x3JbeVq
	Xt6aucBYvNlu5QojmTzhqYJkIR3wlXNstWUC//rS83Eq5L3fAXiKnq2wRKX/gOKzHutSPDA8d+BmK
	mRzdvG2hequzDX/HovV1jCZu6sU1jCIQALnekjdDTylZ+q8SKqghFHT6ufHESrDKfNF9fBJeNxveF
	K86ipCxpEP4aqPNdrMlden56Tb4oD9y4r3UdzpOps5X/u978eChC4OIFn3pZSjq6WSQ1NHaEGDQGe
	C7nwlZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUpIJ-00000002bd4-1TI4;
	Sun, 14 Dec 2025 16:50:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUpIH-00000002bcG-0fJa;
	Sun, 14 Dec 2025 16:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QwWNAca6IA5vmr33BT6LB87k+Vr0WcFKaaVLLN0k/Nc=; b=K6AYswP9380Ujw+zJp4aPgckjG
	v7RaMAYynrjPlMGXf97mGism4HRCRMAeq2v8ERlKUevs9EmXSlARn1PT/e9yZlIjZdzX77gfHfdyE
	bxvWHLdKkTe6aDBzrRoLrUrOlt8gV1JtV5ZlsfvQ5+Ps4+N4nEttU37YS3Lx3ZzWEbUo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vUpHz-00Gvmp-Mz; Sun, 14 Dec 2025 17:49:43 +0100
Date: Sun, 14 Dec 2025 17:49:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mason Chang <mason-cw.chang@mediatek.com>
Subject: Re: [RFC net-next v3 3/3] net: ethernet: mtk_eth_soc: Add LRO support
Message-ID: <2e00738e-6d17-4ba6-8af4-7e02783b17da@lunn.ch>
References: <20251214110310.7009-1-linux@fw-web.de>
 <20251214110310.7009-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214110310.7009-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_085001_199492_F83E87BE 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

>  static int mtk_hwlro_rx_init(struct mtk_eth *eth)
>  {
>  	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
> -	int i;
> +	const struct mtk_soc_data *soc = eth->soc;
> +	int i, val;
>  	u32 ring_ctrl_dw1 = 0, ring_ctrl_dw2 = 0, ring_ctrl_dw3 = 0;
>  	u32 lro_ctrl_dw0 = 0, lro_ctrl_dw3 = 0;

Reverse Christmas tree. It looks like it was already broken, but you
should not make it worse, and i think you can even fix it here.

> +static int mtk_hwlro_add_ipaddr_idx(struct net_device *dev, u32 ip4dst)
> +{
> +	struct mtk_mac *mac = netdev_priv(dev);
> +	struct mtk_eth *eth = mac->hw;
> +	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
> +	u32 reg_val;
> +	int i;

More Reverse Christmas tree probes. You will need to move the
assignment to reg_map into the body of the function.

> +#define MTK_PDMA_LRO_CTRL_DW0	(reg_map->pdma.lro_ctrl_dw0)
> +#define MTK_PDMA_LRO_CTRL_DW1	(reg_map->pdma.lro_ctrl_dw0 + 0x04)
> +#define MTK_PDMA_LRO_CTRL_DW2	(reg_map->pdma.lro_ctrl_dw0 + 0x08)
> +#define MTK_PDMA_LRO_CTRL_DW3	(reg_map->pdma.lro_ctrl_dw0 + 0x0c)

Same comment as the previous patch.

	Andrew

