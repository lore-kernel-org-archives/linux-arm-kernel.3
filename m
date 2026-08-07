Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FB1C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VZxQVe0jS1OTZMJhYdvjJYPhd/BX/WOKdGcGdpHtZM=; b=igPMoHvAiwKRGNO7DqXXgWaALa
	mqbi8hk565mhckdfw8ZytDN3lUUTPWMAtPFy7SKpl4xKshJOC+D+mrNL95DQkrsDXuvTY4L+Ydkxl
	DLFNj3SpMQ0xm0SP5kXfm5H5PoU5OVxB6RctW6xcei0Jnguxu7TWzlu7kvE7UUydaBA12iVTCeMWC
	JljoXqPiaLpZjUnYfS3cwg3ptmrlZ+9M8F56SqUq9CaCa8Rp3bYCkgDJBuYa+5K2YnDs7Tw4XELtZ
	Pnxym3rLw5xhBoNzsTnkFCychGHDt44T6YMor8UJtqlPa3zq7s738ekZEDC2EAF7tUQg2mTE++3tA
	twT7pZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsExq-00000007Eek-3R1U;
	Fri, 07 Aug 2026 07:25:58 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsExo-00000007Ee7-1zRf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:25:57 +0000
Received: from martin by akranes.kaiser.cx with local (Exim 4.98.2)
	(envelope-from <martin@akranes.kaiser.cx>)
	id 1wsExQ-00000000lAz-3T2A;
	Fri, 07 Aug 2026 09:25:32 +0200
Date: Fri, 7 Aug 2026 09:25:32 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: olivia@selenic.com, herbert@gondor.apana.org.au, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-crypto@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dakr@kernel.org, o-takashi@sakamocchi.jp, bhelgaas@google.com
Subject: Re: [PATCH v1] hwrng: imx-rngc: Disable clock on registration failure
Message-ID: <anWIbJ_YNM8C-tu3@akranes.kaiser.cx>
References: <20260802222259.577200-1-dbgh9129@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802222259.577200-1-dbgh9129@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_002556_508767_5A520A07 
X-CRM114-Status: GOOD (  15.01  )
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

Thus wrote Yuho Choi (dbgh9129@gmail.com):

> The RNGC clock is enabled manually before runtime PM is configured. If
> devm_hwrng_register() fails, probe returns without disabling the clock.
> The devm_pm_runtime_enable() cleanup only disables runtime PM and does not
> call imx_rngc_suspend().

> Disable the clock before returning from this failure path.

> Fixes: 7a96a64e8689 ("hwrng: imx-rngc - add runtime pm")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/char/hw_random/imx-rngc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 28c56c2d1bf6..a2db26d7f790 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -313,8 +313,10 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
>  	devm_pm_runtime_enable(&pdev->dev);

>  	ret = devm_hwrng_register(&pdev->dev, &rngc->rng);
> -	if (ret)
> +	if (ret) {
> +		clk_disable_unprepare(rngc->clk);
>  		return dev_err_probe(&pdev->dev, ret, "hwrng registration failed\n");
> +	}

>  	dev_info(&pdev->dev,
>  		"Freescale RNG%c registered (HW revision %d.%02d)\n",
> -- 
> 2.43.0

Good catch, thanks.

Reviewed-by: Martin Kaiser <martin@kaiser.cx>

