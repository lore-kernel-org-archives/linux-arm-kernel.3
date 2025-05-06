Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A373C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJCdOEX9npcrrI3pHIipR/34YDkxI4EiMr3JVDulqjY=; b=duA1xgCyVODZWzDeD9PPr946Jm
	QNQ1iOzvQ2tvpRVy0fqqa5FSLWB65b8irZUPXDbhyi1MIltEXiC4ZRMvo1nTZ7YIvJkCpZ3fn2D+7
	SEUT1MOmyEEAEzTWyTOaSfpvZJKNLufp79vljjrI3ORibgpaVbPQphHhkmaoxzIMxgqGt1eBmGARe
	05GcKEW5Aitsftxql+XB9Cin4HWTU5AORoX7zveI7BJ6oSyVU23Dez9qOhB4NdBNdUvtR3FJhB/gy
	pK3Fc36RIeDfKf6fPntNcA3+64PzWs9a/TFkFXsW9qBE5lsxhPYuyfq0dQ1gec6DzjUxM4bOxrWNU
	CdMrWZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGKe-0000000Bi0o-2N6s;
	Tue, 06 May 2025 11:19:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEnf-0000000BQU9-19hH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:41:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65768A4B7C0
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 May 2025 09:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17037C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 May 2025 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746524478;
	bh=br72ww44nN9vuAjzP+3KW+ZVFIk7/0bblmuQ7sdKp3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C7kAkwfXVBJgJLjRZHUyukIyhm03dtJAasR/1UdcHz+JzfvPuMhC32t33R51WK/Qg
	 P7uNYYLu2hzyCMjbRsD05nI852tLfx9s3uiQutpvdCoJYDUth/bzLlz5jlyHeO359x
	 Lp2RWOKnOXJFgai/zCGcQpN8XShh6xdhOefiROEncGCzfTNf8P08Sim6d1G9rNK419
	 sA08qCHEUpJVENk1wkgAbNx+ZvQhC4IvzIMaUXa7eFeDhrqYf46z0CY78C1DXXhZZb
	 hPmFzEl/VtK8/Y5scGLWPd717pb2TyxWIThqS2aXcgexjuUW/t6KWRI6YAm8QytKDo
	 ttUxIoJgWmXWA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549963b5551so6026907e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlPKhDeceUOUDaCoukF0E+npI1RfCjbFoPv8/npwsKtE42fvU5jewPwwUfc2UiIg7De6vxMZtVnMbfNdJ2zeeJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyBsznh9LoDlxO6inXOhopsX+Ws3Up20MhH4AZGNbNFsfiOuOvS
	3PmEE+LxiiR/KIsT8SExssiRCQbvQQA41QbFbeP6JnTedaeM606D/DwTvqI4Q+u10PVbqeGF8c4
	8nPR/7NWGxRLXV7sgfJQOfI0j9hk=
X-Google-Smtp-Source: AGHT+IEjeZbst1pQGA92OmhjPfI/oOusUk2csD0mgQFEIaa7RUAqCWbSuTrzE+pZLh2YflGxsAOAY9FTC9nE+zZ0n6I=
X-Received: by 2002:a05:6512:a85:b0:545:2300:9256 with SMTP id
 2adb3069b0e04-54fb4a30ea0mr751630e87.12.1746524476461; Tue, 06 May 2025
 02:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250502180412.3774883-1-yeoreum.yun@arm.com> <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
 <aBYkGJmfWDZHBEzp@arm.com> <aBZ7P3/dUfSjB0oV@e129823.arm.com>
 <aBkL-zUpbg7_gCEp@arm.com> <aBnDqvY5c6a3qQ4H@e129823.arm.com> <fbfded61-cfe2-4416-9098-ef39ef3e2b62@arm.com>
In-Reply-To: <fbfded61-cfe2-4416-9098-ef39ef3e2b62@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 May 2025 11:41:05 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFAYDeCgtPspQubkY688tcqwCMzCD+jEXb6Ea=9mBcdcQ@mail.gmail.com>
X-Gm-Features: ATxdqUF3rsIatyGROlcnz-MTnOMfbB4SgCxO0t-VeVXO3pVmMlbooW1DvC6xzx4
Message-ID: <CAMj1kXFAYDeCgtPspQubkY688tcqwCMzCD+jEXb6Ea=9mBcdcQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, broonie@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, 
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com, 
	hardevsinh.palaniya@siliconsignals.io, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_024119_441135_D4EC4235 
X-CRM114-Status: GOOD (  28.05  )
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

On Tue, 6 May 2025 at 10:16, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 06/05/2025 09:09, Yeoreum Yun wrote:
> > Hi Catalin,
> >
> >> On Sat, May 03, 2025 at 09:23:27PM +0100, Yeoreum Yun wrote:
> >>> Hi Catalin,
> >>>
> >>>> On Sat, May 03, 2025 at 11:16:12AM +0100, Catalin Marinas wrote:
> >>>>> On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
> >>>>>> create_init_idmap() could be called before .bss section initialization
> >>>>>> which is done in early_map_kernel().
> >>>>>> Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
> >>>>>>
> >>>>>> PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
> >>>>>> and this variable places in .bss section.
> >>>>>>
> >>>>>> [...]
> >>>>>
> >>>>> Applied to arm64 (for-next/fixes), with some slight tweaking of the
> >>>>> comment, thanks!
> >>>>>
> >>>>> [1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
> >>>>>       https://git.kernel.org/arm64/c/12657bcd1835
> >>>>
> >>>> I'm going to drop this for now. The kernel compiled with a clang 19.1.5
> >>>> version I have around (Debian sid) fails to boot, gets stuck early on:
> >>>>
> >>>> $ clang --version
> >>>> Debian clang version 19.1.5 (1)
> >>>> Target: aarch64-unknown-linux-gnu
> >>>> Thread model: posix
> >>>> InstalledDir: /usr/lib/llvm-19/bin
> >>>>
> >>>> I didn't have time to investigate, disassemble etc. I'll have a look
> >>>> next week.
> >>>
> >>> Just for your information.
> >>> When I see the debian package, clang 19.1.5-1 doesn't supply anymore:
> >>>  - https://ftp.debian.org/debian/pool/main/l/llvm-toolchain-19/
> >>>
> >>> and the default version for sid is below:
> >>>
> >>> $ clang-19 --version
> >>> Debian clang version 19.1.7 (3)
> >>> Target: aarch64-unknown-linux-gnu
> >>> Thread model: posix
> >>> InstalledDir: /usr/lib/llvm-19/bin
> >>>
> >>> When I tested with above version with arm64-linux's for-next/fixes
> >>> including this patch. it works well.
> >>
> >> It doesn't seem to be toolchain related. It fails with gcc as well from
> >> Debian stable but you'd need some older CPU (even if emulated, e.g.
> >> qemu). It fails with Cortex-A72 (guest on Raspberry Pi 4) but not
> >> Neoverse-N2. Also changing the annotation from __ro_after_init to
> >> __read_mostly also works.
>
> I think this is likely because __ro_after_init is also "ro before init" - i.e.
> if you try to write to it in the PI code an exception is generated due to it
> being mapped RO. Looks like early_map_kernel() is writiing to it.
>

Indeed.

> I've noticed a similar problem in the past and it would be nice to fix it so
> that PI code maps __ro_after_init RW.
>

The issue is that the store occurs via the ID map, which only consists
of one R-X and one RW- section. I'm not convinced that it's worth the
hassle to relax this.

If moving the variable to .data works, then let's just do that.

