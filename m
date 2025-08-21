Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7038CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgm1pQM9Yos0Yo+5meKHtYh9v+Lv06dqAo+jQf1JViE=; b=Fxuhk4x6QoO0RKzTmajprH4sNU
	4ybzvVDC+wtmfFuJfwYXjS7Mk2ypxiQUufyhQ1m4Y1hOzG5eVk3chFrjIOV0qvmDcxyHlp/AO2M8E
	69n9MN0GUCO5qaO1D7uOoc3b5Hh7N80x799NoMngkx7Ya3hY9oMzq5ebjlxqBvmjwsJQ/G++mCBui
	WFV1gG7crTJUcxsBV3AAU5qsjsEIf4hl8MhfjbLCOtzsOg1IMZ3ZBnXSkgogK00vy23wLNOmTQ7E4
	cevisCNje5WEHCX1VehR43T00ulb53GEz/cayTL5lTa5ilTUpTkoJ32CWxdNwgCMkc78rr3HQ6Sg2
	3iN9r10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDv0-00000000n6a-21Qp;
	Thu, 21 Aug 2025 22:38:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7TG-0000000HReZ-3gXV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:45:00 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 75A5E605;
	Thu, 21 Aug 2025 17:43:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755791033;
	bh=6cNE3u3j5QI47w0oDtuojswNnENPUhE4eeZEZt9BAYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNjKbrh/xyUKrUDG/NqLXH1guYREo8PgzB0DbmstuuqbMs+f/4qDudezy7oK1IW/p
	 B2/lBTLJFfjsMuYbLMWb9F5Txu1AxX7RIOB6YD+K0IORoejY6i3yanbBBImL5dMiVu
	 Y8JL4xn4de5b1t2cLWoN1zhejuWqsx5pxJyi3Ngg=
Date: Thu, 21 Aug 2025 18:44:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/12] media: imx-mipi-csis: Simplify access to source
 pad
Message-ID: <20250821154429.GC25098@pendragon.ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-3-laurent.pinchart@ideasonboard.com>
 <aKc27pzVlhPUW8bd@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKc27pzVlhPUW8bd@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084459_047261_3E705CE4 
X-CRM114-Status: GOOD (  20.12  )
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

On Thu, Aug 21, 2025 at 11:10:38AM -0400, Frank Li wrote:
> On Thu, Aug 21, 2025 at 03:09:34AM +0300, Laurent Pinchart wrote:
> > The mipi_csis_calculate_params() function needs to access the pad of the
> > connected source. The pad is already available in csis->source.pad, but
> > the function takes a convoluted path by getting the pad index and
> > indexing the source subdev's pads array. Simplify it.
> 
> Generally, I like add "No functionality change" in commit message to help
> reviewer or developer direct skip this commit when bisect commit to
> indentify problem.

Good point. I'll add

"No functional change is intended."

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Frank Li
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 2beb5f43c2c0..46f93cd677e3 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -579,13 +579,11 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
> >  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> >  				      const struct csis_pix_format *csis_fmt)
> >  {
> > -	struct media_pad *src_pad =
> > -		&csis->source.sd->entity.pads[csis->source.pad->index];
> >  	s64 link_freq;
> >  	u32 lane_rate;
> >
> >  	/* Calculate the line rate from the pixel rate. */
> > -	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
> > +	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
> >  				       csis->bus.num_data_lanes * 2);
> >  	if (link_freq < 0) {
> >  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",

-- 
Regards,

Laurent Pinchart

