Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F2FD72379
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJfSzpptsvgNQ0mCpYmk8DIXrBhJMmuZV4W80Mdql0g=; b=t4jU50EdYtRTQcRcA0rALb4axs
	51i2xxnDDudP8VqKi9mpYHu5n8iHqkmS2SongBRLlUwff4NhASmRr4gagWqrAVdMk5XDBj9Y5oiZx
	xpCmsB0HGCrqegky75H46rI6wbLlpbhsq62AXGAz8KjIN6hr93YVtWhjYn/2bz5WAiPc80WSwfWsz
	g5Ka2sBAAa5ju8kxRnygSlW+iLUMK1x5siWSgU4TrvwmD02kx+hUSV15xkhTnUvOUN5QxAMyo+n8r
	4IpQjQlhAJ7snSQB/rZ0fSlFQzpF68bhZWTZLU6+7zEui3EO4U1+jJxcvMIc1IWetn6VjhRO+j7ql
	RJievp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjG1Y-00000008sza-3OhX;
	Fri, 23 Jan 2026 12:12:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjG1W-00000008sz2-3xR3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:12:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso8664075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769170340; x=1769775140; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJfSzpptsvgNQ0mCpYmk8DIXrBhJMmuZV4W80Mdql0g=;
        b=vSz9igze0ngcDSbDAbpvUoGlFKs0dMEwWvO4b27JwCV1R+K46ZQQghf3bDO0VkOaCa
         elGwXMvxyjtIMbrt38v/ZDXiQA7hIo7pOf+0zdbdAGgXMeCx4o5NvqbF/H/tFf6jghcY
         6rsckhfJt261nmio4hqRIGFO4jnMiSlOnD8Oy3+2HTdd6ggOE9WqUbsxys+WLqWtO5B+
         ARqNguv8HPLIkgkaPIVVeGOlgQfBldpLRr6sNVfWHUn2OovgjbdVWvhb0cgwpPB4USSX
         72rUqWuoZDL7+d/CIzt4MitP7xQdWkmvgBFK30dX62uLwcKBmwnoDEGITTXsFiDK4kTW
         VBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170340; x=1769775140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJfSzpptsvgNQ0mCpYmk8DIXrBhJMmuZV4W80Mdql0g=;
        b=CYOeZyOPvaDmPIkb9W49u2nqBiLW0X2Cmbu2BoKYfAq42mVv/OqbpfiyFWt/v99E7S
         lNCOmlUy1so1Q2PvRJZ65RU6Qo3D9KNDAToE6Lqf22MJngxl+kkuCpP9XFpSGox8YqEI
         2+g3YitGgu0CjCD93QqpXG7FGILsFUO1FM6BKSox7+0L+9Y8xOCjkIuKcff1ZSWa4b0j
         g1/YHB/oSAzXpRH47FjUO4dwnpGUn7m37ALsbOeW9KgxzTWShuBwLbp+gsDIQsjn27Ss
         gU0d2u9+13YKxIYTYQ0WLcq3aI1QrhBgnNJTGS/LTNBhynBjNZl/7LtTYshMlDrKeaeV
         7l4g==
X-Forwarded-Encrypted: i=1; AJvYcCXHkyq/oWeMc+lx1Sh2pJbY9iJFfo9HtmvXw24F3tsYv6BCRSOmj11sIWvaewuidQFOvrmB3VHGV8xvoL0j21OV@lists.infradead.org
X-Gm-Message-State: AOJu0YyJbjVtXSTr5rNgpNvWNajBsLZAiyWA48uoURHEirVNqgP4Kd9p
	msz+EKVFkJ7DIs/eVyfEV2MO3z9IZPpQU+YY5tkrDDyAX9TyjXlZa6MoMpfYnP11uw==
X-Gm-Gg: AZuq6aL5UTNpZTPpRdvRfFmyBJ2oNmlL75sXi0lE0BjzXl/v0WZqG8iFv29Sodz+tUx
	bTfJfOiOXE8kpUk2OtjxDqff1+E1d37AvnWl0sefI74oKy0Q6dWQNHsJSSfyp615LvuB28OqKny
	MEHx+ZEFtr3lRAuLX7AUvsTio9X2yMJtVspQG+2RoMObDrjqEzmFgH1sBHPQlk65DjGJY7rq6Wb
	3wh+n9YZhROAN/AEcEz6PEkpN8LP5OAIMyL0eWVgtvGrEvYL0aOD/jfxvbjmDjy/Ii8xCd6w2cg
	OixQc4waQhNqWZvgtzNT+a7wOC/feZ39OnY7WmJm9v1zXHJGkBMeCOhvmbaW4Igb1ijeob+EjUG
	XqWr0MJQn/lcc431H56OW/cHWCOM2RCmUfjm4qeSwwbql5COpgR+xM/by0KbtipnoRaS83avzw5
	RdNEeT8D1OuYE0zFHKE67u0Uq586zFaedjQzvv+5BMYjEtGX/LoA==
X-Received: by 2002:a05:600c:5253:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-48051256401mr19426385e9.28.1769170339674;
        Fri, 23 Jan 2026 04:12:19 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5b67sm47732645e9.10.2026.01.23.04.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:12:19 -0800 (PST)
Date: Fri, 23 Jan 2026 12:12:15 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	"Christopher S. Hall" <christopher.s.hall@intel.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v9 25/30] KVM: arm64: Sync boot clock with the nVHE/pKVM
 hyp
Message-ID: <aXNln7dzZzf-iGGI@google.com>
References: <20251202093623.2337860-1-vdonnefort@google.com>
 <20251202093623.2337860-26-vdonnefort@google.com>
 <86bjj5mrhn.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjj5mrhn.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_041223_051756_B4452A11 
X-CRM114-Status: GOOD (  33.34  )
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

On Wed, Jan 07, 2026 at 02:23:16PM +0000, Marc Zyngier wrote:
> On Tue, 02 Dec 2025 09:36:18 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > Configure the hypervisor tracing clock with the kernel boot clock. For
> > tracing purposes, the boot clock is interesting: it doesn't stop on
> > suspend. However, it is corrected on a regular basis, which implies the
> > need to re-evaluate it every once in a while.
> > 
> > Cc: John Stultz <jstultz@google.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Christopher S. Hall <christopher.s.hall@intel.com>
> > Cc: Richard Cochran <richardcochran@gmail.com>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index f83650a7aad9..375607c67285 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -93,6 +93,7 @@ enum __kvm_host_smccc_func {
> >  	__KVM_HOST_SMCCC_FUNC___tracing_unload,
> >  	__KVM_HOST_SMCCC_FUNC___tracing_enable,
> >  	__KVM_HOST_SMCCC_FUNC___tracing_swap_reader,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
> >  };
> >  
> >  #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> > index 7da8788ce527..fd641e1b1c23 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> > @@ -11,6 +11,7 @@ int __tracing_load(unsigned long desc_va, size_t desc_size);
> >  void __tracing_unload(void);
> >  int __tracing_enable(bool enable);
> >  int __tracing_swap_reader(unsigned int cpu);
> > +void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
> >  #else
> >  static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
> >  static inline void tracing_commit_entry(void) { }
> > @@ -19,5 +20,6 @@ static inline int __tracing_load(unsigned long desc_va, size_t desc_size) { retu
> >  static inline void __tracing_unload(void) { }
> >  static inline int __tracing_enable(bool enable) { return -ENODEV; }
> >  static inline int __tracing_swap_reader(unsigned int cpu) { return -ENODEV; }
> > +static inline void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
> >  #endif
> >  #endif
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 8b78b29c2069..45b8f70828de 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -613,6 +613,18 @@ static void handle___tracing_swap_reader(struct kvm_cpu_context *host_ctxt)
> >  	cpu_reg(host_ctxt, 1) = __tracing_swap_reader(cpu);
> >  }
> >  
> > +static void handle___tracing_update_clock(struct kvm_cpu_context *host_ctxt)
> > +{
> > +	DECLARE_REG(u32, mult, host_ctxt, 1);
> > +	DECLARE_REG(u32, shift, host_ctxt, 2);
> > +	DECLARE_REG(u64, epoch_ns, host_ctxt, 3);
> > +	DECLARE_REG(u64, epoch_cyc, host_ctxt, 4);
> > +
> > +	__tracing_update_clock(mult, shift, epoch_ns, epoch_cyc);
> > +
> > +	cpu_reg(host_ctxt, 1) = 0;
> 
> What's the purpose of setting X1 to 0? This is a call returning void,
> so I don't immediately see the need for this.

Hum, nope nothing. And actually the same applies to __tracing_write_event() and
__tracing_unload()

> 
> > +}
> > +
> >  typedef void (*hcall_t)(struct kvm_cpu_context *);
> >  
> >  #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
> > @@ -658,6 +670,7 @@ static const hcall_t host_hcall[] = {
> >  	HANDLE_FUNC(__tracing_unload),
> >  	HANDLE_FUNC(__tracing_enable),
> >  	HANDLE_FUNC(__tracing_swap_reader),
> > +	HANDLE_FUNC(__tracing_update_clock),
> >  };
> >  
> >  static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
> > diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> > index df9d66fcb3c9..97e9f6c1a52c 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> > @@ -271,3 +271,19 @@ int __tracing_swap_reader(unsigned int cpu)
> >  
> >  	return ret;
> >  }
> > +
> > +void __tracing_update_clock(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
> > +{
> > +	int cpu;
> > +
> > +	/* After this loop, all CPUs are observing the new bank... */
> > +	for (cpu = 0; cpu < hyp_nr_cpus; cpu++) {
> > +		struct simple_rb_per_cpu *simple_rb = per_cpu_ptr(trace_buffer.simple_rbs, cpu);
> > +
> > +		while (READ_ONCE(simple_rb->status) == SIMPLE_RB_WRITING)
> > +			;
> > +	}
> > +
> > +	/* ...we can now override the old one and swap. */
> > +	trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
> > +}
> > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> > index 2866effe28ec..1e5fc27f0e9d 100644
> > --- a/arch/arm64/kvm/hyp_trace.c
> > +++ b/arch/arm64/kvm/hyp_trace.c
> > @@ -4,15 +4,133 @@
> >   * Author: Vincent Donnefort <vdonnefort@google.com>
> >   */
> >  
> > +#include <linux/cpumask.h>
> >  #include <linux/trace_remote.h>
> > +#include <linux/tracefs.h>
> >  #include <linux/simple_ring_buffer.h>
> >  
> > +#include <asm/arch_timer.h>
> >  #include <asm/kvm_host.h>
> >  #include <asm/kvm_hyptrace.h>
> >  #include <asm/kvm_mmu.h>
> >  
> >  #include "hyp_trace.h"
> >  
> > +/* Same 10min used by clocksource when width is more than 32-bits */
> > +#define CLOCK_MAX_CONVERSION_S	600
> > +/*
> > + * Time to give for the clock init. Long enough to get a good mult/shift
> > + * estimation. Short enough to not delay the tracing start too much.
> > + */
> > +#define CLOCK_INIT_MS		100
> > +/*
> > + * Time between clock checks. Must be small enough to catch clock deviation when
> > + * it is still tiny.
> > + */
> > +#define CLOCK_UPDATE_MS		500
> 
> If these definitions are common, can't we reuse the existing ones?
> Specially given that this isn't EL2 code.

Only the first is reused but it doesn't exist any definition for it.

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

