Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1ECAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiM8y2KF3+onAr2SvicvIVsqQjxBJ+k4H+eZXUhohgA=; b=bFbZfwkNYm3DiLGi9ifB01IGKC
	fJuWDn6rri+yKLg/I366NPUseN9hp1QV3HOSYK3msWI90fp7KdoET3sUqy9EraSf5aCR0WZQfHewl
	D6KymK1NUMFJVAA/vN9Mv7NFXm/LWodhhsc7JvAqH2JUmLpq74mHiiy89AVdy6nWrMHKu0R9ScG2o
	mnvEZWn6OXCPlfTaNVU0xo7FUXM05KQCBmE8trl3/MVG5cF8iv+7XZX58fELDQ0Cw1R5NsqDulrA/
	ycB9/+hMVNgSB0tPfAZ0rvKuon66S4lUQ8Gf8CPmWiCbnd6qugtQv8GvcN0gmphd3CBf7I6b4jl4O
	DC99YWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVutv-0000000CZFP-3NSD;
	Thu, 09 Jan 2025 15:56:51 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuqJ-0000000CYUf-0JDa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:53:09 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-aaf60d85238so215308366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 07:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736437985; x=1737042785; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiM8y2KF3+onAr2SvicvIVsqQjxBJ+k4H+eZXUhohgA=;
        b=Za571v4zsNuV7/EC8MNbOfPhkQlbRhwfqWcAIjSOvvi0TBIXBI04Z0ullc58Ns1c/Q
         tIEbkH+CuoFFVrgoIXP0k79+uW1P1rWkOnXas9STXeQ4jAg4ohYUNPd5dAFLBjN+u8BS
         B9NYo9U9TuPux3xQ/M//SbSz0vv+X46VKm8Fi5c1MEJbXTy7Fk5/pq6kWwvoDrLOt7wX
         h225FjAdMQLcByHtQibgWnML5ajQhkyESr2rFlidRAaeald8zgSfbCzX2o4ILaqEkstb
         CnR2aVPEU622UGxoNeYdmtwGqbSCx7L8xLBpOAL9Kwsn10kHtZRnB7LEkoLngwNRzBsr
         pKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437985; x=1737042785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiM8y2KF3+onAr2SvicvIVsqQjxBJ+k4H+eZXUhohgA=;
        b=pwxDyWP8LiBwrV1TynXeV9FsSs8yys5naWEFrerj/Ksb9P6mb/wuUg4Sa5loObNlHH
         2wTLHyekx6s5K38NlqO8zBBAWixdLO4mpD9MT83k+ZrbdaeROsvcwN7A2bIvGPUMsHYC
         /NTpeR4U5h4Q2Fba2+f1wpBsLboR8gBxdG7XtnRufUs2B4zPLKnVymijCqytezoppE/6
         O6Fah85QSxf+kv52C6CDI62TsLjutUj48O3TC19LCYCFqwWSUe1NkVTFWU3TvAxkzJfL
         k4KIUTNdKa8s2nSXmtdx5xOZnc9Vlaixkl2Ipki5Ggz6yNM2YbYlKlHjBtWp5RYBX8QG
         NhWg==
X-Forwarded-Encrypted: i=1; AJvYcCULtv9+E8KEDiLpLhjPKCEh7r7OLWhxcLcM5o/m9TM4ATFEgQvSUIl6nA5LKkTypLLqfvEhAq0htf68lTNIoioY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv/31kjqx1ShPIbYX1IgqkTgqzYRnKI9hTzl3eMlxxlkC4ITG+
	jk1jfczFqFxh6U26i7eUPzowpHR2QpfHn6sPv8N4Juc58mgCqwOmcF2xStwhPNQ=
X-Gm-Gg: ASbGncuoSeFI5VXMywvWFc4UdppEJWg5cRmN7IgJuNArTalOFdfl2aPct0BqMCXRaZk
	ITO8p6LMa5R5grqgGP8HEJF/KXU1sDbZL2sSGKW4Wy+bm0m2OO3ryP0/uzfgPjA8vINzJhELWqR
	NNfYSccrTpvo++hEEuHipC7DZZFTKQ4sloBglkUIeJQLt6WW/lWpiRVYHgxLv4ccacFILv2k4Gy
	560NZCc7DBcauyY2fsVWiyYQkARNabq6TUXqCRIDlD4VGIS56OcSKB2dEBO1q4AMzs/RxPDDHVH
	QmJjvDcr8xredmlZU4IvnDz9gObB7Q==
X-Google-Smtp-Source: AGHT+IHcBvpBouxzG2xA8PisFV1s3Jhs8UiQjwM9GQq0MdUzIaP9cn8QbUIcgBfqgLqpN4NyhXITew==
X-Received: by 2002:a17:906:fd87:b0:aab:cce0:f8b4 with SMTP id a640c23a62f3a-ab2abc9ed6cmr644656666b.52.1736437984935;
        Thu, 09 Jan 2025 07:53:04 -0800 (PST)
Received: from localhost (host-79-40-232-186.business.telecomitalia.it. [79.40.232.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563b32sm82250366b.122.2025.01.09.07.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:53:04 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 9 Jan 2025 16:53:52 +0100
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z3_xEEGVWFu-bDjT@apocalypse>
References: <cover.1733136811.git.andrea.porta@suse.com>
 <28fe72eec1c08781770cee65032bb10a6d5994a9.1733136811.git.andrea.porta@suse.com>
 <20241210224837.GA702616-robh@kernel.org>
 <Z2A0aAPotT0NvoCl@apocalypse>
 <Z3_ZlvbszezcanA4@apocalypse>
 <20250109155036.27b82b7e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250109155036.27b82b7e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_075307_124335_B13112B6 
X-CRM114-Status: GOOD (  30.06  )
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

Hi Herve,

On 15:50 Thu 09 Jan     , Herve Codina wrote:
> Hi Andrea,
> 
> On Thu, 9 Jan 2025 15:13:42 +0100
> Andrea della Porta <andrea.porta@suse.com> wrote:
> 
> > Hi Rob,
> > 
> > On 15:08 Mon 16 Dec     , Andrea della Porta wrote:
> > > Hi Rob,
> > > 
> > > On 16:48 Tue 10 Dec     , Rob Herring wrote:  
> > > > On Mon, Dec 02, 2024 at 12:19:32PM +0100, Andrea della Porta wrote:  
> > > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > > and others.  
> > 
> > ...
> > 
> > > > > +#define RP1_INT_ADC_FIFO	52
> > > > > +#define RP1_INT_PCIE_OUT	53
> > > > > +#define RP1_INT_SPI6		54
> > > > > +#define RP1_INT_SPI7		55
> > > > > +#define RP1_INT_SPI8		56
> > > > > +#define RP1_INT_SYSCFG		58
> > > > > +#define RP1_INT_CLOCKS_DEFAULT	59
> > > > > +#define RP1_INT_VBUSCTRL	60
> > > > > +#define RP1_INT_PROC_MISC	57  
> > > > 
> > > > Why all these defines which will never be used because they come from 
> > > > DT?
> > > >  
> > > 
> > > Right, those defines where originally designed to be included from dts, but
> > > previous discussion deemed interrupt numbers to be hardcoded instead of being
> > > specified as mnemonics. In the driver source code I just use RP1_INT_END as the
> > > number of interrupts but I thought that the specific interrupt numbers should
> > > be documented in some way or another. Since no one is currently referencing
> > > those defines, would it be better to just turn those in a multiline comment
> > > just to describe them in a more compact form?  
> > 
> > So, here's a couple of proposals about the interrupt defines:
> > 
> > - since they were banned from devicetree, and are not used anywhere in the code,
> >   turn them into a (admittedly long) multiline comment, so they are still at
> >   least documented
> > 
> > - since they were banned from devicetree, and are not use anywhere in the code,
> >   just drop them, we don't currently need them after all
> > 
> > Not sure what's the best way here, anyone can advise?
> 
> Maybe in the #interrupt-cells description in the device-tree binding?
> 
> In your patch 4, you describe this interrupt controller and you have:
>   '#interrupt-cells':
>     const: 2
>     description:
>       Specifies respectively the interrupt number and flags as defined
>       in include/dt-bindings/interrupt-controller/irq.h.
> 
> In this description, why not add the supported interrupt number values?
>     description: |
>       Specifies respectively the interrupt number and flags as defined
>       in include/dt-bindings/interrupt-controller/irq.h.
>       The supported values for the interrupt number are:
>         - IO BANK0: 0
>         - IO BANK1: 1
> ...
> 
> Or something similar.
> 
> This kind of description is already available. For instance:
>   https://elixir.bootlin.com/linux/v6.13-rc1/source/Documentation/devicetree/bindings/dma/fsl,imx-sdma.yaml#L64
> 
> Does it make sense?

Seems fine to me, if there's no concern from anyone I will procede like that.
Thanks for the suggestion.

Andrea

> 
> Best regards,
> Hervé

