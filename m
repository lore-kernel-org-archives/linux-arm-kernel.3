Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF79D29FAE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 18:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnikBdJoxxg8wHn9SWnSAU8ENnmXRyP1O/uoqrq/9Pw=; b=EUxFn0IIYdrfz+RUqKrIGbdczk
	Uwf7g3YtNk3j9AD6iVb4vOMRd3EjaxhQV8XyB5tA4B4hmm77L0wgDS6hO80gD3rOa2+O2FFfv40rn
	DIQ2bGLaPfikKP7+hHkwnaxKIiJqEKkTUc8G/9QbVcye2VvlqIUBN1l5fmIE/f9y8f4rwf6FIQHVz
	wqcvox/lIKIJOhyocQlTJvHBOrKUFUfY2dppP7uLpkayMluzlcI/62MhR39xgZ91WXEDRCjDZpjzi
	wl98PxzQLOIF11+XqCscwFPUzmEDtDpPVuez+QeL29XhtSbxTPJh3SS0Snt51azO0NegCz0hGTbMz
	d0OGQbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRED2-00000008SCR-0L2F;
	Thu, 04 Dec 2025 18:37:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRED0-00000008SCF-0eJf;
	Thu, 04 Dec 2025 18:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94314601ED;
	Thu,  4 Dec 2025 18:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640D6C116C6;
	Thu,  4 Dec 2025 18:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764873461;
	bh=bYWLSgF9p7Y5PVUDIPslbzBPgg5NlyMtulDnw+w6ZEc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C/TdZ+0jKLvwtqzuLmY578EyageX500aWx4B97L2AGETjMz0TJtXQNw3NqF331SYg
	 HQvqoIsdo+CZr3PFCYlyJ5B9EmQWdx26dms+p64N7yKDON3EFAG0pK0HFLYeUZmNg5
	 9NUNkf7CzSG2+Y5NhPqGR3USJaQ6FH90zPwG3Ois3qUAjV1Vqy+2YHm2KgUq3z+Q78
	 QH8XEqDETRW4EAqdOcfN7O8+T8hnzi/ADTvHqBZPtfpdze5TrVACCXuZZ9vDli5zay
	 ZYHoDohjEzZZ7aQLOJeM2Xpje6kziAgtH+cRLIhw53JRfGDYCV3h68D6YQvaOzJ9r3
	 e0W5KIg1Vc/Zw==
Date: Thu, 4 Dec 2025 10:37:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Russell King
 <linux@armlinux.org.uk>, Frank Wunderlich <frank-w@public-files.de>, Daniel
 Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mason Chang
 <mason-cw.chang@mediatek.com>
Subject: Re: [RFC v2 2/3] net: ethernet: mtk_eth_soc: Add RSS support
Message-ID: <20251204103739.013d053b@kernel.org>
In-Reply-To: <20251204165849.8214-3-linux@fw-web.de>
References: <20251204165849.8214-1-linux@fw-web.de>
	<20251204165849.8214-3-linux@fw-web.de>
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

On Thu,  4 Dec 2025 17:58:44 +0100 Frank Wunderlich wrote:
> +static int mtk_rss_init(struct mtk_eth *eth)
> +{
> +	const struct mtk_soc_data *soc = eth->soc;
> +	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
> +	struct mtk_rss_params *rss_params = &eth->rss_params;
> +	static u8 hash_key[MTK_RSS_HASH_KEYSIZE] = {
> +		0xfa, 0x01, 0xac, 0xbe, 0x3b, 0xb7, 0x42, 0x6a,
> +		0x0c, 0xf2, 0x30, 0x80, 0xa3, 0x2d, 0xcb, 0x77,
> +		0xb4, 0x30, 0x7b, 0xae, 0xcb, 0x2b, 0xca, 0xd0,
> +		0xb0, 0x8f, 0xa3, 0x43, 0x3d, 0x25, 0x67, 0x41,
> +		0xc2, 0x0e, 0x5b, 0x25, 0xda, 0x56, 0x5a, 0x6d};
> +	u32 val;
> +	int i;
> +
> +	memcpy(rss_params->hash_key, hash_key, MTK_RSS_HASH_KEYSIZE);

netdev_rss_key_fill()

> +	for (i = 0; i < MTK_RSS_MAX_INDIRECTION_TABLE; i++)
> +		rss_params->indirection_table[i] = i % eth->soc->rss_num;

ethtool_rxfh_indir_default()

> +static int mtk_get_rxfh(struct net_device *dev, struct ethtool_rxfh_param *rxfh)
> +{
> +	struct mtk_mac *mac = netdev_priv(dev);
> +	struct mtk_eth *eth = mac->hw;
> +	struct mtk_rss_params *rss_params = &eth->rss_params;
> +	int i;
> +
> +	if (rxfh->hfunc)
> +		rxfh->hfunc = ETH_RSS_HASH_TOP;	/* Toeplitz */

hfunc is not a pointer, you should just set it?

> +	if (rxfh->key) {
> +		memcpy(rxfh->key, rss_params->hash_key,
> +		       sizeof(rss_params->hash_key));
> +	}
> +
> +	if (rxfh->indir) {
> +		for (i = 0; i < MTK_RSS_MAX_INDIRECTION_TABLE; i++)
> +			rxfh->indir[i] = rss_params->indirection_table[i];
> +	}
> +
> +	return 0;
> +}

