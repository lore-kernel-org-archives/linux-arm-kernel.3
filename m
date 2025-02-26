Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17839C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 07:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmXWalbpprqBCVzO3Bmp8d+Bc7VgYMPM6QfTNbKsvvk=; b=ACjWxtCfk1L4gCAcSQwWi3wFY3
	TOnsbpznPgw31zwOTAZGRnXuhlFR4hTDFoZ9esSnJELUDCg2HnZJPfOm2vIw/7noH8/ESULF0EXr/
	5Pij4kns3HMO+RweQ2rOfucuyYra6n0WC3s22NkM/+U44Md3vBXCRHLhrwT/dyTcxK51CSkM+myyQ
	nUfHJZu2Ve/EKqQCFXAcdkJ/5hbQE2NO6rR3AD4brR6kvx1UUDefhXNHZ5rf14XGLNvQLLVT2tQDz
	F94DxZJUI5AuiTtISytqKtS2Ha2nASLjDRHmF6riXPS/ejzxLdajBvuDYb5F6P1tRTpJgB39hInlO
	JnAM5yxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBSU-00000002dBE-1RX5;
	Wed, 26 Feb 2025 07:03:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBO3-00000002cGD-0ti8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 06:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 972165C5E67
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 06:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33575C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 06:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740553158;
	bh=i9Fh231eCe1o+vaJqKd1MErsCQbbRl1mPJHwK4j7QBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AXK4vy1LwYhBChoXfW23LDo4vF6/2ffz0uzQ/kP5L2sRLeULr7HSQqOHtA8zg3icH
	 ftlH3piK+uW5c20avYuc5dv7ETk6FhvEf2Xr9mA0uc4BdWAJmwJKpI92nn0Jd6/S0u
	 P2IOYyy/rT+yxbkrmnggjaTodMqGsDO4qstIb9pJNnE0d4lQ/nzUHCtikqp9UYduJk
	 xYepJ/49nOZf0VwbZY9t2WMxWH/Lj+qEX77xGGRifP57trg7p/PnyvVmxP/Zo0E/aa
	 f+JXYZRcSpElJe/Kcj8PPtUGLh09OxNJ5Ip/ja4jJbIHdhTJGUuZ2G33fSQAh6JJic
	 kykcDlHRfiqGQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30737db1ab1so52863061fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 22:59:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUed0P8M+IRrQ8k7jTIy1cqpgjyrDpxyknbaItodD2qKw1fnkx8RX7+hs9JE6dxlDPRvyUr5YHmSJtakxN2YH2S@lists.infradead.org
X-Gm-Message-State: AOJu0YyYKdN6gx9IGTFUs4DT2dd3uGl7nXvMuc8J//FX/iTPXjfhNMWY
	c4KlZEzPJ5FSnZHrqFn9FXfLTqvmz1JX2OV8jIe7c2jmBZO1Uz7EArWerE83WW+1LgLXIik/O/S
	/E8E/DfRcKTklkrzeKBmSbl/fB5Y=
X-Google-Smtp-Source: AGHT+IGJUHQ0oCfCacezzvAX7nE8+L56RS5OfdIe8o1rSXaBLume4oTSoD0StSwo7SIgHIipD4oFTbz/3EcuVlFmdaw=
X-Received: by 2002:a2e:9ac6:0:b0:308:e9ae:b5a1 with SMTP id
 38308e7fff4ca-30a5b171680mr71421791fa.2.1740553156558; Tue, 25 Feb 2025
 22:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
 <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com> <20250226001047.GA24197@willie-the-truck>
In-Reply-To: <20250226001047.GA24197@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 26 Feb 2025 07:59:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH=tPuM+irCsKgycUTbts8h9vD4m3tEtw51YFzWafdSUA@mail.gmail.com>
X-Gm-Features: AWEUYZl2QSSVv7QzbSm03vo1Ancy8Ooa7VLWsuo79PHpgXlIEoyJxiWGc6pBfF4
Message-ID: <CAMj1kXH=tPuM+irCsKgycUTbts8h9vD4m3tEtw51YFzWafdSUA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
To: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Luiz Capitulino <luizcap@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_225919_439481_721D8F05 
X-CRM114-Status: GOOD (  39.22  )
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

On Wed, 26 Feb 2025 at 01:10, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Feb 25, 2025 at 07:05:35PM +0100, Ard Biesheuvel wrote:
> > Apologies for the breakage, and thanks for the fix.
> >
> > I have to admit that I was a bit overzealous here: there is no point
> > yet in using the sanitised value, given that we don't actually
> > override the PA range in the first place. This is something I've
> > prototyped for Android use, so that linear map randomization can be
> > force enabled on CPUs with a wide PArange, but right now, mainline
> > does not have that capability, and so I'd be inclined to just revert
> > the hunk that introduces the call to read_sanitised_ftr_reg() into
> > arm64_memblock_init(), especially given the fact that commit
> > 62cffa496aac was tagged for stable, and was already pulled into 6.13
> > and 6.12
> >
> > In any case, it would be good if we could get a fix into Linus's tree asap
>
> Makes sense. So the patch below?
>

Yes, but please don't forget the cc:stable

To the patch below,

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> --->8
>
> From b76ddd40dd6fe350727a4b2ec50709fd919d8408 Mon Sep 17 00:00:00 2001
> From: Ryan Roberts <ryan.roberts@arm.com>
> Date: Tue, 25 Feb 2025 11:46:36 +0000
> Subject: [PATCH] arm64/mm: Fix Boot panic on Ampere Altra
>
> When the range of present physical memory is sufficiently small enough
> and the reserved address space for the linear map is sufficiently large
> enough, The linear map base address is randomized in
> arm64_memblock_init().
>
> Prior to commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and
> use it consistently"), we decided if the sizes were suitable with the
> help of the raw mmfr0.parange. But the commit changed this to use the
> sanitized version instead. But the function runs before the register has
> been sanitized so this returns 0, interpreted as a parange of 32 bits.
> Some fun wrapping occurs and the logic concludes that there is enough
> room to randomize the linear map base address, when really there isn't.
> So the top of the linear map ends up outside the reserved address space.
>
> Since the PA range cannot be overridden in the first place, restore the
> mmfr0 reading logic to its state prior to 62cffa496aac, where the raw
> register value is used.
>
> Reported-by: Luiz Capitulino <luizcap@redhat.com>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Closes: https://lore.kernel.org/all/a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com/
> Fixes: 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and use it consistently")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Link: https://lore.kernel.org/r/20250225114638.2038006-1-ryan.roberts@arm.com
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/mm/init.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 9c0b8d9558fc..ccdef53872a0 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -279,12 +279,7 @@ void __init arm64_memblock_init(void)
>
>         if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
>                 extern u16 memstart_offset_seed;
> -
> -               /*
> -                * Use the sanitised version of id_aa64mmfr0_el1 so that linear
> -                * map randomization can be enabled by shrinking the IPA space.
> -                */
> -               u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
> +               u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
>                 int parange = cpuid_feature_extract_unsigned_field(
>                                         mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
>                 s64 range = linear_region_size -
> --
> 2.48.1.658.g4767266eb4-goog
>

