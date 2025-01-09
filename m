Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5030E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlBu6Jl4eyQAszKaCyX1ruIoK5I/dtBYkp0OS6r+WLA=; b=gHq7iC8+9WcN9/9EFrfBa+7yqy
	nLZ4f7bUbejI3h2An2+JkV43YbiRsHb5tligHYj2oJkfSQb3fByt/yRNlnGM3mAThf2yV3D9Jdw1B
	QcNgzqx4DdjhYSXQeXMVRWJZpw7iv+jQ7QpA/w3Lx6XIybUtit9cKP4x6r/84LAkGBNT0WBfoTFIk
	gtojaRR6Tt0RY2cQiN8SLwRNdAR7jm3KCF6kHS5ff43f569EmV1GcHGKNMq7bglT6XuR5KRg0LR7c
	LgZrtSsVHC1otpkMU0egqG7mXMHScIo8I56CwT2Nzkczh9OGNdh7i1J0Dhxqz6vBAfEOLx2PKFqK2
	oCzw5dTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtIj-0000000CCSj-0scr;
	Thu, 09 Jan 2025 14:14:21 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtHM-0000000CC3F-3f9r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:12:58 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so1324530a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736431974; x=1737036774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlBu6Jl4eyQAszKaCyX1ruIoK5I/dtBYkp0OS6r+WLA=;
        b=R/4ZL6xcbYLsBBOqFnEDPBg+Sp627yEAKBrzOdSeaYGCrkjjcrx4y+jPQ+HMYrZQJc
         tFdzsH0EpOH3sKXGblNNx/4E0llO6RnjHM/Oh1z+T/7wbT/O1GJf9ssqqCX1NNPp5W0F
         bUZqDM+BXO4y6tsVRhtfZgAa0yHFqplQX9kjhOFM18tnQc4tAlm98fReSQQI3gEh+xx/
         FuHeOvZdLI0utHkp89QULHGNRM3RWDhK/9CFy4/rp+EaWLeJ8GCl2Ztwygrnw8duM17o
         6r9c1R27mj8YlH+MQ61b82k0/mVF6wvxbg9h667wo2KY8GsMTQVUamxy45NvBu6Flftu
         2CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431974; x=1737036774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlBu6Jl4eyQAszKaCyX1ruIoK5I/dtBYkp0OS6r+WLA=;
        b=RZKjs1KbAdUZVnMc1H+PZqY68b/z5RTTXADFwv2VPLoJK1w3p/ZtPzxeL48kJ+OfFl
         7tpiGyHrriTZOb+loRo2Eo3na2HKqKShYbgNfnCiCnhnkV3DNDzusX0wI8I9x59AayC6
         ZF9SJyZF2N6QKIgb05zDXhC/L323n5c6k8aU2jKUvrWycUeb4hNQyxr2V0Zy0E25TpOb
         LVvr8rN+ecLmPwG2R01hv9BJcGXGY5nrQlhI6gLGC5iH5a2MRwUKAGtdxO8+SBKsUoe9
         Kxt4Hgy1eTzhVD/qCj6IiZiuivqtt2ekhpzi7WtrsT0N4Z1CocSyqxMihPPqZwh3s+CT
         Cilg==
X-Forwarded-Encrypted: i=1; AJvYcCW8SArEA2h7GrpkJP/5QzYndgH7R8kArSyz/XcieKS1wjwfqKc1z0J7aI43eA58+6iG5+gd/4PpfVuNtFjIh4GC@lists.infradead.org
X-Gm-Message-State: AOJu0YxBrcol9FhLuvg14YNMEM1sKPJPNrRl1RviFuu756c34h5nEETw
	6JtgBDioFB2+g80E6OqfhvY/byUWXT/Hvt/hHomGPuVLZx3Xpy7YWQHu5CMObe0=
X-Gm-Gg: ASbGncuT3XVD3JyyWwId/qPOkouuXcZsfXrlOUIex0MbarQXyWQ6KvAoJ0DjMtJZptK
	Zlng7wrgMBQ7KWhYJixrVk+yYTo9wCcH1UiZLMTfdxzTeoA2G728UqT5ols6HynCv15jhiL4kXR
	Hbpyw/I1RwKxmcwT1a4Yf/f0cxClSbd5CLeCONgI9vHpRg0dakv/Pun3bfL1W0svJLY2ajGfglH
	eN91j9qFwEB3dZpqm8hKpbnWdtkncMaFDYWXNkSO+heRwKY7enOFGXlYYS+gVx77idZY0Z+L0Mn
	W8EY3rD/9NgiiW0fOCfXXnHBteEb6A==
X-Google-Smtp-Source: AGHT+IEOXSEbBA1axGYMcra+RQ2TbWnh4xp8zHitSs1AcfUx4imSb6e/9u6/B80hfC1lQxS7w4XDzw==
X-Received: by 2002:a05:6402:530f:b0:5d1:2377:5af3 with SMTP id 4fb4d7f45d1cf-5d972e00027mr14520603a12.5.1736431974259;
        Thu, 09 Jan 2025 06:12:54 -0800 (PST)
Received: from localhost (host-79-40-232-186.business.telecomitalia.it. [79.40.232.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90e8888sm75783566b.80.2025.01.09.06.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 06:12:53 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 9 Jan 2025 15:13:42 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z3_ZlvbszezcanA4@apocalypse>
References: <cover.1733136811.git.andrea.porta@suse.com>
 <28fe72eec1c08781770cee65032bb10a6d5994a9.1733136811.git.andrea.porta@suse.com>
 <20241210224837.GA702616-robh@kernel.org>
 <Z2A0aAPotT0NvoCl@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2A0aAPotT0NvoCl@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_061256_923099_409234FE 
X-CRM114-Status: GOOD (  20.22  )
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

On 15:08 Mon 16 Dec     , Andrea della Porta wrote:
> Hi Rob,
> 
> On 16:48 Tue 10 Dec     , Rob Herring wrote:
> > On Mon, Dec 02, 2024 at 12:19:32PM +0100, Andrea della Porta wrote:
> > > The RaspberryPi RP1 is a PCI multi function device containing
> > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > and others.

...

> > > +#define RP1_INT_ADC_FIFO	52
> > > +#define RP1_INT_PCIE_OUT	53
> > > +#define RP1_INT_SPI6		54
> > > +#define RP1_INT_SPI7		55
> > > +#define RP1_INT_SPI8		56
> > > +#define RP1_INT_SYSCFG		58
> > > +#define RP1_INT_CLOCKS_DEFAULT	59
> > > +#define RP1_INT_VBUSCTRL	60
> > > +#define RP1_INT_PROC_MISC	57
> > 
> > Why all these defines which will never be used because they come from 
> > DT?
> >
> 
> Right, those defines where originally designed to be included from dts, but
> previous discussion deemed interrupt numbers to be hardcoded instead of being
> specified as mnemonics. In the driver source code I just use RP1_INT_END as the
> number of interrupts but I thought that the specific interrupt numbers should
> be documented in some way or another. Since no one is currently referencing
> those defines, would it be better to just turn those in a multiline comment
> just to describe them in a more compact form?

So, here's a couple of proposals about the interrupt defines:

- since they were banned from devicetree, and are not used anywhere in the code,
  turn them into a (admittedly long) multiline comment, so they are still at
  least documented

- since they were banned from devicetree, and are not use anywhere in the code,
  just drop them, we don't currently need them after all

Not sure what's the best way here, anyone can advise?

Many thanks,
Andrea

