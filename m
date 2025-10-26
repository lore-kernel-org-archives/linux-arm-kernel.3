Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DAACCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 21:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKAE7ZNi07b8dS4D7HEPmvr5MoaWA0+qiYbzpKl53NU=; b=pS2fAqzMX+a0I7dLubch4OQRSJ
	08ECexjRumUm9gfRFremaQhkMvra/lQxB9SsavIrl6Thw+DJghvBdTEHU09e/hlxXFpRAgUU8AtFi
	jORr0ryyXrBBM5mOszmG7+lxLpr55eZc15xihzRiNWDl6QCk36DJu+aySWyeErhq40eo+r7kIXaTl
	uiR9VFUAduDLvo8Sv23JR0YDAE1ac+0r1r3ARvZXwbjiazBLrUe97eR2ENmVXdhEcDrznxAa0cb6t
	+//PUTZKpQ4xLHKCQ9F+3WY2YeFPpSrDpm6dSVnBlVysiMaEgyH6D7hBK2EXoMtGzH5xtYfSsCBLe
	0UKa2kGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD81P-0000000Ckag-2X6q;
	Sun, 26 Oct 2025 21:11:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD81M-0000000Cka7-2Prk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 21:11:25 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CAC8F21B1;
	Sun, 26 Oct 2025 22:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761512975;
	bh=ObOOH9WDscvwAqkjW2Oryk+fDasfzz/CdPqG1NC+8vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVMYW7vswqx2wA3X+nZlRRw/8m2pGFWq22EnlY7+9HV9FFhGjUxF8DtUc70y1Djyn
	 xE5Y1qiRWUglDb4wfE4pVM5+P5cgPqrA4Gh4LlOOLEJFdbOXQAJfkM9iRENIUQ8/yu
	 zPBeAvHwSrBBFc+FAF9WCJKSyf5OyDPrFwJ/W32I=
Date: Sun, 26 Oct 2025 23:11:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank.Li@nxp.com
Subject: Re: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes
 differing from maximum
Message-ID: <20251026211107.GF1025@pendragon.ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <20251022102228.275627-5-isaac.scott@ideasonboard.com>
 <aPi8RXHVBMB7vHQ2@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aPi8RXHVBMB7vHQ2@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_141124_775458_2EE581EF 
X-CRM114-Status: GOOD (  21.18  )
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

On Wed, Oct 22, 2025 at 02:13:09PM +0300, Sakari Ailus wrote:
> On Wed, Oct 22, 2025 at 11:22:28AM +0100, Isaac Scott wrote:
> > Call on v4l2_get_active_data_lanes() to check if the driver reports that
> > the number of lanes actively used by the MIPI CSI transmitter differs to
> > the maximum defined in device tree.
> > 
> > If the number of active data lanes reported by the driver is invalid, or
> > the operation is not supported, fall back to the number of allowed data
> > lanes.
> > 
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 838a1ad123b5..637ef6e614fa 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> >  	csis_fmt = find_csis_format(format->code);
> >  
> > +	ret = v4l2_get_active_data_lanes(csis->source.pad,
> > +					 csis->bus.num_data_lanes);
> > +	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;
> 
> I guess this works but should we return an error here instead?
> 
> Alternatively, the function could always return some number of lanes as
> well (with a printed warning on error). I think I'd do the former though.

Agreed, I would return an error.

> > +
> >  	ret = mipi_csis_calculate_params(csis, csis_fmt);
> >  	if (ret < 0)
> >  		goto err_unlock;

-- 
Regards,

Laurent Pinchart

