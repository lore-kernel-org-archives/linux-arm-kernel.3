Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6804D11707
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkayB6WnSxJs4BKoPWSzkYu8BfwRMxQ9y2LaJgKG6IY=; b=M8EDgNg5ntS7mZkDC7NltfwzTq
	WpwxFgJCrJMQliyMcVGR7uzryulhzLsz17M7bnO7kffSlZzD4pJq3qa4Fv4lgCsnlTcyCBwZE+7QS
	r1be9pTDj0KVkKmGfZfC0NUsCyvAQlrn0uaz8ro/dgXBq2vE6rnHQuDp6h8szxX64YUBtTE7J9/zD
	Mwd89d6HmOLWSg14ZrNAJbKTlDMs0Ov+naO6/eOOaze9lsKCkoRa59xRqxBQDv5kD7AI3RCApx2b7
	YIBfec+TLm0ZUDsOYe3a0w1VgKwFdMhxgdpYqgNzyGZBzOh/F7tpKr/jtYBh3GBNs9maKx00bgYbY
	n1Cb06Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t53Ja-00000008GEs-2ZbW;
	Sun, 27 Oct 2024 13:28:18 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t53Hz-00000008G79-1vyg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 13:26:41 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5c9850ae22eso4374831a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730035597; x=1730640397; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hkayB6WnSxJs4BKoPWSzkYu8BfwRMxQ9y2LaJgKG6IY=;
        b=JI90Z6lvO1egtay5HRNiPE2UqSL+xPbShK2tC36EGrol5+bREZUzqJumf0ouEYE4b8
         ZEMI6SKB17jSY96mW79dIQSws/1V2qPYmfaky1A1gFWF9gnPh06apRMusKxc+pjsaXzh
         4okDBL8T3BjR6okiUcsn1hXj7wl0QrEWynbwQBrNYFN2OVAHu/YkCHwSoEOQBz5GBfZI
         7zc4sJ0dGFXyE8+DqmfTU8jiolEKBKelsQ/4/MHDePC9o6kR7xNyDSiSfPxazgVjWr5u
         cejdzUq6jKIrPRj8hu1ZGaKlt/Cz56wV69vznkMh8QNSE71iBwTF3kuR9p2mnL9VLN2m
         +RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730035597; x=1730640397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkayB6WnSxJs4BKoPWSzkYu8BfwRMxQ9y2LaJgKG6IY=;
        b=BFWp9PHlq1te6qDlmLMCfx/V9QZaknIkJHRNlI3RrAfQXa2Dd+sMga22jFK/3BX1LW
         0xFUZ4rfQV+wimc/Q+3DXYZpnyyX8AIqmzFuEWmLiEQy3YnRKdayXbFwAmLIOs13PgdH
         aliV2QjAT5BvtI757E4edvNuNpVC/zTF7LE/53zX6iABZheGgec3V/PFK2gf46pq0wYt
         Ha4mjQxhauZTVEDncb7Mx5icfwxXX27Afo4wQDovRTGlPJ4PiKqcUPi+I0BvQ+8AG0p1
         hpfCznxyf0qBfBt63whezpCKooHZZVSids/E2ByLs5U+7tda2yZpIY386eQX0YY9vCyv
         6YWw==
X-Forwarded-Encrypted: i=1; AJvYcCXzkoi/8JQpYSEO5GEl4QDFYkfqOEdMc5R7AFNSDqTl7Z69eed31td7fBKAQDI/mluDS3yx1e3AXE+EymFeYQHe@lists.infradead.org
X-Gm-Message-State: AOJu0YxVvQFK0pP3cqiMIG61iA5j7MLSfClbbLk+jKBkWcLNVBP3bWCp
	LnKPXgpxje/WF5vGaZO3kfP0PLvzwZN0Ct6rc6qVEMUrVF8LPeJKFgsLzQK1lKE=
X-Google-Smtp-Source: AGHT+IGODKCkNnm13dGswFX5M8oMKsn4zXbFtPFHoQf1TvOwmbqjg60TYzbmHIVU8ekajFjlSp52dQ==
X-Received: by 2002:a17:907:94d0:b0:a9a:634:dd2 with SMTP id a640c23a62f3a-a9de61ceb81mr470840366b.43.1730035597406;
        Sun, 27 Oct 2024 06:26:37 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c3646sm2364100a12.47.2024.10.27.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 06:26:36 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sun, 27 Oct 2024 14:26:59 +0100
To: Herve Codina <herve.codina@bootlin.com>
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 10/14] arm64: dts: rp1: Add support for RaspberryPi's
 RP1 device
Message-ID: <Zx4_o34Iyqb5mh_l@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <3f6f38c06b065f5f6034ad4ed3a24902ee59f378.1728300190.git.andrea.porta@suse.com>
 <20241007165740.14d372f5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007165740.14d372f5@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_062639_525727_A488F1A5 
X-CRM114-Status: GOOD (  22.46  )
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

On 16:57 Mon 07 Oct     , Herve Codina wrote:
> Hi Andrea,
> 
> On Mon,  7 Oct 2024 14:39:53 +0200
> Andrea della Porta <andrea.porta@suse.com> wrote:
> 
> > RaspberryPi RP1 is a multi function PCI endpoint device that
> > exposes several subperipherals via PCI BAR.
> > Add a dtb overlay that will be compiled into a binary blob
> > and linked in the RP1 driver.
> > This overlay offers just minimal support to represent the
> > RP1 device itself, the sub-peripherals will be added by
> > future patches.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> 
> ...
> > +/ {
> > +	fragment@0 {
> > +		target-path="";
> > +		__overlay__ {
> > +			compatible = "pci1de4,1";
> 
> The compatible is not needed here. Indeed, it will be added by the PCI core
> when it scans the bus and adds the missing nodes.
>   https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/pci/of_property.c#L383

Sure, but I've added it so that the dts could be validated.

> 
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +
> > +			pci_ep_bus: pci-ep-bus@1 {
> > +				compatible = "simple-bus";
> > +				ranges = <0xc0 0x40000000
> > +					  0x01 0x00 0x00000000
> > +					  0x00 0x00400000>;
> > +				dma-ranges = <0x10 0x00000000
> > +					      0x43000000 0x10 0x00000000
> > +					      0x10 0x00000000>;
> > +				#address-cells = <2>;
> > +				#size-cells = <2>;
> > +				interrupt-controller;
> > +				interrupt-parent = <&pci_ep_bus>;
> > +				#interrupt-cells = <2>;
> 
> Not sure this node should be an interrupt controller.
> The interrupt controller is the PCI device itself (i.e.the node
> where the overlay is applied).

Right.

Many thanks,
Andrea

> 
> Best regards,
> Hervé
> 

