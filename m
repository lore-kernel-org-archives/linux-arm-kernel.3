Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1913CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjuUELaIuU1gd/2FdtvzglPjtUaEtmlP48ZimdLyUps=; b=1uXX1rnUzjxvZ4PQq4fyFxTpuG
	gJ335l2oArNg5PvR1aVbR7Z+9MPcaUmFiKwJovcHR+WBGeVW4e9ibW0Ow7uK8/OQ/of6OcAaYtdir
	SXZW0Zo4mmqSaoyA/haMpRNwvTST5ASpuI+DmMIY1donHGhZ5ovyUMHvmoaC3EzVmQnCj1vyazu02
	lVmgDimaJYGRjIqplXcVoLkgm6qZrfh4Cw43lUnzZGz6cZXsGuF048Pok5OBW/5JmjzqvR32K7QB8
	4nwFLCG2J/vfUOcI+l0QfmfM4yLLmB/51VAmwHeOJzpe/ZIGJ4Ltwgg8bjFTF84vENi5Z/bJajmuy
	cikIwJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLrL-000000053g0-0O3w;
	Tue, 02 Dec 2025 08:35:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLrI-000000053fX-0RZ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:35:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-297d4a56f97so75289975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764664538; x=1765269338; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjuUELaIuU1gd/2FdtvzglPjtUaEtmlP48ZimdLyUps=;
        b=c/ZFELOdq7LCd2+j5Oj3PuhBxRLdll6AeKUnNKbZ+3nFlpIaf+ZqBOmX4RNgSIr0fl
         2EMrDRNDdAaMp0N2cdw8Kp0iVRw3ejjU8APMR06AjF8/U0a5+p71Sp3E42lR6hKXid1J
         7bqnH6tDLuI8yYu0jb4jVgMXpZ6TFVz/hviAMdlhXVwfGYrrpar6Ig2WxDBLTh/L0Cme
         yVCRj/2gYZu0MQp7T81GLy534fuzODTg8SDf3q6/LI0EKQ5/EvQ4ynd4TtncPIrc/SiH
         phbzl5i7zG3wph+4PTrp7RfVwhOcoJxbkcCoKpdZ70yb28JHhJtOyHVPqvktsm9EAvqc
         eI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764664538; x=1765269338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjuUELaIuU1gd/2FdtvzglPjtUaEtmlP48ZimdLyUps=;
        b=oncy2DzfeQD9sSMb4rLiRKIAX91AyA1mLHHejCghM7RKru8YPhff/P4adREoEmlFg6
         cg3zV9PqxGgXFuKgcr39h+98tyPVPRLarUgRyVxpL7oNLzMOOSR5K92kJcRLeWzXkM8U
         9SaBiMi4LeHZAw8eQKtr0DlQNZ746YBb+yPU5My7BAiKD1Qwt+wXot4rsORV07pMJoNk
         3LyxSA9Wjs2BmEhyLJj6w2TClqaPlHg/b+ceMBZ/IjbA0z7hJzo4Au8mbXwabHm3F+P2
         mL8+5Iq3XePqiD3Arf/5hkj3fRO8uvG87KIH4Ul07SK9R860BZZVon3TMzFtBiAphqwm
         cbzA==
X-Forwarded-Encrypted: i=1; AJvYcCVstxlRzM/iYlpkyqbov726j0/SMpmW6w4pZhGd1CSPgjDAsedXYKMiPDnnzTHT8WG04jSD2bUR1mKrKD/JJss+@lists.infradead.org
X-Gm-Message-State: AOJu0YwvXr3ycVNwzxPIGmfXUlm8g70e1IX8pwIZovcMSoqzMSmtWBie
	uN56sxoy7CMs2W0c4xAWM5BswzSTeUXKvBy1vleSS3AtGx9Z9a4GFJlkKgVsc4zzgHoAedWB0eq
	Z3ZcqtLqEtUwe/ctSZnG0zAKoz+gYrUh329/PpOaT
X-Gm-Gg: ASbGncsYUHsQNIACflIG1dg3Yna2IPe2AGBniygyjX3Q5rpdbVos3Xw6m6S4xAvSunf
	X7Eo1e1s2pAifyNjQtOn0/1tnfo6kDCN//Qf9w4yzm8ca/1/Zh50HCZ9Fq2Jpm13Ypb4AlCkhdE
	Pj5JPfvLPrKzluqjXGknTIh94m+0sHSO3/GNf9pKCQ6KGRAiKp/hdCXvHSrpkLY3YkuOd4q1Ec+
	k9YzE5wZrCXBjDu09QFp6bwH+xD0DVAv/qjBZtH4b6ad2OaEJBXJgIf03DXMOLnJCoCrOPDiRXg
	7IUsWw==
X-Google-Smtp-Source: AGHT+IE4K+rC1T0nxBLda3rMJ7Xh3tPJApYjBfQYjhEN+PQBck3O++fb17f2VhiEsxBvds6BzbdMR2BO+hO3HQSpzKc=
X-Received: by 2002:a05:7301:4616:b0:2a4:50ca:9234 with SMTP id
 5a478bee46e88-2a719d7d25cmr21780225eec.26.1764664537612; Tue, 02 Dec 2025
 00:35:37 -0800 (PST)
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
In-Reply-To: <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Tue, 2 Dec 2025 02:35:00 -0600
X-Gm-Features: AWmQ_bl1YCwZSA7pQNoH9cFjlkJSn831NjN8Dq9QhCXB5pUpJEJxffvLo_epzic
Message-ID: <CA+zupgyopHGCCb-HcNvyi4m5-UDerYZFmT7S0cNYLYONz-wzwg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Peter Griffin <peter.griffin@linaro.org>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_003540_159030_AE0A9715 
X-CRM114-Status: GOOD (  36.31  )
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

On Sat, Nov 22, 2025 at 7:58=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Hi Roy,
>
> Thanks for your patch. It's great to see Laguna support being added upstr=
eam.
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
> >  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 642 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0a=
bea88572d9ae81e26 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
> >           the dwc3 child node in the device tree.
> >           Say 'Y' or 'M' here if your platform integrates DWC3 in a sim=
ilar way.
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

Ack, will add it in the next revision.

>
> > +         support for hibernation in host mode.
> > +         Say 'Y' or 'M' if you have one such device.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called dwc3-google.ko.
> > +
> >  endif
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 96469e48ff9d189cc8d0b65e65424eae2158bcfe..cf1cd408d938b3ac26d58b9=
be7fcc5af3ee82660 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -58,3 +58,4 @@ obj-$(CONFIG_USB_DWC3_XILINX)         +=3D dwc3-xilin=
x.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)          +=3D dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)             +=3D dwc3-rtk.o
> >  obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)    +=3D dwc3-generic-plat.o
> > +obj-$(CONFIG_USB_DWC3_GOOGLE)          +=3D dwc3-google.o
> > diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-goo=
gle.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..53e04a5409d8a11eb025b0f=
5cd351cb1b33281ab
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

As Greg pointed out, no such requirement exists for usb drivers, but
if it makes things look nicer, why not?
Will sort the headers alphabetically in the next revision.

>
> Also can you add this file, and the bindings patch to the Tensor SoC
> MAINTAINERS entry, so it's easier to review future patches?

Sure! Will update MAITAINERS in the next revision.
Appreciate the review!

Thanks,
Roy Luo


>
> With those nits  addressed:
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
>
> regards,
>
> Peter.

