Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DEFD0C5E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKQtKEQ691WB5aL1CY9xzFRryNO/YNcfGDP3okJsWkk=; b=VjLCY0lJxnP8FoIf2s+GRn4CFx
	QhonwHXqwSTVGdLfYBUEKkWGn+vw8MrgOjvvXrq+jxlhrtSM1j1LuRfdNed/+c/HiMwOAsHxRucoL
	AU3tuJnAzCfMxLSo4ju98AQrqZyPn0evdZJmKIxlbCwX9RCXf3UsGGirQAUeQKTfUOmyMR0RzKATu
	LPw5X1egcQZ6I3697GxYMHSJpunl6fJyZKux/t5uTYRbiP0SC0Ow18PFMs9ZFqH4xQT5iEChx2fXA
	ND2hkPXwp8MtW7AWYQIm/e90xo2KIKdVRBcizUurshmZnNtNjQb3mVw86q625SDMZEP6KUT/TWwnw
	YevX3LAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FiG-00000002z6b-1Rky;
	Fri, 25 Oct 2024 08:30:28 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Fge-00000002ysu-2fUU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:28:50 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a16b310f5so262451566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 01:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729844926; x=1730449726; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GKQtKEQ691WB5aL1CY9xzFRryNO/YNcfGDP3okJsWkk=;
        b=CyBflWNmr5ld+nRZ2DMa3seyHUUUCmXAfqZUMMuiLQ3gESlH0tGAbb2hph5n+5rpeG
         G3AEAMwlkqkxN/nynySj+K4FBGobDZ5E84gdxwhfxnLLQ8BS3/gS+WFRqn8JlOSjT0+B
         oj651hDbId020HDN6ZI9IR1NhUpJgoVIxtvVn8ViIXYLoeu1UdrDxCiTJxUxg7/VHupz
         dW40V6IuAKl1gExq7wZ64OiJBQ3hQ/BW74vOPSc7UxWoQR4+il54i0GaVT2r+TCT5IOd
         5QbJDJ/GdA2wYF0sxx6oxUk8Na3DQSRt2grNe6doHmpW5yuibUCaFx/lSGfMT+ceTbRo
         LufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729844926; x=1730449726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKQtKEQ691WB5aL1CY9xzFRryNO/YNcfGDP3okJsWkk=;
        b=fRd1QdLNBmfYHkOGC43FCmALr/IfX/SX8FiVAnH9MQzSoA0hs1aYdqFvNlBq7llnhA
         E9EP7Y/FcNAyLr3fwkDa9ot750dBLPbp3lJ12a1xy1IguD0Vp+TAlecHXAkd5xAiNcGa
         mvbQOnB7hu8VUD7T2POEJwyr9NK017pmKiZ3B4UFf7WoUijGBGf1x/edhpjSBfeENgyf
         xQePGwDKmVREV2qRtQZuJzYaKba8BGa3/5pAuUdnTPYsDH7zsLLzWEnsw5NrEUhpNKVs
         +X3zVx1Po91pioM1MPCLUeoT4nnIb5RPaZHiiDqDQgdBOfjuoljGRtYCLiE0XwJNaTl1
         yigQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZRG/oR/+eUn3rcKiUcasBLS+buDHej0KNZnp6g4fhMZWd6J6yAajdlJmbu1AFgxAF2zAv5lPqR5SKcIPglrup@lists.infradead.org
X-Gm-Message-State: AOJu0YxcMGZgNduqyM4vKR+rzplyztWJmS9cDJiqCGvv6uvc6Z7jU4ko
	ckTl9cY3qvckwuYGeATiK+6nTvJast7djR1svOQy9mmQ7tiT+agXFYjprYyS7O8=
X-Google-Smtp-Source: AGHT+IEKAsvpP2dybXSJ7Ofjl3bCLXFPuuy1eHgZQTXd9CLcGnC5HYUafi69GsS8vo706m6wGKRfWw==
X-Received: by 2002:a17:907:9406:b0:a99:e850:deb3 with SMTP id a640c23a62f3a-a9abf890eaamr841444666b.18.1729844925999;
        Fri, 25 Oct 2024 01:28:45 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c803asm391336a12.56.2024.10.25.01.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:28:45 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 25 Oct 2024 10:29:07 +0200
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Subject: Re: [PATCH v2 11/14] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <ZxtW0z7-JaK3dWdQ@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <c5b072393d2dc157d34f6dbeff6261d142d4de69.1728300190.git.andrea.porta@suse.com>
 <CAPY8ntC0B0RdNmvGMaDcp-p9gZOcWBbeC6BjbcihrijRXjRVkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntC0B0RdNmvGMaDcp-p9gZOcWBbeC6BjbcihrijRXjRVkA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_012848_699854_2CD2885F 
X-CRM114-Status: GOOD (  15.09  )
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

Hi Dave,

On 16:21 Thu 24 Oct     , Dave Stevenson wrote:
> Hi Andrea
> 
> On Mon, 7 Oct 2024 at 14:07, Andrea della Porta <andrea.porta@suse.com> wrote:
> >

...

> > +static const struct pci_device_id dev_id_table[] = {
> > +       { PCI_DEVICE(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0), },
> > +       { 0, }
> > +};
> 
> You need a
> 
> MODULE_DEVICE_TABLE(pci, dev_id_table);
> 
> here in order to load the module for the cases where it isn't
> built-in. Otherwise you have to manually modprobe the module.

Sure, thanks for the heads up!

Regards,
Andrea

> 
> Cheers.
>   Dave

...

