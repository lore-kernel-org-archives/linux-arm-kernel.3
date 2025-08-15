Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A868CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZHHNj6EVbfkylJhuGEQxcUJR48ZbvWbqL/aI2BJPfo=; b=tPSvmVenMsE5Mo+hSpNtaLqg/d
	4Gjr55QTmkCAcgm0i2lxiUj9rgpRX6UUU4GXB451m6abOFFDj8o3xFKQ+WhNagPjyE4hyGgH9VwMY
	s2QH5zbmKFzaqzTv6CwhdUX1mbYUUGDZZP2ZyR566L2B/8+2xUMcAl303O4eMjfOXENc1rmKdiN/r
	pBiWPvRvt8yFnAx30/vKv3D85DfTUqe6BHfAE6F52Ob+RXqScpVceZwK34ko0tU4yiN4U4TSJqjp5
	H444pUYEmostGtS2lgeJrtq3oIrGt+dZlTzKHaZRE2ULboiQ8vXTfIHWEFsag8Sb5o59kBvqbZ6+U
	wPjOoVkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umy0l-000000035zG-03K5;
	Fri, 15 Aug 2025 17:14:39 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwZ1-00000002rmr-1JLK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:41:56 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32326e6b1deso2016245a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755272513; x=1755877313; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZHHNj6EVbfkylJhuGEQxcUJR48ZbvWbqL/aI2BJPfo=;
        b=gUuokL+P8bGLyPe8UOw4HPJmkgQ0Df5xiHnHKZABNJfcWt1IA6u/4ebDDhNYhrUYpc
         wFTLmMUqdmNPnQOR3gXtHHBuVhzyH6izuU4VV9bMjiJkdE2aOW4CHF8aLH0kzy3axqaA
         8KfbBocbZRVUC4OO+P9zW4jfrspKnFZxKGtnGFfml2p+xql4DnqLfxRwXNeOZVV1FJOe
         Tiy6KwfJ7tMLH6HI7WjCpbEDSFwlwJaJ8y5xoBeJIrjkJ8U32gxtIxUfreHce1WnRbGV
         642RPJ/eTJkHeOfjUzPBN0lq3NiWbPm056SFggciPxCG3HCKS/IDD4dO7fPt4UjMpVB6
         FB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755272513; x=1755877313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZHHNj6EVbfkylJhuGEQxcUJR48ZbvWbqL/aI2BJPfo=;
        b=u5wLr5HwkHYLJFiKXvpcOFFuSkTiNYoj8/Xhu8H5+6SKZsa8+VXVyLPTABOzB6bYLe
         TUHj1+///O/T+4/lrKAJOOIH+iZfZt7FCNZqMj90RXdrJePijgkhmN8ppQyjTVaPeqPN
         6FR94b1Blto3FrnWoVd4phQOr3K48gNJuySqT5wXD/AiEmBdroTN3a+/hh7y6+tCFwq6
         HJIzYyaKyL8q3jVl+kbxj8rZq3fQScdKxbh6z+h0EygOnB0OCXjhhtG9P1D/MyY3SyAc
         U7GgSAhE6jD7h2i1HkjnayyAEySB7Y13tjWHAphqIoCQNQ9cw2/V9MnDe8cFcrkz/dC/
         XobQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqzkFt17708hIL07rd9zFDVuXiZL0q/rGmKNtJJqVmuYdUFArVR054kiL7qa9d4MR1ITn+PnMc2gRTIQyVV1tO@lists.infradead.org
X-Gm-Message-State: AOJu0YwliUTd5/y6eFV3G1twodmCjxCNVyuuPAaNnNi94u8iyrnRRtIU
	l51sFAYM4ARWjEgw8yhms1iAxiizmM6vzC+3Has5C9hfZN7xb5Kd1P3MB2MP0igto4WtuXaEGvc
	MCU3nBA==
X-Google-Smtp-Source: AGHT+IF1xhNBmkTpZib3NykIL4xlxFbGkhXK+/yjF5LGvtuWFmTYgkxBDJw0+uZkCmQyO/RrRqfOrKLRso0=
X-Received: from pjbsd7.prod.google.com ([2002:a17:90b:5147:b0:31e:a094:a39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5104:b0:31e:4492:af48
 with SMTP id 98e67ed59e1d1-32342238d44mr3660367a91.28.1755272513579; Fri, 15
 Aug 2025 08:41:53 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:41:52 -0700
In-Reply-To: <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-10-seanjc@google.com>
 <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
Message-ID: <aJ9VQH87ytkWf1dH@google.com>
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
X-CRM114-CacheID: sfid-20250815_084155_342755_7A0145BA 
X-CRM114-Status: GOOD (  15.88  )
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

On Fri, Aug 15, 2025, Peter Zijlstra wrote:
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index e1df3c3bfc0d..ad22b182762e 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -6408,6 +6408,8 @@ void perf_load_guest_context(unsigned long data)
> >  		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
> >  	}
> >  
> > +	arch_perf_load_guest_context(data);
> 
> So I still don't understand why this ever needs to reach the generic
> code. x86 pmu driver and x86 kvm can surely sort this out inside of x86,
> no?

It's definitely possible to handle this entirely within x86, I just don't love
switching the LVTPC without the protection of perf_ctx_lock and perf_ctx_disable().
It's not a sticking point for me if you strongly prefer something like this: 

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 0e5048ae86fa..86b81c217b97 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -1319,7 +1319,9 @@ void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu)
 
        lockdep_assert_irqs_disabled();
 
-       perf_load_guest_context(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
+       perf_load_guest_context();
+
+       perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
 
        /*
         * Disable all counters before loading event selectors and PMCs so that
@@ -1380,5 +1382,7 @@ void kvm_mediated_pmu_put(struct kvm_vcpu *vcpu)
 
        kvm_pmu_put_guest_pmcs(vcpu);
 
+       perf_put_guest_lvtpc();
+
        perf_put_guest_context();
 }


