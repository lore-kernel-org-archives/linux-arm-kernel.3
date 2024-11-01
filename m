Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC50E6F084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 19:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s02rnGCgt8BZE1LzUirUmIPB0IIV3qCHslNmqFKhCZg=; b=hq9A/EieEkvN+wzIOLbnKxcLja
	Gbuzjpb5eqzpWKuhFk/XtpDXt2Zn6HxDFAxEePTebnqOQXnLrQeKTOJqetQrx64l+NplUbQKzupoi
	10KyFdtogS1Ya/gcRlYToTTd/V0VYWW5M9g9xd7EpqTUtn61bgYqH23rffdqPbXHOY6VnEQDHHa5K
	0QGaYIRX0IpeE5ME3b0AhYYb49/4grEADcIB/dOQVxwgbR2xG0RLsddzJ6g5u5luGGVRfct6DzfXn
	i2hpeoXY6Jdt5t1wHG9kJeZV2utFk/TR75rBsukX2n79jEToTNBA4t5/sU84QMeSNJrUYFWtoqEi9
	XKbFESzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xTz-000000089ni-34YB;
	Fri, 01 Nov 2024 19:38:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xQh-000000089At-39CW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 19:35:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DB94A44C27;
	Fri,  1 Nov 2024 19:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F887C4CECE;
	Fri,  1 Nov 2024 19:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730489730;
	bh=LBcJYTB6WIbJ8DlAwG7hImL3BwFHDAgo02896nLj1Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLbv6Uxxo8SQJm21791wg19EUL58H9utdxxI+OA95m+CsTNwB6++xU/9/m0/hprGj
	 FtqxO722j/ulpty5c1g+TzF8YdjdDro98e1zAlPeEFWLLAoCn6+7UtlhGuTleLfpso
	 eNscequJtH3HGY/7k19sz42uhTZQvG1XdBRIiJQkwDctN219TGQ688tmK/8/jJDeB6
	 xnNdv9hOxEvaQG6/wx9hM3wkaPEmADMC08UUYZweW3oo+foHodWykfrMiOYhGHEePi
	 AtOY5QHqt93iRsKHseckQw7hxrXvT4v+rFXiusKwK4RQ3t7F4tl9ow6gg6MF6Cun/f
	 Ly6v514duNndA==
Date: Fri, 1 Nov 2024 14:35:28 -0500
From: Rob Herring <robh@kernel.org>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: krzk+dt@kernel.org, a.fatoum@pengutronix.de, conor+dt@kernel.org,
	dinguyen@kernel.org, marex@denx.de, s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/23] net: stmmac: add support for dwmac 3.72a
Message-ID: <20241101193528.GA4067749-robh@kernel.org>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
 <20241029202349.69442-12-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029202349.69442-12-l.rubusch@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_123531_944552_6EAD3D88 
X-CRM114-Status: GOOD (  18.96  )
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

On Tue, Oct 29, 2024 at 08:23:37PM +0000, Lothar Rubusch wrote:
> The dwmac 3.72a is an ip version that can be found on Intel/Altera Arria10
> SoCs. Going by the hardware features "snps,multicast-filter-bins" and
> "snps,perfect-filter-entries" shall be supported. Thus add a
> compatibility flag, and extend coverage of the driver for the 3.72a.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c   | 1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> index 598eff926..b9218c07e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> @@ -56,6 +56,7 @@ static const struct of_device_id dwmac_generic_match[] = {
>  	{ .compatible = "snps,dwmac-3.610"},
>  	{ .compatible = "snps,dwmac-3.70a"},
>  	{ .compatible = "snps,dwmac-3.710"},
> +	{ .compatible = "snps,dwmac-3.72a"},
>  	{ .compatible = "snps,dwmac-4.00"},
>  	{ .compatible = "snps,dwmac-4.10a"},
>  	{ .compatible = "snps,dwmac"},
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 54797edc9..e7e2d6c20 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -522,6 +522,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	if (of_device_is_compatible(np, "st,spear600-gmac") ||
>  		of_device_is_compatible(np, "snps,dwmac-3.50a") ||
>  		of_device_is_compatible(np, "snps,dwmac-3.70a") ||
> +		of_device_is_compatible(np, "snps,dwmac-3.72a") ||

All these of_device_is_compatible() checks should really go away and all 
the settings just come from match table data. Then everything is const 
and we're not matching multiple times at run-time. That would be a bit 
of refactoring though...

>  		of_device_is_compatible(np, "snps,dwmac")) {
>  		/* Note that the max-frame-size parameter as defined in the
>  		 * ePAPR v1.1 spec is defined as max-frame-size, it's
> -- 
> 2.25.1
> 

