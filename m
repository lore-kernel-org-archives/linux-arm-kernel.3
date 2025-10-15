Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06DACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 10:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ic4sNpykiWrxAS8li87QoHA1eP3zqS9hndcMR8zn7Qo=; b=cKfF2aVoMLbXK4akgStyxSxGKn
	93eBWMuLK9LykfaWe3st35I2E+42A3Mf9eLsWN6hVLvnG63+wVxTSOlkkjJoPPgP3W79HIzZm8uJi
	BwdN7aaT8nvcblGJjKxGp+kRl0K8W+IRxHt0DkoXml96obeaTKldEff216ZHToPbna6GAs/deFaFn
	rWmzH8NyZw3xPJimZj7uwD2mfaFc0/fNvVUjTrlCeH3Gk3FvFyJOfe3JJEwxxPimM6pM0Deg2urAf
	tvqQA2Uy1chgo41xlk6HrBNIpsRJJ1Rf7QicAgP5SxTnEbawpl/59GExyo4e0bhqfP1fo5kBFOMOR
	eyBsu0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yPd-00000001Duq-1VBW;
	Wed, 15 Oct 2025 10:07:17 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yPa-00000001DuV-45Ar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 10:07:16 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54bbe260539so2484829e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 03:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760522833; x=1761127633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ic4sNpykiWrxAS8li87QoHA1eP3zqS9hndcMR8zn7Qo=;
        b=NawIGFD2Ey2aGTMuPN+e7EycKpbgM73dV8CYjljWvwKZbXjOCgmYxQnjMckCmBAFs+
         S4yuOiRNzECLBhRaJG/fwRCHC8ARCvz3ldorW8likJtTg3PwRNwhUzGSP/pB07zAyZtC
         gWol1FtNzfOUrHkcq7y4lg+PbVu62A7lM6GHapSR7uYv0P3C+09ACdGd6VO7DW5o3Yym
         y80AXb0H6ZYfkEWfrmtsJonE/nDI/5h7hahe0EX/cJnu55JEEI4saVcXIfCVWRvoD9OZ
         JO/4j8YeRBg+kehlH/AAUceiI2pWBOVM2f4rMYjqxtwf12uygoLVQ7Eu1HnqqdlqFaL7
         j9dw==
X-Forwarded-Encrypted: i=1; AJvYcCVLEKV+5wss11sK1IZ9XDoqNgMiW0GZIm28JMj5JVhtQ1AiUJs/lyNctcERTNOuCc+heQZdvXtTk7gV3+4ZfNC4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3n9gIKhk1KjBHStck1drpDLnQUDGG57iMMCGrezVYyfTcMGCB
	+YxJuSixUBi/HFNwN+Htou9blRT83rI/jjG/vp9GcyZd12cJBz4sZY9EwAT3dtQr
X-Gm-Gg: ASbGncuJyP2QMjbrFMHQ7fS1lFYE+It/2B63MUZku6Wdf7eopO+vwjP+iPPnnQKzdS1
	/QoS8J/xl26vwRiZW2Od/1Q60/A2+edhYyq9bqfkuNcBkSSGEAyO9rJLF6felyqXPSIjcWIutYD
	2cYxx12tFmMVyL8doS1QYh9kBKEClTffChDBycMffSSd5C7uaurW2H+9sJz3Y28mnPokaqgdt8s
	vXGNO0aM3+9R3ya5jb8Nd6bf027ryNn/Xb3y6wE8b8dc/tgAeyHCrnfpkeOeZTfFraD6oi6ibYv
	zBWUmVCBaPdJNynRdUMhanQO88HujHEzbe/qM1BsM25GZ0KjM7esu5PW+TvqjPyAQ45qUuK7CPP
	mqPqBPTP04sJyAiSVoN2xm8kL03SrIagK8/5mdKK7/uaK5lR5VVAgPUcxz+Poc64DGqa1hAxQ02
	FCB1Lzauo6ZjDa+A==
X-Google-Smtp-Source: AGHT+IFvEV3yj0rJnE+Q+t+9LH0vqwi/5Y0Nm+gKBh7R1URc5xpKr0qpQIoFRvwfqciU+zPtysKzow==
X-Received: by 2002:a05:6122:16a9:b0:54a:a048:45a4 with SMTP id 71dfb90a1353d-554b8c34b65mr9309024e0c.16.1760522833322;
        Wed, 15 Oct 2025 03:07:13 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554f37d2ea8sm3405167e0c.4.2025.10.15.03.07.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 03:07:12 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5d6266f1a33so1056815137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 03:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURDPQXPc0SKv3MmjLF11KbMB6sX2BWqZjAcBnirrcqJvLMWsp6o6UY1jhTkgyb7R9ysgYAPILf1YDgluTjwDtP@lists.infradead.org
X-Received: by 2002:a05:6102:c09:b0:5d3:ff03:8f6a with SMTP id
 ada2fe7eead31-5d5e23d364fmr9301330137.30.1760522831841; Wed, 15 Oct 2025
 03:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
 <877bzr97no.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
 <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com> <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
 <CAMuHMdXXiDM4AMyXxaxGv-JYNpZ0CD75v4tAa5C3RmFy4m0GtQ@mail.gmail.com> <ax626myd63skmkpb6zleyncggclkivpox2mdvnhcccsplh6gcp@scfguuubd2yp>
In-Reply-To: <ax626myd63skmkpb6zleyncggclkivpox2mdvnhcccsplh6gcp@scfguuubd2yp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 12:07:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqOR2kPy7V+N5oCFrKZA0R7JHC_+QsjFc5c43F1KFFiw@mail.gmail.com>
X-Gm-Features: AS18NWC8UOOTh1fwC6Bmp4pngtBq2S14OSatVl25ZQYgJFRgGduMQqsAybLqIhw
Message-ID: <CAMuHMdVqOR2kPy7V+N5oCFrKZA0R7JHC_+QsjFc5c43F1KFFiw@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_030715_024877_53BA98DE 
X-CRM114-Status: GOOD (  41.82  )
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
> >
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

And of course there is: I still had a few 64-bit .configs that were
derived from older 32-bit .configs, and thus still had
CONFIG_FRAME_WARN=3D1024 :-(
Changing them to match the recommended default fixed the issue:

    config FRAME_WARN
            int "Warn for stack frames larger than"
            ...
            default 1024 if !64BIT
            default 2048 if 64BIT

Sorry for the noise...

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

