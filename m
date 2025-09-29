Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A33CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLLC+wbxjpk4XmEv75JaQLpBxns7cUiLP7TpNdTyiBs=; b=l/VwveGX+kmp6Q+66tJflPboEM
	VatRwocW8+grhCnSwanJ6NNgmrWbmHUhs8FB4ICgAKZGXMh6dwrfAzPw363NozE2jkMrrtNAuV+lS
	n8vzBXynavQbChKGcw24hJuuczZfNgVADD1/dm3G7y/PwDzKzEARgX5ztjXrDGTv7NqkcPJIo6mnC
	b8Wq9/P0WzDDspmKQyEKV3+kdBWleWCPgNX4VLVjsnvkvrsytp8mjXA6ixoh+GBS7jCdzF6IF0NLL
	CjtsDA7h4BFUGmodh5rMNHuNleKRx3BnT80Mu8KF7u6NAxKk4k4Srvh8kODjZGvSJ2iMLS+4taqG3
	kI+yezSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Bm5-00000002I5H-1iwJ;
	Mon, 29 Sep 2025 11:10:33 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Bm3-00000002I4A-0iyo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:10:32 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54bbf3329c1so3823152e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759144229; x=1759749029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLLC+wbxjpk4XmEv75JaQLpBxns7cUiLP7TpNdTyiBs=;
        b=GWNkc5uCAx3qPr/8fiyK7wb+cz0+hUhj4mFw6vZzIe13o5L4TmDm5yvPQO30H18E1/
         POo2sA931rIHhUHBGlKXXdDu7dDQa2fM52YUvrqSQHslL6RUT3MPKwgQt6SKJ2ghycHz
         8KF+LCN2+2v2NHbKwkavhTFfdwmcCO29s6M8i/9Ubdy1cTwcq0TkTWftin2SCvQb4sKt
         QGkG9o+Whn1Nbv6hRtPjRKet8ZI4gAXJM8vQ2oagkyyTFCWxgxDJaJkVikkGF/VINlEv
         Z5h2RjNpTl4PoKlImqSJu6VTJFALJUsaiJHoAvJcFUI9sLIiP+AzeY/KuPXT+GqXdu8O
         PiWg==
X-Forwarded-Encrypted: i=1; AJvYcCX/cXrU1mbZxts1Foo4GZ8usjIJi+3ClSX+5fDUu4d3F2OpUAT2WsNv/Rd6AaHEFO/371pc3isWyVdvBFVnu3yR@lists.infradead.org
X-Gm-Message-State: AOJu0YznGUMhpxaTQ2Og4zh1TJGq9ApyOZ8sZNPGJS1IwC+f3VTr3GJo
	jLAMOq7g37EYucnb11MTiALrXLmnwlrbTZXONizpy0o85LPwKaW/ir5IU/QlEHmX
X-Gm-Gg: ASbGncv77jIOpU80MycWy5I5ncguBdqeQttTu1rItDVvu8kmT/3DIvxiy8JQH8IHNjR
	H73sK2KQQLDZUwmo0P0rGRy2A60abB29r40fkpWvcc3K9z8llZjF6OadirShIYdXUbOgVXcFIPm
	O5SCpXpCyJNVxIf/WvHrhIeCH33xbpKs+KfC1593XUP3+dJ56wrNtOQY2kemdlnOkgpHP+Uomzu
	lrAJgjYpZJu1TQ3mYU0WYpL8rrXAHbWTIx8PPQqHoVGmGeJUoMIYjRImkE/lVcdM246K2qxX3qL
	E46Iv6wSzUHper+zEVMdREgBlwEWN8pNFAGljrA3v/4cc7TyYKGehY9natefffIrUBsrftc1d/B
	zYJwL3OzqDA44XkDyX1d2EEYOJcSjt9oFCgcn60jRvoB4qkdg5/tLv+01sHbs2q7O
X-Google-Smtp-Source: AGHT+IFNZ0MPK935jpUHlGyxQMoGbnWhN6hSd2hVchh+vbL2HTyokBoNbVGLYmEnt+rWTPUjbHC6gA==
X-Received: by 2002:a05:6122:130c:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-54fc7fb2acamr60962e0c.6.1759144229551;
        Mon, 29 Sep 2025 04:10:29 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d8786a20sm2456074241.14.2025.09.29.04.10.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:10:28 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-54bbf3329c1so3823122e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:10:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIHt6I+JJwmGLiq2YmkOyrj67t2tZ5Zh1YHyWyJX5GD6fvaFqtTSpZ5riaqvSFaJ1OQ82tmG3CfNAngmyxkQjG@lists.infradead.org
X-Received: by 2002:a05:6122:e004:10b0:54a:89a2:21ad with SMTP id
 71dfb90a1353d-54fc419339bmr57791e0c.0.1759144227855; Mon, 29 Sep 2025
 04:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250916163004.674341701@linutronix.de> <20250916163252.100835216@linutronix.de>
 <20250916184440.GA1245207@ax162> <87ikhi9lhg.ffs@tglx> <87frcm9kvv.ffs@tglx>
 <CAMuHMdVvAQbN8g7TJyK2MCLusGPwDbzrQJHw8uxDhOvjAh7_Pw@mail.gmail.com>
 <20250929100852.GD3245006@noisy.programming.kicks-ass.net>
 <CAMuHMdW_5QOw69Uyrrw=4BPM3DffG2=k5BAE4Xr=gfei7vV=+g@mail.gmail.com> <20250929110400.GL3419281@noisy.programming.kicks-ass.net>
In-Reply-To: <20250929110400.GL3419281@noisy.programming.kicks-ass.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:10:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtE_E75_2peNaNDEcV6+5=hqJdi=FD37a3fazSNNeUSg@mail.gmail.com>
X-Gm-Features: AS18NWD0T2ErSWY-q1jXuUccpNHEsRySEci4kvFa-MWsnKplWNByVUEA9VYZXc0
Message-ID: <CAMuHMdWtE_E75_2peNaNDEcV6+5=hqJdi=FD37a3fazSNNeUSg@mail.gmail.com>
Subject: Re: [patch V2a 2/6] kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang <
 version 17
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_041031_214953_26F23628 
X-CRM114-Status: GOOD (  26.47  )
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

Hoi Peter,

On Mon, 29 Sept 2025 at 13:04, Peter Zijlstra <peterz@infradead.org> wrote:
> On Mon, Sep 29, 2025 at 12:58:14PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 29 Sept 2025 at 12:09, Peter Zijlstra <peterz@infradead.org> wr=
ote:
> > > On Mon, Sep 29, 2025 at 11:38:17AM +0200, Geert Uytterhoeven wrote:
> > >
> > > > > +       # Detect buggy clang, fixed in clang-17
> > > > > +       depends on $(success,echo 'void b(void **);void* c();int =
f(void){{asm goto("jmp %l0"::::l0);return 0;l0:return 1;}void *x __attribut=
e__((cleanup(b))) =3D c();{asm goto("jmp %l0"::::l1);return 2;l1:return 1;}=
}' | $(CC) -x c - -c -o /dev/null)
> > > >
> > > > This is supposed to affect only clang builds, right?  I am using
> > > > gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04) to build for
> > > > arm32/arm64/riscv, and thus have:
> > > >
> > > >     CONFIG_CC_IS_GCC=3Dy
> > > >
> > > > Still, this commit causes
> > > >
> > > >     CONFIG_CC_HAS_ASM_GOTO_OUTPUT=3Dy
> > > >     CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=3Dy
> > > >
> > > > to disappear from my configs? Is that expected?
> > >
> > > Not expected -- that means your GCC is somehow failing that test case=
.
> > > Ideally some GCC person will investigate why this is so.
> >
> > Oh, "jmp" is not a valid mnemonic on arm and riscv, and several other
> > architectures...
>
> Ah, d'0h indeed.
>
> void b(void **);void* c();int f(void){{asm goto(""::::l0);return 0;l0:ret=
urn 1;}void *x __attribute__((cleanup(b))) =3D c();{asm goto(""::::l1);retu=
rn 2;l1:return 1;}}
>
> Seems to still finger the issue on x86_64. That should build on !x86
> too, right?

Thanks, builds fine on arm32, arm64, riscv, m68k, powerpc, mips, s390.

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

