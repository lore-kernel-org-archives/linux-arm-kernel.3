Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99B5606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H/6gnLMc;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ltGKwxRh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5gnVlI3t3VVUoodbzEk4zSr2iu3mmhJbSxzN4GsgLrU=; b=H/6gnLMcQZobXQ45Fzkr8wO241
	vMb+hyGBXSb+nK2dtgjlIYeNX9tqp5XQ/vLH1jQQ7k3x0xwW53Ai7siY4BhpjuQdgJWzoGQYiioMp
	xyCoE7qGHkpxw3nKZC/IE1GwO8P7DgpwYP+JwbsQmk9dhdl5jonzzTE3hNrwk8EeNim3PNdpMsIDz
	yA3XcHyKVGcIY1ky+squ3gHE+I9oHDZPBeddDzIiVydsXAxkVoL64NZponwt2rvRagzxIQtzwVZWY
	64SN9Hf7ZkHlf9LtXRoIcV04LD+woLknYQOCN1NPkrxXRZWZ1B31kDkdgoR5linmvohIHf9ycTtlz
	hWZEZ4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKvg-0000000Cf6X-0CoT;
	Fri, 06 Nov 2026 14:28:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKvf-0000000Cf5w-0Ki2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:28:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B778602D4;
	Fri,  6 Nov 2026 14:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73941F008A1;
	Fri,  6 Nov 2026 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975310;
	bh=5gnVlI3t3VVUoodbzEk4zSr2iu3mmhJbSxzN4GsgLrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ltGKwxRh7GFtJ1PdAlg+eVsMmET1NOOPCZZV1MdFc7xe2BCGDCDdRsMQcnwt4Q/0y
	 Pdt7ZkCj9tdGzFH2zHXtycHf6IeyHc6k7pH/ozeW1uU0vgNNkzxR0icOKaSID7DKNC
	 xahnNCtRKSsJENz3WWq/Heb7Lay/JYUmrVzL9e4Uk5uSNS6Xpu3P/D63SxNVo6AiFB
	 qD8TxPxxouTOMaZZfBuuC7/RgZYU61D9X0TZbW4ONYfGwRwcSoporoBLCeV7Bdu0A8
	 vJ4k3hpqD0t44ZczYPbVjHdDqfTqAQi+nRtqk5uE9cfSvIqdGwjH9nNvIMb/qpgSjH
	 EJFR1Ln8vQJyg==
Date: Fri, 6 Nov 2026 08:28:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dmaengine@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Abin Joseph <abin.joseph@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Frank Li <Frank.Li@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Harini Katakam <harini.katakam@amd.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: dma: xlnx,zynqmp-dma: Require resets
 for Versal Gen2
Message-ID: <179397530668.3117263.5180945931257421774.robh@kernel.org>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-1-f9990669362f@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-1-f9990669362f@amd.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 06 Nov 2026 15:40:23 +0530, Golla Nagendra wrote:
> Require the per-channel resets property for Versal Gen2
> DMA devices, which expose dedicated reset lines.
> 
> Making resets required for Versal Gen2 results in an ABI break, but this
> is unavoidable. While the driver works in many scenarios when no other
> firmware has used the DMA prior to Linux boot, there is no guarantee the
> channel is left in a clean state. In observed error scenarios, a reset is
> necessary before Linux can reconfigure the IP after previous use by other
> firmware components. Due to configuration differences or the DMA being
> left in a bad state, DMA functionality fails when sequential software
> components use the channel (e.g., firmware before Linux boot). The channel
> can only be cleanly re-configured after a per-channel reset, making it
> essential. This ABI break is only applied to Versal Gen2 and where the
> per-channel reset capability is available.
> 
> Fixes: 36545c6a68b8 ("dt-bindings: dmaengine: zynqmp_dma: Add a new compatible string")
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml    | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


