Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A1DCCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huLhdhXnoJSDQMG1/CHEsQNRS/mAokHjuzyGY9yE1ug=; b=b5MU/+/8iyNDOCumDjKI+ecCxG
	GWwYRkRtu20oW223y8uT1FoFqsyAtrFQTVCHVVlcyLsjy+OKaiBTc8CNqaRj5SUDwb/b4g2lIV3kH
	sza9mvRkwkpR3E/3jirTgBEsgwqXWesUj19Erz1gxy/7tWyurDRJQNASXleKZd3+7qi9TBlFKTQWO
	/l0So4Ov57UwQVGDG2FncceiZ/1+Og0p4VdknZSFhGr5XhefPRBfrL4K2m6vAiz3JGqP+G16F9va4
	LPLHVzKzeg0iuaGtEstjb6xS7RzQ+VO+L3J9agepzU5SKM29MVHpVI2HhDI9parryGZBdo0/vSANm
	dxlDUHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TQJ-00000003pjH-1vvG;
	Wed, 08 Oct 2025 12:37:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TQH-00000003pic-1PlL;
	Wed, 08 Oct 2025 12:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C67440BB3;
	Wed,  8 Oct 2025 12:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BA3C4CEF4;
	Wed,  8 Oct 2025 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759927056;
	bh=la5UGkrChP41nMA8ubVJ6aDpaA9vwENHhK+zqCfr9go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOI2jsR8CxcKyy6uc5misn1Qu/ayWTCBtndON+96E7TP5Ye+qvksJGxAzH30GzNb5
	 gdln0W0RWs/qqI87aKJTjGG4zyp16K0qA8D1fEcplk6IIhiX21x+lMgEaFCytYdcD7
	 XhSOSOuZ1BpmTzSTtT9IPYT23B20TvmxvnRE4TjUP8KO79kHkL5qKbTkX9Ov+z0DBF
	 05s1D2kDjbQ3JQOwGPgirQeJjVo5uVE0bfEtXhFpvsbj3KxnYWlcC9N738wl+vzd27
	 tc7DtgdJxbKXBAitmEyLtZ6nBaKC4llBvDUh3F/8TwvMbBE3vBGpJ+fdQeLeliUXjT
	 othLSO+snPIxA==
Date: Wed, 8 Oct 2025 13:37:31 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>,
	Daniel Pawlik <pawlik.dan@gmail.com>,
	Matteo Croce <teknoraver@meta.com>
Subject: Re: [PATCH net] net: mtk: wed: add dma mask limitation and GFP_DMA32
 for device with more than 4GB DRAM
Message-ID: <20251008123731.GR3060232@horms.kernel.org>
References: <20251008-wed-4g-ram-limitation-v1-1-16fe55e1d042@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-wed-4g-ram-limitation-v1-1-16fe55e1d042@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_053737_396633_054147DE 
X-CRM114-Status: GOOD (  12.32  )
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

On Wed, Oct 08, 2025 at 12:48:05PM +0200, Lorenzo Bianconi wrote:
> From: Rex Lu <rex.lu@mediatek.com>
> 
> Limit tx/rx buffer address to 32-bit address space for board with more
> than 4GB DRAM.
> 

Hi Lorenzo, Rex, all,

As a fix for net a Fixes tag should probably go here.
> Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
> Tested-by: Matteo Croce <teknoraver@meta.com>
> Signed-off-by: Rex Lu <rex.lu@mediatek.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

> @@ -2426,6 +2426,10 @@ mtk_wed_attach(struct mtk_wed_device *dev)
>  	dev->version = hw->version;
>  	dev->hw->pcie_base = mtk_wed_get_pcie_base(dev);
>  
> +	ret = dma_set_mask_and_coherent(hw->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return ret;

I think 'goto out' is needed here to avoid leaking hw_lock.

> +
>  	if (hw->eth->dma_dev == hw->eth->dev &&
>  	    of_dma_is_coherent(hw->eth->dev->of_node))
>  		mtk_eth_set_dma_device(hw->eth, hw->dev);
> 

-- 
pw-bot: changes-requested

