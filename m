Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62E8CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Td32NxIPL+IEwVqMVLYrBlw6zsQetTKe2zlFGKNC4j8=; b=O761HgHtxKM16uZMLXAmZPL1y3
	Q557EtIlq5RJQpReebpLML8VZGG47KjHFKu4nqw8HhYBmMSsbSunubAeQ7UeSzkiR0smxx5nGV2pk
	Ofqz1yWnofnjKtbfpknmcFSB6khgd9lvz78Eb6OaLU3hE1kuBa2K4OY+Rk4GfWuwpjLNcoq/0BfrA
	B7bKG6yDbC2NKfiskqMDx3PsPJIKjTxDV0ctn4IA5oQLrdyGLlQmltlw/lHBs1bYOXs94Hj4hpJbm
	238jeTRuwza0TDs+SOgv248aX50+0a7B+LAgYmLiqLqfOsAN56P3k2PGmObiusRbOlllGDxBT6GHg
	kmCyZUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphnY-000000041Vf-1Soe;
	Sat, 23 Aug 2025 06:32:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSwa-00000002rhV-2Nd9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:40:41 +0000
Received: from pendragon.ideasonboard.com (unknown [205.220.129.245])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9890A446;
	Fri, 22 Aug 2025 16:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755873579;
	bh=zj1rzy6SxpiP5UVa3GXGQh4rqI+RlENYyvwupRYye2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a96PCwbnYqWy9NzgoA0H+Hu4BubTkJXJ9AEyZpFPhWugKANdrz9tW2LJoNkQZpo9S
	 EdJ/TSUDS5dk+nV22AwEfaEtaY5DYyNCM53HtsoB+x77heo5/KQGJ/b4qav2yw/vDi
	 YnenV043is+sSKtBZSEXYgdcFQ/YD9Rmw4PtpLcM=
Date: Fri, 22 Aug 2025 17:40:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 06/13] media: imx-mipi-csis: Use GENMASK for all
 register field masks
Message-ID: <20250822144000.GA22572@pendragon.ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-7-laurent.pinchart@ideasonboard.com>
 <aKh7DmnEB2KChVol@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKh7DmnEB2KChVol@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_074040_741800_F9A3D693 
X-CRM114-Status: GOOD (  17.60  )
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

Hi Frank,

On Fri, Aug 22, 2025 at 10:13:34AM -0400, Frank Li wrote:
> On Fri, Aug 22, 2025 at 03:27:26AM +0300, Laurent Pinchart wrote:
> > Multiple register field mask macros use GENMASK, while other define the
> > mask value manually. Standardize on GENMASK everywhere, as well as on
> > the _MASK suffix to name the macros. This improves consistency and helps
> > with readability.
> >
> > No functional change is intended.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index ce889c436cb1..50f6f4468f7b 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -57,7 +57,7 @@
> 
> ...
> >
> >  /* ISP Image Resolution register */
> >  #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
> > @@ -655,7 +655,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> >  	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> >  	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
> > -	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
> > +	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
> 
> nit: if need create new verison, I suggest add "change MSK to MASK"
> informaiton at commit message.

The information is there already, the commit message already states
"Standardize [...] on the _MASK suffix to name the macros".

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> >  	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
> >
> >  	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L,

-- 
Regards,

Laurent Pinchart

