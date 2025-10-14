Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADD0CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxB5Gk9hhGuxtZPAkXmc7kN/kuX5RoHRjz2MuznwXGI=; b=SCkhCFaFkMFsHnVFbecpzGhKGt
	fdPqOp8atWmbnsyKRdsdj6I18N+/WdL6cO/JJAINqfb77M8dp6CVx8KgWLL6CcDO6zeHuxFQpDjwe
	wr+nSJy8f8NS0xpCU1YAN+8lz7V5jew5c4eqwmp0NBaBbcMGIYYCxKioEu+w7f8k5CdCiPqmvzFii
	aXaQm9CCWaXYOF2cUK9v5/OqKdHWK8I1Y3BbESKWjtXqIS4oB9oExiug1O4Ldfnthg6KU3cxoIa3k
	k31k8rMtfAf9YQ4t/XjF+8f8zcZE0kQVpovunOiQZBREs+N49sI+AdhpZNRQmyRp4pjCA3M2nTIAJ
	icACl7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gJO-0000000Gfyo-2Yae;
	Tue, 14 Oct 2025 14:47:38 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gJL-0000000Gfxp-3WWd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:47:36 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-89019079fbeso1326701241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453254; x=1761058054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxB5Gk9hhGuxtZPAkXmc7kN/kuX5RoHRjz2MuznwXGI=;
        b=jnjd0tA3XEPKoq6Uwx1LKqOAxiO4LSuqCm+m3FkLIdyra3rUeTTJMNcYXXRxxlUis3
         GPF01MOdXzLgoZr0vA0uwrhFcard0ExiXg4SacZ5Ed7xfYdID0ad84ZkO0bhQe7XiqMQ
         STgs7VjeHjhdQWEceuxAIY9kkAcRQB4uXW+bRQ07mqR1P8yapheI1v++rLvhMZexGhOq
         sIvGPOsLiWiJBkGPA0z2QmTM+SMgQH2bEomZIf4BzQSn7c2LFcUOaCU8e3cUB0B2/nIb
         NZsuQEtG8NWXgN+GQuxkacHYgfTj0ghnxKnsSyBQci8nLRueO1Jb6xYXZ+hC93U52yEc
         cvpA==
X-Forwarded-Encrypted: i=1; AJvYcCWxuoGwAvHr2aPbgs/y/Knw5fe3Y2+IhUjZt1HdqnG4NULMrA9imSO4dYWAh0TXLdRQzOgX8P0s5RLGyYPfZu9q@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvhb+SqMVTEQS6dZUf2AFheTxUB9bd4qG8/bH+CNKeoAXfwvos
	5iQF4KSRoLlvxTcB53Rq/KPzyYr2jXq8doED1bP7ENAwO8HRHKW+E37AISkj4gxt
X-Gm-Gg: ASbGncvpnnZZYYPoRw3tzQxz6IcVdnTY1wxo/McvcNTnMaoD35yFp5FUXzsrHtQEH16
	qzx0n2n5pYbrrELUcIGSvwrxtiP/Gr40MQXYk1XNMVdnYuB7rB4RFtCkcw2N1w/2K+vHah20mpV
	4w+4oUhTHs+CK8U21fw4tViSN9ZtRCATYR02znhgwksDL5SK/7gQRL4L6YBCpLbGGn+szvl+Xka
	o3OC7mBMJvhMPpzQ97RksVhStV8qhPZLotn/i8iTU5PFB9bLkkvxc9VpPVTrlYXBT0aGFY0Va0B
	rzzCJZjJSp2DgaJZSPEk12loFSfrzUl+YvZdcJZMEPJ6skTvwTwbUiHVzIY0DiCpXpaCVtw4cp9
	65TnBZRRzP81Nd8snhIK520RR6GO9Y4VyGyjy0kgb2JbzwHlAI0YtwSXWdkzSh88IxAfKYnbs0k
	wV/ihRybo=
X-Google-Smtp-Source: AGHT+IFQ7YiL9/LFiIANxbEB6IHhSgO63LTNZbNduI6WTy/CESUKxgpkrygEi006hE10updrEFRotw==
X-Received: by 2002:a05:6102:b0f:b0:521:27b:bea4 with SMTP id ada2fe7eead31-5d5e2216207mr7631578137.6.1760453253773;
        Tue, 14 Oct 2025 07:47:33 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc4e9e4csm4486625137.0.2025.10.14.07.47.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:47:33 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5d758dba570so169080137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:47:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsG7VpEkwhsWHZGlVM/7vJBO21vRzjBw/O8joGq2nSs4n7h61QlmHazhiYOoqgZySRDftkQqgufyuh9VEgkm1l@lists.infradead.org
X-Received: by 2002:a05:6102:5a96:b0:5a3:acb7:55c7 with SMTP id
 ada2fe7eead31-5d5e2371937mr8292663137.18.1760453253223; Tue, 14 Oct 2025
 07:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
 <877bzr97no.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
 <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com> <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
In-Reply-To: <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 16:47:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXiDM4AMyXxaxGv-JYNpZ0CD75v4tAa5C3RmFy4m0GtQ@mail.gmail.com>
X-Gm-Features: AS18NWAdAI3uUCtRiqwsaIgYniB0TZsmKwRVGOVmQ3ce35c5DMgdYKKV27fxfg0
Message-ID: <CAMuHMdXXiDM4AMyXxaxGv-JYNpZ0CD75v4tAa5C3RmFy4m0GtQ@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut@mailbox.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_074735_884246_93C454AE 
X-CRM114-Status: GOOD (  31.45  )
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

On Tue, 29 Jul 2025 at 09:49, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Tue, 29 Jul 2025 at 09:27, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Jul 29, 2025, at 09:15, Geert Uytterhoeven wrote:
> > > On Tue, 29 Jul 2025 at 02:12, Kuninori Morimoto
> > > <kuninori.morimoto.gx@renesas.com> wrote:
> > >> > >         > grep CONFIG_FRAME_WARN .config
> > >> > >         CONFIG_FRAME_WARN=3D2040
> > >> > >
> > >> > >         > git diff
> > >> > >         diff --git a/arch/arm/boot/compressed/Makefile b/arch/ar=
m/boot/compressed/Makefile
> > >> > >         index d61369b1eabe..c5173bd82380 100644
> > >> > >         --- a/arch/arm/boot/compressed/Makefile
> > >> > >         +++ b/arch/arm/boot/compressed/Makefile
> > >> > >         @@ -80,7 +80,7 @@ libfdt_objs :=3D fdt_rw.o fdt_ro.o fdt=
_wip.o fdt.o
> > >> > >
> > >> > >          ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
> > >> > >          CFLAGS_REMOVE_atags_to_fdt.o +=3D -Wframe-larger-than=
=3D${CONFIG_FRAME_WARN}
> > >> > > -        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D1280
> > >> > > +        CFLAGS_atags_to_fdt.o +=3D -Wframe-larger-than=3D2040
> > >> > >          OBJS   +=3D $(libfdt_objs) atags_to_fdt.o
> > >> > >          endif
> > >> > >          ifeq ($(CONFIG_USE_OF),y)
> > >> (snip)
> > >> > Yes it is.  And it is hard to fix, according to the maple_tree mai=
ntainer:
> > >>
> > >> Hmm...
> > >> Actually I have tried to same solution (=3D remove or fix the big no=
de), but
> > >> noticed there are many such code. My suggested was very simple solut=
ion
> > >> I guess, but I'm not sure detail of ARM limitation, and/or it can so=
lve all
> > >> cases, etc...
> > >>
> > >> But other CPU (like ARM64) doesn't have this issue, so we can follow=
 same
> > >> way (=3D allow large frame) I guess.
> > >
> > > I do see it in one my arm64 builds, it depends on your kernel config:
> > >
> > >     lib/maple_tree.c: In function =E2=80=98mas_wr_spanning_store=E2=
=80=99:
> > >     lib/maple_tree.c:3812:1: warning: the frame size of 1040 bytes is
> > > larger than 1024 bytes [-Wframe-larger-than=3D] 3812 | }
> > >
> > > I guess Arnd has seen it in his randconfig builds, too...
> > >
> > >> Does ARM has some reason which can't use large frame ? If not, do yo=
u think
> > >> we can allow to use it on ARM ?
> > >
> > > (stacked) Large frames may cause kernel stack overflow.
> >
> > The version below works around the warning for arm, arm64 and x86
> > on both gcc and clang.
>
> Thanks, that indeed works for my arm64 config that triggered it before.

Unfortunately it no longer helps for my rbxt4927 build...

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

