Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D84C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+o56MWG5bvMNeHl4uS3KRu5x+fjiHvknej5VuOHxztc=; b=AftvVsTWmqgiC4rz0aYeMZYAjH
	fPEsRiZpN40ROleXqxvfUNDOhBj8QaZED6No6HJPhkM7AjaTkl2Xs/zzXGi/vunutxj+eiJaztI0s
	3130GcV7eqkArp3cpFGjLhSYOPMi/dZr2F1vGIB050KF2/tp7zVYH78oX88NUnvPfeznKzQ+TPUAm
	hOpk/qTtu7JIaZ24Rd4gYaR00YjHzKhO2Mk0VBYtwNvfUOSZkYtBpI9X36NJoA6nA+dGuqjvbPMNp
	tOVxc/IQ2AG3UQc7KcE8tE+rSdeEgLqREaw0NfuCIyXRklMsiqZ9Z3miZQWGgHe+MKwje93PR7/Xu
	wRCDyBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugecl-0000000G6vr-1FLo;
	Tue, 29 Jul 2025 07:19:47 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugeYS-0000000G6gF-3Ziz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 07:15:22 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e7fb730078so1741332137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 00:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753773319; x=1754378119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+o56MWG5bvMNeHl4uS3KRu5x+fjiHvknej5VuOHxztc=;
        b=YPnWUWzUkV1g7pV9gTH+O/oZ/+G5AG9TpW2mlz0pI8MgNkqf1n7BYHLFE3vfH/u2O9
         +CnuPJHauo7jim8tiUmyhlFO3J7Ltt93RbzZC8MoFKItLMYHzfiQCnOgYKyzg+i4Dy0b
         gLls57x1kn6f9K54peGzf3ejTfjEz2Kb/W6OiFqwEoIQd9bWUcU0wnRR5g3jFZHSJGKV
         cyvpmjtG4UNUThVCLvnljREFeE71dLVjJGY/o5NxMEOKpcqJrbfayUh5NV8Gk52GWfQO
         0LMQHKYgxyxTB6/HRLqs1wvL6ulo3dvfnrMx5IZWtf++eSaPq4WiRQSj4MKjfvCi6bko
         aHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfzl5Xn45GN25XIyXV/Tf0R10euSFvBDTpkDz9cm9cQzxeMtqtVMsC4BXhp+vyTICCbcSiDWhLuKxVDnAOKbyr@lists.infradead.org
X-Gm-Message-State: AOJu0YwBRiVNTlGo/a+U+IK5PrwKlv4VTMZHYjC0InT9bLyoNGs9Q+IA
	oEnPYAnX2nr2V2jAipY9YtZ8Zc3do/yGNPtQGAo21KEAkmq1rKVC9rIAkK91gdpw
X-Gm-Gg: ASbGncuA1O+aoswg2P3er1OOsFHOWVHcyDeOlLXlbm15RaR8Cl72HCGg1+onW9EW6gt
	nKCOLucXgZAP0s/Cxzx0lmHPKLcJ9yiW6/EdiiH5GxGokGfAyfqNLtMq2eIeL51e4ZLxqOO3NDa
	hyMx+G/20u/tRLNUJrBRL0FJZd24HgBduhmn9/1Eym2mBSpkBISzZZ98LyyUZWd603nd44J7uXB
	fIELmJ+XO+DVQqN+Ipke3yBsURYvgaU7CUJLBjn+c0IPyCcWps9euO1YlXyXeA2QN8+UI9nCPtL
	eWu0k54uBKM3BxskHZ0pbVlA5BrdFBmoEZqD6Y128pnReFO1ibCpqve64b4YfOkoPR91eCw4F7J
	+M7oTwnDaVaQy+bmIxeETOaing3RCV6+f83+U2F4r8vOwfxzqx6Xo1WUbZsb1
X-Google-Smtp-Source: AGHT+IENu+v+rQAfc+h0bN627krJnh8k4iL8jiP+tAt7Rx3h5LlIUvq4hfJSCsRt8dIkceCubnqlZA==
X-Received: by 2002:a05:6102:1483:b0:4f9:69aa:613 with SMTP id ada2fe7eead31-4fa3ffc10d2mr5812095137.27.1753773319175;
        Tue, 29 Jul 2025 00:15:19 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa46e2fbf7sm1463077137.17.2025.07.29.00.15.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 00:15:18 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4fae1a7d56dso183540137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 00:15:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpHjOsGK7w3b4HG9NGmGVOerdNmW7eDfbc17q7Rj6ZamZ+O2WD45Akg/K2pUY2mCxi4QIi7BELi9Esv4sDMIuy@lists.infradead.org
X-Received: by 2002:a05:6102:fa9:b0:4e5:9149:7cb3 with SMTP id
 ada2fe7eead31-4fa3ff441a2mr6465060137.13.1753773318152; Tue, 29 Jul 2025
 00:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com> <877bzr97no.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bzr97no.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jul 2025 09:15:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
X-Gm-Features: Ac12FXyRJdXXtKC7E9pjfKsCvvaw9H633B1FpyXtJ-nBxJhK23O3tKAmsofpTzU
Message-ID: <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: rmk+kernel@armlinux.org.uk, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut@mailbox.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_001521_172361_7A04B5AC 
X-CRM114-Status: GOOD (  24.23  )
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

Hi Morimoto-san,

CC Arnd

On Tue, 29 Jul 2025 at 02:12, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > >         > grep CONFIG_FRAME_WARN .config
> > >         CONFIG_FRAME_WARN=3D2040
> > >
> > >         > git diff
> > >         diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boo=
t/compressed/Makefile
> > >         index d61369b1eabe..c5173bd82380 100644
> > >         --- a/arch/arm/boot/compressed/Makefile
> > >         +++ b/arch/arm/boot/compressed/Makefile
> > >         @@ -80,7 +80,7 @@ libfdt_objs :=3D fdt_rw.o fdt_ro.o fdt_wip.=
o fdt.o
> > >
> > >          ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
> > >          CFLAGS_REMOVE_atags_to_fdt.o +=3D -Wframe-larger-than=3D${CO=
NFIG_FRAME_WARN}
> > > -        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D1280
> > > +        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D2040
> > >          OBJS   +=3D $(libfdt_objs) atags_to_fdt.o
> > >          endif
> > >          ifeq ($(CONFIG_USE_OF),y)
> (snip)
> > Yes it is.  And it is hard to fix, according to the maple_tree maintain=
er:
>
> Hmm...
> Actually I have tried to same solution (=3D remove or fix the big node), =
but
> noticed there are many such code. My suggested was very simple solution
> I guess, but I'm not sure detail of ARM limitation, and/or it can solve a=
ll
> cases, etc...
>
> But other CPU (like ARM64) doesn't have this issue, so we can follow same
> way (=3D allow large frame) I guess.

I do see it in one my arm64 builds, it depends on your kernel config:

    lib/maple_tree.c: In function =E2=80=98mas_wr_spanning_store=E2=80=99:
    lib/maple_tree.c:3812:1: warning: the frame size of 1040 bytes is
larger than 1024 bytes [-Wframe-larger-than=3D] 3812 | }

I guess Arnd has seen it in his randconfig builds, too...

> Does ARM has some reason which can't use large frame ? If not, do you thi=
nk
> we can allow to use it on ARM ?

(stacked) Large frames may cause kernel stack overflow.

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

