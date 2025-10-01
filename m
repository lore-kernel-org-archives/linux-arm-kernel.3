Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21036CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxzG4NDNtvyZtWrcwERf/N9ajidnNL4jpz7ADaJTFuI=; b=Y87il9Kb6ZPCMKSEkhZl8Oq7Zg
	7LWcKxSMvtf0mkqB1hP3QlPpHwhQvnmOAiQrKugNBu86o5m9/DyGhUPInEHwGjEI70sMAQFntQ5Z9
	4DC+ty5c7lXFOFZTe4f76p4dTFtSGsdNb9nMP4A+0iuXpIvV0iqalhuMi2zm2enfBexV5dM998Whc
	w2ogmWJEOa2xmnf/eQfcrATNvXqS2r98ddMoReXnEeUHa4A0bbvyQDUZ+gpUhYnjwyj/CiMVhCG9s
	Fha/j6ka6419lbD+BNFb45YdZCe2fGJqK0HJbzfd3AdeZt4bYQ6Nw+RvBh4U1mBGwaf1bIW1J9Jrd
	V149jN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uWi-00000007IkD-0uZP;
	Wed, 01 Oct 2025 10:57:40 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uWf-00000007Iji-0uGr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 10:57:38 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 591AvLaP3063484;
	Wed, 1 Oct 2025 05:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759316241;
	bh=JxzG4NDNtvyZtWrcwERf/N9ajidnNL4jpz7ADaJTFuI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Wm9PpVq/HHp38jQfqHex6preKa42kLW+ISLJc7uf/PXrJSm/unAifRXnLT8E6G9xU
	 D1fjvcLqFWcVnSV+4Zd6UKGbjxpmtgYk1rkO0PczEmAIYTOKG5SpsXE60nrTlHRQHU
	 BpeH1YB57SRBvABeRBlHJZVaQiuUU+IOBrnZNoec=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 591AvLgT425510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 1 Oct 2025 05:57:21 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 1
 Oct 2025 05:57:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 05:57:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 591AvLV7463660;
	Wed, 1 Oct 2025 05:57:21 -0500
Date: Wed, 1 Oct 2025 05:57:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Jacob Keller <jacob.e.keller@intel.com>
CC: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Paolo
 Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet
	<edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Simon
 Horman <horms@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
Subject: Re: [PATCH V2 2/3] soc: ti: knav_dma: Make knav_dma_open_channel
 return NULL on error
Message-ID: <20251001105721.wf6mr2ysj34uhkhh@rendition>
References: <20250930121609.158419-1-nm@ti.com>
 <20250930121609.158419-3-nm@ti.com>
 <c8d9f60a-341a-4386-afc6-b7a9451cda9f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c8d9f60a-341a-4386-afc6-b7a9451cda9f@intel.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_035737_348069_9F84C12A 
X-CRM114-Status: GOOD (  23.35  )
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

On 16:59-20250930, Jacob Keller wrote:
> 
> 
> On 9/30/2025 5:16 AM, Nishanth Menon wrote:
> > Make knav_dma_open_channel consistently return NULL on error instead of
> > ERR_PTR. Currently the header include/linux/soc/ti/knav_dma.h returns NUL
> > when the driver is disabled, but the driver implementation returns
> > ERR_PTR(-EINVAL), creating API inconsistency for users.
> > 
> 
> I would word this as indicating that we don't even use ERR_PTR here at all!

Thanks. Yep, will do for the next respin.

> 
> > Standardize the error handling by making the function return NULL on all
> > error conditions.
> > 
> > Suggested-by: Simon Horman <horms@kernel.org>
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> > Changes in V2:
> > * renewed version
> > 
> >  drivers/soc/ti/knav_dma.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
> > index a25ebe6cd503..e69f0946de29 100644
> > --- a/drivers/soc/ti/knav_dma.c
> > +++ b/drivers/soc/ti/knav_dma.c
> > @@ -402,7 +402,7 @@ static int of_channel_match_helper(struct device_node *np, const char *name,
> >   * @name:	slave channel name
> >   * @config:	dma configuration parameters
> >   *
> > - * Returns pointer to appropriate DMA channel on success or error.
> > + * Returns pointer to appropriate DMA channel on success or NULL on error.
> >   */
> >  void *knav_dma_open_channel(struct device *dev, const char *name,
> >  					struct knav_dma_cfg *config)
> > @@ -414,13 +414,13 @@ void *knav_dma_open_channel(struct device *dev, const char *name,
> >  
> >  	if (!kdev) {
> >  		pr_err("keystone-navigator-dma driver not registered\n");
> > -		return (void *)-EINVAL;
> > +		return NULL;
> 
> Wow. The driver doesn't even return ERR_PTR, but just directly casts
> -EINVAL to a void *... thats quite ugly. Good to remove this.
> 




-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

