Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BD6EFD211
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpSeg8glKzmZaVeZSD2YwIWjpFPN48MJ6CdaOD6yfJ8=; b=XaX9Hname5Bj2x2pDs5Dv9xyIT
	vNmAQng7pdmgfzDpQK+62xXSbh5ro7WxGZLpXbAgCynWBTdgcYP3BZ8KeQL8jrU9aeCfSQwMXejTU
	Sp/bmeRxLZD703r+vGl9SsmnZdA60IhUUELjwYoRRRHL+Pi+WaM6E6voe0jTRi2+yoMf7XGwIDeul
	jh86RJnDVjuGIUQmw2Zn9HGGb/OArHJtYq0orcJZbTdOdKBSaXfTH7Jj1MacmiBHDyXe+eSsNlon5
	lpBo6GTdvweWhA7dcTNX+BgPoB+0p5QRxSFWPlwjK8/cwceIgCsXNHsexaAGn18IaU3Rp+sUeVfiB
	PE09GksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB8u-00000003gCX-1Ev4;
	Wed, 25 Feb 2026 09:25:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB8s-00000003gA9-0S8J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15D2F40E0B;
	Wed, 25 Feb 2026 09:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C5DC19422;
	Wed, 25 Feb 2026 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772011512;
	bh=NVl0XIW72KAhGvaPeyo/7NTd/1b/tlHpMZEcCiTlegM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MlFU4BBWC1HPasx276GWqfaq/QOBboToGp0pvjjvuj1GJAEAIP1IVxHdQ229N1nJ1
	 cH5zb92QVL+SPBmBIzFGM17hk4NsxeQg+eQvsCCb01wQ7FZ0mNNmZu9pT5aRUWaJqT
	 7beomQPmrFZFEHjyuOGfgbeKw2a9KjIorAW2fSboKnnUwoWy1c7JacDG4JYhV80+1w
	 U07ANgmSqXtfa0TkFaPk3mq4GYWLh4DeBO18ffsWZsqR4xlFTV47rAtd/1kxZIQQGT
	 hMfuqOW4kbN1o4c/c5499KlPCxm//TtzFnfmgIZdm/1TvJBxwgG9hsb/hpQJyMe45g
	 shnTEi0SQ4oTQ==
From: Simon Horman <horms@kernel.org>
To: jan.petrous@oss.nxp.com
Cc: Simon Horman <horms@kernel.org>,
	alexandre.torgue@foss.st.com,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	chester62515@gmail.com,
	s.hauer@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	davem@davemloft.net,
	mbrugger@suse.com,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	s32@nxp.com,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	robh@kernel.org,
	kuba@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	ghennadi.procopciuc@oss.nxp.com,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	edumazet@google.com,
	mcoquelin.stm32@gmail.com,
	imx@lists.linux.dev
Subject: Re: [v5,1/4] net: stmmac: platform: read channels irq
Date: Wed, 25 Feb 2026 09:24:56 +0000
Message-ID: <20260225092456.174241-1-horms@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223-dwmac_multi_irq-v5-1-8fc699a5fac4@oss.nxp.com>
References: <20260223-dwmac_multi_irq-v5-1-8fc699a5fac4@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_012514_185452_9415AE0C 
X-CRM114-Status: GOOD (  17.66  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: platform: read channels irq

This commit adds support for reading IRQ resources for all rx/tx channels
in the stmmac platform driver to enable Multi-IRQ mode for platform glue
drivers.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 5c9fd91a1db9..6166a9b0c0bb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -700,6 +700,9 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {
> +	char name[16];
> +	int i;
> +
>  	memset(stmmac_res, 0, sizeof(*stmmac_res));
>
>  	/* Get IRQ information early to have an ability to ask for deferred
> @@ -735,7 +738,42 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>
>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>
> -	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> +	if (IS_ERR(stmmac_res->addr))
> +		return PTR_ERR(stmmac_res->addr);
> +
> +	/* RX channels irq */
> +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> +		scnprintf(name, sizeof(name), "rx-queue-%d", i);
> +		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev,
> +									 name);
> +		if (stmmac_res->rx_irq[i] <= 0) {
> +			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			dev_dbg(&pdev->dev, "IRQ rx-queue-%d not found\n", i);
> +
> +			/* Stop on first unset rx-queue-%i property member */
> +			stmmac_res->rx_irq[i] = 0;
> +			break;
> +		}
> +	}
> +
> +	/* TX channels irq */
> +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
> +		scnprintf(name, sizeof(name), "tx-queue-%d", i);
> +		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev,
> +									 name);
> +		if (stmmac_res->tx_irq[i] <= 0) {
> +			if (stmmac_res->tx_irq[i] == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			dev_dbg(&pdev->dev, "IRQ tx-queue-%d not found\n", i);
> +
> +			/* Stop on first unset tx-queue-%i property member */
> +			stmmac_res->tx_irq[i] = 0;
> +			break;
> +		}
> +	}

This isn't a bug, but the RX and TX channel IRQ handling blocks follow an
identical 14-line pattern that differs only in the queue name format string
and target array. Both blocks format the IRQ name with scnprintf(), call
platform_get_irq_byname_optional(), check for -EPROBE_DEFER, log a debug
message on error, and break on the first missing IRQ.

Could this duplication be reduced with a helper function? Note that the
existing code in this function already contains similar non-factored
patterns for wol_irq and sfty_irq handling, so this level of duplication
may be acceptable in this file's style.

> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);

