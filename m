Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5038EC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 08:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpQ5LeQKLn8DmQkgnLVtZRFeuVCA8DvcNVHpHbSb/zo=; b=0yEYpgJ9Kt3MHfw4+hLJIf6FJ6
	K56nyeoRNOYh4c8iDYlkjKJAaNKMXofCMErPINUXgHRjXxuW6mc8FM7P/fNR/hRgl09eIpYBbi7E7
	CcRK+3gJ9ZO7KI835E+Dp7TTL9cWZxTTL9adG3Iu84P/VOzATOdLiXURQWT8XzM5rt3HRGQBrUxZ0
	PidkSmKuav8WPofQnjdR9GpeDPtFxnfha6cFOTfGlkKxspJVDqiZm18SP/Nh3o0temTxGxjr1XRxo
	EoaE1UXPuyCPiqTb/daP5l/593Wlc8g54BHuoL1Hkk4Fhr+YC32wQh/AGjGu9Pfb5IdTmQSY+3Ji1
	IFTlGqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQjf-0000000GY39-0Im6;
	Sat, 28 Jun 2025 08:16:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQhM-0000000GXxK-3Ngu;
	Sat, 28 Jun 2025 08:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CpQ5LeQKLn8DmQkgnLVtZRFeuVCA8DvcNVHpHbSb/zo=; b=Y7O3ZS+kX6ozjbiZFxL/E7Aiyb
	qhUaXUzRpe4wxEySlH4Pzl3f3E/nJNucCdluAS7TjBczAA5/tbO40+Jl3IAbaAb3NKhnzcFmpIh4M
	edGZyyZAQYvS3yr2fgMLBguNF2D8983l2oHX7k3zQm29+qffImlGIhpWrdjevUrWqM1A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uVQh5-00HDrs-JU; Sat, 28 Jun 2025 10:13:51 +0200
Date: Sat, 28 Jun 2025 10:13:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpool
 allocator for SRAM
Message-ID: <f9bec387-1858-4c79-bb4b-60e744457c9f@lunn.ch>
References: <cover.1751072868.git.daniel@makrotopia.org>
 <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_011408_847461_1204F608 
X-CRM114-Status: GOOD (  11.02  )
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

> +static void *mtk_dma_ring_alloc(struct mtk_eth *eth, size_t size,
> +				dma_addr_t *dma_handle)
> +{
> +	void *dma_ring;
> +
> +	if (WARN_ON(mtk_use_legacy_sram(eth)))
> +		return -ENOMEM;
> +
> +	if (eth->sram_pool) {
> +		dma_ring = (void *)gen_pool_alloc(eth->sram_pool, size);
> +		if (!dma_ring)
> +			return dma_ring;
> +		*dma_handle = gen_pool_virt_to_phys(eth->sram_pool, (unsigned long)dma_ring);

I don't particularly like all the casting backwards and forwards
between unsigned long and void *. These two APIs are not really
compatible with each other. So any sort of wrapping is going to be
messy.

Maybe define a cookie union:

struct mtk_dma_cookie {
	union {
		unsigned long gen_pool;
		void *coherent;
	}
}

Only dma_handle appears to be used by the rest of the code, so only
the _alloc and _free need to know about the union.

	Andrew

