Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96825C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 23:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeivJRV1NlwEM68DYnpxYNj/SFkkK7NrLDkX6W6GBRM=; b=QuooZL1noo/wJOxXAshzfHQnNe
	9MJHpP8DmwRHE9H52wIdZC4DYjwkbOeiW0PRdl82M7kgMaEYdmFjzbV1iwZ5TRrvB29KU+tYag0uc
	JHwCoa/lcG9mUFXQHFbREIbxG/V/BpJhwcuJVlBkKK5pr6H37JDmDTQXxdXPVBz+YTJ4rvRLgvrUw
	UTmx9NUYE/2I/yHT2KjKgeCXRO6qXV/DXbcMSycuTUtJTJJK7X0bITBtHtE+vx9rMrw0yArFYWUMf
	hDTlVMkUTTcEo13hR6ZysNGLrBlLkEZKxNsnBxcngxTzMgiltQNCG9ShNVVQnnNNsnqy7qoeuReQ7
	ye8CUg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX6cd-00000009mnI-1iUP;
	Wed, 02 Jul 2025 23:12:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX6aI-00000009mM1-0P8i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 23:09:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23633a6ac50so92800335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 16:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751497785; x=1752102585; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XeivJRV1NlwEM68DYnpxYNj/SFkkK7NrLDkX6W6GBRM=;
        b=ApT8Qzdj65TozkGzChZL/Y+VhuiPKzJdmXxQiHDDrijBt9HbxDnbloBu6cwgfjLRaK
         Q7or16tprZxcqHumLwpBnIZ1GWH4Lqk13cYZ6PWvgBALiybwwF/ZIqf8UTpoMM4dlyTd
         /c7T4s/G7P4tA0GgTihHIcANTtMmsOmz3f7NlU2AB0q/EBXti6/xonsAg6iOLZXRktsd
         XFbirhKw8yeK2V1KrF8xciA5XvGjRFxk1F3WTzQtOv7FgX6zYwkmm5ol1H7XTwUwZ8QM
         AR1+V7yP0OWZLU7B1JndSkYi6yhpy5HVnKlF6pzBlruainwBw4w39Zn0ew/bbpDCYJDG
         9M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751497785; x=1752102585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeivJRV1NlwEM68DYnpxYNj/SFkkK7NrLDkX6W6GBRM=;
        b=l/P+tQfhs0JbXgML1HqSLcM9cLN/kt2sc3ANUUdBJbpR5b5UQeoASoBQYQ94Kf65oh
         Mg1qw8t2UuQn0BOO2Rs8jEiU6epNVitSFQnsn+DYqlOwm+f2mtZkUj/zeQQpP6c2NAPJ
         w7Y0XrUh8ZfZk2MAl7u6vzSKUYJpln651Yhjr245rPWlzBFnjrgWc4NFjIe6+BtnjYlT
         gaL14Rkytr4wvDTJPILV3Dj6rp0ayO0Nnf73SeTMGJ4Z0Z0rxKvo1TbvEUzcFURpF36u
         iVFrTu5ASy1J6USZaQUNWxgau1RnGdKxjgv3kYCneqvqEvv8flfgX9uf1jJrkWmjxg1f
         va8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXA84HL5y0uCz0vtL1gArHcT0+V0Vpvw6M1yFRBDrtX0WEyQ8DzhpypZChZCMoJjLVBO/g90N75Eey+j8NwokIn@lists.infradead.org
X-Gm-Message-State: AOJu0YwKS19Nec0om3pDXOiNIr3aQhJyZbljDYBiwuSVMT6N/DssUrix
	Dfs3VGuqA663yQtj5YOjV0xs+T0drG33Ifxldt2inhlMVYNI7zFcpX2F
X-Gm-Gg: ASbGncuGkkO1kYjFA8fIfNy9UJiac4yJCg/VsFjkeOpZYdw7VSZfjPaFLMiwCoIt4uj
	JCjKSa5bnwisukM7xjE50hIX5rTjk+YpnlBX3pP9Co8mogVLW/P2b/8jte3cfP8kraVsKFvUM/C
	dtGEcRH/5ziVqbEqlbcgIGviXWtqisaLQokLHC5wP8jq+haCxeS64h1AfHiDdBWJldnypE8HRa5
	I3DO1ig1PB3kbhDc6LlT3W1tnWfqmGuD0JIkhKmaOWgQ5cX/BYVD1+0saHmL8LUTYRbb0D+0U/b
	9W3zm1roSpR6/L0iX0lWq/SdYnc6dG6eR7dIVxvAa3PqdlWyzs7MPK04jOpRqjOPomfhlq1gPew
	U6nbtBx7v9Q/+Z+n9qJEm+JqZZ5CyHT8zsK1yPN0=
X-Google-Smtp-Source: AGHT+IEVdT1zTpOAW82Mu/cKqzXbhhazsjZMaKYPAm5vkqC5kKsvAAVyqV0n0+btI2SrjFS8l0lO5Q==
X-Received: by 2002:a17:903:1ac4:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-23c6e593323mr74668905ad.31.1751497785135;
        Wed, 02 Jul 2025 16:09:45 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e244fsm142696605ad.12.2025.07.02.16.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 16:09:44 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:09:42 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_160946_134901_8E8897FF 
X-CRM114-Status: GOOD (  27.48  )
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

On Wed, Jul 02, 2025 at 09:40:40AM +0200, Andrew Lunn wrote:
> On Tue, Jul 01, 2025 at 10:04:16PM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add initial device tree for the Meta (Facebook) Darwin AST2600 BMC.
> > 
> > Darwin is Meta's rack switch platform with an AST2600 BMC integrated for
> > health monitoring purpose.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile             |  1 +
> >  .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 92 +++++++++++++++++++
> >  2 files changed, 93 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > 
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> > index 2e5f4833a073..debbfc0151f8 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >  	aspeed-bmc-facebook-bletchley.dtb \
> >  	aspeed-bmc-facebook-catalina.dtb \
> >  	aspeed-bmc-facebook-cmm.dtb \
> > +	aspeed-bmc-facebook-darwin.dtb \
> >  	aspeed-bmc-facebook-elbert.dtb \
> >  	aspeed-bmc-facebook-fuji.dtb \
> >  	aspeed-bmc-facebook-galaxy100.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > new file mode 100644
> > index 000000000000..f902230dada3
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > @@ -0,0 +1,92 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright (c) 2021 Facebook Inc.
> > +
> > +/dts-v1/;
> > +
> > +#include "ast2600-facebook-netbmc-common.dtsi"
> > +
> > +/ {
> > +	model = "Facebook Darwin BMC";
> > +	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
> > +
> > +	aliases {
> > +		serial0 = &uart5;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = &uart5;
> > +	};
> > +
> > +	iio-hwmon {
> > +		compatible = "iio-hwmon";
> > +		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> > +			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> > +			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> > +			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> > +	};
> > +
> > +	spi_gpio: spi {
> > +		num-chipselects = <1>;
> > +		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> > +
> > +/*
> > + * BMC's "mac3" controller is connected to BCM53134P's IMP_RGMII port
> > + * directly (fixed link, no PHY in between).
> > + * Note: BMC's "mdio0" controller is connected to BCM53134P's MDIO
> > + * interface, and the MDIO channel will be enabled in dts later (when
> > + * "bcm53xx" driver's probe failure is solved on the platform).
> > + */
> > +&mac3 {
> > +	status = "okay";
> > +	phy-mode = "rgmii";
> 
> How do RGMII delays work? Connections to switches have to be handled
> different to PHYs, to avoid double delays. But is there extra long
> clock lines? Or are you expecting the switch to add the delays?
> 
>       Andrew

Hi Andrew,

The delays are introduced in BMC MAC by setting SCU control registers in
u-boot. The delays on the switch side are disabled.

I will add some comments for the delays in v2 (after addressing the dts
schema warnings). Is that okay?


Thanks,

Tao

