Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E6ECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 01:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQXcECPunPHAaSy37kQdJNhMbrkQlxUXVdqK+cyduSQ=; b=19ehOWBRWbD3NMG44HTUE5T+Ci
	PTo1NXUKYDlEeTGEJ4TPIXRBJgtNqDkVhoEttzXaNUKOHeZYci2DLQShAH1/AAh1gvjStDtutmZCM
	gS6chJU7up1FVNlJhMceboolcQbMrjhTBsoNIgxAvFFxaeKfSVUSmReuff8hMFG4mG0nIpPXzrLjx
	P+BI7na8tlts3T6bhXDSi0x03uPpAIr2bkWGlcLVMF2iKpw7JDsYytivnouC9dcJdqxfTMxKuJSW1
	SsNsHR/f3PDVKMyqP44hKMXpEzIBfO1ydPhIVerdzNlMMsPfXmsyII221eP45hmrlV81xNpNx6Tri
	XrBOlx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLJO-00000004JrZ-3MoY;
	Thu, 14 May 2026 01:56:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLJN-00000004Jqs-2xCb;
	Thu, 14 May 2026 01:56:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48A75600AE;
	Thu, 14 May 2026 01:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C20C19425;
	Thu, 14 May 2026 01:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778723787;
	bh=HrLduyXI9zCeP3Bd3VdjKvX9x9cVhWtg4uXkRIeD0x4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ljRMEIK+JRdImhbwoQMD9X3z4IDprlGW8c6sKeOIns6dyY05lKnsgAgbNNw3D8vvk
	 qznmWk0XYksZtZTfz5FSNWzmQ4kb2A63Hp5RMOh4E0LtpXRb6F0Yyvla4b60yAaRhB
	 JKHwhKSLHAxnqFsDhvLQ8mhr9cyjEH+cva4Gn21D0AlZqhtQZ3SUCxBCg7eh3W2a9c
	 DX9uzYpjI9rCr4rMWLGM+Q6B2tbn21xTKOw/OLModXaI8+qAHbn2Fv5z1E1s+oRTPZ
	 f7HHXw8KbJvGCmuNnVM3yzKAzEoR8f92yP+QRRlo/G6UO4H2HN2EocheCnNl4Vocwq
	 OsXCwpU3SyCqQ==
Date: Wed, 13 May 2026 18:56:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Frank Wunderlich
 <frank-w@public-files.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mason Chang
 <mason-cw.chang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [net-next v8 2/3] net: ethernet: mtk_eth_soc: Add RSS support
Message-ID: <20260513185625.48e69837@kernel.org>
In-Reply-To: <20260509190938.169290-3-linux@fw-web.de>
References: <20260509190938.169290-1-linux@fw-web.de>
	<20260509190938.169290-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat,  9 May 2026 21:09:31 +0200 Frank Wunderlich wrote:
> From: Mason Chang <mason-cw.chang@mediatek.com>
> 
> Add support for Receive Side Scaling.
> 
> We can adjust SMP affinity with the following command:
> echo [CPU bitmap num] > /proc/irq/[virtual IRQ ID]/smp_affinity,
> with interrupts evenly assigned to 4 CPUs, we were able to measure
> an RX throughput of 7.3Gbps using iperf3 on the MT7988. Further
> optimizations will be carried out in the future.

Would be great to split this up a little more for ease of review.

> +static int mtk_rss_init(struct mtk_eth *eth)
> +{
> +	const struct mtk_soc_data *soc = eth->soc;
> +	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
> +	struct mtk_rss_params *rss_params = &eth->rss_params;

reverse xmas tree should be followed, please fix everywhere in this
submission 

> +	u32 val;
> +	int i;
> +
> +	netdev_rss_key_fill(rss_params->hash_key, MTK_RSS_HASH_KEYSIZE);
> +
> +	for (i = 0; i < MTK_RSS_MAX_INDIRECTION_TABLE; i++)
> +		rss_params->indirection_table[i] = ethtool_rxfh_indir_default(i, eth->soc->rss_num);
> +
> +	if (soc->rx.desc_size == sizeof(struct mtk_rx_dma)) {
> +		/* Set RSS rings to PSE modes */
> +		for (i = 1; i <= MTK_HW_LRO_RING_NUM(eth); i++) {
> +			val = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(reg_map, i));
> +			val |= MTK_RING_PSE_MODE;
> +			mtk_w32(eth, val, MTK_LRO_CTRL_DW2_CFG(reg_map, i));
> +		}
> +
> +		/* Enable non-lro multiple rx */
> +		val = mtk_r32(eth, reg_map->pdma.lro_ctrl_dw0);
> +		val |= MTK_NON_LRO_MULTI_EN;
> +		mtk_w32(eth, val, reg_map->pdma.lro_ctrl_dw0);
> +
> +		/* Enable RSS dly int supoort */
> +		val |= MTK_LRO_DLY_INT_EN;
> +		mtk_w32(eth, val, reg_map->pdma.lro_ctrl_dw0);
> +	}
> +
> +	/* Hash Type */
> +	val = mtk_r32(eth, reg_map->pdma.rss_glo_cfg);
> +	val |= MTK_RSS_IPV4_STATIC_HASH;
> +	val |= MTK_RSS_IPV6_STATIC_HASH;
> +	mtk_w32(eth, val, reg_map->pdma.rss_glo_cfg);
> +
> +	/* Hash Key */
> +	for (i = 0; i < MTK_RSS_HASH_KEYSIZE / sizeof(u32); i++)
> +		mtk_w32(eth, rss_params->hash_key[i], MTK_RSS_HASH_KEY_DW(reg_map, i));
> +
> +	/* Select the size of indirection table */
> +	for (i = 0; i < MTK_RSS_MAX_INDIRECTION_TABLE / 16; i++)
> +		mtk_w32(eth, mtk_rss_indr_table(rss_params, i),
> +			MTK_RSS_INDR_TABLE_DW(reg_map, i));
> +
> +	/* Pause */
> +	val |= MTK_RSS_CFG_REQ;
> +	mtk_w32(eth, val, reg_map->pdma.rss_glo_cfg);
> +
> +	/* Enable RSS */
> +	val |= MTK_RSS_EN;
> +	mtk_w32(eth, val, reg_map->pdma.rss_glo_cfg);
> +
> +	/* Release pause */
> +	val &= ~(MTK_RSS_CFG_REQ);
> +	mtk_w32(eth, val, reg_map->pdma.rss_glo_cfg);
> +
> +	/* Set perRSS GRP INT */
> +	mtk_m32(eth, MTK_RX_DONE_INT(eth, MTK_RSS_RING(1)),
> +		MTK_RX_DONE_INT(eth, MTK_RSS_RING(1)), reg_map->pdma.int_grp);
> +	mtk_m32(eth, MTK_RX_DONE_INT(eth, MTK_RSS_RING(2)),
> +		MTK_RX_DONE_INT(eth, MTK_RSS_RING(2)), reg_map->pdma.int_grp + 0x4);
> +	mtk_m32(eth, MTK_RX_DONE_INT(eth, MTK_RSS_RING(3)),
> +		MTK_RX_DONE_INT(eth, MTK_RSS_RING(3)), reg_map->pdma.int_grp3);
> +
> +	return 0;
> +}

> +/* struct mtk_rss_params -	This is the structure holding parameters
> + *				for the RSS ring
> + * @hash_key			The element is used to record the
> + *				secret key for the RSS ring
> + * indirection_table		The element is used to record the
> + *				indirection table for the RSS ring
> + */

Quite odd looking comment. Having the right side aligned like that
makes it header to correlate where doc for fields start.
And there's @ missing for indirection_table.

