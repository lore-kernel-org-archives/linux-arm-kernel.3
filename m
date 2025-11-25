Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E923D0EE0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4ndUQJXblyMVIEo31GQ2aPBJsTj4kLS2trQiSNmxdk=; b=c6eY/npusNz9k2lC5+/QzXTNcI
	7BjzAQ41sNw1dUxgvv9gbQy3SPfk0YfCfBKCn2YD06vdbBFqyUOQJnsx8hCm1CdcN7FYM1MEg8RLM
	adg0YKzOSpPPB7O8AE9VUFth+nuo+2PWd8wdO7LL3gdzQGegEvV/9wsunbaSE8VwVxbdr1q6YEDV3
	cdZTYVpdfwSPXmXhpuI5nIZfzx59RukVvly6BWiAyIz1QOyu6Pc4xCF/6QaYUKZBXe+7DA5W5GFEF
	h1niSClVYzeWZBBqyZhPYG6PAgX4um0LHRqkdDNsd9PVJOQW2SsCaLt4RyVKKlX+DC4SH9h6ukAyJ
	4RvZ0Ujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwWb-0000000DeVW-2gCB;
	Tue, 25 Nov 2025 17:08:21 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwWZ-0000000DeUX-1urH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:08:20 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3437863d0easo10013538a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 09:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764090498; x=1764695298; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y4ndUQJXblyMVIEo31GQ2aPBJsTj4kLS2trQiSNmxdk=;
        b=ubR9kjIS14bAasPSbK/E7iQuxnlvvp9DpGWaWwn90UD53U4klDPtXdfZcRCewDubK2
         Azxn/4o4k657yLxao7VLMNDLD+NZ2bvOpLpwMX/mVbf8tbKyxSx+bCTVKOX5YUpKZVNa
         6KK2hEbUvWpO+ztfrTepcdB4CP9tm2Dn7hCAUvyoSc5ppbjyYsysVXsPf0lSzDQ1L5zh
         8v+AQYdqG4mF0I+a7NxOeMcMJ+F7FdZNkDUhVLbC80XC03RpScVZmHzK9KCapT2Yknqc
         rk1/nc3f/DB7x111um79YmQswakfsR0LM1IwRHD95iXtTye5siJBiQVIIvgBR1GUVIK5
         FEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764090498; x=1764695298;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4ndUQJXblyMVIEo31GQ2aPBJsTj4kLS2trQiSNmxdk=;
        b=t4XbkKHJqga1yzhhA9km4lkcfo25vpalTf30t6onVa306w4w+1pPFA1ow50e7NwEHR
         35I4jeC1+h6qmjhkrWGnb9moEa5fPIi+jSC1VXICRa+YEidHgDRnAYFbg9Y2xij947z+
         e1GWOVw0Kc+NMm9MZ69TKCPm16LSy/GhKMxcgmrc/nWZjPo3flOGvR9JGMIwSHcnY6Qq
         Dhj0lSwq0NtO22tV6rj6HaNHQ2IYgzMbx3XNhQivnErqbeciGs/k6NFt0IDHNiCw68TW
         zdcTdOZBBTJgFc+k2YIW/LyvHe5ZLc8emmcWqaSNIX+JtvR1nkdlbvtUQYANvmdJ18r0
         npqA==
X-Forwarded-Encrypted: i=1; AJvYcCXIW9Kzg55gJHX1AIn1UkhJVQrlTPlg03agE2mWvIspgaDCcipSCo63pHoup7Gm4NAPbKidRD70GatQAnsw6pDt@lists.infradead.org
X-Gm-Message-State: AOJu0YzXtedbv99U5nQqV5h7rh6B9GlrJd9jVXCfQ0p26BxQbhxZAJqt
	12UxNQ4ijK4Ql+9kSGIYp6XNVF5TnS7dMXbxL7TQKTk+crHZyLqz1WZlCbCsYzN0XaOYGlZ68+x
	dFmSzgw==
X-Google-Smtp-Source: AGHT+IFzDAUOZTDNFOssfEjC4490DRPTOVZZ7CJwR5gD19Yg3yMCKcUxEwLwt1d5WA+HAajf5nh9jS9CJiQ=
X-Received: from pjbpw1.prod.google.com ([2002:a17:90b:2781:b0:33b:c211:1fa9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:384f:b0:341:8c8e:38b5
 with SMTP id 98e67ed59e1d1-34733f3e483mr14061440a91.25.1764090498218; Tue, 25
 Nov 2025 09:08:18 -0800 (PST)
Date: Tue, 25 Nov 2025 09:08:16 -0800
In-Reply-To: <83067602-325a-4655-a1b7-e6bd6a31eed4@linux.intel.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-29-seanjc@google.com>
 <aSUK8FuWT4lpMP3F@google.com> <83067602-325a-4655-a1b7-e6bd6a31eed4@linux.intel.com>
Message-ID: <aSXigAQznhuxZmy7@google.com>
Subject: Re: [PATCH v5 28/44] KVM: x86/pmu: Load/save GLOBAL_CTRL via
 entry/exit fields for mediated PMU
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_090819_520924_03EC23A2 
X-CRM114-Status: GOOD (  35.31  )
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

On Tue, Nov 25, 2025, Dapeng Mi wrote:
> On 11/25/2025 9:48 AM, Sean Christopherson wrote:
> >> +	if (host_pmu->version < 4 || !(host_perf_cap & PERF_CAP_FW_WRITES))
> >> +		return false;
> >> +
> >> +	/*
> >> +	 * All CPUs that support a mediated PMU are expected to support loading
> >> +	 * and saving PERF_GLOBAL_CTRL via dedicated VMCS fields.
> >> +	 */
> >> +	if (WARN_ON_ONCE(!cpu_has_load_perf_global_ctrl() ||
> >> +			 !cpu_has_save_perf_global_ctrl()))
> >> +		return false;
> > And so this WARN fires due to cpu_has_save_perf_global_ctrl() being false.  The
> > bad changelog is mine, but the code isn't entirely my fault.  I did suggest the
> > WARN in v3[1], probably because I forgot when PMU v4 was introduced and no one
> > corrected me.
> >
> > v4 of the series[2] then made cpu_has_save_perf_global_ctrl() a hard requirement,
> > based on my miguided feedback.
> >
> >    * Only support GLOBAL_CTRL save/restore with VMCS exec_ctrl, drop the MSR
> >      save/retore list support for GLOBAL_CTRL, thus the support of mediated
> >      vPMU is constrained to SapphireRapids and later CPUs on Intel side.
> >
> > Doubly frustrating is that this was discussed in the original RFC, where Jim
> > pointed out[3] that requiring VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL would prevent
> > enabling the mediated PMU on Skylake+, and I completely forgot that conversation
> > by the time v3 of the series rolled around :-(
> 
> VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL is introduced from SPR and later. I
> remember the original requirements includes to support Skylake and Icelake,
> but I ever thought there were some offline sync and the requirement changed...

Two things:

 1) Upstream's "requirements" are not the same as Google's requirements (or those
    of any company/individual).  Upstream most definitely is influenced by the
    needs and desires of end users, but ultimately the decision to do something
    (or not) is one that needs to be made by the upstream community.

 2) Decisions made off-list need to be summarized and communicated on-list,
    especially in cases like this where it's a relatively minor detail in a
    large series/feature, and thus easy to overlook.

I'll follow-up internally to make sure these points are well-understood by Google
folks as well (at least, those working on KVM).

> My bad,

Eh, this was a group "effort".  I'm as much to blame as anyone else.

> I should double confirm this at then.

No need, as above, Google's requirements (assuming the requirements you're referring
to are coming from Google people) are effectively just one data point.  At this
point, I want to drive the decision to support Sylake+ (or not) purely through
discussion of upstream patches.

> > As mentioned in the discussion with Jim, _if_ PMU v4 was introduced with ICX (or
> > later), then I'd be in favor of making VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL a hard
> > requirement.  But losing supporting Skylake+ is a bit much.
> >
> > There are a few warts with nVMX's use of the auto-store list that need to be
> > cleaned up, but on the plus side it's also a good excuse to clean up
> > {add,clear}_atomic_switch_msr(), which have accumulated some cruft and quite a
> > bit of duplicate code.  And while I still dislike using the auto-store list, the
> > code isn't as ugly as it was back in v3 because we _can_ make the "load" VMCS
> > controls mandatory without losing support for any CPUs (they predate PMU v4).
> 
> Yes, xxx_atomic_switch_msr() helpers need to be cleaned up and optimized. I
> suppose we can have an independent patch-set to clean up and support
> global_ctrl with auto-store list for Skylake and Icelake.

I have the code written (I wanted to see how much complexity it would add before
re-opening this discussion).  My plan is to put the Skylake+ support at the end
of the series, not a separate series, so that it can be reviewed in one shot.
E.g. if we can make a change in the "main" series that would simplify Skylake+
support, then I'd prefer to find and implement any such change right away.

