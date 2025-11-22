Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4512FCFC531
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7dDNnPiMMP85/72TCme1ouVqDZPTrk0ygMjB/7tcaY=; b=kDF2qC9EuPGa8rDPijmG23hQoJ
	hXGuakO0dDyKFB8i+DL6UCacY6ozxRk/f1UsqI7SLBm8rpXB70VXDe0sVMD6GsNeUn4fd+OPuIz5E
	XQXMzWF+PX0XQs8a41LUpxsFHUNZWkgdccrkHCYWNN1oOZgv0lmHvrEY7HWapoNABHNI0mrh7Tki/
	g+wUV5JUIXbWYicp2HQmIxgnagxjjsYc3Q/if1FTV53d5xVJQpIVQ5BJCPuBli8Osk9tWLhrwcLv0
	2SQDfeHV6tadd8v7/XWHeNxv7yZF+eIXb5U8cCZj+PzNI7gIbqenuaELPzvwxif+gnDOWg3KoFeBA
	AyBcYhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMmpl-00000009YVi-3Yp2;
	Sat, 22 Nov 2025 12:35:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMmpk-00000009YVZ-2c6F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 12:35:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F16860153;
	Sat, 22 Nov 2025 12:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCC3C4CEF5;
	Sat, 22 Nov 2025 12:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763814917;
	bh=mXHHgeiUlhJ4Ko8Q0J+WX5MHnWYEekXcVNTmh/1dM7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zEVBksh0CtxT5twtiv2E47j8wpEZsf20ttbGryy8TC6LriXJ9I4+iNc20NBh2jsWi
	 kLKwg9as3qiLVaY2fwiuoUQMmpjDqPQXMH3zrL0TP/fQVX9N2aw+YfBeML2LOihTlY
	 6Z4qeBMAhnujl8NAav9ilIRS1KANyj6H3UXQD0/g=
Date: Sat, 22 Nov 2025 13:35:15 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Roy Luo <royluo@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Message-ID: <2025112248-spoon-waffle-a508@gregkh>
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com>
 <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
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

On Sat, Nov 22, 2025 at 11:58:39AM +0000, Peter Griffin wrote:
> Hi Roy,
> 
> Thanks for your patch. It's great to see Laguna support being added upstream.
> 
> On Sat, 22 Nov 2025 at 09:32, Roy Luo <royluo@google.com> wrote:
> >
> > Add support for the DWC3 USB controller found on Google Tensor G5
> > (codename: laguna). The controller features dual-role functionality
> > and hibernation.
> >
> > The primary focus is implementing hibernation support in host mode,
> > enabling the controller to enter a low-power state (D3). This is
> > particularly relevant during system power state transition and
> > runtime power management for power efficiency.
> > Highlights:
> > - Align suspend callback with dwc3_suspend_common() for deciding
> >   between a full teardown and hibernation in host mode.
> > - Integration with `psw` (power switchable) and `top` power domains,
> >   managing their states and device links to support hibernation.
> > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> >   `psw` power domain events to manage controller state
> >   transitions to/from D3.
> > - Coordination of the `non_sticky` reset during power state
> >   transitions, asserting it on D3 entry and deasserting on D0 entry
> >   in hibernation scenario.
> > - Handling of high-speed and super-speed PME interrupts
> >   that are generated by remote wakeup during hibernation.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/Kconfig       |  13 +
> >  drivers/usb/dwc3/Makefile      |   1 +
> >  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 642 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0abea88572d9ae81e26 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
> >           the dwc3 child node in the device tree.
> >           Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
> >
> > +config USB_DWC3_GOOGLE
> > +       tristate "Google Platform"
> > +       depends on COMPILE_TEST
> > +       depends on OF && COMMON_CLK && RESET_CONTROLLER
> > +       help
> > +         Support the DesignWare Core USB3 IP found on Google Tensor
> > +         SoCs, starting with the G5 generation. This driver includes
> 
> consider adding: (Laguna)

What is "laguna" and why should it be listed here?

> > +         support for hibernation in host mode.
> > +         Say 'Y' or 'M' if you have one such device.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called dwc3-google.ko.
> > +
> >  endif
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 96469e48ff9d189cc8d0b65e65424eae2158bcfe..cf1cd408d938b3ac26d58b9be7fcc5af3ee82660 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -58,3 +58,4 @@ obj-$(CONFIG_USB_DWC3_XILINX)         += dwc3-xilinx.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)          += dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)             += dwc3-rtk.o
> >  obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)    += dwc3-generic-plat.o
> > +obj-$(CONFIG_USB_DWC3_GOOGLE)          += dwc3-google.o
> > diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..53e04a5409d8a11eb025b0f5cd351cb1b33281ab
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-google.c
> > @@ -0,0 +1,628 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * dwc3-google.c - Google DWC3 Specific Glue Layer
> > + *
> > + * Copyright (c) 2025, Google LLC
> > + * Author: Roy Luo <royluo@google.com>
> > + */
> > +
> > +#include <linux/of.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/irq.h>
> > +#include <linux/clk.h>
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> 
> Please sort the headers alphabetically. It helps avoid duplicates and
> is easier when adding new headers.

There is no such requirement for USB drivers.

thanks,

greg k-h

