Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB30ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISXkdA1sBlvjBjct66X8C/MnWOqrrcU89gbRs07tEwM=; b=qABiQfjUw0hxC8rpoKrmbGQsUo
	xE8YlcRD2qwdzQOM4zAzKXXcafWfgjW6e3no+kILhlydBTJiv2m7VeM4BzFjL0Tp4WcCzennuL9N4
	GB+Lr1NvIx8vlmPkMLsvKcBwN655xtQ6Yhhp5pb+6scQEsvhsqbq+bXikEINxu/HNV2RglGNQgM4+
	mzZZkxbX5IoKmbl3OKXAdGgsqtAba4RXzAKoeUcGzWzhB0ACFFBsG1pyvtREpD5YSBr5t8O3wVMn8
	/cUZu37rBsn1KnyYZin+Enf7VB6fm+2vYdd+ngDRY5UmrpRadxHt98Gm9Dsr08ikMQT3O2EH5jq6X
	h6vZkkPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xmI-000000018qn-2RR2;
	Wed, 15 Oct 2025 09:26:38 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xmF-000000018q3-2wY5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:26:36 +0000
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-930e4af2535so719355241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 02:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760520394; x=1761125194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISXkdA1sBlvjBjct66X8C/MnWOqrrcU89gbRs07tEwM=;
        b=th44BMFuBVTLd/5aATUd6vKJ5UQbe+g7BzacM5CelSggMwpjxFjT44KiZRpC84LL+7
         PgEOVl/MVC894juZyLQgCqq6WOajjHlcYIBp6U+8jUSwNmhe5Znin961w4K4CDBTpu3a
         gYcI0IqNa2aVKtObUf96bzKsgNr3xclT0aJXyuvKfPJ0sHeoccYo337EToPq99sKEYqo
         PfJhBBTEGGsRBC2WmmSFvG0IIULyx915VxaF4Cv5LSwEaqbzDHTGTp6KM6XW6q1Gy8/0
         yqGvsYFRyNLM4RG3N+xB4Fi7cn4b7gt98yIqd8Re9YBaaMjrnhzvzTJOyb2N14CPlmsz
         eQkw==
X-Forwarded-Encrypted: i=1; AJvYcCU2+SXuAKeGHtHnobgVXV6KXYcA6w9OIEz5IWSUszGcFzUgQkSPyrEG4G6YeIJdlw6swX7fZCEdE3jmo//rXtik@lists.infradead.org
X-Gm-Message-State: AOJu0YyrwhP3FWhumWkcDQqeVs007n1Yrnzebx9/M0MaQuf/sUIapkS+
	0MdfuPVN14zTnU/jao+3I4M9jfjbLQRedZXyfPLpPoiVavOuylVs+CnL9gxIayyt
X-Gm-Gg: ASbGncsHRH7CIPb6kcBQi1J58N9blpdJ7OV2n4/drYiV9nkdTtDl+sfWuatghhBYCdG
	YKiIhQzkgpCUCKdOJEPjQDEhF7YfH3WcWNNReVAI/sL+XHGKBXbshf8Bf3PLQ2vzB/qo9MEr0SX
	PkOnIrQh259iFGvgK6lzcugNhVou9Kx1TmiJSwbSbMT97J1RCTXfhzAFweWIgODqB5zbW2l/Loj
	aCXIs0k0PjVqSjB82FscL2fxWHuTxsL942UH8lUW5Mg2VmeSx/hzkeWTEK2IYi89+Ttwanr1zxp
	SKfqa5dHBwxumIhz9mz6FcdbSpyEGhJFycw5zhIbNYwZfXCDBWsi4CO3Il8PnF9/6eodXVuQNF1
	4MTTv9EoaS9WztTzv2u1nzI/FDNmbiTRSD0w7vExnfnJP36qlWg6MwfaHJKmqDvEfoZTRO/dfZF
	eVqbE=
X-Google-Smtp-Source: AGHT+IHnDm84qXKJQYds/jAxuw0A8lrsjiDhL1M8AxH82IijlW3jQL3nt8zeMagCeNyAcrt0PQy42A==
X-Received: by 2002:a05:6102:3e16:b0:525:9f17:9e63 with SMTP id ada2fe7eead31-5d5e23aa6d1mr9871459137.29.1760520394052;
        Wed, 15 Oct 2025 02:26:34 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc8f17fdsm5244304137.14.2025.10.15.02.26.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 02:26:33 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-930e4af2535so719352241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 02:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXG+/ouUrmXjDKPVC4UirXLVPNCZf6RzulwRZiTn787grWgn4USxtbjPWdn0sTJJgvZYFE3nPKuRvvyq8+1x3nt@lists.infradead.org
X-Received: by 2002:a05:6102:c50:b0:523:712d:44a1 with SMTP id
 ada2fe7eead31-5d5e23644b3mr9770082137.19.1760520392826; Wed, 15 Oct 2025
 02:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
 <877bzr97no.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
 <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com> <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
 <CAMuHMdXXiDM4AMyXxaxGv-JYNpZ0CD75v4tAa5C3RmFy4m0GtQ@mail.gmail.com> <ax626myd63skmkpb6zleyncggclkivpox2mdvnhcccsplh6gcp@scfguuubd2yp>
In-Reply-To: <ax626myd63skmkpb6zleyncggclkivpox2mdvnhcccsplh6gcp@scfguuubd2yp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 11:26:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRaF2JMJs6Gmh6ODFGX5mWDea-p=8-LtZfeO1Sm2m57w@mail.gmail.com>
X-Gm-Features: AS18NWDhy9pY3tNZz0tka3bGT7PfY6tIruyReIFSZkvm4ycg4EP4rxBK8nlCJ6k
Message-ID: <CAMuHMdWRaF2JMJs6Gmh6ODFGX5mWDea-p=8-LtZfeO1Sm2m57w@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_022635_752500_83B96147 
X-CRM114-Status: GOOD (  43.28  )
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

Hi Liam,

On Tue, 14 Oct 2025 at 18:53, Liam R. Howlett <Liam.Howlett@oracle.com> wro=
te:
> * Geert Uytterhoeven <geert@linux-m68k.org> [251014 10:47]:
> > On Tue, 29 Jul 2025 at 09:49, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> > > On Tue, 29 Jul 2025 at 09:27, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Tue, Jul 29, 2025, at 09:15, Geert Uytterhoeven wrote:
> > > > > On Tue, 29 Jul 2025 at 02:12, Kuninori Morimoto
> > > > > <kuninori.morimoto.gx@renesas.com> wrote:
> > > > >> > >         > grep CONFIG_FRAME_WARN .config
> > > > >> > >         CONFIG_FRAME_WARN=3D2040
> > > > >> > >
> > > > >> > >         > git diff
> > > > >> > >         diff --git a/arch/arm/boot/compressed/Makefile b/arc=
h/arm/boot/compressed/Makefile
> > > > >> > >         index d61369b1eabe..c5173bd82380 100644
> > > > >> > >         --- a/arch/arm/boot/compressed/Makefile
> > > > >> > >         +++ b/arch/arm/boot/compressed/Makefile
> > > > >> > >         @@ -80,7 +80,7 @@ libfdt_objs :=3D fdt_rw.o fdt_ro.o=
 fdt_wip.o fdt.o
> > > > >> > >
> > > > >> > >          ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
> > > > >> > >          CFLAGS_REMOVE_atags_to_fdt.o +=3D -Wframe-larger-th=
an=3D${CONFIG_FRAME_WARN}
> > > > >> > > -        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D12=
80
> > > > >> > > +        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D20=
40
> > > > >> > >          OBJS   +=3D $(libfdt_objs) atags_to_fdt.o
> > > > >> > >          endif
> > > > >> > >          ifeq ($(CONFIG_USE_OF),y)
> > > > >> (snip)
> > > > >> > Yes it is.  And it is hard to fix, according to the maple_tree=
 maintainer:
> > > > >>
> > > > >> Hmm...
> > > > >> Actually I have tried to same solution (=3D remove or fix the bi=
g node), but
> > > > >> noticed there are many such code. My suggested was very simple s=
olution
> > > > >> I guess, but I'm not sure detail of ARM limitation, and/or it ca=
n solve all
> > > > >> cases, etc...
> > > > >>
> > > > >> But other CPU (like ARM64) doesn't have this issue, so we can fo=
llow same
> > > > >> way (=3D allow large frame) I guess.
> > > > >
> > > > > I do see it in one my arm64 builds, it depends on your kernel con=
fig:
> > > > >
> > > > >     lib/maple_tree.c: In function =E2=80=98mas_wr_spanning_store=
=E2=80=99:
> > > > >     lib/maple_tree.c:3812:1: warning: the frame size of 1040 byte=
s is
> > > > > larger than 1024 bytes [-Wframe-larger-than=3D] 3812 | }
> > > > >
> > > > > I guess Arnd has seen it in his randconfig builds, too...
> > > > >
> > > > >> Does ARM has some reason which can't use large frame ? If not, d=
o you think
> > > > >> we can allow to use it on ARM ?
> > > > >
> > > > > (stacked) Large frames may cause kernel stack overflow.
> > > >
> > > > The version below works around the warning for arm, arm64 and x86
> > > > on both gcc and clang.
> > >
> > > Thanks, that indeed works for my arm64 config that triggered it befor=
e.
> >
> > Unfortunately it no longer helps for my rbxt4927 build...
>
> I've been working on fixing this for a while and am approaching a point
> where I'll share my solution.
>
> The change is non-trivial and is required for expanding node type
> support.  But with the amount of change this introduces, I do not want
> to backport the patch set, if possible.
>
> Considering how close we are here (16 bytes), it may be better to find
> another solution to avoid the particular troubled builds.
>
> It is odd that this only shows up in certain cases though.  Is there a
> particular config option that is needed to cause the size to grow beyond
> 1024?

I don't know.  I bisected the issue in my rbxt4927 (MIPS) build to commit
6bf377b06c08049d ("maple_tree: Add single node allocation support to
maple state") in v6.18-rc1.

Reverting the s/inline/__always_inline/ in that commit does not fix
the issue, but

    --- a/lib/maple_tree.c
    +++ b/lib/maple_tree.c
    @@ -159,7 +159,7 @@ struct maple_subtree_state {
            struct maple_big_node *bn;
     };

    -#ifdef CONFIG_KASAN_STACK
    +#if 1 //def CONFIG_KASAN_STACK
     /* Prevent mas_wr_bnode() from exceeding the stack frame limit */
     #define noinline_for_kasan noinline_for_stack
     #else

does.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

