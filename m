Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A84C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l06gnX+rMh4tbDQ2knly1tj22l1IG+Tl2ICY/coWXIM=; b=5Ct2IJef3ngX0QxT1VmFTRBOf7
	cWaEuRLgtOyhYCoghlyZgxC1L990XmlRn/GN/F3bR4b+5awFGqlqfPSlqRoL7IB9dDyF7Xm0G6P1g
	ufRyMmhRQmpztpfY7kV8L97WIr4Auo+/ojg5lumXWgHd2zDcL9Rx4lBhlIX4VXxNEcFKRmBLbNBkN
	t9/JznWhisYO+TFva5ZcEvHwfPsr81JXzJ+s7PXX6w4Xxm8cyy9VFFXKXuNepccy92QV96X69NhrO
	45Ppdyk6iyQz0X5Y+0BEV/lDw9EWEZllpfGJUQVE05C3Fu3wHhQ4lWm/cxofWXQ5jrx1b1op/IkvN
	P19yghKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFx-000000034gB-31i0;
	Mon, 14 Jul 2025 18:50:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubNEC-00000002zl5-2ipy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 17:44:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA88BA570EA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 17:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA06C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752515075;
	bh=FpIs8x3wOR4QDIl4rTH8WQCJsw8SVEQKjwt/hRvJVYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f8E9Iw0l1s3u4GUjtdigSpqe/0ME79OcCpJcopd+wcAm9W0iNGsHck2mRJKvqniJU
	 cHL/+J4GYfwo7kkhEyKN+v82iEB05WpiZGbxMJZe3upnKFvtJxg6ER+J2rZ8Ljro7b
	 HtlpKYIYp9AWyrd/hfP9TVfKZWJYS5uxWNgZ1d8Kf7g/suwYj0nle35JgGzKXFYUtk
	 Xlika5iSvll0Z7lJGVjJd1uo3U4nim87L9hE1vH3YfcYIJ9Hn5fYLployw/rK7mYgl
	 U7mAeuxWv7hPy5CfhW0ewERIQB281YFPfoMx8oomGNXvqLpyNor3Loid2VwjgkU6SR
	 JsnHYrciiFveA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae3b37207easo937058066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 10:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpJJ7IgVNLlyIDiapZlp+ez63k0RKYhw3VBFzS66+hUB32IJXv9CT0PJYGNWr29oHGW3sPkmR1g/AwSW8pxn3X@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx3OGeY9FWxQuoXx5f5vE9TzzlFLB0MbPTOk+pRcUQsAYgAs+8
	1uc40cjV4jse0TLmGaJTXqM6FHvRHbBbg/Iu2h7J5R8dwtZXdDuxMqrwB8mZJ51f6gDhp5Kd9K/
	a90Osw1mWCEmO12E5oTrRTeREnJECnA==
X-Google-Smtp-Source: AGHT+IEGQ7nHD+/xyba/tE0S2QjAjkVhfLJ9Pp8nFl2aw5w2DKZ8hhnS6UxFCO7dT9w+GWuozWbDzLrfoixjq31W73I=
X-Received: by 2002:a17:907:3c8e:b0:ae3:a3f7:ad8e with SMTP id
 a640c23a62f3a-ae6fbdec31emr1398694666b.25.1752515074068; Mon, 14 Jul 2025
 10:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-6-herve.codina@bootlin.com> <20250627155200.GB3234475-robh@kernel.org>
 <20250703093302.4f7743ea@bootlin.com> <20250704105725.50cb72b9@bootlin.com>
In-Reply-To: <20250704105725.50cb72b9@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Jul 2025 12:44:22 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLnPxUKXo3+Qdv-C1kXa6zbL1zMKDQsg1--08EY4TwsKw@mail.gmail.com>
X-Gm-Features: Ac12FXxDLTYP2NvcYJSixLW6cmzqJDujemRg676_boOWrjf2yfM7xtUL9oD9OWo
Message-ID: <CAL_JsqLnPxUKXo3+Qdv-C1kXa6zbL1zMKDQsg1--08EY4TwsKw@mail.gmail.com>
Subject: Re: [PATCH v3 05/28] bus: simple-pm-bus: Populate child nodes at probe
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso <dave@stgolabs.net>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_104436_819753_5FB44760 
X-CRM114-Status: GOOD (  50.43  )
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

On Fri, Jul 4, 2025 at 3:57=E2=80=AFAM Herve Codina <herve.codina@bootlin.c=
om> wrote:
>
> Hi Rob,
>
> On Thu, 3 Jul 2025 09:33:02 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
>
> > Hi Rob,
> >
> > On Fri, 27 Jun 2025 10:52:00 -0500
> > Rob Herring <robh@kernel.org> wrote:
> >
> > > On Fri, Jun 13, 2025 at 03:47:45PM +0200, Herve Codina wrote:
> > > > The simple-pm-bus driver handles several simple busses. When it is =
used
> > > > with busses other than a compatible "simple-pm-bus", it doesn't pop=
ulate
> > > > its child devices during its probe.
> > > >
> > > > This confuses fw_devlink and results in wrong or missing devlinks.
> > > >
> > > > Once a driver is bound to a device and the probe() has been called,
> > > > device_links_driver_bound() is called.
> > > >
> > > > This function performs operation based on the following assumption:
> > > >     If a child firmware node of the bound device is not added as a
> > > >     device, it will never be added.
> > > >
> > > > Among operations done on fw_devlinks of those "never be added" devi=
ces,
> > > > device_links_driver_bound() changes their supplier.
> > > >
> > > > With devices attached to a simple-bus compatible device, this chang=
e
> > > > leads to wrong devlinks where supplier of devices points to the dev=
ice
> > > > parent (i.e. simple-bus compatible device) instead of the device it=
self
> > > > (i.e. simple-bus child).
> > > >
> > > > When the device attached to the simple-bus is removed, because devl=
inks
> > > > are not correct, its consumers are not removed first.
> > > >
> > > > In order to have correct devlinks created, make the simple-pm-bus d=
river
> > > > compliant with the devlink assumption and create its child devices
> > > > during its probe.
> > >
> > > IIRC, skipping child nodes was because there were problems with
> > > letting the driver handle 'simple-bus'. How does this avoid that now?
> >
> > I don't know about the specific issues related to those problems. Do yo=
u
> > have some pointers about them?
> >
> > >
> > > The root of_platform_populate() that created the simple-bus device th=
at
> > > gets us to the probe here will continue descending into child nodes.
> > > Meanwhile, the probe here is also descending into those same child
> > > nodes. Best case, that's just redundant. Worst case, won't you still
> > > have the same problem if the first of_platform_populate() creates the
> > > devices first?
> > >
> >
> > Maybe we could simply avoid of_platform_populate() to be recursive when=
 a
> > device populate by of_platform_populate() is one of devices handled by
> > the simple-bus driver and let the simple-bus driver do the job.
> >
> > of_platform_populate will handle the first level. It will populate chil=
dren
> > of the node given to of_platform_populate() and the children of those
> > children will be populate by the simple-bus driver.
> >
> > I could try a modification in that way. Do you think it could be a corr=
ect
> > solution?
> >
>
> I have started to look at this solution and it's going to be more complex
> than than I thought.
>
> Many MFD drivers uses a compatible of this kind (the same exist for bus
> driver with "simple-bus"):
>   compatible =3D "foo,bar", "simple-mfd";
>
> Usually the last compatible string ("simple-mfd" here) is a last fallback
> and the first string is the more specific one.
>
> In the problematic case, "foo,bar" has a specific driver and the driver
> performs some operations at probe() but doesn't call of_platform_populate=
()
> and relies on the core to do the device creations (recursively) based on
> the "simple,mfd" string present in the compatible property.
>
> Some other calls of_platform_populate() in they probe (which I think is
> correct) and in that case, the child device creation can be done at two
> location: specific driver probe() and core.
>
> You pointed out that the core could create devices before the specific
> driver is probed. In that case, some of existing drivers calling
> of_platform_populate() are going to have issues.
>
> I can try to modify existing MFD and bus drivers (compatible fallback to
> simple-mfd, simple-bus, ...) in order to have them call of_platform_popul=
ate()
> in they probe() and after all problematic drivers are converted, the
> recursive creation of devices done in the core could be removed.

The problem is how does a bus driver know if there is a specific MFD
driver or not? It doesn't. The MFD driver could be a module and loaded
any time later. We'd really need some sort of unbind the generic
driver and re-bind to a more specific driver when and if that driver
appears. We could perhaps have a list of devices with a driver because
in theory that should be a short list as the (broken) promise of
simple-mfd is the child nodes have no dependency on the parent node
which implies the parent doesn't have a driver. The specific
compatible is there in case that assumption turns out wrong.

Rob

