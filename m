Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BDDC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 07:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auWrotBqpmh2YC3HXUb7/AKzJgzE/IW+KPyxWnxE20k=; b=HyB/4qAYKn9ZLtziQ+2YQYwkal
	+P8FSgLps9IMPbx06aDIv8++xYYjWxLS45jRZvHPiA1a3e4Mw8aZYWsw3zzn63M2nkJPK8awSVsSc
	rRK1JzHEcQCRU6ji64EDN3lUlbsJMQB+s5nwD2covoJCHNgDbsW6hg0b3OEa+I5FCmG+GeGO916is
	bMg82jxDca4lqG8xbIXLTafOBNb4W2Hz0C9O/BMv9EIPZHr90gQmHdlb24ufo+nT5U8AQ01ho5yDy
	f2HOMqnz+M0NKJ3dsWTCRaVtlgMoSVYR9QHunjwZdaBvnZH4gUdCMmLgDFZiQRL7odDNdGvU5XXvm
	UFg6WT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugf8W-0000000GAqS-1nDy;
	Tue, 29 Jul 2025 07:52:36 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugf62-0000000GAb8-0pK3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 07:50:03 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5315ebfda19so1737511e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 00:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753775401; x=1754380201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auWrotBqpmh2YC3HXUb7/AKzJgzE/IW+KPyxWnxE20k=;
        b=dYYxxcA0u/t6eLiETExVzYL5iqYc1I1/jN8BonafVAd+PcrAQvmtX3aF2BYFUIzbMF
         SY+CVIKq/smt44DEFjGjl/oKPIJtg5+/bpQbzoanoGf7nxUQU82ZzIYN5aZufy3UESMo
         RQePBSn1gMdV7lAKH7NWXCScWWdC8iCLfTeUfvefD4Q686+BLSuJIbG9frx43+MK1kU0
         Aow9w8ZMRISYVoFySZRxRNPL6T8+tkVnA0qnuzz3WY3KvCZ+Ow1/9vgRTNw31rnZGioI
         4P0dDQpzjsYWe4pqYyOKTJBQeeqJxnVCUTomz1+SKg6GNWEZTtpbTiwPapaO/OSPKXmo
         ybfA==
X-Forwarded-Encrypted: i=1; AJvYcCVMzSLN6vdp9Hj14o7MuyHiLNvy7NkT+qFtUdpjUctmz3jfnqxI3GZzFxcvN2QqZu48TGqUmBu7TadZEb3k5K7c@lists.infradead.org
X-Gm-Message-State: AOJu0YykeYuwVE7+ICMzDuhDJlbp/VowSMm5k1e7CYF/X6BPnB69TMUM
	zgpFly049jIf40WhdftlcGgZzUPO/S2WEwi3nzv5tsAH/GxCI0nbhtB1M1OAjf3V
X-Gm-Gg: ASbGncu1+dtX4KwzHyhkkRCjkUG9YInV6gNbGDNC5V6y4ZL3ZpGu5I57di2EQZn7iw+
	4J2Eu0h3xhXUBBl0AMgkB71UKGRz6OCVs+WotCLmT1d5lKKSE5lTfVaxUUGi4WquOCNKgiLf7++
	C2wGbDeyZAHRPQocYH6zBr016zAg+wqoKPXfewjVdOhAURA7MhEjI+E/oFG4qrVcRlOCa8DzcQw
	y3mqbtOLmBeYa8yxxk6sCYCmH1hZt/1+oPjInk9v3BcPQaQVde1sdZaMPxDEiPj1rIH0zdFTtkO
	PkJD7Q5r92GLclzzKQWL/E0FDYe40bnLtfnupiFo5FN2KQCG+rZiGp5XtQI2JDWjLf0OQL93pP7
	dHic/GlxhZXrWNJVjsNVHtutEdAoHYL5z10Ohk6SQ2NhwSWJCyqB/PenB3/LFKRyofZ8sWlc=
X-Google-Smtp-Source: AGHT+IGW4NhALPoay9GywUCCD9muw6vzGOm8wyc44tzSJM+99/QfUYZ/lHKmQTgZIU893M5MpxQWHw==
X-Received: by 2002:a05:6122:8290:b0:52c:4eb0:118d with SMTP id 71dfb90a1353d-538db528164mr5969202e0c.4.1753775400684;
        Tue, 29 Jul 2025 00:50:00 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538e262124bsm1934247e0c.15.2025.07.29.00.50.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 00:50:00 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e7ef5d6bffso1555430137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 00:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUe3t4imlOAOqUZ7vbjEefA1o8aUdwvX/BmLnxO4jdMCeYh7W4T0Uf1O2O6LrKciRELxa2laR49fcY6JzAweMfM@lists.infradead.org
X-Received: by 2002:a05:6102:6882:b0:4e9:8f71:bd6e with SMTP id
 ada2fe7eead31-4fa3f8f1c7bmr6791091137.0.1753775399835; Tue, 29 Jul 2025
 00:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
 <877bzr97no.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
 <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com>
In-Reply-To: <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jul 2025 09:49:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
X-Gm-Features: Ac12FXwNNuJbKZM2y3wYaKU35CsrfLknVfHa5wELLdiPZM7JuO4NifhGt_R13zM
Message-ID: <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut@mailbox.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_005002_718102_3A0F8170 
X-CRM114-Status: GOOD (  30.06  )
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

On Tue, 29 Jul 2025 at 09:27, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Jul 29, 2025, at 09:15, Geert Uytterhoeven wrote:
> > On Tue, 29 Jul 2025 at 02:12, Kuninori Morimoto
> > <kuninori.morimoto.gx@renesas.com> wrote:
> >> > >         > grep CONFIG_FRAME_WARN .config
> >> > >         CONFIG_FRAME_WARN=3D2040
> >> > >
> >> > >         > git diff
> >> > >         diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/=
boot/compressed/Makefile
> >> > >         index d61369b1eabe..c5173bd82380 100644
> >> > >         --- a/arch/arm/boot/compressed/Makefile
> >> > >         +++ b/arch/arm/boot/compressed/Makefile
> >> > >         @@ -80,7 +80,7 @@ libfdt_objs :=3D fdt_rw.o fdt_ro.o fdt_w=
ip.o fdt.o
> >> > >
> >> > >          ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
> >> > >          CFLAGS_REMOVE_atags_to_fdt.o +=3D -Wframe-larger-than=3D$=
{CONFIG_FRAME_WARN}
> >> > > -        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D1280
> >> > > +        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D2040
> >> > >          OBJS   +=3D $(libfdt_objs) atags_to_fdt.o
> >> > >          endif
> >> > >          ifeq ($(CONFIG_USE_OF),y)
> >> (snip)
> >> > Yes it is.  And it is hard to fix, according to the maple_tree maint=
ainer:
> >>
> >> Hmm...
> >> Actually I have tried to same solution (=3D remove or fix the big node=
), but
> >> noticed there are many such code. My suggested was very simple solutio=
n
> >> I guess, but I'm not sure detail of ARM limitation, and/or it can solv=
e all
> >> cases, etc...
> >>
> >> But other CPU (like ARM64) doesn't have this issue, so we can follow s=
ame
> >> way (=3D allow large frame) I guess.
> >
> > I do see it in one my arm64 builds, it depends on your kernel config:
> >
> >     lib/maple_tree.c: In function =E2=80=98mas_wr_spanning_store=E2=80=
=99:
> >     lib/maple_tree.c:3812:1: warning: the frame size of 1040 bytes is
> > larger than 1024 bytes [-Wframe-larger-than=3D] 3812 | }
> >
> > I guess Arnd has seen it in his randconfig builds, too...
> >
> >> Does ARM has some reason which can't use large frame ? If not, do you =
think
> >> we can allow to use it on ARM ?
> >
> > (stacked) Large frames may cause kernel stack overflow.
>
> The version below works around the warning for arm, arm64 and x86
> on both gcc and clang.

Thanks, that indeed works for my arm64 config that triggered it before.

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

