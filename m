Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045B6CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTn9nM0R9whZQqi9uwlAHyks98tvQ6iAIEijambx9D8=; b=XWo4t70PZP3bdIpjOUf1QhfbXi
	b4LQsgbHJ9DyOuEtw40H4GE51KCncEtcEWK0qeRLsn/5rGo+JNQz4EvmmZFiom/UoIOHKHygQt/sP
	c+Lt4cy/lTtjKqstkVgM12yCkNq6+nTLOVfKLAGwG3RKYqdPLjfT7MY87gmL1slJ+u7/i2+qr37cQ
	yB+kNwfxQyIdOBQzlyyCV9w0GaHDzGh6YICSv0/meK40LyeXJav9Vmu0JCE9T0K9DsSaRPv2nB7gx
	lr+z6PX19Dt8qcJLu2c25dzM7ERlG+9r58MR4hR6x1M6qR/y12WAWJ9VL2wV84mvqRxnJNUQAbJ4n
	lcX2R5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2sae-0000000G4NV-3bBz;
	Sun, 28 Sep 2025 14:41:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2sac-0000000G4N7-3VWi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 14:41:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0665E62179
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 14:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3CBC19421
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759070485;
	bh=zEl3HK9Huv3wAo8Gz3obptdVAl3BiTe7KlwyVun45hk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KQHRjPwLC5G8brFRuLi7o+fpS7n5vnimwAp70vgaHEgFmGnQ+8/JXmEMwOpYluWwc
	 gPh8y3NdWf05BAJsL1h89OUxuFiv9K0M0HAyMqKJAYGCpmKa3ACFswAt33tdsAo0Uw
	 WdTCh+3Jn7TMW4j+oJj7r1EF6IJOs7ve0Px1LcHX9VnhjdE0r+UEpc5Xm6wBzwl3Yu
	 a8fnF/rbiGqU15Qg4uTENsF6mjnkIPDm1zebsaCCre5mcLnUqjqOoCMEqJWnK6oHig
	 l3Ae2UGbCke7CAP4d0CH4r2FibiszgEoGSh6Cq/uBnrxy4QLsw0AP9aujqJ9E7H1Ur
	 kFjd+rIM8OAoQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57bc9775989so3571152e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 07:41:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzBvI0MCQ8bMpTj5wRyp++JEtVoW893GRPLR3XJd1VRLltbSruXrJ8q6Jb1Mcbneb4H86Ol6bT8ZPqpZ7W8RMQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxNYmVRxlWIf/IC8EhfRLFAZzB+bRHlJ3l6HyTmzZBGrJcRz4EF
	knIgRbI+evw2P+FMRMOQWiLPqlDfwVN2bhJ+c8r6MUVS4w7lt3ibEYmArdK/ocd1osE+2GF7DJy
	at97WOYrmNYsdHJrCDdEzcZTnPpU0J4I=
X-Google-Smtp-Source: AGHT+IFWQQN6QdQWgcfYnmBFENB0KuvC1Z/xcGcpQuzj5V+hESZTuEgEU7p0gTVxJK5oi7ZFD+wA09OxaRIm8jBNjGM=
X-Received: by 2002:ac2:4f07:0:b0:55b:8afb:e638 with SMTP id
 2adb3069b0e04-582d295ce23mr4091918e87.28.1759070484041; Sun, 28 Sep 2025
 07:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com> <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
In-Reply-To: <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 28 Sep 2025 16:41:12 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
X-Gm-Features: AS18NWDKeRljEYzTakhM3NRe_gYKBPPHlUPXn-bSPODAX07vV2YYljZFZWHKAg0
Message-ID: <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
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

On Sun, 28 Sept 2025 at 16:39, Ard Biesheuvel <ardb@kernel.org> wrote:
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

... or add efi_boot_kernel() to ./tools/objtool/noreturns.h?

