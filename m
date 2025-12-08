Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F475D3B7DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efZXJuxHS7xVWs8j6wPPjjIqaUyZIp5UsFDsMPn2OKk=; b=TJpygUVtdOdtIHXca8vNAG5V5I
	xbgRttEGkSZO4Dxk+Y67U4TojIH2UAXkKLIB5Hqu7L2nheWRkZz0dPKUZ+w0EfOYfm/MEC0BnIYxu
	gsCTcXi9WF8GSffcxaD0gul8zew8G2bEqzpOxoFxea0NEdJeBcQlSrX1YfrJnp43ShxtekUlzwU5p
	8aOEAvk64Clj7feo6HDtE+ooo4LH8H/IalYvBu/LYgBr/WBT7sDvRDXl5MZMncI7uBD81ju8tSQ/Y
	1WoDEgy5zJY8GzJOrgbWT/NobpbAm9taHACaRcFiOgjMd/plSgZHY3AEyTEE7hxyUbtY6+CvzTnZp
	LJWJsfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXZK-0000000CsJz-21kA;
	Mon, 08 Dec 2025 09:30:10 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXZE-0000000CsIy-1UPY;
	Mon, 08 Dec 2025 09:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765186205; x=1796722205;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JcvwqgFLZTsix0sYAKimzPeJUH3wC8yywdSyJTN0AOA=;
  b=nXofIik18CH0JQSzkCZXBhsdsW6oayriLxNss4v2cHQ2prAOIIt/QQB4
   zpi2zaUEejwjuSPLwMjF8nuA8R7nq+XU9DRpwrJCmoDLFPaICSMJVzgyn
   C6+cPy0uLjsJ3ozTF10vCLzfa/I6v8HuHtQwAeOU39IzDWTtHZmZ3uRVs
   nAtXPnGvzucTC+O6tSR81ZzpFoI47cKbJ3mR4Qi81tkDZjkaUxoM3Vw9v
   vlL1k3g8hv/zTATX7bizX3KpGyC+b+LxOtU+9cAjQ5KISHUiOTZSg+PZK
   3QdYjBO5f5qGii8JcoDJYcJVbze9ajrIRTtIwyMTFPrafABBtmUnKXmSE
   g==;
X-CSE-ConnectionGUID: 3ziNoRN8Qd646LI7dmBZGg==
X-CSE-MsgGUID: KqlQfh9rTJWeLbF4AFXV4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="70979405"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="70979405"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:30:04 -0800
X-CSE-ConnectionGUID: hxoRms/XQeW3zbu9VYpNCQ==
X-CSE-MsgGUID: qMxDtETuSwGp66ogCtei0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200067632"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:29:56 -0800
Message-ID: <2440b9bf-a2a1-4f66-94b2-71f47d62f3db@linux.intel.com>
Date: Mon, 8 Dec 2025 17:29:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 37/44] KVM: VMX: Dedup code for removing MSR from
 VMCS's auto-load list
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
 <20251206001720.468579-38-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251206001720.468579-38-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_013004_512851_9770B2E2 
X-CRM114-Status: GOOD (  19.58  )
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


On 12/6/2025 8:17 AM, Sean Christopherson wrote:
> Add a helper to remove an MSR from an auto-{load,store} list to dedup the
> msr_autoload code, and in anticipation of adding similar functionality for
> msr_autostore.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 52bcb817cc15..a51f66d1b201 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1040,9 +1040,22 @@ static int vmx_find_loadstore_msr_slot(struct vmx_msrs *m, u32 msr)
>  	return -ENOENT;
>  }
>  
> +static void vmx_remove_auto_msr(struct vmx_msrs *m, u32 msr,
> +				unsigned long vmcs_count_field)
> +{
> +	int i;
> +
> +	i = vmx_find_loadstore_msr_slot(m, msr);
> +	if (i < 0)
> +		return;
> +
> +	--m->nr;
> +	m->val[i] = m->val[m->nr];

Sometimes the order of MSR writing does matter, e.g., PERF_GLOBAL_CTRL MSR
should be written at last after all PMU MSR writing. So directly moving the
last MSR entry into cleared one could break the MSR writing sequence and
may cause issue in theory.

I know this won't really cause issue since currently vPMU won't use the MSR
auto-load feature to save any PMU MSR, but it's still unsafe for future uses. 

I'm not sure if it's worthy to do the strict MSR entry shift right now.
Perhaps we could add a message to warn users at least.

Thanks.


> +	vmcs_write32(vmcs_count_field, m->nr);
> +}
> +
>  static void clear_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr)
>  {
> -	int i;
>  	struct msr_autoload *m = &vmx->msr_autoload;
>  
>  	switch (msr) {
> @@ -1063,21 +1076,9 @@ static void clear_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr)
>  		}
>  		break;
>  	}
> -	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
> -	if (i < 0)
> -		goto skip_guest;
> -	--m->guest.nr;
> -	m->guest.val[i] = m->guest.val[m->guest.nr];
> -	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
>  
> -skip_guest:
> -	i = vmx_find_loadstore_msr_slot(&m->host, msr);
> -	if (i < 0)
> -		return;
> -
> -	--m->host.nr;
> -	m->host.val[i] = m->host.val[m->host.nr];
> -	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
> +	vmx_remove_auto_msr(&m->guest, msr, VM_ENTRY_MSR_LOAD_COUNT);
> +	vmx_remove_auto_msr(&m->host, msr, VM_EXIT_MSR_LOAD_COUNT);
>  }
>  
>  static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,

