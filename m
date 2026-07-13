Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96030C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/zUrdSLYFP5PkDzH1dLf/JMl5TUcm+CxvXCyHNk/cg=; b=3OTybx0N/23GNeQa5OB+zfb4yc
	39nanjrdVNN8TDmdoCgaloKD5iJfv2pvubQPlBqyVm01XP0b8Uy3RbC9QeWVwy6FM0ygGAWbY2165
	+crSBelOacKPB+RafbiRJ0urfFol2D1Wo80mbEKVmAIq5UVEi/ymPCFdZSygvYWx6ABvGy4f6AsxB
	4g0Gw6CjJ2XCs3xjR69AutzeYJAmIbk51kZ9kCFFhk+4vCVytdlIVlkL6AN/QOIXun4sD81/NsxwW
	PTgDgGMK/n6kPchIypFLLP16H03sxaKFQX5PhZnjSymXg5NxyUXC5b3JVrxnU6Ja+FMuIZzvsXO5s
	4BFlIUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI9e-00000009hyV-2MGH;
	Mon, 13 Jul 2026 15:01:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI9b-00000009hxI-2Uy3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:01:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1795950f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783954866; x=1784559666; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/zUrdSLYFP5PkDzH1dLf/JMl5TUcm+CxvXCyHNk/cg=;
        b=NeEwssts3MbQJpDNz4IgzQmstaRh/vlNUOXg6vRMOBZO8LeTvMq5Vky/VZiPH3rfgV
         gaMtT1/UtT+ikf6f0alcSoMTWlH/v61oqN38Zho2iA7vvTRnu2qSiSPOTaJKkDkAWhkf
         81vIERXOe/3rr7fkhCHs0tbMT0/aX+E9omAMzRBSIi2efYL7n2/RFUlF/68KOnfxL0LA
         KrWgdexvlC6Y9WQhqSA7xQVqgCAUTNnmtdZVKEbniFKi7ryr4xGnxedJRgzol/BgDT+Z
         /NXogP+ZsEdskS3iiKLD4tt/FDJhhAtHK0Zuc6ze+nE9Mvw0nNfHTRvZE+IRnWZbr0fZ
         jhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954866; x=1784559666;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d/zUrdSLYFP5PkDzH1dLf/JMl5TUcm+CxvXCyHNk/cg=;
        b=KO6yXQES0BpzBrkgRXkfZPT8mUtnjU82j61tBkibMVj/fNTLhcS7lMFuXzs6MWrOMz
         Tt9sW9hC8qUgyGHVawX6DGAr2IaNHriKHSPZ9e2/ImcSJzUO+igJuj21gAgj3bNRLkcw
         BiUIHVhEqOkb4qCyal67x+nQ5LEuRt0Ny7410PZipuLBsRozBY1EZvUS2JmsJb3NyCJ8
         2ZqFbKs9CA7vf5Q7qyDKtpz7pduWg6WbwSWnB6pCSQPV27ZTKrzW32W0G2FT9aUdTN9e
         0BrQGj3s8x8PBDzmOhvM1cT+ohtMc4Qzf6+21d+YFgY/WtBrFfQy+6wvlCfymcNM+vui
         6Gyg==
X-Forwarded-Encrypted: i=1; AHgh+RrHTSuPt/gB0I7Pygxdl44MjM2jkm8Jyd3jLJvJspT2VUXKVfeCIarr95vZ5qNW2y8wk9YEweid8PREwzhcY3Rq@lists.infradead.org
X-Gm-Message-State: AOJu0YwXcUMDfSa6k+uSzCpjdJyDXvNWPc4hMs7S3357ZuEKXK3t7eVC
	Tzia71x1sW6CiWYTUSKiK9o2/EcbcH+JrCihgTadrnCk8lkJUCkjgkGC4lJkliVArw==
X-Gm-Gg: AfdE7cnIHUD5ExLfkcpzjFAsJlu0fNvCMNpRUoyHFbTShLj+0xskha5EXJyyiPgZW/U
	BGEIPmF1Z8zNVO+a88d/G9YsUAHA6KbxzblGGHUbU1SyT/GnT3f+gBdmr+T/jrGXSMUt2UwmNkd
	un9ADO+Dm6V7geuY510cOwRPjQkGAjH4XRyeuKXHrb2zmkrmTYxJL3b4FGGdjkFiT4Ch257LhSP
	LKJgcDLeEL4g+kjSWQ9s8fNRVCfPgOE7bq9Pyvpecih1y8uDbBd/mnKD4PTz2UYtUlMAwFXNOzN
	UUtjC0Rfs92/PXPG+gYGfFctNwXdKH4dKLup5c4xnrimabVMMfvvPpIQUZXgN86LWrEIre5rQeK
	pp+kfPoMvdA5oPuYaRv6yhjVfNB57hv7fJwS+fM62cYxNQhonx7/VBJy/bbPChv0tG4Gr2CFFrx
	qEHb+KELGVYYEK5G5UBVRRNwhOHEPz4lJBRVkqllyHLDnQr/9GFvqffrRznI8Zog==
X-Received: by 2002:a5d:588e:0:b0:47d:f43d:8947 with SMTP id ffacd0b85a97d-47f2dce306dmr11031006f8f.47.1783954864981;
        Mon, 13 Jul 2026 08:01:04 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f2465ae8bsm29830623f8f.36.2026.07.13.08.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:01:04 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:01:01 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, tabba@google.com,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v2] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alT9rXz_azhiq6Zu@google.com>
References: <20260713141320.4065600-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713141320.4065600-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_080107_668008_8E9DDBF4 
X-CRM114-Status: GOOD (  29.54  )
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

On Mon, Jul 13, 2026 at 02:13:20PM +0000, Mostafa Saleh wrote:
> When the hypervisor tracing (CONFIG_NVHE_EL2_TRACING) is disabled, it
> defines a static inline stub for trace_clock().
> 
> However, trace_clock() is already declared as an extern function in
> linux/trace_clock.h which is pulled in EL2 compilation.
> 
> If the file <nvhe/clock.h> is included when CONFIG_NVHE_EL2_TRACING
> is disabled (by including it manually in setup.c) it will cause:
> In file included from arch/arm64/kvm/hyp/nvhe/setup.c:22:
> 
> ./arch/arm64/kvm/hyp/include/nvhe/clock.h:14:19: error: static declaration of ‘trace_clock’ follows non-static declaration
> 
>    14 | static inline u64 trace_clock(void) { return 0; }
> 
>       |                   ^~~~~~~~~~~
> 
> on GCC and a linker error on LLVM (it seems to change the linkage to
> global)
> 
> Although that is not a problem at the moment, as no other files
> include <nvhe/clock.h>. That does not seem to be the intent of
> this code and that will cause issues with more users as the SMMUv3
> driver.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
> 
> ---
> I did not add Fixes tag as this is currently dormant and not breaking
> anything.

Thanks for the respin

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
>  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
>  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> index 9f429f5c0664..ae03ec6965af 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> @@ -6,11 +6,11 @@
>  #include <asm/kvm_hyp.h>
>  
>  #ifdef CONFIG_NVHE_EL2_TRACING
> -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> -u64 trace_clock(void);
> +void trace_hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> +u64 trace_hyp_clock(void);
>  #else
>  static inline void
> -trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
> -static inline u64 trace_clock(void) { return 0; }
> +trace_hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
> +static inline u64 trace_hyp_clock(void) { return 0; }
>  #endif
>  #endif
> diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
> index a7fc61976fd0..f3e2619db4e4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> @@ -30,7 +30,7 @@ static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
>  }
>  
>  /* Does not guarantee no reader on the modified bank. */
> -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
> +void trace_hyp_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  {
>  	struct clock_data *clock = &trace_clock_data;
>  	u64 bank = clock->cur ^ 1;
> @@ -48,7 +48,7 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  }
>  
>  /* Use untrusted host data */
> -u64 trace_clock(void)
> +u64 trace_hyp_clock(void)
>  {
>  	struct clock_data *clock = &trace_clock_data;
>  	u64 bank = smp_load_acquire(&clock->cur);
> diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> index e7e150ab265f..65be6c9fb379 100644
> --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> @@ -35,7 +35,7 @@ static bool hyp_trace_buffer_loaded(struct hyp_trace_buffer *trace_buffer)
>  void *tracing_reserve_entry(unsigned long length)
>  {
>  	return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simple_rbs), length,
> -					  trace_clock());
> +					  trace_hyp_clock());
>  }
>  
>  void tracing_commit_entry(void)
> @@ -290,7 +290,7 @@ void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  	}
>  
>  	/* ...we can now override the old one and swap. */
> -	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
> +	trace_hyp_clock_update(mult, shift, epoch_ns, epoch_cyc);
>  }
>  
>  int __tracing_reset(unsigned int cpu)
> -- 
> 2.55.0.795.g602f6c329a-goog
> 

