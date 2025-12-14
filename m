Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322D3D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 22:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6fXs+IIbDChxuFtTKIP2sLb6jR6q7HS1FdEpkJpi6g=; b=0dSTOPioYRc8lVbmoF2AiHxQux
	WJJ2NnBXs41jGOU68ZBgdtnFopi0uX2wPShjuQ+CjvfK3BMaXBl7uzPKcRP+yor5c9mQsK3VzkTRu
	0b8+BUbScRVic7k2dVxzopav6kJVKzT3Ec6tJeSs95SFESY2TETAtlTtjwnvTpKZLkBCnZVuPB3xJ
	DKBvcxe6HUuZ3fQM6Kga7LxEsLp9nMrX9agk3z7QUnUShgOTRBiQYehu6SDWsCThQdDqMBRHd/YW3
	HcAU+Ygjm0jis3oKeB58Q0PUQp+uVc7Lw9ZOcEma2Ht192y+qIBFP0k2zewnej49zf5mf/bfXveaE
	gTogXsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUucT-00000002nGI-3SkG;
	Sun, 14 Dec 2025 22:31:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUucH-00000002nFe-3O3e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 22:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=z6fXs+IIbDChxuFtTKIP2sLb6jR6q7HS1FdEpkJpi6g=; b=2rEh/LIVp8lLB0Cmg0619HT3ME
	YLLfXMm8HuA25MtApqKFp1X85UfJ7fAykF9Eyig4AJuNW1FgFBmoV9/q7aiok7X3EQ1bVhljtMylJ
	ujYx/7ZUEo/Hz6Dzeq42dceYvih8RtSxHWeGZrY4yWA4IhDxUHx3yvbRglCvtmXq0r24=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vUubz-00GwZz-Sv; Sun, 14 Dec 2025 23:30:43 +0100
Date: Sun, 14 Dec 2025 23:30:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] net: stmmac: platform: read channels irq
Message-ID: <b9c8580f-e615-4eaa-8878-2fb8d888c0aa@lunn.ch>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
 <20251214-dwmac_multi_irq-v1-1-36562ab0e9f7@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214-dwmac_multi_irq-v1-1-36562ab0e9f7@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_143102_939332_EA7BE1D1 
X-CRM114-Status: GOOD (  16.99  )
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

On Sun, Dec 14, 2025 at 11:15:37PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Read IRQ resources for all channels, to allow multi IRQ mode
> for platform glue drivers.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 38 +++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 8979a50b5507..29e40253bdfe 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -700,6 +700,9 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {
> +	int i;
> +	char name[8];

Reverse Christmas tree please.

>  	memset(stmmac_res, 0, sizeof(*stmmac_res));
>  
>  	/* Get IRQ information early to have an ability to ask for deferred
> @@ -743,7 +746,40 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  
>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>  
> -	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> +	if (IS_ERR(stmmac_res->addr))
> +		return PTR_ERR(stmmac_res->addr);
> +
> +	/* RX channels irq */
> +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> +		scnprintf(name, 8, "rx-queue-%d", i);

It would be better to use sizeof(name), not 8.

Also, 'rx-queue-' is 9 characters. So i don't see how this can
actually work?

	Andrew

