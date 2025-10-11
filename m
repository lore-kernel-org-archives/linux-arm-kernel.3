Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A602CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+ikcrGGW2Y1LniPTSaBwEnaVLitaJpovTEmzS7J2TY=; b=LqAdW+xMs/aLSlgrnoCnOYZi0D
	CnMjD0JETgSyo7jVamHGdaZV47kg6c+6BvNGPrpXYOVSWvpp2KSXQYddeF39YlNtyXTNtpwjjYD0T
	q+7jEZOyBlvqGH9jQyjTaMv8n4CMQ0S4gFBfrzKTpvu9yu47DCEO5WxSlxfeLfR8baYaO44DNB74B
	OMHhvZA8w1U+pcQI+UK1hU6AceHC9grc/QingFjkfUAQkW32csRr/kWDwGo8rwRpm9uHn55+tGewx
	LHeuEqsXkfh9WV3c3nHCYVTEtibuiCByrDuHwgAYz3O4VfC4o7lyJqSLoFRyYDMJqkn7vWkO6I3aK
	AyK2ScGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7atR-0000000AGEx-1QbE;
	Sat, 11 Oct 2025 14:48:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7atQ-0000000AGEh-1NPO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 14:48:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C90E9601A5
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 14:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1C2C4CEF4
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 14:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760194098;
	bh=wXStBs+UvcT5ZrTpS1/1ckIwHRUEME48TSqbgkHwb+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oLlMKRHb9j5zca9gdcHz3nPcO7CWeuLIPHjl65qT2ulkC1tRQIFninovONVjG/+pi
	 xlJPV9b35BmCBiYDnvjtYkvfsgCKLcTv7aU+UCPAwJCFH7e1YRwQTWuw6+AFLPJbp7
	 6oId1EXpdBUig96uubNo6+DPOd34dH5Ho3jy47trzx19Tz9FKDIdc08BH5215KlMAO
	 zHfV8cUJzMgeAaEn4t0CPuAh9YsvD1QkbTWrBBFig6M94acAuabpGdlZl+HL27+pn2
	 3aabXazeHX5eCCzxiN1jZeB7tQKIrXZGDduFarAG2uocTIPF/JGfdVEBLr14vZyNOc
	 veOWX/dRp43Pw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-371e4858f74so34839321fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 07:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2zjmG/QzJeA88Y6D2hRT1fWRXgR+bcZvLv8p57BJPVFKxYEBi8C/hBpu6FPs0+2RfofIukDUqEoRMHipUc/+m@lists.infradead.org
X-Gm-Message-State: AOJu0YwFSVC8QKtXwPpIqlr7Lf4NhGHnveGoYwLWcTlyRjaCkRtwQfKi
	qZWMPRXfoh6Ji6LQLvjdeIa3yZ0x0ATeSYVPmuiFJdpCoHK/6MDWnur0VVh/7UyjXxIyHWGRlrS
	0CAxsEIRGYM06um2tjHXUEZgz2hfouOg=
X-Google-Smtp-Source: AGHT+IHYOhl0vOE2LTdwiTtFP0Fr+VU2h59AG96E/Zqsb1S5Qep9A2cRFtxP03lVo9G+6+RIphfLphc9aa7av4+nnEQ=
X-Received: by 2002:a2e:b8c1:0:b0:372:8d09:d53f with SMTP id
 38308e7fff4ca-375f52a306emr52589131fa.20.1760194096892; Sat, 11 Oct 2025
 07:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn> <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn> <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
In-Reply-To: <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 11 Oct 2025 07:48:04 -0700
X-Gmail-Original-Message-ID: <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
X-Gm-Features: AS18NWBtlErlqiroFax4UVMcNYMWDvSx1dti0RxYcAZ5hVrwUXFzJJzynSJJpSU
Message-ID: <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
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

On Sat, 11 Oct 2025 at 00:43, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> On Sat, Oct 11, 2025 at 3:29=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > On 2025/10/11 =E4=B8=8A=E5=8D=8811:40, Ard Biesheuvel wrote:
> > > On Fri, 10 Oct 2025 at 19:54, Huacai Chen <chenhuacai@kernel.org> wro=
te:
> > >>
> > >> On Sat, Oct 11, 2025 at 9:13=E2=80=AFAM Tiezhu Yang <yangtiezhu@loon=
gson.cn> wrote:
> > >>>
> > >>> On 2025/10/11 =E4=B8=8A=E5=8D=8812:25, Ard Biesheuvel wrote:
> > >>> ...
> > >>>> Why do we need both (1) and (2)?
> > >>>
> > >>> Not both, either (1) or (2).
> > >>> Which one do you prefer? Or any other suggestions?
> > >>>
> > >>> Taking all of the considerations in balance, we should decide
> > >>> what is the proper way.
> > >> As a summary, there are three methods:
> > >> (1) Only link libstub with vmlinux.o during the final vmlinux link.
> > >> (2) Remove the attribute __noreturn for real_kernel_entry() and add =
while (1).
> > >> (3) Ignore "__efistub_" prefix in objtool.
> > >>
> > >> Josh prefers method (1), I prefer method (3) but also accept method
> > >> (1) if it is not only specific to loongarch.
> > >>
> > >
> > > This is a false positive warning in objtool, which complains about a
> > > function that falls through, even though that can never happen in
> > > reality.
> > >
> > > To me, it is not acceptable to modify how vmlinux.o is constructed
> > > also for other architectures, in order to hide some of its constituen=
t
> > > parts from objtool, which do not use objtool to begin with.
> > >
> > >
> > > If you are not willing to fix objtool, I suggest fixing the loongarch
> > > code like this:
> >
> > Thank you.
> >
> > > --- a/drivers/firmware/efi/libstub/loongarch.c
> > > +++ b/drivers/firmware/efi/libstub/loongarch.c
> > > @@ -10,7 +10,7 @@
> > >   #include "efistub.h"
> > >   #include "loongarch-stub.h"
> > >
> > > -typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cm=
dline,
> > > +typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
> > >                                            unsigned long systab);
> > >
> > >   efi_status_t check_platform_features(void)
> > > @@ -81,4 +81,6 @@
> > >
> > >          real_kernel_entry(true, (unsigned long)cmdline_ptr,
> > >                            (unsigned long)efi_system_table);
> > > +
> > > +       return EFI_LOAD_ERROR;
> > >   }
> >
> > I tested the above changes, the falls through objtool warning can
> > be fixed because efi_boot_kernel() ends with a return instruction,
> > I think this is reasonable.
> >
> > efi_boot_kernel() has a return value, there are "return status" in
> > other parts of efi_boot_kernel(), it should also return at the end
> > of efi_boot_kernel() in theory, although we should never get here.
> >
> > If there are more comments, please let me know.
> I still don't want LoongArch to be a special case, which means
> efi_boot_kernel() in fdt.c, jump_kernel_func in riscv.c and
> enter_kernel in arm64.c should also be modified.
>

You have made LoongArch a special case by adding objtool support,
which  arm64 and RISC-V do not have.

So NAK to changing arm64 and RISC-V as well.

