Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F6CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rl6JhS65mEEXMmU5m1MLq7qtdOHWcdMQWYuFmQvPLeI=; b=DCiDpE6Me46QZ+Th8AWHJEZ6Z3
	N4lcTjc39EoCF8pYrR58vuo6DvTpK9kW+PLNH49fa5i2teGYlmKYqAFpqOxkZSRzhe8x629NjiMV9
	/XwjeM+uoAdY5l5+uR2tphS3PHhkjFw8M1GACZIhBWJltUZuoZDQX3+y128QWAKc7gC3bbYqObETq
	MF2ffHRCvX8JV1ljlDycD4/8r9MAMtw/QtEECSVGBj5/jcAt68C31ztp8fe7DApdG+48PMjnslS2g
	UMPtgopmfY2M/h+Me1Gz/swM28cXgTZ5gVpXQZEj87fK54DAu91d8O54UX5g9O38pWRwj9y8CTNfF
	KwnVJiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SF9-00000006UQT-2TAm;
	Tue, 15 Sep 2026 12:26:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SF6-00000006UPd-3t06
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rl6JhS65mEEXMmU5m1MLq7qtdOHWcdMQWYuFmQvPLeI=; b=Cp0x+OA/RFaOZa49a9knzxdVpO
	ft6XOyUD957p65T/C/zmyn/jSBDlBmNq9p/AGynxIogIkOrHPjOIS0EDjt1B9X2g1nBcA51bowqKm
	CNeUU9HvU43FbhqVvtoY7mx/dbD8xDkjM7MJ4tBKAjsNATWPFjVOCJ9rCev6OYlLSfyvP7V02rwLz
	+swCXbdS6jjchSVZRaXp/FcCMNWyDz1UYX/tKzJI6eYUFiq5LXJ1qI0SXsYUo6n2iQ5G2Wu9q+eYg
	v6rUqj0HIfa2pvc7NusUFZ28ATCyxIvZyU2z+ZEasTRDqLSOWXdBEMZNzOAYZNO/jFGytGkActcQH
	dh0ux+0w==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SF2-00000006jVz-33pf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:26:31 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d097b4939so14680865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789475186; x=1790079986; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rl6JhS65mEEXMmU5m1MLq7qtdOHWcdMQWYuFmQvPLeI=;
        b=du3z6sKlKq/hi60peHrDHH87X+4lSNuU6/2NZLGD/D9kSnxfjK31fIuRrKIlWJEN/v
         6QHbPOE5ynWXbDxBBXVAEM00fwhSnbfgKQbI5cFALrqlQmLgTTnDc4DpqSUbhJ7qkRjg
         BFCIbTmib3zug+lZRmGFoqippaqL2oYqVEdfObsWBMCjWs186YNGh3e6EdT8Y1zwqd1j
         FnkZ/DObpSck6gghN05wAmbbuswlaFu++ZhbQMdVjzgJGbjG3JUOVL0lqR0eg+77EXzO
         va3TA0nexFOK1hfSXcz+9vop7sIb1qLU5hm+/YgSs1x4eDafdcPhLrEwFw7CMdWSbIoV
         gPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475186; x=1790079986;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rl6JhS65mEEXMmU5m1MLq7qtdOHWcdMQWYuFmQvPLeI=;
        b=nVvpCoYrM2sM7GoGd38n5tQwSD+KQ80ik8/WllpGfIQfPiviIwEnecSiE9hnSXplXg
         a2WjxK/D9xAfvalG233NP83krihh4ezvaZ98vOIQ1gam5+cpBJs8PZqv2khnczzuYInt
         meQZUpTZZC/Jxocg7785OsFl8meOizEc2/qKyXGq/LWaDHdpTWKKtC1dGHBqd/9eekIq
         ykOYlk5EXj8IKM0DUb00ImzNGdbkay5ae26vp6c+LVjwea4HUoYFRfZWzy7WrITJLSjQ
         hJ3VCGgK7hfjsn13hrIDOaVA9bfPfOJzHj2BzHlkMeDgbN4vdW1Wfv/h92EtDVKjJSfp
         rREg==
X-Forwarded-Encrypted: i=1; AKwUvBw6nS1ZOkJoyXFzdwGBEdR6EbfZq6FcsUcJ3yryQNkAe54q1/XWNHihnJiPy67qJ6KjphzBmtXEiBHwbfK+MZdB@lists.infradead.org
X-Gm-Message-State: AFuF++kHpKzNI7S6L8pbMhQCfOBBJyfEUv80idcf8GHANmrWs/qtqBfJ
	7xmJzEknStpiUtZXibkFuNrypv53Omajp0Pac2ZI8sB7WYnKnRq301KUA3HYGftvZZc=
X-Gm-Gg: AYBFou0o5aeU6X0+XXQyqLlvFzf35xZ/jlPc/C+jFaIpIaPiSV3JwV0IfoF0f4oaR8B
	E0PcWNhUgDKcdauRGhehwP0+v/hNuPH1EmGdJiR2a4VNk/xK+Cy0P8DSQE1Yp8lbGVjnwLD34oA
	bse+OUBgWoZEx085USLZpcF6jDU8XYwdwp0cw91I0T6RjVOV3NqyasbRK76v3/gMg++BTNxzzy8
	oOAV3rOhS5kofDv8FD9U3iddHbWOaPGzKpfck/NW9woE1ftgySu/rPMMayc7Zl0rErmi2GCg+Kq
	+LqmKj21t2hF+mpUJ4Q3J7S3vL1+qTLllXi2abCopS+O7plnDAPcnxGRtQQSr2JdZPVN/QEiqcl
	7T730gHhLfbSE+Z2qtAEPCMf+dV6M0Ymiowd2wOcOiY0qqzodvq3K/m9u9IYVUCJLbImddISWtt
	V0A70mzviANIiClD9qJ+GRSCSeiTScClF5Ch9a9II3S9DdPO+/HDLdAqmN79+1KzqvdzTN8F+fx
	W7pSxiKRhrpzXjt1YBtn+F92PRY
X-Received: by 2002:a05:600c:3146:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49e7a668896mr82505995e9.14.1789475186101;
        Tue, 15 Sep 2026 05:26:26 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm35902151f8f.37.2026.09.15.05.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:26:24 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 04/11] clk: realtek: Introduce common probe()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, cylee12@realtek.com, afaerber@suse.com, 
 jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260901072446.2563145-5-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-5-eleanor.lin@realtek.com>
Date: Tue, 15 Sep 2026 14:26:17 +0200
Message-Id: <178947517742.448573.7975580808033616494.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8639; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/ZojfrfW2IBmBEs/62KEYt1EejWBbGxWHSboAcJDbR0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqqTlp3tsdp4MPJHxbixeJs86XTBzouL9QFlD0n
 NgQqhlviAmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqk5aQAKCRDm/A8cN/La
 hVcqEAC06hi67ejmVN0pfal7W+Ank37EH6X16+Vg0CoMR3Pq/l7qoxRk54s/dggclfphngsEJu5
 mVN37m4pUeCSoDB9CGjiINgNOFsun7jILbGph/+qXO7myjAyg4OKrWw7CqJBVs2tk8umrkflQgm
 MEZw+vfJ6otkFvZ1N+c5P3OC84J7hX8afjyPgOJBzMIre67Z28iDVDoyagVoB/DNy51eRAlt691
 iiVODXcW9ZW/xGSsC8REGVE9YJXIWRp25y84Vq/nmDwtTxX5jjTtSUaNHf6vbKQ1NjNzPdOxnnH
 Jw3ah04M+P3BTSi1hTyl8A7ilQwACqyg0QlTN2lbbPJeXYM+74JAoQ2C5mj88fZAR0FW36RvU/S
 NqfAoJZEL+L6IeiFtYMg3+3F5laPUwbZZbrfaOXUhvTFcw3d5qH05/qrEIpy8UcBLm5IWsBXkYO
 +PWcCASubDTPEmpGzcAc2r/KLdRSzIzAFG3vd8w6H16VKdhLbivuUw0Q2C4u+DfItBphRDdp+5f
 9TplNL8t8Nyp8YbPFIMPJyp7qXhDWsba8r9sEj+22JHLeAqRkT3ausAzFi9a4qr/+g7SJeblcrQ
 LIZ/ZZO4vkeLla1qucfBa2gOOVW6B5UAv78BEG5hbgfzSYbKwo46T9bbTKVg1HE6zWGVAc2jxUO
 er+YctuH4W4zpHg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_132628_905607_A212F0F6 
X-CRM114-Status: GOOD (  35.31  )
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

On 2026-09-01 15:24 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
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
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v14:
> - Move Reviewed-by tags to the correct position.
> - Use devm_platform_ioremap_resource() + devm_regmap_init_mmio() instead
> of device_node_to_regmap().
> - Drop rtk_clk_remove().
> ---
>  MAINTAINERS                          |  1 +
>  drivers/clk/Kconfig                  |  1 +
>  drivers/clk/Makefile                 |  1 +
>  drivers/clk/realtek/Kconfig          | 30 ++++++++++
>  drivers/clk/realtek/Makefile         |  4 ++
>  drivers/clk/realtek/clk-rtk-common.c | 82 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-rtk-common.h | 37 +++++++++++++
>  7 files changed, 156 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.c
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a752551f32f9..e55eb1c06119 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22746,6 +22746,7 @@ M:	Cheng-Yu Lee <cylee12@realtek.com>
>  M:	Yu-Chun Lin <eleanor.lin@realtek.com>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a907..97ad817457db 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -525,6 +525,7 @@ source "drivers/clk/nuvoton/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/ralink/Kconfig"
> +source "drivers/clk/realtek/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a900..b1aa373e9f84 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -141,6 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>  obj-y					+= ralink/
> +obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
>  obj-y					+= renesas/
>  obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 000000000000..778f5b4a967a
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	tristate "Clock driver for Realtek SoCs"
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
> +	depends on RESET_CONTROLLER
> +	select AUXILIARY_BUS
> +	select REGMAP_MMIO
> +	select RESET_RTK_COMMON

Is there compile time dependency with reset that I missed ?
The point of the aux bus is to remove such dep

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
> index 000000000000..13000ed4ba11
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += clk-rtk-common.o
> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/clk-rtk-common.c
> new file mode 100644
> index 000000000000..493f2d5588d0
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include "clk-rtk-common.h"
> +
> +static int rtk_reset_controller_register(struct device *dev, const char *aux_name,
> +					 struct regmap *map)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	if (!aux_name) {
> +		dev_err(dev, "DTS requires reset controller, but aux_name is missing\n");
> +		return -EINVAL;
> +	}
> +
> +	adev = devm_auxiliary_device_create(dev, aux_name, (void *)map);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config rtk_clk_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +};
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	struct clk_hw *hw;
> +	int i, ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &rtk_clk_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	for (i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = regmap;
> +
> +	for (i = 0; i < desc->clk_data->num; i++) {
> +		hw = desc->clk_data->hws[i];
> +		if (!hw)
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  desc->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	platform_set_drvdata(pdev, (void *)desc);
> +
> +	return rtk_reset_controller_register(dev, desc->aux_name, regmap);

sashiko report on Patch 10 is actually not a prexisting issue. it is here.
Could you address it ?

> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "CLK_REALTEK");
> +
> +MODULE_DESCRIPTION("Realtek clock infrastructure");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
> new file mode 100644
> index 000000000000..de3f23120b53
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2016-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_COMMON_H
> +#define __CLK_REALTEK_COMMON_H
> +
> +#include <linux/clk-provider.h>
> +
> +#define __rtk_clk_regmap_hw(_p) ((_p)->hw)
> +
> +struct device;
> +struct platform_device;
> +struct regmap;
> +
> +struct rtk_clk_regmap {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +};
> +
> +struct rtk_clk_desc {
> +	struct clk_hw_onecell_data *clk_data;
> +	struct rtk_clk_regmap **clks;
> +	size_t num_clks;
> +	char *aux_name;
> +};
> +
> +static inline struct rtk_clk_regmap *to_rtk_clk_regmap(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct rtk_clk_regmap, hw);
> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc);
> +
> +#endif /* __CLK_REALTEK_COMMON_H */
> -- 
> 2.43.0
> 
> 



