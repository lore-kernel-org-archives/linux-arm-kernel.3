Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3B6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oesbydI/I0lnhnjV7pOa6Q7h/y8kSYcYiGsG7NTor1o=; b=meuMuSzG7UIZbEbGOiIc2To5dD
	dJp66lUHB8abR7oyZJe/2HQuwiys7HR5xVsdP06Om3EuI5jbCMxeWMkVX7PQ0cCIovkFl0gdoA2bb
	vnSS9xhS25VoDHVPR1kafq/orYtN5aP3nlDgmoelI++aJwAPTmXIJ02Tc54Z7rhz8ryzdCdh/nwNl
	cVMB80rTbJfV0iaU1ugjhrCjTqDjIYutWnlwA+200Pn2IffDt2t4dyiIEqdvppzVHS+KBExh1T860
	0o0cZxU9Gepz7e9Y9IPID4Bl1tQlSZUcLUcM8s/ExrFTQaGPN3fces4BN+8yTMnuy5sslp//PEiNk
	rEkMYUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINgs-000000051vl-4BWJ;
	Mon, 10 Nov 2025 08:55:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINgr-000000051vc-0Vbs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C5EC60145;
	Mon, 10 Nov 2025 08:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9ABC19421;
	Mon, 10 Nov 2025 08:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762764956;
	bh=mSP+xIU4+FoO0L+fWKO5RP9XDBbobaBLZF91BFx8IRY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Tcrmv+F/8Xfl77PApi/kITQFytI+3zCBcPHxSZ+M7pPm/KuPwar5zGbDtuMNpxqFp
	 lBmOzP5doV4be+vEuV+8YwbfiEHnymUYtowVpX62rD2nWk5VqmvuoBQJqsX0ubsI07
	 aW6quyKtPXdpwr01C8lWhQk72GyZvdE/4OKJlgIdiZ6gGvY853WqNmk1gUaGJe1X4Q
	 Jt9iZq18ii+AOyGmQ0HjK6E0KrxoaYSEBlnBw/GE2lmTFv+hhjPwqaftGNmD2cVHmh
	 DPwCaJAIkqU+2HMWQWqtpGY09HI7+2s3Lz1ppb3BgvPC8cI4DAAb4AD7ARcbFMbwBG
	 06GRVgSS9/fPg==
Message-ID: <affa667c-2d26-44a6-b575-0b147b4af273@kernel.org>
Date: Mon, 10 Nov 2025 09:55:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 08/18] media: platform: microchip: Add new histogram
 submodule
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
 <3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Hans Verkuil <hverkuil@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20251009155251.102472-9-balamanikandan.gunasundar@microchip.com>
Content-Language: en-US, nl
In-Reply-To: <20251009155251.102472-9-balamanikandan.gunasundar@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/10/2025 17:52, Balamanikandan Gunasundar wrote:
> From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> 
> Add new histogram submodule driver to export raw histogram statistics
> and data to userspace.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  drivers/media/platform/microchip/Kconfig      |   2 +
>  drivers/media/platform/microchip/Makefile     |   2 +-
>  .../platform/microchip/microchip-isc-stats.c  | 549 ++++++++++++++++++
>  .../media/platform/microchip/microchip-isc.h  |  24 +
>  4 files changed, 576 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/microchip/microchip-isc-stats.c
> 
> diff --git a/drivers/media/platform/microchip/Kconfig b/drivers/media/platform/microchip/Kconfig
> index 4734ecced029..2864a57e2ff4 100644
> --- a/drivers/media/platform/microchip/Kconfig
> +++ b/drivers/media/platform/microchip/Kconfig
> @@ -10,6 +10,7 @@ config VIDEO_MICROCHIP_ISC
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_VMALLOC
>  	select REGMAP_MMIO
>  	select V4L2_FWNODE
>  	select VIDEO_MICROCHIP_ISC_BASE
> @@ -26,6 +27,7 @@ config VIDEO_MICROCHIP_XISC
>  	depends on VIDEO_DEV && COMMON_CLK
>  	depends on ARCH_AT91 || COMPILE_TEST
>  	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_VMALLOC
>  	select REGMAP_MMIO
>  	select V4L2_FWNODE
>  	select VIDEO_MICROCHIP_ISC_BASE
> diff --git a/drivers/media/platform/microchip/Makefile b/drivers/media/platform/microchip/Makefile
> index bd8d6e779c51..94c64d3d242c 100644
> --- a/drivers/media/platform/microchip/Makefile
> +++ b/drivers/media/platform/microchip/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  microchip-isc-objs = microchip-sama5d2-isc.o
>  microchip-xisc-objs = microchip-sama7g5-isc.o
> -microchip-isc-common-objs = microchip-isc-base.o microchip-isc-clk.o microchip-isc-scaler.o
> +microchip-isc-common-objs = microchip-isc-base.o microchip-isc-clk.o microchip-isc-scaler.o microchip-isc-stats.o
>  
>  obj-$(CONFIG_VIDEO_MICROCHIP_ISC_BASE) += microchip-isc-common.o
>  obj-$(CONFIG_VIDEO_MICROCHIP_ISC) += microchip-isc.o
> diff --git a/drivers/media/platform/microchip/microchip-isc-stats.c b/drivers/media/platform/microchip/microchip-isc-stats.c
> new file mode 100644
> index 000000000000..d7813c9d95ac
> --- /dev/null
> +++ b/drivers/media/platform/microchip/microchip-isc-stats.c
> @@ -0,0 +1,549 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Microchip ISC Driver - Statistics Subdevice
> + * Raw Histogram Export for Userspace Applications
> + *
> + * Copyright (C) 2025 Microchip Technology Inc.
> + *
> + * Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-vmalloc.h>
> +#include "microchip-isc-regs.h"
> +#include "microchip-isc.h"
> +
> +#define ISC_STATS_DEV_NAME	"microchip-isc_stats"
> +#define ISC_STATS_MIN_BUFS	2
> +#define ISC_STATS_MAX_BUFS	8
> +
> +/**
> + * struct isc_stat_buffer - Raw histogram statistics buffer structure
> + * @frame_number: Sequential frame number from capture
> + * @timestamp: Frame capture timestamp in nanoseconds
> + * @meas_type: Bitmask of measurement types available (ISC_CIF_ISP_STAT_*)
> + * @hist: Array of histogram data for each Bayer channel
> + * @hist.hist_bins: Raw 512-bin histogram data from hardware
> + * @hist.hist_min: Minimum pixel value observed in channel
> + * @hist.hist_max: Maximum pixel value observed in channel
> + * @hist.total_pixels: Total number of pixels processed in channel
> + * @valid_channels: Bitmask indicating which Bayer channels contain valid data
> + * @bayer_pattern: Current Bayer pattern configuration (CFA_BAYCFG_*)
> + * @reserved: Padding for future expansion and alignment
> + *
> + * This structure contains raw, unprocessed histogram data from the ISC
> + * hardware for all four Bayer channels (GR, R, GB, B). No algorithmic
> + * processing is performed - data is exported directly from hardware
> + * registers for userspace processing applications.
> + */
> +struct isc_stat_buffer {
> +	u32 frame_number;
> +	u64 timestamp;

Swap the two fields above to avoid introducing holes due to alignment problems.

> +	u32 meas_type;
> +
> +	struct {
> +		u32 hist_bins[HIST_ENTRIES];
> +		u32 hist_min;
> +		u32 hist_max;
> +		u32 total_pixels;
> +	} hist[HIST_BAYER];
> +
> +	u8 valid_channels;
> +	u8 bayer_pattern;
> +	u16 reserved[2];
> +} __packed;

After swapping those two fields you probably can drop __packed, but I'm not certain.
It's probably a good idea to check with the pahole utility if there are no holes in
this structure.

This structure must be part of include/uapi/linux/, probably
include/uapi/linux/media/microchip/something.h

Userspace must have access to this, otherwise it can't parse the metadata. Note
that that also means that the HIST_ENTRIES and HIST_BAYER/ISC_HIS_CFG_MODE_B
defines are in that uapi include as well.

> +
> +/* Statistics measurement type flags */
> +#define ISC_CIF_ISP_STAT_HIST		BIT(0)
> +

Regards,

	Hans

