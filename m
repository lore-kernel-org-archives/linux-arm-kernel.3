Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F7ED13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMofVo8hbKk0Swbq8g7Wqb/qoQ7xBjUn4m5ktsUGG78=; b=AzLc3fvZ9GF+RjvBo55FFs+7QW
	oLqp295nER5/pu1MXbA5R4CFrAXp0YiUL+AwHkXaM83jRsyWBmLlbAEj7a4d5PmB8aIYqnHW0nS6N
	GodwF6g2AVQknQHxm5947JDO9Sbnr2MzMBW17Vvn6S4kD3u2FAbA+x1RKjynvf1J5+ENoK51fQxPm
	Lz+6M9tiiqN3+vuI7vHhXVzTNDNqGDFxRwxCXGEGAZBmOCk60fuQJQMfQzz6ihupvQxxsgR3S/52P
	zXorRr/AzLjlBa3jJibka5ve8e4vP/xzKc7cl2OFuAbP4ofp/Kgx3Pf3I1c1ppprdnXjbb74Rv1gs
	kkzDdRDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NCb-0000000AQrF-3znN;
	Mon, 28 Oct 2024 10:42:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5N70-0000000AQ6C-2Fff
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:36:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a99cc265e0aso638838966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730111797; x=1730716597; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMofVo8hbKk0Swbq8g7Wqb/qoQ7xBjUn4m5ktsUGG78=;
        b=C8JY5eKwPnuQ9gBro8tpn4G9g2djimeD29AUObazNSdobKvrRDs+agt+U2k521qo64
         RZ2OWSCbdzrJLtI0DNWH3rhpXzeEr2XfDRBSMK3fnnv7OoaDWFAPlOvuaie64RF8BVxR
         k5ZToDgJX4hwyHMhOkQYgj0TVW4aH8U+3PJFspvpFgwu31uhzRDoY19NU+CWTW70+4Dw
         c6i5Qgqfj63TZMH2Cpbca25dKqfFkRC4qCDDH442QS2nktzixcqwTsIrOgEvBAz6flhq
         bXnP1xOcXsD4w9gDxBijrnT3HwmyBr9x89Z86naaCgGXzUEOc0CXbmv45BIJlQrXVwSS
         6juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111797; x=1730716597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMofVo8hbKk0Swbq8g7Wqb/qoQ7xBjUn4m5ktsUGG78=;
        b=qxwMB7bQUyF135i65SmvO+OnnDHFlFev/oQ3VKHmM2GjPhY1msAF0OIEDhKcx685O4
         kBIyfC1IKQpeCsikhox60p4l7HYgt02efVHYAFb+FLdJlQjpKv138Y9yovFKalw+G+cw
         WlZZCDDUhGrYgmAC8OErwUFz0H5gi136h8zK+4o1Bsurj02dh3P/W3HLPLpVJQqpb7w/
         7Oaar2SvviwuxPR6oQwq6JEfxEzmTvis5CHEyoms0xf6EP9hyuTKA/Vr6VIAkyZkJYSE
         8EcdLDYwIJgVKPqMfquCO7vmKj3OlBYZxouyxUkwuFJhXOQaUsokbXIev9osX4BQNruu
         N6CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+kWIAwUDlTA9I/MIRGOXjn0IBGpCIJMl1deYuDdvGpmWCDWP9eMIecDgwsP9MjydwSLFvlmgME8AmgJfF7tjR@lists.infradead.org
X-Gm-Message-State: AOJu0YzF1AiBOV8tignd8HBJv69lcoSFsFkb47jE9IfrCRjo4GxmyTWj
	jSXu9f9KcbEd6MaMGwtzbqLYML2PFpoEMjs6jRAoSrcTpPcm5h43gvqjIESUf7Y=
X-Google-Smtp-Source: AGHT+IE71P+Tc8wEJl1++AmZI7Lie6dR5rgB/dlxrq9d7RRZ7akirpK4bMRLI/OEdqic/AucIdtIBA==
X-Received: by 2002:a17:907:7da2:b0:a9a:6752:ba80 with SMTP id a640c23a62f3a-a9de5d6e1dcmr779581466b.5.1730111796750;
        Mon, 28 Oct 2024 03:36:36 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30c7af41sm362413266b.157.2024.10.28.03.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:36:36 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 28 Oct 2024 11:36:59 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 14/14] arm64: defconfig: Enable RP1 misc/clock/gpio
 drivers
Message-ID: <Zx9pS-195by58cEN@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <6964b1728d155b85c9c97fe26726e8ee2c04abf8.1728300190.git.andrea.porta@suse.com>
 <7y4rgefxfst5y7xgvtwhv6dulxjd7ieou5jlqi3waqwyw6vpuq@xken3govscld>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7y4rgefxfst5y7xgvtwhv6dulxjd7ieou5jlqi3waqwyw6vpuq@xken3govscld>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_033638_585977_77AAF69E 
X-CRM114-Status: GOOD (  21.38  )
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

Hi Krzysztof,

On 08:32 Tue 08 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 07, 2024 at 02:39:57PM +0200, Andrea della Porta wrote:
> > Select the RP1 drivers needed to operate the PCI endpoint containing
> > several peripherals such as Ethernet and USB Controller. This chip is
> > present on RaspberryPi 5.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  arch/arm64/configs/defconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 5fdbfea7a5b2..5fcd9ae0d373 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
> >  CONFIG_PINCTRL_QCS404=y
> >  CONFIG_PINCTRL_QDF2XXX=y
> >  CONFIG_PINCTRL_QDU1000=y
> > +CONFIG_PINCTRL_RP1=y
> 
> Module, that's not a SoC component.

This driver was born as a builtin only one, indeed it is bool and not
tristate in Kconfig and is registered through builtin_platform_driver().
Hence I've set it =y in defconfig. A quick check transforming it to be
dynamically loaded as a module confirm that something is not working, and
I agree with you that, in theory, this should also be a loadable module.
I need some investigation on that though...

Many thanks,
Andrea

> 
> >  CONFIG_PINCTRL_SA8775P=y
> >  CONFIG_PINCTRL_SC7180=y
> 
> Best regards,
> Krzysztof
> 

