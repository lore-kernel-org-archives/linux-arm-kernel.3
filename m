Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD517CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhvZambXhJUe9NXP8fPYlMTJocXdYHeRZkXktKu8p/w=; b=q6osJSEifkQfbYY409VIf9gikY
	8q3wX7MCOzjL6ZZQAQuzZ2AedM1f73qJa2cl2v5YGzHEeiE2u+9tXoIpcltt8aBpB9/j/IL7FBXUE
	lXfPg0QOlRg0kuDZAgJ/2t9vjOZbnPNUpDXAfaJteEv3YbtH1+1m9D4kUglh7alkQn0Obcckwmj1R
	V4zq4Za75YUrJEEgbnTz9uM7dhwlh/vpJSiW41rV6P07SZrsMUU1iH4tOkqSCx4mverxXgWBi3OPK
	f7L2CWFddibnxnliLC04soGDB0G5L+Zgji8ADAiRZNyIJ8tvMUxMLBVXOMRLYGL6nPhjhMCDWBZnY
	861xnTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIuO-00000009gCv-2CI4;
	Fri, 24 Oct 2025 14:36:48 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIuM-00000009gC0-1NLh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:36:47 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so431356666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761316604; x=1761921404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhvZambXhJUe9NXP8fPYlMTJocXdYHeRZkXktKu8p/w=;
        b=bS6ajTZTOt5blHYcqflTqP7uTv3oMJJlB/H2CGstLElTKJSHpC0sIVlLKvygn64kVN
         bnmCxqqh8Ir7cS4UmBATlhnQcdqvi5VGzzt46XWr5VodkeO16ur7KT2RvoSTVsobnQkv
         tHzj/BqAhiT2E3Fx1Tox6BFJOpwctd/+d538sOyUncjv9vsG0QwFAH7pz9AZOJZ+7JW+
         5GgchCAsCqj1vVn1a/XS7ndkzoxZ6N3IETwN27+enS86rH4+iYkprHTcN96g3Orn6Etl
         L7YyEhskf06xw9MYwLaRU5KPZ7V9a2cVOoUbEQALrcmkxHS8+hYCuJMrNDwMwDjA/G3F
         vokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761316604; x=1761921404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhvZambXhJUe9NXP8fPYlMTJocXdYHeRZkXktKu8p/w=;
        b=LUdddwgC/Ziro5j8v7dn2RNqwjzuUYsDcRpfE7ZCb+kIOi7ym5ezmpe/KMT5Issd2O
         Zsa+6Qwc35AwG+Vu0Lonk/QvtgupEsyQLNPpjTL3Mlp8Dy8EjVAEm7+lDl6TaYTEN41b
         ZzApryryAsyZmKmKezr1CJ5VVQrazaxN2hY6HYuRNjj1sWkvgaqPf/7oufwqYZRdlhGQ
         DL/ni2dNgRDnp0ve2K5npWdH0nHdo9gNyVZE3zH+27Fw0S/QConjyJAZKSQDVlON8Y3j
         RAI65OVmHHytprMV2qncBrHzcm5qTxmYpmXmNkEZfOvrUG+w44w5hoPidnFhprMnWcWF
         rIrw==
X-Forwarded-Encrypted: i=1; AJvYcCU0c1jDJq2HvB6BYeTvf5C3jYT/JNJ0aiThWDWEpP3Dc2IDaTWNeMhzezZcrVv8okyBYdZjbb/h2eZcE/3NSvtg@lists.infradead.org
X-Gm-Message-State: AOJu0YxCWfyJONgzjVBQ0GwnC4m2eH+uwy8gmLoGlrY6KwB9rc0NQ90u
	ywSy7MwlzksDDszth2eyz7EMCx/WIt9H5xOajibfrQWgJ5hKCE5duwyS
X-Gm-Gg: ASbGnctN1ZOR1sXYJNbn6wKQsOs1GtenJiS4Bu0ynxL+6HlgvT6k8/pX0FtaqSoLASZ
	lSmY6IcQQbwsr7be8bBgZF58hgI6XRy1ASH6A/S2fGPdVMBuNB5Etw1GNPa/bLGzgKf2ps+tXIF
	RrsyIobiq+els2pgvbUiTSDtxWzC+vuCKbAUTDXysTd8v/L0CA8x+5nhgWa7Q4aYcaYizOHrsI9
	gxmXx2Od+3M0CZ0vu6JRJDJr3f7OkrqMQ1OCJCou0DigCVjU9Q7W+AgHlGaQ3EE7AmCForXpMtQ
	M9jMZVQkupUGpYOjYaFGbTNfsfvfDgnwFH/n1IACvJr23s2XorMpb4aTU+eYxHWbMjkqICmFWOk
	YYeSEMKL0TarHKMjP1D1uUZk5i+GxWoKzZshscAX0EUarBIGdm6EFASs5sntxPx/it/0fg0BNZd
	lyORlwXQFxVRvLWeIqdFPeKKKrM2lWHRuMpgMVtqdNiau7yBDU3Pr0rLFodnP5XEjbGJBf2Fp7T
	g==
X-Google-Smtp-Source: AGHT+IFWzk1i+CerdLmqkWlqmK1WwF08rParHoWAXsc4qXFYfSSN7IC++HtkBe/tPf9ihHXuOS5S/Q==
X-Received: by 2002:a17:907:1c8b:b0:b45:27e0:7f35 with SMTP id a640c23a62f3a-b6d6ffe1b10mr309334466b.46.1761316602897;
        Fri, 24 Oct 2025 07:36:42 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d514172besm545726366b.46.2025.10.24.07.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:36:42 -0700 (PDT)
Date: Fri, 24 Oct 2025 16:36:40 +0200
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add jtag
 overlay
Message-ID: <aPuO+FCeeIFv3bQm@alb3rt0-ThinkPad-P15-Gen-1>
References: <20251007084028.1125185-1-primoz.fiser@norik.com>
 <aPt/d9svTeUIRljW@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPt/d9svTeUIRljW@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_073646_380996_E8989E11 
X-CRM114-Status: GOOD (  21.47  )
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

On Fri, Oct 24, 2025 at 09:30:31AM -0400, Frank Li wrote:
> On Tue, Oct 07, 2025 at 10:40:27AM +0200, Primoz Fiser wrote:
> > Add overlay to enable JTAG pins on the board's JTAG (X41) connector.
> >
> > Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |  2 ++
> >  .../freescale/imx93-phyboard-nash-jtag.dtso   | 26 +++++++++++++++++++
> >  2 files changed, 28 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 525ef180481d..c72a6fdc5412 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -356,10 +356,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> >
> > +imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
> >  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
> >  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
> >  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
> >  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> > +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> > new file mode 100644
> > index 000000000000..4744eabf95f3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> > + * Author: Primoz Fiser <primoz.fiser@norik.com>
> > + */
> > +
> > +#include "imx93-pinfunc.h"
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&gpio2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_jtag>;
> > +};
> 
> Use gpio to set pinctrl to no-gpio mode is strange. I am not sure if there
> are better method, but at need comments here to show why have to do that.
> 

In old imx6 platform we use pinctrl_hog for that purpose, is not?

> Frank
> > +
> > +&iomuxc {
> > +	pinctrl_jtag: jtaggrp {
> > +		fsl,pins = <
> > +			MX93_PAD_GPIO_IO24__JTAG_MUX_TDO	0x31e
> > +			MX93_PAD_GPIO_IO25__JTAG_MUX_TCK	0x31e
> > +			MX93_PAD_GPIO_IO26__JTAG_MUX_TDI	0x31e
> > +			MX93_PAD_GPIO_IO27__JTAG_MUX_TMS	0x31e
> > +		>;
> > +	};
> > +};
> > --
> > 2.34.1
> >
> 

