Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C364E7AD40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 06:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRcJacw4RRwg/LVkcqvOxXC3HBKQq8AOhXzMR72wG7E=; b=cRLdCpglLzfx1AlZPbt3Mlv7Dx
	Ur7gL3MTWkQL6zdH5/vQAdH5o/wELAHohIGAnVKSHUbecel06CwCmKW23HLYRBhYMU2KBBbVVgPqk
	LRCbk/ImFf7jxovDEFlSko1Li4qTtuZrf2eu/B64m1l+sM0Pm0KGMZBzgXgR/i/yf5VSpJn/BQKb7
	ZZExs4yBgDT0i6rKzVmHiiaNDje3JyVQeUv0n+PBh3C6zA6N0/pIK7Jv2zKssbNz2ketSURk5o6xp
	L4YKtw17Zr0FYQbcokFui4qPyaZXFYTNbuvNcoz8fqb8O37oYdLsmKvzUzjdyNn3IrIrIQs5JbjuF
	Vt0emGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeoX-000000007vq-1DhY;
	Thu, 25 Dec 2025 06:27:09 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeoU-000000007ug-34PH;
	Thu, 25 Dec 2025 06:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766644027; x=1798180027;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p1XfubM0YWj6WnMP8u+aCWSf2k0v8QcI9Wgv+fon5Ck=;
  b=E4dzvruNcXQE5dw9kyc+jRTBrmIE7QvS576jan+va5QuBsyRkHFlktZH
   vS/jnf6/P0u400jmA2rsbb2BQmmm2qun4SR/Xcsa79iHWj80++5q4vlVY
   LKhE+gXWjunWXMVTVyp5HlAFlMe6KxxmVMYU42qVkeWNEDxNUeAuPrK/F
   9/JZZhfCsAIv1FOKpt0qc53RNF+jHSoTLTBLNWwelZh8DMgTQFjje2r+a
   6cCb3dznAgHmk8riR5vVQZH4dMfne9Dey9KfneJg/RkABA1/qKC6rLnH8
   5BpiLgNRR4KWcJuxdFqdzXA1+moZ/16Jr51pec23Hvjhg9nbFNbDKoV17
   g==;
X-CSE-ConnectionGUID: OTv80gozRRqW02uziagCxA==
X-CSE-MsgGUID: tcAwYgnpTG+NBpXxdUordw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68340500"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68340500"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:27:06 -0800
X-CSE-ConnectionGUID: DUtRii2LTCeg4q7vXPJ1zA==
X-CSE-MsgGUID: a7dRTs5tS6S+a0BISdFYdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200649863"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.14]) ([10.124.240.14])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:26:59 -0800
Message-ID: <43d1cde6-2277-4f3c-8e7d-59e6edb2228a@linux.intel.com>
Date: Thu, 25 Dec 2025 14:26:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/44] KVM: x86/pmu: Snapshot host (i.e. perf's)
 reported PMU capabilities
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>,
 Sandipan Das <sandipan.das@amd.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-16-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251206001720.468579-16-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_222706_805582_8A8BBD19 
X-CRM114-Status: GOOD (  14.50  )
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


On 12/6/2025 8:16 AM, Sean Christopherson wrote:
> Take a snapshot of the unadulterated PMU capabilities provided by perf so
> that KVM can compare guest vPMU capabilities against hardware capabilities
> when determining whether or not to intercept PMU MSRs (and RDPMC).
>
> Reviewed-by: Sandipan Das <sandipan.das@amd.com>
> Tested-by: Xudong Hao <xudong.hao@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/pmu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index 487ad19a236e..7c219305b61d 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -108,6 +108,8 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
>  	bool is_intel = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
>  	int min_nr_gp_ctrs = pmu_ops->MIN_NR_GP_COUNTERS;
>  
> +	perf_get_x86_pmu_capability(&kvm_host_pmu);
> +
>  	/*
>  	 * Hybrid PMUs don't play nice with virtualization without careful
>  	 * configuration by userspace, and KVM's APIs for reporting supported

Hi Sean,

It looks a merging error here. We don't need this patch.

The original patch "51f34b1 ("KVM: x86/pmu: Snapshot host (i.e. perf's)
reported PMU capabilities")" had been merged into upstream and subsequently
we submitted a new patch "034417c1439a ("KVM: x86/pmu: Don't try to get
perf capabilities for hybrid CPUs")" to fix the warning introduced from
previous patch  "51f34b1 ("KVM: x86/pmu: Snapshot host (i.e. perf's)
reported PMU capabilities")". Thanks.

-Dapeng Mi



