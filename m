Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07DACFC52A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBrm3JMtHLy7FDNmdG9NnfjfQSeL7J0SNX9N6hNH2js=; b=Sn5VlUNySjm0kQyr40AhAkReVi
	yMJ6opUXzdLMI3Qltwybv15No4OTqKhHqHybpH4hajnXHRTPTRbVP2hldGoVELpah6KzhAu5Mewnc
	SVaiojJ/J/1521yiSVslWa6U/GEQz4URfLbJgdqu32EPYhMeyNbNV6pkSzWua4RmraTEF/BEcCcup
	InFvwa7bXFmoXvGvznD1mNZ1eb5C1KtOs89N0nOk902zDKwtWkxY8Ppz9mrmIYziFbm89TcIBEHIE
	Joj0df16+H0Z+zV38pnmO8ZtqELTAmO75lM/8Zwa0KRCB+OSiYjwaY02tP2Ni99WyWqbbJCow87L/
	khths6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMmGV-00000009Wiu-09Cp;
	Sat, 22 Nov 2025 11:58:55 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMmGS-00000009WiO-10tZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 11:58:53 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ee2014c228so23567561cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 03:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763812730; x=1764417530; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBrm3JMtHLy7FDNmdG9NnfjfQSeL7J0SNX9N6hNH2js=;
        b=TPPobZiYFHCfTEYWoU/vkLB1Ci58kLlXFNlR0/iDvsbjU/B/oKW2X0lS5+dlf9dGzJ
         fOgBx1iELRT33n0sJvE0JJTw3sQGzhcvstmdI4xybg9nz1fGawxkkmy3taRLKeped91/
         cTK/ddiy9Eq6ARxskuSfsNxTd4Xv03d3z1Jr0GMFlYFdZSPnzQ5yKe1z8BlxFn7bMaKc
         KmuTDKd8Ar8Q+/+87sGR8vg1sqS4UJn8Az3ZV5yVHW0ZhT7eOQcl9Hz28+j7obtD03IY
         9SGmT/a9QS0kPl79IbJQbDfLaAc4iqpLGXOa3webyiLOzCsvJtWM9zlCSU/bRR7NAbM2
         PXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763812730; x=1764417530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBrm3JMtHLy7FDNmdG9NnfjfQSeL7J0SNX9N6hNH2js=;
        b=QOGhq1Y1wFjNYf14DpEmC0IYXpPr4CLPcdT4AE8wBroZSIQ5yobnc+1FPGNxx/i8Z8
         wkw9uVsOyg3eAHJG/Ow1nYhmivLRwaMowGlFn/jgE8Kn4D6Gqo1n/RpE2/i1lUCfn+6B
         Jyq4Ht3CNuNvdT2ktE41AS5kpdCGEEOeyNyVbuDwDT6lSJ1Wxf+HvM/iVRb+uq29dpTK
         xaK8bwDrJXTyADop1HmKLV7MvEyFKsCd+mM1Xhv2NKKFNWCZpJFUxcgCzX8Dd4tEBioe
         6oBSWjOh0aaQhRPGKMSMTXBnrZ62+f0a0CfxmV+GUPv5BFg4ZFu7dUK67jDZ1QRzO7Cx
         bAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS1mW6f5IZiwhM5IhdCGyPrMc/9yAgYgdHuMXXEjs3BiFBCixVHhdFQz9OUQ4FuWljUU1fju72OJkF7PEQLDjH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0gAlPJqQUe4vB4/BQuGO9CgNDFGk7UE97k97Y4fyhxTsUfz/3
	snB+1euCV2AUiJcgNlBgOrypGB0DYuUiG2fMxstXrVJrLK06fHREJO5ccV6vKrHyJc8jeiPIvpB
	jrW2PnAgKmGQ/B8pw0vmq041t5uiZC8waLCCbRxjbrKXqgKCnOv8x+VcWuA==
X-Gm-Gg: ASbGnctcbTCSRHw8isFxk5igqCYKQlzHLEk3TKeY5cRTczfE9owuD1oBh0Ea4Dwg0u/
	0UkejwyHa3EfiIwtlfNYsjrjoqOurmlsqwsxVHZJsMtryJe3twtV65y/uwVnENfcQMCWswJeKwa
	UdSML0SHt+w+cG/UkFLGRljecyOugqRpFhlW/U4Zix+wNKHDnckQSeryDw3yhwB1QvmiDAPSs9Y
	jLWVDAJzkIyMul0q8CNeARAAV7coJh4B1CV+4Ah/jBJqzwQclBYbAnfdj0Fs5GNoLx9XfE83bzX
	3KutoQ==
X-Google-Smtp-Source: AGHT+IHDkZQ+ImU9RTRugkonJf2E+hg917WnNusnwXVOvnWYJ8u+14drqRk1eQk1lC04UEf9Ur7igG1PLO7dWtr7QLg=
X-Received: by 2002:ac8:5d47:0:b0:4ee:5fc:43da with SMTP id
 d75a77b69052e-4ee588189c5mr66608501cf.11.1763812730384; Sat, 22 Nov 2025
 03:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com> <20251122-controller-v8-2-e7562e0df658@google.com>
In-Reply-To: <20251122-controller-v8-2-e7562e0df658@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 22 Nov 2025 11:58:39 +0000
X-Gm-Features: AWmQ_bmxr74_zcagVpTKmx_rF_8JcJE4EnUUPe-ZPMt4veKA7v9CBx5wm0awg0g
Message-ID: <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Roy Luo <royluo@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_035852_338333_C8002252 
X-CRM114-Status: GOOD (  29.06  )
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

Hi Roy,

Thanks for your patch. It's great to see Laguna support being added upstream.

On Sat, 22 Nov 2025 at 09:32, Roy Luo <royluo@google.com> wrote:
>
> Add support for the DWC3 USB controller found on Google Tensor G5
> (codename: laguna). The controller features dual-role functionality
> and hibernation.
>
> The primary focus is implementing hibernation support in host mode,
> enabling the controller to enter a low-power state (D3). This is
> particularly relevant during system power state transition and
> runtime power management for power efficiency.
> Highlights:
> - Align suspend callback with dwc3_suspend_common() for deciding
>   between a full teardown and hibernation in host mode.
> - Integration with `psw` (power switchable) and `top` power domains,
>   managing their states and device links to support hibernation.
> - A notifier callback dwc3_google_usb_psw_pd_notifier() for
>   `psw` power domain events to manage controller state
>   transitions to/from D3.
> - Coordination of the `non_sticky` reset during power state
>   transitions, asserting it on D3 entry and deasserting on D0 entry
>   in hibernation scenario.
> - Handling of high-speed and super-speed PME interrupts
>   that are generated by remote wakeup during hibernation.
>
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/usb/dwc3/Kconfig       |  13 +
>  drivers/usb/dwc3/Makefile      |   1 +
>  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 642 insertions(+)
>
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0abea88572d9ae81e26 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
>           the dwc3 child node in the device tree.
>           Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
>
> +config USB_DWC3_GOOGLE
> +       tristate "Google Platform"
> +       depends on COMPILE_TEST
> +       depends on OF && COMMON_CLK && RESET_CONTROLLER
> +       help
> +         Support the DesignWare Core USB3 IP found on Google Tensor
> +         SoCs, starting with the G5 generation. This driver includes

consider adding: (Laguna)

> +         support for hibernation in host mode.
> +         Say 'Y' or 'M' if you have one such device.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called dwc3-google.ko.
> +
>  endif
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index 96469e48ff9d189cc8d0b65e65424eae2158bcfe..cf1cd408d938b3ac26d58b9be7fcc5af3ee82660 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -58,3 +58,4 @@ obj-$(CONFIG_USB_DWC3_XILINX)         += dwc3-xilinx.o
>  obj-$(CONFIG_USB_DWC3_OCTEON)          += dwc3-octeon.o
>  obj-$(CONFIG_USB_DWC3_RTK)             += dwc3-rtk.o
>  obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)    += dwc3-generic-plat.o
> +obj-$(CONFIG_USB_DWC3_GOOGLE)          += dwc3-google.o
> diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..53e04a5409d8a11eb025b0f5cd351cb1b33281ab
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-google.c
> @@ -0,0 +1,628 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dwc3-google.c - Google DWC3 Specific Glue Layer
> + *
> + * Copyright (c) 2025, Google LLC
> + * Author: Roy Luo <royluo@google.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/bitfield.h>
> +#include <linux/irq.h>
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/pm_domain.h>
> +#include <linux/iopoll.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

Please sort the headers alphabetically. It helps avoid duplicates and
is easier when adding new headers.

Also can you add this file, and the bindings patch to the Tensor SoC
MAINTAINERS entry, so it's easier to review future patches?

With those nits  addressed:
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter.

