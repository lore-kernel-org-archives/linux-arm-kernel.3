Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC8FC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkyX6SSYfheLZc0I8Te+XAXX22QoX47uyuXFCY8mX8g=; b=SlBh2t2I3LZwAcfv1lWnabcuuH
	18OWVaEuPPu0izkZalNHuvPwIfKdZaZautIvfRq/aydssmNA8eMVPY4B++UefejzdSozwtEodgrS/
	fJN6x2TvzVbEPSCauEf0rAW5ZfotKEANzwZcuLrcegqFvwc7fH1t+8LVztz5CiFHIXHRMMDnbuDgG
	w5ol3/SBbk1vvZan/Dz4UIOKc46nfm2pLw7V8/ZSmn+ZH0V8gjIC+XyfEPqrCapVhizITpKATssn1
	K9GyF3l25nzT1L1yY4puRQly03g1361wnePL8tlMzThbiuEzivv3CjwNQhtYBwCInpgVkX04DPkmT
	SXi1wTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1vY-0000000Dm3f-2YKL;
	Fri, 14 Mar 2025 10:06:04 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Xu-0000000DVWv-1HR5;
	Fri, 14 Mar 2025 08:37:35 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22409077c06so48273825ad.1;
        Fri, 14 Mar 2025 01:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941453; x=1742546253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkyX6SSYfheLZc0I8Te+XAXX22QoX47uyuXFCY8mX8g=;
        b=pz3z6UsEyNlRUF1+dTTugMEXUuI7ipYle/2qVk6llh0u7+/rIGFXwbdDnVZrsRZ34R
         C64u48IqJBKbYF5bIExxvndfgb8yaxeA2MDyK9O3RwkuiSvZUnqQAzLFs3bEnAduJEUo
         /zp5vS4q01z+tKQC2T+pu/9a5+GE3YXZZ7YunuD5ZkEERpH36mFv179jB1TavgovRsO+
         KKfpjZH5gDNoOzHuWlmXEUo1W2Jb3ntsXLrvjUpoEI/ApSDGrGiTSqYmhMPRgYmjqJrl
         JURGwYW1jb0RFyOp0/mvMGzyQuLCBI9+YvKZM8VMewy/I/g5RhKN829ybv6Q+m49edYN
         Y2+A==
X-Forwarded-Encrypted: i=1; AJvYcCWUB+Tbx/y7qUtFi2grFheJC4PBwJ0Y5mPMOW0zLiOOu/9YFctb1OB+WX9QKDr/KqCw+N2Je+wx6hRyZSbVgbcE1Q==@lists.infradead.org, AJvYcCXEC4AhBaNHf/uFZk7N7BqMUinfudIA5SNUGDcGvKLpHxdLlJjCnzndv3nTxJGIRSd6nqNZvqqoXLN8dgHgoAeq@lists.infradead.org
X-Gm-Message-State: AOJu0YyDVMrGgAXy9TXGiz5hBtrfg/rG7Ls+VxLl0RdgToGu1ebm7nPS
	+b8VZGUfuFRI0P86VsFTz1bHh7CclhISXn1QUgNBTrY5K8QWhxc8
X-Gm-Gg: ASbGnctS9bjyNGT2eSclMLn2Ng3FXevflWc1Ma0snD52AobVImneDDMvkQnpBHz8S0F
	+AMhsgljLCkH78B23rM+NWNgxnAACQbj+upKQniNX+X5+TozR5pvkGSBZFED/wZgo/iMFnBKt3A
	Eh6smVaDG0/ivQdpREYXIM2p5eKucme3JrCiTM7eQO6ym2/zxjABDFEwWIaXQ3MI2QhhwryK6Gv
	lCScbG2bVsPCjHpv+m+r4BnF+cfTTr1T26EsXw+ljJnKRTL8GtRgasXxwVtrVUGFX7tVlVAz/5c
	se1iItk80TZK8qwJ5t6Vue/a4QaquqifyEXFDBODQUKDeySAzBa9QsHbK58KU9Vmz55NpULICc/
	2Srw=
X-Google-Smtp-Source: AGHT+IG918SBQhjvMeRBJOnKfiU6p+a6y3ckJ/PqZfGFBhVlcJayE1fO2bgYIBBQYyK+PXqeApqP3w==
X-Received: by 2002:a17:903:2b0f:b0:220:e5be:29c8 with SMTP id d9443c01a7336-225e0aee8f9mr28139165ad.32.1741941452931;
        Fri, 14 Mar 2025 01:37:32 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bbe884sm24780695ad.185.2025.03.14.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:37:32 -0700 (PDT)
Date: Fri, 14 Mar 2025 17:37:30 +0900
From: Krzysztof Wilczynski <kw@linux.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <20250314083730.GC234496@rocinante>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <d1362766e3e966f78591129de918046a4b892c18.1738963156.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1362766e3e966f78591129de918046a4b892c18.1738963156.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_013734_347796_38E4E720 
X-CRM114-Status: GOOD (  25.24  )
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

Hello,

Even though this is not for the PCI sub-system directly, I had a very brief
look over the code.  I hope you don't mind.

As such, a few nit picks, nothing blocking.

> +# RaspberryPi RP1 misc device

Would this be better if it matched the "tristate" description below?

> +config MISC_RP1
> +	tristate "RaspberryPi RP1 PCIe support"
> +	depends on OF_IRQ && OF_OVERLAY && PCI_MSI && PCI_QUIRKS
> +	select PCI_DYNAMIC_OF_NODES
> +	help
> +	  Support the RP1 peripheral chip found on Raspberry Pi 5 board.
> +
> +	  This device supports several sub-devices including e.g. Ethernet
> +	  controller, USB controller, I2C, SPI and UART.
> +
> +	  The driver is responsible for enabling the DT node once the PCIe
> +	  endpoint has been configured, and handling interrupts.
> +
> +	  This driver uses an overlay to load other drivers to support for
> +	  RP1 internal sub-devices.

> +/* the dts overlay is included from the dts directory so

  /*
   * The dts overlay is included from the dts directory so

To make the code comment match rest of the style.

> +/*
> + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> + * All rights reserved.

  Copyright (c) 2018-2025 Raspberry Pi Ltd.

To spell the current year fully, plus update it to 2025 already.

I would also add an extra newline here to split the two apart a bit.

> +	if (pci_resource_len(pdev, 1) <= 0x10000) {
> +		dev_err(&pdev->dev,
> +			"Not initialised - is the firmware running?\n");
> +		return -EINVAL;
> +	}

The American spelling in the above might be better.  But I don't have
strong opinions here.  It seems more popular in error messages.

> +	err = pci_alloc_irq_vectors(pdev, RP1_INT_END, RP1_INT_END,
> +				    PCI_IRQ_MSIX);
> +	if (err < 0) {
> +		return dev_err_probe(&pdev->dev, err,
> +				     "pci_alloc_irq_vectors failed");

Missing a new line at the end, but also...

  return dev_err_probe(&pdev->dev, err,
		       "Failed to allocate MSI-X vectors\n");

Or, something like this over this the function name.  Perhaps exposing
error code could be useful to the end user? If so then something like this:

  return dev_err_probe(&pdev->dev, err,
		       "Failed to allocate MSI-X vectors, err=%d\n", err);

Here and other errors where appropriate.

> +	for (i = 0; i < RP1_INT_END; i++) {
> +		unsigned int irq = irq_create_mapping(rp1->domain, i);
> +
> +		if (!irq) {
> +			dev_err(&pdev->dev, "failed to create irq mapping\n");

  dev_err(&pdev->dev, "Failed to create IRQ mapping\n");

To make the error message capitalisation consistent.

> +static const struct pci_device_id dev_id_table[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0), },
> +	{ 0, }

  { }

Would probably be sufficient.

> +MODULE_AUTHOR("Phil Elwell <phil@raspberrypi.com>");
> +MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
> +MODULE_DESCRIPTION("RP1 wrapper");

  RaspberryPi RP1 misc device

To match the Kconfig comment in the above description or the one from the
"tristate" also in Kconfig.

Thank you for all the work here!

	Krzysztof

