Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BC9CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3w1QySXOxE83J1koPTF0hVjdJ+1GJgOp9gN4Amawo6s=; b=CmXf2e8qk3TFcQvQgSKSTRcONu
	2gDGjnvl7NuLVysdVn7+J0W8eHF32PLlS3dwkYiD0erd3iajxLGsLVeg02vhRJVhEqsUoFKnKqJPd
	JQW4lnxSg9DXf4sXxbcUKDkB6aKnBmmrtzX3S57ClG52FEtzz9ijTG1z6sBgEKQX+twZbdk3kQV6Y
	HOpE4bfNobFv0/KohZAw42Kf6n/3inqSRR4MfScFrx2Npim8IVfZKPqM8lI9syszS3gO2O7gmekqV
	qX0EAVhRI3Ck9CRNUrgkcyYlxcdlfveS5RqPwigNqO1vHW2Mrrf5z8NoC+G9dS4+Hf6b0kAFV6Due
	olSIPP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CFj-00000008RRC-2tv2;
	Fri, 10 Oct 2025 12:29:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CFg-00000008RPf-3VSJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:29:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso18710825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760099379; x=1760704179; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3w1QySXOxE83J1koPTF0hVjdJ+1GJgOp9gN4Amawo6s=;
        b=oJjj647RKdayjZWhBJeMC4xL2B4ZCPjOFDcPXMx4W0vcqR9gtNg8/+xCV7YaM+U3yl
         vR57c58+AGBc7ypylyap3sAaqPxrkUqdtLlWGchjeXASIKuPNIli0Go+d/Z/wU0OmMvQ
         6n7VpGhHBLXYSpTn5SuXFPayoEKhCNTQ62dJwjYbREtZznB3eakIM4qMWbTA5asDNI9v
         xQAQFyNvNoGPLT1Lz5ctNU+2vLEhPibAsHxMUCiiOg1c3zRW7LefJEIhhF2BKyTs+F6p
         c22svedWo16jq061CJPPD6bTuFqeapcAiNhf6ny94veclFjX0NJW2MITXdX0K8TlIYcP
         nrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760099379; x=1760704179;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3w1QySXOxE83J1koPTF0hVjdJ+1GJgOp9gN4Amawo6s=;
        b=AHcwG3nO2pbQviDKasDQ1B1cKx4Co4xLn7XFwcrd4XN0iMLdykPDcHtxZOHBw3YUKt
         THUVh288c5+mdHo1Tuaqj/Hb83C0dBD7hsGUbn3H+1h8zN0tpumWR1Tmo3R8zkHhUKsV
         mFgY8+T8/E/uazh6phclct4hnrZ4k2xI7Ki2OmPLA5qVu6U6puB0OQ3FJElii/0nbCb1
         aSX1hxeWxIKc721Lgpry2PZPDtHOruA+/MJdb2BsQc/5JgZBUmcA9viwggYYF2cSQ7FW
         7MFlPrfk5NzOI8NUhPi/luvtqZPPhgdHGzon/XvKX8/vwXZud5Ky9y8WqCV3PDiyFUcp
         UsLg==
X-Forwarded-Encrypted: i=1; AJvYcCWJKKA7fruOhhY8KSlb1HjaRKvawrvDEvAdITYh9nhfF4lGcIvpssLtojoOXHc5Kq+AOal8TBv1rWz7fXxMuCm4@lists.infradead.org
X-Gm-Message-State: AOJu0YyqJpq/6EO2EKyyaJbN2+Oyf+ZExMzf18Xq1u4oFJl/qyhAA/mR
	n0WnYFfS92aizyvJIywqlrslvDzIP/Zfp1oA+mvsS6W+JdAyWOE8Edxo1d/h5OVs/7Q=
X-Gm-Gg: ASbGncvocA0RM0K4n30qRXT+6Mvd6YohE9iz4yEPghqrDpFG7kS2xZarP1tWITcqALq
	WfEyL6lF1niyUqcdFl6Mft1DLhbs4OzIDafzgHd6x/iEFWxqte1Sbig73xUngpX4iUaKiG6kssb
	qon/ZBIcJ5FX90TpysdJ6QbtKR839KsTkiKujKwHvZulh20k2kn6si3qBXLy3P5zTfQMr3ZKMWQ
	LqpcP0GmNbwibaafzHDLDcPCF/evqI0DYotOqQHC+FannaoJQ5HqNMDf/xd50euFChVqCk7rd1b
	XfuAXyFsqs6uRvnDi+pqQJ+mMrrcCHD3Idtdpfy1G3l38Mw33ka1warJlwZe/O43ecddB8yku2Y
	pLYnEbvijRpB6rRGVVdQ9vSupmiFI8kd/E2hpll64ctvpYA5GlzrVe62cTHbbv2FIM+OwWf7uK0
	WUKhzpux9y1cs=
X-Google-Smtp-Source: AGHT+IEsmJvk1TuMXpoF/rJEyUw87VcT0HAXOJZSIzYvKCNNpSch1dQqLO+7LaTWng/7o1RmEwIb4g==
X-Received: by 2002:a05:600c:698c:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-46fb405319amr30820345e9.12.1760099378806;
        Fri, 10 Oct 2025 05:29:38 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3520sm62462375e9.2.2025.10.10.05.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 05:29:38 -0700 (PDT)
Message-ID: <7c563a39-cdec-487b-afc5-c88d94475aad@linaro.org>
Date: Fri, 10 Oct 2025 13:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/17] media: rockchip: add driver for the rockchip
 camera interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <GTZBnEB6M3avDjHcPfe-Xk1msGrNz3ak2dcuD9K66qXTkJ82qAfdO76PxK5HjR8bbrH6s_OXa9GwefBJAYsxPQ==@protonmail.internalid>
 <20240220-rk3568-vicap-v11-7-af0eada54e5d@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v11-7-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_052941_037767_E31FF0D8 
X-CRM114-Status: GOOD (  32.87  )
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

On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add the skeleton for a media controller centric V4L2 driver for the
> Rockchip Camera Interface (CIF).
> The skeleton features support for the PX30 Video Input Processor (VIP)
> and the RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   MAINTAINERS                                        |   1 +
>   drivers/media/platform/rockchip/Kconfig            |   1 +
>   drivers/media/platform/rockchip/Makefile           |   1 +
>   drivers/media/platform/rockchip/rkcif/Kconfig      |  18 ++
>   drivers/media/platform/rockchip/rkcif/Makefile     |   4 +
>   .../media/platform/rockchip/rkcif/rkcif-common.h   |  54 +++++
>   drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 260 +++++++++++++++++++++
>   7 files changed, 339 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a18421a53a1..6c023dc54ece 100644
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
> index 2f6f77afecfc..54b698c4cd2c 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -3,6 +3,7 @@
>   comment "Rockchip media platform drivers"
> 
>   source "drivers/media/platform/rockchip/rga/Kconfig"
> +source "drivers/media/platform/rockchip/rkcif/Kconfig"
>   source "drivers/media/platform/rockchip/rkcsi/Kconfig"
>   source "drivers/media/platform/rockchip/rkisp1/Kconfig"
>   source "drivers/media/platform/rockchip/rkvdec/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
> index 33e24b47735c..522a7d3e30b0 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y += rga/
> +obj-y += rkcif/
>   obj-y += rkcsi/
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
> index 000000000000..c6837ed2f65c
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
> +
> +rockchip-cif-objs += rkcif-dev.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> new file mode 100644
> index 000000000000..43a9390526d8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_COMMON_H
> +#define _RKCIF_COMMON_H
> +
> +#include <linux/clk.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define RKCIF_DRIVER_NAME "rockchip-cif"
> +#define RKCIF_CLK_MAX	  4
> +
> +struct rkcif_remote {
> +	struct v4l2_async_connection async_conn;
> +	struct v4l2_subdev *sd;
> +};
> +
> +struct rkcif_match_data {
> +	const char *const *clks;
> +	unsigned int clks_num;
> +};
> +
> +struct rkcif_device {
> +	struct device *dev;
> +
> +	const struct rkcif_match_data *match_data;
> +	struct clk_bulk_data clks[RKCIF_CLK_MAX];
> +	unsigned int clks_num;
> +	struct regmap *grf;
> +	struct reset_control *reset;
> +	void __iomem *base_addr;
> +
> +	struct media_device media_dev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_async_notifier notifier;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> new file mode 100644
> index 000000000000..a8514e7d3249
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -0,0 +1,260 @@
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
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +
> +#include "rkcif-common.h"
> +
> +static const char *const px30_vip_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"pclk",
> +};
> +
> +static const struct rkcif_match_data px30_vip_match_data = {
> +	.clks = px30_vip_clks,
> +	.clks_num = ARRAY_SIZE(px30_vip_clks),
> +};
> +
> +static const char *const rk3568_vicap_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"dclk",
> +	"iclk",
> +};
> +
> +static const struct rkcif_match_data rk3568_vicap_match_data = {
> +	.clks = rk3568_vicap_clks,
> +	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
> +};
> +
> +static const struct of_device_id rkcif_plat_of_match[] = {
> +	{
> +		.compatible = "rockchip,px30-vip",
> +		.data = &px30_vip_match_data,
> +	},
> +	{
> +		.compatible = "rockchip,rk3568-vicap",
> +		.data = &rk3568_vicap_match_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rkcif_plat_of_match);
> +
> +static int rkcif_register(struct rkcif_device *rkcif)
> +{
> +	return 0;
> +}
> +
> +static void rkcif_unregister(struct rkcif_device *rkcif)
> +{
> +}
> +
> +static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
> +				struct v4l2_subdev *sd,
> +				struct v4l2_async_connection *asd)
> +{
> +	struct rkcif_remote *remote =
> +		container_of(asd, struct rkcif_remote, async_conn);
> +
> +	remote->sd = sd;
> +
> +	return 0;
> +}
> +
> +static int rkcif_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct rkcif_device *rkcif =
> +		container_of(notifier, struct rkcif_device, notifier);
> +
> +	return v4l2_device_register_subdev_nodes(&rkcif->v4l2_dev);
> +}
> +
> +static const struct v4l2_async_notifier_operations rkcif_notifier_ops = {
> +	.bound = rkcif_notifier_bound,
> +	.complete = rkcif_notifier_complete,
> +};
> +
> +static irqreturn_t rkcif_isr(int irq, void *ctx)
> +{
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	return ret;
> +}
> +
> +static int rkcif_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rkcif_device *rkcif;
> +	int ret, irq;
> +
> +	rkcif = devm_kzalloc(dev, sizeof(*rkcif), GFP_KERNEL);
> +	if (!rkcif)
> +		return -ENOMEM;
> +
> +	rkcif->match_data = of_device_get_match_data(dev);
> +	if (!rkcif->match_data)
> +		return -ENODEV;
> +
> +	dev_set_drvdata(dev, rkcif);
> +	rkcif->dev = dev;
> +
> +	rkcif->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rkcif->base_addr))
> +		return PTR_ERR(rkcif->base_addr);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, rkcif_isr, IRQF_SHARED,
> +			       dev_driver_string(dev), dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
> +
> +	if (rkcif->match_data->clks_num > RKCIF_CLK_MAX)
> +		return dev_err_probe(dev, -EINVAL, "invalid number of clocks\n");

\n

> +	rkcif->clks_num = rkcif->match_data->clks_num;

\n ?

> +	for (unsigned int i = 0; i < rkcif->clks_num; i++)
> +		rkcif->clks[i].id = rkcif->match_data->clks[i];
> +	ret = devm_clk_bulk_get(dev, rkcif->clks_num, rkcif->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	rkcif->reset = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(rkcif->reset))
> +		return PTR_ERR(rkcif->reset);
> +
> +	rkcif->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						     "rockchip,grf");
> +	if (IS_ERR(rkcif->grf))
> +		rkcif->grf = NULL;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	rkcif->media_dev.dev = dev;
> +	strscpy(rkcif->media_dev.model, RKCIF_DRIVER_NAME,
> +		sizeof(rkcif->media_dev.model));
> +	media_device_init(&rkcif->media_dev);
> +
> +	rkcif->v4l2_dev.mdev = &rkcif->media_dev;
> +	ret = v4l2_device_register(dev, &rkcif->v4l2_dev);
> +	if (ret)
> +		goto err_media_dev_cleanup;
> +
> +	ret = media_device_register(&rkcif->media_dev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register media device: %d\n", ret);
> +		goto err_v4l2_dev_unregister;
> +	}
> +
> +	v4l2_async_nf_init(&rkcif->notifier, &rkcif->v4l2_dev);
> +	rkcif->notifier.ops = &rkcif_notifier_ops;
> +
> +	ret = rkcif_register(rkcif);
> +	if (ret) {
> +		dev_err(dev, "failed to register media entities: %d\n", ret);
> +		goto err_notifier_cleanup;
> +	}
> +
> +	ret = v4l2_async_nf_register(&rkcif->notifier);
> +	if (ret)
> +		goto err_rkcif_unregister;
> +
> +	return 0;
> +
> +err_rkcif_unregister:
> +	rkcif_unregister(rkcif);
> +err_notifier_cleanup:
> +	v4l2_async_nf_cleanup(&rkcif->notifier);
> +	media_device_unregister(&rkcif->media_dev);
> +err_v4l2_dev_unregister:
> +	v4l2_device_unregister(&rkcif->v4l2_dev);
> +err_media_dev_cleanup:
> +	media_device_cleanup(&rkcif->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
> +}
> +
> +static void rkcif_remove(struct platform_device *pdev)
> +{
> +	struct rkcif_device *rkcif = platform_get_drvdata(pdev);
> +
> +	v4l2_async_nf_unregister(&rkcif->notifier);
> +	rkcif_unregister(rkcif);
> +	v4l2_async_nf_cleanup(&rkcif->notifier);
> +	media_device_unregister(&rkcif->media_dev);
> +	v4l2_device_unregister(&rkcif->v4l2_dev);
> +	media_device_cleanup(&rkcif->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int rkcif_runtime_suspend(struct device *dev)
> +{
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +
> +	/*
> +	 * Reset CIF (CRU, DMA, FIFOs) to allow a clean resume.
> +	 * Since this resets the IOMMU too, we cannot issue this reset when
> +	 * resuming.
> +	 */
> +	reset_control_assert(rkcif->reset);
> +	udelay(5);
> +	reset_control_deassert(rkcif->reset);
> +
> +	clk_bulk_disable_unprepare(rkcif->clks_num, rkcif->clks);
> +
> +	return 0;
> +}
> +
> +static int rkcif_runtime_resume(struct device *dev)
> +{
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(rkcif->clks_num, rkcif->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rkcif_plat_pm_ops = {
> +	.runtime_suspend = rkcif_runtime_suspend,
> +	.runtime_resume = rkcif_runtime_resume,
> +};
> +
> +static struct platform_driver rkcif_plat_drv = {
> +	.driver = {
> +		   .name = RKCIF_DRIVER_NAME,
> +		   .of_match_table = rkcif_plat_of_match,
> +		   .pm = &rkcif_plat_pm_ops,
> +	},
> +	.probe = rkcif_probe,
> +	.remove = rkcif_remove,
> +};
> +module_platform_driver(rkcif_plat_drv);
> +
> +MODULE_DESCRIPTION("Rockchip Camera Interface (CIF) platform driver");
> +MODULE_LICENSE("GPL");
> 
> --
> 2.39.5
> 
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

