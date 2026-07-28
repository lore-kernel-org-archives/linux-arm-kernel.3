Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DAFC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57/s/XNhO9Wt95H/WMpqEA5nKekp47X7yp5AMK8PfyU=; b=e/frooO6LTeey5OB7UcIGPEnN2
	N5vJPn2aw8i99Pm8tpI7UsFMWggR1AZltatOqM7SHexufxu056tEiTeiCVNgNJmPvC9asNxF1JOow
	drSJX4qawkVTqFl0S3yH3szKEcn1Pm2KmkOYnrWbA1dBnkqefZmP03btI9AmxfffFH3BULrvseoE9
	RqZ3bQ36K7Uqm2Ydq0LCy/xdgCh/J/9Ajol9HR17DUJqwlvelbBaa5w24eio/B6dy9JKA0QCiofSx
	w2i07hctDYHsTbOE7CNKQ7/M5R6cztcFZwS8RpuCodYuCE26K4fZOA80sbSstSAo30pJuRIuEEemU
	SIY8JReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiFf-00000005P2o-00aH;
	Tue, 28 Jul 2026 13:53:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiFL-00000005OxR-1lT4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 13:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785246806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57/s/XNhO9Wt95H/WMpqEA5nKekp47X7yp5AMK8PfyU=;
	b=ejTNmXz2AbTWAhzTCQh8i9xUPu/GQFEN8kPk/dRBgtBLIq0Dv8sHH5NUBzzAGNoft2krkC
	rpuLjl/awKRJOMfXwREstydN4PiiF+ABtoujsrGuArISrGGzwaHIMZUxvxRwWpQ20XW53F
	XmRxmBRjOwoggc/Nm3mVVLG6gLJmLdc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-FuZEjfflOqG7GUBMhzRCyw-1; Tue, 28 Jul 2026 09:53:21 -0400
X-MC-Unique: FuZEjfflOqG7GUBMhzRCyw-1
X-Mimecast-MFC-AGG-ID: FuZEjfflOqG7GUBMhzRCyw_1785246801
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so79908121cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 06:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246801; x=1785851601;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=57/s/XNhO9Wt95H/WMpqEA5nKekp47X7yp5AMK8PfyU=;
        b=fSOX7IEPhaUncPhvzM+REoNoWes9NG7eDqRYwwcjDdBeozrob8WzySh786Je2y/EzH
         p4HcPrF2yYOAtzwGifzIexO9mVIcYURqY5LhjxwPaetTvtjs7TEz0PeCRH2x1WPRaS4A
         Caybj472dwIo9EtvTNLaTBvbxnbJA8ebltMnPyy0ByFze+xz5iFPRfhdRKxMJTu1Matf
         jMMxYNyFFuxtNhqZYzwwwNUqh4ANzlN/+ZWR4KfopelAFFTNoxdmM9H+avLHIvUYay9H
         wFdxs8/FRUFIcfJiQkzVBkJnb7FWDA4J8WwTRs43wBejKQ6miVrYAOfOW001Q0tfTuc0
         Uucw==
X-Forwarded-Encrypted: i=1; AHgh+RqYbHCRQHu9G0JVdSCWXzk4K1UgCl7v1zb6lApuRAT4FMiEXhK9Kjvc4EZw9wWKQp5PXaHV09iEe2AHeNT1KY5k@lists.infradead.org
X-Gm-Message-State: AOJu0YwEgRba70DwzCE+avKp2cXjnRKuVFgte2vDIv4zAM5Rf28FpNe1
	ViQSU4D842pHxH6KByGemtnIrfL5EHjOgFsikgYEESOdxvC27Jwck45vG+0hmcYUIvs8KSE+Vy/
	tzic+e6oUGiTYc0q7JeZatNPkz0mVrI06cpX6Qwvh+7C9pDa9fw+4BF+HGl9PEpVzvURtWKRMuB
	79
X-Gm-Gg: AR+sD11eILe3h7ZYyRsNsv0Br2NCwzIajsbYnCcFu1OU2N3IE5knp2Hs3hZsizH5TbM
	bNFfFtnQO9BymDjFS212lt9TeC2wa0jswNeyDV0tTQjb7JSMkbIG9iR0h167jXS8kmbkRzzFcU3
	rhKwT1CvIShnZMgJzVNgbdrcELjIDst/yiChhoKpj55LDcFyfjmE6V5Axr0cfFfXB+B0vV1Hss2
	p6qMQai8fcCxHBesh1Pv76TlUme52vxgQRVClv0gYt7LXzqShNI0BtF86Adsv9AL/WXBFSnlZ1r
	5ThNeqyeQMehIAHBMZjSdD4/Ub92Pyo1A4uPBVF2fXyMYHLAbI8vIz0YFJP0jyer96PUJ2R8GK5
	LRzM58G+ReTX42LJR69av/ltBKWc70eDJmjs=
X-Received: by 2002:a05:622a:192a:b0:51c:c67:2042 with SMTP id d75a77b69052e-529d71da27dmr20270761cf.53.1785246800488;
        Tue, 28 Jul 2026 06:53:20 -0700 (PDT)
X-Received: by 2002:a05:622a:192a:b0:51c:c67:2042 with SMTP id d75a77b69052e-529d71da27dmr20270051cf.53.1785246799669;
        Tue, 28 Jul 2026 06:53:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a2989b0bsm73997611cf.16.2026.07.28.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:53:18 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:53:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <ami0TaY84IslWZyo@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-5-7a107b00f1dd@gmail.com>
 <amiw7mfPfSPjLHLH@redhat.com>
MIME-Version: 1.0
In-Reply-To: <amiw7mfPfSPjLHLH@redhat.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ScFwEFkh4LhOp2lrzYpkTGTL9V_cmiaWIFevIkQt2Zc_1785246801
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_065327_601709_27E491CD 
X-CRM114-Status: GOOD (  52.15  )
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

Hi Stefan,

On Tue, Jul 28, 2026 at 09:38:54AM -0400, Brian Masney wrote:
> On Mon, Jul 27, 2026 at 09:24:20PM +0300, Stefan Dösinger wrote:
> > The next patches will implement the regmap clocks and PLL driver. The
> > actual hardware specific clock listing will live in a separate module.
> > 
> > Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> > 
> > ---
> > 
> > Version 8:
> > Use ZX297520V3_CLK_NO_EXPORT=(~0u) for unexported clocks. While using 0,
> > and starting clock indices at 1, is a common pattern in existing
> > drivers, it exposes a driver implementation detail in the hardware
> > binding interface.
> > 
> > If desired, I can change the special index to a separate field in the
> > structs.
> > 
> > Fix the return value if the ->init() callback fails. (Sashiko)
> > 
> > Version 7:
> > *) Add fixed dividers to handle PLL subdivisions
> > *) Never register PLLs directly as exported clocks - everything on this
> > SoC goes through a gate before it leaves a controller.
> > 
> > Version 6:
> > *) Remove auxdev now that LSP clocks also use MFD
> > *) Error codepath fixes pointed out by Sashiko.
> > 
> > Version 5:
> > 
> > *) Pass the static clk data instead of calling get_match_data to prepare
> > for operating as an MFD child.
> > 
> > *) Don't use devm_kzalloc to allocate the auxiliary_device
> > structure. I guess Sashiko is right, and that's what "Because once the
> > device is placed on the bus the parent driver can not tell what other
> > code may have a reference to this data" is trying to tell me.
> > 
> > *) Fix error check for device_node_to_regmap.
> > ---
> >  MAINTAINERS                  |   1 +
> >  drivers/clk/Kconfig          |   1 +
> >  drivers/clk/Makefile         |   1 +
> >  drivers/clk/zte/Kconfig      |  16 +++++
> >  drivers/clk/zte/Makefile     |   5 ++
> >  drivers/clk/zte/clk-regmap.c |  34 ++++++++++
> >  drivers/clk/zte/clk-zx.c     | 155 +++++++++++++++++++++++++++++++++++++++++++
> >  drivers/clk/zte/clk-zx.h     |  91 +++++++++++++++++++++++++
> >  drivers/clk/zte/pll-zx.c     |  16 +++++
> >  9 files changed, 320 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b04e9d43cfb0..692f005cb2c4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3883,6 +3883,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
> >  F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
> >  F:	arch/arm/boot/dts/zte/
> >  F:	arch/arm/mach-zte/
> > +F:	drivers/clk/zte/
> >  F:	drivers/mfd/zte-zx297520v3-crm.c
> >  F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
> >  F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 1717ce75a907..6f0a863951ca 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -545,6 +545,7 @@ source "drivers/clk/uniphier/Kconfig"
> >  source "drivers/clk/visconti/Kconfig"
> >  source "drivers/clk/x86/Kconfig"
> >  source "drivers/clk/xilinx/Kconfig"
> > +source "drivers/clk/zte/Kconfig"
> >  source "drivers/clk/zynqmp/Kconfig"
> >  
> >  # Kunit test cases
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index cc108a75a900..13a5478f1112 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -167,5 +167,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
> >  obj-$(CONFIG_X86)			+= x86/
> >  endif
> >  obj-y					+= xilinx/
> > +obj-$(CONFIG_COMMON_CLK_ZTE)		+= zte/
> >  obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
> >  obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
> > diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
> > new file mode 100644
> > index 000000000000..0222549dd211
> > --- /dev/null
> > +++ b/drivers/clk/zte/Kconfig
> > @@ -0,0 +1,16 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# ZTE Clock Drivers
> > +#
> > +
> > +config COMMON_CLK_ZTE
> > +	tristate "Clock driver for ZTE SoCs"
> > +	depends on ARCH_ZTE || COMPILE_TEST
> > +	default ARCH_ZTE
> > +	select MFD_SYSCON
> > +	help
> > +	  This option selects common clock infrastructure for ZTE based SoCs.
> > +	  You will need to enable one or more SoC specific drivers to make use
> > +	  of this.
> > +
> > +	  Enable this if you are building a kernel for a ZTE designed board.
> > diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
> > new file mode 100644
> > index 000000000000..27db07293165
> > --- /dev/null
> > +++ b/drivers/clk/zte/Makefile
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-$(CONFIG_COMMON_CLK_ZTE) += clk-zte.o
> > +
> > +clk-zte-y += clk-zx.o pll-zx.o clk-regmap.o
> > diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
> > new file mode 100644
> > index 000000000000..984abeb45ab2
> > --- /dev/null
> > +++ b/drivers/clk/zte/clk-regmap.c
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2014 MediaTek Inc.
> > + * Copyright (c) 2018 BayLibre, SAS.
> > + * Copyright (c) 2026 Stefan Dösinger.
> > + * Author: Stefan Dösinger <stefandoesinger@gmail.com>
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/errno.h>
> 
> Sort the headers.
> 
> > +
> > +#include "clk-zx.h"
> > +
> > +int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
> > +			  const struct zx_gate_desc *desc, unsigned int num,
> > +			  struct clk_hw_onecell_data *clocks)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
> > +			     const struct zx_div_desc *desc, unsigned int num)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
> > +			  const struct zx_mux_desc *desc, unsigned int num,
> > +			  struct clk_hw_onecell_data *clocks)
> > +{
> > +	return -ENODEV;
> > +}
> > diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> > new file mode 100644
> > index 000000000000..c9e9048d3ade
> > --- /dev/null
> > +++ b/drivers/clk/zte/clk-zx.c
> > @@ -0,0 +1,155 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2026 Stefan Dösinger
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/errno.h>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> 
> Also sort the headers.
> 
> > +
> > +#include "clk-zx.h"
> > +
> > +static int zx_clk_register_fixed_dividers(struct device *dev, struct regmap *regmap,
> > +					  const struct zx_fixed_divider_desc *desc,
> > +					  unsigned int num)
> > +{
> > +	struct clk_hw *clk;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < num; ++i) {
> > +		clk = devm_clk_hw_register_fixed_factor(dev, desc[i].name, desc[i].parent,
> > +							CLK_SET_RATE_PARENT, 1, desc[i].div);
> > +		if (IS_ERR(clk)) {
> 
> The { } is not needed here.
> 
> > +			return dev_err_probe(dev, PTR_ERR(clk), "Failed to register clk %s\n",
> > +					     desc[i].name);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void zx_delete_clk_provider(void *data)
> > +{
> > +	of_clk_del_provider(data);
> > +}
> > +
> > +static void zx_clk_disable_unprepare_put(void *data)
> > +{
> > +	clk_disable_unprepare(data);
> > +	clk_put(data);
> > +}
> > +
> > +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> > +			const struct zx_clk_data *data)
> > +{
> > +	unsigned int public_clk_count = 0, highest_id = 0;
> > +	struct clk_hw_onecell_data *clocks;
> > +	struct regmap *map;
> > +	struct clk *clk;
> > +	unsigned int i;
> > +	int res;
> > +
> > +	map = device_node_to_regmap(of_node);
> > +	if (IS_ERR(map))
> > +		return PTR_ERR(map);
> > +
> > +	for (i = 0; i < data->num_muxes; ++i) {
> > +		if (data->muxes[i].id != ZX297520V3_CLK_NO_EXPORT) {
> > +			if (data->muxes[i].id > highest_id)
> > +				highest_id = data->muxes[i].id;
> > +			public_clk_count++;
> > +		}
> > +	}
> > +	for (i = 0; i < data->num_gates; ++i) {
> > +		if (data->gates[i].id != ZX297520V3_CLK_NO_EXPORT) {
> > +			if (data->gates[i].id > highest_id)
> > +				highest_id = data->gates[i].id;
> > +			public_clk_count++;
> > +		}
> > +	}
> > +
> > +	if (WARN_ON(public_clk_count != highest_id + 1))
> > +		return -EINVAL;
> > +
> > +	clocks = devm_kzalloc(dev, struct_size(clocks, hws, public_clk_count), GFP_KERNEL);
> > +	if (!clocks)
> > +		return -ENOMEM;
> > +	clocks->num = public_clk_count;
> > +
> > +	for (i = 0; i < data->num_inputs_enable; ++i) {
> > +		clk = of_clk_get_by_name(of_node, data->inputs_enable[i]);
> > +		if (IS_ERR(clk)) {
> > +			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
> > +					     data->inputs_enable[i]);
> > +		}
> > +
> > +		res = clk_prepare_enable(clk);
> > +		if (res) {
> > +			clk_put(clk);
> > +			return dev_err_probe(dev, res, "Input clk %s enable failure\n",
> > +					     data->inputs_enable[i]);
> > +		}
> > +		res = devm_add_action_or_reset(dev, zx_clk_disable_unprepare_put, clk);
> > +		if (res)
> > +			return res;
> > +	}
> > +	for (i = 0; i < data->num_inputs; ++i) {
> > +		/* FIXME: devm_get_clk_from_child doesn't do any tree traversal, so it works here
> > +		 * whether "of_node" belongs to "dev" or a parent of "dev". Is it supposed to be
> > +		 * used that way though?
> > +		 */
> > +		clk = devm_get_clk_from_child(dev, of_node, data->inputs[i]);
> 
> I don't know the intention of the original function without digging into
> the history. Can you just use of_clk_get_by_name(of_node, data->inputs[i])
> like you do in the for loop above for consistency?

Looking into the other patches. There's more mixing of the clk provider
calling the clk consumer APIs here. It looks like this just takes a
reference and holds them. Would moving to parent_data address this?

Brian


