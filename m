Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707A8CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJE95WP/q/IHUh/Wa9NhE3kPtofpGMopUH6vSO6nuTA=; b=4Tz9fu7fxkUm9OwMzHYHWYqOgf
	HfB5RXPQMEneNPhsA+7yLzP3MhgSg01y/kb4/3dZuwh+J1DBni0ZAql2oeyoHqnjR/KxZQ7ezoX7l
	7UTfJqgTdyKRv//yG5GZg7xFXIFBNz0xwiLvaWeNePRwllpKtylJq3ZfpGDR+GQCGIPk3y7+8KJrr
	JqljivHdqyDPW+n5swyFynBSXlsII6/CZCv+ZtY00CpSPhuDjd4VqxF8U3+8NiLRZLOXmauiQO2iU
	xs2NX52JrezIcxhSOcZu5yal20RsPPgVza8yEuPs8WSvsUHs6HrBaQYQ+/wPtqxhtlK5nIABXcR3u
	8BNA6u2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7UFy-00000009v9G-34DO;
	Sat, 11 Oct 2025 07:43:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7UFw-00000009v8c-3qwr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 07:43:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64D2960383
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 07:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1770FC116B1
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760168587;
	bh=kbm4votTa6BVKLQfFvb+lq1ndb0PM/xLDZ0aG+HAUR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T4wvTaGvuy8oReUd69CQDXFvrY7CrVInOc98VNnRcLPUYmHnSXE+quOCm3pTn7mnI
	 lUYCnCiajp7hXJnE4MRw6EEgLhT8Yj/ACK0ZsD+Mv9/5oXClTCUwNHnBtkGhncLIlJ
	 c3dydXpfo9iCJgHHLdhjPeva1+xcWx8Yz21+7kq0WmS5yT2zd9gYq1LHftXI0ntJf8
	 Ii3jBJtD9JYStcrQISejHRLakFe1NgjXBjfmSx9QF3oxfQ86ha1Dwdi5apgcgIjwhW
	 AkEsgIzm1HIpncpi1gzUjOBIxuXekoMQVEPnKkfZ4GX9IAmH6FUibNJ/2sRXuPVjYk
	 kHL+fdUO2i1yw==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63963066fb0so5587336a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 00:43:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTWiaE1TQesBNbuwAgf8mZh8fDwzLGodcNRW8wckJvwJwLAw1gnjVLT/FZYZcqsdwV0PPGBz77hCU32dMS1A1o@lists.infradead.org
X-Gm-Message-State: AOJu0YyFVmcKp5Jw9nXHTpyJ2vR4CO/cM0PgRDKLKE+eKRfgGJB3lzS6
	6NoRXVtnBD5FjMxFmio76ziR0jUOldF+W8mJOXHVI7SV6umhyNirwuFj9iWb7YUHKDrSowlOmuC
	IDYe6iUzO103QVNDI6RUIQkkRFpvMfLw=
X-Google-Smtp-Source: AGHT+IHymoFTpE0VemuGRZAWH2VyeEmGDgjl2npd4Xxrf1HM3gf6i9lmx5J4yXsxnXH2TOhTcQG67Wrs2yvvN78DNvc=
X-Received: by 2002:a05:6402:23c9:b0:634:c03f:c605 with SMTP id
 4fb4d7f45d1cf-639d5c75dbfmr12498031a12.36.1760168585660; Sat, 11 Oct 2025
 00:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn> <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com> <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
In-Reply-To: <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Oct 2025 15:42:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
X-Gm-Features: AS18NWBO_ZPqa7QTYu89pI0P7ab6zSJ33a0XruFytsPgVagYFaP8MLg8Jqce60M
Message-ID: <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

On Sat, Oct 11, 2025 at 3:29=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/10/11 =E4=B8=8A=E5=8D=8811:40, Ard Biesheuvel wrote:
> > On Fri, 10 Oct 2025 at 19:54, Huacai Chen <chenhuacai@kernel.org> wrote=
:
> >>
> >> On Sat, Oct 11, 2025 at 9:13=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongs=
on.cn> wrote:
> >>>
> >>> On 2025/10/11 =E4=B8=8A=E5=8D=8812:25, Ard Biesheuvel wrote:
> >>> ...
> >>>> Why do we need both (1) and (2)?
> >>>
> >>> Not both, either (1) or (2).
> >>> Which one do you prefer? Or any other suggestions?
> >>>
> >>> Taking all of the considerations in balance, we should decide
> >>> what is the proper way.
> >> As a summary, there are three methods:
> >> (1) Only link libstub with vmlinux.o during the final vmlinux link.
> >> (2) Remove the attribute __noreturn for real_kernel_entry() and add wh=
ile (1).
> >> (3) Ignore "__efistub_" prefix in objtool.
> >>
> >> Josh prefers method (1), I prefer method (3) but also accept method
> >> (1) if it is not only specific to loongarch.
> >>
> >
> > This is a false positive warning in objtool, which complains about a
> > function that falls through, even though that can never happen in
> > reality.
> >
> > To me, it is not acceptable to modify how vmlinux.o is constructed
> > also for other architectures, in order to hide some of its constituent
> > parts from objtool, which do not use objtool to begin with.
> >
> >
> > If you are not willing to fix objtool, I suggest fixing the loongarch
> > code like this:
>
> Thank you.
>
> > --- a/drivers/firmware/efi/libstub/loongarch.c
> > +++ b/drivers/firmware/efi/libstub/loongarch.c
> > @@ -10,7 +10,7 @@
> >   #include "efistub.h"
> >   #include "loongarch-stub.h"
> >
> > -typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdl=
ine,
> > +typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
> >                                            unsigned long systab);
> >
> >   efi_status_t check_platform_features(void)
> > @@ -81,4 +81,6 @@
> >
> >          real_kernel_entry(true, (unsigned long)cmdline_ptr,
> >                            (unsigned long)efi_system_table);
> > +
> > +       return EFI_LOAD_ERROR;
> >   }
>
> I tested the above changes, the falls through objtool warning can
> be fixed because efi_boot_kernel() ends with a return instruction,
> I think this is reasonable.
>
> efi_boot_kernel() has a return value, there are "return status" in
> other parts of efi_boot_kernel(), it should also return at the end
> of efi_boot_kernel() in theory, although we should never get here.
>
> If there are more comments, please let me know.
I still don't want LoongArch to be a special case, which means
efi_boot_kernel() in fdt.c, jump_kernel_func in riscv.c and
enter_kernel in arm64.c should also be modified.

Huacai

>
> Thanks,
> Tiezhu
>

