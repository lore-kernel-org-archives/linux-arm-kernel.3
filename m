Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E152CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLSh+dplZEwqkEY2vG9Ve5oAn8yIPZsqSTneX9R1ncI=; b=fXVyA9YqYSImUhq5bJeMYxJvio
	oI8GNooCdVltHDtNp22tKXrKUInUiaNHNxEn2JK+7jLdid/bgLGAb2mBytjZCdffRFnYu23HZ+5fJ
	KbvjcLeH46C//2btVbG4beM9rDhiiDqmqAabVThWIQdZeGdxykZws55zfOZyNwNQbzaeJC1r1R+rx
	9+Xaj6vBfMeWsgxVKUmbeyK7x8gZvHTx4ljke34mjGeDIe/kNo1RcyGKq2VnhtDowXkrWG+ja8CZL
	Z08h53NCc7IpED5XkWN7G8QcM+Yk+h5flzyOVJ5LrHYafJSQgLiLozoIXVPM4AVzAL2hNA//jxPGk
	M7hbs0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8VQ-0000000DTyy-196W;
	Mon, 01 Sep 2025 17:39:48 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5QX-0000000Cp5k-0Vvz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:22:34 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-523975479a6so2859899137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 07:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756736552; x=1757341352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLSh+dplZEwqkEY2vG9Ve5oAn8yIPZsqSTneX9R1ncI=;
        b=nkhEWDC+ONcG0w73JfTwiD5lVKtTBwNTMTU3tXztlFVo0+uWA3kESQHjaGzJ7zLG4x
         pNPxYXaYLokuS0jzaqmOfHmOVtIyzT09N4DVkSdckNTLDqtXEP5iHJKOH9MGRW98P0Fd
         9hqIyNFgXbkgBV+qgE69nP2GKv4rxrnUyPd1c8zEN0S6Kt32c3TPKjFm4D/0Rl/4+eDU
         iwMUApZueloPuumzgShyfF9u0AuSqb7rm6SM3bvI/1e2RO2RYJsIET4mNm+R6UmQSzgm
         9JfkcrVGUABIHTriaMOg3oDCjWQNbljhOAoaLCQJ93OlqhNtHDFdo5/YeoRH5310yRTR
         UYWg==
X-Forwarded-Encrypted: i=1; AJvYcCUSUVE/lQxp4PrOBvqq0ucXpT1r+dCKnmCX5dTI46su0v4OWEGfXTy5SgXuFIJZ+v97oHPxgkqKOw7miBHCkG7H@lists.infradead.org
X-Gm-Message-State: AOJu0YzoYSP6iqoHwYS1IVJMuu2u2qEZtpShLFwPy9uv60a3Sd90UJV9
	YqCmhasWZF/I8KIuxTXYmMEiM0/OARAquIlAlXnRLztBM7UX7RMQ2GQFk00UVoSbaqY=
X-Gm-Gg: ASbGnctZGUhpiJuWi2exXc5x4JCgnCbwdG3jGwve+ML/ozi2QKyNyRbQrLvUhwXF5PQ
	JGddcUc7I83/oZCLKyhQk7Xznp5KaNS0HEm9YO5Dnk8FrhfcG5Udd5ywBZEdg8rlrXjiIcEkV5n
	DxdIXfMV1UCAt8MRWjDCYjmeUeGA0jEVhVnADvIsJgWgTrziQkm2tCiWlanJBd88Qj4GRYyERkt
	SexuL4uw0+IwRJrL7JFfPid7FY0i5SkhtwNHCIgLTsLiEdjXTjtkhv2PxVTHWx3gxnmGT/3GLrz
	7RaCO+8iJpYiN84Lr93DPpJCafO+3EF2ZPXAzCfV6y1i3fcGX37bkr9UyCqC5VZQbIQmF1VT/su
	aZDTmlo9mC9BpX2XKIYEWdIMAHTT9CPxMlpGur0rBgH2JdzUJFiWg9DFmRilhzZL/oE97yleL7s
	g=
X-Google-Smtp-Source: AGHT+IEepDHaP1zPJ18Uzo12ydd38aW3BHEKxM16KZiwu4S/LiMgaCblXJQfb/VR6q0BWgUN3DtBBg==
X-Received: by 2002:a05:6102:6d0:b0:527:4938:9e32 with SMTP id ada2fe7eead31-52b1a375c96mr2294474137.13.1756736551536;
        Mon, 01 Sep 2025 07:22:31 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aec3ae8ccsm3291173137.0.2025.09.01.07.22.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 07:22:30 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-53b174ca9bdso3184413e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 07:22:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJ5Ztv+RCz+lP9kmaFEt7wNK5Pw+c8SkSY+qSq+CK8ZkqfUFsNCQl+ikE46qY4CoURwN2r/+8MwqbN15gG8tf2@lists.infradead.org
X-Received: by 2002:a05:6102:6a8c:b0:519:f3b6:a1ae with SMTP id
 ada2fe7eead31-52b1bb104c4mr2181488137.22.1756736549969; Mon, 01 Sep 2025
 07:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com>
 <ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj>
 <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev> <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
 <CAMuHMdUu0uXBJndcwWoZp8NNyBJox5dZw4aoB8Ex50vBDDtP7g@mail.gmail.com> <6f2hpdkonomgrfzqoupcex2rpqtlhql4lmsqm7hqk25qakp7ax@bfrzflghmnev>
In-Reply-To: <6f2hpdkonomgrfzqoupcex2rpqtlhql4lmsqm7hqk25qakp7ax@bfrzflghmnev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 16:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEqKc+qtRXiPzgjhWaer5KLroZ+hCSVLCQ497h3BtOAw@mail.gmail.com>
X-Gm-Features: Ac12FXyQcXb7KMSqJ3_EYSyMFOnb1q5L0gNjUWq7UpBRH6SSlGff4BAwA-gDtnc
Message-ID: <CAMuHMdUEqKc+qtRXiPzgjhWaer5KLroZ+hCSVLCQ497h3BtOAw@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_072233_163608_B045CE92 
X-CRM114-Status: GOOD (  61.43  )
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

Hi Mani,

On Mon, 1 Sept 2025 at 16:04, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Mon, Sep 01, 2025 at 11:25:30AM GMT, Geert Uytterhoeven wrote:
> > On Sun, 31 Aug 2025 at 06:07, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > On Sat, Aug 30, 2025 at 02:22:45PM GMT, Claudiu Beznea wrote:
> > > > On 30.08.2025 09:59, Manivannan Sadhasivam wrote:
> > > > > On Fri, Jul 04, 2025 at 07:14:05PM GMT, Claudiu wrote:
> > > > >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > >>
> > > > >> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> > > > >> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> > > > >> only as a root complex, with a single-lane (x1) configuration. The
> > > > >> controller includes Type 1 configuration registers, as well as IP
> > > > >> specific registers (called AXI registers) required for various adjustments.
> > > > >>
> > > > >> Hardware manual can be downloaded from the address in the "Link" section.
> > > > >> The following steps should be followed to access the manual:
> > > > >> 1/ Click the "User Manual" button
> > > > >> 2/ Click "Confirm"; this will start downloading an archive
> > > > >> 3/ Open the downloaded archive
> > > > >> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> > > > >> 5/ Open the file r01uh1014ej*-rzg3s.pdf
> > > > >>
> > > > >> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
> > > > >> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > > > >> +  ret = pm_runtime_resume_and_get(dev);
> > > > >> +  if (ret)
> > > > >> +          return ret;
> > > > >> +
> > > > >
> > > > > Do you really need to do resume_and_get()? If not, you should do:
> > > >
> > > > It it's needed to enable the clock PM domain the device is part of.
> > > >
> > >
> > > I've replied below.
> > >
> > > > >
> > > > >     pm_runtime_set_active()
> > > > >     pm_runtime_no_callbacks()
> > > > >     devm_pm_runtime_enable()
> >
> > > > >> +static int rzg3s_pcie_suspend_noirq(struct device *dev)
> > > > >> +{
> > > > >> +  struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
> > > > >> +  const struct rzg3s_pcie_soc_data *data = host->data;
> > > > >> +  struct regmap *sysc = host->sysc;
> > > > >> +  int ret;
> > > > >> +
> > > > >> +  ret = pm_runtime_put_sync(dev);
> > > > >> +  if (ret)
> > > > >> +          return ret;
> > > > >
> > > > > Since there are no runtime callbacks present, managing runtime PM in the driver
> > > > > makes no sense.
> > > >
> > > > The PCIe device is part of a clock power domain. Dropping
> > > > pm_runtime_enable()/pm_runtime_put_sync() in this driver will lead to this
> > > > IP failing to work as its clocks will not be enabled/disabled. If you don't
> > > > like the pm_runtime_* approach that could be replaced with:
> > > >
> > > > devm_clk_get_enabled() in probe and clk_disable()/clk_enable() on
> > > > suspend/resume. W/o clocks the IP can't work.
> > >
> > > Yes, you should explicitly handle clocks in the driver. Runtime PM makes sense
> > > if you have a power domain attached to the IP, which you also do as I see now.
> > > So to conclude, you should enable/disable the clocks explicitly for managing
> > > clocks and use runtime PM APIs for managing the power domain associated with
> > > clock controller.
> >
> > Why? For the past decade, we've been trying to get rid of explicit
> > module clock handling for all devices that are always part of a
> > clock domain.
> >
> > The Linux PM Domain abstraction is meant for both power and clock
> > domains.  This is especially useful when a device is present on multiple
> > SoCs, on some also part of a power domain,  and the number of module
> > clocks that needs to be enabled for it to function is not the same on
> > all SoCs.  In such cases, the PM Domain abstraction takes care of many
> > of the integration-specific differences.
>
> Hmm, my understanding was that we need to explicitly handle clocks from the
> consumer drivers. But that maybe because, the client drivers I've dealt with
> requires configuring the clocks (like setting the rate, re-parenting etc...) on
> their own. But if there is no such requirement, then I guess it is OK to rely on
> the PM core and clock controller drivers.

When you need to know the actual clock rate, or change it, you
indeed have to handle the clock explicitly.  But it still may be enabled
automatically through the clock domain.

> > > But please add a comment above pm_runtime_resume_and_get() to make it clear as
> > > most of the controller drivers are calling it for no reason.
> >
> > Note that any child device that uses Runtime PM depends on all
> > its parents in the hierarchy to call pm_runtime_enable() and
> > pm_runtime_resume_and_get().
>
> Two things to note from your statement:
>
> 1. 'child device that uses runtime PM' - Not all child drivers are doing
> runtime PM on their own. So there is no need to do pm_runtime_resume_and_get()
> unless they depend on the parent for resource enablement as below.

It indeed depends on the child device, and on the bus.  For e.g. an
Ethernet controller connected to a simple SoC expansion bus, the bus must
be powered and clock, which is what "simple-pm-bus" takes care of
("simple-bus" does not).

> 2. 'child devices depending on parents in the hierarchy' - Again, not all
> child drivers require their parent to enable the resources. In those cases, they
> can just call pm_runtime_set_active() and pm_runtime_enable() in their probe.
> There is absolutely no need to do pm_runtime_resume_and_get() AFAIK (correct me
> if I'm wrong).

pm_runtime_set_active() may be sufficient, but I am not 100% sure.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

