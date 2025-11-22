Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0679CFC533
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDvhYHA/fbbdGgTkayThEwai79CSZ5q92mkXb/kd034=; b=yPnyewyeDwHrSWLWojrjUeFkl6
	YvaAz2XCocqEgJOfN104FSKVFpjF4bg8VYawRXsXs8PLbBmHGcqOxuQTvOiN/MRuAkL8TLylCQu1n
	HzyUv7LWBV9x9W/AS0bwiPXHq2VipxokXLOc47Yply2zNOZMUWL0Hlf0G2t1nueUyf6MH0Wlz+mEx
	S7/vTWv+5JMEwROPctYoQc7XxGSRYYBGgnoFq3I6jsENNX2wXfj9CxgVX8YUd43XXElfdgZsDGRM9
	mViehBSDRdGC3q6EQgeuJSGy2VsN36cnSZQCkKdte2RJlhYkrCRp6d+n1LWnD2IBAzJuR/WHL4E39
	hxRO+7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMnDS-00000009bEn-3E8z;
	Sat, 22 Nov 2025 12:59:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMnDP-00000009bE2-42Mn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 12:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6392E60180;
	Sat, 22 Nov 2025 12:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8410AC116D0;
	Sat, 22 Nov 2025 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763816387;
	bh=lU8e23cemYXKiQz6hMY/07BBnKwPI1FxngRSfte8urw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3bEfjx84UN2rXBcH2W4kC/VfiT7mbT8zFHnSzp6dvnrXy9r1I9uRvuLj42IbEjBO
	 MF2ivrM+tas/zGgi6TZY6afpip/J/zkFDQkfF4GDePF7+ZtLF8aQaXEYrQ/tUtvHrf
	 TeQbaq3zHs1j6VSAdDV+ONdOktwafZWejueow3UA=
Date: Sat, 22 Nov 2025 13:59:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <2025112226-heave-refrain-53e6@gregkh>
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-controller-v8-2-e7562e0df658@google.com>
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

On Sat, Nov 22, 2025 at 09:32:06AM +0000, Roy Luo wrote:
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
>  	  the dwc3 child node in the device tree.
>  	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
>  
> +config USB_DWC3_GOOGLE
> +	tristate "Google Platform"
> +	depends on COMPILE_TEST
> +	depends on OF && COMMON_CLK && RESET_CONTROLLER

Shouldn't this be:
	depends on (OF && COMMON_CLK && RESET_CONTROLLER) || COMPILE_TEST

I shouldn't have to enable those options to just get a build test here,
the apis should be properly stubbed out if those options are not
enabled, right?

thanks,

greg k-h

