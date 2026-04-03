Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD5FE8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFaUzbzw3UwrOKQve5iqMJ9GUoUB8a24kPcMKP3uvaA=; b=0J/l/rOdqKYwWmaTbF3vMX7GOp
	W4SNi7vrWrO0nwWoBzNwpFf6wZtjqJyZPhMZX6VP5AEUjdB1rauI9TyZTfrBNtgHHRM0ewWSCsi6w
	2MYrMg7p8VSgKfG7+yJBXsGJ54Zptxhzdm2+pHxWn/MCn9XAsFzocX3fOpMExQgB+AU1xbWUYffJA
	FXhHZtDn/e/rHkYhUseHs92gc8KvnDWADrESKyJKJqEpWd0+qQ+4iO7PeaQcjGTi95DRPID0gUd5G
	ACHtoZE/swMnm85FqAm+oSm95ZfROsc+FyIuo345rCwQ2ky1jGdIx+9oqu6KPMW0pXlTMPNYbkgMU
	5xNxCVTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fPV-0000000289z-3IKQ;
	Fri, 03 Apr 2026 14:22:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fPT-0000000289H-0l53
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775226126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aFaUzbzw3UwrOKQve5iqMJ9GUoUB8a24kPcMKP3uvaA=;
	b=T7rQ/9cxBVwnpKr7P2H2l/FhUC1bxCgpbNnZd5p3r/vlu96FW46zu7hm1fz8V4jUpVxxW2
	McoB09BJfPemY20GNC4x2MnHgIx0jGYpSvQEMHOghu+kWu1vY1YJ8c5CzmBpVdGQSNUmSr
	uyiiJQCGR+bRtzgXlCYHjyEe6RhIo70=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-TVp1GApMM321pg0plffdMw-1; Fri, 03 Apr 2026 10:22:04 -0400
X-MC-Unique: TVp1GApMM321pg0plffdMw-1
X-Mimecast-MFC-AGG-ID: TVp1GApMM321pg0plffdMw_1775226124
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so31098471cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226124; x=1775830924;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFaUzbzw3UwrOKQve5iqMJ9GUoUB8a24kPcMKP3uvaA=;
        b=WA5ANjPKznpYmDqfeuOK7YHc+DwvjWZie+Ror4lxMBswp17k/yZzzS1tzWz+pnNA3F
         lWK2LM88EVOoQ7yXgAE5APOORQMS2Iv+p0EilhrWDtMjiIIc1xl34rluizOZBZ+UovnD
         /Q25X1iV9M68rMJgHPXEqWwXAZqrPk7gVOmorsHxWLf+rN/AMeZohbxFjn21LSQjqY84
         ePF7qSVjl8pt6tyOJB1e/EXGnMkcBAwqJ06foTHkZIyiaesyXgTJl9GJhGS7VMGZ9zV6
         vVIDXQ5iw+4KIgILC/0h6OoZSzps7xHGUFSUlqgfcizQdWq+mrgr5HvBtcgSjxm33KOG
         cp+A==
X-Forwarded-Encrypted: i=1; AJvYcCX+/hnrOftP50kTpIqYFtT4Xpe82kewcSXuu7BRfDCKdxaQn8YijQAN3xsZvSZwQLHDVUsBS3PxPIcLc0MVc0S0@lists.infradead.org
X-Gm-Message-State: AOJu0YxQf4ZCSVze32BSFZhSCUUD6PL+2neaNK1EHaqVqK+QhmxgGXZT
	jm238+PGw+cyMLsMpt61vwuGSOjyYUPHtchKbARIHi4CqJR0Iq0n1NuWzM/ECN0hXBeEBdTp/Qn
	PlJUpA3HL7iC6S3M2kqERs6aXYN/rxUB9ggqrvQugMd+QOZYMhA9F3QkIGUAYaHl1T9NUS59FUW
	9Z
X-Gm-Gg: ATEYQzwVsa2dpU9j8tWcMh2cRA0N+WfcnAuMUA7sBQc5t9S0v6kLDOCKLAA3Gybuqj+
	ydX1Ocnx5LW7rtrHCDOCycArRn+VIhxP7fK1V7n1zsK5Y/P0IqnJh5O2Rfx6caoByieldSKsaAt
	vKIlq41Ej1IAiTj6cX5SH7+dOdIaHoj2jK3L9Rs1w6+nBY1VBdYYNSH3E6Kqs7/Ftzzz5ieDjv+
	vs2xbVcFCsLetcLvwvWDKaUJLSSPEXhQOmufOR2u+vk4X/VU9FojTMLF+GPk6dNt+bnLW3DQZBi
	vOVDywgvZtsqIgM5ucpAZnGXZQtm5ic1C9+90Vsmzgd7M0sEO1nNpWyow/RDWBBnVIV0eWG4oSa
	kQYrmMsAr4//rTFlAADhA3VLdn45fL/CeKilf3GXkqBhUfvGImW3++Rzw
X-Received: by 2002:a05:620a:25c9:b0:8c7:1118:c514 with SMTP id af79cd13be357-8d41c3b4678mr430490985a.17.1775226123839;
        Fri, 03 Apr 2026 07:22:03 -0700 (PDT)
X-Received: by 2002:a05:620a:25c9:b0:8c7:1118:c514 with SMTP id af79cd13be357-8d41c3b4678mr430484085a.17.1775226123228;
        Fri, 03 Apr 2026 07:22:03 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8c29f00sm427002585a.45.2026.04.03.07.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:22:02 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:21:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 03/10] clk: realtek: Introduce a common probe()
Message-ID: <ac_NB8y414PtbtqM@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-4-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260402073957.2742459-4-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 68_BuhYsx3evTLXwt7SgAhzre8_IRNBmBiNUzI00zL0_1775226124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_072207_287864_BFBE58F3 
X-CRM114-Status: GOOD (  34.02  )
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

Hi Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:50PM +0800, Cheng-Yu Lee wrote:
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Replace direct reset controller initialization with auxiliary device creation.
> - Add aux_name parameter to rtk_clk_probe() to register the reset auxiliary device.
> - Simplify rtk_clk_desc because reset data is handled entirely by the auxiliary reset driver.
> - In Kconfig, change "depends on RESET_CONTROLLER" to "select RESET_CONTROLLER"
> - Remove unused includes headers and added <linux/auxiliary_bus.h>.
> ---
>  MAINTAINERS                  |  1 +
>  drivers/clk/Kconfig          |  1 +
>  drivers/clk/Makefile         |  1 +
>  drivers/clk/realtek/Kconfig  | 28 +++++++++++++++
>  drivers/clk/realtek/Makefile |  4 +++
>  drivers/clk/realtek/common.c | 67 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/realtek/common.h | 37 ++++++++++++++++++++
>  7 files changed, 139 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/common.c
>  create mode 100644 drivers/clk/realtek/common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8f355896583b..8318156a02b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22240,6 +22240,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 3d803b4cf5c1..d60f6415b0a3 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -519,6 +519,7 @@ source "drivers/clk/nuvoton/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/ralink/Kconfig"
> +source "drivers/clk/realtek/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f7bce3951a30..69b84d1e7bcc 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -140,6 +140,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>  obj-y					+= ralink/
> +obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
>  obj-y					+= renesas/
>  obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 000000000000..bc47d3f1c452
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	bool "Clock driver for Realtek SoCs"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default ARCH_REALTEK
> +	help
> +	  Enable the common clock framework infrastructure for Realtek
> +	  system-on-chip platforms.
> +
> +	  This provides the base support required by individual Realtek
> +	  clock controller drivers to expose clocks to peripheral devices.
> +
> +	  If you have a Realtek-based platform, say Y.
> +
> +if COMMON_CLK_REALTEK
> +
> +config RTK_CLK_COMMON
> +	tristate "Realtek Clock Common"
> +	select RESET_CONTROLLER
> +	select RESET_RTK_COMMON

select AUXILIARY_BUS ?

> +	help
> +	  Common helper code shared by Realtek clock controller drivers.
> +
> +	  This provides utility functions and data structures used by
> +	  multiple Realtek clock implementations, and include integration
> +	  with reset controllers where required.
> +
> +endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> new file mode 100644
> index 000000000000..377ec776ee47
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += common.o
> diff --git a/drivers/clk/realtek/common.c b/drivers/clk/realtek/common.c
> new file mode 100644
> index 000000000000..c5aea15a3714
> --- /dev/null
> +++ b/drivers/clk/realtek/common.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation

If you are making changes here, should the copyrights be updated to
include 2026?

> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include "common.h"
> +
> +static int rtk_reset_controller_register(struct device *dev, const char *aux_name)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	adev = devm_auxiliary_device_create(dev, aux_name, NULL);
> +
> +	if (IS_ERR(adev))
> +		return PTR_ERR(adev);
> +	return 0;

Add newline before return.

> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc,
> +		  const char *aux_name)
> +{
> +	int i, ret;
> +	struct regmap *regmap;
> +	struct device *dev = &pdev->dev;

Put variables in reverse Christmas tree order.

> +
> +	regmap = device_node_to_regmap(pdev->dev.of_node);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "failed to get regmap\n");
> +
> +	for (i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = regmap;
> +
> +	for (i = 0; i < desc->clk_data->num; i++) {
> +		struct clk_hw *hw = desc->clk_data->hws[i];
> +
> +		if (!hw)
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +
> +		if (ret) {

Remove newline before if.

> +			dev_warn(dev, "failed to register hw of clk%d: %d\n", i,
> +				 ret);
> +			desc->clk_data->hws[i] = NULL;

This chunk doesn't take into account probe deferrals.

Brian


