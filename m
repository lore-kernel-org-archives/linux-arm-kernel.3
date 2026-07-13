Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63941C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui/q0Z17SIjSQaEuUEryDLv/RC+iz2sf/IL8bGmgkiM=; b=Pal1Vv1eznNC5sglvNMJKdPxFf
	eK2VCkyrgJjvP54i1r2Nz0rUUekQ7It+TtLDqcHNXYZulJuAwYE80IJyIARJCM72W+VNMt3jSXMIM
	gtPRfESI4/GSbU+qHqwJb/FiIzpHBlX3fEYPaOYbfMqJVQ/0Iubbzn3MkmEB6Z+/G2tHlbronTClP
	AMlTmCdg9czKPOQyPe+jxSyhOVjuHqfPmLA9iu+fzhECKHv64OwV7wW75J1ZitC5YRKILnIS6G5WW
	bkCuhyi/WF42fgkRx3/qj8PJ5x1CWoj/Gry2H/ewOre/5zNrl4w4rjs0Bs8VOxD+nhDibp/hWwmPp
	wvsCW1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBcx-00000008WGZ-32kO;
	Mon, 13 Jul 2026 08:02:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBcv-00000008WFz-1BpP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:02:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493c19bad03so25151105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783929774; x=1784534574; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ui/q0Z17SIjSQaEuUEryDLv/RC+iz2sf/IL8bGmgkiM=;
        b=p6s1ih/cTZjcee/uusuCmYJfL8yoHmlGDkAOZRLRMwhvk7PsnSQcLMpQiH8NkohP0e
         qwN46IkgsRNZBsgaO2zse70gMmZo2XXwUC0DzJdS5RqIplPKQc3/KOQm1aGJdFA+ui0B
         rB4w6X2gIbbG1iu3/TuW9QfpfISt3wk48hs09v6aVm1BLyPFfqEMwIPQNo8SGo4J9VaY
         P1FSx5RptKpHgFNI97Tca0XZIKSNOT1kedTkCJPOuQu1zK7Gg6hPrkLS6vBjyCjtpr9H
         06byGPixFl6+xmXe1+uEH0tcPWTmPIvnM9wkC04hcAGj7JOeuFzthQvhh4gTccAV+0t8
         IK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929774; x=1784534574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ui/q0Z17SIjSQaEuUEryDLv/RC+iz2sf/IL8bGmgkiM=;
        b=WlBk2jZnzPLcS68b8ekNixg7pI0Ty5HRPwwA5T5+oUuhLJyyvHYdU4+WLVIi2yqYlY
         dEeGKxmuoja9XRp36zto+VjhjRcS3b7+ZwIkirwNub19Tn0056bjXcr50pbci+OEQEtT
         k4G4hIJIBYNPdWOcRubyrg1JapkfvMzRMqqwKKHnH91mhPzPT1Hq6khHZ+VsK9H7PKCF
         cs4gSoy2zCJSpn0fbfRNTUq4FbZyLzTVoxJEcenIfRzxT82r7G3dnaMWOMtt1zD0dO2V
         urQ9tX0A9rgnuljqYeekoNxTZnFxoaFNfY7IyrewhwbsALuhwSy0JEW2ojZb666yGGo7
         1/ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpghagxW91A2X07tWtUd5rESpKr/R9LGa0H8urWLNfvIYC3Ps2NtRiTrAvY0rKxTz7Q/A8SpLeyeCpl7oVM8jz@lists.infradead.org
X-Gm-Message-State: AOJu0YxFK0X3QclhNMoeQxQHSIRlGirwQze88yXH6vhBlFEx8W5eNdKp
	ZMwHeDJ6ahnsunCh1TIoFSYRIpqdyAiTj1WnqeooS2Dmwq22de+Toj8seNYBg0ZNCA==
X-Gm-Gg: AfdE7cmcBV6cpsuuTirth46ffrLXOkHwpAAicrJL+DL9B/DvOrlfM5tSZH1zopGJZMv
	NVPVgcF89ucfGOodueCnxV/Sos2GGrVUf5Zd/FKtn9xp0nxRNe4LhbYjn4xOWKYH+CMMrNSeni5
	nk+4IW3+gNFIJGNtcEOLxHcREmNkGlrCuis1OXsI+hz9z6ScLOE7aqBvOQe/4bIw8VmcqXbquLb
	aKxCOhSGMBJUcqT8ML3eapi/UPw6TgvblVUrDQ8bVNXttP0l4T8ObMB0XWzcKWFNFsgcONXviN2
	RXM3a2nNalLX3/viXaeE/UHcYZ++glpCb9uqakg0rb67M7x+l9kGPdoZtrIgsmbZz8NhQ3wo05H
	sDaYTdG6JGJw5IFmVCwjMXugUpR5Dv2inMUFDjieJHVdkVtRSqQYv4Ulk8iBGZJLJQPeKC7qahy
	5cRPfAceXaHOH/IyFAU4v+t4ENA/XYa9hvHvEDicSAYDw8x2LonZI=
X-Received: by 2002:a05:600c:608e:b0:493:b03c:5650 with SMTP id 5b1f17b1804b1-493f8820806mr75041905e9.19.1783929773498;
        Mon, 13 Jul 2026 01:02:53 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e77c2esm210021655e9.2.2026.07.13.01.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:02:52 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:02:48 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
Message-ID: <alSbqDyV3Koez--u@google.com>
References: <20260712153835.2264905-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260712153835.2264905-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_010257_381733_CC3E079A 
X-CRM114-Status: GOOD (  29.01  )
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

On Sun, Jul 12, 2026 at 03:38:35PM +0000, Mostafa Saleh wrote:
> When the hypervisor tracing (CONFIG_NVHE_EL2_TRACING) is disabled, it
> defines a static inline stub for trace_clock().
> 
> However, trace_clock() is already declared as an extern function in
> linux/trace_clock.h which is pulled in EL2 compilation.

I am completely unable to reproduce that. CONFIG_NVHE_EL2_TRACING, isn't a
selectable option, it depends on NVHE_EL2_DEBUG.

How does your .config look like?

> 
> If the file <nvhe/clock.h> is included when CONFIG_NVHE_EL2_TRACING
> is disabled (by including it manually in setup.c) it will cause:
> In file included from arch/arm64/kvm/hyp/nvhe/setup.c:22:

nvhe/clock.h seems already included in setup.c

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
> 
> --
> I did not add Fixes tag as this is currently dormant and not breaking
> anything.
> ---
>  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
>  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
>  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> index 9f429f5c0664..c2ccd0e8bf22 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> @@ -6,11 +6,11 @@
>  #include <asm/kvm_hyp.h>
>  
>  #ifdef CONFIG_NVHE_EL2_TRACING
> -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> -u64 trace_clock(void);
> +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> +u64 hyp_trace_clock(void);
>  #else
>  static inline void
> -trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
> -static inline u64 trace_clock(void) { return 0; }
> +hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
> +static inline u64 hyp_trace_clock(void) { return 0; }
>  #endif
>  #endif
> diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
> index a7fc61976fd0..8adefb0b696c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> @@ -30,7 +30,7 @@ static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
>  }
>  
>  /* Does not guarantee no reader on the modified bank. */
> -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
> +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  {
>  	struct clock_data *clock = &trace_clock_data;
>  	u64 bank = clock->cur ^ 1;
> @@ -48,7 +48,7 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  }
>  
>  /* Use untrusted host data */
> -u64 trace_clock(void)
> +u64 hyp_trace_clock(void)
>  {
>  	struct clock_data *clock = &trace_clock_data;
>  	u64 bank = smp_load_acquire(&clock->cur);
> diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> index e7e150ab265f..f2a32463c6c2 100644
> --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> @@ -35,7 +35,7 @@ static bool hyp_trace_buffer_loaded(struct hyp_trace_buffer *trace_buffer)
>  void *tracing_reserve_entry(unsigned long length)
>  {
>  	return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simple_rbs), length,
> -					  trace_clock());
> +					  hyp_trace_clock());
>  }
>  
>  void tracing_commit_entry(void)
> @@ -290,7 +290,7 @@ void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
>  	}
>  
>  	/* ...we can now override the old one and swap. */
> -	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
> +	hyp_trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
>  }
>  
>  int __tracing_reset(unsigned int cpu)
> -- 
> 2.55.0.795.g602f6c329a-goog
> 

