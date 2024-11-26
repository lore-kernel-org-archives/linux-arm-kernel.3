Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57983D3B9A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkXmTfuY/onFcHGFkT/ioLNg+ObOS9O+E99ZOLPbjVY=; b=CuoEGO5GFw96jVRhE9jUotk4lp
	bo5LgCxRptvpDc9BZOIueIOM2AaKZ8yYlMs1VOoqpBN+3wAqywHmYQ3TrqrKpaWoVIePIah+eAgyg
	YIm5N1a1dJf6SVHD79f9H6QlLjm26C1b6fhbvOdiPjHW/MspgS8DjR1d6Yn7UpCEEdmIjao4ceamV
	9G1mdVy+kfN6NcIIpuFWq9sg7ULBbseixu98fKX3lHJ0MVOWn52+ct784F+18ii+hnuWGOa+FTp5g
	u0WkKd0Qd8hY8BLI/hnLwM42CK4mamYqlbxEJeC1kX7IB8H49KPHhZjStETXFrfcHE4XmACWZqx/J
	U2ptv9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxBc-0000000AxJc-3ulL;
	Tue, 26 Nov 2024 15:09:08 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxAe-0000000AxCY-2zm7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:08:10 +0000
Received: by mail-lj1-x242.google.com with SMTP id 38308e7fff4ca-2ffb3cbcbe4so33851191fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 07:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732633686; x=1733238486; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wkXmTfuY/onFcHGFkT/ioLNg+ObOS9O+E99ZOLPbjVY=;
        b=Xy1ahGIbxgeUeLVUbDpTrEmvvyJUnXB2ps2lvcfbnQB4uiI0JAJkRX7VLQifwm7EZl
         TyLQrZfKrYujcOkmVurekQxyLcWaaUYed+eVswKgHqZmLauWaEd+WQfIaZXO6ABXmO9A
         Khrq+pysw7vZew/Ag9mLA8AkoaHojR3viFQzLGR1oq9Xl4VClXICbsPJrst7C++TQ5iC
         vGohdQv+tb+d0brcdKqHyye9Ml9q6VrAM4s33b8JjLAF2BjG908y8mWapdgqQbWqVtkC
         VeNCg4XPxxDG6z2w4rDmNoYKRMCJmfpCv40uOeSlExS0AXx5MkAKwYnupGdm5QMYpXUh
         3RPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732633686; x=1733238486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkXmTfuY/onFcHGFkT/ioLNg+ObOS9O+E99ZOLPbjVY=;
        b=ROkpMS9AXBukK3yqU8s72cKNQXPBLHLoqNKdgbU5CB+SBIvQ96wR4crwuQhWXcagyZ
         y3q5Y36wUz1Tjozhx5/WW6+5II5LCOF3kJI9zrebFeQkTD0F+w4aqGs87gNQKZKWaCqO
         skra7aQQtuTXx4UvJLdzRTryK+ObzIDwx01PrZAnJCOopVdGYi2lFew4S7CTiSnC85Jy
         qakAfacG4HKA4W4cChfg7UwxKHTF1zdQfUWt7s58hZK5fk++FTlsw3Fp97vZBOTQhuYc
         oEsUKbtwxEQJ/yR2Hj6dr+TNv5zBqMMPjIyyhnSpKXxYdqI84/HvUso9+gpkrCCBg69E
         AFLA==
X-Forwarded-Encrypted: i=1; AJvYcCVcw+112dgpN1eiFMp4lQho9fLvrYkxFtHw7SG0eg07ELXLkTaZrW3TtH/KorKT/TvaBzUxOLa9Vyy03lBg8SWe@lists.infradead.org
X-Gm-Message-State: AOJu0YxcWDvHg0FE6dsTODIjUjJee8HrsiXLlzzwtFtemwQOyBrqEmxl
	FmGu1NiYY8UIlc1Pjv07fm8y2ADOBjIsZ2XiG8dldtAAlKdgvp47HRL0v7hSUKM=
X-Gm-Gg: ASbGnctYgqAaoALuAlQDqGdugRxbjJwtATvH6xZ6wvFu5ZTcCKH3c88ihZzi4RLcz7i
	AhiJz6uERjwLsfriRZzhhiYWwnTivWm0i9y30fM7lLm01pFMpPte8SxsSG3masG8yDkzSXIzblt
	iY7ZOiwx+dtsidVREI8sFNersF5QKbvgFUFo0idOGRd6o7hkqXKgMNJJnpDl3RQjkxDKgr/Uo9s
	vh3/NzwTp1OutFVO5dJJhlIk1EKbW1F7/vYxnlXQdZ+sc2VZreJdXbNawMpNAUT9olG+GpJOOMO
	nm6Z6Xf3vTthiq+f06VK
X-Google-Smtp-Source: AGHT+IHfNZc0WKbh7sqF1+iBLIXYZDOl4JPTwwJG5rgrazocKw4s1ERx1hlewAc6ByNqGEspG3q/FQ==
X-Received: by 2002:a05:651c:88d:b0:2ff:55b3:8e11 with SMTP id 38308e7fff4ca-2ffa7193c77mr95509071fa.36.1732633685736;
        Tue, 26 Nov 2024 07:08:05 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3fc94asm5286773a12.58.2024.11.26.07.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 07:08:05 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 26 Nov 2024 16:08:38 +0100
To: Rob Herring <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dragan Cvetic <dragan.cvetic@amd.com>, linux-gpio@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	Derek Kiernan <derek.kiernan@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Wilczynski <kw@linux.com>
Subject: Re: [PATCH v4 04/10] dt-bindings: misc: Add device specific bindings
 for RaspberryPi RP1
Message-ID: <Z0XkdoBkrhCGo9sf@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com>
 <173250040873.6640.9720381303445148722.robh@kernel.org>
 <Z0RAGkBc-yz5lqN6@apocalypse>
 <20241125132104.GA1520508-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125132104.GA1520508-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_070808_769419_D1E93186 
X-CRM114-Status: GOOD (  32.55  )
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

Hi Rob,

On 07:21 Mon 25 Nov     , Rob Herring wrote:
> On Mon, Nov 25, 2024 at 10:15:06AM +0100, Andrea della Porta wrote:
> > Hi Rob,
> > 
> > On 20:06 Sun 24 Nov     , Rob Herring (Arm) wrote:
> > > 
> > > On Sun, 24 Nov 2024 11:51:41 +0100, Andrea della Porta wrote:
> > > > The RP1 is a MFD that exposes its peripherals through PCI BARs. This
> > > > schema is intended as minimal support for the clock generator and
> > > > gpio controller peripherals which are accessible through BAR1.
> > > > 
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > ---
> > > >  .../devicetree/bindings/misc/pci1de4,1.yaml   | 74 +++++++++++++++++++
> > > >  MAINTAINERS                                   |  1 +
> > > >  2 files changed, 75 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> > > > 
> > > 
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb: clocks@c040018000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > 	from schema $id: http://devicetree.org/schemas/clock/raspberrypi,rp1-clocks.yaml#
> 
> The error comes from this schema and...
> 
> > > 
> > > doc reference errors (make refcheckdocs):
> > > 
> > > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/ebb21da5cb41391421b364815705be8b4c415f8a.1732444746.git.andrea.porta@suse.com
> > > 
> > > The base for the series is generally the latest rc1. A different dependency
> > > should be noted in *this* patch.
> > > 
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > > 
> > > pip3 install dtschema --upgrade
> > > 
> > > Please check and re-submit after running the above command yourself. Note
> > > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > > your schema. However, it must be unset to test all examples with your schema.
> > > 
> > 
> > Sorry about that, but even if I see that this should be the case (I've dropped
> > the clock-name property from raspberrypi,rp1-clock.yaml), I can't reproduce it
> > with:
> > 
> > # make W=1 dt_binding_check DT_SCHEMA_FILES=pci1de4,1.yaml
> 
> You've limited testing to schema files matching pci1de4,1.yaml.

Ah I see. I thought that DT_SCHEMA_FILES just restrict the check to that
particular file, instead it's also restricting all check of that file
to itself. So I guess there's no way to check one specific file against all
internally reference (e.g. from examples) schemas...

Thanks for pointing that out!

Regards,
Andrea

> 
> > 
> > and the output is:
> > 
> >   CHKDT   Documentation/devicetree/bindings
> >   LINT    Documentation/devicetree/bindings
> >   DTEX    Documentation/devicetree/bindings/misc/pci1de4,1.example.dts
> >   DTC [C] Documentation/devicetree/bindings/misc/pci1de4,1.example.dtb
> > 
> > dt-schema seems up to date. Is my command line correct?
> > 
> > Many thanks,
> > Andrea
> > 

