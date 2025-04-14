Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB48DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Zb/849ES3rQECOKKm4QFm3Dk6RHBGNbJvTLGQpVzfA=; b=iAojdBPVepszzjrbOv7tZkpjgN
	fiLZ1szAi9E5JFcljbUT5+1QnijsImN8LSph6OS2A5H9gCqwvpyD1YL00JQFYz2yjJDCfywIQqy8S
	+hG9LSMBxgTJIp5hnSPDXYoJp/XrBxHngr6S094EbUJIuCqeOqG44HRqaj9ACJ4NqUHP+Ws0YiY8o
	YgukUJqiaJ3/59nO/picNEZGQlz6+j1UcvbnJf34D3p5BxXJ4Z2oqkD4mPDJttfDjUiPEJ1v4bbyI
	T6DGF0iRBc5SzjbnAyOYE3JXhZJnmKlo1G4S7+VDn/CN+ELLilCgtIwjYocG8xzDShz+9rzXcCYyq
	2PAWGiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IyZ-00000001wxS-0zPi;
	Mon, 14 Apr 2025 12:31:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IvI-00000001wOw-3oph
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:28:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0659A49DAA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 12:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A63C4CEE2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744633703;
	bh=ixX+aTSMxs21n/o59hXTar0t+IatGCpyamxq2gI482w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TYnvjh6ZJJh9llFKwpdi2rKgaw/aYoo/5OTh8b2NPrW4idCos5cdlcW6JKzc6gVkK
	 GD6Kj0Jsu8JgDDZw399RmmKxlbPqVW5x3QyZ89JPIKCHueDRjPG7n0AUWtXk85FqBU
	 CKhI3RZg1+Ugqlv86MFOU3Rcd+IZuWWtA5+sR8ld9tamF0FNWyAssny1J+653Lat6F
	 s8soQWMXqWpNn8mV6CahGrV01EWubZy4mTyyvB2fr6aPO8Nwsk6Bwc7unU/1bHhOYu
	 88O3uOWfjRhk2YgSJcAZfm2XIJ6TfumCAAUqnX4eG9QbtC3+Y6n1GkkFs1d9MyZWkS
	 63wQQH8UvzORw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-548409cd2a8so5583915e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 05:28:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUN00rZrUW5ZdJ+1qw98S0RVF7iwqYGLqtlnTsiMJX0sWHVr/MZIeDAautnOpdj845RS5pa/9LDBK3MA29g7tiO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjh0/X/OWd0Ym83luQ517OfkoDWCeVJnz8/eNHl3kdImOU6Kw0
	UVHEGUCm/k4BWnlgmWREa2G4vOpnDznfa+Uvt7hFY01e4zntN2E7nrrWBGjCvIlNmvfz8ColNVY
	dpn+fzpj4y6yp2h0JSbWZadKeMGw=
X-Google-Smtp-Source: AGHT+IFzhIt2ejuDXn9Okk3Y8KB1rg/VBUn0uGKtytenAj+wyPYEIJ32ztqV+LpBKmoYT2VlQX5UZH28uiPnUCd19IA=
X-Received: by 2002:a05:6512:1310:b0:54a:cc11:a94c with SMTP id
 2adb3069b0e04-54d4528e98bmr4369914e87.3.1744633702098; Mon, 14 Apr 2025
 05:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
 <6e6305fd-3b93-43ec-8114-e81b2926adfc@arm.com> <CAMj1kXG5R1jVWLQ-XEcqF9U365T18pTW8u3DgC7OY4N53hchOA@mail.gmail.com>
 <16602b97-2f49-4612-9e9a-d6d0ed964fd3@arm.com>
In-Reply-To: <16602b97-2f49-4612-9e9a-d6d0ed964fd3@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Apr 2025 14:28:10 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEnmpu3Dc5zZz1aQJGVwEFwx=JdYisSFkDNjUJ44FjX9Q@mail.gmail.com>
X-Gm-Features: ATxdqUGG3syj4r4Drcn8JQR1d7j0A7RWn7_D18-LehW_FREU0x2VqOAPU1pcR_k
Message-ID: <CAMj1kXEnmpu3Dc5zZz1aQJGVwEFwx=JdYisSFkDNjUJ44FjX9Q@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_052825_092194_A6FCD286 
X-CRM114-Status: GOOD (  31.37  )
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

On Mon, 14 Apr 2025 at 14:04, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 14/04/2025 10:41, Ard Biesheuvel wrote:
> > On Mon, 14 Apr 2025 at 09:52, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 10/04/2025 08:40, Anshuman Khandual wrote:
> >>> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> >>> as expected if those macro constants contain some 128 bit layout elements,
> >>> required for D128 page tables. Fix this problem via first loading up these
> >>> macro constants into a given memory location and then subsequently setting
> >>> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
> >>
> >> From memory, the primary issue is that for D128, PIE_E[0|1] are defined in terms
> >> of 128-bit types with shifting and masking, which the assembler can't do? It
> >> would be good to spell this out.
> >>
> >>>
> >>> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >>> Cc: Will Deacon <will@kernel.org>
> >>> Cc: Mark Rutland <mark.rutland@arm.com>
> >>> Cc: Ard Biesheuvel <ardb@kernel.org>
> >>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>> Cc: linux-arm-kernel@lists.infradead.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >>> ---
> >>> This patch applies on v6.15-rc1
> >>>
> >>>  arch/arm64/kernel/head.S         | 3 +++
> >>>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
> >>>  arch/arm64/kernel/pi/pi.h        | 1 +
> >>>  arch/arm64/mm/mmu.c              | 1 +
> >>>  arch/arm64/mm/proc.S             | 5 +++--
> >>>  5 files changed, 14 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> >>> index 2ce73525de2c..4950d9cc638a 100644
> >>> --- a/arch/arm64/kernel/head.S
> >>> +++ b/arch/arm64/kernel/head.S
> >>> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
> >>>        * On return, the CPU will be ready for the MMU to be turned on and
> >>>        * the TCR will have been set.
> >>>        */
> >>> +     adr_l   x0, pir_data
> >>> +     bl      __pi_load_pir_data
> >>
> >> Using C code to pre-calculate the values into global variables that the assembly
> >> code then loads and stuffs into the PIR registers feels hacky. I wonder if we
> >> can instead pre-calculate into asm-offsets.h? e.g. add the following to
> >> asm-offsets.c:
> >>
> >> DEFINE(PIE_E0_ASM, PIE_E0);
> >> DEFINE(PIE_E1_ASM, PIE_E1);
> >>
> >> Which will generate the asm-offsets.h header with PIE_E[0|1]_ASM with the
> >> pre-calculated values that you can then use in proc.S?
> >>
> >
> > There is another issue, which is that mov_q tries to be smart, and
> > emit fewer than 4 MOVZ/MOVK instructions if possible. So the .if
> > directive evaluates the argument, which does not work with symbolic
> > constants.
>
> I'm not quite understanding the detail here; what do you mean by "symbolic
> constants"? asm-offsets.h will provide something like:
>
> #define PIE_E0_ASM 1234567890
>
> The current code is using a hash-define and that's working fine:
>
> mov_q   x0, PIE_E0
>
>
> Won't the C preprocessor just substitute and everything will work out?
>

Yeah, you're right. I was experimenting with something like

.set .Lpie_e0, PIE_E0_ASM
mov_q xN, .Lpie_e0

where this problem does exist, but we can just use PIE_E0_ASM directly
and things should work as expected.

