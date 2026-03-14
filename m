Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD60105F7B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoqDt4LbtW5AMGMm9rNuxnS1cbyaHoCZLZrx/WSgAaA=; b=imh/iPthmbVY6N/Asvx92SvpdJ
	hyA1TRaglJXCG2eqLCf+yPqz07Rl/GUxsTfiDDPbJ8Bn8ThXy+72LLQH8UovVm9RV9rqZc3vC3oF/
	RPWbN6VlN6++TP5SMX74QFP3mkXdqFJtaan6MbQL1XmdJqLM08ryiam6KK6FlG8IQS2mWNrsIC7m8
	TK/k995LJ0ng7pY5vDzWjrvmV8T9FFeeNpDjMpu8TxYKsi1VkJvfvyQElc/ShGAoJhZTW/d6UMnqe
	Ik9H76vC3Ksh3L1YN2/HBkJf5xQSYzxXPpktS5N559yBW1uX0Mx0ckxij95brc78UdLR0p8+CJuo8
	S+c4Nl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1L9Z-00000001fR4-0KQX;
	Sat, 14 Mar 2026 09:19:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1L9W-00000001fQg-27wY;
	Sat, 14 Mar 2026 09:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44B9E43536;
	Sat, 14 Mar 2026 09:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98896C19425;
	Sat, 14 Mar 2026 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773479959;
	bh=YbB77Yc70N5EwVs5uQal1oO5lYDCV1c+r8TobCUec+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyDSe+ldITlSVLhJ9AfIV+C3Z93j4l7b8mlVxdCU/aHSesj4VMtdEVRqtGt8JJ67g
	 hTzexjMn4eUOCbvGTXbp3/lxcrR9RTCoh8Vo873TGHwap5L48OHOCVwj+WDWATjqL+
	 PgcNrYEsEhe12cbOdsw62Tr7bj/8S0k5faXWeO24dbt2Y0IXCLTqZPmEnVSknrA4ZA
	 kzPVp8qHe0UfUTVEvwQorBI7Zwxpf4aNp/3rcv2feMWY43vQv2wijbOokcE6g+KLsl
	 EVfvJuNG+1rZWDx6HU0VFwo9dv8VkcskdC6Tv+5EtA8rqko3yuur+FOJO1NvX59Wig
	 /eo74kzyl4NrQ==
Date: Sat, 14 Mar 2026 10:19:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	afaerber@suse.com, jyanchou@realtek.com, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v4 03/10] clk: realtek: Add basic reset support
Message-ID: <20260314-silky-goshawk-of-penetration-f00964@quoll>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
 <20260313081100.596224-4-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313081100.596224-4-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_021922_590364_5D4EA48B 
X-CRM114-Status: GOOD (  21.40  )
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

On Fri, Mar 13, 2026 at 04:10:53PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Define the reset operations backed by a regmap-based register
> interface and prepare the reset controller to be registered
> through the reset framework.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v4:
> - Add forward declaration for struct regmap in reset.h.
> - Move struct rtk_reset_data definition into reset.c as it's only used there.
> - Remove rtk_reset_reset() due to unnecessary implementation.
> - Remove unnecessary parameter from rtk_reset_get_id().
> ---
>  MAINTAINERS                  |   1 +
>  drivers/clk/Kconfig          |   1 +
>  drivers/clk/Makefile         |   1 +
>  drivers/clk/realtek/Kconfig  |  27 ++++++++++
>  drivers/clk/realtek/Makefile |   4 ++
>  drivers/clk/realtek/reset.c  | 104 +++++++++++++++++++++++++++++++++++
>  drivers/clk/realtek/reset.h  |  28 ++++++++++
>  7 files changed, 167 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/reset.c
>  create mode 100644 drivers/clk/realtek/reset.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b7d64cc8d90..53a2f3575c37 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22247,6 +22247,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  
>  REALTEK SPI-NAND
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
> index 000000000000..121158f11dd1
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	bool "Clock driver for Realtek SoCs"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default y
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

Reset drivers go to reset directory.

> +	select RESET_CONTROLLER
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
> index 000000000000..52267de2eef4
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += reset.o
> diff --git a/drivers/clk/realtek/reset.c b/drivers/clk/realtek/reset.c
> new file mode 100644
> index 000000000000..45713785d76d
> --- /dev/null
> +++ b/drivers/clk/realtek/reset.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include "reset.h"

And here is the proof that none of your reset header constants are
bindings - do you see the header here above? No.

Best regards,
Krzysztof


