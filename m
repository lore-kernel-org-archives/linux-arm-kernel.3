Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758DECFC279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mRwK/GPY7PLqPjwwcAMfUNKsKfCX0F4t9lk0tIB2Bw=; b=HgG7D5r+HLVMSchh/DrPEPQAye
	IHKBZeK885ooTI+4jOAOdifJJkLC5JM4olMD7NdaodWrzLYpg3AWJbXs3VGCyEaM/TsG0Kip6aGoU
	tJIHIBZ+zkpYed/enFxH3Mglx/NrBroLg8/Vg1dv+IfGenXh/AJIH1NcPIQRohrXzuEh3p8t99i2p
	B0FEHtMaFGf3T5yD3yO7hRnflbGoy5yoA9na5rpVWKbBxkeuw42B3HhkAj3I1yr+MlJuRX+0Pztv1
	p3u/lPml3R3N5+h4kMo3OoK1lTZRncgWqh+TSl6F/gOde85TzAy4/uq0fbcQvtMfPrg9IQceQi2zt
	uYX41XGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS5W-00000008WJc-1uvR;
	Fri, 21 Nov 2025 14:26:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMS5P-00000008WIN-0E4A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 14:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72AF94081D;
	Fri, 21 Nov 2025 14:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F5AC4CEF1;
	Fri, 21 Nov 2025 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763735166;
	bh=YbrPtkB06/Jg3xfKlxAAt1KSm17776sC1HO/GQZ1S88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhMTPHHbVjfqaYVVAyXmbfZ6m+WxBdDRDNMYB/aFueMvGaIimyUb3L6orZbC3BrCi
	 x4FPHuL/zwELdgYWE/x9SUl5ZFMdEVqWkCGId/cjsX+wyC8Io1ld2f/OKrOvDtb8NX
	 CF4w3J6HAfPSji1auxCoxp8e44KYJ0c+FrDMPGVA=
Date: Fri, 21 Nov 2025 15:21:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v7 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <2025112144-claw-recolor-49c3@gregkh>
References: <20251119093749.292926-1-royluo@google.com>
 <20251119093749.292926-3-royluo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119093749.292926-3-royluo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_062607_139997_B5D12D62 
X-CRM114-Status: GOOD (  24.44  )
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

On Wed, Nov 19, 2025 at 09:37:48AM +0000, Roy Luo wrote:
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
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Co-developed-by: Joy Chakraborty <joychakr@google.com>
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> Co-developed-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Naveen Kumar <mnkumar@google.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/usb/dwc3/Kconfig       |  10 +
>  drivers/usb/dwc3/Makefile      |   1 +
>  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++
>  3 files changed, 639 insertions(+)
>  create mode 100644 drivers/usb/dwc3/dwc3-google.c
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 4925d15084f8..bb0e4dc97da3 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -200,4 +200,14 @@ config USB_DWC3_GENERIC_PLAT
>  	  the dwc3 child node in the device tree.
>  	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
>  
> +config USB_DWC3_GOOGLE
> +	tristate "Google Platform"
> +	depends on OF && COMMON_CLK && RESET_CONTROLLER

No build testing?

> +	default n

This is always the default, no need to list it here.

> +	help
> +	  Support the DesignWare Core USB3 IP found on Google Tensor
> +	  SoCs, starting with the G5 generation. This driver includes
> +	  support for hibernation in host mode.
> +	  Say 'Y' or 'M' if you have one such device.

You forgot the module name :(

> +#define to_dwc3_google(d) container_of((d), struct dwc3_google, dwc)

container_of_const() please.


thanks,

greg k-h

