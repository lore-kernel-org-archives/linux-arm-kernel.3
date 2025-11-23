Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B08CFD314
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 02:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40psYmaMGOHzDtemH6ciDxO9u3BIB4CHqs4HyP5IX+U=; b=GaysNEWtVM/AYdrz+TNoavfEC8
	QSWsSLaPacTrYdSEk2uI+akdIDQ4MrAQ87ffx4TEOf9PQOpj1ae7jfveV/AzHZHDv31E+F3sKml8v
	SxZEJ0Al9AtfXHaNaAH83TqNuH+b+Bv9robHT57hI6KH0BjrnfBFjbNDw9fl+pMst+vrUfJQAbC3N
	DtY/PE0wMUnFkRGSZeAIvFaKcspRqdowxq2cm2zNin9971tFt1UoEloU+nQW1fIt6P/Et/Kfq/bQw
	pt1Ofszf9iztdTH92wVuRVmz3t5P2NoXK+R2xnijGrEmodPmusxZK+rvYc/0y6euG8Sbtkz+DCk5U
	0I5XtjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMzqf-0000000A3uc-17JL;
	Sun, 23 Nov 2025 02:29:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMzqd-0000000A3tf-0wNf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 02:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 704554346B
	for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 02:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418D1C116D0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 02:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763864941;
	bh=5/gE9+3vHOoB1f8yml6mnDnZO5OsQRxggIUPttmfMEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lSkynLBVL7qbBWmP7VIrRx09zE8Ng0gBmoadl+PInPMq+4lFWJmeMmAgdjGxGV9Q4
	 nMmQsSLfPGz283G1TBASqmUaA0hSUvc7EuBSpcxU2UzLEW2mvUpAhkP26dcAcwu0C1
	 bFOYmIVd/0XCG4sQbdwGEywoIYs4WXHc6eHigLBK/MFXyBCSIhfmHU4SKMnb3PW03p
	 VC1UGiJ7B5n0YlLVsgWG6v3Wf5fSoRR0MvHnIKxmC+rxkO6N6LdLBck0MU0MuNzlJo
	 y2F0FO4XTTyBGU+G7dFmuiEOrFBgptYD0gG9hMFRjg93a/mlLse1zNSvIY0mYYjpDQ
	 B3+DHfCj797ww==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b71397df721so577486066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 18:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVzKn0A2pwnHBzHs6W7PNINczPrP760mIp7z9Lf4VY5Z9LmcukMa5Z3dCQ4hevGTlJH62QA5aWS8XRSjmuNDV/@lists.infradead.org
X-Gm-Message-State: AOJu0YyuH2jJh7nkBQQYhyck09kX4351+EAu4br1R14byJPCB16Vv8Iw
	AOsFueNKHrF2dniRZb9vNmDxzOSaX2NXmoJnRnD83y25XU81hEoe8/mlsrG1xzeUIGBIE7OzTms
	a6pdK1Z8KcQx0eGg/0PvOQZiYkQJU11o=
X-Google-Smtp-Source: AGHT+IF2NG45CGhewRb+YxxwCpQ+Qs09Wv1Cd6UcCR2RSlep4aU6EwJEltWefiEmVuOu3WrO2PpFhIzvWqq/mYqO3k4=
X-Received: by 2002:a17:907:7f1e:b0:b70:b077:b957 with SMTP id
 a640c23a62f3a-b767158cd7amr622544566b.15.1763864939736; Sat, 22 Nov 2025
 18:28:59 -0800 (PST)
MIME-Version: 1.0
References: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
 <aRsH7RTpAah4g5Xr@willie-the-truck> <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
 <39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn>
In-Reply-To: <39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 23 Nov 2025 10:29:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fHBuRpDEDQrExApgnREJaT8JWUJ2700bEPFxDqToi2w@mail.gmail.com>
X-Gm-Features: AWmQ_bmAZrJIPzwBoGQGazI9CFQ9PH-O_LgSCm_k_cIQ90BdG2Wz9hDhqi3Uewg
Message-ID: <CAAhV-H4fHBuRpDEDQrExApgnREJaT8JWUJ2700bEPFxDqToi2w@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, Ard Biesheuvel <ardb@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_182907_337089_EF90C956 
X-CRM114-Status: GOOD (  37.36  )
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

On Sat, Nov 22, 2025 at 7:04=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Cc: Nathan Chancellor <nathan@kernel.org>
>
> Hi all,
>
> On 11/21/25 22:36, Huacai Chen wrote:
> > On Mon, Nov 17, 2025 at 7:33=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> >>
> >> On Sat, Nov 15, 2025 at 11:16:42AM +0800, Huacai Chen wrote:
> >>> On Wed, Nov 12, 2025 at 2:00=E2=80=AFAM Josh Poimboeuf <jpoimboe@kern=
el.org> wrote:
> >>>>
> >>>> On Mon, Nov 10, 2025 at 03:00:00PM +0800, Huacai Chen wrote:
> >>>>> On Mon, Nov 10, 2025 at 9:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loo=
ngson.cn> wrote:
> >>>>>> If I understand correctly, I should modify this patch to remove th=
e
> >>>>>> changes of arm and riscv for now, do the changes only when there i=
s
> >>>>>> a real problem or requirement some day, right? If no more comments=
,
> >>>>>> I will send v3 later.
> >>>>>
> >>>>> Now everyone involved agrees that the efistub code is correct, so t=
he
> >>>>> proper solution is to fix the compiler.
> >>>>
> >>>> Hm?  I don't see how it's a compiler bug.  It's really just an objto=
ol
> >>>> limitation.
> >>>>
> >>>>> Changing efistub code and changing objtool (ignore __efistub prefix=
)
> >>>>> are both workarounds, but I think changing objtool is a little more
> >>>>> reasonable. Maybe Josh has different ideas?
> >>>>
> >>>> I thought the conversation had converged on what Tiezhu mentioned ab=
ove,
> >>>> which is to skip objtool on libstub for loongarch, but leave the oth=
er
> >>>> arches alone.  That way objtool behavior is consistent between loong=
arch
> >>>> and x86, and objtool doesn't need to ignore any prefixes.
> >>>>
> >>>> So basically, the v2 patch minus the arm64/riscv changes.
> >>>
> >>> Hi, ARM64 and RISC-V maintainers,
> >>>
> >>> Would you mind that this patch modifies the three architectures
> >>> together (they are exactly the same style now)?
> >>>
> >>> Madhavan is the author of ARM64's objtool, I think your opinion is
> >>> also very important.
> >>
> >> arm64 doesn't (yet) use objtool.
> >>
> >> I defer to Ard on anything relating to the arm64 efistub. Reading the
> >> start of this thread, it doesn't look like he's convinced and I'm not
> >> surprised if it's purely an issue with objtool.
> > OK, I know, but I have a concern.
> >
> > Ard said that he is reluctant to make changes to accommodate a flawed
> > build time tool and there may be regression risk.
> >
> > So, I'm also reluctant and don't want LoongArch to meet regression
> > risk. If one day LoongArch has a regression, we probably need another
> > workaround to "fix" this workaround. But if these three architectures
> > change in the same way, we may have a chance to solve some fundamental
> > problems...
>
> IIUC, Josh do not like to ignore these EFISTUB functions in
> validate_branch() of objtool, Huacai do not like to only link
> libstub to vmlinux only for LoongArch.
>
> It seems that there is only one way to fix or workaround this
> problem, remove the attribute __noreturn for real_kernel_entry()
> and then make efi_boot_kernel() ends with a return instruction [1]
> or an unconditional jump instruction [2] that only touches
> drivers/firmware/efi/libstub/loongarch.c.
>
> Since this is a issue only for LoongArch by now, what do you
> think of this minimal change only for LoongArch libstub code?
> Using "return EFI_LOAD_ERROR" [1] or "while (1)" [2]?
>
> Maybe this is the simple and direct way for this special issue
> only on LoongArch so far. If not, any other suggestions?
>
> On the other hand, is it possible to add KBUILD_VMLINUX_LIBS_FINAL
> and then use it only for LoongArch first [3]? Any potential risks?
>
> What is the next step?
Is it possible to improve objtool that can handle indirect __noreturn funct=
ions?
Is it possible to improve objtool that can handle
OBJECT_FILES_NON_STANDARD event LTO is enabled?
Is it possible to improve objtool that only ignore __efistub prefix
for LoongArch?


Huacai

>
> [1]
> https://lore.kernel.org/loongarch/CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Q=
d8vrSPBLK+yg@mail.gmail.com/
> [2]
> https://lore.kernel.org/loongarch/20250826064631.9617-2-yangtiezhu@loongs=
on.cn/
> [3] https://lore.kernel.org/loongarch/20251122000101.GA1996391@ax162/
>
> Thanks,
> Tiezhu
>

