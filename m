Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11363C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnGZHeRCKpUJbotxM5Y2WdaaRhD9+NAK46UZtUflgzE=; b=T6tmwkcppG0jEHIidisOZ6wPIW
	C0+eswg2dtjQ0tygG3cQzkX1c2+jtaLx+JlVBRW5JGrBliV3Fe/S9Zauoe4k3vzF8+kcO7zUdZ/rt
	xTHjp9OnL57dvH7FCO4xlLy6vn4sjMYvmIPx0CbHCJo6Kyki5d4CdKjKSoRQi0BTdloRkHw0hKuwe
	XDCnebKhB/eAmNjoyDohkWMoYthWMwN4Do/08X8fqxw+wkQjWfEgWtRxC80QE+mR+HVSA0fHGKqEY
	h/v7uI9gxJVjQOiWBHdNmORD92UeH1HVOD49qELfp5SVaPWUqSH+z914Nw6YVoWLLkHPA2suON+7o
	HnIvYmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrb2-0000000H0HI-01F2;
	Mon, 03 Aug 2026 12:16:44 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqray-0000000H0G6-385W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1785759394; bh=YYFD90m5so6A9XTI4F2KjgkyK7i3tZMuKU0gjw+/xxo=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=d7cBSibYeRaoiuQbfgChwVHHFRL1rN61EuS/9W7w4yWJxgwmZKbnCO2qEV7g5qnm3
	 rEKjwKQg/7ORITk5newcbrPSsN4WcoZ5sSMCHhW6OOxYch5+u/e0Lq940GdsEwhC4n
	 q1POPLO2guzGhba30dPOecXC1LyTpJAiH2T9Ltzw=
Date: Mon, 3 Aug 2026 14:16:33 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arash Golgol <arash.golgol@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 00/16] media: sun6i-csi/isp MC-centric support and
 cleanups
Message-ID: <w72t67p2sucsppxclldfbfenl6hzgwkru4rsvxenfta7duah7h@nbeim2a2ssjt>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arash Golgol <arash.golgol@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260518102451.417971-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_051641_399358_51A231AA 
X-CRM114-Status: GOOD (  25.00  )
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

Hi,

Just a heads up. I'm currently working on sun6i-isp support for A83T (so far all
the details seem to be turning out fully compatible with V3s), and I just
noticed this patch series. I'm basing my work on top of linux-next, which
doesn't have this series yet, sadly.

I'm working with YUYV input (because that's what I have currently on my A83T
tablet with HM5065 sensor - adding bayer output to it would be another can of
worms) and I re-organized the driver to support both the dual output mode
+ rotation (can be enabled on one output only at a time, due to HW limitations).

I also added missing pipeline blocks to the driver and statistics configuration
and buffer output (all very similar to how rkisp1 does this, which I have quite
a bit of experience with) + missing formats that thw HW supports.

So I'm pretty far into the whole re-debug on device process on this driver. :)

It would be nice if this series landed so I can submit my work without conflicts.
And I'm also sending this mail so that people know there's someone working on
this driver, to not duplicate work.

And it would be nice once I submit it if someone with bayer output sensor would
do the tests on ISP blocks that work with that (which are also part of my work
but will be untested).

Best regards,
	o.j.

On Mon, May 18, 2026 at 12:24:35PM +0200, Paul Kocialkowski wrote:
> This series first introduces some fixes and new formats to v4l2 format
> info, one of which we need for the sun6i-csi driver. Support for
> MC-centric format enumeration is then added, along with cleanups and
> improvements for both the sun6i-csi and sun6i-isp drivers.
> 
> The first 4 patches are already reviewed and ready to go and are
> included here as a reminder that this series depends on them.
> 
> Arash Golgol (4):
>   media: sun6i-csi: bridge: Use V4L2 subdev active state
>   media: sun6i-csi: capture: Implement vidioc_enum_framesizes
>   media: sun6i-mipi-csi2: Use V4L2 subdev active state
>   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> 
> Paul Kocialkowski (12):
>   media: v4l2-common: Fix NV15_4L4 format info block height
>   media: v4l2-common: Add missing tiled format info block sizes
>   media: v4l2-common: Add NV12_16L16 pixel format to v4l2 format info
>   media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
>   media: sun6i-csi: Split format validation to a dedicated helper
>   media: sun6i-csi: Add support for MC-centric format enumeration
>   media: sun6i-csi: Tidy up and unify coding style
>   media: sun6i-mipi-csi2: Fix parenthesis alignment
>   media: sun6i-isp: Add dummy params link_validate implementation
>   media: sun6i-isp: Use V4L2 subdev active state
>   media: sun6i-isp: Add support for MC-centric format enumeration
>   media: sun6i-isp: Add support for frame size enumeration
> 
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 153 +++++++---------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 168 +++++++++++++-----
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++-----
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
>  .../sun8i_a83t_mipi_csi2.c                    | 113 ++++++------
>  .../sun8i_a83t_mipi_csi2.h                    |   2 -
>  drivers/media/v4l2-core/v4l2-common.c         |  12 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  47 ++++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  37 +++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++------
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 -
>  13 files changed, 437 insertions(+), 341 deletions(-)
> 
> -- 
> 2.54.0
> 

