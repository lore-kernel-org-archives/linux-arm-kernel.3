Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A179CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 06:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6Fr4oz32+NqdyoP3pH6nFV3bpjn8HVSA5jqTQzf+PA=; b=E7AAH6y9KIpHj+de0c4ew2RVDw
	LjbjobMVFIuIyF8nzYgw2T1PK/55XN3akHtIZOtjmzmaEPuLK/QthXkJg1+oUKSi025N04CHtgIu8
	Mi+hENxmNpAa5+YWDqr7aOQOaotuwQkTBpMa0ABf7Q7VLiE+Ifo8ofdeid1G6hl5UlbBant+6WU9k
	Q9Wth/Zpnq3bywqXA33jyvz+1fYZeLjkK182N8c+26qdNgYxo8H8gV5gIfAnY+OQpFFg86OwGjlzb
	nlF0pfIBKhEMToneCe7ju/s6LjQ/BenFKHD0WCVa7ZJt8sbwXwEuz1c+hV4GiHAQHifwp0Srp1LiI
	GSM9DTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwajr-00000001DXY-0bYN;
	Thu, 11 Sep 2025 06:24:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwajp-00000001DXA-48P2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 06:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2494D60141
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CF9C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757571896;
	bh=LWISxWpZIWpayb7lXXH/jdmlK51vVZcbwDDS5/tVFd8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r+Bb9zpG0WNuifHbdn917sxYe4G7Q6CVr3RZuYgsWQxd6sQTnI+jiRMtCiMpzgz+l
	 Evi5xB/R44jOGxR+16dMvn0DjwdeRzppiLH9jRD7MTQZF8eTczmOv1pcJIRqMNdQa8
	 0NS8f6sKONLkfy6YRhziFLpjrqW42VXcFNeI6e9ILuy1ruX+z5rgxKGY8qE+OTrreT
	 UMyxKyWpub8WmQKplsRcxk8hLIqcwTQTy4K0DmmfeeVg1YWPtJgtnqh+h1TfXnamAZ
	 yMU5rCZvjI5dPnCiQsDZQlMGogGCZPKqkXK50XVhJcMnr3oEh0lZ8uZRV9+0qpKA0O
	 MUEIN2gYhnCpg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-33c9efd65eeso3213721fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 23:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQ8N2H9SuDQ1dNAoNJ59dVoDvffYLYnTdKYcPQ+vadEdFNb6Foc0ZhqLAYIouGDfzgozCfjROXitggQKjnccn5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw37en29PvKp5VpOiGgqdz//D3NEQ0DyqW9afdB/J/l05Ev/dlc
	ehPu/U5oyf3/5PeLjX6iWnW68NnCIA7NK0z14GoHe0uqf5BeYDWyoyD7YDLV6IBwwqJOihYF1Pk
	z4Cuy0CZ26MsjYLKuVEXNPpr3VyBx98g=
X-Google-Smtp-Source: AGHT+IG29ahrAP8GFbMhC5SlNYOdpYF2cGBGuOOogKOlf0rutSht7MwWOV0kTpYrOZDoYWwhMGpLaYSS4D9ns3F7NW8=
X-Received: by 2002:a2e:b8c1:0:b0:337:f217:a785 with SMTP id
 38308e7fff4ca-33b5cbcec6amr58212641fa.23.1757571895136; Wed, 10 Sep 2025
 23:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250910104454.317067-1-kevin.brodsky@arm.com>
 <41f3227e-b945-4303-90b7-732affb0a101@arm.com> <CAMj1kXEmfCHpssFjn_+4ZjKCUaWPeiVwznCpGumTfz33k-rfkg@mail.gmail.com>
 <f8c268ce-798a-4d3a-bab2-16eea633f9db@arm.com>
In-Reply-To: <f8c268ce-798a-4d3a-bab2-16eea633f9db@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 11 Sep 2025 08:24:44 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHDKGsaOn96zecba=-6Bib0SVYs=voMr5DLjWOn_qAqAQ@mail.gmail.com>
X-Gm-Features: Ac12FXzciR3IyG7PAaM9LIGz6dBGdo1fkr-R21kJeV_W4pyF-M5kwwVrYSYE318
Message-ID: <CAMj1kXHDKGsaOn96zecba=-6Bib0SVYs=voMr5DLjWOn_qAqAQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: Move KPTI helpers to mmu.c
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 11 Sept 2025 at 08:18, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 11/09/25 11:38 AM, Ard Biesheuvel wrote:
> > On Thu, 11 Sept 2025 at 07:13, Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> >>
> >>
> >>
> >> On 10/09/25 4:14 PM, Kevin Brodsky wrote:
> >>> create_kpti_ng_temp_pgd() is currently defined (as an alias) in
> >>> mmu.c without matching declaration in a header; instead cpufeature.c
> >>> makes its own declaration. This is clearly not pretty, and as commit
> >>> ceca927c86e6 ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
> >>> function signature") showed, it also makes it very easy for the
> >>> prototypes to go out of sync.
> >>>
> >>> All this would be much simpler if kpti_install_ng_mappings() and
> >>> associated functions lived in mmu.c, where they logically belong.
> >>> This is what this patch does:
> >>> - Move kpti_install_ng_mappings() and associated functions from
> >>>   cpufeature.c to mmu.c, add a declaration to <asm/mmu.h>
> >>> - Make create_kpti_ng_temp_pgd() a static function that simply calls
> >>>   __create_pgd_mapping_locked() instead of aliasing it
> >>> - Mark all these functions __init
> >>> - Move __initdata after kpti_ng_temp_alloc (as suggested by
> >>>   checkpatch)
> >>>
> >>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> >>> ---
> >>> Note: as things stand, create_kpti_ng_temp_pgd() could be removed,
> >>> but a separate patch [1] will make use of it to add an
> >>> assertion.
> >>>
> >>> [1] https://lore.kernel.org/all/20250813145607.1612234-3-chaitanyas.prakash@arm.com/
> >>> ---
> >>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> >>> Cc: Ard Biesheuvel <ardb@kernel.org>
> >>> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >>> Cc: Kees Cook <kees@kernel.org>,
> >>> Cc: Mark Rutland <mark.rutland@arm.com>
> >>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> >>> Cc: Will Deacon <will@kernel.org>
> >>> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> >>> ---
> >>>  arch/arm64/include/asm/mmu.h   |   6 ++
> >>>  arch/arm64/kernel/cpufeature.c |  97 ------------------------------
> >>>  arch/arm64/mm/mmu.c            | 106 ++++++++++++++++++++++++++++++---
> >>>  3 files changed, 103 insertions(+), 106 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> >>> index 49f1a810df16..624edd6c4964 100644
> >>> --- a/arch/arm64/include/asm/mmu.h
> >>> +++ b/arch/arm64/include/asm/mmu.h
> >>> @@ -104,5 +104,11 @@ static inline bool kaslr_requires_kpti(void)
> >>>       return true;
> >>>  }
> >>>
> >>> +#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
> >>> +void kpti_install_ng_mappings(void);
> >>
> >> Could the declarations be moved here instead ?
> >
> > Why?
>
> To avoid both typedef and external instance declaration in the C
> code even though there is just a single call site in there.

But why would we want to avoid those in the first place?

Moving these into mmu.h pollutes the global namespace with
declarations that must never be used outside of
__kpti_install_ng_mappings() to begin with.

> Also
> is not bit cleaner as well ?

That is highly subjective, but personally, I think it only adds confusion.

