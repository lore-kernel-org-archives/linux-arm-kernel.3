Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE4DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7Sa/kyYZ4LkgwyCX9rJEJ7u8HAAn0SslzIHQ/FhmRM=; b=moFFeuZR792snPQQI4Fm0i540t
	QNnmO7fw1b++du2vSoYdjltkuIOWSs/FTJWr79kZwKlQAPD3vk4bj5mH4jdpwRRquzLrMTVlm9ImV
	rs5OXrL5aeyhda7E0MCzmVU3xckoeR49GS9Mrr2ZZMwg/b62JFqnotsHzoF2XTa8AQX62wYuTbxO/
	f6e0ZoNs9F64p/GOKwZSiWe0sXPe+Nm/edS9mKf0j7+si/d0cj2/qtVxtYRrxX7x7kUiphqEjlaJB
	kTA/tU2VXpzg/wjxnlYCTCsBK4n1M5UDTWsl6LV2SlclIMwKH9nQDNmmjcIxiQuSsjE+CE26nVYQM
	adHZAEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyIT-000000038EV-0HC6;
	Fri, 15 Aug 2025 17:32:57 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwm8-00000002tVp-0s6q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:55:29 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b472478725eso898493a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755273327; x=1755878127; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z7Sa/kyYZ4LkgwyCX9rJEJ7u8HAAn0SslzIHQ/FhmRM=;
        b=NxJZej/HLtDeAecvavdWhH6jnbB6EeJIGW8/pUipCwZEI2kNfjpGC9WfanJxTn4C/X
         jFGWSuGJ/sGR51//diLFvJoGDuuxCxcvUCnxh1UDvtxrVniv261AVm7rHVUI8S0LbjA7
         0YMNS54b/+dhFRWRf0uRIOYXEZXVcAQ6ykk7SiOQPWodDgY3etveT/5tGgEwdsqOQlNd
         mbZnfu2X+miZZq4qqF69S0mPaOeOTZy3EpgO4mU/p1C0MJix1sfL3UgqDt1jlvPcsw81
         1ijR+bJ/JSiJJeLvf3jqBAtJq8EUPHObiPiDURNzPQqCUfcwRTjsrzE7Dj7ovjO9PCyC
         oyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755273327; x=1755878127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7Sa/kyYZ4LkgwyCX9rJEJ7u8HAAn0SslzIHQ/FhmRM=;
        b=NGC40UnNsjwg2uMe9wZBxoxiMc1nx3zbucNxWTrRAap2fYhhUdASnrKbk7RzvzNFwO
         4FtZXWArcyouL4yYmgTDqXwjOY/z1gznA2RfOAcA6Q2QiNDmDYW2mAZLkxdFcmbBV3az
         p349jweIYjXTMEgV18TceT04utcO1nEnBZ6n29bDE4nVK/A9Wrw9MYgAaPmKf0OfI7El
         A2ZrdJWGt1kPT32EkuE/Rqk4blelGnS4ln8dUwO6yNHzKVAO/kEDBS2Ku8Q6bNhGaE3P
         nh/v/UnrDu1wvn+1otOqKh8MXWJRE2mS+7wKqY6Bz1NO8cMfxen1iw4UkPKZ6y9+Vlgk
         FVeg==
X-Forwarded-Encrypted: i=1; AJvYcCW1GFRW90hVU/PAPiWz+8otFwoyFSOBwiRKItu0oqkm4gNrbDvolHo/sNR1PBqgeHQi+UFjpWteVbrFQQjesRL5@lists.infradead.org
X-Gm-Message-State: AOJu0YxA+SzYh1khUnCjB3UQEEGVwTWyBqiKe4stz6ky1D2FYs+H3Pqo
	Hj9NOODbKqaRcMmkgpz2G6POKC8CnAXeMtNgtpnA31EG1lEz6BIQ3iTqtSHbiA4LPgXNNvpxLvA
	pJ5K89Q==
X-Google-Smtp-Source: AGHT+IEdU+o+jxQRQjpxYUV2M2swV17WB5j94o9nqbjzzuHzapwMPWAh/lqVZpiY/Ko0sm3v0aaj/KNyHyA=
X-Received: from pjbpl10.prod.google.com ([2002:a17:90b:268a:b0:321:370d:cae5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec86:b0:313:dcf4:37bc
 with SMTP id 98e67ed59e1d1-323421229eamr3334693a91.34.1755273326710; Fri, 15
 Aug 2025 08:55:26 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:55:25 -0700
In-Reply-To: <aJ9VQH87ytkWf1dH@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-10-seanjc@google.com>
 <20250815113951.GC4067720@noisy.programming.kicks-ass.net> <aJ9VQH87ytkWf1dH@google.com>
Message-ID: <aJ9YbZTJAg66IiVh@google.com>
Subject: Re: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI
 vector on guest load/put context
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_085528_260092_3FD288A1 
X-CRM114-Status: GOOD (  20.10  )
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

On Fri, Aug 15, 2025, Sean Christopherson wrote:
> On Fri, Aug 15, 2025, Peter Zijlstra wrote:
> > > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > > index e1df3c3bfc0d..ad22b182762e 100644
> > > --- a/kernel/events/core.c
> > > +++ b/kernel/events/core.c
> > > @@ -6408,6 +6408,8 @@ void perf_load_guest_context(unsigned long data)
> > >  		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
> > >  	}
> > >  
> > > +	arch_perf_load_guest_context(data);
> > 
> > So I still don't understand why this ever needs to reach the generic
> > code. x86 pmu driver and x86 kvm can surely sort this out inside of x86,
> > no?
> 
> It's definitely possible to handle this entirely within x86, I just don't love
> switching the LVTPC without the protection of perf_ctx_lock and perf_ctx_disable().
> It's not a sticking point for me if you strongly prefer something like this: 
> 
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index 0e5048ae86fa..86b81c217b97 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -1319,7 +1319,9 @@ void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu)
>  
>         lockdep_assert_irqs_disabled();
>  
> -       perf_load_guest_context(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
> +       perf_load_guest_context();
> +
> +       perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));

Hmm, an argument for providing a dedicated perf_load_guest_lvtpc() APIs is that
it would allow KVM to handle LVTPC writes in KVM's VM-Exit fastpath, i.e. without
having to do a full put+reload of the guest context.

So if we're confident that switching the host LVTPC outside of
perf_{load,put}_guest_context() is functionally safe, I'm a-ok with it.

>         /*
>          * Disable all counters before loading event selectors and PMCs so that
> @@ -1380,5 +1382,7 @@ void kvm_mediated_pmu_put(struct kvm_vcpu *vcpu)
>  
>         kvm_pmu_put_guest_pmcs(vcpu);
>  
> +       perf_put_guest_lvtpc();
> +
>         perf_put_guest_context();
>  }
> 

