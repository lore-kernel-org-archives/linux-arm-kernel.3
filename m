Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D51D10C1B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yR+elAtNrZb0dYqaY4oOlXhVHYbUSfEfohSukSkC5o=; b=mZrQSXgc2Lw+pBpWkPQh8hmwpX
	O46JNNc2hjZ6d2hyQx0nbLHgZ4YckOqtSzMksj2Gw9c84Fq0xqKXilMgP7T1DCHO/LpPOpbqW1uoA
	x/gz4P4tCWaA4TvzPbjl8iYyhoeMtQyrwZ5YhUBC3o1UdqYT1n9fIXW2TT5S2IqzpCl774277Um1+
	o82RXa/ADxLZ6IubnqSugotNK9SMTAvxTtYklw7Ip2dRCtyfU3aqEEyMvycvG8upZDopa2OKm43yy
	Jh7PrI8bhVnoIVRKk1Q5uLS738xTTMLrj3oDay2pFTbSz8CJy0/j/jtYT85K2nxuM9LF0v6MeQQEo
	DHsGFyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t51GI-000000086ER-0YyL;
	Sun, 27 Oct 2024 11:16:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t51Ei-0000000863J-0sVQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 11:15:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d58377339so2980221f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730027706; x=1730632506; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3yR+elAtNrZb0dYqaY4oOlXhVHYbUSfEfohSukSkC5o=;
        b=CmsOWcDphigXTMxoQjUlc3oHysCM+j0EF1R12fqhE5FlN6YwcH/0jbPpocqPg109nU
         /UvMY6FfEHu6lTW6ZfG8sJgVqeOKBUhbdnRJDiRiBb4iRMbKxpS2/hEhhiCi1EK5SL2J
         h9atPvPNhJ/D9e1hy/dfsywy3cuxkTnl0LlIU/Gi8M7HfH5/LR5cxnqS2WEThlqyzp4S
         Dij9MloGwYF9EjNQVc7FiWsVX9+btwgcCoa7qcSFdqEmNdcasohw+t8tshwgV5XwVzNy
         F/ntpFlbsmrKxZa5f8TFNDKRJXBLz27QOlukvnGYjJR0D9Iyi1jDUn3Ubrv7gL+DXpNr
         +w4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730027706; x=1730632506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yR+elAtNrZb0dYqaY4oOlXhVHYbUSfEfohSukSkC5o=;
        b=JAJJLDdrlXUW+hZ3EuDxWvUHMNRkC/lqNmkMOi4hNVoA0QgNg3ty2DAtuY6KCTibyj
         PSAN20VL/Ugc8F9rRhr23aN7wk9q1dYd8h4hUMNz0QRQ+sV9H8t2rDvNsocMPB+rpqF7
         OVyGUq5QaoSHk6Z1FIi/APLBiJK8XOc3//pB8j6MkX2ir0zWQXc8qLhGE+2DhUANy7S7
         GSaaYACnOIn7jULBShkNoEVHsEMdUjg5FGwtLuipEFXM56VxAoeOhs4KIApI1pLlCbou
         8yhuYI+MiWys1osWxhV47hAPeVhMS7lmh5Hmeds73K9XB5ZtfL1RQYY1ls8KhsbkDkm/
         X1pw==
X-Forwarded-Encrypted: i=1; AJvYcCWDIRCgT72C6FNae350xt84aDqcv9eU2lfIw9ktDRb+tYLrPxkS3puElimFLSuF1UzHOSj26V03WrfbS19FbwqS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Y99xf5pNuHeNrvHikkStdV0WZCyEQ3oTGvzadN+OV9lpZ1DP
	eTh8sYu9gXJE9Hq5aZALqQxfzTyIQ+SuTuCnEgM2Ws6a1MzFMZJfv4nk1K5xzyM=
X-Google-Smtp-Source: AGHT+IFOjK3SXwMnrJ05PYWHAYrOeHgTV8mQIzdbz7LLP2yDbdJwRnYmcIkVqvkxVFzW4DkqcW0Zzw==
X-Received: by 2002:adf:f884:0:b0:37c:d1ea:f1ce with SMTP id ffacd0b85a97d-380611a46famr4631904f8f.25.1730027705624;
        Sun, 27 Oct 2024 04:15:05 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f0697easm270520366b.94.2024.10.27.04.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 04:15:05 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sun, 27 Oct 2024 12:15:28 +0100
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Stephen Boyd <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	St efan Wahren <wahrenst@gmx.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	phil@raspberrypi.com, jonathan@raspberrypi.com
Subject: Re: [PATCH v2 08/14] clk: rp1: Add support for clocks provided by RP1
Message-ID: <Zx4g0H5nib7asHxc@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <022cf4920f8147cc720eaf02fd52c0fa56f565c5.1728300189.git.andrea.porta@suse.com>
 <611de50b5f083ea4c260f920ccc0e300.sboyd@kernel.org>
 <ZxkX5gnDkWrTynRv@apocalypse>
 <20241023183240.0dffae03@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023183240.0dffae03@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_041508_264467_7D842CBC 
X-CRM114-Status: GOOD (  19.94  )
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

On 18:32 Wed 23 Oct     , Herve Codina wrote:
> Hi Andrea,
> 
> 
> On Wed, 23 Oct 2024 17:36:06 +0200
> Andrea della Porta <andrea.porta@suse.com> wrote:
> 
> > Hi Stephen,
> > 
> > On 15:08 Wed 09 Oct     , Stephen Boyd wrote:
> > > Quoting Andrea della Porta (2024-10-07 05:39:51)  
> > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > index 299bc678ed1b..537019987f0c 100644
> > > > --- a/drivers/clk/Kconfig
> > > > +++ b/drivers/clk/Kconfig
> > > > @@ -88,6 +88,15 @@ config COMMON_CLK_RK808
> > > >           These multi-function devices have two fixed-rate oscillators, clocked at 32KHz each.
> > > >           Clkout1 is always on, Clkout2 can off by control register.
> > > >  
> > > > +config COMMON_CLK_RP1
> > > > +       tristate "Raspberry Pi RP1-based clock support"
> > > > +       depends on PCI || COMPILE_TEST  
> > > 
> > > A better limit would be some ARCH_* config.  
> > 
> > I've avoided ARCH_BCM2835 since the original intention is for this driver
> > to work (in the future) also for custom PCI cards with RP1 on-board, and not
> > only for Rpi5.
> 
> Maybe depends on CONFIG_MISC_RP1 ?
> CONFIG_MISC_RP1 enables the RP1 PCI driver

Yep, seems the most logical one, thanks.

Regards,
Andrea

> 
> Best regards,
> Hervé

