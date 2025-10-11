Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77597CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGsRtmZbM/YS6S5wtcJvUHLsx2IPEmGsenNaMevnv+w=; b=XU3OXJjb5XjvuOQksQg8bcY/oh
	UN6R9EFW3xj8zxMPqIy7mVhfFsFuqaRiEKZSfynm3kenduQ2OxiWrSRQ5xzs4T9hW580ZgSA1bs4B
	gEaRm384XNXViRo9gx721wQ+0GryzbUUyJK4ZO9ytic+wsrvg33Y6rTyoWXdV7n/tsJrXRZ95LcW/
	wI6631N3U0nshAbz6BQDXoLQc0A21QVM2ZPlZ21inLG8qv6ylG3aBGtPa0vJZsuqbRZgzxUEjRMNJ
	AfUnWJtpNQ060v1x0U0G5q4XCDTVB4xqYMdcIqmb3DhFNb21PUaQ3+nKTMO4+hu9pgezOrcwR2686
	jNcucYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7b6N-0000000AHJx-0elW;
	Sat, 11 Oct 2025 15:01:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7b6L-0000000AHJZ-41un
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 15:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 534FB6034B
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 15:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057AFC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760194901;
	bh=l+BZFi7FQ0gPIfmUyKUU89IcSli2ZdE01CP6ZymDA1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tsHAGq8dCVb2hVSocMgxqr7qyYj5+AKGnNNotgILXaJcZW20HJ9zHbk5bc8MAasJB
	 DGIgOAcZoh181a0g3qHUSjhsInio82Gzpz/0bSDpc9HMowZhB0UYG+wL685LcxiDHA
	 GHDirQ4tLupNMXXJCX07tPelAY0JHllVubWToOWC0fFxRIJMyQebl/4kfn7XL/tLpe
	 i1SUOxXGMViX3cjRPGrAnFt4WJkRMR9jfqaGHwAoSrdQ+L1QfCD3gFsPaLtCJvgOg0
	 8t04jZiPVC8y3aEqpyCX99zqFY0hHt3A+faZRg0StkoJRoQQdFmqX0a8kNyNzCZZfQ
	 ilr5qP68oSOFA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so5774366a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 08:01:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU46p0Xownq9VV4VLLGI3TcUypQ1Lu3Q3AKWkpjsrM1ahfRh3sLgVRlJ9G6PEOAOq5lm0ShpH5R9rPmgzd7ceEC@lists.infradead.org
X-Gm-Message-State: AOJu0YwZjFxOzv679JX1TJS/9zu4PyUEey4wmzY6ky+w46w2NR58NWxr
	lmqUvftF+jRkOxLXehNGUt+7jGrx4BxOKbKQkZz3xLfbsdb6X9kjJha8q5UiYN1CbtahI5N0WyD
	9CMte7dVTfDd9RhqrGARRKOAHZFd7UB0=
X-Google-Smtp-Source: AGHT+IHAAjGILFWSLd2horNFRfV9fxdmdzWYj3ySTCm2Rj6N1tAB750HNgdkpDddPHK+8MUEnYbHC/EcCmKKJlMNNAU=
X-Received: by 2002:a05:6402:254f:b0:637:e4d1:aeff with SMTP id
 4fb4d7f45d1cf-639d5c3ebc3mr15509926a12.19.1760194899593; Sat, 11 Oct 2025
 08:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn> <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn> <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
In-Reply-To: <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Oct 2025 23:01:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
X-Gm-Features: AS18NWAB1PQYI1FQztjMtlWlWvM53GRJ5zRkwYU-MM98Alr4NPAHm_TfvKHj05U
Message-ID: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
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

On Sat, Oct 11, 2025 at 10:48=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Sat, 11 Oct 2025 at 00:43, Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > On Sat, Oct 11, 2025 at 3:29=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> > >
> > > On 2025/10/11 =E4=B8=8A=E5=8D=8811:40, Ard Biesheuvel wrote:
> > > > On Fri, 10 Oct 2025 at 19:54, Huacai Chen <chenhuacai@kernel.org> w=
rote:
> > > >>
> > > >> On Sat, Oct 11, 2025 at 9:13=E2=80=AFAM Tiezhu Yang <yangtiezhu@lo=
ongson.cn> wrote:
> > > >>>
> > > >>> On 2025/10/11 =E4=B8=8A=E5=8D=8812:25, Ard Biesheuvel wrote:
> > > >>> ...
> > > >>>> Why do we need both (1) and (2)?
> > > >>>
> > > >>> Not both, either (1) or (2).
> > > >>> Which one do you prefer? Or any other suggestions?
> > > >>>
> > > >>> Taking all of the considerations in balance, we should decide
> > > >>> what is the proper way.
> > > >> As a summary, there are three methods:
> > > >> (1) Only link libstub with vmlinux.o during the final vmlinux link=
.
> > > >> (2) Remove the attribute __noreturn for real_kernel_entry() and ad=
d while (1).
> > > >> (3) Ignore "__efistub_" prefix in objtool.
> > > >>
> > > >> Josh prefers method (1), I prefer method (3) but also accept metho=
d
> > > >> (1) if it is not only specific to loongarch.
> > > >>
> > > >
> > > > This is a false positive warning in objtool, which complains about =
a
> > > > function that falls through, even though that can never happen in
> > > > reality.
> > > >
> > > > To me, it is not acceptable to modify how vmlinux.o is constructed
> > > > also for other architectures, in order to hide some of its constitu=
ent
> > > > parts from objtool, which do not use objtool to begin with.
> > > >
> > > >
> > > > If you are not willing to fix objtool, I suggest fixing the loongar=
ch
> > > > code like this:
> > >
> > > Thank you.
> > >
> > > > --- a/drivers/firmware/efi/libstub/loongarch.c
> > > > +++ b/drivers/firmware/efi/libstub/loongarch.c
> > > > @@ -10,7 +10,7 @@
> > > >   #include "efistub.h"
> > > >   #include "loongarch-stub.h"
> > > >
> > > > -typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long =
cmdline,
> > > > +typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
> > > >                                            unsigned long systab);
> > > >
> > > >   efi_status_t check_platform_features(void)
> > > > @@ -81,4 +81,6 @@
> > > >
> > > >          real_kernel_entry(true, (unsigned long)cmdline_ptr,
> > > >                            (unsigned long)efi_system_table);
> > > > +
> > > > +       return EFI_LOAD_ERROR;
> > > >   }
> > >
> > > I tested the above changes, the falls through objtool warning can
> > > be fixed because efi_boot_kernel() ends with a return instruction,
> > > I think this is reasonable.
> > >
> > > efi_boot_kernel() has a return value, there are "return status" in
> > > other parts of efi_boot_kernel(), it should also return at the end
> > > of efi_boot_kernel() in theory, although we should never get here.
> > >
> > > If there are more comments, please let me know.
> > I still don't want LoongArch to be a special case, which means
> > efi_boot_kernel() in fdt.c, jump_kernel_func in riscv.c and
> > enter_kernel in arm64.c should also be modified.
> >
>
> You have made LoongArch a special case by adding objtool support,
> which  arm64 and RISC-V do not have.
>
> So NAK to changing arm64 and RISC-V as well.
Hmmm, I want to know whether this problem is an objtool issue or an
efistub issue in essence. If it is an objtool issue, we should fix
objtool and don't touch efistub. If it is an efistub issue, then we
should modify efistub (but not specific to LoongArch, when RISC-V and
ARM64 add objtool they will meet the same issue).

Huacai

