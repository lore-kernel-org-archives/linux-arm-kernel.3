Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFBECCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHdcX9woxvWg0GW813srJ8cI5KiLIIt+I/jJXM5Z1Vs=; b=Lvgt20lMmYyxKiaLK/PrBF1nCR
	fCbHGYb84fRWmvW4zq6l7o6X4nODsrU/smyYvmmMad7ry1PuJHgJ9hL+cEElDfegMOJ6oSkMcIgWI
	hKtLgE/fpI6nQRNaoEBZJuokt84IO9DRq7YdDet0/bmin1IrnUGuKnvWq7NjPtH2lZRxrIaSxHShD
	JcbSAoT1pKuXVLHVl7Gfgx4jQ0sHkqnxAdA526bEvmxe73rSCEeCo1Vw99T50PPxoItDUIP6e18+O
	wNZVvuhdPFfzzRubToSja+7ty3iBpDdeAxFLwQjvMPNgwgR4mN8Q1FSkRMQCDPfUsiL8l23hRWDFW
	HX86OqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92xu-000000020h7-42HX;
	Wed, 15 Oct 2025 14:58:58 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92xt-000000020gC-0vlO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:58:58 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5838680e242so1968590137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540335; x=1761145135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHdcX9woxvWg0GW813srJ8cI5KiLIIt+I/jJXM5Z1Vs=;
        b=hlxT2sQ/60DfAIMiO448JumyYmDKNvkUzoE9ACWd/bgMIU0W2tcwlku+KdporYmjKC
         qeptdcwhwwHAtmgyt5bzb9cTHHhqbsOnSjrF9ZXSOJeF8l5iY2KsbO1aBVhNsZrcWnMf
         fSPFtFxMtu/lTeFMzta/F9mHWq/LtVn8R5IvD5ZVlYsxn3vzWFVNNoHzjzj4AxsG99MQ
         +T8ft3bY4Z5I2iHPZvUw5Ce0RGnGNR8NlWbXik8GQBlZsgAu2NWIxmIVh8xPpxKcYDi1
         seni3GpspXsdMH3LPYSwjkWwm3EyY5pmv6CUfKJQzIETLug9ADhzpB4BsrUced5PPHeE
         7pvw==
X-Forwarded-Encrypted: i=1; AJvYcCUO0I6ALYb0JEYbwmUN81LIGjvJDB36bstH0e75FdgGpaJ7MpVQ5QlwXTP3e8GM4v/y3gyalVEJGpMY9eiFbyHV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3G6xGgcB2jztYrnf1MoY9rR/jD9kACgPaUoxLBj+tPEN9wxAc
	GUdPGz8yM/E0KV5soE6Ztf/ppdTKjYOCrHKUz7cu990wtg/kuBpqtYl9dvv0Z2ka
X-Gm-Gg: ASbGnct32r8hDRpF21PHcNmu4BWls3N8IdQDnJ1xq3Bbr1uucRE29B2oxynluq8n+ud
	KhmZ2Pn0FGnoxWBf3jovrY4oUpqxEKxYoTznhJhoy11D6QmPmerequW7uDayTzUZCxA7iBfx4+z
	jQPBDtc3nLD/AyYPt3l6p7CuxnE6xYH88ebso/cQzIOxkipDxiSlHUUqE2VseRxAvt2aRncawIm
	spqoi4JMUcVyZZFoaHy2+a+kMeup6y7pBQRRKh8+sbGvkomxxFPsi9KCskNumbORg4sGigSzZeE
	nDmWSkYW4zf815Kbc0+PsVdyTx3EGM1oYeA/Zg0MwPlKrel5n4JFno4vsiDYuTdFUXg4bkRFl3l
	rLu7XH7CopbQIlMCeS0zk+LUhtX5mkfnkPotPYaIajan0VIcJJXuM5/o7m1YyLi8X4c32g/hSbR
	ivylo=
X-Google-Smtp-Source: AGHT+IGcOi0/ALJGbt1ot0RWIyvpb3jKME9RKjGO4u8N9I3jXWIGnQFYFOlFuk4gWlla1jKZ5fTy2A==
X-Received: by 2002:a05:6102:26d3:b0:5d7:bcc7:cbaa with SMTP id ada2fe7eead31-5d7bcc7d58emr1334473137.2.1760540335121;
        Wed, 15 Oct 2025 07:58:55 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf78d14csm4519530241.16.2025.10.15.07.58.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 07:58:54 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d6266f1a33so1181973137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:58:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQKOx/7jpY4KIDnyMB+nT52yDFiIuv+t4WYWb30cWp1r1GMTqR0ZRvILjnIfHNXSmamH5N017gqRi5kVtXdqtn@lists.infradead.org
X-Received: by 2002:a05:6102:952:b0:5d5:ff84:a9f3 with SMTP id
 ada2fe7eead31-5d5ff84aaa6mr7439748137.28.1760540334134; Wed, 15 Oct 2025
 07:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
 <877bzr97no.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
 <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com> <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
 <CAMuHMdXXiDM4AMyXxaxGv-JYNpZ0CD75v4tAa5C3RmFy4m0GtQ@mail.gmail.com>
 <ax626myd63skmkpb6zleyncggclkivpox2mdvnhcccsplh6gcp@scfguuubd2yp>
 <CAMuHMdVqOR2kPy7V+N5oCFrKZA0R7JHC_+QsjFc5c43F1KFFiw@mail.gmail.com> <b3b13e21-ae54-4499-a569-0442bb9cfc8f@app.fastmail.com>
In-Reply-To: <b3b13e21-ae54-4499-a569-0442bb9cfc8f@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 16:58:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVD+YocwQJduG9rALL26Uh8ue8WLFXVSV1y1ZfrMG=JbA@mail.gmail.com>
X-Gm-Features: AS18NWCDnwYUNSr7v-N6i614F_NQiauQxEbXjLBqKpDDHBsnlnxmHrWRAToFd4A
Message-ID: <CAMuHMdVD+YocwQJduG9rALL26Uh8ue8WLFXVSV1y1ZfrMG=JbA@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_075857_268224_4893E835 
X-CRM114-Status: GOOD (  30.94  )
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

Hi Arnd,

On Wed, 15 Oct 2025 at 13:03, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Oct 15, 2025, at 12:07, Geert Uytterhoeven wrote:
> > On Tue, 14 Oct 2025 at 18:53, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> >> It is odd that this only shows up in certain cases though.  Is there a
> >> particular config option that is needed to cause the size to grow beyond
> >> 1024?
> >
> > And of course there is: I still had a few 64-bit .configs that were
> > derived from older 32-bit .configs, and thus still had
> > CONFIG_FRAME_WARN=1024 :-(
> > Changing them to match the recommended default fixed the issue:
> >
> >     config FRAME_WARN
> >             int "Warn for stack frames larger than"
> >             ...
> >             default 1024 if !64BIT
> >             default 2048 if 64BIT
> >
> > Sorry for the noise...
>
> I have a series that reduces the default warning limit for 64-bit,
> but adds some slack for certain options such as KASAN that
> are known to cause larger stacks throughout.
>
> MIPS does have larger stack usage than most other architectures
> here, and I do account for that with an architecture specific
> base value as well, but in order to catch actual bugs in newly
> written code, this has to be as small as possible.
>
> What is the stack usage you observe in your configuration?

1056 bytes on arm64, 1040 on mips64, i.e. just above the "32-bit"
default of 1024, but far from the "64-bit" default of 2048.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

