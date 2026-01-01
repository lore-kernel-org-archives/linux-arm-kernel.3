Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E04EEB57E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xun5nAVdAtTvwCkV1ZZrOCWvvKCdra8g44MnjBJe1Y=; b=uDRsHwRYPr2x4ZpTlFqV7oevFS
	TS5eQ+hy6w/XrqG0FVsQ5wtXDqQ4erevklBt9X3LBM8JblVgsgTFzWXHdXWP3nn2SY09jgidk/bku
	rhEApeOD4F57tpCaN4MLos/etpiEqcqWBRrL4xlx0JTiLqg/4yGLMqlKXxYZi+6R9PxQeF8y26cpC
	GgqfvpowJULMzIzpa/owt46YbMud8HZkzqyt2iPiarsUdQSVqnpYMnKzK2xvw5uwtQZo0u9MbiKR+
	XLCQg44cg5ZflHJw/QcJbXyi3eMvTEt9Oi4byYy0nu2si1s+44YkztoOHF1IwhDXHvW2Le/yWvDj0
	bbjXbT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbHD7-00000006pOW-3Rfp;
	Thu, 01 Jan 2026 11:51:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbHD5-00000006pOO-3HHn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 11:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E61FA60008;
	Thu,  1 Jan 2026 11:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A062C4CEF7;
	Thu,  1 Jan 2026 11:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767268278;
	bh=RLsSabfas5/C1+TbA4/GiVfPW37dt/rGXwX8nVp6QVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ar2Cr2B0aQU9dFwhMmo+/bf6IyS7BPuG+cWXtHxa7d7mQmQuCrLgXJyCXysHneQ90
	 KCgHxWKkhK6PfF663+qKzYNwXi3QAV0vnM5QEclffItM7YRLGV0mcNkalhItKZclFu
	 T88yIRmgYhMXaPtjFXz75ExTQw2FSYmZI1CCPUSiUCvd7GbIyIXou/lBk2pVPZMnyd
	 ANPwrZQO3taXMk1knw6Fd7gDrFt5takK6s8yLXJOcog+XOQNOrvXI3YXonUh4JXn/H
	 qNgMi6QoTAt7siBmXHKhr3tIh18y7JYdg56j7DXaQB5K5R6KwXUj1JSJNftlsDclVy
	 14IZ9eVhlAmtg==
Date: Thu, 1 Jan 2026 17:21:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dmaengine: axi-dmac: Simplify with scoped for each
 OF child loop
Message-ID: <aVZfs3yPrkWYwNCw@vaman>
References: <20251224124531.208682-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224124531.208682-3-krzysztof.kozlowski@oss.qualcomm.com>
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

On 24-12-25, 13:45, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.

Hey Krzysztof,

This fails to apply for me, can you please rebase and post again

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/dma/dma-axi-dmac.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index 5b06b0dc67ee..45364b1e47f4 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -925,24 +925,21 @@ static int axi_dmac_parse_chan_dt(struct device_node *of_chan,
>  
>  static int axi_dmac_parse_dt(struct device *dev, struct axi_dmac *dmac)
>  {
> -	struct device_node *of_channels, *of_chan;
> -	int ret;
> +	struct device_node *of_channels;
> +	int ret = 0;
>  
>  	of_channels = of_get_child_by_name(dev->of_node, "adi,channels");
>  	if (of_channels == NULL)
>  		return -ENODEV;
>  
> -	for_each_child_of_node(of_channels, of_chan) {
> +	for_each_child_of_node_scoped(of_channels, of_chan) {
>  		ret = axi_dmac_parse_chan_dt(of_chan, &dmac->chan);
> -		if (ret) {
> -			of_node_put(of_chan);
> -			of_node_put(of_channels);
> -			return -EINVAL;
> -		}
> +		if (ret)
> +			break;
>  	}
>  	of_node_put(of_channels);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int axi_dmac_read_chan_config(struct device *dev, struct axi_dmac *dmac)
> -- 
> 2.51.0

-- 
~Vinod

