Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B35E9E300
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYJwiOz1Wvg5Y1ut+DgbOg5wrNyGTY2Oa+uI9rWODvA=; b=W3CxgulZmQOHuRdIUZOY5sIKU9
	CWDDYlEhIALhTnNA9U31+rtilNjnt/mSVXtb7Iez6jLPnzeuXHYvsw5bvrWFt6LA5tY7M8ha69kFd
	VwhFGOoUxDEXy9ScNBABhgPK1rLkFIK/n7/wI5hkZqAaubuyn5VGhgKbkkRaCoOIukcbhRLD8b8e4
	+1tBYmu2qIf3xcadfFp6r7RjWq7m6UfskaDHR4Ycx/UpH7+yaQbYiCsqltu7z+3hzkEDNVQTtk6GN
	kpPkjMsKix3Kffj/7H2HABQJmJfRL61g/tImlvo2YQyr5W29bcwhJB3WXvKqyUIJRpIz47SciSWiv
	IPqtOkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9TI-00000000dTT-1bzu;
	Wed, 11 Feb 2026 12:37:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9TG-00000000dSs-0GEX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 12:37:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDFD2339
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 04:37:19 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECF573F632
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 04:37:25 -0800 (PST)
Date: Wed, 11 Feb 2026 12:35:19 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linusw@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	sudeep.holla@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
	arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: vexpress-osc: Check return value of
 devm_of_clk_add_hw_provider() in vexpress_osc_probe()
Message-ID: <aYx3hyPHD5GbClYD@e142607>
References: <20260204063332.1791986-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204063332.1791986-1-nichen@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_043730_144820_774D3B8D 
X-CRM114-Status: GOOD (  18.37  )
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

On Wed, Feb 04, 2026 at 02:33:32PM +0800, Chen Ni wrote:
> Return the value of devm_of_clk_add_hw_provider() in order to propagate
> the error properly, if it fails due to resource allocation failure or
> device tree clock provider registration failure.
> 
> This ensures that the probe function fails safely rather than proceeding
> with a potentially incomplete clock provider setup.
> 
> Fixes: 03cc105f2edf ("clk: vexpress-osc: Use the devres clock API variants")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/clk/versatile/clk-vexpress-osc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
> index 9adbf5c33bd1..2292fee4e423 100644
> --- a/drivers/clk/versatile/clk-vexpress-osc.c
> +++ b/drivers/clk/versatile/clk-vexpress-osc.c
> @@ -97,7 +97,10 @@ static int vexpress_osc_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, &osc->hw);
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, &osc->hw);
> +	if (ret)
> +		return ret;
> +
>  	clk_hw_set_rate_range(&osc->hw, osc->rate_min, osc->rate_max);
>  
>  	dev_dbg(&pdev->dev, "Registered clock '%s'\n", init.name);
> -- 
> 2.25.1
> 

