Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA711C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 17:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtcf2D/mpxdJN0cqY2kZoNvUqJQQPHUrd8D20NBOhYE=; b=QQycOjrYdllq3OObzF1lXuCCDn
	6N9zKyI5+QHvbNI5jI/s/J2ungj9Pk8Rvjxru0SDhcnE1b5lcjFZrpe8rMlhu0NKGncPkTZC8h5FK
	ayj2BduanjLzA7d9ro9eicWi50E5jTzqF8bM8D1DveFRsPtXPJbWunFa1aASYJrQqVsDUMYNEHDij
	KnX/1PwACYOI9h+rJkLonXrV5Fqny4HtNzk+r0E8MA1SK7hrYuy9B98Wm1rHLrHnzk4NtPuQv6jjm
	Delt9pEXxGHJdb4A8y2tWRkyqOek/Un/GhuOkyHDhOMyYSDRMNbJxyzW3INrJFU6GYAji7p7BLyK6
	eOC9vn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55A9-0000000HMo8-3QeE;
	Fri, 11 Sep 2026 17:35:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55A3-0000000HMmT-29D6;
	Fri, 11 Sep 2026 17:35:44 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCE38DA8;
	Fri, 11 Sep 2026 19:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789148040;
	bh=iwS1vIB//xdldz1BpUq3y6FKoMrwQfjgvhFiBVkFpJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7PDZITx/MujrpiarN9EybIY1mRkNbTwzhvSEn83zOfTkm/EOUm3PTGudX8yGNQw5
	 YVqp5nJT79QwxGQhN5phLuKUN43obFtdWNsNKvPglxi1APLJZ16rxDhHV5Vd79RDRK
	 YOnsURurJrjcX7oo3cWiRjOj6updowLDTyXNpjJ0=
Date: Fri, 11 Sep 2026 20:35:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: Fix Bayer demosaicing bypass
Message-ID: <20260911173536.GX1892234@killaraus.ideasonboard.com>
References: <20260911-imx8mp-demosaicing-bypass-v1-1-5568a7a560a6@ideasonboard.com>
 <178913687012.1723501.3167773155478207003@ping.linuxembedded.co.uk>
 <aqQTTtJf9qcdSz2z@zed>
 <20260911173508.GW1892234@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911173508.GW1892234@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_103539_709895_EE4F32CF 
X-CRM114-Status: GOOD (  30.68  )
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

On Fri, Sep 11, 2026 at 08:35:10PM +0300, Laurent Pinchart wrote:
> On Fri, Sep 11, 2026 at 04:43:32PM +0200, Jacopo Mondi wrote:
> > On Fri, Sep 11, 2026 at 03:27:50PM +0100, Kieran Bingham wrote:
> > > Quoting Jacopo Mondi (2026-09-11 14:56:19)
> > > > The RKISP1_CIF_ISP_DEMOSAIC_BYPASS bit, when set, bypasses the
> > > > demosaicing block on the RkISP1 ISP.
> > > >
> > > > The current implementation however clears the bit when demosaicing
> > > > have to be bypassed and sets it when demosaicing has to be enabled,
> > > > effectively inverting the bypass bit handling logic.
> > >
> > > Ouch.
> > >
> > > > Fix this by setting the bypass bit when disabling the demosaicing block,
> > > > and by clearing it instead when demosaicing has to be performed.
> > > >
> > > > The issue never manifested itself as libcamera hasn't an algorithm

s/hasn't/doesn't have/

I'll fix it when applying.

> > > > to control Bayer demosaicing bypass yet.
> > > >
> > > > Fixes: 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > > media: rkisp1: Fix demosaicing bypass
> > > > ---
> > > >  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > index 042b759eba62..496381962f1b 100644
> > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > @@ -1854,8 +1854,8 @@ rkisp1_ext_params_bdm(struct rkisp1_params *params,
> > > >         const struct rkisp1_ext_params_bdm_config *bdm = &block->bdm;
> > > >
> > > >         if (bdm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
> > > > -               rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> > > > -                                       RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> > > > +               rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> > > > +                                     RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> > > >                 return;
> > > >         }
> > > >
> > > > @@ -1863,8 +1863,8 @@ rkisp1_ext_params_bdm(struct rkisp1_params *params,
> > > >
> > > >         if ((bdm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
> > > >             !(params->enabled_blocks & BIT(bdm->header.type)))
> > > > -               rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> > > > -                                     RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> > > > +               rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
> > > > +                                       RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
> > >
> > > I think this also opens us up to add mono formats as explicitly
> > > supported by the ISP and potentially set the demosaic defaulting to off
> > > in that instance?
> > 
> > mmm, I think userspace is in a better position to decide when to
> > bypass debayer instead of relying on auto-configuration of the ISP ?
> > 
> > I guess we'll discuss this when support for luma-only formats will be
> > added to the driver
> 
> While I understand why auto-configuration is tempting, I've found that
> more often than not it makes the life of both the driver and userspace
> more difficult. Look for instance at the colourspace handling code in
> rkisp1.
> 
> > > Anyway, Looks sane to me in this order.
> > >
> > > Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > thanks
> > 
> > > >  }
> > > >
> > > >  static void
> > > >
> > > > ---
> > > > base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> > > > change-id: 20260911-imx8mp-demosaicing-bypass-bb284d9cca60

-- 
Regards,

Laurent Pinchart

