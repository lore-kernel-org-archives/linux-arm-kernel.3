Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFD3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLuuQdqXBRGyu60+ieS//bbxP+3AVwFN22YqAdloirM=; b=HP4KweKBlRHr4q+hqTjwJWLLCi
	rNILS+Ej2r/LhgvfsibnCKHOy4Za8JgQW6SfT1qprjb7nlGzgE4lWayi4VEDmkq/4Sb94bt0aVuvW
	P7Oe356epQMrH+GiAdR0hlep00PY6w4YByUZk4kwC45YPLl2maVkg/teljx3qiufr4CmX5GRbKf+h
	do8c/MOs0NKswqUcSqUJhMNLvmUMTnLnF84QzKcvGnMsGWA/r9r0RA97e8VAzTZYwq7wRlC2g+3jN
	TV2Ve6ieyDvXg3xVW77UyK2xWyIn2FXDCi/Un2qGRIqkI74oMZzFRcfaCA8qms/0QlTtJ3JHfT8rM
	ay2QWEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyDQ-000000037Kg-0Sit;
	Fri, 15 Aug 2025 17:27:44 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwiR-00000002t3f-346q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:51:41 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-244570600a1so24406745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755273098; x=1755877898; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLuuQdqXBRGyu60+ieS//bbxP+3AVwFN22YqAdloirM=;
        b=F4mzm3Lxw/Tj8v2La2Id+HmSTCUEITsVpZi32bBnyjpIBebdPlU4fT8Ei1WvnQMSs/
         wmXg2SxAFecEnUZ7KM8IXVTMbq2GJzg7285Mb4HOEr4n7sI79RWP5lDvf/PYweY+jg8f
         Cuc2uaIqyMfettuUw5WngL23J98ptqJE3SpyUIc/Bq0iBw4RXLqXqOpQ7McpdD2Di6KS
         CJZXzbTNgp2BKpDDsIFygBjNp1Li7c67Z1482vnyoYPdrh5nRZXa6lJOmmqqxAIWtuAz
         YDYQfNOqsiEqf4/pSMNnhBkz7EofKh7t9T5Oli6aMbuabLVENjxDJcesVfut1GP9e4LZ
         lMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755273098; x=1755877898;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLuuQdqXBRGyu60+ieS//bbxP+3AVwFN22YqAdloirM=;
        b=crX1S5stJloKe6N2Mp5rXTM6AbreRSst8NMVkNMws+HKamaTfn+xQhnHDKC9WGFGGe
         u41nqBXn3cKFDJjzCZ4CyH9xoMTiXqI2N8DTlULNzgbof0Ttv4Hvb77nvxNMUySgW3fp
         TiAz3zPjrKlfLM2tCEjSsUrSUVkS2LKgc7CCv+elpUptF223krGGbAkczJxbtd/TESmP
         IGKZ0uyCqjbAdnbvC+5reKmGzH08mKqdzMq68md1eUCq9XiIxWW6/ofJkQhw2UMgyT/j
         xI2j51ttAitkAGnIhWcDu1PF9Ru2WMHc4guGY2loZaXaKEBDgSAS8wvjUQ1HNMNh6ShT
         ElBw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Z3wAK+Wj1eqpswQU14YYE6HpgUjtiXueZDcN9mu4KP2jmImfuBawSX4yxsu3DBFEyDazuOnJd5hEoixs1n9A@lists.infradead.org
X-Gm-Message-State: AOJu0YzQreEH3wl9hTfqL/gyVIOWt8rDyQ/4/RvPRRJfT2vZBXGLHmOd
	vCA38VfREyj9rk/3s7GtuaEao11q1GoSI9SZ54QmaS9DMInIRR2xHvxAAjoiUXl7PyFk2oy+J8S
	UYNq5BA==
X-Google-Smtp-Source: AGHT+IEixUUF/+ontXG1UvvxuaP113HP3iSlTpnTS0Og0gwZnRo8djp+nSrKI0cvN3mMbDgB4JtBQNij17k=
X-Received: from pjee7.prod.google.com ([2002:a17:90b:5787:b0:321:c2d6:d1c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec3:b0:244:5aa5:a8b
 with SMTP id d9443c01a7336-2445aa50e20mr99042625ad.27.1755273098085; Fri, 15
 Aug 2025 08:51:38 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:51:36 -0700
In-Reply-To: <20250815130436.GA3289052@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-10-seanjc@google.com>
 <20250815130436.GA3289052@noisy.programming.kicks-ass.net>
Message-ID: <aJ9XiAa58oMs55Ky@google.com>
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
X-CRM114-CacheID: sfid-20250815_085139_762988_33ED2EB6 
X-CRM114-Status: GOOD (  14.83  )
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
> On Wed, Aug 06, 2025 at 12:56:31PM -0700, Sean Christopherson wrote:
> 
> > @@ -2727,6 +2739,21 @@ static struct pmu pmu = {
> >  	.filter			= x86_pmu_filter,
> >  };
> >  
> > +void arch_perf_load_guest_context(unsigned long data)
> > +{
> > +	u32 masked = data & APIC_LVT_MASKED;
> > +
> > +	apic_write(APIC_LVTPC,
> > +		   APIC_DM_FIXED | PERF_GUEST_MEDIATED_PMI_VECTOR | masked);
> > +	this_cpu_write(x86_guest_ctx_loaded, true);
> > +}
> 
> I'm further confused, why would this ever be masked?

The idea is to match the guest's LVTPC state so that KVM doesn't trigger IRQ
VM-Exits on counter overflow when the guest's LVTPC is masked.

