Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7336CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 02:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyYjGD+I6CM3A7xg9P/WbOG/mM8/FJKHee6fckn/gXo=; b=VJFOkqJ5CsaPKs1sSCiXWu0kOr
	tlEvbrdPcPQA08PN7n3CmSqIiMKfO1cLDV0eDS/fsmFcqBdYxemkJBPvagSyl5sy3IcXZuoD6Uj80
	9mC+Zoppv/jQUPYKSm+4HW4JIKo0mXY0tPvESJW+MLcBQXa4nrTqm+QaLnDFk7q6EFWuKJndBlsUP
	ywy4RcrfMgXbMfKuKKOTHrrixhy8SUA3ekMdLD2D46W1ajzbUwXcB7zizpl+lVNdkR5rZlHw9oYJz
	fqiIgq6Ky4i2RB/8KBvszY9swkWlxkVOVDUI6NktUfkB8zVD+B3jGj0DPTexs0j+eeEQq7XdjMTjU
	5CkZ5vEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QUM-00000003yP5-19eG;
	Tue, 30 Sep 2025 02:53:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QUL-00000003yOh-2ATS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 02:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5DD86035A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 02:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3EAC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 02:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759200792;
	bh=ym6h+Qei6CJdmJJVbagIpDYKjBeMBZx8FHWAejUB0wE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZQEQ98G3bc+RXLkAjVNzcVi/lvBuHyora3y6Zw3XprKqYOMPaiGuYjUK/G31JHpHr
	 O/OuKZm9HxOCnEpUNddpaLPt8AEcacqAeWwfafojoodFqESXk1zkEJdNPhyMg0aCTq
	 u9t2U/bkf6E2Ki2+tyhc3LF4SVgdenJkZpg5gxVO8OiTLyAuSdwIQIn6hyFegsIt+o
	 czyltKdO8Mhzmuk9ok02kbwhybem3tvpxnlWZKLjd1DoG/jUDb+8I5/pMNXO+ow6wc
	 9R56Mc3eNQU+YHPldkahVJa9yh0GzHiPaLclpp3q1D+rONvmophr3SCnxBPTIcVQ4F
	 ilqJGzWWnxTQA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3e9d633b78so422941066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 19:53:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgJ9CaCcUU0aAryOqtO/vzimn0prRRaOWIk/Yfj7UT0EjcqDaaYNh+K/dMU724x16u5w+VAPKQ6EXMTO44lVms@lists.infradead.org
X-Gm-Message-State: AOJu0YxF+wEaJsvUOG5n++c+4bIPb8AhdKhfinZafR06icyWD59vc9PN
	AzWYYApX3ZVczmH8EG0p72+IebpqLakxpcQOzQ6XX+r5jmWD+Yjf6W6ovyuvp59hlLv3sO3qdek
	XcUSz1UwqOp2yRhDwYq3Rpso7W88RJmk=
X-Google-Smtp-Source: AGHT+IEfvCuZAVXXWVTEo167aebO6qUsrh2w2UDinUqmaNHItIXCoAnwHta702NRz1ENszkgUaXlenJfqCGyw7SV6Wc=
X-Received: by 2002:a17:907:daa:b0:b2d:4e57:58d8 with SMTP id
 a640c23a62f3a-b413600acc6mr256609966b.10.1759200791107; Mon, 29 Sep 2025
 19:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com> <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
In-Reply-To: <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 30 Sep 2025 10:52:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6PNcyTNXEhzdovt3an7e9V+B+Z-px=_HPiQ5vv7qaDMg@mail.gmail.com>
X-Gm-Features: AS18NWDktm4BaCz5O-7O3VzGm9rq1tPjPU1iKF2Ar1jh6n3dOQanb3Px7roMXtU
Message-ID: <CAAhV-H6PNcyTNXEhzdovt3an7e9V+B+Z-px=_HPiQ5vv7qaDMg@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Sep 28, 2025 at 10:40=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Sun, 28 Sept 2025 at 15:52, Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > Hi, Ard,
> >
> > On Sun, Sep 28, 2025 at 9:42=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> > >
> > > On Sun, 28 Sept 2025 at 10:55, Tiezhu Yang <yangtiezhu@loongson.cn> w=
rote:
> > > >
> > > > When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
> > > > the following objtool warning on LoongArch:
> > > >
> > > >   vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
> > > >   falls through to next function __efistub_exit_boot_func()
> > > >
> > > > This is because efi_boot_kernel() doesn't end with a return instruc=
tion
> > > > or an unconditional jump, then objtool has determined that the func=
tion
> > > > can fall through into the next function.
> > > >
> > > > At the beginning, try to do something to make efi_boot_kernel() end=
s with
> > > > an unconditional jump instruction, but this modification seems not =
proper.
> > > >
> > > > Since the efistub functions are useless for stack unwinder, they ca=
n be
> > > > ignored by objtool. After many discussions, no need to link libstub=
 to
> > > > the vmlinux.o, only link libstub to the final vmlinux.
> > > >
> > >
> > > Please try keeping these changes confined to arch/loongarch. This
> > > problem does not exist on other architectures, and changing the way
> > > vmlinux is constructed might create other issues down the road.
> > ARM, RISC-V and LoongArch do things exactly in the same way. Now
> > LoongArch is the first of the three to enable objtool, so we meet the
> > problem first.
> >
> > But yes, I also don't want to change the way of constructing vmlinux.
> > So I prefer the earliest way to fix this problem.
> > https://lore.kernel.org/loongarch/CAAhV-H7fRHGFVKV8HitRgmuoDPt5ODt--iSu=
V0EmeeUb9d5FNw@mail.gmail.com/T/#meef7411abd14f4c28c85e686614aa9211fccdca0
> >
>
> Can we just drop the __noreturn annotation from kernel_entry_t, and
> return EFI_SUCCESS from efi_boot_kernel()?
Not good, because kernel_entry_t is really "noreturn", and at present
no architecture returns EFI_SUCCESS at the end of efi_boot_kernel().


Huacai

