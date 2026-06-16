Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEDBCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYszhK6WxOVPWQUbaHbnDx1n+yjag9Hv6cthNWEQF+0=; b=ZucdKYHSTyFNNVvvsqQlf0Vmjh
	lNpd3Y+PMgwdxJLgytvWy6hIPLRQ+/2Da+pRZ7bFSv2qYwJRF2alBm36NZPgjekXSn2A8OenF89ve
	buYYLn4FKj4+y/B8jnEPBfYy3YW+1t4jJenAWWIBBZlU/0qAqKsvqJYxneqIX/Zc+fDjBtwddNDjQ
	ptt+MVtneGsCWQK41Pc2aG2MvBSk2jKwbpjagL4XRjoZx4Jkd/UXQ+Zo7z4lqasRchM6U19gvFfBf
	HehmiLBj2rvixl6GK1UsZg3e1nWciRr8Almh3M8BXS9rjHuVpE7WfixDzIL/DZLTf8cnHopgxXRZD
	j9VXju/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOy1-0000000FQWf-3dO8;
	Tue, 16 Jun 2026 08:16:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOxx-0000000FQWI-0pX2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 08:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38ADB40134;
	Tue, 16 Jun 2026 08:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AE71F000E9;
	Tue, 16 Jun 2026 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781597772;
	bh=KYszhK6WxOVPWQUbaHbnDx1n+yjag9Hv6cthNWEQF+0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RSMDCDw51+nLSofJBh02sdNbMVceO0cma1wN64jWmVAWTZULW2R3tYlmeQ1ZcxDY2
	 MoW+axlsz5dL16v8oeezk2XDRiwwWXDct+8HBDTVreYhP42LWXkEEO0ewVtpk8xhsz
	 5qj/tKR5hxlICXVGGooZZMeAB6/WfZ3JnkbzqycvfZqULcJreSon8ys8qGqSkyZU8C
	 wIMRSzvtqFXKi0E6bJfaQE9eu50vt8jN4YaQe7Rtn2lmaawRpqo7+/PXz8CUMLWEaH
	 ObVLa7PCJ123b5i6BN0sJxc+5xBNqJQkIcyya0Ox/8fOWxykP2+zrFACa38wlb4j3A
	 JINTWWSXxukTQ==
Date: Tue, 16 Jun 2026 17:16:09 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sangyun
 Kim <sangyun.kim@snu.ac.kr>, Kyungwook Boo <bookyungwook@gmail.com>,
 stable@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2] spi: uniphier: Fix completion initialization order
 before devm_request_irq()
Message-Id: <20260616171609.358d9d8c39ff7a59cd1559fc@kernel.org>
In-Reply-To: <20260616011223.201357-1-hayashi.kunihiko@socionext.com>
References: <20260616011223.201357-1-hayashi.kunihiko@socionext.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Tue, 16 Jun 2026 10:12:23 +0900
Kunihiko Hayashi <hayashi.kunihiko@socionext.com> wrote:

> The driver calls devm_request_irq() before initializing the completion
> used by the interrupt handler. Because the interrupt may occur immediately
> after devm_request_irq(), the handler may execute before init_completion().
> 
> This may result in calling complete() on an uninitialized completion,
> causing undefined behavior. This has been observed with KASAN.
> 
> Fix this by initializing the completion before registering the IRQ.
> 
> Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
> Reported-by: Kyungwook Boo <bookyungwook@gmail.com>
> Fixes: 5ba155a4d4cc ("spi: add SPI controller driver for UniPhier SoC")
> Cc: stable@vger.kernel.org
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>


> ---
> Changes in v2:
> - Rebase onto latest, no functional changes

BTW, please clarify the actual branch name instead of "latest".

Thanks,

> 
> drivers/spi/spi-uniphier.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-uniphier.c b/drivers/spi/spi-uniphier.c
> index cc20fd11f03f..86fce9a571da 100644
> --- a/drivers/spi/spi-uniphier.c
> +++ b/drivers/spi/spi-uniphier.c
> @@ -656,6 +656,8 @@ static int uniphier_spi_probe(struct platform_device *pdev)
>  	priv->host = host;
>  	priv->is_save_param = false;
>  
> +	init_completion(&priv->xfer_done);
> +
>  	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
> @@ -679,8 +681,6 @@ static int uniphier_spi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	init_completion(&priv->xfer_done);
> -
>  	clk_rate = clk_get_rate(priv->clk);
>  
>  	host->max_speed_hz = DIV_ROUND_UP(clk_rate, SSI_MIN_CLK_DIVIDER);
> -- 
> 2.34.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

