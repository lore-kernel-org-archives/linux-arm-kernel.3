Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583CECCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 06:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8wTYakyYYGv8DE9O4+d7bWqzisPOemtKRNIS4+cn20=; b=o0gov9UPoWqP32UWEN9qIYIk7B
	KKtncRz4upgLTdC9W4izKVsTtb80QZI9Crs8Jn/T4/eIre7n0Kcg+UxC/hAGdIX7aMPNLwUTV7eFC
	COLYAy9qv6a/FP49OEc4QibVhP1sg3IxLt9lpLHbbrwu4qgsnI9ba/g7RCWK8Enh6aC99qHzj3vg0
	XwlyqbZRpgAsbZGHUcsxyurDnrAhC0vq9y2Ez0Dxj7gOqvg0d6pqLAe2YCCjeyHFwKgtQYPk6cXxI
	zwifd1ll5+VxFiRnxom63xFbDjcBZLmmM5tLtBnSi6GTPNOW6Xq3gympygSsXce/EVKl1xVtN2TMA
	sYwO52/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzow-0000000HVPl-2d2x;
	Wed, 29 Oct 2025 06:38:10 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzou-0000000HVOd-2W5q;
	Wed, 29 Oct 2025 06:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761719888; x=1793255888;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GQBcTt3q3jYhlQdBtZfxngxuplRCCGIsPQTXwR3o7QE=;
  b=VutCnYb16ShCw0/WazHyKZT7AWhVGxvnYP4qm0V/GYgXxX829JEh7m5U
   RlUtIR6TEJrT/nIB5z3HDvy6hWA58RbUn/7periIfJXEkMxE0GuDRQqsG
   cwZ/br2MumbG/CnNYbIGf3OtZwDCgxtvq3YCPKe2jz8JXIzkBzUeD7XAE
   TAFVOq7jeglQTf5+JwXFmhNDLIUU+zGix1lt1U/RJQxj6UHbiWGvr81/j
   u2DaaE/2yeHEYvEtYAkjXm1rO/KrzCg6TSNLGzpcJMyp8NC6xbDehnZnj
   VP68/fWwAuDnGLSoaZJ5Tz7L9+vP5ZQN4JTAHBPs65yspdzXWF1KLUZfG
   w==;
X-CSE-ConnectionGUID: LGJTmKf1QtOrn1TabjqaMQ==
X-CSE-MsgGUID: neVnEXLJRUyLKD7R1I4wSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75176263"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="75176263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:38:04 -0700
X-CSE-ConnectionGUID: 8nQPxS3sQHujSGq7kBId9A==
X-CSE-MsgGUID: W9e750ZQTU6M5dFb3BxcwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="190701774"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:37:57 -0700
Message-ID: <71006f78-7afa-4821-8bd1-9cd5b8d62a33@linux.intel.com>
Date: Wed, 29 Oct 2025 14:37:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: seanjc@google.com, ackerleytng@google.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, chenhuacai@kernel.org,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, ira.weiny@intel.com,
 kai.huang@intel.com, kas@kernel.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, maddy@linux.ibm.com, maobibo@loongson.cn,
 maz@kernel.org, michael.roth@amd.com, oliver.upton@linux.dev,
 palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
 vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com,
 zhaotianrui@loongson.cn
References: <aP-1qlTkmFUgTld-@google.com>
 <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_233808_677325_F3A69F19 
X-CRM114-Status: GOOD (  32.47  )
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



On 10/28/2025 8:28 AM, Rick Edgecombe wrote:
> Take MMU lock around tdh_vp_init() in KVM_TDX_INIT_VCPU to prevent
> meeting contention during retries in some no-fail MMU paths.
>
> The TDX module takes various try-locks internally, which can cause
> SEAMCALLs to return an error code when contention is met. Dealing with
> an error in some of the MMU paths that make SEAMCALLs is not straight
> forward, so KVM takes steps to ensure that these will meet no contention
> during a single BUSY error retry. The whole scheme relies on KVM to take
> appropriate steps to avoid making any SEAMCALLs that could contend while
> the retry is happening.
>
> Unfortunately, there is a case where contention could be met if userspace
> does something unusual. Specifically, hole punching a gmem fd while
> initializing the TD vCPU. The impact would be triggering a KVM_BUG_ON().
>
> The resource being contended is called the "TDR resource" in TDX docs
> parlance. The tdh_vp_init() can take this resource as exclusive if the
> 'version' passed is 1, which happens to be version the kernel passes. The
> various MMU operations (tdh_mem_range_block(), tdh_mem_track() and
> tdh_mem_page_remove()) take it as shared.
>
> There isn't a KVM lock that maps conceptually and in a lock order friendly
> way to the TDR lock. So to minimize infrastructure, just take MMU lock
> around tdh_vp_init(). This makes the operations we care about mutually
> exclusive. Since the other operations are under a write mmu_lock, the code
> could just take the lock for read, however this is weirdly inverted from
> the actual underlying resource being contended. Since this is covering an
> edge case that shouldn't be hit in normal usage, be a little less weird
> and take the mmu_lock for write around the call.
>
> Fixes: 02ab57707bdb ("KVM: TDX: Implement hooks to propagate changes of TDP MMU mirror page table")
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> Hi,
>
> It was indeed awkward, as Sean must have sniffed. But seems ok enough to
> close the issue.
>
> Yan, can you give it a look?
>
> Posted here, but applies on top of this series.
>
> Thanks,
>
> Rick
> ---
>   arch/x86/kvm/vmx/tdx.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index daec88d4b88d..8bf5d2624152 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -2938,9 +2938,18 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
>   		}
>   	}
>   
> -	err = tdh_vp_init(&tdx->vp, vcpu_rcx, vcpu->vcpu_id);
> -	if (TDX_BUG_ON(err, TDH_VP_INIT, vcpu->kvm))
> -		return -EIO;
> +	/*
> +	 * tdh_vp_init() can take a exclusive lock of the TDR resource inside
                                   ^
                                   an

> +	 * the TDX module. This resource is also taken as shared in several
> +	 * no-fail MMU paths, which could return TDX_OPERAND_BUSY on contention.
> +	 * A read lock here would be enough to exclude the contention, but take
> +	 * a write lock to avoid the weird inversion.
Can we also add the description that the lock is trying to prevent an edge case
as in the change log if not too wordy?

> +	 */
> +	scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
> +		err = tdh_vp_init(&tdx->vp, vcpu_rcx, vcpu->vcpu_id);
> +		if (TDX_BUG_ON(err, TDH_VP_INIT, vcpu->kvm))
> +			return -EIO;
> +	}
>   
>   	vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
>   


