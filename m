Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F09C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRYNtTbpngBL67wUewle2IDQdujocJUg7eR53XGin1c=; b=hBg3o6KnKcOVRymDHuIBJdRPjm
	Wkn0cpfKkmXAydjGCsmsmTCro2ZmrnxQZc93ThLyR4RNtMOn9ktdH9+67vtUydP3didfBil+36nhu
	zRA9+EpWmw8rxzbCKL2LZ9H/1e5KXn6yubOgsyQKFhCvGvSqh+BeF9lTNLvLmYc/Ct19ZYEz4y5sn
	roddT452Vow4m2mfUjilfLown1sqJx1Yo6IIf26OQaAOF3zTz+A1rYI4mmf89TIVYjkGFGy7xKW1R
	DuFg/TP6irSStfCzp5hj8+jLtLVm1Ezn58n9COB499PH2UompIPutN2ophyAec8mfei+fkujAIHe2
	crrrryww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEZ5-0000000FcAM-17kj;
	Fri, 27 Jun 2025 19:16:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDCw-0000000FRhJ-1K3W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B692046595
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 17:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6942BC4CEFA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751046589;
	bh=fENVGkGcV01nrx8rwyk5yc++tYlpmC/4in3yTWfI+BU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QDaBKqc73OAck/HvM0EVd5wtKUjUN7GPsOvpdjQ9yxQfT7gPphE3WJUX18LD5I3cV
	 3I0DsaAXNiZrzbAjgH5RmUIHzuGV+il3/DAWKdEl1GqN7pgoGcBq/ue07wIRoUWsUt
	 DTpXWcdsABzLOk1esyLFQ6+vPQhDQTQrIl2/oW859p+ENQfTmHeQIpUI/tNrE7f6Jx
	 0HaPtNPil8h6RVpt0LhQKj8TbFYuz1YRJsqIZTzOr7g9NNuWwvAtNNz3sRmHxoyX4R
	 hw1JP/ra1GDPoCgdErvqrQrL0xl6DZHuw+Uqxk597rbpThcBDon2oxslqivu081ygM
	 1Gw7oJVnPaDng==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so5165164a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 10:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7FNQNE/S22kE6rb6TR/mnKHlrFJtj2Mn4W8Q5srG29XFynl1QFPVByhqpAPtfDW0GzY7bhWyCmuuxOnW2vfuW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr5CZMPmohP4GuH7/7yyCY5dd59RtkgQxu99IG8NyvS5pJSDYU
	l52Lw0NMmNGhX035Bp4RjGYAcqVgiWgD8Ne5uSWeWoSHGyu0X3nigI8bv6go+WqYipjgSoRJuIQ
	R2KDP3bED5gCdPgPbcRhYdTrxwoz42A==
X-Google-Smtp-Source: AGHT+IHT5hz4lr0pRGvdH2rjBfGZM81PcOoFrAQguTcQw3WkJwjxgHpGim6dbfGwqFeg5PpW/uAYH3Ohif/f2EVITXw=
X-Received: by 2002:a17:907:cb86:b0:ae3:55bd:7724 with SMTP id
 a640c23a62f3a-ae355bd77f6mr319698366b.37.1751046587752; Fri, 27 Jun 2025
 10:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-19-herve.codina@bootlin.com> <20250627162245.GA3513535-robh@kernel.org>
 <aF7H4-toeb7Ouz3d@smile.fi.intel.com>
In-Reply-To: <aF7H4-toeb7Ouz3d@smile.fi.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 27 Jun 2025 12:49:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJCuevzu69bx3yWm3ZR9wZ+UsWuNXscig5KMm2WH4WxOw@mail.gmail.com>
X-Gm-Features: Ac12FXz-QVHJXTEek87UkxSujkajQAR7GpuL-shCkOttrl-AQQGXN_bA70yoM5c
Message-ID: <CAL_JsqJCuevzu69bx3yWm3ZR9wZ+UsWuNXscig5KMm2WH4WxOw@mail.gmail.com>
Subject: Re: [PATCH v3 18/28] of: property: Allow fw_devlink device-tree on
 x86 when PCI device-tree node creation is enabled
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20250627_104950_393112_0029EFB4 
X-CRM114-Status: GOOD (  22.70  )
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

On Fri, Jun 27, 2025 at 11:33=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jun 27, 2025 at 11:22:45AM -0500, Rob Herring wrote:
> > On Fri, Jun 13, 2025 at 03:47:58PM +0200, Herve Codina wrote:
>
> ...
>
> > > -   if (IS_ENABLED(CONFIG_X86))
> > > +   if (IS_ENABLED(CONFIG_X86) && !IS_ENABLED(CONFIG_PCI_DYNAMIC_OF_N=
ODES))
> >
> > I really want CONFIG_PCI_DYNAMIC_OF_NODES to go away at some point, not
> > add more users.
> >
> > I think this should instead check for specific platforms not with
> > kconfig symbols but DT properties. For ce4100, you can just check the
> > root compatible string. For OLPC, there isn't a root compatible (in the
> > DT I have). You could check for /architecture =3D=3D OLPC instead. Ther=
e's
> > some virtualization guests using DT now too. I would think their DT's
> > are simple enough to avoid any fw_devlink issues.
>
> I don't think this is good approach. The above check is more reliable in =
my
> opinion.

I'm fine with any solution that doesn't add a
CONFIG_PCI_DYNAMIC_OF_NODES which we can't remove. Adding it was a
kick the can down the road to merge the support worry the mixed
usecase (on ACPI systems) later. It's now later.

> > Alternatively, we could perhaps make x86 fw_devlink default off
>
> For my (little) knowledge I believe this is not feasible anymore.
> Some x86 code (drivers) relies on fw_devlink nowadays. But take
> this with grain of salt, I may be way mistaken.

Doesn't the CONFIG_X86 check disable it?

Rob

