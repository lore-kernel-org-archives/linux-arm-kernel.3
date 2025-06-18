Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694BCC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2q8L8axiC3Fhe06ICMgZ+kODXZoRBUOZVTzsow2QF8o=; b=GKn1ZxdaSDO2Y+NvvqD486ucUs
	zrWk4Pa7iOns2iFr3SxXfK/euDUAmKqtJmzmlqk2nhpW1MyoFlreXMGLj1Sy1ieOq+HUYWS08MRg+
	PkbMSWVTGk0Rc/vJuUKR0f/7nSWiAG1uigQlMbi6ZwUfPCzTbbQJX9PbCsMVjqXW112T0Tu+c7XR5
	H+dO1hhPeh0PFvfcrdmmLgF/1sCGSRtQ2dTd0B6Ba23X4/72WKXJD5STPcgr40CXMdDlxzbYs/5ld
	NJG/vAlxvYTWLWbKwNjGlFovK/lBUiz6wZLcmIc9A6HKg/cBhyXDdQNDE12idq9m6+svgEXc+bghK
	0MyLoc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuIU-0000000AWRP-3bEa;
	Wed, 18 Jun 2025 15:01:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRs4B-0000000A9yS-1O7f;
	Wed, 18 Jun 2025 12:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 079AD5C4962;
	Wed, 18 Jun 2025 12:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07100C4CEE7;
	Wed, 18 Jun 2025 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750250338;
	bh=kfP7CXAylEvUUUVxZ1zBTw/StB04PQhWmvq9ai1p+tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKn06Ka/W8jBpvkt7jkRk+Jr2p63w6jL935h2WwftxJNrU0NXMtDF/ON1m0u3kTDm
	 NhEmSEtl6uAjse7HPW17x+ihOxk4+bqFjmLGNDZm+xSHciTBRZnEYjv/YnJIKrQRQH
	 3wv2E7cxlRjVZ0brU1J2sl96zpDJ7ygcSYrVv41Gs8MUF8CsT2tzMJ/V+COvxXGnOy
	 32U1JzoWrbWFxC2hwtexOtcgFpeouI62XGgI2+geYfpMVl3yp63wQvSM8LzA+x+CFz
	 QWRlhTe1Fvarf7jk+JBT3fK92XCMa/gYlNVz7TAzTOuv/IArHEJ97egPGDp+0u4Mfj
	 1T63PTmBm3s0g==
Date: Wed, 18 Jun 2025 13:38:53 +0100
From: Simon Horman <horms@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux@fw-web.de, nbd@nbd.name, sean.wang@mediatek.com,
	lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org,
	arinc.unal@arinc9.com
Subject: Re: Re: [net-next v4 3/3] net: ethernet: mtk_eth_soc: change code to
 skip first IRQ completely
Message-ID: <20250618123853.GO1699@horms.kernel.org>
References: <20250616080738.117993-1-linux@fw-web.de>
 <20250616080738.117993-4-linux@fw-web.de>
 <20250618083556.GE2545@horms.kernel.org>
 <trinity-98989ec6-5b15-49ab-b7e0-60e5e23dd82b-1750238087001@trinity-msg-rest-gmx-gmx-live-847b5f5c86-t48nw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-98989ec6-5b15-49ab-b7e0-60e5e23dd82b-1750238087001@trinity-msg-rest-gmx-gmx-live-847b5f5c86-t48nw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_053859_455648_E268F8F7 
X-CRM114-Status: GOOD (  41.64  )
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

On Wed, Jun 18, 2025 at 09:14:47AM +0000, Frank Wunderlich wrote:
> Hi Simon,
> 
> thanks for your review
> 
> > Gesendet: Mittwoch, 18. Juni 2025 um 10:35
> > Von: "Simon Horman" <horms@kernel.org>
> > Betreff: Re: [net-next v4 3/3] net: ethernet: mtk_eth_soc: change code to skip first IRQ completely
> >
> > On Mon, Jun 16, 2025 at 10:07:36AM +0200, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > > 
> > > On SoCs without MTK_SHARED_INT capability (mt7621 + mt7628) the first
> > > IRQ (eth->irq[0]) was read but never used. Do not read it and reduce
> > > the IRQ-count to 2 because of skipped index 0.
> > 
> > Describing the first IRQ as read seems a bit confusing to me - do we read
> > it? And saying get or got seems hard to parse. So perhaps something like
> > this would be clearer?
> > 
> > ... platform_get_irq() is called for the first IRQ (eth->irq[0]) but
> > it is never used.
> 
> ok, i change it in next version
> 
> > > 
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > ---
> > > v4:
> > > - drop >2 condition as max is already 2 and drop the else continue
> > > - update comment to explain which IRQs are taken in legacy way
> > > ---
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 20 ++++++++++++++++----
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++--
> > >  2 files changed, 18 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > index 3ecb399dcf81..f3fcbb00822c 100644
> > > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > @@ -3341,16 +3341,28 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
> > >  {
> > >  	int i;
> > >  
> > > +	/* future SoCs beginning with MT7988 should use named IRQs in dts */
> > 
> > Perhaps this comment belongs in the patch that adds support for named IRQs.
> 
> also thought that after sending it :)
> 
> > >  	eth->irq[MTK_ETH_IRQ_TX] = platform_get_irq_byname(pdev, "tx");
> > >  	eth->irq[MTK_ETH_IRQ_RX] = platform_get_irq_byname(pdev, "rx");
> > >  	if (eth->irq[MTK_ETH_IRQ_TX] >= 0 && eth->irq[MTK_ETH_IRQ_RX] >= 0)
> > >  		return 0;
> > >  
> > > +	/* legacy way:
> > > +	 * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken from
> > > +	 * devicetree and used for rx+tx.
> > > +	 * On SoCs with non-shared IRQ the first was not used, second entry is
> > > +	 * TX and third is RX.
> > 
> > Maybe I am slow. But I had a bit of trouble parsing this.
> > Perhaps this is clearer?
> > 
> >         * devicetree and used for both RX and TX - it is shared.
> > 	* On SoCs with non-shared IRQs the first entry is not used,
> >         * the second is for TX, and the third is for RX.
> 
> I would also move this comment in first patch with your changes requested.

Yes, good point.

> 
> /* legacy way:
>  * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken from
>  * devicetree and used for both RX and TX - it is shared.
>  * On SoCs with non-shared IRQs the first entry is not used,
>  * the second is for TX, and the third is for RX.
>  */
> 
> i can keep your RB there?

Yes, thanks for asking.

> 
> > > +	 */
> > > +
> > >  	for (i = 0; i < MTK_ETH_IRQ_MAX; i++) {
> > > -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> > > -			eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
> > > -		else
> > > -			eth->irq[i] = platform_get_irq(pdev, i);
> > > +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
> > > +			if (i == 0)
> > > +				eth->irq[MTK_ETH_IRQ_SHARED] = platform_get_irq(pdev, i);
> > > +			else
> > > +				eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
> > > +		} else {
> > > +			eth->irq[i] = platform_get_irq(pdev, i + 1);
> > > +		}
> > >  
> > >  		if (eth->irq[i] < 0) {
> > >  			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> 
> code changes are OK?

Yes. I did try to think of a more succinct way to express the logic.
But I think what you have is good.

In any case, let me review the next revision of this patch.
That will be easier for me than imagining what it looks like
with the non-code changes discussed above in place.


