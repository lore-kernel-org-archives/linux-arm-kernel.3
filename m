Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B51C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 19:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Tb/N4qJeTx+saRoJfYyOTEiDaeDg0tryXCX6cqhr2U=; b=vw4YJBwjultfDHksB/ZA/3kz7U
	LrT+ZvGkWGdrGquPFEd76tbNRBTxISnzffdIrmRBFyW9KtqdR2Df5xdlZH5XS3arwz1X3CiHRlwjH
	NTNYXi8SeRLfjM5rFOW3QtMxjM8sPEzmXIoXWIoXyCoQCqfW1JUlhq+Lu7Sa1nIrysCNMMuJ2fb80
	0naga3Bl7nhADso3T41hw2mXOlEVzRVJgqWs3F4Sshq9DP8qmBfFQ8m3ObaprZafnj4jvg/FzOKNT
	0zkWYKM22v/nVFPcB4TqyeLDw0KQmfTOIjJ/w1yfsVUkXO6YrmxuK3m1bKqFKg+zM1oP0lcMPoXL9
	9G+U3ZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYs4L-00000001FMU-0ssh;
	Fri, 17 Jan 2025 19:31:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYs35-00000001FBU-19s3;
	Fri, 17 Jan 2025 19:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B7C95C638A;
	Fri, 17 Jan 2025 19:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2647C4CEDD;
	Fri, 17 Jan 2025 19:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737142229;
	bh=foNB1y1uq0V8qV5aIiltQZucaZ3/EtCVUoN7QygiX5Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pNmd6wutzQOWX5v2sX8R5JVWFDDviKiFIWOZVzCJl4a02ldGJdXeA8iR8X82pxojg
	 MKTz4y/0X0XYv9cNzKlrkiBgKAAVa5Jwejk4cdVbKMxEYAgRzpVdqGX8vvdd8E6BEt
	 J6TdmrrpLy3q8/tha8eL1G5mLC7f1+x9YLutNRTWUzKdamRaO26uORXYSgU+0BoxPH
	 TXCNEM1up4EFyjay3DW347JV3DWgObQji/bsA4nBZGCEry0LmWURmAeIJ+fCZJnWPV
	 5xh1/odeVOHlQ7tr7fZ9CgmvQ3Oe1JR03e0+8UWeXQCJ7pzvx/gRvQDK4oteVlpNhA
	 1QQNE7dnSrMHA==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f88b61399dso1834495eaf.1;
        Fri, 17 Jan 2025 11:30:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEioeuMlHwQzKpbVYMx8oA6skgdobBO9e5x5C5aDsp60mFXd1k/UVRF5DaR5mirUOKk+ysBaTWxv7fJX97JV9A@lists.infradead.org, AJvYcCVy51pxTed9Wpr6d7vY6+Ir+gyA24yX9hHuDxrBy9MAIJzqMDv18i8cLLXxAqW8ZyHC/yNlwBFyCV6LLCA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyC0hFoDarQ9MYYwl4n7+8IGdvnGwWAymkdHgOVnPuhtdxrH9IE
	0urRjVKjSc7z3PkkyRoxJXres0kZNjjjKcKlfLPR78V/2oFi7+KGNwye36bDyzDojvJ90cV077c
	nupD2GpJ+zS+Ej3kSSO2b8cePN1Q=
X-Google-Smtp-Source: AGHT+IEOihIY7mUOa4hVP1bqotPmsr69h5OgdfXyZbu/sRbspauTxsDS8YOdvCTlZN7dTpnC3uxq7LK3T+tCxi8e13Q=
X-Received: by 2002:a05:6871:296:b0:29e:2a06:8405 with SMTP id
 586e51a60fabf-2b186ca0224mr7419767fac.19.1737142229222; Fri, 17 Jan 2025
 11:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com> <20250103-wake_irq-v2-1-e3aeff5e9966@nxp.com>
 <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com> <PAXPR04MB8459EE38DBDBCA29FB81B6B788192@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459EE38DBDBCA29FB81B6B788192@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 17 Jan 2025 20:30:18 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com>
X-Gm-Features: AbW1kva3YRwOs-mqOCr7xIZ_pL_VsK5_Sa-oqdUbd008qjcQYrdbDr5ihs4pOnQ
Message-ID: <CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] PM: sleep: wakeirq: Introduce device-managed
 variant of dev_pm_set_wake_irq
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_113031_407116_A1004FD7 
X-CRM114-Status: GOOD (  27.77  )
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

On Wed, Jan 15, 2025 at 2:28=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v2 01/12] PM: sleep: wakeirq: Introduce device-
> > managed variant of dev_pm_set_wake_irq
> >
> > On Fri, Jan 3, 2025 at 9:42=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp=
.com>
> > wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Add device-managed variant of dev_pm_set_wake_irq which
> > automatically
> > > clear the wake irq on device destruction to simplify error handling
> > > and resource management in drivers.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/base/power/wakeirq.c | 26 ++++++++++++++++++++++++++
> > >  include/linux/pm_wakeirq.h   |  6 ++++++
> > >  2 files changed, 32 insertions(+)
> > >
> > > diff --git a/drivers/base/power/wakeirq.c
> > > b/drivers/base/power/wakeirq.c index
> > >
> > 5a5a9e978e85f3fc9d89cb7d43527dc1dd42a9b1..8aa28c08b2891f3af
> > 490175362cc
> > > 1a759069bd50 100644
> > > --- a/drivers/base/power/wakeirq.c
> > > +++ b/drivers/base/power/wakeirq.c
> > > @@ -103,6 +103,32 @@ void dev_pm_clear_wake_irq(struct device
> > *dev)  }
> > > EXPORT_SYMBOL_GPL(dev_pm_clear_wake_irq);
> > >
> > > +static void devm_pm_clear_wake_irq(void *dev) {
> > > +       dev_pm_clear_wake_irq(dev);
> > > +}
> > > +
> > > +/**
> > > + * devm_pm_set_wake_irq - device-managed variant of
> > > +dev_pm_set_wake_irq
> > > + * @dev: Device entry
> > > + * @irq: Device IO interrupt
> > > + *
> > > + *
> > > + * Attach a device IO interrupt as a wake IRQ, same with
> > > +dev_pm_set_wake_irq,
> > > + * but the device will be auto clear wake capability on driver detac=
h.
> > > + */
> > > +int devm_pm_set_wake_irq(struct device *dev, int irq) {
> > > +       int ret;
> > > +
> > > +       ret =3D dev_pm_set_wake_irq(dev, irq);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       return devm_add_action_or_reset(dev,
> > devm_pm_clear_wake_irq,
> > > +dev); } EXPORT_SYMBOL_GPL(devm_pm_set_wake_irq);
> > > +
> > >  /**
> > >   * handle_threaded_wake_irq - Handler for dedicated wake-up
> > interrupts
> > >   * @irq: Device specific dedicated wake-up interrupt diff --git
> > > a/include/linux/pm_wakeirq.h b/include/linux/pm_wakeirq.h index
> > >
> > d9642c6cf85211af603ce39e280a5b4de6617ee5..25b63ed51b765c2c6
> > 919f259668a
> > > 12675330835e 100644
> > > --- a/include/linux/pm_wakeirq.h
> > > +++ b/include/linux/pm_wakeirq.h
> > > @@ -10,6 +10,7 @@ extern int dev_pm_set_wake_irq(struct device
> > *dev,
> > > int irq);  extern int dev_pm_set_dedicated_wake_irq(struct device
> > > *dev, int irq);  extern int
> > > dev_pm_set_dedicated_wake_irq_reverse(struct device *dev, int irq);
> > > extern void dev_pm_clear_wake_irq(struct device *dev);
> > > +extern int devm_pm_set_wake_irq(struct device *dev, int irq);
> > >
> > >  #else  /* !CONFIG_PM */
> > >
> > > @@ -32,5 +33,10 @@ static inline void
> > dev_pm_clear_wake_irq(struct
> > > device *dev)  {  }
> > >
> > > +static inline int devm_pm_set_wake_irq(struct device *dev, int irq) =
{
> > > +       return 0;
> > > +}
> > > +
> > >  #endif /* CONFIG_PM */
> > >  #endif /* _LINUX_PM_WAKEIRQ_H */
> > >
> > > --
> >
> > I can apply this patch for 6.14, but the rest of the series will need t=
o be
> > picked up by the respective driver maintainers.
> >
> > I hope this works for you?
>
> Yes. please just pick up patch 1.

OK, applied.

Thanks!

