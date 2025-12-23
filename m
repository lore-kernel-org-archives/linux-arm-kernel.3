Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F055E6B272
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Md+l1CMe6xZwqh7Ts+gRFTVC6B+gztfBrQ1rIeGhSaE=; b=HyDjDEMAlKG2Yx6YfYz6pVIG1E
	ehDKzGI1B5cuzpydHJf80VxHuul1YAK9Pbr1kvVjaSxETAIGU71bSFq2F/BB0BKsdLxsFt6KZQ/VN
	RLMtOA5NO8Hqg9/jGJiLotwPvc8ancaF1YofoU38JcuP7XD8/Wfo3Br9bWgWZ9/EySLYq+4XEKS32
	KRunLbCcPH3xu4PAdoZkv12ig0qfs2JgaRPt0sGSqos+XVPMCG/5sq7mtB6MOE/VPmv0xjrn5zJBs
	c5sNSdtxzpaVHPfyOk4ZKeV9ObEr1A46x1jUjMsh3gEKafY1qnAAnl19MY1VvZkzJzO1+sdHsuPj6
	7DG9CcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0ZD-0000000EwnW-0l8S;
	Tue, 23 Dec 2025 11:28:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Z7-0000000EwkD-1BwG;
	Tue, 23 Dec 2025 11:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76D7B44404;
	Tue, 23 Dec 2025 11:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035D6C19424;
	Tue, 23 Dec 2025 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766489312;
	bh=DrFdDG6IvSD40UbQviAe9Hu1ENooMM/4w95t2G/Z3ag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AzkSYThXqZHzQOmrf/zMBBKv4KhWOl0FiqdRWP7lPm49CsiCIK4qTWEpKmF+TBqQ3
	 GkBpGVTce/skOn3alymq8zP7KyNT1JdBa3H9iOOppgZw4Ng/TaSLxzSXR9peqY19Xj
	 76SFoEMldM2QxK75XRGE8EDePqmG0V7+pIHPAVKaNUy4SdYY073vQpWK3divFjojrJ
	 0yU6TeMIxzJBs3pT7hJ65bVrQvR7XYGSKtbWlZ9yJMYWxYv/nO8FGne8Btbb3q6syI
	 02xTZ6++14YRGtgpzB7pPWDYajptWCZ5fUFFswGTxvIFZWHGpKGFYy+F29Oo2PfZxr
	 C4DVDowPfK8qQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@mediatek.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, long.cheng@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/8] MediaTek UART DMA: Fixes, improvements and new
 SoCs
Message-Id: <176648930864.697163.15382813689450810341.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 16:58:28 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_032833_355356_2A6AECCB 
X-CRM114-Status: UNSURE (   9.00  )
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


On Thu, 13 Nov 2025 13:22:21 +0100, AngeloGioacchino Del Regno wrote:
> This series performs fixes the MediaTek UART DMA driver to be able
> to correctly program AP_DMA controllers that support extended
> addressing, performs some cleanups to improve code readability
> and adds support for *all* of the SoCs generations that are upstream.
> 
> This includes MT6795, MT7988, MT8173, MT8183, MT8186, MT8188, MT8195,
> other than all of their Genio variants (where applicable), all of
> their Smartphone variants (where applicable), and also some newer
> generation SoCs that are in the process of being upstreamed, like
> MT8196 and MT8189.
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: dma: mediatek,uart-dma: Allow MT6795 single compatible
      commit: 4b9ce35ca5924c195df1a6bbccdc9aae4f5cb422
[2/8] dt-bindings: dma: mediatek,uart-dma: Deprecate mediatek,dma-33bits
      commit: ebc5e9176e0f9b7effc259b58a7387019ac8811d
[3/8] dt-bindings: dma: mediatek,uart-dma: Support all SoC generations
      commit: fd7843f0da58b37072c1dafa779d128bb36912bf
[4/8] dmaengine: mediatek: uart-apdma: Get addressing bits from match data
      commit: ff81a68a87b1dbf5c1b819f240f83715c701ef0d
[5/8] dmaengine: mediatek: uart-apdma: Fix above 4G addressing TX/RX
      commit: 58ab9d7b6651d21e1cff1777529f2d3dd0b4e851
[6/8] dmaengine: mediatek: mtk-uart-apdma: Rename support_33bits to support_ext_addr
      commit: 7cb173936858f2278d9cf8b2f5d7d52fd000e54e
[7/8] dmaengine: mediatek: mtk-uart-apdma: Add support for Dimensity 6300
      commit: 391e20f21cfdee2f55f2274e83b37c03199062ea
[8/8] dmaengine: mediatek: mtk-uart-apdma: Add support for Dimensity 9200
      commit: 3587b2b6bf7681835c7c366c6083e2cd9e4b519d

Best regards,
-- 
~Vinod



