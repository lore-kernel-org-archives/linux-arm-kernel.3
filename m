Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B6CE677FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8eATJCki+TxES4vc6y+ssSPQ0d6v6bnz/0z0oHNrr0=; b=U9Pg18DkElw1fuQyUATjUYmqGZ
	7/SchwNGwit8xfInm8kYmQoPD2rolrnXZCCCT+z+G0/+vQ9KuKqCy4UgEThLsNagm1+jn+XZGTtwS
	PSpqdslJ1no/wxTWyakIShLHhjUrYFOCqSuK0BaRvpZYI2R+1yO5A9YKgy8lqbKvlBKgBqtwBNuAe
	HQvQ2Lop6J0AqaPzxkWSoZmUDZAQhiu+eRgqmnY58AYgwskekWdgkgBvQCZ0iBe2wyhe1VM6+czB7
	7d0LVGETKEHnbkiTczABvDnSkY+GuP9xNe3qfQeAbJ9q7P65utTbOMMnom9Rgf0NfHyCSS8WP/bEv
	EzB3bcOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Cps-00000009fTk-0bFX;
	Sat, 02 Nov 2024 12:02:32 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Cms-00000009f1y-0eoC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:59:45 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e28ebd78792so326385276.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730548764; x=1731153564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8eATJCki+TxES4vc6y+ssSPQ0d6v6bnz/0z0oHNrr0=;
        b=HOfILApegHKcLOZYQNfBUM78+npMCmnWCPiNGKjurV0/vTjcNhmsr/G5onzl/j9ynj
         XH8Y3+N1EOAMEQs017lqS2CWb7qYZLzAdxdCf/5weKX8bAXhE+Mj/O91sW2eDS0tf9xI
         r/yc+foWOvZGjcc9TdHWGZG0P/WdvFoPeULdzC/nPhIFkFJRhNJYHAUcWxjly3cyOWUn
         YHdRB7PMdmQpwJ0nEhgAeSeGjrOf+wc4GR/KlMKpnF2sEz8PBFG1IpqaZ+0nlEVhti2N
         VVUMc6ku37Od8fzy+nFp9O/MtEKykg8QjbMDn0VLgJFgUkhSAPJkEAZWPdtXSSHEvZFm
         D0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548764; x=1731153564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8eATJCki+TxES4vc6y+ssSPQ0d6v6bnz/0z0oHNrr0=;
        b=Aly8LhQttSsCH3jlrr6dlI1KRULKFob1SIKVcxs7I5c1xCcFidiovfobnC9e4dNp5P
         qI207IaNz/Fp3KpETwcObirddZxRylZ1S5535I79YJGqfEkNWthfKx02iWZ6kcuiocWC
         1om6iW26XZ3dDdBwln6pRUmwB9oANCWNZvxzNiCF57xbwPy31oeTSRnbB40YwRhJFi6l
         cBly+DHdh10eBmvXg7tnQAbQSttZXUfqaIRYf97JpNwWh2F58+IDqhfoSVJ2LqLbqcFW
         sq8ybvMGrL7PQ4GW5rTdOvB1CroaoZSJoB36tm2eJ+kFYSglc9WHulXiaCE8ece4TIql
         yo0A==
X-Forwarded-Encrypted: i=1; AJvYcCWa3+W7YtqBccCnXttF/0LJ5vk9uw3OwwouEFMyvbTHvqWlelZTiOKHRbQjnplFPeLqTm7FGMNP9JuxE0xUQObq@lists.infradead.org
X-Gm-Message-State: AOJu0YxbM9np6BL5yQhyBKhbn0z9sbMiVrQax0RtTVWEsGGwxzbz7FPh
	Ez40i1gQzVbRSK0eI/rSsNvdUGqW5Fn10k33OgKGlahEVrNUMnT5y8VRQP8ZnyrXUafokb/3TnH
	+It+OB3hMk2CVwcNv7TngQ7ETdV0=
X-Google-Smtp-Source: AGHT+IFMbxyKVoPx41xbCrD0GPiI2GpxGV8kau6mx1CGcW2fC32QAQ0PlbBb0QPHWgT/KLrfKzplVdzjum4zHSCNoGI=
X-Received: by 2002:a05:690c:4484:b0:6d3:c7d:5eaa with SMTP id
 00721157ae682-6e9d8b22e4amr116494867b3.8.1730548764251; Sat, 02 Nov 2024
 04:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241029202349.69442-1-l.rubusch@gmail.com> <20241029202349.69442-12-l.rubusch@gmail.com>
 <20241101193528.GA4067749-robh@kernel.org>
In-Reply-To: <20241101193528.GA4067749-robh@kernel.org>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sat, 2 Nov 2024 12:58:47 +0100
Message-ID: <CAFXKEHa5A039NfyGFnXH4pm1FN9YwDuTLtoa9Xn8xzZYwTCvKg@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] net: stmmac: add support for dwmac 3.72a
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, a.fatoum@pengutronix.de, conor+dt@kernel.org, 
	dinguyen@kernel.org, marex@denx.de, s.trumtrar@pengutronix.de, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_045926_221191_677C7BA1 
X-CRM114-Status: GOOD (  32.48  )
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

On Fri, Nov 1, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Oct 29, 2024 at 08:23:37PM +0000, Lothar Rubusch wrote:
> > The dwmac 3.72a is an ip version that can be found on Intel/Altera Arri=
a10
> > SoCs. Going by the hardware features "snps,multicast-filter-bins" and
> > "snps,perfect-filter-entries" shall be supported. Thus add a
> > compatibility flag, and extend coverage of the driver for the 3.72a.
> >
> > Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c   | 1 +
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> > index 598eff926..b9218c07e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
> > @@ -56,6 +56,7 @@ static const struct of_device_id dwmac_generic_match[=
] =3D {
> >       { .compatible =3D "snps,dwmac-3.610"},
> >       { .compatible =3D "snps,dwmac-3.70a"},
> >       { .compatible =3D "snps,dwmac-3.710"},
> > +     { .compatible =3D "snps,dwmac-3.72a"},
> >       { .compatible =3D "snps,dwmac-4.00"},
> >       { .compatible =3D "snps,dwmac-4.10a"},
> >       { .compatible =3D "snps,dwmac"},
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/dr=
ivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 54797edc9..e7e2d6c20 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -522,6 +522,7 @@ stmmac_probe_config_dt(struct platform_device *pdev=
, u8 *mac)
> >       if (of_device_is_compatible(np, "st,spear600-gmac") ||
> >               of_device_is_compatible(np, "snps,dwmac-3.50a") ||
> >               of_device_is_compatible(np, "snps,dwmac-3.70a") ||
> > +             of_device_is_compatible(np, "snps,dwmac-3.72a") ||
>
> All these of_device_is_compatible() checks should really go away and all
> the settings just come from match table data. Then everything is const
> and we're not matching multiple times at run-time. That would be a bit
> of refactoring though...

I can see your point, but I have some doubts on that. As I asked
before, my current scope is actually on upstreaming my .dts/.dtsi
files. This would be nice, since I'm doing it in parallel in u-boot
and they're going to dts/upstream so we're waiting on the kernel
community here.

I'm unclear what additionally to fixing my .dts files is needed. Shall
I fix all? / some? / none? of the errors your dtbs check bot gives?
First, most of the errors come from not covered bindings. Since TXT
files for socfpga never were converted to YAML. Should I do this? I
guess this would increase coverage of dt-bindings check and reduce the
errors tremendously. But I'd see it as a different patch set if so. Is
this needed to upstream my .dts files?
Second, the maintainer of platform socfpga seems to be currently on a
sabbatical. At least I hope he's fine and not sick or burned out. But
also I would like to get some feedback on the .dts files. Please help
me if you can give me some.
Third, when I update things like the mentioned dwmac things and try to
update the driver compatible to best of my knowledge, I understand
that it would be better to refactor a redundantly checked
compatibility to just one check in the driver.
But, I only have one hardware: an Arria10 SOM which is affected here.
And, is it really anyway needed to refactor networking drivers for
upstreamining my .dts/.dtsi files at the end of the day?

Please don't missunderstand me. I can absolutely see your point here
and appreciate all type of feedback. Anyway IMHO these are all
different topics i.e. different sets of patches, or smells a bit like
scope creep. I separated the 2 patches for a different set, as Jakub
wrote.

