Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9762ACCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrRv49YnavKnbN3HQARf73o0yWkwkkZ8Xo6Bj8ExjN0=; b=20g1u7PGxX1uHSHJQGQsFbciBw
	7J2oWfnYlHQGBONySKWkHg0z7cl9jniwQW3z4Jzso8TymgLtdEP7zoOVlcfew3xF4GI3/ENoGOnCD
	ZA+Dk0HlSQE4G3lVt4akzFI57ZZq+zkJrSlMlLUo2K2yiBkgHOYg+lB+iQHTWyjY5RpHu7dFkGSzu
	MGBSGbyvQAffVTjtyioDGIzDMk23EChQLHTpyzdOK8bgBKa4m265GpaEfMVhLAH+saBedjaGaCRj5
	zzGRnpTRlnj+2TPkEbQWSCOrVf65jNaSpHv4cvwZqTu81rUcKj8GRsubXiCBt81PPT2gbpVFOX67T
	aZgehDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mQG-00000005ZrR-3Up9;
	Thu, 09 Oct 2025 08:54:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mQF-00000005ZrE-1PrB;
	Thu, 09 Oct 2025 08:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF43762233;
	Thu,  9 Oct 2025 08:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D67C4CEE7;
	Thu,  9 Oct 2025 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760000090;
	bh=ZloOlTLnnd1lQwtetVDQnNVcBn0VSlgf2dby3oP+A10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=suYQvi9CyNc76fgBHVCilzOJ/oaQP0Dro2E9TrVzXVfQ2T6EjWJlkaT4EKR/+ngfn
	 Qdx2HLEspYt+oicqES2GxMxECWlS1QeS+tjJYDMazIZ2bCyKzTZB9+pNXHSZuicjAg
	 sAFq8s8I6QKswnle3QHg5U9E9Bjb5YwNJYfGz3495NwZZV4WnvZqMOCZbPQnShXswF
	 CUFWStQ2c6kUqW6ZjSAgxAvUaIkAP9Dh/yJWK0pCGfCnyAnl66eQUy2qqxWFg75LRu
	 PhQLk+oag8pIq5vO4DvST9Y2ZkgQUv8f+q5KN/KRXxkZ1JsCQhTM3Dz3m3aNFj4cA/
	 MFOj0ZaSOKvBw==
Date: Thu, 9 Oct 2025 09:54:45 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>,
	Daniel Pawlik <pawlik.dan@gmail.com>,
	Matteo Croce <teknoraver@meta.com>
Subject: Re: [PATCH net v2] net: mtk: wed: add dma mask limitation and
 GFP_DMA32 for device with more than 4GB DRAM
Message-ID: <20251009085445.GV3060232@horms.kernel.org>
References: <20251009-wed-4g-ram-limitation-v2-1-c0ca75b26a29@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-wed-4g-ram-limitation-v2-1-c0ca75b26a29@kernel.org>
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

On Thu, Oct 09, 2025 at 08:29:34AM +0200, Lorenzo Bianconi wrote:
> From: Rex Lu <rex.lu@mediatek.com>
> 
> Limit tx/rx buffer address to 32-bit address space for board with more
> than 4GB DRAM.
> 
> Fixes: 804775dfc2885 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
> Fixes: 6757d345dd7db ("net: ethernet: mtk_wed: introduce hw_rro support for MT7988")
> Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
> Tested-by: Matteo Croce <teknoraver@meta.com>
> Signed-off-by: Rex Lu <rex.lu@mediatek.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Add missing Fixes tags
> - Avoid possible deadlock if dma_set_mask_and_coherent fails
> - Link to v1: https://lore.kernel.org/r/20251008-wed-4g-ram-limitation-v1-1-16fe55e1d042@kernel.org

Thanks for the updates.

Reviewed-by: Simon Horman <horms@kernel.org>


