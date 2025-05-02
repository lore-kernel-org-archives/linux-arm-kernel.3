Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18960C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmPBFU9+95ZB88vG8J5Apu+ABDhyAXs6JJmFLCjh8ug=; b=we+G/O0/8+keJVdAUccQSojRmB
	8kwh+ppobl2mXaT4xrSFRAr6gkjp3gCCU1VtjXS5v5dXAwPlGCwhrny8puSPM+zMQ7rY6Whgp3av8
	kFEePVtm5KIeZCJ9cZhLCUxEHrC/GRru1Q2uNHZLeE4pUjsmyhxOLOTBL91JDEnqc5eQF5bYi3Cza
	DuQgRykRRIQIG61GcUaBbPwvhqzm2BJmaCCx/Kiy2jNUS/0mFzPZM2a5zy0Qat/KsLc+RhLS7iio+
	gjVECOQbAAlJiFpZ3e7jLh2k+RIlMu9t05ZtrB/zCoVDefFvJ18H0/a12WVrfVM33Am2DO5FLacX0
	Mm3edlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsUE-00000002MWL-3asO;
	Fri, 02 May 2025 15:39:38 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsGS-00000002KJF-04ol
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:25:28 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 180D2353;
	Fri,  2 May 2025 17:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746199514;
	bh=ekfNPCViNS+1/0EDUfNUraJaXJm+PrXPsKL2YYRrFVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U14dUhScriBzlj2ff//LAs2UIgBYiG853o5XoBV9vLcJvNXuOdTWiBBJ/0faqIJwq
	 CTsbEY9N9sKVvjZu5P4KdegNUi5dFErckMqTMYjVC1x3tIDuND60ETFMe5GYR9rtzS
	 nH5noXs2e3ifra95E/EjRcnU2HuMdACL9eVXyTUg=
Date: Fri, 2 May 2025 18:25:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 03/13] media: nxp: imx8-isi: Remove unused offset in
 mxc_isi_reg and use BIT() macro for mask
Message-ID: <20250502152513.GG22453@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-3-ef695f1b47c4@nxp.com>
 <20250421210655.GM17813@pendragon.ideasonboard.com>
 <aBQXfW6dzdyFI1GN@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aBQXfW6dzdyFI1GN@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_082524_196064_526836B5 
X-CRM114-Status: GOOD (  27.48  )
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

On Thu, May 01, 2025 at 08:53:17PM -0400, Frank Li wrote:
> On Tue, Apr 22, 2025 at 12:06:55AM +0300, Laurent Pinchart wrote:
> > Hi Frank,
> >
> > Thank you for the patch.
> >
> > On Tue, Apr 08, 2025 at 05:53:01PM -0400, Frank Li wrote:
> > > Preserve clarity by removing the unused 'offset' field in struct mxc_isi_reg,
> > > as it duplicates information already indicated by the mask and remains unused.
> >
> > The commit message line length limit is normally 72 characters. I can
> > reflow when applying if no other change to the series is needed.
> 
> I remember it is 75 chars. Any document show it is 72. I need correct for
> the other patches also.

You're absolutely right, I don't know where I got the 72 columns limit
from. Please ignore my comment.

> > >
> > > Improve readability by replacing hex value masks with the BIT() macro.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > ---
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 25 +++++++++++-----------
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 -
> > >  2 files changed, 13 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > index 1e79b1211b603..ecfc95882f903 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > @@ -3,6 +3,7 @@
> > >   * Copyright 2019-2020 NXP
> > >   */
> > >
> > > +#include <linux/bits.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/device.h>
> > >  #include <linux/errno.h>
> > > @@ -247,24 +248,24 @@ static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
> > >
> > >  /* For i.MX8QXP C0 and i.MX8MN ISI IER version */
> > >  static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
> > > -	.oflw_y_buf_en = { .offset = 19, .mask = 0x80000  },
> > > -	.oflw_u_buf_en = { .offset = 21, .mask = 0x200000 },
> > > -	.oflw_v_buf_en = { .offset = 23, .mask = 0x800000 },
> > > +	.oflw_y_buf_en = { .mask = BIT(19) },
> > > +	.oflw_u_buf_en = { .mask = BIT(21) },
> > > +	.oflw_v_buf_en = { .mask = BIT(23) },
> > >
> > > -	.panic_y_buf_en = {.offset = 20, .mask = 0x100000  },
> > > -	.panic_u_buf_en = {.offset = 22, .mask = 0x400000  },
> > > -	.panic_v_buf_en = {.offset = 24, .mask = 0x1000000 },
> > > +	.panic_y_buf_en = { .mask = BIT(20) },
> > > +	.panic_u_buf_en = { .mask = BIT(22) },
> > > +	.panic_v_buf_en = { .mask = BIT(24) },
> > >  };
> > >
> > >  /* For i.MX8MP ISI IER version */
> > >  static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
> > > -	.oflw_y_buf_en = { .offset = 18, .mask = 0x40000  },
> > > -	.oflw_u_buf_en = { .offset = 20, .mask = 0x100000 },
> > > -	.oflw_v_buf_en = { .offset = 22, .mask = 0x400000 },
> > > +	.oflw_y_buf_en = { .mask = BIT(18) },
> > > +	.oflw_u_buf_en = { .mask = BIT(20) },
> > > +	.oflw_v_buf_en = { .mask = BIT(22) },
> > >
> > > -	.panic_y_buf_en = {.offset = 19, .mask = 0x80000  },
> > > -	.panic_u_buf_en = {.offset = 21, .mask = 0x200000 },
> > > -	.panic_v_buf_en = {.offset = 23, .mask = 0x800000 },
> > > +	.panic_y_buf_en = { .mask = BIT(19) },
> > > +	.panic_u_buf_en = { .mask = BIT(21) },
> > > +	.panic_v_buf_en = { .mask = BIT(23) },
> > >  };
> > >
> > >  /* Panic will assert when the buffers are 50% full */
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > index 9c7fe9e5f941f..e7534a80af7b4 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > @@ -114,7 +114,6 @@ struct mxc_isi_buffer {
> > >  };
> > >
> > >  struct mxc_isi_reg {
> > > -	u32 offset;
> > >  	u32 mask;
> > >  };
> > >

-- 
Regards,

Laurent Pinchart

