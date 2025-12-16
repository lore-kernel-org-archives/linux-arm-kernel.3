Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AA8D609A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUDTOrhQOBIrWpwiOVIMZnpyMYabqTrgQH9bpoaxmf0=; b=d3X5Mn2Opi8cf++Mo6j0XV6LMP
	Un40owkw+KIJPDAa0TjoyUIJcn07oxcGfZPOgDcNoTReVSXwwS9pC9udtRMwrAmwsPYMrdwivzblU
	tGm8rKeWnEdfe2n/x4Thq4QNDdb2cMfaL9a7ZmL0/35Rk5YZCw+B3raAKJlUE6x0GX8gohVjb6CFX
	klZ689Yfe9wJ+MThtGQD71g/F+qcGYSNpj3pndrMauWpFJmqBt6FpC/Lehz9JeO6oqWrvoQze6oqU
	iwx3ItQCh4IiSlsa7H+CK9FwUBrMva36/bd1gg3x/5MWQcZVET4bqHpeSrEfHVXmyBcc1Cq7nBKh3
	OBs5bENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWoi-00000005QmB-1LWn;
	Tue, 16 Dec 2025 15:18:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWof-00000005Qlx-47Gz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:18:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 272286001D;
	Tue, 16 Dec 2025 15:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5924BC4CEF1;
	Tue, 16 Dec 2025 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765898300;
	bh=Rc9QWypacPW0opXZqakR+OAZltI43nP1321U9t1LsW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jEEP6BY0usHguzaAQwBi5NkXSnXsBrko70JF7jFK7FEg/pKRRk924djRN1a7lTJDz
	 Wu98lY7g5MvzBkG8xK67S9xbn3ZmNvFa4B7PXtH/Hbgf8rjBTMwaxNz0jsAMw3Cm78
	 07Gi9aMWPMvQQ9Ep5SxHQcyoGyMvvwvActBfLHprv/q+XOxp+BcHI4CCrp2y8QEM16
	 9vs+/uZhoNJN/U7j+fF421T8R+MOUoNcJkJACAOVveqfrt9gH+Gj/B/lDKu0Gm1wVg
	 C7bLjzgEwFVwwef4C9TNrSco9U78Kt/EE9aEM49APsxn4nHRVgUa8sWbLb3+0H/gej
	 EzfLupT5t6wBw==
Date: Tue, 16 Dec 2025 20:48:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: ludovic.desroches@microchip.com, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, luka.perkov@sartura.hr,
	Tony Han <tony.han@microchip.com>
Subject: Re: [PATCH RESEND] dmaengine: at_xdmac: get the number of DMA
 channels from device tree
Message-ID: <aUF4OS4DsmRlQQt3@vaman>
References: <20251203121208.1269487-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203121208.1269487-1-robert.marko@sartura.hr>
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

On 03-12-25, 13:11, Robert Marko wrote:
> From: Tony Han <tony.han@microchip.com>
> 
> In case of kernel runs in non-secure mode, the number of DMA channels can
> be got from device tree since the value read from GTYPE register is "0" as
> it's always secured.
> 
> As the number of channels can never be negative, update them to the type
> "unsigned".
> 
> This is required for LAN969x.

You updated the changelog, but tagged it as resend. It should be v2!

> 
> Signed-off-by: Tony Han <tony.han@microchip.com>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/dma/at_xdmac.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index 3fbc74710a13..acabf82e293c 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
> @@ -2257,12 +2257,29 @@ static int __maybe_unused atmel_xdmac_runtime_resume(struct device *dev)
>  	return clk_enable(atxdmac->clk);
>  }
>  
> +static inline int at_xdmac_get_channel_number(struct platform_device *pdev,
> +					      u32 reg, u32 *pchannels)
> +{
> +	int	ret;
> +
> +	if (reg) {
> +		*pchannels = AT_XDMAC_NB_CH(reg);
> +		return 0;
> +	}
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels", pchannels);
> +	if (ret)
> +		dev_err(&pdev->dev, "can't get number of channels\n");

Do we need to log error, I thought the API did that...

> +
> +	return ret;
> +}
> +
>  static int at_xdmac_probe(struct platform_device *pdev)
>  {
>  	struct at_xdmac	*atxdmac;
> -	int		irq, nr_channels, i, ret;
> +	int		irq, ret;
>  	void __iomem	*base;
> -	u32		reg;
> +	u32		nr_channels, i, reg;
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
> @@ -2278,7 +2295,10 @@ static int at_xdmac_probe(struct platform_device *pdev)
>  	 * of channels to do the allocation.
>  	 */
>  	reg = readl_relaxed(base + AT_XDMAC_GTYPE);
> -	nr_channels = AT_XDMAC_NB_CH(reg);
> +	ret = at_xdmac_get_channel_number(pdev, reg, &nr_channels);
> +	if (ret)
> +		return ret;
> +
>  	if (nr_channels > AT_XDMAC_MAX_CHAN) {
>  		dev_err(&pdev->dev, "invalid number of channels (%u)\n",
>  			nr_channels);
> -- 
> 2.52.0

-- 
~Vinod

