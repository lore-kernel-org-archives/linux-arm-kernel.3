Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C75ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSsfnjXFCg6rG3NcR1UlA7/Xq7/GSJvjS3osS5RyZYU=; b=0dldpvdddIsvApGVimDkoaBCIy
	gRE1l49eDZi/QXcueZvmDYFQ09lFMd49FQ14KA2hgqbdH0DbbHhzeskCCDKOx59ar+vNJtZ4i27Yc
	SH3ust+OuQ4NnF3BGDQQDAxXkX8EOqPSWKi3MBhsfY0g+ddcZ8sFbveVLyXjn4v2bzDyGyCwkEzhs
	8xgvoynorG+DtBpzIm3ME8oFVYJ4Kv1WIRKL3VSGqWkUeLp08of4VqcWV46zXA3hebgiK/mmBtc+K
	YCfcBQwltwioZPu+KOo24LfgIyUZhe1AJn2oBXXa6Uwg4FigmmM/6tEt5X2Pn0jtcg86qSyKNyj4G
	BWAv7S2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J90-0000000DIbE-0hBR;
	Mon, 13 Oct 2025 14:03:22 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J8v-0000000DIZY-3Q8n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 14:03:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso5934653a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 07:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760364196; x=1760968996; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BSsfnjXFCg6rG3NcR1UlA7/Xq7/GSJvjS3osS5RyZYU=;
        b=I7W9M/Lbs4zJRr6ueHAUG/ussUkECwKo5mLOgJXxFHaSUKzBja2urUAlQVLWxMK0jj
         PSEs2HawN3Bfgz4sw2QyfbRWJPIWl6wqDkx4S8ZieARCcd9W/mk7KdLVe+uK4rMDl3UF
         vLdt2qERd1RR+PsKKynSfynczkmDl0WaEM2pTHb7yTGfa3NQXtqMUtaZ2n1E9JvmX1yP
         +YWo0NqhWKOXSLgxWKr3+DURLqzAwLOspq3cMh2kjiL6YHJL69dW2+yPxQqBVGkq34Sy
         t6lUGV5GaFDS47j7auM+3r2w0rrPdcMULYRaGw3Na83vhGk1O5m3zUtYhbim5vpcOcnA
         41UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364196; x=1760968996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSsfnjXFCg6rG3NcR1UlA7/Xq7/GSJvjS3osS5RyZYU=;
        b=g+yuCB5f3y6d49HDJ4qUFKKmRN4mmLyiavrTiPdwgdXtwyZ9xWw/d8fg4WHNi1uq+N
         1tnaY+R+ZoKff5HDajQnXamNe+nkOCt0aCSFrodUsEBHIPkM94HQTBKY1gssWaxEdmDd
         RqDXR5DOwq0S7Lsw1E7/OLBR8kyt7g4A5Qqk4G3xH2d6I/Ya8BfUujoU6mHdk+w7WCMa
         kbgxElNb6ksOnmNGGwNP17571K2QENAQ3GUTAyFplDH6FVVqYmPSlJuhym/bhRDmub1j
         uVP3sQ/8an2BG8NnVcMH9A6vFU7gqto6S7S58GiyiN4oMY6/smklfXZinX3IMqPO0VI1
         Q2dA==
X-Forwarded-Encrypted: i=1; AJvYcCVRFpoiZUU4MvGu7FAz4/KEmALMd0EpVTxCalqmfFGhtdQmcgsRdxoM1gNChTNwLP7GPC1As2sFvSYGL67sXajc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw257HdcFbxvdQ6DfkfXTuiGFYpyQsUi8T1ecV1zA9FTUJa54Qf
	ZUfnMQXmWhDJL6ZB/j37DTIcsvY1i2u8qO1JeibXEfNHALkAsNWsfbtOguV7p8vYN+pkEQzLgie
	pWxjGy3Zx5qsHtRR/c86tY5DEGGRZfJs=
X-Gm-Gg: ASbGncu3o9QV0hm/RB4ZDL70wVc2u+L+kNfbm37C/lgV5OqVNwMyuKDkqLGeO4vP171
	sLvM5BEmQCe0o+EItPdZ8J9ETiN0u5OXa347ASPB0HEtSOkhDRT6nHfFcBSVe6rXYG1TN2vEpMs
	R/upM5yjxpUqHkNHQohaq87TJUqRy6y2JKgvQI5DeJMGDWPPVSeJB4RHeBdDKPirGJhOWyyOeNt
	hwh09DGuXyubkRYMpKQ0RY63bS+wDUNHVg=
X-Google-Smtp-Source: AGHT+IG1H5x/3Hw2x99ssho3c2GS311XkT8BwdZCay2Lc0xiXSDo5L8TJutYi6w3Oy++gD7LUBz2wwFZk5Y65Fe3Ir4=
X-Received: by 2002:a17:906:af19:b0:b55:d205:f40e with SMTP id
 a640c23a62f3a-b55d205f96cmr1243656866b.33.1760364195682; Mon, 13 Oct 2025
 07:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251013101727.129260-1-linux.amoon@gmail.com>
 <20251013101727.129260-2-linux.amoon@gmail.com> <11a8783345566d5ea6c696ecd007490289ba0b5f.camel@ti.com>
In-Reply-To: <11a8783345566d5ea6c696ecd007490289ba0b5f.camel@ti.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 13 Oct 2025 19:32:59 +0530
X-Gm-Features: AS18NWD3OIfNtpl-KFzVJ14mdZzPNIWP10Za43Y5NpiOwkGmGSbzZ3gomqupFk8
Message-ID: <CANAwSgTXC0uOwZhZ69viUB3t4-jH+XArP8e4vukDb2zrSgOTuA@mail.gmail.com>
Subject: Re: [RFC v1 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to
 get the clock
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_070317_869016_33E61052 
X-CRM114-Status: GOOD (  24.94  )
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

Hi Siddharth,

Thanks for your review comment

On Mon, 13 Oct 2025 at 16:43, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
>
> On Mon, 2025-10-13 at 15:47 +0530, Anand Moon wrote:
> > Use devm_clk_get_optional_enabled() helper instead of calling
> > devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> > the error handling and makes the code more compact. This changes removes
> > the unnecessary clk variable and assigns the result of the
> > devm_clk_get_optional_enabled() call directly to pcie->refclk.
> > This makes the code more concise and readable without changing the
> > behavior.
> >
> > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/pci/controller/cadence/pci-j721e.c | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > index 5bc5ab20aa6d..d6bbd04c615b 100644
> > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > @@ -479,7 +479,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
> >       struct cdns_pcie_ep *ep = NULL;
> >       struct gpio_desc *gpiod;
> >       void __iomem *base;
> > -     struct clk *clk;
> >       u32 num_lanes;
> >       u32 mode;
> >       int ret;
> > @@ -603,18 +602,11 @@ static int j721e_pcie_probe(struct platform_device *pdev)
> >                       goto err_get_sync;
> >               }
> >
> > -             clk = devm_clk_get_optional(dev, "pcie_refclk");
> > -             if (IS_ERR(clk)) {
> > -                     ret = dev_err_probe(dev, PTR_ERR(clk), "failed to get pcie_refclk\n");
> > -                     goto err_pcie_setup;
> > -             }
> > -
> > -             ret = clk_prepare_enable(clk);
> > -             if (ret) {
> > +             pcie->refclk = devm_clk_get_optional_enabled(dev, "pcie_refclk");
> > +             if (IS_ERR(pcie->refclk)) {
> >                       dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");
> >                       goto err_pcie_setup;
>
> 'err_pcie_setup' returns 'ret' which isn't being updated above.
> Maybe add:
>                 ret = pcie->refclk;
> above dev_err_probe(...
All return values from the dev_err_probe function appear to be missing
in this file.
I'll address this in the next revision through a separate patch.
>
> >               }
> > -             pcie->refclk = clk;
> >
> >               /*
> >                * Section 2.2 of the PCI Express Card Electromechanical
>
> Regards,
> Siddharth.

Thanks
-Anand

