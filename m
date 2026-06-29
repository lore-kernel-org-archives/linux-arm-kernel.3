Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5ECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VShnXE/S6J2Bs5ZstLQRozp+7OGRibuiVFYr3Gy/x8s=; b=DXQwYOPC347gMbIdZ9oNYqvjYd
	mqA14rugQXyJouCIVNyYP1Y4r/XAIgoOQFVFc32OtmNS+GeYWPaSQV+/ann+FlGoLUtUF4vYcNHhc
	N4d96qkK6t0uX9uShaHB87d1jWURG1OgzvZbkX2o1z8kTBVxgadJVmoL9r2vBAyxRedNK9nyPEE7Y
	QO5MB9GmVuYs2nA0jFpsfL5ep0kMpWJfOkDDUH/shgyqMgecaX0PbK3qBz4HJycB65w0suqVJmSX/
	f4PocMomQW7UXb064kTYdRQbattvKBvi4kNLxXedVYcnYZVvMp0AE9+WhUaT6YQs7R+O1g3yJja9v
	RzS9lUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7cJ-0000000E1ak-0389;
	Mon, 29 Jun 2026 08:45:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7cG-0000000E1a9-0bs3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:45:21 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D69212F;
	Mon, 29 Jun 2026 10:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782722674;
	bh=3mwpvD9m0LM0xROJVh89e4aig42l8CUBljGvEkPTYjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjWlPhJPzYIHg18PptzEGYwDvLtAzb2fUCkJiwnGIxi6hQOdv8wATBbgLDCU/oHu+
	 DsK53Q4xrldvi4EKioRYUSUeM6oqmPda9tImbR5UhFfFiwv82mWpoQQIKL7ubRDyKA
	 FaVUrcdkJXd3H1scI3qlVoHfhi40eyXHkTm4wAz4=
Date: Mon, 29 Jun 2026 11:45:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/9] media: mc-entity: Store parsed V4L2 fwnode
 endpoint in media_pad
Message-ID: <20260629084516.GA3054459@killaraus.ideasonboard.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
 <akGD3ZjW6GPHHI3D@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <akGD3ZjW6GPHHI3D@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_014520_354402_79DC61DD 
X-CRM114-Status: GOOD (  27.73  )
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

On Sun, Jun 28, 2026 at 11:28:13PM +0300, Sakari Ailus wrote:
> On Wed, Jun 24, 2026 at 04:37:48PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> > 
> > Each media pad is associated with a firmware node endpoint. Capture the
> > parsed V4L2 fwnode endpoint information in struct media_pad so it can be
> > reused by consumers.
> > 
> > This avoids reparsing firmware node endpoint data every time the endpoint
> > configuration is needed, reduces duplicate code, and provides a common
> > place to store endpoint properties associated with a pad.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Assume 1 to 1 map between dt's endpoint to medie pad.
> > Change in v6
> > - new patch
> > ---
> >  include/media/media-entity.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index d9b72cd87d524..4a3785cd9f370 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -20,6 +20,8 @@
> >  #include <linux/minmax.h>
> >  #include <linux/types.h>
> >  
> > +#include <media/v4l2-fwnode.h>
> 
> We have dependencies from V4L2 to MC but not the other way around as MC is
> (or was?) intended for wider use then just V4L2. I'm thus more than a bit
> hesitant adding any references to V4L2 in MC.
> 
> I wonder what Hans and Laurent think.

I agree. Furthermore, this will significantly increase the size of the
media_pad structure, for all pads. That's not a good design.

> > +
> >  /* Enums used internally at the media controller to represent graphs */
> >  
> >  /**
> > @@ -230,6 +232,7 @@ enum media_pad_signal_type {
> >   * @flags:	Pad flags, as defined in
> >   *		:ref:`include/uapi/linux/media.h <media_header>`
> >   *		(seek for ``MEDIA_PAD_FL_*``)
> > + * @vep:	associated fwnode endpoint information
> >   * @pipe:	Pipeline this pad belongs to. Use media_entity_pipeline() to
> >   *		access this field.
> >   */
> > @@ -240,7 +243,7 @@ struct media_pad {
> >  	u16 num_links;
> >  	enum media_pad_signal_type sig_type;
> >  	unsigned long flags;
> > -
> > +	struct v4l2_fwnode_endpoint vep;
> >  	/*
> >  	 * The fields below are private, and should only be accessed via
> >  	 * appropriate functions.
> > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

-- 
Regards,

Laurent Pinchart

