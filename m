Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAE2C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkvVUYf56YkKwDNnn0aVR2NglpqS6rjloE7aXvrvfLY=; b=Pr6yGqPVFWHVq/K4JSlvvnofnU
	7zFl5ABCC2ArZueVzno6EgSbiTxU+jdkCmckpHYMgKToPiCEBoTqalX4Yy+IYi/ssmQPDMRYpRpqC
	AJs1GNvTxDrYNyvTkZhPQAgopi+BN/uxpGQ3BTSdWwsMshpQ0WOQzBIv+f2lHYVG6K6Yam3J9oueU
	K7e/iDUGoPM34XkTcJB3mxQ6JgiMLL3sPAabCFLdrmWoT1KCuG++98USa+i/rflKA41KGaYTuT7lE
	bCe/ssKHCSFxNzStOUy/dwN/tHBCLBCmThazCwg4Eetw8VsBN9sfLfDWmhcZVl2zkG+3k1vuUgkWY
	DelRjPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjO6G-00000000fHb-27eQ;
	Sat, 15 Feb 2025 19:45:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjO4o-00000000fAV-04t4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 19:43:47 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8268578E;
	Sat, 15 Feb 2025 20:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739648540;
	bh=aqlKCwiWQwaADZiGJGLwvMY4WxGCqqgsu+/fFmoalpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciXV6QQKMNabAtWB71rKDXbANKJy2yaHJYmQjmMfOW/mo7VsdeM/SZ/3d1dZryChw
	 8BHpgt6jUkPX/KKqqAxmgFrGHJD9ATWgivTFS68lFAREsNfcSAI2chxrmL/tvhFWfz
	 k9YWROuZQxMg5m1R16mm9aeJ7fRWKHXVGSdIUrUY=
Date: Sat, 15 Feb 2025 21:43:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sicelo <absicsz@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
	mchehab@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, hns@goldelico.com, b-padhi@ti.com,
	andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/4] media: omap3isp: Handle ARM dma_iommu_mapping
Message-ID: <20250215194328.GF12632@pendragon.ideasonboard.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <34542c9552ce8cd12a5c292e79589acd964075d5.1730136799.git.robin.murphy@arm.com>
 <Z7A61N13dZpu53xI@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7A61N13dZpu53xI@tp440p.steeds.sam>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_114346_388959_F76447FC 
X-CRM114-Status: GOOD (  26.84  )
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

CC'ing Sakari.

Sakari, would you pick this patch ?

On Sat, Feb 15, 2025 at 08:57:24AM +0200, Sicelo wrote:
> On Mon, Oct 28, 2024 at 05:58:36PM +0000, Robin Murphy wrote:
> > It's no longer practical for the OMAP IOMMU driver to trick
> > arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
> > same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
> > the arch code's dma_iommu_mapping out of the way to avoid problems.
> > 
> > Fixes: 4720287c7bf7 ("iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()")
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> >  drivers/media/platform/ti/omap3isp/isp.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> > index 91101ba88ef0..b2210841a320 100644
> > --- a/drivers/media/platform/ti/omap3isp/isp.c
> > +++ b/drivers/media/platform/ti/omap3isp/isp.c
> > @@ -1961,6 +1961,13 @@ static int isp_attach_iommu(struct isp_device *isp)
> >  	struct dma_iommu_mapping *mapping;
> >  	int ret;
> >  
> > +	/* We always want to replace any default mapping from the arch code */
> > +	mapping = to_dma_iommu_mapping(isp->dev);
> > +	if (mapping) {
> > +		arm_iommu_detach_device(isp->dev);
> > +		arm_iommu_release_mapping(mapping);
> > +	}
> > +
> >  	/*
> >  	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
> >  	 * VAs. This will allocate a corresponding IOMMU domain.
> > -- 
> > 2.39.2.101.g768bb238c484.dirty
> > 
> 
> I have finally found time to test this patch on the Nokia N900 and can
> confirm it is working fine.
> 
> I was wondering - is there a reason that it is not merged yet? I tested
> on 6.14-rc2, which did not have it, and notice it is also not in
> linux-next.
> 
> If it helps:
> 
> Tested-by: Sicelo A. Mhlongo <absicsz@gmail.com>

-- 
Regards,

Laurent Pinchart

