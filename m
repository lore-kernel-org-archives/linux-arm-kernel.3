Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEF2D729F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 18:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/K5xGcTYHJ/8xAu9IkRPPHbt4WWLkz+NlJpLlbPrtJ8=; b=FQ6PZ5OM93eZNxJWRgbUQj3+nb
	H4ac5q4mgJ1cWTbtxrLsVxswRDOsX6YFTwFVT0aLgi9Kg7eaDIwjQPE8GtcqupyKqpfwYLpF8njdz
	cRJ9lHIgWuAE7l3LbRwfmqT0w7OiO2xER/i8A4rI8qCj7LuFipJSfqBg1SeLNtMMT8SCl86eL/Fr+
	s/kQn2oNnN54Nw+GTS6YulcDBtfrJ8djLIneJckH8auY/vrfTflON01weyAwUswMwrCDx/k52dpPl
	S+/1+Kt7JZhB+uwp5/ctwmXoalWJFn38aJ+uEP/cE/cM7Tat8xeXALIklb7Hpj5Ljt19gm7hAdazm
	LOzESNCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH5Zi-00000000lVG-0Gxt;
	Fri, 29 Nov 2024 18:18:42 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH5Yi-00000000lPc-3Dgb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 18:17:42 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5cfddc94c83so2516261a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 10:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732904259; x=1733509059; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/K5xGcTYHJ/8xAu9IkRPPHbt4WWLkz+NlJpLlbPrtJ8=;
        b=AR5JFOeDM+e9HjMWmlL91jBO5bJhg8d4S2lsf/4gKNsecxeOHcWwVj07QqojH0WuTr
         Ao4LHXXmxOYXvyEnp7MNilpEW+H4G1uke+ZhBvu+Ltkr1GU3FXhUAa7z1uGCMADqtM0r
         RHqeGMQnhOQUXBkFV/3Ebv9Y7CuTGJCbJy0+k6+4qwk1IFbCpNmTkjLqd/cFPmkPswIO
         RMDgCWTKj35JnAeupwhun3dPoLeX6yPnmsMyax1abl245L5HqQ5FGcrjSPfnuM9HfWcg
         iD9G4ng4t8rpzXPJYbQ6NnFlhFQAKgNoleFwAaT9YfgeKe3wmHuXDuxRVU/8cBM5bXbm
         +RlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732904259; x=1733509059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/K5xGcTYHJ/8xAu9IkRPPHbt4WWLkz+NlJpLlbPrtJ8=;
        b=f3MP+Ku2SOXgyRubc7XrxVeZqwdTNZ2H8gMDu8pQfKlLxdKflePRzoY3IxjQHo2KDW
         rOxoM/K7mkZwi361W4DLKwELWbkDvn3QN4sIXX5AcavSNl7RvhsATxpv4yudSU5baJo8
         LF/xsOtH1HjwXNezyUoDr+kwGWzRashZms9tRnSgkP4/4wpk80R1puQFDbGVhSczKrsI
         pZEgLz9QDfpr/50eC1tjuGy6F/uTDsU5GY0fyjzJf72BmDRbMlml1iyNvGStBppF4J22
         X7CcsSculmDCKRjtT0B/Yy7dQ8lkDhHwmlnT1YIDDEWCl73WMMgIbGoOZRldi2IbZNF/
         oepg==
X-Forwarded-Encrypted: i=1; AJvYcCV+PnC2SJdDFMxK1Qze8NG2dcRV6xs09Ul00+PBx17fgfHymPfse/OHQTrfJun6vxbKe2ixud1+7Q/6SCK9UVdH@lists.infradead.org
X-Gm-Message-State: AOJu0YzahwBlrMTolmTYo57gv6cg+BNLcz43YIoyrq0aK60p033A524F
	T0OWiEPbGPcYR9TWybSfKeYW4xOzY2MuwAGy69w+wOw7CQoNTW6O30s3ck+Z+yw=
X-Gm-Gg: ASbGncvilFOxuPCzElNYiP7P7xqiHydtxYEy2YT9Xvq55cP0f28AJopU+uqYN0g0TqX
	G+PFE+YyrgbhJmFnZsPBrL7FW08aSPzyVfzJ40evEUCebF23SnuxeT7zlhsI/rQerwoPnKemAsk
	xtR0XZ3UJcnMn+QFWirpxfvNFZl25pS4OL+k1bL00c0xl5rxIsPAOI3zYUA3wLo+MU2Mojq+IdX
	85rDBEgeJKNhGT8XEl+ZiayLBXIT2nPA36YfthWRmn72xmnIGSoaEA5Q511V+Ko9VefDuxudwhc
	P2dK036LLRny32GkB4pT
X-Google-Smtp-Source: AGHT+IFoJJFPtLBuSMIqJyGFIVwrCuTOeFzAqiPp8piO0gnCMrA5ajUljudZL/pGS/GtLks+6yCgNQ==
X-Received: by 2002:a17:906:2189:b0:aa5:391e:cadf with SMTP id a640c23a62f3a-aa58103cca7mr869419266b.42.1732904258959;
        Fri, 29 Nov 2024 10:17:38 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e64dcsm197279866b.95.2024.11.29.10.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 10:17:38 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Nov 2024 19:18:12 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v4 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z0oFZGM72FDQX55N@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <c48e6b9b178cdaa01b92ae82e8fd24c2ba5f170c.1732444746.git.andrea.porta@suse.com>
 <2024112535-viper-uncivil-3054@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024112535-viper-uncivil-3054@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_101740_797447_0E4AB91B 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Greg,

On 14:46 Mon 25 Nov     , Greg Kroah-Hartman wrote:
> On Sun, Nov 24, 2024 at 11:51:45AM +0100, Andrea della Porta wrote:
> > --- a/include/linux/pci_ids.h
> > +++ b/include/linux/pci_ids.h
> > @@ -2611,6 +2611,9 @@
> >  #define PCI_VENDOR_ID_TEKRAM		0x1de1
> >  #define PCI_DEVICE_ID_TEKRAM_DC290	0xdc29
> >  
> > +#define PCI_VENDOR_ID_RPI		0x1de4
> > +#define PCI_DEVICE_ID_RPI_RP1_C0	0x0001
> 
> As you only use these in one file, please read the top of this file for
> why this isn't needed here, but rather should be back in that one
> driver.

The reason I've defined them in pci_ids.h is due to the fact that they are
indeed used both by the driver (drivers/misc/rp1/rp1_pci.c) and in 
drivers/pci/quirks.c.

Many thanks,
Andrea 

> 
> thanks,
> 
> greg k-h

