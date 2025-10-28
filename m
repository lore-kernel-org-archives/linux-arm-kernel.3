Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B10CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYkrsJvRY/M4MaFVJOdOGBIZ0zXWhOCmDqeRXw+U7YE=; b=llNcwqcfbNlOv6knSEKJRy24qn
	KMAHPXHiK+vTOiUE0hEWbjEZ/yPSxNNH8LJdnmA1JzQ4CwjmRX8NQPfvDgjY3POZky7JFdg9Wjh+n
	RRzL3VWMWZ2R+9Niu1T55M5DdnvO6AE+B+PSsftkTIBqjFsORiB6U0Jx1DrZhLadZtjq8KI2Mr8Ya
	LRDrDdVXoirWeVGh4WGeG9qpa7/evVtxHoit74Q3z1GNoEZ2AOKum7s2wDX3TeEYiuY0yzBidijDN
	j3RKfpNtgGmabH+wSAtswbaegPPnOiXNEQiXko2kC6aWuAN1lEl5Wm1KquRayAfwY/+rHUY0zDqpS
	qdL5Natg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDez7-0000000FXf2-3Bys;
	Tue, 28 Oct 2025 08:23:17 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDez4-0000000FXeP-3Md2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 08:23:16 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b6d53684cfdso1262221066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761639792; x=1762244592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYkrsJvRY/M4MaFVJOdOGBIZ0zXWhOCmDqeRXw+U7YE=;
        b=IvQgSlPeUAiBz7bDnuVT19CvWyj5PqUYrDEr3SkscOB+TgkJBb23d6owjRsWFsQ8Ck
         p52kWMK6luBN0aF+b60Tju/3I+WYMnQT9ue6B+jCQDQTzH/Dl229Fgx+TIRDbh4uBZQp
         Sc2T1W10MuQVv9WhUNNYBusr5jYHMq+tuWH6F80v3SnuWvkG+BsBCcArxWmUy9CDdNUW
         MCOstJc3agKsnME1exgKivrKHn9vjliiQIJ0ehNQ6kLq33tdiQO5s/XTYbi3d0vOZidE
         MDfw/6yOEXe6BmtO9RKCjPq4dq49CpwyV9pttuZMxN5bVWcuXe9iKxdpRkpL/d/0Zta0
         hQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761639792; x=1762244592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYkrsJvRY/M4MaFVJOdOGBIZ0zXWhOCmDqeRXw+U7YE=;
        b=NLRycFfVyOpvrc29hcoCNsb4UyJQmJW5OxI6KwzNtHdQJWkQ/XcwlmoKGO889PLPlD
         Q2KoRNVtPqtiqvgh6YaJKy1a3IT6I4y1cZd58LzsAeV2lrCCRXyUkyTCzWJNAoxR7XQD
         1NsBde+qJNoIeNqm1FYsAdbsrI20tnlTCrsBz0UoXe5pnBoAndwlzkp0h93B8b/EEp7T
         jSB3FQb7b9VQLjxxJHzkAdobXX67R0o35kpq8hkk1jkJSgPJYJyZs8kZOos55lknRNEV
         przB1XofPp1nfM1QLz6///gNAHSgHnv4KKKJM5byly2yVla5kqigljU5Lm28U9aQQHrC
         tpIg==
X-Forwarded-Encrypted: i=1; AJvYcCXDDnXz5S1JFrZ9skMbyB6BhLPxhimwXulcRwbrD1iT1KHrgxEOKV3vxNkYVR9H6wf5c3jB+Lm0sDiw5xaFvWUJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyLiAE222HkY7onwbS4S6lp+1NeKWP8r+4f7WiVZKOpzd0nqMRj
	Vvst0lFSJ7xFFlhRerWOJDzTbbMCK4PckJ407ibfH+pxx2CZroaMWuiu
X-Gm-Gg: ASbGncvMC4u3BwlxmABNzxD+1IP3NRC2otdvJCPqr6h9JAkfKdAR8e3hlQYiC/F2qNh
	OoIUIqcVwlkHvp3oqS/xPr+7TBiYlpIjm4xDs+B/pVAP+Qnd0c5wyCWrYF2McSMAaKqrudWS9OG
	dBBMykZolZC1c+UtyuCIoWkjmD45hJfQOeDdbGG2gO4Jcau4+Gz12Du4C61Soe+qa3WO67sN8KP
	sM0y8FhRb+OdujnF0x/q7syYj0BlNNUh0R5tR86rbvmsVQA03lQLs50Qna5ZnXsbAbd4LvTmrcn
	F+/qJeCpX9Uu/E9/aNskUa8oTnoxkKAutKiC8EReYGMajGEyJifXl1p8p9V5DEA7nZxhJkMlsL/
	n1MaZqbF0TgJZGIbuqWsPTWAwVxfqQuj14rZC8yR97F/reDjscTYY/VJ+UjDgalWz6GwiGJDalL
	JKY/4t2ZrqukpqASd8mIcyEpvdDn62HB/FeO2L3iY+EZUGVMdGqDWAbBzy6AepwhRE667qzrecd
	A==
X-Google-Smtp-Source: AGHT+IFRsX11i6ttykwzSTE1MX3XcVT7zdJoHg0PldYmpaU3ps1bn6uVFu1p5RX3UmY4D7yABarLgw==
X-Received: by 2002:a17:907:6ea9:b0:b41:c602:c746 with SMTP id a640c23a62f3a-b6dba48c5ddmr306520266b.20.1761639791192;
        Tue, 28 Oct 2025 01:23:11 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077e8sm1024064566b.14.2025.10.28.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 01:23:10 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:23:07 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add jtag
 overlay
Message-ID: <aQB9azDkYN4RLU6+@alb3rt0-ThinkPad-P15-Gen-1>
References: <20251007084028.1125185-1-primoz.fiser@norik.com>
 <aPt/d9svTeUIRljW@lizhi-Precision-Tower-5810>
 <aPuO+FCeeIFv3bQm@alb3rt0-ThinkPad-P15-Gen-1>
 <aPuvYwwG5N84MwGA@lizhi-Precision-Tower-5810>
 <658fa62e-cc80-436a-9812-c67b0dc8de03@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658fa62e-cc80-436a-9812-c67b0dc8de03@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_012314_869434_E1BFE8D5 
X-CRM114-Status: GOOD (  29.36  )
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

On Tue, Oct 28, 2025 at 07:23:57AM +0100, Primoz Fiser wrote:
> Hi both,
> 
> On 24. 10. 25 18:54, Frank Li wrote:
> > On Fri, Oct 24, 2025 at 04:36:40PM +0200, Alberto Merciai wrote:
> >> On Fri, Oct 24, 2025 at 09:30:31AM -0400, Frank Li wrote:
> >>> On Tue, Oct 07, 2025 at 10:40:27AM +0200, Primoz Fiser wrote:
> >>>> Add overlay to enable JTAG pins on the board's JTAG (X41) connector.
> >>>>
> >>>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/freescale/Makefile        |  2 ++
> >>>>  .../freescale/imx93-phyboard-nash-jtag.dtso   | 26 +++++++++++++++++++
> >>>>  2 files changed, 28 insertions(+)
> >>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> >>>> index 525ef180481d..c72a6fdc5412 100644
> >>>> --- a/arch/arm64/boot/dts/freescale/Makefile
> >>>> +++ b/arch/arm64/boot/dts/freescale/Makefile
> >>>> @@ -356,10 +356,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> >>>>
> >>>> +imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
> >>>>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
> >>>>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
> >>>>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
> >>>>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> >>>> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
> >>>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
> >>>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> >>>> new file mode 100644
> >>>> index 000000000000..4744eabf95f3
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> >>>> @@ -0,0 +1,26 @@
> >>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >>>> +/*
> >>>> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> >>>> + * Author: Primoz Fiser <primoz.fiser@norik.com>
> >>>> + */
> >>>> +
> >>>> +#include "imx93-pinfunc.h"
> >>>> +
> >>>> +/dts-v1/;
> >>>> +/plugin/;
> >>>> +
> >>>> +&gpio2 {
> >>>> +	pinctrl-names = "default";
> >>>> +	pinctrl-0 = <&pinctrl_jtag>;
> >>>> +};
> >>>
> >>> Use gpio to set pinctrl to no-gpio mode is strange. I am not sure if there
> >>> are better method, but at need comments here to show why have to do that.
> >>>
> >>
> >> In old imx6 platform we use pinctrl_hog for that purpose, is not?
> > 
> > It'd better than gpio, but I am not sure if pinctrl_hog still be supported
> > because I have not seen it for the long time.
> > 
> 
> I am OK with both suggestions:
> 
> 1) adding an explanation comment
> 2) Using pinctrl_hog method
> 
> Personally however, I would prefer method 1) since it would be better in
> this case because base customer dts can already contain default
> pinctrl_hog which would be overwritten by this overlay.

Good point, that is true.

> 
> Not that common, but can still happen.
> 
> What do you suggest for v2? 

I would say 1, IMO explaining that with a comments is the most
explicit way to do that.

BR,
Alberto

> 
> BR,
> Primoz
> 
> > Frank
> >>
> >>> Frank
> >>>> +
> >>>> +&iomuxc {
> >>>> +	pinctrl_jtag: jtaggrp {
> >>>> +		fsl,pins = <
> >>>> +			MX93_PAD_GPIO_IO24__JTAG_MUX_TDO	0x31e
> >>>> +			MX93_PAD_GPIO_IO25__JTAG_MUX_TCK	0x31e
> >>>> +			MX93_PAD_GPIO_IO26__JTAG_MUX_TDI	0x31e
> >>>> +			MX93_PAD_GPIO_IO27__JTAG_MUX_TMS	0x31e
> >>>> +		>;
> >>>> +	};
> >>>> +};
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> 
> -- 
> Primoz Fiser
> phone: +386-41-390-545
> email: primoz.fiser@norik.com
> --
> Norik systems d.o.o.
> Your embedded software partner
> Slovenia, EU
> phone: +386-41-540-545
> email: info@norik.com
> 

