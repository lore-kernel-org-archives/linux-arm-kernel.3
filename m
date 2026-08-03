Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF87C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=; b=bB5CUkNnWbe+ymgRNa3oxRLwRY
	63CSJclMxqbaUPmRt4ltOOGbae8/GBjEqaabJPIMYs5Fdnq+Z+xLyeAYcCJP7gL9zs0y8q0UhqsSo
	1oB6RViKhli4ecC6fl4DV7MMmcLz9jJltfKRCJeZnYgJrP0qy0Kh23IeLTe7iQFvndKXID3FXrll9
	F+hOtso4XT9480gGvsFn0kqcy0BV48FV/yBoqqM95fd46eqoH5mflRk8fKEEl7pprL9h/EZrcXi4V
	gUUxz/T2iS5MqjCNHUwKmz0k1HAWNEeW8fjzvd16XSO1Sszj9pzx7GdM23dEfFpMDm9E+ZxB9GpZ2
	XdawM7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquPx-0000000HUpW-1FhD;
	Mon, 03 Aug 2026 15:17:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquPu-0000000HUow-1xBM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
	b=Zz4SWlT/Ho4Ro80EfMM4dWEGc0lLq3zukxv/YKRmvp+3sAoZ4LE/Nyb3zEd29BJnLZz5Bz
	vlh9+PXYkzFQQzmHQf/nAZpH0iH/GiLhdTCDvuep6uHJgPB9MqIZGlZRybSxW2bODA19RY
	+vnftvrkM5QMdSa+xkEr82IT/CMs/GM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-V9tRS_x_O8-CBfc5rcRuBw-1; Mon, 03 Aug 2026 11:17:19 -0400
X-MC-Unique: V9tRS_x_O8-CBfc5rcRuBw-1
X-Mimecast-MFC-AGG-ID: V9tRS_x_O8-CBfc5rcRuBw_1785770238
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eedabbefcso118012717b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770238; x=1786375038;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
        b=qzJMOzthg+wJfhNGhsCVjI2GvUsAJy5BU6TGakFHYf2sPjgloLr+jVBuFejVd/Ebzv
         Wu4/9Alk/OSWDRN4yEFg32RMwjHMRMvUIBqy6mm0XthHoD62tU1gNweBR34xK5zDNg+V
         Myspv22Kc6VXP0z8G51pN3hDj5G0s4mMvbOXzqKwGi+S8nQ5kFmZvugEv6hxbNvfHJwL
         F0g58Q3+ln7V0MxD4YzhYLy03lsCiHFObnOQhyNhjH3Y/QNc3D3jimexqsudFah7HjiH
         0HldtGOZNXhBWFjLySgVcKYYnjgNKpWPI7QfUXRO/1+F61tGnrki783K4ILifAUKABr2
         DnEQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5fbflpRxLNJ6xSo7o/Um2LWEJMsK4qPbSB9modC6Wkhb1QLb4cUSidjLkwymQabSiweXHcsPqahW1FEAmyEsi@lists.infradead.org
X-Gm-Message-State: AOJu0YynSGCIBYq8O7VxQCVMr42lHXWXXZl6VqU1wMsqyuDl00B9X0t9
	LrYaihoyK3rmaAsAsbxaF7KfDFoOZ6/bbcggYMagf8Y/lyAqajK67EXH69+M97OfptiKy+EmvBw
	zp7pP26tfkEdJospRheu5uyIQtk92YzdE8KmXyX5PxLkYimVP802M/sZlN59kxqq6ANUn4oY/I/
	ij
X-Gm-Gg: AR+sD12wgAtqDKyYHMu3K9qUR/MT5Vg8C5IiffcApdrHh6FrSLyA7Mhf1Os816jcfh0
	p9vbexhKAtvMNciUd2bBk/7jQx0XuVgqzCqgX+BQaO4HX4ltWXPWNMpayb7LdB8Q3MdW4WAvbQg
	QC9qk2PHVufSvZlgWI/SNLdxuD/gCvjJnUJyU5v+aoVlhtBEcHEi0Qz2klnMVGfghytzctylX5k
	bmX+7HugJbImgqP7z3WT2SKrgaN7XvlG1KVzMbC759bcCXLrjWPdV9GfSZiYwR2UxbaTPDMwGtR
	SbD4x1prAcwhULD1OquGZFxNkx0tsEYKYS1s+koWl5VtY5f/KUg+KGh8yZMNQfwifq/Jl4VY5wy
	/Sb5amo7GIPy7TRGPf9AV881cowVNznGo2OE=
X-Received: by 2002:a05:690c:450d:b0:7d1:dd7b:b734 with SMTP id 00721157ae682-81fd4b5a2c8mr136703417b3.23.1785770238455;
        Mon, 03 Aug 2026 08:17:18 -0700 (PDT)
X-Received: by 2002:a05:690c:450d:b0:7d1:dd7b:b734 with SMTP id 00721157ae682-81fd4b5a2c8mr136702797b3.23.1785770237899;
        Mon, 03 Aug 2026 08:17:17 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm57358447b3.5.2026.08.03.08.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:17:17 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:17:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v5 18/25] clk: mediatek: Add MT8189 vlpckgen clock support
Message-ID: <anCw-ozpIjYfan5O@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-18-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-18-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BoNwj3npSWwKzYoGUXVE20PiyBL68fMVdoIL9sttYd0_1785770238
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081726_650201_D71431CB 
X-CRM114-Status: GOOD (  20.74  )
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

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:21:04PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in vlp domain for other IP blocks.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |   3 +-
>  drivers/clk/mediatek/clk-mt8189-vlpckgen.c | 285 +++++++++++++++++++++++++++++
>  2 files changed, 287 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 9d3d2983bfb2..3b25df9e7b50 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,7 +123,8 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
> +				   clk-mt8189-vlpckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpckgen.c b/drivers/clk/mediatek/clk-mt8189-vlpckgen.c
> new file mode 100644
> index 000000000000..8eda5331972e
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpckgen.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025-2026 MediaTek Inc.
> + *                    Qiqi Wang <qiqi.wang@mediatek.com>
> + *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
> + * Copyright (C) 2026 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

There are also some headers that can likely be dropped here as well. I'm
not going to comment on this on any other patches. I'll just list any
new issues I see.

Brian


