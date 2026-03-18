Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AA010775E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tcbAf2TLbDZGGhH9W5GstwCswBLuBT1QhN/uA801F4=; b=RzVuR4vBpjFBLYMs71sRAoMEO9
	IfLWLymc6yxGau41S25uluLkOkE9VteOoOu6ojppfBX65p3+9FsV1nGyP4f2DvLI0wXDgDLPC6Jwj
	U63BkmEEgLrJZUOTUp3L1Tj1TzD1tBtn/xvSaSpGjTh+sSfcTLekGdWEgNg+IQQhHWnNswYq7FChy
	ufx+2XxFyDQjCRZCVJ0zIxYeUgdbEH+5OCcAjxg7lWMR9XVsmWH3kjscelimxsmZ1twUggb3dMiha
	YcaBxyZgcV1ByFzTlW9R1utAZeZNyaVEQ9ayfP8mGvxfPn4wGKKvQlLYFvrKdxBfxStryI7+LbabC
	tp/AJXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tjr-00000008vDm-3kyY;
	Wed, 18 Mar 2026 16:27:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tjo-00000008vCx-3n3J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:27:18 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 374D7379;
	Wed, 18 Mar 2026 17:26:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773851161;
	bh=R+gbzyfqox47IzBo74fcCTrVzw96R34F9lvaLulTWxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iC2kqm0maHG/uZeyfWQCouc2GX7NMxkhUGzJVZEPv0Rxr68XIePmLtmFU1LllN4JM
	 FOj00WG4giK96te25mBRqHR7k20JvnAu+QlQqzwWIoEB+mER7GFee85HwPsiQFzacw
	 qaLZUGVB6D/sd5BBKT0uoDdvdytr/CLuQw1eu1hQ=
Date: Wed, 18 Mar 2026 18:27:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH v2 1/4] drm/rcar-du: Use drm_gem_dma_get_sg_table()
 helper to get scatter gather table
Message-ID: <20260318162712.GF633439@killaraus.ideasonboard.com>
References: <20260317064049.696795-1-wenst@chromium.org>
 <20260317064049.696795-2-wenst@chromium.org>
 <20260318160239.GB633439@killaraus.ideasonboard.com>
 <CAGb2v66+OHbNOQLk1JojFapPDhSK6eqCySRWzQVYGkvAivqD4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v66+OHbNOQLk1JojFapPDhSK6eqCySRWzQVYGkvAivqD4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_092717_126311_2FB9AC80 
X-CRM114-Status: GOOD (  41.39  )
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

On Thu, Mar 19, 2026 at 12:21:49AM +0800, Chen-Yu Tsai wrote:
> On Thu, Mar 19, 2026 at 12:02 AM Laurent Pinchart wrote:
> > On Tue, Mar 17, 2026 at 02:40:43PM +0800, Chen-Yu Tsai wrote:
> > > The rcar-du driver is directly calling dma_get_sgtable() on a
> > > drm_gem_dma_object. Not passing the dma_attrs field in may cause
> > > problems when DMA_ATTR_NO_KERNEL_MAPPING is added to the GEM DMA
> > > helpers gain support later.
> > >
> > > Instead, use the drm_gem_dma_get_sg_table() helper to get the scatter
> > > gather table.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > Changes since v1:
> > > - new patch
> > >
> > > Not sure if we should add a helper like drm_fb_dma_get_gem_addr(). This
> > > seems to be the only driver that is using a scatter gather table to pass
> > > DMA addresses.
> >
> > The DU can't access memory directly (at least on Gen3 and newer), and
> > goes through a separate device called VSP that acts as an external DMA
> > engine (*) and compositor. This is why buffers need to be mapped
> > manually to the VSP, the GEM helpers would otherwise use the DU struct
> > device, which isn't correct. I can't use drm_device.dma_dev as the DMA
> > initiator can be different per CRTC.
> >
> > I don't think a separate helper with a single user would be very useful
> > here, especially given that part of the logic in
> > drm_fb_dma_get_gem_addr() is in the separate vsp1 driver. Refactoring
> > may get messy, for little benefit.
> >
> > * And in some cases the VSP further delegates memory access to the FCP,
> > which is yet another DMA initiator from an IOMMU point of view.
> 
> I see. That's probably the most complicated hardware I've seen so far.

I felt similar when I found out Gen3 dropped the DMA engines and
compositor previously part of the DU :-)

> > > ---
> > >  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > > index 94c22d2db197..6a62608ee3a9 100644
> > > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > > @@ -291,10 +291,16 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
> > >                               dst = sg_next(dst);
> > >                       }
> > >               } else {
> > > -                     ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
> > > -                                           gem->dma_addr, gem->base.size);
> >
> > Did you compile the patch ? The rcdu variable is now unused. Apart from
> > that, it compiles fine and seems to operate as expected.
> 
> I probably missed it in the logs. Thanks for catching it.
> 
> > > -                     if (ret)
> > > +                     struct sg_table *ret_sgt;
> > > +
> > > +                     ret_sgt = drm_gem_dma_get_sg_table(gem);
> > > +                     if (IS_ERR(ret_sgt)) {
> > > +                             ret = PTR_ERR(ret_sgt);
> > >                               goto fail;
> > > +                     }
> > > +
> > > +                     memcpy(sgt, ret_sgt, sizeof(*sgt));
> > > +                     kfree(ret_sgt);
> >
> > It's a bit of a shame to kmalloc() a new sg_table and free it right
> > after :-/ Would it be that bad to switch to dma_get_sgtable_attrs()
> > here, and pass gem->dma_attrs to the function ?
> 
> That's another option. I was trying to isolate the DMA API calls to
> just the GEM DMA helpers, but as you said, it's a bit wasteful.

I like the goal of avoiding direct DMA mapping API calls, but I'm
worried it will cause more harm than good in this case :-/

> I'll just switch to dma_get_sgtable_attrs() and squash the change into
> the other dma_*_attrs() conversion patch.

OK.

> > >               }
> > >
> > >               ret = vsp1_du_map_sg(vsp->vsp, sgt);

-- 
Regards,

Laurent Pinchart

