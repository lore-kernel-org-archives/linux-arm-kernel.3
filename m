Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CFECDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 18:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXOJcvTfcC5wYfydFyRRaEzbgWkB/S2xS9djZ0UOv34=; b=sqb1yQ/1hTsSViBCukbe+25sgl
	H20Pl13lOA51NfBpJhDic7sWhdc2PwVIM2voYij/DuV0n0B+zMxTCfQO2EpPQWBHvgDFb6+D+BGK2
	5z0n+Fe6u02Wauc7ZUWMRtCfiYbpljs0LEs+BAHIKtyQlZ6GMoumkT5SLhJjF3GLbld3erhi9j7ma
	o2T8FfS/qW9w08MIezDqmxrkW8FFTdmzDO/bKM3tSS0Yycd4uKvl0zYUIg7Ju53ZcBlf+tRzU4MMj
	NwPcMPOaM7IkXY4dZ7LjC9tnHBC+XjI5tvvUgNd3i/wLbhckt1q1n5EZXpFli1beD+WzRZ7yl4sPA
	JsH1WVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjAQ-00000005Hwh-0Jj6;
	Mon, 22 Jun 2026 18:14:42 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjAM-00000005HwB-1hrs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 18:14:40 +0000
X-Gm-Message-State: AOJu0Yw996rUFuCPP6naEb3Xymz39nZ0glx90B2125UgNW7GhY+hjEIA
	rJWRxW3mOU0enjmEJaPqXLog755p/YToKXWJ6NQ8e4YDWeQXJ7XxGpcjOFhYOnp5EUDI4WHKP8e
	Ar0hj638H/slGvV9sp3MPVB/Df8fWeBpFBrXbuoan
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782152074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TXOJcvTfcC5wYfydFyRRaEzbgWkB/S2xS9djZ0UOv34=;
	b=jXTlxiwTdxLwVDK7ZZ3xl6pP6LeTq+L/AAB0J1h7MtQYA6VwJPLbK4AU98BlSwFnQ8Tc43
	omKTxR3+AHoMm8JbiElkF1GIjL/U7eXk/ZiG/sU9DeLTy8a7tQ52xqx2eK//EnKyAp7bEQ
	gGk8BYO+aHGoRDkC9T6Aoo7qgeM6cAs=
X-Received: by 2002:a05:622a:4d0d:b0:516:4f62:85e6 with SMTP id
 d75a77b69052e-51a526caf93mr617831cf.17.1782152053951; Mon, 22 Jun 2026
 11:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260619163940.3185308-2-ardb+git@google.com>
In-Reply-To: <20260619163940.3185308-2-ardb+git@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 22 Jun 2026 19:13:36 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxBZtg4E_Hpx2-c9aPSSpb4uhrZFaWdS8TUu7PhRC-ghQ@mail.gmail.com>
X-Gm-Features: AVVi8CefQ8oEotJsc6r7muhCaiTAZn-o-DIbGzF6c2XkKXe41E-rVljE4mgUXV4
Message-ID: <CA+EHjTxBZtg4E_Hpx2-c9aPSSpb4uhrZFaWdS8TUu7PhRC-ghQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: Defer read-only remap of data/bss linear alias
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_111439_063235_B640D794 
X-CRM114-Status: GOOD (  22.25  )
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

On Fri, 19 Jun 2026 at 17:40, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Fuad reports that in some cases, the KVM init code may apply relocations
> to variables that reside in .data, and does so via the linear map. This
> means that remapping .data read-only beforehand is a bad idea, and
> results in an early boot crash.
>
> These variables in .data are only present when CONFIG_NVHE_EL2_DEBUG or
> CONFIG_NVHE_EL2_TRACING are enabled, which is why it was not spotted in
> testing.
>
> So move the remap to mark_rodata_ro(), which is a reasonable place to
> put this, and ensures that it happens much later during the boot. It
> also means that rodata=off is now taken into account, and so the linear
> alias will remain writable in that case.
>
> Cc: Fuad Tabba <fuad.tabba@linux.dev>
> Fixes: f2ba877402e5 ("arm64: mm: Map the kernel data/bss read-only in the linear map")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---

This fixes it, and the changes look good to me, thanks.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

>  arch/arm64/mm/mmu.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 9f354971b7e4..1f7eca86b5c1 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1198,11 +1198,6 @@ static void __init map_mem(void)
>                 __map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
>                                flags);
>         }
> -
> -       /* Map the kernel data/bss read-only in the linear map */
> -       __map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
> -       flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
> -                              (unsigned long)lm_alias(__bss_stop));
>  }
>
>  void mark_rodata_ro(void)
> @@ -1221,6 +1216,12 @@ void mark_rodata_ro(void)
>         update_mapping_prot(__pa_symbol(_text), (unsigned long)_text,
>                             (unsigned long)_stext - (unsigned long)_text,
>                             PAGE_KERNEL_RO);
> +
> +       /* Map the kernel data/bss read-only in the linear map */
> +       update_mapping_prot(__pa_symbol(__init_end),
> +                           (unsigned long)lm_alias(__init_end),
> +                           (unsigned long)__bss_stop - (unsigned long)__init_end,
> +                           PAGE_KERNEL_RO);
>  }
>
>  static void __init declare_vma(struct vm_struct *vma,
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>

