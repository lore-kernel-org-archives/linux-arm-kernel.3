Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739C0CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbdunN4haAHrdD+6QdZITufnwfX2T2bUXhrn0nBVi3M=; b=uzD8wleLIerORU7FyBp3HqrhVM
	TNzEdBqUtvgt8i4YRXxHshiOPw0seqIjVaoBHLypHp2JeH0FaleAcIRPCxtuarUMIXzufwiqktCzD
	V9DbGeA3nhY4Le9JT52KO7JD3DOCrfDgj7RkmcgcZc1HA0npYNYd9g0Q+sizYRIZtJ696ZBbXhCiT
	hLQ/U7siaIAfbdMieT0Y+mK+Qz+WzaU0D32Lz9OII7ZXpK1V7mYMRPs+IRXN/btKeHDSqsc2KGL01
	yYzexRuH6V7Rx7t78eUgKLgvUTVFa+79R/29uokOMR90Y0de9ATtWzbO/2lYbXmnH2FUAWVaVwZV+
	WFaJY+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVfr-00000003725-3PYI;
	Mon, 08 Jun 2026 08:49:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVfp-0000000371k-3QY9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:49:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C0621596;
	Mon,  8 Jun 2026 01:49:25 -0700 (PDT)
Received: from [10.57.28.93] (unknown [10.57.28.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3B043F62B;
	Mon,  8 Jun 2026 01:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780908570; bh=qWIbo9Jph/VqJbQLKnGpxwigEGe2RpFukz/vUdfHRbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h8xPaLJJCRjZLDMWSuF+FYRCSpx0fOTs4+bUdTghjG+5rXEpQqPWn3P3D+ry8k7/R
	 G2TVLclRVYqoTNxBdcdovuvEkUBVpi85wsuA+AoBu4HoqyCcBpgfDmIdVqqVMONSGv
	 B8A0i/PwkdgdlyEiRYSSB1sf+RZUaN9jvedXyAuw=
Message-ID: <92882427-7ce4-4cb3-a25d-3942a9ec40c3@arm.com>
Date: Mon, 8 Jun 2026 09:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 24/44] KVM: arm64: Handle realm MMIO emulation
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-25-steven.price@arm.com>
 <8b648b59-c411-4126-be18-686d2927f24a@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <8b648b59-c411-4126-be18-686d2927f24a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_014933_946845_766F1897 
X-CRM114-Status: GOOD (  22.48  )
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

On 28/05/2026 06:03, Gavin Shan wrote:
> Hi Steve,
> 
> On 5/13/26 11:17 PM, Steven Price wrote:
>> MMIO emulation for a realm cannot be done directly with the VM's
>> registers as they are protected from the host. However, for emulatable
>> data aborts, the RMM uses GPRS[0] to provide the read/written value.
>> We can transfer this from/to the equivalent VCPU's register entry and
>> then depend on the generic MMIO handling code in KVM.
>>
>> For a MMIO read, the value is placed in the shared RecExit structure
>> during kvm_handle_mmio_return() rather than in the VCPU's register
>> entry.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v7:
>>   * New comment for rec_exit_sync_dabt() explaining the call to
>>     vcpu_set_reg().
>> Changes since v5:
>>   * Inject SEA to the guest is an emulatable MMIO access triggers a data
>>     abort.
>>   * kvm_handle_mmio_return() - disable kvm_incr_pc() for a REC (as the PC
>>     isn't under the host's control) and move the REC_ENTER_EMULATED_MMIO
>>     flag setting to this location (as that tells the RMM to skip the
>>     instruction).
>> ---
>>   arch/arm64/kvm/inject_fault.c |  4 +++-
>>   arch/arm64/kvm/mmio.c         | 16 ++++++++++++----
>>   arch/arm64/kvm/rmi-exit.c     | 14 ++++++++++++++
>>   3 files changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/
>> inject_fault.c
>> index 89982bd3345f..6492397b73d7 100644
>> --- a/arch/arm64/kvm/inject_fault.c
>> +++ b/arch/arm64/kvm/inject_fault.c
>> @@ -228,7 +228,9 @@ static void inject_abt32(struct kvm_vcpu *vcpu,
>> bool is_pabt, u32 addr)
>>     static void __kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64
>> addr)
>>   {
>> -    if (vcpu_el1_is_32bit(vcpu))
>> +    if (unlikely(vcpu_is_rec(vcpu)))
>> +        vcpu->arch.rec.run->enter.flags |= REC_ENTER_FLAG_INJECT_SEA;
>> +    else if (vcpu_el1_is_32bit(vcpu))
>>           inject_abt32(vcpu, iabt, addr);
>>       else
>>           inject_abt64(vcpu, iabt, addr);
>> diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
>> index e2285ed8c91d..6a8cb927fcca 100644
>> --- a/arch/arm64/kvm/mmio.c
>> +++ b/arch/arm64/kvm/mmio.c
>> @@ -6,6 +6,7 @@
>>     #include <linux/kvm_host.h>
>>   #include <asm/kvm_emulate.h>
>> +#include <asm/rmi_smc.h>
>>   #include <trace/events/kvm.h>
>>     #include "trace.h"
>> @@ -138,14 +139,21 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu)
>>           trace_kvm_mmio(KVM_TRACE_MMIO_READ, len, run->mmio.phys_addr,
>>                      &data);
>>           data = vcpu_data_host_to_guest(vcpu, data, len);
>> -        vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu), data);
>> +
>> +        if (vcpu_is_rec(vcpu))
>> +            vcpu->arch.rec.run->enter.gprs[0] = data;
>> +        else
>> +            vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu), data);
>>       }
>>         /*
>>        * The MMIO instruction is emulated and should not be re-executed
>>        * in the guest.
>>        */
>> -    kvm_incr_pc(vcpu);
>> +    if (vcpu_is_rec(vcpu))
>> +        vcpu->arch.rec.run->enter.flags |= REC_ENTER_FLAG_EMULATED_MMIO;
>> +    else
>> +        kvm_incr_pc(vcpu);
>>         return 1;
>>   }
>> @@ -167,14 +175,14 @@ int io_mem_abort(struct kvm_vcpu *vcpu,
>> phys_addr_t fault_ipa)
>>        * No valid syndrome? Ask userspace for help if it has
>>        * volunteered to do so, and bail out otherwise.
>>        *
>> -     * In the protected VM case, there isn't much userspace can do
>> +     * In the protected/realm VM case, there isn't much userspace can do
>>        * though, so directly deliver an exception to the guest.
>>        */
>>       if (!kvm_vcpu_dabt_isvalid(vcpu)) {
>>           trace_kvm_mmio_nisv(*vcpu_pc(vcpu), esr,
>>                       kvm_vcpu_get_hfar(vcpu), fault_ipa);
>>   -        if (vcpu_is_protected(vcpu))
>> +        if (vcpu_is_protected(vcpu) || vcpu_is_rec(vcpu))
>>               return kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
>>             if (test_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
>> diff --git a/arch/arm64/kvm/rmi-exit.c b/arch/arm64/kvm/rmi-exit.c
>> index e7c51b6cf6ce..8ec0d179eba2 100644
>> --- a/arch/arm64/kvm/rmi-exit.c
>> +++ b/arch/arm64/kvm/rmi-exit.c
>> @@ -25,6 +25,20 @@ static int rec_exit_reason_notimpl(struct kvm_vcpu
>> *vcpu)
>>     static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
>>   {
>> +    struct realm_rec *rec = &vcpu->arch.rec;
>> +
>> +    /*
>> +     * In the case of a write, copy over gprs[0] to the target GPR,
>> +     * preparing to handle MMIO write fault. The content to be
>> written has
>> +     * been saved to gprs[0] by the RMM (even if another register was
>> used
>> +     * by the guest). In the case of normal memory access this is
>> redundant
>> +     * (the guest will replay the instruction), but the overhead is
>> +     * minimal.
>> +     */
>> +    if (kvm_vcpu_dabt_iswrite(vcpu) && kvm_vcpu_dabt_isvalid(vcpu))
>> +        vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu),
>> +                 rec->run->exit.gprs[0]);
>> +
> 
> { } is needed here.

Indeed - I'm surprised checkpatch didn't manage to flag that. I'll fix.

Thanks,
Steve

>>       return kvm_handle_guest_abort(vcpu);
>>   }
>>   
> 
> Thanks,
> Gavin
> 


