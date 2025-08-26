Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E04CA0FFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 06:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmPrC6RLqKDaaWeLA3waA4ez4/soGl+WWDcRydsis9A=; b=SKp0GClgOA4Ca0L4RaVoH1yQmd
	aLlRhi7WqtlWO1kAz8eDFN0wY/B6Qpn73vxND/2HweU9/P5x1bHiA5MnXt9nZWq6gy3qFzFRspwkJ
	dEckRBmSDBvkxFcRMjp33HVNpTvtha/8p/G1Zm8s7AcXZlMPKkI3t8uTxhy3sUKNZdg5uCB9oZLjG
	qEB9/yIvHEox1BOn1bVCdAyJ22k8kT/L8DB6NWUbk4AvChrYJgYdMsoumwfwqmxlpacqAnbZer9TX
	6Gp+AdkkM7DlydFUb7v/nw3rw/WXCSEkdNJcbfY/7De2FqEAXASxwC6zJR1qVEtlU5xfPtsevYgsh
	rFI/tOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnZU-0000000AlR0-2B64;
	Tue, 26 Aug 2025 06:54:20 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn3m-0000000AgBz-2f2p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 06:21:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afcb7af30a5so889303866b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 23:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756189293; x=1756794093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xmPrC6RLqKDaaWeLA3waA4ez4/soGl+WWDcRydsis9A=;
        b=rP3a9NDkARDxCxMevA0JaGH8OKCMlRnPjQwv2ENsWG10CqrmucGgCJQI0c/rxxexVM
         1BPwFi7zXMWtcjujefGSfS2fC2pYLPunqO7WlMw8I9Zg5XszF4+3eSXZrBp1aY8KXYUn
         H1PCKaqE4O2Me9I+pOqqR9MRzSDAFwwoO3MVRGz0x3PgqL8K1vH69ZPdXMuQAXSqV9ZQ
         Mk5uNgiI7wyKqtsY7oJih14k5DIC5/Mi1BIOi5yvhAYxLPQs6fxU8zA3hFe7twOjAU4G
         02l7DNDLAb7B6c0R3WuBb1SO/mNopyT3sEs5shqO0897fAABZP2IiMTv4ssfwy+g1uCW
         l0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756189293; x=1756794093;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmPrC6RLqKDaaWeLA3waA4ez4/soGl+WWDcRydsis9A=;
        b=kzmaAzKuPc9i/KPFicEtinqfvx1rt2jCwoiZVyajxQhlFqyJ6/YqCqyGYjjGlqK7WZ
         Kx/x9xSf6CuSQXBmBmd5Zu0cnHz9uNHcBM0diu0AFWKjE1oWAP0bzs+k22kX8RU2LWXj
         aC7htEODfJpaoHzC2UmHuIKjQ7AUhHBNZbnIbWpTsFkErHP/jHYlKeocNMM3zlr1+g0S
         goWiwvw41coIOYD5fXyi2kdjuzmSLXJaNJP3ZUAxpWFaBmawju9smGPMgTLxm/YK81X3
         hmGA6bOXsj3RHlccpVG/byXkZalyvYk8qk1eF//7aNqabt6m0qYH2KBSi4OvClQgU6vF
         ArtA==
X-Forwarded-Encrypted: i=1; AJvYcCUIwBettt4W/gXdnjEkaqBGYbfyq7UiZ+ani/7duJ32S57kDlw2Osjl2wZT3kF7stT5fFYSWrg3d96j+A+GBUNR@lists.infradead.org
X-Gm-Message-State: AOJu0YxxZZwmDrOREXoxsOGIghQaEaXnJOAarWL5kWyZZktLgbUXemG+
	1nJbplk3meCQpbRb/T0u6v2S2ZBMJ7cRtlp/EcyKCwaqRW5232RbBP/Z+fIpjI0wIeE=
X-Gm-Gg: ASbGncunWnYlsyby5iNKclqHXHTeMe14GdR3zwUtb3WgnRurMyaEs5aKX/AYCqTNi8z
	fBhc+Sqt6RYtytSuqp9SQJD0NBFjYvphb+oigJOInrNAHGluWu994TNhow/iNDib2UOMS4IeOdc
	yMP1OLl4fHhPuSDfhHUfvEsNBCXHBe0gmoOzgPOiSsITmJeSC9MqRPMI0V9FYmZVtxnyFNdT8w+
	RFi93R8yBBndTezBjXVkFTG0N7jvXeT78vHQ4xwhqXYs/u025VBStgOXSv1BXP3Cxs0FLxiN/Gu
	UX/azvg6M3bGWVPRzc87nLxdkjv4RFI+0lTvjhw62cGdnE1UYUZjfJD7IBAGA8DRzPzGdTr2Uz9
	x5n5SA1nzgA6hy5IKfneRBJvcXx3RXy9mAanIQCe734nzqzJKXpcsHQiTGSHkuWtCauuFVosWEW
	NSqvTLe1OX0IpIM63veKsWrcjEkD5S8mLQoQLfnJUTmQ==
X-Google-Smtp-Source: AGHT+IHzVnY1Ky25snBBD+5kBo+Y7iKRkvMqNvIASdXROfIkU6dmKjbIRPQnNtwnxU8IgSF+rC/o+Q==
X-Received: by 2002:a17:907:9486:b0:afa:1a67:e012 with SMTP id a640c23a62f3a-afe28f86573mr1198185166b.8.1756189292533;
        Mon, 25 Aug 2025 23:21:32 -0700 (PDT)
Received: from [172.31.14.217] (static-243-216-117-93.thenetworkfactory.nl. [93.117.216.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe91744c66sm219238766b.88.2025.08.25.23.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 23:21:31 -0700 (PDT)
Message-ID: <3b4173cb-655d-48ea-b86a-a036f666cf40@linaro.org>
Date: Tue, 26 Aug 2025 08:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/13] media: rockchip: add a driver for the rockchip
 camera interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-6-62d8a7b209b4@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v10-6-62d8a7b209b4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_232134_749062_EABB740B 
X-CRM114-Status: GOOD (  29.32  )
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

On 19/08/2025 00:25, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
> in different variations. For example, the PX30 Video Input Processor (VIP)
> is able to receive video data via the Digital Video Port (DVP, a parallel
> data interface) and transfer it into system memory using a
> double-buffering mechanism called ping-pong mode.
> The RK3568 Video Capture (VICAP) unit, on the other hand, features a DVP
> and a MIPI CSI-2 receiver that can receive video data independently
> (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and a data path multiplexer (to scaler units, to ISP, ...).
> 
> Add a basic media controller centric V4L2 driver for the Rockchip CIF with
>   - support for the PX30 VIP
>   - support for the RK3568 VICAP DVP
>   - abstraction for the ping-pong scheme to allow for future extensions
>   - abstraction for the INTERFACE and CROP parts to allow for future
>     extensions
> 
> [PX30 VIP support v1-v5]
> Co-developed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [PX30 VIP support v6-v13]
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> [added RK3568 VICAP DVP support]
> [refactored to media controller centric driver, added mplane support]
> Co-developed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   MAINTAINERS                                        |   1 +
>   drivers/media/platform/rockchip/Kconfig            |   1 +
>   drivers/media/platform/rockchip/Makefile           |   1 +
>   drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
>   drivers/media/platform/rockchip/rkcif/Makefile     |   7 +
>   .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 864 +++++++++++++++++++++
>   .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
>   .../platform/rockchip/rkcif/rkcif-capture-mipi.c   |  27 +
>   .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  20 +
>   .../media/platform/rockchip/rkcif/rkcif-common.h   | 220 ++++++
>   drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 301 +++++++
>   .../platform/rockchip/rkcif/rkcif-interface.c      | 423 ++++++++++
>   .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
>   drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 132 ++++
>   .../media/platform/rockchip/rkcif/rkcif-stream.c   | 637 +++++++++++++++
>   .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
>   16 files changed, 2737 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2ac4b7a5b255..419d89a4e452 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21770,6 +21770,7 @@ S:	Maintained
>   F:	Documentation/admin-guide/media/rkcif*
>   F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>   F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +F:	drivers/media/platform/rockchip/rkcif/
>   
>   ROCKCHIP CRYPTO DRIVERS
>   M:	Corentin Labbe <clabbe@baylibre.com>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> index 9bbeec4996aa..ba401d32f01b 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -3,5 +3,6 @@
>   comment "Rockchip media platform drivers"
>   
>   source "drivers/media/platform/rockchip/rga/Kconfig"
> +source "drivers/media/platform/rockchip/rkcif/Kconfig"
>   source "drivers/media/platform/rockchip/rkisp1/Kconfig"
>   source "drivers/media/platform/rockchip/rkvdec/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
> index 286dc5c53f7e..0e0b2cbbd4bd 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y += rga/
> +obj-y += rkcif/
>   obj-y += rkisp1/
>   obj-y += rkvdec/
> diff --git a/drivers/media/platform/rockchip/rkcif/Kconfig b/drivers/media/platform/rockchip/rkcif/Kconfig
> new file mode 100644
> index 000000000000..efd82ac35bd8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/Kconfig
> @@ -0,0 +1,18 @@
> +config VIDEO_ROCKCHIP_CIF
> +	tristate "Rockchip Camera Interface (CIF)"
> +	depends on VIDEO_DEV
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on PM && COMMON_CLK
> +	select MEDIA_CONTROLLER
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a driver for Rockchip Camera Interface (CIF). It is featured
> +	  in many Rockchips SoCs in different variations, such as the PX30
> +	  Video Input Processor (VIP, one Digital Video Port (DVP)) or the
> +	  RK3568 Video Capture (VICAP, one DVP, one MIPI CSI-2 receiver) unit.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-cif.
> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
> new file mode 100644
> index 000000000000..818424972c7b
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
> +rockchip-cif-objs += rkcif-dev.o \
> +	rkcif-capture-dvp.o \
> +	rkcif-capture-mipi.o \
> +	rkcif-interface.o \
> +	rkcif-stream.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> new file mode 100644
> index 000000000000..6b463d232283
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> @@ -0,0 +1,864 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "rkcif-capture-dvp.h"
> +#include "rkcif-common.h"
> +#include "rkcif-interface.h"
> +#include "rkcif-regs.h"
> +#include "rkcif-stream.h"
> +
> +static const struct rkcif_output_fmt dvp_out_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV16M,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV61,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV61M,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12M,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21M,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
> +			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
> +		.cplanes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_RGB24,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_RGB565,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_BGR666,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB8,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG8,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG8,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR8,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB10,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG10,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG10,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR10,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SRGGB12,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGRBG12,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SGBRG12,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR12,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_SBGGR16,
> +		.cplanes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_Y16,
> +		.cplanes = 1,
> +	},
> +};
> +
> +static const struct rkcif_input_fmt px30_dvp_in_fmts[] = {
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	}
> +};
> +
> +const struct rkcif_dvp_match_data rkcif_px30_vip_dvp_match_data = {
> +	.in_fmts = px30_dvp_in_fmts,
> +	.in_fmts_num = ARRAY_SIZE(px30_dvp_in_fmts),
> +	.out_fmts = dvp_out_fmts,
> +	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
> +	.has_scaler = true,
> +	.regs = {
> +		[RKCIF_DVP_CTRL] = 0x00,
> +		[RKCIF_DVP_INTEN] = 0x04,
> +		[RKCIF_DVP_INTSTAT] = 0x08,
> +		[RKCIF_DVP_FOR] = 0x0c,
> +		[RKCIF_DVP_LINE_NUM_ADDR] = 0x10,
> +		[RKCIF_DVP_FRM0_ADDR_Y] = 0x14,
> +		[RKCIF_DVP_FRM0_ADDR_UV] = 0x18,
> +		[RKCIF_DVP_FRM1_ADDR_Y] = 0x1c,
> +		[RKCIF_DVP_FRM1_ADDR_UV] = 0x20,
> +		[RKCIF_DVP_VIR_LINE_WIDTH] = 0x24,
> +		[RKCIF_DVP_SET_SIZE] = 0x28,
> +		[RKCIF_DVP_SCL_CTRL] = 0x48,
> +		[RKCIF_DVP_FRAME_STATUS] = 0x60,
> +		[RKCIF_DVP_LAST_LINE] = 0x68,
> +		[RKCIF_DVP_LAST_PIX] = 0x6c,
> +	},
> +};
> +
> +static const struct rkcif_input_fmt rk3568_dvp_in_fmts[] = {
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
> +		.fmt_type = RKCIF_FMT_TYPE_YUV,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
> +			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
> +			       RKCIF_FORMAT_BT1120_YC_SWAP |
> +			       RKCIF_FORMAT_INPUT_MODE_BT1120,
> +		.field = V4L2_FIELD_INTERLACED,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +	{
> +		.mbus_code = MEDIA_BUS_FMT_Y12_1X12,
> +		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
> +			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
> +		.fmt_type = RKCIF_FMT_TYPE_RAW,
> +		.field = V4L2_FIELD_NONE,
> +	},
> +};
> +
> +static void rk3568_dvp_grf_setup(struct rkcif_device *rkcif)
> +{
> +	u32 con1 = RK3568_GRF_WRITE_ENABLE(RK3568_GRF_VI_CON1_CIF_DATAPATH |
> +					   RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM);
> +
> +	if (!rkcif->grf)
> +		return;
> +
> +	con1 |= rkcif->interfaces[RKCIF_DVP].dvp.dvp_clk_delay &
> +		RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM;
> +
> +	if (rkcif->interfaces[RKCIF_DVP].vep.bus.parallel.flags &
> +	    V4L2_MBUS_PCLK_SAMPLE_DUALEDGE)
> +		con1 |= RK3568_GRF_VI_CON1_CIF_DATAPATH;
> +
> +	regmap_write(rkcif->grf, RK3568_GRF_VI_CON1, con1);
> +}
> +
> +const struct rkcif_dvp_match_data rkcif_rk3568_vicap_dvp_match_data = {
> +	.in_fmts = rk3568_dvp_in_fmts,
> +	.in_fmts_num = ARRAY_SIZE(rk3568_dvp_in_fmts),
> +	.out_fmts = dvp_out_fmts,
> +	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
> +	.setup = rk3568_dvp_grf_setup,
> +	.has_scaler = false,
> +	.regs = {
> +		[RKCIF_DVP_CTRL] = 0x00,
> +		[RKCIF_DVP_INTEN] = 0x04,
> +		[RKCIF_DVP_INTSTAT] = 0x08,
> +		[RKCIF_DVP_FOR] = 0x0c,
> +		[RKCIF_DVP_LINE_NUM_ADDR] = 0x2c,
> +		[RKCIF_DVP_FRM0_ADDR_Y] = 0x14,
> +		[RKCIF_DVP_FRM0_ADDR_UV] = 0x18,
> +		[RKCIF_DVP_FRM1_ADDR_Y] = 0x1c,
> +		[RKCIF_DVP_FRM1_ADDR_UV] = 0x20,
> +		[RKCIF_DVP_VIR_LINE_WIDTH] = 0x24,
> +		[RKCIF_DVP_SET_SIZE] = 0x28,
> +		[RKCIF_DVP_CROP] = 0x34,
> +		[RKCIF_DVP_FRAME_STATUS] = 0x3c,
> +		[RKCIF_DVP_LAST_LINE] = 0x44,
> +		[RKCIF_DVP_LAST_PIX] = 0x48,
> +	},
> +};
> +
> +static inline unsigned int rkcif_dvp_get_addr(struct rkcif_device *rkcif,
> +					      unsigned int index)
> +{
> +	if (WARN_ON_ONCE(index >= RKCIF_DVP_REGISTER_MAX))
> +		return RKCIF_REGISTER_NOTSUPPORTED;
> +
> +	return rkcif->match_data->dvp->regs[index];
> +}
> +
> +static inline __maybe_unused void rkcif_dvp_write(struct rkcif_device *rkcif,
> +						  unsigned int index, u32 val)
> +{
> +	unsigned int addr = rkcif_dvp_get_addr(rkcif, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return;
> +
> +	writel(val, rkcif->base_addr + addr);
> +}
> +
> +static inline __maybe_unused u32 rkcif_dvp_read(struct rkcif_device *rkcif,
> +						unsigned int index)
> +{
> +	unsigned int addr = rkcif_dvp_get_addr(rkcif, index);
> +
> +	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
> +		return 0;
> +
> +	return readl(rkcif->base_addr + addr);
> +}
> +
> +static void rkcif_dvp_queue_buffer(struct rkcif_stream *stream,
> +				   unsigned int index)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	struct rkcif_buffer *buffer = stream->buffers[index];
> +	u32 frm_addr_y, frm_addr_uv;
> +
> +	frm_addr_y = index ? RKCIF_DVP_FRM1_ADDR_Y : RKCIF_DVP_FRM0_ADDR_Y;
> +	frm_addr_uv = index ? RKCIF_DVP_FRM1_ADDR_UV : RKCIF_DVP_FRM0_ADDR_UV;
> +
> +	rkcif_dvp_write(rkcif, frm_addr_y, buffer->buff_addr[RKCIF_PLANE_Y]);
> +	rkcif_dvp_write(rkcif, frm_addr_uv, buffer->buff_addr[RKCIF_PLANE_UV]);
> +}
> +
> +static int rkcif_dvp_start_streaming(struct rkcif_stream *stream)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	struct rkcif_interface *interface = stream->interface;
> +	struct v4l2_mbus_config_parallel *parallel;
> +	struct v4l2_mbus_framefmt *source_fmt;
> +	struct v4l2_subdev_state *state;
> +	const struct rkcif_input_fmt *active_in_fmt;
> +	const struct rkcif_output_fmt *active_out_fmt;
> +	u32 val = 0;
> +	int ret = -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
> +	source_fmt = v4l2_subdev_state_get_format(state, RKCIF_IF_PAD_SRC,
> +						  stream->id);
> +	if (!source_fmt)
> +		goto out;
> +
> +	active_in_fmt = rkcif_interface_find_input_fmt(interface, false,
> +						       source_fmt->code);
> +	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
> +						      stream->pix.pixelformat);
> +	if (!active_in_fmt || !active_out_fmt)
> +		goto out;
> +
> +	parallel = &interface->vep.bus.parallel;
> +	if (parallel->bus_width == 16 &&
> +	    (parallel->flags & V4L2_MBUS_PCLK_SAMPLE_DUALEDGE))
> +		val |= RKCIF_FORMAT_BT1120_CLOCK_DOUBLE_EDGES;
> +	val |= active_in_fmt->dvp_fmt_val;
> +	val |= active_out_fmt->dvp_fmt_val;
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_FOR, val);
> +
> +	val = stream->pix.width;
> +	if (active_in_fmt->fmt_type == RKCIF_FMT_TYPE_RAW)
> +		val = stream->pix.width * 2;
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_VIR_LINE_WIDTH, val);
> +
> +	val = RKCIF_XY_COORD(stream->pix.width, stream->pix.height);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_SET_SIZE, val);
> +
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, RKCIF_FRAME_STAT_CLS);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, RKCIF_INTSTAT_CLS);
> +	if (rkcif->match_data->dvp->has_scaler) {
> +		val = active_in_fmt->fmt_type == RKCIF_FMT_TYPE_YUV ?
> +			      RKCIF_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS :
> +			      RKCIF_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS;
> +		rkcif_dvp_write(rkcif, RKCIF_DVP_SCL_CTRL, val);
> +	}
> +
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_INTEN,
> +			RKCIF_INTEN_FRAME_END_EN |
> +			RKCIF_INTEN_PST_INF_FRAME_END_EN);
> +
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
> +			RKCIF_CTRL_AXI_BURST_16 | RKCIF_CTRL_MODE_PINGPONG |
> +			RKCIF_CTRL_ENABLE_CAPTURE);
> +
> +	ret = 0;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +}
> +
> +static void rkcif_dvp_stop_streaming(struct rkcif_stream *stream)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u32 val;
> +
> +	val = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);

This dvp_read stuff looks a bit funny to me, you have a lookup which can 
return 0 for unknown registers.

Probably not the case with a control register like this one but, for 
argument sake if RKCIF_DVP_CTRL was not a valid register i.e. 
rkcif_dvp_read() would return 0 and you'd still act on that data to 
write back to an unkown register.

Would you not be better off having say callbacks to contain cases where 
registers are potentially not present

ops->update_maybe_not_present_reg();

followed by writes to registers that would alawys be there ?
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
> +			val & (~RKCIF_CTRL_ENABLE_CAPTURE));
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_INTEN, 0x0);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, 0x3ff);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, 0x0);
> +
> +	stream->stopping = false;
> +}
> +
> +static void rkcif_dvp_reset_stream(struct rkcif_device *rkcif)
> +{
> +	u32 ctl = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
> +
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
> +			ctl & (~RKCIF_CTRL_ENABLE_CAPTURE));
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL, ctl | RKCIF_CTRL_ENABLE_CAPTURE);
> +}
> +
> +static void rkcif_dvp_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
> +{
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u32 val;
> +
> +	val = RKCIF_XY_COORD(left, top);
> +	rkcif_dvp_write(rkcif, RKCIF_DVP_CROP, val);
> +}
> +
> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
> +{
> +	struct device *dev = ctx;
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +	struct rkcif_stream *stream;
> +	u32 intstat, lastline, lastpix, cif_frmst;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (!rkcif->match_data->dvp)
> +		return ret;

Wouldn't you be better off conditionally registering your ISR if 
match_data->dvp is true instead ?

> +
> +	intstat = rkcif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
> +	cif_frmst = rkcif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
> +	lastline = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
> +	lastpix = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
> +
> +	if (intstat & RKCIF_INTSTAT_FRAME_END) {
> +		rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
> +				RKCIF_INTSTAT_FRAME_END_CLR |
> +				RKCIF_INTSTAT_LINE_END_CLR);
> +
> +		stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
> +
> +		if (stream->stopping) {
> +			rkcif_dvp_stop_streaming(stream);
> +			wake_up(&stream->wq_stopped);
> +			ret = IRQ_HANDLED;
> +			goto out;
> +		}
> +
> +		if (lastline != stream->pix.height) {
> +			v4l2_err(&rkcif->v4l2_dev,
> +				 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
> +				 intstat, cif_frmst, lastpix, lastline);
> +
> +			rkcif_dvp_reset_stream(rkcif);
> +		}
> +
> +		rkcif_stream_pingpong(stream);
> +
> +		ret = IRQ_HANDLED;
> +	}
> +out:
> +	return ret;
> +}
> +
> +int rkcif_dvp_register(struct rkcif_device *rkcif)
> +{
> +	struct rkcif_interface *interface;
> +	unsigned int streams_num;
> +	int ret;
> +
> +	if (!rkcif->match_data->dvp)
> +		return 0;

If you don't register the device when match_data->dvp is false, then I 
think you can relax the carry-on checks elsewhere on match_data->dvp, 
not including dvp_unregister

The rest of the file as I breifly skim it looks OK to me, its a bit big 
though.

Would it be possible to break this patch up a little bit ? Might make it 
easier for other reviewers to give an SoB for smaller chunks.

---
bod

