Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1197FE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cszX7CaqF/yGZOef+lx+ZccZirVa0cMcifv32LPpuhM=; b=n9YGxUt6ITfao9z58iHTnGFteF
	Eq0z7AoT56Rs/II8g7YMmpUR+d98qu611xeeX/iDfCah9OooYX8fC15Qt8XZYwMsymtw//TZvPTWZ
	uN41GFx+F8197IvCYgcEBeT5hBT+EZ/hK8R2HXTLFfhdw27+7ZY6Dc2cE9JslMvLBrFiq78r8Zzj0
	GOALqVHwAi9vT9A4ppe4D3yli/Lx2Bfu1OrVhJ4ULHdNRd3BE5u7VCKEs4f1DDvX922E6JWzo0g9M
	/RJKQ+i19XW8VuD2RfKbkqVLrl5vZRM1xERAiPdhzoRobkKigZTSUqar0o0XhwTbdXR5jhvcWLLbI
	4ztrPC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGV4-00000004YWS-0KCZ;
	Mon, 13 Jan 2025 09:12:46 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJy-00000004W4c-2CsU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736758878; x=1768294878;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GjpsjNBlCIvWjfSOKHK63am7WrBnSESbIOn/HxwUlNw=;
  b=W6ZO+Y9lJtZyVEG7tKobQL5pcGpxhAHf4b2ZD/wUB/GP6jJAN1V7Tgnt
   3L8CrgkLAjHPFubuCiJWZM79SHKS4iJ2Mf3n/FIfUaNuQtrp2fu1pTi36
   d4Jb6mLjCxK3SCVBC2YYWb6zD6hvy5v4spQgXaupUAfVCsklJa5RR5P+q
   glPpcGu48fga2IVTh7NWezjNK5rIJWEF5hV53R5Ti6Zy3Fibu+4DqCscU
   IOq2pOBRWPU8+31UX+C/E6TJZqvkG1R5Lyb39GM/HigylAtm/3OR4920s
   GoN90T8kzuxbPxa7v+2qSQrbitVnK3tUlXcnKtCOFx5vgc071UbbBG4pH
   g==;
X-CSE-ConnectionGUID: kJ90j6hsQK2BtbVEnEMGPw==
X-CSE-MsgGUID: +VLj2Qq5SWGzaI8+YMcnEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="40684253"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40684253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:01:17 -0800
X-CSE-ConnectionGUID: MAr8JHcoQGOpnWk/c3wvbw==
X-CSE-MsgGUID: dQcu4Sj3RBa4cQc9Tnhosg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104923153"
Received: from unknown (HELO [10.238.1.62]) ([10.238.1.62])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:01:15 -0800
Message-ID: <f333d871-f579-4579-86a6-58030b9f024b@linux.intel.com>
Date: Mon, 13 Jan 2025 17:01:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an exit
 needs completion
To: Chao Gao <chao.gao@intel.com>, Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman
 <mpe@ellerman.id.au>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250111012450.1262638-1-seanjc@google.com>
 <20250111012450.1262638-4-seanjc@google.com> <Z4R12HOD1o8ETYzm@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <Z4R12HOD1o8ETYzm@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_010118_613576_1420F942 
X-CRM114-Status: GOOD (  22.27  )
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




On 1/13/2025 10:09 AM, Chao Gao wrote:
> On Fri, Jan 10, 2025 at 05:24:48PM -0800, Sean Christopherson wrote:
>> Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
>> that KVM_RUN needs to be re-executed prior to save/restore in order to
>> complete the instruction/operation that triggered the userspace exit.
>>
>> KVM's current approach of adding notes in the Documentation is beyond
>> brittle, e.g. there is at least one known case where a KVM developer added
>> a new userspace exit type, and then that same developer forgot to handle
>> completion when adding userspace support.
> This answers one question I had:
> https://lore.kernel.org/kvm/Z1bmUCEdoZ87wIMn@intel.com/
In current QEMU code, it always returns back to KVM via KVM_RUN after it
successfully handled a KVM exit reason, no matter what the exit reason is.
The complete_userspace_io() callback will be called if it has been setup.
So if a new kvm exit reason is added in QEMU, it seems QEMU doesn't need
special handing to make the complete_userspace_io() callback be called.

However, QEMU is not the only userspace VMM that supports KVM, it makes
sense to make the solution generic and clear for different userspace VMMs.

Regarding the support of MapGPA for TDX when live migration is considered,
since a big range will be split into 2MB chunks, in order the status is
right after TD live migration, it needs to set the return code to retry
with the next_gpa in the complete_userspace_io() callback if vcpu->wants_to_run
is false or vcpu->run->immediate_exit__unsafe is set, otherwise, TDX guest
will see return code as successful and think the whole range has been converted
successfully.

@@ -1093,7 +1093,8 @@ static int tdx_complete_vmcall_map_gpa(struct kvm_vcpu *vcpu)
          * immediately after STI or MOV/POP SS.
          */
         if (pi_has_pending_interrupt(vcpu) ||
-           kvm_test_request(KVM_REQ_NMI, vcpu) || vcpu->arch.nmi_pending) {
+           kvm_test_request(KVM_REQ_NMI, vcpu) || vcpu->arch.nmi_pending ||
+           !vcpu->wants_to_run) {
                 tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
                 tdx->vp_enter_args.r11 = tdx->map_gpa_next;
                 return 1;

Of course, it can be addressed later when TD live migration is supported.


>
> So, it is the VMM's (i.e., QEMU's) responsibility to re-execute KVM_RUN in this
> case.
>
> Btw, can this flag be used to address the issue [*] with steal time accounting?
> We can set the new flag for each vCPU in the PM notifier and we need to change
> the re-execution to handle steal time accounting (not just IO completion).
>
> [*]: https://lore.kernel.org/kvm/Z36XJl1OAahVkxhl@google.com/
>
> one nit below,
>
>> --- a/arch/x86/include/uapi/asm/kvm.h
>> +++ b/arch/x86/include/uapi/asm/kvm.h
>> @@ -104,9 +104,10 @@ struct kvm_ioapic_state {
>> #define KVM_IRQCHIP_IOAPIC       2
>> #define KVM_NR_IRQCHIPS          3
>>
>> -#define KVM_RUN_X86_SMM		 (1 << 0)
>> -#define KVM_RUN_X86_BUS_LOCK     (1 << 1)
>> -#define KVM_RUN_X86_GUEST_MODE   (1 << 2)
>> +#define KVM_RUN_X86_SMM			(1 << 0)
>> +#define KVM_RUN_X86_BUS_LOCK		(1 << 1)
>> +#define KVM_RUN_X86_GUEST_MODE		(1 << 2)
>> +#define KVM_RUN_X86_NEEDS_COMPLETION	(1 << 2)
> This X86_NEEDS_COMPLETION should be dropped. It is never used.
>


