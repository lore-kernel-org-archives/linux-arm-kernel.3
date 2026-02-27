Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E16AFEFB47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 12:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uW55zJut7Wk9JXLnOtH+fZmjptTX3X9e9ynRLgD8L0Y=; b=poaeE9ldZoG3hZHIF3g0tgxAWN
	YEML7Xh/O8baeZuxobZnTgBobfMwQoR31DGGA6rRcoq8rkpXQLNdT2G5Gpb6d3Lnr8leHn5EeD84s
	j194b/vQeViYbJJ7nPh5SZx6e+BmaIK8KjPBdL0eHUfvmVfb59LRuBiWYVvzuh0rYrSNphHc45ktw
	GykUzMK0a1/7uJCbBTIfED5j2cAVD0FS/DluxfeesEPyQBADrdAzL4wZnYxNtePHCC5BI1xzINoP3
	b09zVUhHldvj02Asf3Pi8Pv86NLkC4L0uLbNb9kcGP6vEsA43hH2cAISBJflKUthzwop3vjS0Lnzp
	z8Tb5Tcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvwwg-00000008KYe-0kSK;
	Fri, 27 Feb 2026 12:27:50 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvwwd-00000008KY9-21Kv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 12:27:48 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CA8E71A1AB3;
	Fri, 27 Feb 2026 13:27:43 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B31701A1A98;
	Fri, 27 Feb 2026 13:27:43 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9B59B20321;
	Fri, 27 Feb 2026 13:27:42 +0100 (CET)
Date: Fri, 27 Feb 2026 13:27:43 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	vladimir.oltean@nxp.com, boon.khai.ng@altera.com
Subject: Re: [PATCH v7 2/5] net: stmmac: platform: read channels irq
Message-ID: <aaGNvz/n6b4klf1K@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260226-dwmac_multi_irq-v7-0-f8fe3b945bb4@oss.nxp.com>
 <20260226-dwmac_multi_irq-v7-2-f8fe3b945bb4@oss.nxp.com>
 <aaCankErMJZ2XM_s@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaCankErMJZ2XM_s@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_042747_805361_6CFE5685 
X-CRM114-Status: GOOD (  29.16  )
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

On Thu, Feb 26, 2026 at 07:10:22PM +0000, Russell King (Oracle) wrote:
> On Thu, Feb 26, 2026 at 09:54:07AM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > Read IRQ resources for all rx/tx channels, to allow Multi-IRQ mode
> > for platform glue drivers.
> > 
> > Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 46 +++++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 5c9fd91a1db9..93bd915ab6eb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -697,9 +697,40 @@ struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
> >  }
> >  EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
> >  
> > +static int stmmac_pltfr_get_queue_irqs(struct platform_device *pdev,
> > +				       struct stmmac_resources *stmmac_res,
> > +				       bool tx)
> > +{
> > +	int *irqs = tx ? &stmmac_res->tx_irq[0] : &stmmac_res->rx_irq[0];
> > +	char name[16];
> > +	int i;
> > +
> > +	/* RX channels irq */
> > +	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_RX_QUEUES) {
> 
> You've missed that there are two separate definitions for tx and rx
> queues - while they are currently the same number, code shouldn't
> make that assumption.

Oh, yes. My fault. Next time I shall review my code better.

> 
> > +		scnprintf(name, sizeof(name), "%cx-queue-%d",
> > +			  tx ? 't' : 'r', i);
> 
> I'm not happy with this method of combining the two loops.
> 
> Maybe instead:
> 
> static int stmmac_pltfr_get_irq_array(struct platform_device *pdev,
> 				      const char *fmt, int *irqs,
> 				      size_t num)
> {
> 	char name[16];
> 	size_t i;
> 
> 	for (i = 0; i < num; i++) {
> 		if (snprintf(name, sizeof(name), fmt, i) >= sizeof(name))
> 			return -EINVAL;
> 
> 		irqs[i] = platform_get_irq_byname_optional(pdev, name);
> 		if (irqs[i] == -EPROBE_DEFER) {
> 			return irqs[i];
> 		} else if (irqs[i] <= 0) {
> 			dev_dbg(&pdev->dev, "IRQ %s not found\n", name);
> 
> 			irqs[i] = 0;
> 			break;
> 		}
> 	}
> 
> 	return 0;
> }
> 
> which has the advantage that it becomes a generic helper for getting an
> any array of IRQs.
> 
> >  int stmmac_get_platform_resources(struct platform_device *pdev,
> >  				  struct stmmac_resources *stmmac_res)
> >  {
> > +	int ret;
> > +
> >  	memset(stmmac_res, 0, sizeof(*stmmac_res));
> >  
> >  	/* Get IRQ information early to have an ability to ask for deferred
> > @@ -735,7 +766,20 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
> >  
> >  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
> >  
> > -	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> > +	if (IS_ERR(stmmac_res->addr))
> > +		return PTR_ERR(stmmac_res->addr);
> > +
> > +	/* TX channels irq */
> > +	ret = stmmac_pltfr_get_queue_irqs(pdev, stmmac_res, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* RX channels irq */
> > +	ret = stmmac_pltfr_get_queue_irqs(pdev, stmmac_res, false);
> > +	if (ret)
> > +		return ret;
> 
> These then become:
> 
> 	ret = stmmac_pltfr_get_irq_array(pdev, "tx-queue-%d", 
> 					 stmmac_res->tx_irq,
> 					 MTL_MAX_TX_QUEUES);
> 	if (ret)
> 		return ret;
> 
> 	ret = stmmac_pltfr_get_irq_array(pdev, "rx-queue-%d", 
> 					 stmmac_res->rx_irq,
> 					 MTL_MAX_RX_QUEUES);
> 	if (ret)
> 		return ret;
> 
> This has the advantage that one can grep for rx-queue to find it,
> and we also use the correct limit for each queue type.
> 

Agree, your code looks better. Applied in v8 :) Thanks.

BTW, I would prefer to use sizeof() instead of constant for array size,
but this is the style used in stmmac, so I reuse the same approach.

BR.
/Jan


