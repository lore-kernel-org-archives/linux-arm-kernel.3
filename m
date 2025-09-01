Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993EECA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srcQe2QCCiAwB7DGCqKHSCUVph+K4Lh5idtVMweUwUM=; b=BBECorQlfGutFpQSCSDV4bMiPp
	MCThze5S0Hx5zOvf4m0X+RfVr1GbSydw3tcOs9vD2B/fLI915GAwe2JAKJQYyEjKA8A/R0w+URvQV
	i4/ujjprJX8G03E6XSQRvxKL4Q31shZpCWWUq4W1Jwg8hlCapFIjRyI4F7gRwxjpZMQH1CClUsgb3
	Ecy8hgLioiDJApAkd82yAJ75JzgY7Zy0HGkOw14BdjmT1In+JV78NFlEJ8L+YPdF5/lliSdqlvyiL
	j4VLsGleSMYZHboEe+834yt9/iec4wMf4OPfTxcZYdXwPWY571fsLkLShzvSJJIETpFh9gn+iW5JL
	dn7TmXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1uX-0000000BvL2-2OVH;
	Mon, 01 Sep 2025 10:37:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0nM-0000000BkZY-4C6n
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 09:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=srcQe2QCCiAwB7DGCqKHSCUVph+K4Lh5idtVMweUwUM=; b=GDcQ+l88uCYuxN3BAhG3+2vFmX
	2Hn+6tI5e5bdk+ytajsj6Y9LD49v+utdzh4+/uU5rEahCqi9R0R0AGs0obZb1jiZJ9iv3tNQcuxzG
	A0txSRuy4DZFu187LX0brMdq6/dTADBzYdMws4wlAzGfaVY/t+GDYNfdiHVjlWl9phYm+G5dWsi7O
	+jcXNvaZqufoN3OPgGvRCH8Cj/3kX6A20Sw74VKAUGR7Ri4jzjAFmZ1VFALwuNEq+GOpsMwfT5Q/S
	JBf+oclJ0WasW5zgyxHuc5WHX5mptN9r0tfm64l0szC2nrXVCg6gZK9UZDNFZiBC03M/6+xmASahe
	Q+Xi9JYQ==;
Received: from mail-vs1-f49.google.com ([209.85.217.49])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0nJ-00000003hEs-2LUi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:25:47 +0000
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-529da1b07b5so207869137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 02:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718743; x=1757323543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srcQe2QCCiAwB7DGCqKHSCUVph+K4Lh5idtVMweUwUM=;
        b=kirzfJaaSW9Zo43mmrREIRWCItw3kSioRcqcPvATuXHl8oQ6q5VPV69d8l+lDGINMh
         vSujMKGjQBfjL018PDwAbbB3Q7wwvi4Wk8hq6aYDaxBJyUE/xXaURDlX7zy1kYqT/BTI
         SK/1ugjG5HT4jYkkLuibVFQDym+IclAKmNwE1aeLuWvlBp75ncgQoWTlteB+tMgAVqjX
         dhlrfvxv4DyiGPeH1qp3P9YGftLpo3eqQ43hbnjcAyXO3yGacGsp5aqQIVheQT/j5UeL
         PuvaH0GJKiwxZ+QggQ1Lp/19whg2x2oCJ+E7VQC9X/sE6rzEY2ref26oB69MTZSilNmW
         C5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFOdE67cu0maH3J9p8GLMzELpi2aTV4pb8VqQ1jwySZF7hR1kGPrVoT3p7L+Du3ewFHxwqePJIxonQlnT7rkbA@lists.infradead.org
X-Gm-Message-State: AOJu0YwxZPyF2pfZECyG3JK8ZnCemrSncplTGtAq1DT0/zdp7kirf0BE
	TUwd45T5hTmlSfmhVXN3G0q+lYeWmOw01Wb6icgo3WvehOy+dZTfcYYyXH/hV8Ak
X-Gm-Gg: ASbGnctO/gyKjjKPnDUcYaH+515b28Dqo61JM4DPilrMZ4XZYhUuBoSO5OBuh2JflEU
	aIyRZ2I+efbhTQTFvnn5ghUPLr3g66B2xNrQTUV9xeDllJ3di3zEbjLRjDaGcCalEmsQjCQF+BI
	Mapj0Vha/nhCWJLCTF5z388A5OgRE9xo81RLzURQ0hm+UZ4dqALKU0zGS6k6gIvSEiNg+OxWtBY
	3j1lbIVlrGjXxWUNm0qSus+pb5EcP9ZY7ZBsvinXQIRI/+7S0jHHhPyUzv+KJN5AP9G8HNwEIS6
	eWRv4geLG/u1ZkQsnBvZpFhtgFlLWnLh4k2C2JUUGXBPlPc1p/KV80m+OUUG65rMAe6Eqttt5ib
	MUnnvCJrrkHmoNKsHDvmfqyoxZOVraZpwUhDwi4fYrV65zES4dYT6ZNEiFMCV
X-Google-Smtp-Source: AGHT+IFHuHMsuUkMEsJzdxhHOzQId1YJtUhz+o3H3bE9L9p9UH1PkBMpvCHfjz2POhl+2D946mO5dg==
X-Received: by 2002:a05:6102:441e:b0:4e6:a338:a421 with SMTP id ada2fe7eead31-52b19534c68mr1361099137.6.1756718742499;
        Mon, 01 Sep 2025 02:25:42 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af19156ecsm3020661137.12.2025.09.01.02.25.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:25:42 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-892196f0471so1313855241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 02:25:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXloJP/8m1uOSH46U8t2xR6pDXNbTiKx5ofgUlw6pPF9iuAMqZGqTlVn/w57mvx6j/DhHXZkInuMLWqZszFRrqA@lists.infradead.org
X-Received: by 2002:a05:6102:c51:b0:527:4113:6ad6 with SMTP id
 ada2fe7eead31-52b19a54877mr1662294137.9.1756718741912; Mon, 01 Sep 2025
 02:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com>
 <ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj>
 <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev> <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
In-Reply-To: <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 11:25:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUu0uXBJndcwWoZp8NNyBJox5dZw4aoB8Ex50vBDDtP7g@mail.gmail.com>
X-Gm-Features: Ac12FXz8RcNX144qqXwdTyVaOdBuKNMLkMT1y2uQFu-Wa0Ecb0dTxg5TkCmB8Xs
Message-ID: <CAMuHMdUu0uXBJndcwWoZp8NNyBJox5dZw4aoB8Ex50vBDDtP7g@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_102545_867390_BE4A490E 
X-CRM114-Status: GOOD (  46.19  )
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

On Sun, 31 Aug 2025 at 06:07, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Sat, Aug 30, 2025 at 02:22:45PM GMT, Claudiu Beznea wrote:
> > On 30.08.2025 09:59, Manivannan Sadhasivam wrote:
> > > On Fri, Jul 04, 2025 at 07:14:05PM GMT, Claudiu wrote:
> > >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>
> > >> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> > >> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> > >> only as a root complex, with a single-lane (x1) configuration. The
> > >> controller includes Type 1 configuration registers, as well as IP
> > >> specific registers (called AXI registers) required for various adjustments.
> > >>
> > >> Hardware manual can be downloaded from the address in the "Link" section.
> > >> The following steps should be followed to access the manual:
> > >> 1/ Click the "User Manual" button
> > >> 2/ Click "Confirm"; this will start downloading an archive
> > >> 3/ Open the downloaded archive
> > >> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> > >> 5/ Open the file r01uh1014ej*-rzg3s.pdf
> > >>
> > >> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
> > >> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> > >> +  ret = pm_runtime_resume_and_get(dev);
> > >> +  if (ret)
> > >> +          return ret;
> > >> +
> > >
> > > Do you really need to do resume_and_get()? If not, you should do:
> >
> > It it's needed to enable the clock PM domain the device is part of.
> >
>
> I've replied below.
>
> > >
> > >     pm_runtime_set_active()
> > >     pm_runtime_no_callbacks()
> > >     devm_pm_runtime_enable()

> > >> +static int rzg3s_pcie_suspend_noirq(struct device *dev)
> > >> +{
> > >> +  struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
> > >> +  const struct rzg3s_pcie_soc_data *data = host->data;
> > >> +  struct regmap *sysc = host->sysc;
> > >> +  int ret;
> > >> +
> > >> +  ret = pm_runtime_put_sync(dev);
> > >> +  if (ret)
> > >> +          return ret;
> > >
> > > Since there are no runtime callbacks present, managing runtime PM in the driver
> > > makes no sense.
> >
> > The PCIe device is part of a clock power domain. Dropping
> > pm_runtime_enable()/pm_runtime_put_sync() in this driver will lead to this
> > IP failing to work as its clocks will not be enabled/disabled. If you don't
> > like the pm_runtime_* approach that could be replaced with:
> >
> > devm_clk_get_enabled() in probe and clk_disable()/clk_enable() on
> > suspend/resume. W/o clocks the IP can't work.
>
> Yes, you should explicitly handle clocks in the driver. Runtime PM makes sense
> if you have a power domain attached to the IP, which you also do as I see now.
> So to conclude, you should enable/disable the clocks explicitly for managing
> clocks and use runtime PM APIs for managing the power domain associated with
> clock controller.

Why? For the past decade, we've been trying to get rid of explicit
module clock handling for all devices that are always part of a
clock domain.

The Linux PM Domain abstraction is meant for both power and clock
domains.  This is especially useful when a device is present on multiple
SoCs, on some also part of a power domain,  and the number of module
clocks that needs to be enabled for it to function is not the same on
all SoCs.  In such cases, the PM Domain abstraction takes care of many
of the integration-specific differences.

> But please add a comment above pm_runtime_resume_and_get() to make it clear as
> most of the controller drivers are calling it for no reason.

Note that any child device that uses Runtime PM depends on all
its parents in the hierarchy to call pm_runtime_enable() and
pm_runtime_resume_and_get().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

