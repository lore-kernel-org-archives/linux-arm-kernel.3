Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58CFD10DDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCfOV4fgdi+7qA9vu3IQXUPdqS2eY6MNKCm9Jq9uOm0=; b=aVo7Zmbham7AgO3ArMTmvNJ6Ao
	SWcNelTjgE2QR+f4wzhdQfbd9yZbf0q9jBq4Uz4vFUVBbDIxGeCemHc9sJJpIRscLn3x8GsfF2IrS
	aHQcSlCjjdR8XVKhj3nwedBaeBb15sT/SeIUZh1kk1alb7DodLmyJwZNWSKf22IWxyfYr/9Nd/mfz
	RcpmwiN7rdwJSTaGM/3/qz+XedN54eBfGGZuGYbsLXzfyOVd9UP0D0ap0el7WAk28ESHcTK/P35Ae
	0DKVc3qeQ49zm02OuyF52iC/0fG/Ykazmi5/y+7xbL2/zlH1DlX/d1Fhbb2kCD0hltBCBPaWCLx3J
	Hp3QqgUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3GJ-00000005ehy-3edv;
	Mon, 02 Dec 2024 10:02:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3FE-00000005eSb-3pAu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 10:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0BE95C67E9
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Dec 2024 10:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFED2C4CED1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Dec 2024 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733133691;
	bh=Twzy5O/7e/TnnFaz97lCq4W6R1qv7ZP6CBG1FCn0gys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rcyJI9m3ykA6ZtrNpdF+lhVGu5IvufUSSEfEKVAOikTgShTvKErVkgV21MjYAFNXO
	 qRBytU/W7/J0E3JXgp9jaZajQ5414bM1Z/vsxcM2g8b0+xPh/L7Xj0XmLHU0gMxBZ7
	 fvIqaii79+l7Sg10zj50s7lSjrUAeiZYNGqk8K9UiiTfneVdl/k2lJSGDmIMNP2XSq
	 PP3oR7eqggAofpU9l+Kyyv8RMSh6ejxLOsxL5niTgj1iwKZlA8CW7FC+JlSSK+ppS5
	 2uIXfIVBvcwggXluQnTJwIJv7tGPX9MGzz7gAfGVk2nH+Xd5WQHAoBt9qa8SyclfBG
	 LOcgAfXR4T1wA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffd6882dcbso31648061fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 02:01:31 -0800 (PST)
X-Gm-Message-State: AOJu0Yx8SBxcH80wYAkfZfFppWq2sfOTp7uM9vMC8TCp2WOd28xujtol
	tCuSbbEf3JQgl6QQ/QX1B4zqSDb44k7EgDH8UYfPEaf1OtfhTUxhsTCz7lZfQ3O/CE+nBQz3oxA
	RvVROWyvDR1KGbPCxs0oSbJZqXFU=
X-Google-Smtp-Source: AGHT+IFVat+c+J7F0U+ulBavPviZFzk0YTK+UMlqTQSIoOaRkzhHNFubZtaueag5yYSMkQexIoToQuyrzoKIDatOxsg=
X-Received: by 2002:a2e:bd04:0:b0:2ff:ce49:111e with SMTP id
 38308e7fff4ca-2ffd60fad19mr74658641fa.39.1733133689960; Mon, 02 Dec 2024
 02:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20241202043553.29592-1-anshuman.khandual@arm.com>
In-Reply-To: <20241202043553.29592-1-anshuman.khandual@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 2 Dec 2024 11:01:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGPcMYsJV9w_fBXEyxUJFGZhSpn2etWie9wKA_HS3kF_g@mail.gmail.com>
Message-ID: <CAMj1kXGPcMYsJV9w_fBXEyxUJFGZhSpn2etWie9wKA_HS3kF_g@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Drop INIT_MM_CONTEXT()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_020132_992457_FA50C7B0 
X-CRM114-Status: GOOD (  19.41  )
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

On Mon, 2 Dec 2024 at 05:36, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> Platform override for INIT_MM_CONTEXT() is redundant because swapper_pg_dir
> always gets assigned as the pgd during init_mm initialization. So just drop
> this override on arm64.
>
> Originally this override was added via the 'commit 2b5548b68199 ("arm64/mm:
> Separate boot-time page tables from swapper_pg_dir")' because non standard
> init_pg_dir was assigned as the pgd. Subsequently it was changed as default
> swapper_pg_dir by the 'commit ba5b0333a847 ("arm64: mm: omit redundant
> remap of kernel image")', which might have also just dropped this override.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
> This patch applies on v6.13-rc1
>
>  arch/arm64/include/asm/mmu.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 2ec96d91acc6..662471cfc536 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -109,8 +109,5 @@ static inline bool kaslr_requires_kpti(void)
>         return true;
>  }
>
> -#define INIT_MM_CONTEXT(name)  \
> -       .pgd = swapper_pg_dir,
> -
>  #endif /* !__ASSEMBLY__ */
>  #endif
> --
> 2.30.2
>

