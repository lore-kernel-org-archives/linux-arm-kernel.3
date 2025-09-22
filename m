Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED58CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XGdu2beYVX5j16G/50OKngoOcnsJZ8baPn43qnH8Vk=; b=pjSTf1tGDX4LhrnchnetlmloMA
	Nfhk85Tr1rzy+ajaoJw21xnfwP9ae05z0+WoY2oCT13TUQIZtEVcTamO6JO13bwM7rGqNByRU4iak
	Iyk7ao+fOsnDIB+tTyW6KHLAFWAX8CogtPOtTTDmx4aeLIcdOrrKNm1GJEWOhxPOwxY/b/ma/QILn
	cxHyyqtCuvmeBbFEUcQliBzYnlX6uHUrwjslSCsAklGB9wVv7De3ig/ER/8yqK2fI/sq+GLpCsdeC
	A1h82MrA5tVgEKvB3zjiREDRRufMMDDzmkMmX8eD3zffPQ2fUW573wvSSXFMaI5TV6NSph+q1IF1H
	/b1FKKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eLD-0000000A93h-3tWU;
	Mon, 22 Sep 2025 11:04:19 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eLC-0000000A93I-1CiQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 11:04:19 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-746d3b0f7e5so4006650a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758539057; x=1759143857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XGdu2beYVX5j16G/50OKngoOcnsJZ8baPn43qnH8Vk=;
        b=PpjysG4zVknGMuEylYX+y8fvsQuJOFgoPGzi9tn5PEPA2IbfgbRE8ir4GEIgqTb+Yg
         KEwmVWqlS1j3Zd3yrEBufN5pWw2BLBieooAlSY756Q16iEtHJTP0Nlvx+IPAuTRddiXN
         eXYkCbSBSoFvOTpiMfYgL1naYyF1Upe/61EeIkTTvAOMZ7Pcng8ZU+qw3ucnNvVlsIaR
         TzkeM09eVoMvYzMFzZvDoC+Jegq+FXYj1rLgiIDXjowTJI9wP5MhwvO8dANWxNDkWj6Q
         rp59GKwmqFJJlAnKQQChPkNcuMWN3zU6nyN9UsABKfySEXmnArSYWBhkLaXICHz6pWBQ
         Dibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758539057; x=1759143857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XGdu2beYVX5j16G/50OKngoOcnsJZ8baPn43qnH8Vk=;
        b=P5TyJdNsBIn+eMNcI6JM6ToGjCLrC6X3KZ8bF+54ST4Wv0g2bLePdWP/NMOCOU4x+k
         DkMbgIUA+z0aKD/58fU33/dvDfvLNBDChZt0CvxIPDZIpOFkN7iddllQry+8BfTpkKpz
         CMfc/lVkco0X+6j/H654xoCgAngdQ8s1s4ky1HvbD+uS5+VGbRSivwsNSbkHYqUI9CTG
         l5+6o+9ID0Foz0VcmRwNcOLs2mx9n/eL/emlLHVoSV/QRtdunrbSlQeo2LBiZQySDCsS
         THAakQySNMTcT3wezEPJZ13WII7y++4vLyk/8w/2kUNpC6EBIIccnBpAZ4qSY17VDkke
         Vc+g==
X-Forwarded-Encrypted: i=1; AJvYcCWwqqeZIuiPMsw4OMbmc0jq+DOd51pi3rTN8LM2g3UjRGGnF5yUPrveyjgZ3Z7dyqAAlPeFM0gfAphr3Z+5VWUZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyjfhZ+Es7K4TOvlHdxNQ5uJygVSZHQ4VH4/UZLq7ER//laQ983
	yC1PZzAG8pMvNz0PKQrgmn8kU1tY4+c4oE0tlft/8ig5hFzf+o28ddp5CNTiwXYuNlEsd1IF/pf
	QJ4eHQeyNfxwjvvxG82hP379e/Wrqkhn9K92onkQf0A==
X-Gm-Gg: ASbGncvJrUlJNN6NGPqiV6H4UA09QaQfZs+belc7a/mxL1u4wPni30nt3kU/1BZ1YV2
	L56QdZ+c9FOotbDFIrGKZ0haJ1WqQM2XiMNnOHHW8h0WxF7eFMaLZrz0E03C11lhps2Vxng0FGJ
	WXsiZVVoRdo/5U/+A7qyDQpk5/OWv25p2XkiDglZum3WEzamOAY5SDp+CgaPwZ+C4QFtpwLuuoF
	HVytx4i/JrnLw==
X-Google-Smtp-Source: AGHT+IEvS4cemYKzvf8/W3Ni0tXFdK49y2b13V4Ek7MsLn0SEOghPBIISAL2RiOAvFwYHiWJSM5vrjR4tjFOI/lJfqE=
X-Received: by 2002:a05:6808:2106:b0:437:b63f:5b06 with SMTP id
 5614622812f47-43d6c2aeb61mr5322105b6e.34.1758539057077; Mon, 22 Sep 2025
 04:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250919085918.5442-1-cuiyunhui@bytedance.com>
 <20250919085918.5442-2-cuiyunhui@bytedance.com> <20250919-colossal-splendid-bettong-e5a0bd@sudeepholla>
 <CAEEQ3wkRoX5Y5xQu22kVCFxEy8fgcUxKHEm=9Bpg7g-Np8b-SA@mail.gmail.com> <20250922-buffalo-of-hypothetical-downpour-d2a47c@sudeepholla>
In-Reply-To: <20250922-buffalo-of-hypothetical-downpour-d2a47c@sudeepholla>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 22 Sep 2025 19:04:05 +0800
X-Gm-Features: AS18NWCjxTnXNffNhsVhAB7VVz0ET_vSy-py67u7Gzutp1wKTHn_hOJyONTf-KI
Message-ID: <CAEEQ3w=4aKS=p=+q4iC42Va+dMVm017R0Surxff+4R+4RjkgAg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 1/1] arch_topology: move
 parse_acpi_topology() to common code
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, beata.michalska@arm.com, 
	ptsm@linux.microsoft.com, sumitg@nvidia.com, yangyicong@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_040418_334458_E956E771 
X-CRM114-Status: GOOD (  25.45  )
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

Hi Sudeep,

On Mon, Sep 22, 2025 at 5:01=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com>=
 wrote:
>
> On Mon, Sep 22, 2025 at 10:18:57AM +0800, yunhui cui wrote:
> > Hi Sudeep,
> >
> > On Fri, Sep 19, 2025 at 10:05=E2=80=AFPM Sudeep Holla <sudeep.holla@arm=
.com> wrote:
>
> [...]
>
> > >
> > > Just thinking if it makes sense keep acpi_cpu_is_threaded generic wit=
hout
> > > the need for weak definition.
> > >
> > > Additional note: not sure why you haven't moved this under CONFIG_ARM=
64/RISCV as
> > > done with other code.
> > >
> > > bool __init acpi_cpu_is_threaded(int cpu)
> > > {
> > >         int is_threaded =3D acpi_pptt_cpu_is_thread(cpu);
> > >
> > >         /*
> > >          * if the PPTT doesn't have thread information, check for arc=
hitecture
> > >          * specific fallback if available
> > >          */
> > >         if (is_threaded < 0)
> > >                 is_threaded =3D arch_cpu_is_threaded();
> > >
> > >         return !!is_threaded;
> > > }
> > >
> > > Then you can just have the define in
> > >
> > > #define arch_cpu_is_threaded() (read_cpuid_mpidr() & MPIDR_MT_BITMASK=
)
> > >
> > > in arch/arm64/include/asm/topology.h
> > >
> > > and
> > >
> > > +#ifndef arch_cpu_is_threaded
> > > +#define arch_cpu_is_threaded           (0)
> > > +#endif
> > >
> > > in include/linux/arch_topology.h
> > >
> > > Thoughts ?
> >
> > If placed in include/linux/arch_topology.h, there is a possibility
> > that "arch_cpu_is_threaded" will be redefined.
> >
>
> Why is that a problem ? We want arch to override the default definition
> if and when required.

Because include/linux/topology.h first includes linux/arch_topology.h,
and then includes asm/topology.h, a warning will be generated during
compilation:

In file included from ./include/linux/topology.h:37,
                 from ./include/linux/gfp.h:8,
                 from ./include/linux/xarray.h:16,
                 from ./include/linux/list_lru.h:14,
                 from ./include/linux/fs.h:14,
                 from kernel/events/core.c:11:
./arch/arm64/include/asm/topology.h:39: warning:
"arch_cpu_is_threaded" redefined
   39 | #define arch_cpu_is_threaded() (read_cpuid_mpidr() & MPIDR_MT_BITMA=
SK)
      |
In file included from ./include/linux/topology.h:30:
./include/linux/arch_topology.h:94: note: this is the location of the
previous definition
   94 | #define arch_cpu_is_threaded()  (0)

Unless #undef arch_cpu_is_threaded is used in arch/arm64/include/asm/topolo=
gy.h,

So it's better to place
#ifndef arch_cpu_is_threaded
#define arch_cpu_is_threaded (0)
#endif
in include/asm-generic/topology.h.

>
> --
> Regards,
> Sudeep

Thanks,
Yunhui

