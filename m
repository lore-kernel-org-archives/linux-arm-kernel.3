Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA2DEA4FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHMb4OWES0prZ8IOwNxJ4yrGQlTeCsRWKUBV6vWbNl8=; b=tazAgL9V7UmaRIu0IYdBiO3VB/
	HRFDnWzcKfdtsPMUFHPnwDTobWDOEb4GZgNzJREmPBqZlERc1y7yyu079J3py7oAx0QXEPAJ8hqTU
	F9GiJkjAHLWjukufbHiI2d2Fj21ln/Z3/5QixVLR1yop41waSZcFF2fwVrTKkVgRTbBw0QjcKVszh
	uNkuvdY56P01u0TdS1kLFOEeNQRlZP5CIslGIc7obDR80jlUy9BwFiJrjY8/g18OTYelY5GRdwqi+
	HfJww8w2rR1BpGZpPK5EmPs3ALzOxcKouSGPDs/oOAX8upKDI0/Qm1+YcvzVqzJxM9lLM02f2dgj/
	7gF3ajbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW3S-00000000N1b-3TmY;
	Mon, 23 Feb 2026 13:32:54 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuW3P-00000000N16-2Y4V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:32:53 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C9EDD2015FB;
	Mon, 23 Feb 2026 14:32:47 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AF756201FB9;
	Mon, 23 Feb 2026 14:32:47 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0B4F7202AE;
	Mon, 23 Feb 2026 14:32:47 +0100 (CET)
Date: Mon, 23 Feb 2026 14:32:47 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: edumazet@google.com, shawnguo@kernel.org, kernel@pengutronix.de,
	krzk+dt@kernel.org, robh@kernel.org, andrew+netdev@lunn.ch,
	mbrugger@suse.com, davem@davemloft.net, pabeni@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com, s.hauer@pengutronix.de,
	conor+dt@kernel.org, chester62515@gmail.com, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, ghennadi.procopciuc@oss.nxp.com,
	devicetree@vger.kernel.org, alexandre.torgue@foss.st.com
Subject: Re: [v4,1/4] net: stmmac: platform: read channels irq
Message-ID: <aZxW/5dBz3XPTxhB@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260128-dwmac_multi_irq-v4-1-82fa34fcf2f2@oss.nxp.com>
 <20260129050959.375635-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129050959.375635-1-kuba@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_053251_923500_06FCBFF6 
X-CRM114-Status: GOOD (  19.38  )
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

On Wed, Jan 28, 2026 at 09:09:59PM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: platform: read channels irq
> 
> This patch reads IRQ resources for all rx/tx channels to allow Multi-IRQ
> mode for platform glue drivers.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 8979a50b5507..94854bfb6e0d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> 
> [ ... ]
> 
> > +	/* RX channels irq */
> > +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> > +		scnprintf(name, sizeof(name), "rx-queue-%d", i);
> > +		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev,
> > +									 name);
> > +		if (stmmac_res->rx_irq[i] <= 0) {
> > +			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
> > +				return -EPROBE_DEFER;
> > +			dev_dbg(&pdev->dev, "IRQ rx-queue-%d not found\n", i);
> > +
> > +			/* Stop on first unset rx-queue-%i property member */
> > +			break;
> > +		}
> > +	}
> 
> When platform_get_irq_byname_optional() returns a negative error like
> -ENXIO, that value is stored in stmmac_res->rx_irq[i] before the break.
> 
> In stmmac_request_irq_multi_msi(), the check is:
> 
>     if (priv->rx_irq[i] == 0)
>         continue;
>     ret = request_irq(priv->rx_irq[i], ...);
> 
> Should the negative value be cleared before the break? Otherwise if
> rx_queues_to_use exceeds the number of defined IRQs, the negative error
> code could be passed to request_irq().
> 
> > +
> > +	/* TX channels irq */
> > +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
> > +		scnprintf(name, sizeof(name), "tx-queue-%d", i);
> > +		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev,
> > +									 name);
> > +		if (stmmac_res->tx_irq[i] <= 0) {
> > +			if (stmmac_res->tx_irq[i] == -EPROBE_DEFER)
> > +				return -EPROBE_DEFER;
> > +			dev_dbg(&pdev->dev, "IRQ tx-queue-%d not found\n", i);
> > +
> > +			/* Stop on first unset tx-queue-%i property member */
> > +			break;
> > +		}
> > +	}
> 
> Same question here for tx_irq[i].
> -- 
> pw-bot: cr

Bot is right. I will address it in v5.

Thanks.
/Jan

