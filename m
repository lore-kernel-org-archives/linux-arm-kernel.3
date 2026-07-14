Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D09C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgRx/9A4mxiDsRVEDvyTiz/IgVDal/aTcWb8tkjr7jw=; b=bQlkAVEKerKdEJc3nnR0VPSysY
	D8IYKNK7OxUpki4KjdfcIlGi0jJL3a3IuCpsNoEjDNdPHMbbmL9KO0QWTqWFZ8dECw6o40RgOkEl3
	ut/fAVepzAwsMoarqs+WUMX9eAUpsjiawm8hxoe6BktVWF+/J1gikX98dWyxP4gQvRDbhH42QE0ep
	l6TO6ILP2ohw077my5Mj8I/WiKqkx8yeZxIK1FWcoOz5g+Qg4+hKbjZKhi0DgJT0efJiKDLMyozG6
	vEad0FH8bqJLehcJn7XZPx+1kJPlBpyuXLi3habF1KUalpMARl85QjpF33n5oUSmhR4lVhurLrxYl
	ZwZi5LFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjY5G-0000000BFPX-2DQT;
	Tue, 14 Jul 2026 08:01:42 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjY5D-0000000BFP7-3npM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:01:41 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a382104a85so479160eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016099; x=1784620899;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BgRx/9A4mxiDsRVEDvyTiz/IgVDal/aTcWb8tkjr7jw=;
        b=nShSEIcqoG7cCmd5o4OZduaHRuzFvBlUbyEs/ezZRI8ZTFalud300Y8/MgCo6IZifT
         /cEPGNWB0Wmi/47qwV2SYi1eQIjO3ld6jyejFTfynZuWzit8hML9CSjj5QnJLgipYOon
         gIWJv1zt34OPdn7IV/x0YYTMj5PH6Y6KXCi0Y/MOUrIiB0B0dQ9vKhcgZf6F52Ex4ZbA
         DBEm4XvadK9yLzLwgDObe0c4Xw2fTPPcRhIGDE3A3/70ZZ12WuVWd+1nzaT9KiUWVlk/
         IGXmXKG/jxay5EW2kS502zEEKTBUCFpJL+yn0g3VWtH7B0smXO3z5le0KJwe1a7qiiRd
         UaAg==
X-Forwarded-Encrypted: i=1; AFNElJ9ESmJ+Mvg6PIIaOpV3ZEy3gSDhUCjPu4HEBtVp2GSNdc3+8NS5JKNkFYBuDBzIdrYlFjdxeHWiySHpgN0RK8GT@lists.infradead.org
X-Gm-Message-State: AOJu0YxgYGSyU+Ro3vfHLn9WgiUgarks8q4jBor+1LjuLxXGughEx0QS
	iqOpYo1aBpOUV8Bxr+/ogKk39yuAADiUguJf21yoGBFkgUJsicAf5Gd1snMFVjQxLLc=
X-Gm-Gg: AfdE7ck3gvVBS3i+/5NbhEc6dBeibus/ScQosdgyNjyr4pAqJUiI5tU3APSEzrLluSU
	Dnj8IT2Q7tmH6WfhKl6GihJXw9Ndl7T+wOjE9/ibXLPkyPbnDkD7dNL2Y3RQfO+GHT9KjfYO057
	8Br22G4CzjPO9iLI5cBxjM/O5KW8EHxOpVqUWmqgZ85zEnqg/ubdbJSG9FNLy6rkoFFQPETs8ue
	Cz7rjU3/JnBQx5qhoccxYcfvuQvj5rJLvUjdMDwmn9SlQKay3Hf+HvGEyM7vfNUMK5/k3Q2B+v2
	SGi6rybbjD0b6dywmYNhK2c1S9LA50Y6HD2Mu5Qj55xeBwo2ZCUmGHwlU2Y/05bBVLKt66ZjD1R
	l+tyzoCwHfOcgIAXWVwRBTNcaguifKnZaECA0jgTqnYycvkKRfxlR3FUstffVnsngQ9wJ2xS6cH
	X4hmDrHPDPGHDyO7CYfpRhzVCXvOeBPY3XcRhSDzCbk0/TUzKp+A==
X-Received: by 2002:a05:6820:4c08:b0:6a1:5756:10d3 with SMTP id 006d021491bc7-6a39a59ce7dmr7383729eaf.22.1784016098655;
        Tue, 14 Jul 2026 01:01:38 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451ec3a6c19sm9849753fac.1.2026.07.14.01.01.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:01:38 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb545db3afso420367a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:01:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95/Ow30ry2gH9vzIMMLDPwXY1eD6EZ6uKl9GXHezegvPly9bnrxJwOWzz3qHG34VZnZja8Q2kDP4QHitN0PSdy@lists.infradead.org
X-Received: by 2002:a05:6122:83f2:b0:5bd:ecad:8f9c with SMTP id
 71dfb90a1353d-5bfbf172175mr7212570e0c.6.1784015653328; Tue, 14 Jul 2026
 00:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260713175400.GA1258926@bhelgaas> <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
In-Reply-To: <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 09:54:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
X-Gm-Features: AUfX_mzs8lWdOW-5Jg3BgK8EeDUWxqE-PpZFEV2XQkTM46SmNqGtsnsDEZCmeKI
Message-ID: <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_010139_953056_9B9370C4 
X-CRM114-Status: GOOD (  29.52  )
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

Hi Marek,

On Tue, 14 Jul 2026 at 01:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
> > On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
> >> On 7/10/26 10:30 AM, Marc Zyngier wrote:
> >>> On Thu, 09 Jul 2026 21:10:03 +0100,
> >>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> >>>>
> >>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
> >>>> copy the one GITS_TRANSLATER register offset macro directly into
> >>>> the driver.  This repairs the ability to build the driver on
> >>>> non-ARM non-GIC targets the way it was possible until now, which
> >>>> retains good build test coverage.
> >> ...
> >
> >> So in the end, it is either this patch or limit the build to
> >> arm/arm64 . At least this patch still allows building this driver
> >> with more compilers on the various build bots, so I would opt for
> >> this patch here.
> >
> > I like the build coverage, but duplicating the #define doesn't really
> > seem good to me.  It makes readability worse because cscope/tags now
> > sees two definitions without an obvious reason.
>
> I can rename the macro, or ... sigh ... I can reduce the driver to build

That would obfuscate the code?

> only on ARM/ARM64. Which one do you prefer ?

Just add the dependency for compile-testing, just like
PCIE_IPROC_PLATFORM does.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

