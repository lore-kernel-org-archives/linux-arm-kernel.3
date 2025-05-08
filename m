Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5BAC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TN5BLghxBo/9cI/M/eSHpoxUXcqkl+83toZkzInNZmw=; b=b98rnJOKFmBE4r/BLzz+6lYLT1
	9Cpqjn5v7f6wvj+/rYX1IKGb9BPsRBrpLH+Nt11rLJ+FPUtm/wuNi6tGM1kqZ5fZcxTrd9fi62Z01
	gfM3In6Iqsq/2UOqrS0SZyfh/LaTbCZnixldgUNlZAT2pEzmwX5Fsp8qsV6h+zzfPVwvn3aFnPXPz
	PVqCZOHGmUGpNK+Bokahpn/rqd9za2+hgMFZXaU6kHQVt+IVgjSgBBmkVcPbhgx3NSuVf7PxoZRhN
	1sDFwKO0SKXYn95u3BgN0C+xs7bkGtnpIqp3EEmvmhbe7kFaaj8nZ3e5oN4FuGIeU+Vf6Ftnd2fH6
	colZqe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwyq-00000000Aex-43i8;
	Thu, 08 May 2025 08:51:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwlg-000000008gI-1Lha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:38:13 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-acec5b99052so122893466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746693490; x=1747298290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TN5BLghxBo/9cI/M/eSHpoxUXcqkl+83toZkzInNZmw=;
        b=Vw5TFzmd4S8pQODFtaY91s23nWgoO6GQMN1MYpQR25pQwS4a75OqY/h4BCQdOEPaAe
         37zQ97hdWt6zh49hPQJhLEg0dqhlMNTTkReNbiT8W24+JWqWZm02Zodb5wisGkqpVzjh
         mfarUGkLXVwo1yOAZsYL13KS7eG3cIf6HDNK+z6evu/VUW5ID46yRqZnu8TTu6ORRXnz
         nQ0gJBXYwHyTL4Yy5LC4q0JyVHhn5Ipyvl5HhfQtGJdZ75U6PNdCJ6xskEvEDR/Z447a
         sAtbJpXOW5ukeo/89cEK4gDQzD6/Bu0ZXQWazS+nzwvtUcVLzYTwjXp8T/xFfB9q3KjQ
         pqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693490; x=1747298290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN5BLghxBo/9cI/M/eSHpoxUXcqkl+83toZkzInNZmw=;
        b=WD2U6l3ABxq8mMZt8PTOMw+eUGM4+w1T8BBTZHkDyRmAlByjIBv7FquUplyGiwXzCp
         q75evMQhHdF5VsHIY3K4oo0Kc0DkPsBR+k+90tDUgBItj0fktPVGXYoLLW3xC6xm5Qs+
         tzs/0jhJPLggQbULItT5OIjiQNWL6mYovAuQO8jh6m63iTuDB5qwxKavPyskfNbgZelk
         MQtz3BcEAbpMem57MF3cxEhG2SxxPlp3GlBq659puXDa3zwIb17AjqZDFK+g6OL7HK2Z
         Nz64wQhL7zWRRN+6PKRpzg3JAR0onSR8p83NoathJKN6zU9fTcfZnwWvFBi4pA7aDL5N
         5lXA==
X-Forwarded-Encrypted: i=1; AJvYcCXOPqhZwvaVXHQnypJiZzz2tvSah/HpT0XJsSs7RTw2KXGCVYbA8PBUrTjSDznrojd0EHThnoR3MisNgAu1II5M@lists.infradead.org
X-Gm-Message-State: AOJu0Yyht0Fvi4332stX00Is5wdjY5oTKLhVfgxuf07eb5ESWeAidDlk
	hez5GhJMk+cIFkSMNdWnzKITGUwk1ZujYPVcShSjmavvhXoVUSos/AwD7VL20mk=
X-Gm-Gg: ASbGncuN1mbI2bvAg4UJsD7QCqztATu+Fi9aZDtuHiXM8JdVMd2LlA2Ph57diqmiIIR
	L86/W1HvgKAI2UNinO2Xk5bG4UVtFfhg1dtoxQZ0bx9p4P81LnKqFR7Joxx/JFxfN90QLiQDGDp
	bnJTmZ0hqLK0iDKjOwgH5XHegI+KJqJJkd28LElm3APxccF4jBzDxqlGbwADZ+TgA6Oz+0dAd60
	5OtLYXsZ2mZ2wyEGKYs+GNV1ZGoyfDseMNCJpYECozvPUNzaMbxOme0iGPs/JnZ7rZxBARWpyhu
	TCt/HoeQd6eUewNr1+0LD5B4s1iR6cWjG4uKfPd7S0XJLTcZZDAqyxH9HyRbdP5JS20sWcjKnZ8
	+xj59Qw==
X-Google-Smtp-Source: AGHT+IFAz0hpCdqZar4HwvS30xYrKUVB/5CH1AYDISg2ZQz4Cx3c/u+PhQRq6xHbtI2Pon4FDK1RKg==
X-Received: by 2002:a17:907:d7cb:b0:ac3:48e4:f8bb with SMTP id a640c23a62f3a-ad1fe947a69mr204692566b.41.1746693489868;
        Thu, 08 May 2025 01:38:09 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3f0fsm1059881366b.58.2025.05.08.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:38:09 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 8 May 2025 10:39:38 +0200
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v9 -next 04/12] clk: rp1: Add support for clocks provided
 by RP1
Message-ID: <aBxtyvI3LUaM3P00@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <e8a9c2cd6b4b2af8038048cda179ebbf70891ba7.1745347417.git.andrea.porta@suse.com>
 <aBprHfQ7Afx1cxPe@apocalypse>
 <8513c30f597f757a199e4f9a565b0bf5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8513c30f597f757a199e4f9a565b0bf5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_013812_380435_270D2398 
X-CRM114-Status: GOOD (  27.25  )
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

Hi Stephen,

On 12:44 Wed 07 May     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2025-05-06 13:03:41)
> > Hi Stephen,
> > 
> > On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
> > > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > > clock generators and PLLs that drives the sub-peripherals.
> > > Add the driver to support the clock providers.
> > 
> > Since subsequent patches in the set depends on this one and as the next
> > merge window is approaching, assuming there are no blockers can I kindly ask
> > if you can merge it on your tree for the upcoming pull request?
> > 
> > This patch should apply cleanly to your clk-next branch except for some fuzz
> > lines on MAINTAINERS. Please let me know if you want me to adjust it.
> > 
> 
> I need to take the dt-binding header as well so it compiles. What's the
> plan there? Do you want me to provide a branch with the clk driver and
> binding header? Or do you want to send a PR to clk tree with the clk
> driver and the binding header and then base your DTS patches on the
> binding header and send that to the soc maintainers? I'm also happy to
> give a Reviewed-by tag if that works for you and then you can just take
> it through the soc tree.

Any of those would work for me, but I agree with you, we need a plan
because this patchset is crossing the border of several subsystems, and
as such there's also other dependencies between patches that will inevitably
led to conflicts.
The only decoupled pacthes are the pinctrl driver and its bindings, which 
I guess could be taken by Linus Walleij, but all others have dependencies
on either the bindings (clk driver) or dts (misc driver which embeds the
dt overlay, and should be taken by Greg).

So if Florian is willing to take the bindings and since it's already 
taking many of the patches, it could be reasonable if he takes the
entire patchset.

I guess the final decision is up to Florian. Whatever you choose, I'll
adjust the patches accordingly but be warned that there will be some
(minor) conflicts down the merge path: one being the fact that linux-next
bcm2712-rpi-5-b.dts has pcie nodes while Florian's devicetree/next has not.
I'll do my best to help fixing those.

Many thanks,
Andrea

- 

