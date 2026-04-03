Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4542AE85367
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJQp4qyiVINRC2yWIozqFa0fIfPJ+S4aniFYq7A/W0o=; b=G6aUnzN5dsdR+VBGd/39dWaj9h
	+SVbxkf6xeYdHerML+vxWAcFKDdHQeP50/2lNR61xTJpnooT93AKAs/DC9T2iqXINJYzcAmbHm/pk
	4uoPbqnHFpS/PRlFiNCu/KRhTHFGAD1yUqSAzxkYBs1UX7H9a0GikdSywerdsoQ+f/w9anBfLflr0
	Ch3LLfpgjtDDtyAldDOQ28GsM+DxPPPY5gYBSYkBgAG698Q6iDZsE56MPaX7qLCwXfo+dpscnTAQf
	whEC57xJWA5/2CmHzuKjsBBjzvk3OYEOy8elrabWNzE4XMua0dzoDUZPHrUITymrjG+t1dJZZOaOC
	YPFPB2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fue-00000002Aua-0QZz;
	Fri, 03 Apr 2026 14:54:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fub-00000002Ath-28sY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775228056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJQp4qyiVINRC2yWIozqFa0fIfPJ+S4aniFYq7A/W0o=;
	b=RRc//LU9thPVre/chKRnGlOoYeoODAG0drHQSphvLcETBl4V04ZNuMkoNQzxXrcSMx+o2I
	AtT2ZEdP5RRpPtt3zthL9NSxZOMU/EDe6fJUnXW7RIhBw52/RjxfmHbA98sJ7vlxkbUghI
	KextfFqKUZBjlyXgb0O85eLdalTIMKc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-YGSH_FZHNI2tQuN2SoP41Q-1; Fri, 03 Apr 2026 10:54:12 -0400
X-MC-Unique: YGSH_FZHNI2tQuN2SoP41Q-1
X-Mimecast-MFC-AGG-ID: YGSH_FZHNI2tQuN2SoP41Q_1775228052
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f1daa57f3so73483206d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228052; x=1775832852;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EJQp4qyiVINRC2yWIozqFa0fIfPJ+S4aniFYq7A/W0o=;
        b=tLT3bqungiLUNJHGVUyFN1A3eohUCWgugKMDc53CbPXX9wXDQUHvs/WhblYG81UVZZ
         doQVB8dvd8GfOz25C9U6WJRz98IhIX1QHDPSg4kKn8OdX8edpXQhwlMtEI2msBynZnRl
         ep+An8yAQL6cka63CThjeHEbI2tonSiDqJnCI59M4KPfMLodyjVTXpBewM24Eyo/uYv3
         bsIlzrf3x4nRwhrkfrQ5zRAAdNOFT+Cqq/23RBaboYwl/vtJZq72qnv4iHgLNAAmKqUI
         thJXwzJ2rH6YHTDhFKdmu3dFKEOlHirMfSkHcKlvktlvBJYY3S0d7aFLmxvgZ5G2TuYq
         l7/A==
X-Forwarded-Encrypted: i=1; AJvYcCWTP6hnJ0fEogMdHbJVqYhSHM+OIuiJ0QKsaQL2mWlJdM/DZLCO5sCRjWzUYgsmGOvbGkEfnjTeDqkqexSNOMMN@lists.infradead.org
X-Gm-Message-State: AOJu0YyO8SHfGRj3quc6DqZz7181DHG5u3HMwhF81us+V7AQroPTAOfT
	mp6fSaO3b3UisRWSOfu5+RLkRzbWd0Ubb9jlKDOTUBVByVgumzlHjJhHVRth5fqCQF+1+RXaM1w
	XMw89gNcCBvyMIeuE7fuzzoZ5y/oVSdrozj7PLb42saPemrfPIxqYqB0Ud2EdQnzmSsja6tX7Ay
	Fr
X-Gm-Gg: AeBDies8NcWm6q+JyL/kTSKdlh7Qi/i4D5ix9S0uVwqQOLmeD+uo0hL+13TAPIrvP4x
	6sJFbMmsIl9ksU5bXDBfkFojxUOAXnEofxKgVKlnBsHxigzsisvjyICSwAjGgotnTOn6/vyMsb6
	6XkKPVu+Wrq0Yw0lKiKJ3pir53v2P/Hu04pV2NFx5vG7VSJpsUqnSr7zCoTFRpFnGMuSHlN/cgl
	MHaJ+m3c9i6yL4/oqREprrpjEUGX+unRFKL4ruwHh2rQP13Xn755Wbw+l8HRcm+Fb7l0PTj+1zv
	45pWIMZnt2KyiuJ0GmCQF4of4OOybFY8N7vkAJGZJHxgqO/XpbTaQF7Qhd46WdjucAnNOMNzeTI
	7eq6H7OYaV2Lf71LUasV0qs/4nBPu2xD49SEZ/NquOSgDbeLAPi8TNvia
X-Received: by 2002:ad4:5961:0:b0:8a5:104b:e390 with SMTP id 6a1803df08f44-8a7043ee428mr55704466d6.32.1775228052333;
        Fri, 03 Apr 2026 07:54:12 -0700 (PDT)
X-Received: by 2002:ad4:5961:0:b0:8a5:104b:e390 with SMTP id 6a1803df08f44-8a7043ee428mr55703896d6.32.1775228051814;
        Fri, 03 Apr 2026 07:54:11 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593330a98sm50899396d6.2.2026.04.03.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:54:11 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:54:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 06/10] clk: realtek: Add support for mux clock
Message-ID: <ac_UkRiqWb6fSc1I@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-7-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260402073957.2742459-7-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GLLotOJSYup-h8OTS6nNsR9dSB9KX79GxPxPtWcPyIc_1775228052
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_075417_645485_69757E5A 
X-CRM114-Status: GOOD (  25.76  )
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

Hi Yu-Chun and Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:53PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add a simple regmap-based clk_ops implementation for Realtek mux clocks.
> 
> The implementation supports parent selection and rate determination through
> regmap-backed register access.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> ---
>  drivers/clk/realtek/Makefile         |  1 +
>  drivers/clk/realtek/clk-regmap-mux.c | 48 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-mux.h | 43 +++++++++++++++++++++++++
>  3 files changed, 92 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 74375f8127ac..f90dc57fcfdb 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -5,4 +5,5 @@ clk-rtk-y += common.o
>  
>  clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
> +clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
> new file mode 100644
> index 000000000000..068b056d61f0
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include <linux/clk-provider.h>

Sort the includes.

> +#include "clk-regmap-mux.h"
> +
> +static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
> +	int num_parents = clk_hw_get_num_parents(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
> +	if (ret)
> +		return 0;

This is another case where it'd be nice to get the get_parent
declaration fixed. Stephen recently linked to some work of his from 2022
here.

https://lore.kernel.org/linux-clk/177431305509.5403.15386021337517970667@lazor/

There's nothing for you to do right now.

> +
> +	val = val >> clkm->shift & clkm->mask;

I know there's the order of operations, however for clarity I would just
include some () here to make it clear the expected order.
> +
> +	if (val >= num_parents)

Remove newline before if.

> +		return 0;
> +
> +	return val;

Or you could just use a ternary operator:

return val >= num_parents ? 0 : val;

> +}
> +
> +static int clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
> +				  clkm->mask << clkm->shift, index << clkm->shift);
> +}
> +
> +const struct clk_ops rtk_clk_regmap_mux_ops = {
> +	.set_parent = clk_regmap_mux_set_parent,
> +	.get_parent = clk_regmap_mux_get_parent,
> +	.determine_rate = __clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "REALTEK_CLK");
> +
> +const struct clk_ops rtk_clk_regmap_mux_ro_ops = {
> +	.get_parent = clk_regmap_mux_get_parent,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ro_ops, "REALTEK_CLK");

rtk_clk_regmap_mux_ro_ops is exported, however the declaration is not actually
declared in any header files.

Brian


