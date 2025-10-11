Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DE4CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ISMyolttyQ/C1z0NU8vuD1mabAL8qHWX8PvN1KsEK0=; b=kBXXVkOI2AqZ53Uc0Ceq8dXnIG
	7e3s7C5byJz+nSlKLEpI4PPzcjlaFDZDJz3ei7XHJfvao9ygfY2ht99eyLd+36ynoDlewdJ9dQfeD
	uwh7HWb7Hnwo3AExgmHutuS/trvh76lreT0I+mVmRn1jGh0dEBSmmr3pKX09YRhP5jeTUTbX0Mkei
	Me7Z+Uua425f10e7/sadYOCAsOYKLFOFh5Voijx5wYFbfDbo41YLaQ4q94HZlxo//o3fPq7OcTS+S
	0LVyxqFsDFykNkrms0zB4b6Inq2S5WGISF+zrW3Rig1k6FitfrmLFYYW1Jj6sGg8a4RNfnQAJUVpf
	mKMuuaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7c00-0000000AJnm-3QBI;
	Sat, 11 Oct 2025 15:59:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7bzy-0000000AJnC-3xcR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 15:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18ED2601BA
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 15:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8079C4CEF4
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760198348;
	bh=FMP8VZ8gA8szkAuFWTgf4lD8+bKkcaaQoNiLGdi+x8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GHGQKRIHweQ7PZMVovdL3iYLbmpFP9KKXvT7q02FDt6cXW0P69kn5Mw8QcpaNB1B8
	 m6IygR0VmI8zPuyzvxrK1h0pe3A32eDEpPvCY732dmtDbkD6Zs+C5JnVs7jr5nxNXe
	 NXC7vhUFAVTAgDzMg+sqiAXHNsFxUtBJdYwnvZvXJ1UFKczzNsfLUK9pJ1v6aPANZD
	 vQM4Ll99H7Pk/CsITHNEPb/wzhX/k+wB3r+xBDUUMPGd+GCyiUWkDJ+2IHWxJZm6ag
	 wfaCps6geQcvo2qmRjhe0CWyO34pPZnoZP9lj8ibMdy8qFuZaln/cENRQCFQzdInCS
	 kN6FXpXaYfeDw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5906665139cso3817736e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 08:59:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfBoHPi2kRlJCkLjdRYUhG4Uwbc3yrHyACFmax2gd1XmQcSJkuEqw/0xyGLAhMLzL5VswsoyhMPFTNXZqQRvgv@lists.infradead.org
X-Gm-Message-State: AOJu0YwMMFq0K/b1Nrrf/DlxyOba3ZdVZq/ltFdi7Crfjvt/qYIJIowf
	grGXXye2LZH8LBcD3yNh8DN1l2sFooX70QE6GA6plwELz8gtV8Us1mX24RuyVPIFlcN+cFnJbAh
	S81wUyPoWm+mcwvtTEK6iV2Zf95PrDtU=
X-Google-Smtp-Source: AGHT+IHd5fznoov3yvP+tErzIhmwiFjGEZONVFkecfMa35ml0OgDZ88tcqRJ52S0xdOyn0JZVXsG2S6/tycTHC1Itx8=
X-Received: by 2002:a05:6512:6c1:b0:57a:f38a:397b with SMTP id
 2adb3069b0e04-5906db03666mr4327444e87.3.1760198347099; Sat, 11 Oct 2025
 08:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn> <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn> <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com> <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
In-Reply-To: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 11 Oct 2025 08:58:55 -0700
X-Gmail-Original-Message-ID: <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
X-Gm-Features: AS18NWAdTcjhG-nlKj9-SJF_h7OC6cz6ubjlCu1ov6qw2W9Mvr0vP5hoof0hvXo
Message-ID: <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
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

On Sat, 11 Oct 2025 at 08:01, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> On Sat, Oct 11, 2025 at 10:48=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org>=
 wrote:
> >
> > On Sat, 11 Oct 2025 at 00:43, Huacai Chen <chenhuacai@kernel.org> wrote=
:
> > >
> > > On Sat, Oct 11, 2025 at 3:29=E2=80=AFPM Tiezhu Yang <yangtiezhu@loong=
son.cn> wrote:
> > > >
> > > > On 2025/10/11 =E4=B8=8A=E5=8D=8811:40, Ard Biesheuvel wrote:
> > > > > On Fri, 10 Oct 2025 at 19:54, Huacai Chen <chenhuacai@kernel.org>=
 wrote:
> > > > >>
> > > > >> On Sat, Oct 11, 2025 at 9:13=E2=80=AFAM Tiezhu Yang <yangtiezhu@=
loongson.cn> wrote:
> > > > >>>
> > > > >>> On 2025/10/11 =E4=B8=8A=E5=8D=8812:25, Ard Biesheuvel wrote:
> > > > >>> ...
> > > > >>>> Why do we need both (1) and (2)?
> > > > >>>
> > > > >>> Not both, either (1) or (2).
> > > > >>> Which one do you prefer? Or any other suggestions?
> > > > >>>
> > > > >>> Taking all of the considerations in balance, we should decide
> > > > >>> what is the proper way.
> > > > >> As a summary, there are three methods:
> > > > >> (1) Only link libstub with vmlinux.o during the final vmlinux li=
nk.
> > > > >> (2) Remove the attribute __noreturn for real_kernel_entry() and =
add while (1).
> > > > >> (3) Ignore "__efistub_" prefix in objtool.
> > > > >>
> > > > >> Josh prefers method (1), I prefer method (3) but also accept met=
hod
> > > > >> (1) if it is not only specific to loongarch.
> > > > >>
> > > > >
> > > > > This is a false positive warning in objtool, which complains abou=
t a
> > > > > function that falls through, even though that can never happen in
> > > > > reality.
> > > > >
> > > > > To me, it is not acceptable to modify how vmlinux.o is constructe=
d
> > > > > also for other architectures, in order to hide some of its consti=
tuent
> > > > > parts from objtool, which do not use objtool to begin with.
> > > > >
> > > > >
> > > > > If you are not willing to fix objtool, I suggest fixing the loong=
arch
> > > > > code like this:
> > > >
> > > > Thank you.
> > > >
> > > > > --- a/drivers/firmware/efi/libstub/loongarch.c
> > > > > +++ b/drivers/firmware/efi/libstub/loongarch.c
> > > > > @@ -10,7 +10,7 @@
> > > > >   #include "efistub.h"
> > > > >   #include "loongarch-stub.h"
> > > > >
> > > > > -typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned lon=
g cmdline,
> > > > > +typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
> > > > >                                            unsigned long systab);
> > > > >
> > > > >   efi_status_t check_platform_features(void)
> > > > > @@ -81,4 +81,6 @@
> > > > >
> > > > >          real_kernel_entry(true, (unsigned long)cmdline_ptr,
> > > > >                            (unsigned long)efi_system_table);
> > > > > +
> > > > > +       return EFI_LOAD_ERROR;
> > > > >   }
> > > >
> > > > I tested the above changes, the falls through objtool warning can
> > > > be fixed because efi_boot_kernel() ends with a return instruction,
> > > > I think this is reasonable.
> > > >
> > > > efi_boot_kernel() has a return value, there are "return status" in
> > > > other parts of efi_boot_kernel(), it should also return at the end
> > > > of efi_boot_kernel() in theory, although we should never get here.
> > > >
> > > > If there are more comments, please let me know.
> > > I still don't want LoongArch to be a special case, which means
> > > efi_boot_kernel() in fdt.c, jump_kernel_func in riscv.c and
> > > enter_kernel in arm64.c should also be modified.
> > >
> >
> > You have made LoongArch a special case by adding objtool support,
> > which  arm64 and RISC-V do not have.
> >
> > So NAK to changing arm64 and RISC-V as well.
> Hmmm, I want to know whether this problem is an objtool issue or an
> efistub issue in essence. If it is an objtool issue, we should fix
> objtool and don't touch efistub. If it is an efistub issue, then we
> should modify efistub (but not specific to LoongArch, when RISC-V and
> ARM64 add objtool they will meet the same issue).
>

It is an objtool issue in essence.

The generated code looks like this

9000000001743080: ff b7 fe 57   bl      -332 <__efistub_kernel_entry_addres=
s>
9000000001743084: 26 03 c0 28   ld.d    $a2, $s2, 0
9000000001743088: 87 00 15 00   move    $a3, $a0
900000000174308c: 04 04 80 03   ori     $a0, $zero, 1
9000000001743090: c5 02 15 00   move    $a1, $fp
9000000001743094: e1 00 00 4c   jirl    $ra, $a3, 0

9000000001743098 <__efistub_exit_boot_func>:
9000000001743098: 63 c0 ff 02   addi.d  $sp, $sp, -16

There is nothing wrong with this code, given that the indirect call is
to a __noreturn function, and so the fact that it falls through into
__efistub_exit_boot_func() is not a problem.

Even though the compiler does nothing wrong here, it would be nice if
it would emit some kind of UD or BRK instruction after such a call, if
only to make the backtrace more reliable. But the code is fine, and
objtool simply does not have the information it needs to determine
that the indirect call is of a variety that never returns.

So I don't mind fixing it in the code, but only for LoongArch, given
that the problem does not exist on arm64 or RISC-V.

