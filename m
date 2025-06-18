Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7622C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZUGsxch2mU4ig/PrnBi7Icy3DlCbR+ATaArWiJ5KlI=; b=l52NlaVzo5a2W8m4YmgBf8JKdz
	EdQHBQdtTn0rPsGXAJXWZ/Nc9SAQOiVjJelCg34uQ7kjxsFzY+1Fi4k87JHXnv81xC70moQa6jhJM
	1Vk9KExcCjDu4rR/Zz6YoL4a4NEwFBE31hNRnbQ1ip5QBOj6FN+0aDMO6nyRkLFnQOzMbeLb9hXpJ
	acue8pRhlJdq3UZHS8vkqO45ZLWxsMjRGU54R4fRgE133Ir9EkXiMWZlNng3YrEYz9zo94LrY1ajZ
	bxN3OYZrdQLtbWgWL1YrFBsVoZKRIJkun+/2pgh2aLxjXx07kcXXhRgIUH94TdnRnLV3NPkWG1Vsq
	ai2BZDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyCb-0000000BAOW-0vfr;
	Wed, 18 Jun 2025 19:12:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRx1f-0000000AxyZ-2u29
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 17:56:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 894B75C64EE;
	Wed, 18 Jun 2025 17:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33887C4CEE7;
	Wed, 18 Jun 2025 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750269401;
	bh=V0jYqFFKbzT7bXfhR/W46mT6WW4TnOaHWP8Drco8eiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uV7628HYaOedZ3pV9W7Ru7d0YDnUQZ+TXa7cQWrutbXYSYKAfl7ue8cv+fgaBuWUY
	 Oq1SxMn3u4ueJxX2enqWnA7QtAqBzkko+p8iD9Xfvsi1ClKHASGGOs5EM4J+vKPSUA
	 saiJ32qW4OVwUn4twpjLmMGm9NwNLEfH34ihfXETKQekxfjF//UiI5lv64PxgkMLjK
	 YiVn93P4n+NPJm0L7ECpei0VPaclRin5EnH6ELEnV1SMXIsUKhDLu8F7ka2INP9F94
	 O6Yn49GNo1amfPXd59VFhvYyiPsppYkzM+n2Wvp7c1zThiK+ccP744aWttvBTCszvH
	 0yrVqWTYtfPVw==
Date: Wed, 18 Jun 2025 23:26:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Abin Joseph <abin.joseph@amd.com>, michal.simek@amd.com,
	yanzhen@vivo.com, radhey.shyam.pandey@amd.com, palmer@rivosinc.com,
	git@amd.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: zynqmp_dma: Add shutdown operation support
Message-ID: <aFL91fq7SPAiXOak@vaman>
References: <20250612162144.3294953-1-abin.joseph@amd.com>
 <aFENfW0v0gmtY2Gu@vaman>
 <rgjc7ujikyznrri27u6v3zst2m44423g46rlfnkfncr24jwx6z@mfwwvhe3upby>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rgjc7ujikyznrri27u6v3zst2m44423g46rlfnkfncr24jwx6z@mfwwvhe3upby>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_105643_812212_848893B5 
X-CRM114-Status: GOOD (  23.69  )
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

On 17-06-25, 09:43, Uwe Kleine-König wrote:
> Hello Vinod,
> 
> On Tue, Jun 17, 2025 at 12:08:53PM +0530, Vinod Koul wrote:
> > On 12-06-25, 21:51, Abin Joseph wrote:
> > > Implement shutdown hook to ensure dmaengine could be stopped inorder for
> > > kexec to restart the new kernel.
> > > 
> > > Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> > > ---
> > >  drivers/dma/xilinx/zynqmp_dma.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> > > index d05fc5fcc77d..8f9f1ef4f0bf 100644
> > > --- a/drivers/dma/xilinx/zynqmp_dma.c
> > > +++ b/drivers/dma/xilinx/zynqmp_dma.c
> > > @@ -1178,6 +1178,18 @@ static void zynqmp_dma_remove(struct platform_device *pdev)
> > >  		zynqmp_dma_runtime_suspend(zdev->dev);
> > >  }
> > >  
> > > +/**
> > > + * zynqmp_dma_shutdown - Driver shutdown function
> > > + * @pdev: Pointer to the platform_device structure
> > > + */
> > > +static void zynqmp_dma_shutdown(struct platform_device *pdev)
> > > +{
> > > +	struct zynqmp_dma_device *zdev = platform_get_drvdata(pdev);
> > > +
> > > +	zynqmp_dma_chan_remove(zdev->chan);
> > > +	pm_runtime_disable(zdev->dev);
> > > +}
> > > +
> > >  static const struct of_device_id zynqmp_dma_of_match[] = {
> > >  	{ .compatible = "amd,versal2-dma-1.0", .data = &versal2_dma_config },
> > >  	{ .compatible = "xlnx,zynqmp-dma-1.0", },
> > > @@ -1193,6 +1205,7 @@ static struct platform_driver zynqmp_dma_driver = {
> > >  	},
> > >  	.probe = zynqmp_dma_probe,
> > >  	.remove = zynqmp_dma_remove,
> > > +	.shutdown = zynqmp_dma_shutdown,
> > 
> > Why not do all operations performed in remove..?
> 
> .remove() isn't called on shutdown.

Yes that is correct

> Having said that, most other drivers also don't handle .shutdown(). IMHO
> this is special enough that this warrants a comment. Or is kexec a
> reason to silence *all* DMA and most drivers should have a .shutdown
> callback?

My point was remove does a lot of work to quiesce the dma transactions,
terminate the pending work etc, all those steps should be ideally done
on shutdown too, hence question of why not do all the steps done in
remove as well

But yes, you are bringing another good point for drivers, they should
have a shutdown callback implemented

-- 
~Vinod

