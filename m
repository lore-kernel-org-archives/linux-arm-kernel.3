Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADAFC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=; b=Hh8IO0r+sPc1ysBZ3kJGAka3Oq
	owDP3bOmBqK5qI/svboV+XcYGMyFd48vpV6aUWIgAoOY6YzW3zylY2Ynlo9pGsSDXXsjoR0L8vGZ9
	kJX+yy4wl+i+0/NAOSLwJGiMXfhJAv6lqzjLz+F0m0Le4sBFWwtuCv8Y9pRXIfexDTAVwje2sz1PT
	oGK9m7AtK7e3AXEnPtcOvNhZTnoKViy0V59tCfZMIqGJj/pA0dWE2J2LARyr+TdzL1eO/VQOTgGkn
	4fvPT5uuw92Go2dqWjtN4KlMsZXf1EksZYfbYCMXAxDXFPi448EvwqeV5wWlUS/EV0v38LNey91y+
	Ea3bWdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquS6-0000000HVQ2-1FF5;
	Mon, 03 Aug 2026 15:19:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquS3-0000000HVO9-1u0t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
	b=CZd8vrT1OW76+k8W/aAdKbpAxy90VbE/IAqs6DN/LZXg65RmnGTxDruoiauk7i2pqIm6U9
	fRslYLtpfxTJOfrcvYFk7+qf94FoRcObMojnKLDZ1W5eFYZjj+YiWSsAFV69Fs96VXA4+r
	4XOamNY2zVifo+gyhWcv/4VzYIJfhwQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-LiCz18EWNuCk6xH9NaCwnQ-1; Mon, 03 Aug 2026 11:19:37 -0400
X-MC-Unique: LiCz18EWNuCk6xH9NaCwnQ-1
X-Mimecast-MFC-AGG-ID: LiCz18EWNuCk6xH9NaCwnQ_1785770377
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81f0e988059so133386877b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770376; x=1786375176;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
        b=krWXAndFzFR8361qBGPXMzKIOMZSpEM1rowmyaHIHOpzR6PHBlekfPjjq9GYTIUhxX
         Y+Ne4+LjSzfZg6AWD/NmH44YAvsMJV1cU9zGYtq/V9x0F+MqlFLzvZgivy5f3p/zXdI2
         2fozH52DK6OB7AzYlTcFbdTqXRdE1/Y0INqHJgbeFSCPBskK5/7A1eNZDypSvPp9EkdT
         WVvo5zY5zaHuP0m7BaG0V723ytg/C4hCCsd2vYEIe7AuXHAYC2pvUE1XgVQAgVm1bnN7
         rTVw3DkJQqNlnIynhjj08YOcifLmzfoo0EQhJGtsVbNWPXFaSMESH6I28ieSOS9ZSQpc
         fcPw==
X-Forwarded-Encrypted: i=1; AHgh+RowMWzgLr7m0TaZxO/DrrHhHQCrBFZAVDF2R6xqve1E9iMdFMg2kFrHXWXVV8g39J/8aCcbX0quVX0VbnQsyrWI@lists.infradead.org
X-Gm-Message-State: AOJu0YwG/Bkk7nBQnMhrgpLjS3aNV3j8TQFIURvKxUyFkmF7I3mFPjAm
	cdp5JSXdRwTU+s6p//f61MVe0xN4wen2rAPpbFkUaJIdH3ftav5pO0hlef7GWHAkqDbtwucu0mX
	X7b9I40DxPIiAbQ3XbToRGhOb0CVkPTHxUUE2+PHPx+M82dmYOqAHEB+pChPcbEASsOkvHwBk0k
	8E
X-Gm-Gg: AR+sD11JxqpkB7+D0vh7mDuae/3E9VdwJfxmlco6Bl1tieddPeBIfe3ndZPzwJ+AKT4
	Dw3R7hsn/EZlNkhXy+1siZ0+b3fyInOusg0qL3L4NlaMzEbEPwLKw2kT+/a2uoT6+0uutohP5D+
	UVNcVjDkBHBwtprPwgEoSAe/nEz67O+y5L6KlltRUG7AwMUGH/ZU8Kli7SB155C9E4gF9knd+9h
	zIdFPCYyelluTVGAqwP9KEcwGt7wF4R09wD/TKKQnkRnDH/0KdhN70c9cpmIuSM3Kwv4DN3JVr7
	pVdAR+Dbp68JKwOFXs281r7CafQY4nL4bwaOzzuA5OrsfWOgdM/X3N9Zeluu+S67YiYlfm39MCX
	lIsWSfVDo6us7uiZTA7OBs2ZZ0LBOdfB9ywk=
X-Received: by 2002:a05:690c:278a:b0:81c:a61e:6309 with SMTP id 00721157ae682-81fd4bee7cfmr133566877b3.32.1785770376550;
        Mon, 03 Aug 2026 08:19:36 -0700 (PDT)
X-Received: by 2002:a05:690c:278a:b0:81c:a61e:6309 with SMTP id 00721157ae682-81fd4bee7cfmr133566557b3.32.1785770376131;
        Mon, 03 Aug 2026 08:19:36 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e2b0sm55932967b3.8.2026.08.03.08.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:19:35 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:19:33 -0400
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
Subject: Re: [PATCH v5 19/25] clk: mediatek: Add MT8189 vlpcfg clock support
Message-ID: <anCxhZEK9Rh1H4U9@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-19-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-19-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kifOTrQKrbkGWPYSwQq8j_6Vdu-Bw2ssrjH20Hdl298_1785770377
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081939_587755_4B81EC16 
X-CRM114-Status: GOOD (  19.51  )
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

On Sat, Aug 01, 2026 at 01:21:05PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 vlpcfg clock controller,
> which provides clock gate control for vlp domain IPs.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile            |   2 +-
>  drivers/clk/mediatek/clk-mt8189-vlpcfg.c | 116 +++++++++++++++++++++++++++++++
>  2 files changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 3b25df9e7b50..d9279b237b7b 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -124,7 +124,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
> -				   clk-mt8189-vlpckgen.o
> +				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpcfg.c b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
> new file mode 100644
> index 000000000000..cc4ebfd46a6f
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
> @@ -0,0 +1,116 @@
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
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>

of_device.h is deprecated. You can drop this one since what you need
will be provided by platform_device.h.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


