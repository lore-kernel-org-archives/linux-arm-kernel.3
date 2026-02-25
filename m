Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19930EFD239
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38K4Obu3dyZvtMCqpE/ceP/5IVodcIyze6jjAf4GDug=; b=WB9vlZMJKae46pfLpdON2OFoI3
	th7sfIrIGdAeMgVvWcAJkU0vQKeGYzAz55OWNpYbrBCmIO2p/dpl7C92T/JFrjle0yfHjjhDOEYSo
	Lw4Gw/mxIu624RKWNX8+N2yNlxo6j/Oo062wQARQBKM9nf//mhjW9i7ZNsZ2pFv3tL98bX/9p2gJl
	p3IWquX7zp0aWCw+aOjiUsimmHnds7Q7Qo71o4HB0DSKkHeNdbfFGZAcQGv0vAEV4B+1LNOy5bCCB
	FIpeqBBoWYM3NILsBz14tvFP4uDm/NzVgwRwcUNi3CZRM05Ya058SSDBIvESReFMUtfQwqSnkKAGv
	m20uvzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBhp-00000003jWB-0hvZ;
	Wed, 25 Feb 2026 10:01:21 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBhm-00000003jVc-0PGp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:01:19 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 28B381A30BB;
	Wed, 25 Feb 2026 11:01:13 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F001C1A2F90;
	Wed, 25 Feb 2026 11:01:12 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id ADB012037D;
	Wed, 25 Feb 2026 11:01:12 +0100 (CET)
Date: Wed, 25 Feb 2026 11:01:12 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Simon Horman <horms@kernel.org>
Cc: alexandre.torgue@foss.st.com, devicetree@vger.kernel.org,
	festevam@gmail.com, chester62515@gmail.com, s.hauer@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, davem@davemloft.net,
	mbrugger@suse.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	s32@nxp.com, pabeni@redhat.com, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	robh@kernel.org, kuba@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	ghennadi.procopciuc@oss.nxp.com, kernel@pengutronix.de,
	shawnguo@kernel.org, edumazet@google.com, mcoquelin.stm32@gmail.com,
	imx@lists.linux.dev
Subject: Re: [v5,1/4] net: stmmac: platform: read channels irq
Message-ID: <aZ7IaP0pFRLYR/iA@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260223-dwmac_multi_irq-v5-1-8fc699a5fac4@oss.nxp.com>
 <20260225092456.174241-1-horms@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225092456.174241-1-horms@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_020118_432840_FCA307A4 
X-CRM114-Status: GOOD (  24.48  )
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

On Wed, Feb 25, 2026 at 09:24:56AM +0000, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: platform: read channels irq
> 
> This commit adds support for reading IRQ resources for all rx/tx channels
> in the stmmac platform driver to enable Multi-IRQ mode for platform glue
> drivers.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 5c9fd91a1db9..6166a9b0c0bb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -700,6 +700,9 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
> >  int stmmac_get_platform_resources(struct platform_device *pdev,
> >  				  struct stmmac_resources *stmmac_res)
> >  {
> > +	char name[16];
> > +	int i;
> > +
> >  	memset(stmmac_res, 0, sizeof(*stmmac_res));
> >
> >  	/* Get IRQ information early to have an ability to ask for deferred
> > @@ -735,7 +738,42 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
> >
> >  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
> >
> > -	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> > +	if (IS_ERR(stmmac_res->addr))
> > +		return PTR_ERR(stmmac_res->addr);
> > +
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
> > +			stmmac_res->rx_irq[i] = 0;
> > +			break;
> > +		}
> > +	}
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
> > +			stmmac_res->tx_irq[i] = 0;
> > +			break;
> > +		}
> > +	}
> 
> This isn't a bug, but the RX and TX channel IRQ handling blocks follow an
> identical 14-line pattern that differs only in the queue name format string
> and target array. Both blocks format the IRQ name with scnprintf(), call
> platform_get_irq_byname_optional(), check for -EPROBE_DEFER, log a debug
> message on error, and break on the first missing IRQ.
> 
> Could this duplication be reduced with a helper function? Note that the
> existing code in this function already contains similar non-factored
> patterns for wol_irq and sfty_irq handling, so this level of duplication
> may be acceptable in this file's style.
> 

Hi Simon,
I already addressed this in v6, I sent today.

/Jan

