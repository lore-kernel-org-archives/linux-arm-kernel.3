Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B14C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 02:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEzSNiK2rtt9tFKeqxpWnCWx8fMo/EiFRsu+X8L3ewk=; b=Uy0iIz+4wtR/7BZ8UsmCWPVkie
	ZYyCJoPD3WEP92fm4Cir8r/p/+o+syhSJ2lGOgNVkoUYsoKtMYGrMKyEr6lJsMDQeV4M73R9kWtLr
	Pd3p/o96H86hHfIOcKVjXP4YAVMIdPlen/o7dVBgnuCtES6jT4PtgyunJTRSf0o9KKBVpKaJRfnUT
	3mbpdx7K4WtGjnddZ6IsWvKoERrOh8YTabB/VGMjfRXtxC3+Zt/WMzRUABUNU+92PHzFdMpPIr7cq
	3VqCueByBX3yEpvX+njYE+edPG8nwbRJMDjvJWxlHiuhIREd0FDRTZ0HcxA40+p0WhnrIyofKcioQ
	GGr5lLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugwGs-00000000Wnh-3s8q;
	Wed, 30 Jul 2025 02:10:28 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugwEO-00000000Wb2-1KoJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 02:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753841268; x=1785377268;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v6dnOhkoR0tGYQVmkdgXvFqmTTm7IALBGWk838ffNfw=;
  b=Vj+C4Fzuk686pdrjOjQdaDDgl7FKfx5RedcvQq1EKOU5Pgo1/X7jTDCj
   UCTD8+umVA6rfPJsK93sJG9wnVyI/5HB6IcABSndrZzvLRWChANbmDKiG
   2yU9SvuerOvWuOioYddpf9yXAXnTCXSQcUKToKqO4wh6sabDmDSyPxk32
   /YoW0zRVFYlEAc/o3PhxyfViXmRnpwlTH98Q60FH9dM2npakh4U+7exI4
   3vMpYeP8nEQNXrquZGep1d7CZWbGP/cEVPXUP+h+nVUdGNzhCWKC1P/LV
   WYvxLNaH5xrF/cXclm4HqSEKnOBgnrYiTHSCaFED42B7wyigqK9mIcpq8
   g==;
X-CSE-ConnectionGUID: 9UNfroI8T6aQp2vnuhJofQ==
X-CSE-MsgGUID: Ic2a8SpiQSWWo8PKuy8Vbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59956665"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="59956665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 19:07:43 -0700
X-CSE-ConnectionGUID: MoMgqtUNQ0OE3upc11w1ig==
X-CSE-MsgGUID: SBJJE9KuRWKMlW9/gXJRzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="186526908"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 19:07:39 -0700
Message-ID: <1b0ea352-c645-461b-9e19-5202791f8e2d@intel.com>
Date: Wed, 30 Jul 2025 10:07:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] KVM: TDX: Exit with MEMORY_FAULT on unexpected
 pending S-EPT Violation
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>
References: <20250729193341.621487-1-seanjc@google.com>
 <20250729193341.621487-3-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250729193341.621487-3-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_190748_372391_DD69D729 
X-CRM114-Status: GOOD (  20.00  )
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

On 7/30/2025 3:33 AM, Sean Christopherson wrote:
> Exit to userspace with -EFAULT and a valid MEMORY_FAULT exit if a vCPU
> hits an unexpected pending S-EPT Violation instead of marking the VM dead.
> While it's unlikely the VM can continue on, whether or not to terminate
> the VM is not KVM's decision to make.
> 
> Set memory_fault.size to zero to communicate to userspace that reported
> fault is "bad", and to effectively terminate the VM if userspace blindly
> treats the exit as a conversion attempt (KVM_SET_MEMORY_ATTRIBUTES will
> fail with -EINVAL if the size is zero).

This sets a special contract on size zero.

I had a patch internally, which introduce a new exit type:

+               /* KVM_EXIT_GUEST_ERROR */
+               struct {
+  #define KVM_GUEST_ERROR_TDX_ACCESS_PENDING_PAGE      0
+                       __u32 error_type;
+                       __u32 ndata;
+                       __u64 data[16];
+               } guest_error;

how about it?

> Opportunistically delete the pr_warn(), which could be abused to spam the
> kernel log, and is largely useless outside of interact debug as it doesn't
> specify which VM encountered a failure.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/vmx/tdx.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 3e0d4edee849..c2ef03f39c32 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1937,10 +1937,8 @@ static int tdx_handle_ept_violation(struct kvm_vcpu *vcpu)
>   
>   	if (vt_is_tdx_private_gpa(vcpu->kvm, gpa)) {
>   		if (tdx_is_sept_violation_unexpected_pending(vcpu)) {
> -			pr_warn("Guest access before accepting 0x%llx on vCPU %d\n",
> -				gpa, vcpu->vcpu_id);
> -			kvm_vm_dead(vcpu->kvm);
> -			return -EIO;
> +			kvm_prepare_memory_fault_exit(vcpu, gpa, 0, true, false, true);
> +			return -EFAULT;
>   		}
>   		/*
>   		 * Always treat SEPT violations as write faults.  Ignore the


