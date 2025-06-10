Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E97C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 07:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSCaqbtLR1yPRvMbmGDvvsw1FOCl9iAXcuBfF4A86ak=; b=SuN7LvItso0UX3RpJn8I9I88FE
	FWIFHw4Vl3HC9mXklVlVIi+wE873Sg5AqudrLbuaMEkue41C6pFjOUM5hUH4X3W0vuGy/V9Sj0FAJ
	gGonULAHLUn6eIEr+zx3Fcu+HwwHoc2OC1pcQyeQOGfSgxIUq8o1YAU41KISgMU+Kui0YrJO7oaDP
	slgAQvVRR3/s2uV/d6lPkuIlNVwbMC837bPhM8DsA7F08INegilG7vce66DToUIdqQl5kPtifRULr
	bEpBlxWOoADujfgHvTs/26QdH2EcWx3jSrkRsWhKDUu25hjMaY1UIFszVOSdWSKi6+Soxv+VF9BoY
	dlMeKcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtke-000000064U6-2OWa;
	Tue, 10 Jun 2025 07:50:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtiB-0000000647F-1xCw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 07:48:00 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 574032EC;
	Tue, 10 Jun 2025 09:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749541664;
	bh=b51keoelKKzth1odgCRNUV1Z6FySj2LHiGzcMDL7AiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=at/McZg3E4l7ZhmPDrIOKzUL3dOSMjSSjFr0m9sVsPl/DGEJhD/sffQ1JzfSXaHNi
	 teOAt95GmnZiIMfTwQ9EAu0GO/ldTrYBv5PsItaK+l/bXKx9EssMnx+e1j8lVqV4aK
	 5LYLpgkWkCR7V/xTnk8CNRW3zbTbtPr4wq9mQewo=
Date: Tue, 10 Jun 2025 10:47:39 +0300
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
Subject: Re: [PATCH 2/8] media: imx-mipi-csis: Fix field alignment in
 register dump
Message-ID: <20250610074739.GC24465@pendragon.ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-3-laurent.pinchart@ideasonboard.com>
 <12685072.O9o76ZdvQC@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12685072.O9o76ZdvQC@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_004759_827327_B7923DBF 
X-CRM114-Status: GOOD (  16.75  )
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

On Tue, Jun 10, 2025 at 09:12:26AM +0200, Alexander Stein wrote:
> Am Montag, 9. Juni 2025, 01:58:34 CEST schrieb Laurent Pinchart:
> > Commit 95a1379004cb ("media: staging: media: imx: imx7-mipi-csis: Dump
> > MIPI_CSIS_FRAME_COUNTER_CH0 register") forgot to increase the maximum
> > register name length, resulting in misalignment of names printed in the
> > kernel log. Fix it.
> 
> Does this warrant a Fixes tag? Anyway

I would then have to Cc stable as per the media subsystem rules, and I
really don't think this patch warrants being backported to stable
kernels.

> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index d59666ef7545..b652d59851c2 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -895,7 +895,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
> >  
> >  	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> >  		cfg = mipi_csis_read(csis, registers[i].offset);
> > -		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
> > +		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
> >  	}
> >  
> >  	pm_runtime_put(csis->dev);

-- 
Regards,

Laurent Pinchart

