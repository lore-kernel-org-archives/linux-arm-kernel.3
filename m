Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2206CCCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mZtn147ikWvuq3oArSaA/nKxRJMYxqffmhEF5+2L50=; b=WFkjMSSpjUceCDZMvLyQe1PW3u
	jlcup2Me3TQFVBsMdun9DlC31CE63weZhhWgE6tS1SJf7H7fQSR7t9W62yTbqwC9z7mbyVB8jsNUx
	gstUnes2eqfKGVz7Se2HguMueHlVKu/s/lCIuNp0Feu66PuWLYuxTIZ71GtjAAgLfqF0PwoUcOros
	bigggGKH//xoVPubyB18PnobNlClUIU1iGmtfK2B6Rbk4b3bImT54yO7zwCLqP9tf4xe14VD1nacu
	3P/HO+a5iq/57y/9vZ4tNgzVzH6LSFnPFiLqiYTca87VTGhqxClqcrYaMRjtjHfRQ9nGoW+RGEClj
	7qnZKtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl4r-00000005kNA-07ga;
	Fri, 31 Oct 2025 09:05:45 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl4n-00000005kM6-1wOJ;
	Fri, 31 Oct 2025 09:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901541; x=1793437541;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qFNmSQUeXMaY7XvP4sAPgKkJ8Ev3XCXyw2q+qbAZDIU=;
  b=D+MDkPJIuJbXracYjeQPrhqp2Z1J8PA42DgmToB5mtukOzejdJb50tr6
   cLik5jPvXKRz1TM0r9X8dHdLwjvAhrFZvBTXG64qqlr2LGGgWJd057SKV
   riKu2x1GjGa/3ov1D3aXluC2bfwO+Lnvk7pyy+UKDpfTqKXZBJhDDNa+K
   wqzyu3ndmH8bFkjB8hFr8tj2gVzIxiJRl5hoyCY9nmtnDWF73mdl49V8F
   KacemejJhnFmXDuQYf52FiW0d3a1eqYStTprjDAyMJ5qMk7cdYqu1SXzT
   ZlAEQkWog/K+kF29XWI6K/5yTiO0WAP93vNCb8WIg58Du34qMeGWNFCv+
   Q==;
X-CSE-ConnectionGUID: tEiLt9G5SqyhLgFW8uPmOA==
X-CSE-MsgGUID: Tue60yezT+2yOgJW9ot+EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89523298"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="89523298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:05:41 -0700
X-CSE-ConnectionGUID: wf1Dt5UnRy6jaWYzdx9wDQ==
X-CSE-MsgGUID: x9G1JpmbTtGdOFT3heo6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186121954"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:05:32 -0700
Message-ID: <18ecf186-c3b9-4027-a54b-7f3e5ba9f484@linux.intel.com>
Date: Fri, 31 Oct 2025 17:05:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/28] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-21-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-21-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020541_515641_8C4F1DA8 
X-CRM114-Status: GOOD (  16.41  )
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



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Unconditionally assert that mmu_lock is held for write when removing S-EPT
> entries, not just when removing S-EPT entries triggers certain conditions,
> e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
> Conditionally asserting implies that it's safe to hold mmu_lock for read
> when those paths aren't hit, which is simply not true, as KVM doesn't
> support removing S-EPT entries under read-lock.
>
> Only two paths lead to remove_external_spte(), and both paths asserts that
                                                                 ^
                                                               assert
> mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
> handle_removed_pt() via KVM_BUG_ON()).
>
> Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
> that wait_for_sept_zap is guarded by holding mmu_lock for write, and keep
> the conditional assert in tdx_track() as well, but with a comment to help
> explain why holding mmu_lock for write matters (above and beyond why
> tdx_sept_remove_private_spte()'s requirements).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>   arch/x86/kvm/vmx/tdx.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 63d4609cc3bc..999b519494e9 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1715,6 +1715,11 @@ static void tdx_track(struct kvm *kvm)
>   	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
>   		return;
>   
> +	/*
> +	 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
> +	 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
> +	 * tracking epoch hasn't completed.
> +	 */
>   	lockdep_assert_held_write(&kvm->mmu_lock);
>   
>   	err = tdh_mem_track(&kvm_tdx->td);
> @@ -1762,6 +1767,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
>   	gpa_t gpa = gfn_to_gpa(gfn);
>   	u64 err, entry, level_state;
>   
> +	lockdep_assert_held_write(&kvm->mmu_lock);
> +
>   	/*
>   	 * HKID is released after all private pages have been removed, and set
>   	 * before any might be populated. Warn if zapping is attempted when


