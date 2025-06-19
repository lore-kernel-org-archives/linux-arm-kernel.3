Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9829CC77B7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXr4DkxQyQe6cO2hVmMV/1vKr4WFSQJXwlWoVF3SQUw=; b=S6shE52aoKVRfjuMjRmRczhMGr
	GgLtepjBPeHOnMKLHvKDtgiFupjjf8SSEsR0Nj+0550Ks4woDHzE5Mk1dg8WDA1XgKjUR1+N/IOWq
	0wISOVJ7lDsBMHKBzNpN5DyGz71eBPErDn2hpTzeADmnNpFoSx+gLik6eHM1xthdt0ODlOtxSc4TX
	ZItc2KcR3B667HcqQrFhENB/5+d35pLcvCkLIG+HuNGW8zH0OKZY3srbIiVD9Pt8K9/HhGkwDVzoP
	/Ff3qjk+LZs1WCcmrrcfagEUnbehbvgSfX1w7nMG/5un1NGucMVB97InknQW8J9lIPnx2l1XscqqM
	S9n/Odew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSK7R-0000000DtQH-0tJp;
	Thu, 19 Jun 2025 18:36:13 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGrr-0000000DMf9-2jOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 15:07:56 +0000
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7cadd46ea9aso141254685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 08:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345671; x=1750950471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXr4DkxQyQe6cO2hVmMV/1vKr4WFSQJXwlWoVF3SQUw=;
        b=WglcrdJ2tvgiiAOVpqnG6hR+21IvBzqMLhjysojN4f9l5WYvGLFyM9RcwH97TdorEc
         fXWgIhFnxS8GOTJdE3WhsiU0VVnx2qok9pZ8hW3W60NbmGCSFf3OERsoqBtqjKa9yrcY
         x5bh219FXxBnzaRdDr8W4Xne77rq19hOL0D60tcyDHuvzNe+e2FFznwvN3fNIC9C648y
         zLTNnHsvTE2c/3TfVweZeFS8npK612jOmQ69lsuQI5DzZThUYbODZufK22g+mFJAOTOT
         OwHjlf/pseqR1W43gFHzg/nmvxaU0h4HGW3Sw385++KvZgDECVzI2vgrttr1mv9NqZl7
         LPgw==
X-Forwarded-Encrypted: i=1; AJvYcCXrFjpev6jB6xIgr8osjcMGlXCQOm+YaSaorKS4DYFrdvIjNHKhpLm9t2gypYzJsN+ad8dhHrXJwYvtyrBNbvKD@lists.infradead.org
X-Gm-Message-State: AOJu0YzbllJuq5SyZD/R1j+DI7OnzpIUQFD2A8HRTzmJoY0w7SkwLpNT
	rHD3HUpl3IYRG8ni7pqfG0s/Bhv8vZlDNe9Nv7EC0rjlJsf9IJUefkjcJMyWdm4S
X-Gm-Gg: ASbGncsgtOD/tAT19Cl3vw9iC4K38VnXG5QG0AqD8UU41eZ47tKOutEknhha8tHa4nQ
	xV/FSY2AmYHEW/5hgW88DvBoLL/WL37L8F3zUm8yhnpVM25dfMp9jaYTDhVZU2y/BbilqVk3pdH
	DV0XTXE1QY3kkFj8crBOXgIrlQvXttmqR9cftWJMqYJmT6Zwqdq0RC5aplPjhtE8owAHyzPHTeN
	V6z9yDecH74I/o/UzthNwFJ9aJ38RxmIA5axRoIJ0NpIUIgGmGG9pJnqRHtgli6tis8aPqHvCkG
	XfJ/WWqrLQH7Lv83l081vEXtt7V8lqn2UeoU8GQzd2ZTQEPXymlAjEHxXACa5wvY3neenIazsGE
	o8FZYdSMVhgjPjNSqo986DRVNl/sC
X-Google-Smtp-Source: AGHT+IFx6Z9NFdlQWI8zBAkotYgKux1LX7UfwhuSbDPGUohf3dsywtj6BowgpPHbijPnN13sMoUWdQ==
X-Received: by 2002:a05:620a:2909:b0:7c5:9a09:cb73 with SMTP id af79cd13be357-7d3c6c1b541mr3192118885a.23.1750345670807;
        Thu, 19 Jun 2025 08:07:50 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f8de70b8sm7690785a.25.2025.06.19.08.07.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:07:50 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d3dd14a7edso151551585a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 08:07:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRY0K1H75BoUklgNn5WCqckzu3YO5vpZ+Q9y8ejqKs9ovxQRBpwCmKbU9eD+Sw9OoarQlcBoGuX4l+3tT2LhVT@lists.infradead.org
X-Received: by 2002:a05:620a:319b:b0:7d3:8566:e9ad with SMTP id
 af79cd13be357-7d3c6cda22amr2925901685a.34.1750345669885; Thu, 19 Jun 2025
 08:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
 <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org> <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
 <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com> <kjotbgwqlvl4uv4bcynqsiynf4dsoplw3szaqlcfd7rm7k633p@64c552v3llz2>
In-Reply-To: <kjotbgwqlvl4uv4bcynqsiynf4dsoplw3szaqlcfd7rm7k633p@64c552v3llz2>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 17:07:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt0AoHnCitc6GNUuT_THRvy17c5uq5geD0ubQ12FONZw@mail.gmail.com>
X-Gm-Features: Ac12FXyqjFu03K5SyvIX5tcmxTFfiSwi7mDocCZBFa2GT0By0yuMp0VwoZlcHKg
Message-ID: <CAMuHMdXt0AoHnCitc6GNUuT_THRvy17c5uq5geD0ubQ12FONZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_080755_688016_101CFFCF 
X-CRM114-Status: GOOD (  46.90  )
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

On Thu, 12 Jun 2025 at 16:30, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Jun 12, 2025 at 02:34:32PM +0200, Geert Uytterhoeven wrote:
> > On Thu, 12 Jun 2025 at 14:20, Jon Hunter <jonathanh@nvidia.com> wrote:
> > > On 23/05/2025 12:54, Krzysztof Kozlowski wrote:
> > > > On 23/05/2025 13:39, Geert Uytterhoeven wrote:
> > > >> On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >>>
> > > >>> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> > > >>> ensure the Ethernet driver is available early in the boot process. This
> > > >>> is necessary for platforms mounting the root filesystem via NFS, as the
> > > >>> driver must be available before the root filesystem is accessed.
> > > >>>
> > > >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >>> ---
> > > >>> With this change, the Renesas RZ/V2H EVK board can boot from NFS
> > > >>> which has the DWMAC IP.
> > > >>
> > > >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >> i.e. will queue in renesas-devel for v6.17.
> > > >
> > > > With my Nacked, please.
> > >
> > > I was surprised to see this change in -next. We also use NFS for testing
> > > and we use the dwmac drivers. To date we are explictly building these
> > > drivers into the initramfs but I noticed that that is now failing
> > > because this driver is no longer a module by default. This is easy for
> >
> > Oops, sorry for that...
> >
> > > us to fix.
> >
> > Good ;-)
> >
> > > I do agree that if we start to build every networking driver into the
> > > kernel it is going to bloat. Yes I do see the kernel image growing
> > > regardless of this, but nonetheless it seems better to just build as a
> > > module IMO.
> >
> > Not _every_ networking driver, of course.  AFAIK, making network
> > drivers built-in for systems where development is done using nfsroot
> > has always been acceptable for the arm64 defconfig before.  For things
> > not critical for booting, modular is indeed the preferred way.
>
> Last time I tried to merge something like this I was told that we
> shouldn't bloat the kernel for everyone just for our own convenience. I
> tend to agree with this now. It's trivial to make local adjustments for
> things like this. In fact, that's what I do all the time. I will use
> defconfig as a base line and if I want the convenience of having network
> drivers included because I don't want to update the initramfs every time
> I update the kernel, I'll just change the driver to built-in in my local
> .config.
>
> I think of the defconfig as more of a reference for what a typical
> development system would need. So it gives you reasonable build coverage
> and such for a wide variety of boards.
>
> If we start building too many things into the kernel, then at some point
> it's going to become uselessly large for everyone. That's essentially
> trading everyone's convenience for your own.

As discussed with Arnd on #armlinux, I will drop this patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

