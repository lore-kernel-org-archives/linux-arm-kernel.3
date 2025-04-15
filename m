Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B92C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/o+qQz8SJPuIGwYrNV59X57dUeEOJq11feG6bo6qQCg=; b=Fx+3eREzQxB+HxgBeEbI7i5A6u
	/p9X9YF9dlfRqNq+06CO20bdj1SHQ3EF2pW50eeBn6rsRW1Fpd/6XvdrtT7YqWUxA7PeEMENQpGiv
	htRlujXgZwqOoQ2bp3r/limqXteWzY5hFu6kyRUBc5QgdfIdya7tehQqKi10k4W+y2NZYm97MDFqG
	/8yb+Q7yVyY7amfBgfwsva/QwFL7OHrzNys0clsLp9qlznrG37S6086QpvcoD4+9g0l+yXR99k88Z
	xT0NG79ZPlHFP3f10WX5CpkbsljR7BNm6pMq9EgMjnjqmJkIW8qBqAbcA4d/UeHJ16mHGxsws7nip
	qHDdeTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kGd-00000006baP-0BoK;
	Tue, 15 Apr 2025 17:40:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jwW-00000006XUL-2jcX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D594B43992
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A6CC4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744737567;
	bh=8yka/gQeBhrlYJl1t7qkx70DxA7hHJaBmLjr/ZBHYqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jhw7DW3VqHIP3oCC9zZ5B2min/ozWe4z3fTBJFePlfJBXw1PL3lvj0ebqpk47Xo1j
	 fHsMk4C7B7Nz5Z74s2p6+lz16LQGmL5KIsMKFUeVCxUr0NFUR4t0h7FtxYVzjzUYyc
	 GC8GcJxioY+WzXChQpvR+goTqMq9c/gvEsj4sa+ouSXG4WWdjFbrrOzFiwY+MSyfu6
	 1vjNOH6wflfV7QvVtylAfwhJrHe0nqdRvrjBgb2z2FAIeluoRru+P40JGUGOAXrZPq
	 SEHgAcq10VwKaQQG8nNKnKvPrdgiIQgYo43gx6PMzMgPxo3YSzCOisLK/vofeHF4dk
	 LxllEjABcYLrA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso5334789a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 10:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSKoQrz/kcifhJze27JBr29ubu4KaWC+71vgkPATSFbSBtDriSzFf0xnFqmn/FYaRycS0muvuFpP43msX4PtEs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3izPn6lNeI+2ciOQPjVmtzixBxI+Y2R52vZBpsdZY5JItLY5K
	DOC620I+LjFmlccWbf16SB24pO6JsBi/j/JNPjIZFptKRKn+N1cHKN8wg69gzaEF+lQOA9VKeeD
	KcIvk7yky0+DRC3AougXE1+tWpA==
X-Google-Smtp-Source: AGHT+IFg/mg5Nw4gYKzUIV+g5HCy+mWdlEB6aIaPRaMh7pw+ii1aBxtkyH5Y0FGsRMWegnVV9LP1TH52Q9jz/Bmp/K4=
X-Received: by 2002:a05:6402:84d:b0:5e5:c3bc:f4e0 with SMTP id
 4fb4d7f45d1cf-5f370118051mr12498419a12.29.1744737566354; Tue, 15 Apr 2025
 10:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742418429.git.andrea.porta@suse.com> <3fbc487bc0e4b855ffbee8ed62cfb6bf3b0592e8.1742418429.git.andrea.porta@suse.com>
 <2025041557-masculine-abrasive-c372@gregkh> <20250415165505.0c05bc61@bootlin.com>
 <2025041531-dubiously-duchess-276a@gregkh> <Z_5-Jjbu6XoHGmxN@apocalypse> <2025041530-random-cheek-125d@gregkh>
In-Reply-To: <2025041530-random-cheek-125d@gregkh>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Apr 2025 12:19:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJbdvMrUEVwp4_yC4efhwuK4eCLYWFpGdvrVcbr213aqg@mail.gmail.com>
X-Gm-Features: ATxdqUHTw0_CVItdYBRikaW5EF3D0YJ32XibO0ClmZMuosKXRosNhnaQkfoIVa4
Message-ID: <CAL_JsqJbdvMrUEVwp4_yC4efhwuK4eCLYWFpGdvrVcbr213aqg@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] misc: rp1: RaspberryPi RP1 misc driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, Herve Codina <herve.codina@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_101928_732588_10B51EC3 
X-CRM114-Status: GOOD (  25.47  )
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

On Tue, Apr 15, 2025 at 11:14=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 15, 2025 at 05:41:26PM +0200, Andrea della Porta wrote:
> > Hi Greg,
> >
> > On 17:14 Tue 15 Apr     , Greg Kroah-Hartman wrote:
> > > On Tue, Apr 15, 2025 at 04:55:05PM +0200, Herve Codina wrote:
> > > > Hi Greg,
> > > >
> > > > On Tue, 15 Apr 2025 16:06:43 +0200
> > > > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > > On Wed, Mar 19, 2025 at 10:52:29PM +0100, Andrea della Porta wrot=
e:
> > > > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > > > and others.
> > > > >
> > > > > So shouldn't this be using the auxbus code?  That's designed to "=
split
> > > > > up" PCI devices such that you can share them this way.
> > > > >
> > > > > Or did that get rejected somewhere previously?
> > > > >
> > > >
> > > > It doesn't use auxbus probably for the exact same reason that the
> > > > one given for the LAN966x PCI device driver [0] and [1].
> > > >
> > > > Avoid all boiler plate needed with auxbus whereas drivers already e=
xist
> > > > as platform drivers. Internal devices are handled by those platform=
 drivers.
> > > > Those devi just need to be described as platform devices and device=
-tree is
> > > > fully relevant for that description.
> > > >
> > > > [0] https://lore.kernel.org/all/CAL_Jsq+1r3SSaXupdNAcXO-4rcV-_3_hwh=
0XJaBsB9fuX5nBCQ@mail.gmail.com/
> > > > [1] https://lore.kernel.org/all/Y9kuxrL3XaCG+blk@kroah.com/
> > >
> > > I really hate creating platform devices below a PCI device, so I'll k=
eep
> > > complaining about this every time people try to do it.
> >
> > I agree with you, but as Herve has already pointed out this would mean =
incurring
> > in significant work to adapt drivers for all the peripherals (there are=
 quite a
> > few), while with this approach they would be left untouched.
>
> We have no problem with reworking existing drivers, especially if they
> will be doing the correct thing.  Don't let that be an excuse, it
> doesn't work with me, sorry :)

Let me resurrect of_platform_bus so we can stop repeating the same
conversation... MMIO based devices using DT (and ACPI) are platform
devices. There is no other answer in the kernel today.

Rob

