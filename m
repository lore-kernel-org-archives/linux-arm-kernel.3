Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42506C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 08:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWY+AWRf4N1y6vHDhWTzZcLQ1NRv+ri7LVHDz6yoIxU=; b=UHdJMCd9gHb+p9NyTOtcsGuec5
	6eCsMRkgxL2SXaaAzj2z6BXRRmAQJS6C9IqbCNW2vWPgCsq8XQEvcbNu5CQG2lLtSPuVA7JZX3RLO
	IsFADwiF3GgHWNYHf2qzkzh97pNuHwbOZq1ZPDo2KbKbzF/vcT17vsWPlHBTj01Kb8g5Vx8tG6RIW
	EBx1x5gH+5H4EC5fRIHgoiWAm6YWch5o6h4MPcvbP34GNj/KO3TcnQ2Ng/t79j2voll78lixep0Uo
	encGihGXPkPFxhcr+StnL982l0aLBMmwPJJZ0MFeOPNrn97A3XiP8T/n+0Asxta2aPk3R5Nj2NDWu
	jqoYYC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHD7-0000000GilY-3W3w;
	Thu, 16 Jul 2026 08:12:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHD5-0000000GikO-1TiC;
	Thu, 16 Jul 2026 08:12:49 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D0D0229;
	Thu, 16 Jul 2026 10:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784189506;
	bh=LivpDofR2GjShcPPFrnyQZM3szTo6R+sA8u1Jcpn8wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQHH1nmtYI3m171IeP6v/ILfO8ETUOn0iLZ4BWAK30ug19JQPVHbGaZvK0nT6pdAr
	 c8DunkCH7YcqNv97HeTnYRHhwRxCdZY81oJe1aRRWvtxcr6D77ENgTgpTLPqUCGfhv
	 mzg+LjoIyHhkfebwp/+eIoJeSqwA1SHji5ohotyo=
Date: Thu, 16 Jul 2026 11:12:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@redhat.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
Message-ID: <20260716081240.GA1837346@killaraus.ideasonboard.com>
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
 <178046930079.1525445.16102733967737177325@freya>
 <bb075afb-56bf-4cea-9732-f2613feb88d1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb075afb-56bf-4cea-9732-f2613feb88d1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_011247_540656_0F39B8EB 
X-CRM114-Status: GOOD (  27.71  )
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

On Thu, Jul 16, 2026 at 10:22:03AM +0300, Eugen Hristev wrote:
> On 6/3/26 09:48, Jai Luthra wrote:
> > Quoting Eugen Hristev (2026-05-20 21:07:00)
> >> The commit
> >> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> >> introduced a check to see whether the format requested is the same as the
> >> fourcc in the format list.
> >>
> >> However, this breaks the case when userspace requested an unpacked fourcc,
> >> e.g. RG10.
> >>
> >> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
> >> on what userspace requests.
> >> In the unpacking case, a dedicated register is being set.
> >>
> >> If the userspace requests pRAA, this works, because the check validates the
> >> pipeline:
> >>
> >> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
> >>  --stream-mmap --stream-count=1 --stream-to=frame.raw
> >>
> >> but, with
> >> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
> >> --stream-mmap --stream-count=1 --stream-to=frame.raw
> >>
> >> unicam complains at validation level:
> >>
> >> image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)
> >>
> >> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
> >> RG10 or pRAA depending on the packing register.
> >>
> >> To fix this, modified the condition check to also allow in the case when
> >> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
> >>
> >> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> >> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> >> ---
> >>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> index 8d28ba0b59a3..cc7627e9a51a 100644
> >> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
> >>                  * In order to allow the applications using the old behaviour to
> >>                  * run, let's accept the old combination, but warn about it.
> >>                  */
> >> -               if (fmtinfo->fourcc != fmt->pixelformat) {
> >> +               if (fmt->pixelformat != fmtinfo->fourcc &&
> >> +                   fmt->pixelformat != fmtinfo->unpacked_fourcc) {
> >>                         if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
> >>                              format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
> >>                             (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
> >>
> > 
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > 
> 
> Hi Sakari,
> 
> I saw you taking some of the patches on unicam, this one is the most
> important as all unpacked formats are basically broken for a very long
> time (months) and the patch is pending for quite some time.
> 
> This should also go in stable as some older versions also affected.

The commit message should include

Cc: stable@vger.kernel.org

after the Fixes: tag. Sakari can likely add that when applying.

> >> ---
> >> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> >> change-id: 20260520-bcmpi-2c4850314e21

-- 
Regards,

Laurent Pinchart

