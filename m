Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E8AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eInU4xGBu0Mt8Lm17X6zPVhTvmNik5PGbnkQOxA+YU=; b=vbDUrwzwTdsi11++IDjQRDltzC
	rF4mdaTgzQ1M6pFIlsGGcl9yBfslHMfA1moXZje6dv5+rhigDKzi3RqRA6bFhBX7aDCgiEmzfKnfX
	VJkzJkFsPkEcXSjqJ3a3VglBBjPiIboQQIPAUb6TJcUWo8JeiWDrXVcl6fZj1YfKQ1HD0pxeu93GO
	0vo5FdkKLLsA/g0Ke0YJi/VT2vuYA+XBBCADTQSAZLL71Ua6imeNhFa36vFBCy9209+9QJGTmu4Ux
	OwC6yGS1AfM/VNLDAduiWKoaIRAGg1PeyzFr5FabQUgJvrw0bu2GzHE+fgZC7BPeA5OZBkrf6l4kY
	QNliAAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTX0-00000005Mwb-17Sl;
	Tue, 18 Mar 2025 09:46:42 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTVJ-00000005MeJ-1FZw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 09:44:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so10463606a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 02:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742291095; x=1742895895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4eInU4xGBu0Mt8Lm17X6zPVhTvmNik5PGbnkQOxA+YU=;
        b=M+HVzBkCMkncStudZ+noTKg9qcoz50WTzEyH6wPDjetUIVr+gJpzkZYkPD3yHKsjZy
         AiY+5c5JGxLsdD+k8uvDlWBM7ZWzrYJGZFKrn2NzHYk6aXMlQWalng43MO/1+LHUhVy7
         Onn7RAZvUFSx3rut6/EuD0z6r2+FkLjvh7yJ6vyxii4yDoeP0bCLaqYaPgrpraLbtZmO
         BDIP0DJ4J9YoWCuAOKioFzGPWwT+4inXZzZQJt5Sjf1F8ch6rRRzZ57JWKx/VYpMyNHz
         u3ruCGPyaRRNlrwmZFxXmjgQQy6R12j39IHLjpaSNEDohvyCxPr4zYDEimnGrZPsESJh
         lkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742291095; x=1742895895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eInU4xGBu0Mt8Lm17X6zPVhTvmNik5PGbnkQOxA+YU=;
        b=t6XmZlQ/G/6yhiS8MFI04Cfokmq5V/ZG1j+ZEEhxYwftil13Sl7MZRwMpdQBLz8B2M
         a3HARpioQk6ard7KdpW1iouaB5a9WcAhCIR8bk5dbPOpLY9d96jHU1nuGz4+oB25XVOZ
         +CjhFErpw/xlztVt6CLM+ShrarqtJa+H6CL945/dDsvPbZHuCglrDD4vqtVzo6ZwZ030
         o/Gks4Kq1WoIQjwJ57Q9UZvqLcrUcue2lbB77OPIMgvMZpM89HO7RsT4NgP6fyUPTKr7
         t5yK7JUUfdGromAIN3qDk8UaoAeNhL0RTDs4El1lL1VjN/l38n+LKVTojSRT0w01hagM
         fPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe7p1nQykd1f5MfjrI7yWlD8lVHuVl1ZEiR3HLz5RgthNxA+lgAaoX0t4PheykL4W249IkfeWq7pPSbJ9KaP1n@lists.infradead.org
X-Gm-Message-State: AOJu0YyWQgFfs1k+8Sn9jGzY6h47BovgjSsKDNJMwjNrugEgcELu2oEp
	ER1C0jfVsHTwS5HPHddYu8iOnO2GZJukjFavictKx2c9I9sO3fRTRMBSL8W3mSs=
X-Gm-Gg: ASbGnct2NUQzFNm0q/cAm+53cnk93zY2JCJS3x2lgLaf9F8FmJjImV8KIyYOuPsK+Ov
	3YvHJLeFxr5r2sNrrGFwgZ2+cBX6ivnALhBCHBdPc7taO/OYYmWx98myLmfg/t5bGWSLpEJXcU+
	/cNiZzavFXjPaCXy4bULjyeYd5TxSdBotJMO+a8OBv+XS5PKNV9ngMg1DheTun5wr6mKPmm28cn
	LcxhfZeNFqewMTQ7ieHuZ/5sH+fj/f/vKoFdzQC4cA69wQbNO+7xD1fNOwiAnCxP0ar67Bcdmud
	vP0NfvG9MsBlyVpMvOPp+1KJ8QFoWVUDkq9MN1j5e9zxyHSiyU2PVS7phigdculM5UZqop65aO1
	wIxSsoOEWktfOGHQ=
X-Google-Smtp-Source: AGHT+IF5nVWbdkGdXhT8Rbx0xwnOfVzY2zNtg2VYzomJ4pLfS9zkgHWMH1EzA7usUUR4N2OG/B9QfA==
X-Received: by 2002:a05:6402:3491:b0:5e6:102a:c30 with SMTP id 4fb4d7f45d1cf-5eb1efcbee0mr3044112a12.2.1742291094785;
        Tue, 18 Mar 2025 02:44:54 -0700 (PDT)
Received: from localhost (host-80-117-53-131.retail.telecomitalia.it. [80.117.53.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169bca53sm7562109a12.46.2025.03.18.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 02:44:54 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 18 Mar 2025 10:46:07 +0100
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: Re: [PATCH v7 08/11] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z9lA31gBjpIRHm6y@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <d1362766e3e966f78591129de918046a4b892c18.1738963156.git.andrea.porta@suse.com>
 <20250314083730.GC234496@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314083730.GC234496@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_024457_336849_0B82B309 
X-CRM114-Status: GOOD (  36.40  )
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

On 17:37 Fri 14 Mar     , Krzysztof Wilczynski wrote:
> Hello,
> 
> Even though this is not for the PCI sub-system directly, I had a very brief
> look over the code.  I hope you don't mind.

Highly appreciated, thanks!

> 
> As such, a few nit picks, nothing blocking.
> 
> > +# RaspberryPi RP1 misc device
> 
> Would this be better if it matched the "tristate" description below?

Ack.

> 
> > +config MISC_RP1
> > +	tristate "RaspberryPi RP1 PCIe support"
> > +	depends on OF_IRQ && OF_OVERLAY && PCI_MSI && PCI_QUIRKS
> > +	select PCI_DYNAMIC_OF_NODES
> > +	help
> > +	  Support the RP1 peripheral chip found on Raspberry Pi 5 board.
> > +
> > +	  This device supports several sub-devices including e.g. Ethernet
> > +	  controller, USB controller, I2C, SPI and UART.
> > +
> > +	  The driver is responsible for enabling the DT node once the PCIe
> > +	  endpoint has been configured, and handling interrupts.
> > +
> > +	  This driver uses an overlay to load other drivers to support for
> > +	  RP1 internal sub-devices.
> 
> > +/* the dts overlay is included from the dts directory so
> 
>   /*
>    * The dts overlay is included from the dts directory so
> 
> To make the code comment match rest of the style.

Ack.

> 
> > +/*
> > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > + * All rights reserved.
> 
>   Copyright (c) 2018-2025 Raspberry Pi Ltd.
> 
> To spell the current year fully, plus update it to 2025 already.
> 
> I would also add an extra newline here to split the two apart a bit.

Ack.

> 
> > +	if (pci_resource_len(pdev, 1) <= 0x10000) {
> > +		dev_err(&pdev->dev,
> > +			"Not initialised - is the firmware running?\n");
> > +		return -EINVAL;
> > +	}
> 
> The American spelling in the above might be better.  But I don't have
> strong opinions here.  It seems more popular in error messages.

I agree.

> 
> > +	err = pci_alloc_irq_vectors(pdev, RP1_INT_END, RP1_INT_END,
> > +				    PCI_IRQ_MSIX);
> > +	if (err < 0) {
> > +		return dev_err_probe(&pdev->dev, err,
> > +				     "pci_alloc_irq_vectors failed");
> 
> Missing a new line at the end, but also...
> 
>   return dev_err_probe(&pdev->dev, err,
> 		       "Failed to allocate MSI-X vectors\n");

Ack.

> 
> Or, something like this over this the function name.  Perhaps exposing
> error code could be useful to the end user? If so then something like this:
> 
>   return dev_err_probe(&pdev->dev, err,
> 		       "Failed to allocate MSI-X vectors, err=%d\n", err);

dev_err_probe() should already print the err code, no need to add it.

> 
> Here and other errors where appropriate.

I've changed dev_err() to dev_err_probe() in cases where the error code
is not evident (i.e. hardcoded) from the source.

> 
> > +	for (i = 0; i < RP1_INT_END; i++) {
> > +		unsigned int irq = irq_create_mapping(rp1->domain, i);
> > +
> > +		if (!irq) {
> > +			dev_err(&pdev->dev, "failed to create irq mapping\n");
> 
>   dev_err(&pdev->dev, "Failed to create IRQ mapping\n");
> 
> To make the error message capitalisation consistent.

Ack.

> 
> > +static const struct pci_device_id dev_id_table[] = {
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0), },
> > +	{ 0, }
> 
>   { }
> 
> Would probably be sufficient.

Ack.

> 
> > +MODULE_AUTHOR("Phil Elwell <phil@raspberrypi.com>");
> > +MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
> > +MODULE_DESCRIPTION("RP1 wrapper");
> 
>   RaspberryPi RP1 misc device
> 
> To match the Kconfig comment in the above description or the one from the
> "tristate" also in Kconfig.

Ack.

> 
> Thank you for all the work here!

Thank you so much for your review!

Andrea

> 
> 	Krzysztof

