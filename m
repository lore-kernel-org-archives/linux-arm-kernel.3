Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD06C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Elwh+r/uXUWKr+0hd6wb4ktQPxzEt12ZisVDE25VjDg=; b=TbGzEtmlauJ7+93ejSqUJ7SDcU
	tS122BgLOCPrIQLLXbVhC9mUVhuIT6Ro9qeVjr3qNfXSrSthL2Ef+XwzaNo/P52zxY6CriglR3Fo1
	sAIOQwchuasrKjG9DwO8YoG1MAeM/GkoTaOd2K1e06JZaEz9ueFU9oQWY5KnCDzTUEQLptp114kFB
	KvsxbjrN46N4JSOLaiLjVfxbrpbKd47+LDXNaPyxb98kcOCkUvVtzGiXG3/snCwvMmWEFOx+qrG0u
	MCNe/W1vaw9T3Xwz67s4ALQS9l2vQKJmVC1DGicM92ctHdxoEacvoPmJdz5+Sqlvj0JiS2GL6ekYO
	zeAkwKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvxq-00000006Sym-1zAc;
	Tue, 10 Jun 2025 10:12:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvK0-00000006LOT-2H3z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 09:31:09 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D56DD2EC;
	Tue, 10 Jun 2025 11:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749547860;
	bh=RJnqcxMbNIxlr5WHFTB3DtfDPYl9c+Ani7yndG3QX+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unCEQU8PyvSu0fK2raePwS5YJoY3Ob2A/0SliXK2qoRY8mSjX6XNLukOVwdfarZOf
	 IdbuEhFp6bms0SqvLkOxz2cooHIGTC5JGEku5p1hNZw6awHYnDVZwwyDmlH4UDIjbo
	 KAN2uTRLL7tmm+BN0ieAzWovP5Qr6PirfR155trk=
Date: Tue, 10 Jun 2025 12:30:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Subject: Re: [PATCH 8/8] media: imx-mipi-csis: Initial support for multiple
 output channels
Message-ID: <20250610093054.GN27510@pendragon.ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-9-laurent.pinchart@ideasonboard.com>
 <2230307.irdbgypaU6@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2230307.irdbgypaU6@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_023108_725616_2E1A5E39 
X-CRM114-Status: GOOD (  17.26  )
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

On Tue, Jun 10, 2025 at 11:01:20AM +0200, Alexander Stein wrote:
> Am Montag, 9. Juni 2025, 01:58:40 CEST schrieb Laurent Pinchart:
> > Some CSIS instances feature more than one output channel. Parse the
> > number of channels from the device tree, and update register dumps and
> > event counters accordingly. Support for routing virtual channels and
> > data types to output channels through the subdev internal routing API
> > will come later.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 224 ++++++++++++++-------
> >  1 file changed, 146 insertions(+), 78 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 080e40837463..4cc358d93187 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -98,12 +98,12 @@
> >  #define MIPI_CSIS_INT_SRC_ODD_AFTER		BIT(28)
> >  #define MIPI_CSIS_INT_SRC_ODD			(0x3 << 28)
> >  #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
> 
> As a side note: I just noticed Bits 28-31 are only defined on i.MX7. They
> are reserved on i.MX8M (Mini, Nano, Plus).

They are many bit marked as reserved that are actually implemented. The
CSIS is a big pain point :-(

> > -#define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
> > -#define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
> > +#define MIPI_CSIS_INT_SRC_FRAME_START(n)	BIT((n) + 24)
> > +#define MIPI_CSIS_INT_SRC_FRAME_END(n)		BIT((n) + 20)
> >  #define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
> > -#define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
> > -#define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
> > -#define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
> > +#define MIPI_CSIS_INT_SRC_ERR_LOST_FS(n)	BIT((n) + 12)
> > +#define MIPI_CSIS_INT_SRC_ERR_LOST_FE(n)	BIT((n) + 8)
> > +#define MIPI_CSIS_INT_SRC_ERR_OVER(n)		BIT((n) + 4)
> 
> Similar here. Only i.MX7 has the bits for CH1, CH2 and CH3 defined.
> 
> >  #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
> >  #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
> >  #define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
> > @@ -205,23 +205,23 @@
> >  /* Debug control register */
> >  #define MIPI_CSIS_DBG_CTRL			0xc0
> >  #define MIPI_CSIS_DBG_INTR_MSK			0xc4
> > -#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT	BIT(25)
> > -#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE	BIT(24)
> > -#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE	BIT(20)
> > -#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME	BIT(16)
> > -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE		BIT(12)
> > -#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS		BIT(8)
> > -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL	BIT(4)
> > -#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE	BIT(0)
> > +#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT		BIT(25)
> > +#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE		BIT(24)
> > +#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE(n)	BIT((n) + 20)
> > +#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME(n)	BIT((n) + 16)
> > +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE(n)		BIT((n) + 12)
> > +#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS(n)		BIT((n) + 8)
> > +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL(n)	BIT((n) + 4)
> > +#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE(n)	BIT((n) + 0)
> >  #define MIPI_CSIS_DBG_INTR_SRC			0xc8
> > -#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT	BIT(25)
> > -#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE	BIT(24)
> > -#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE	BIT(20)
> > -#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME	BIT(16)
> > -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE		BIT(12)
> > -#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS		BIT(8)
> > -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL	BIT(4)
> > -#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
> > +#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT		BIT(25)
> > +#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE		BIT(24)
> > +#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(n)	BIT((n) + 20)
> > +#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(n)	BIT((n) + 16)
> > +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(n)		BIT((n) + 12)
> > +#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(n)		BIT((n) + 8)
> > +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(n)	BIT((n) + 4)
> > +#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(n)	BIT((n) + 0)
> 
> Out of curiosity: Where do these bits come from? I can't find them in RM.

They are documented in the i.MX7D RM, and they appear to be implemented
on the i.MX8MP as the interrupts fire in the expected way.

> > [snip]

-- 
Regards,

Laurent Pinchart

