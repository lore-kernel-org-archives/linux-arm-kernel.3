Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12665C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H64AJO+QEn2Db/FE2KYiTNv1rxVZnKenKfvHvZ6Jp2c=; b=R/Z7L24hJyP6hLo/3DTm5z32Dc
	qIaoLr3KNDcxSlVbFHuSsLYC06lvs8f/0j+tmlI6nvcisabsgvFU4jkDh8WbVloLvjJ3iMLQtm9jT
	JM2oBt5Fjb6MDf+IM1mDSR1l+9hUdF7e23ajNLlgpPBkysBzulCNW4wVNphpcs5IUuG13bTLlegyp
	QvaohhLh8fFXR99DKWZFGvxl8n38Zaa/hsudoZegWMXLfD+D65iTM+pVasfB4S9VMc+n5zd/tcOLw
	dfsJAjCMUYI9AiQQV1Df8GOmbWzqmbW3bm/iHGM/YkJM4VpO59F7t9gHKrQNk8OV6vV0WmcDiDgjC
	0HJ9dhFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98RA-00000006eVu-18qZ;
	Tue, 22 Sep 2026 21:54:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98R6-00000006eVN-2uDX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:54:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 345A21576;
	Tue, 22 Sep 2026 14:53:54 -0700 (PDT)
Received: from [10.57.9.113] (unknown [10.57.9.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A78413F86C;
	Tue, 22 Sep 2026 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790114037; bh=iEXKQcOzPMWsKYq75EaN1jiHJmAyzN7PwBoNzOtpC8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oo+XUytAkDyV7Fg+PyMe7Zxe7vGy6ZfCfXw6bhiHy3FmXwXm3igb53OC7fXqwk2aA
	 he530u1cUMeV+mpe6hv50rPvo5d7JeAOVBYfRDmkigHtNOUiTluS4EKTFJC3kRrFJY
	 TFjqq5HT+a5NTBNXq06KQJiu5AtKO/xsciJ3ehWc=
Message-ID: <528f3c4a-723f-47ad-a387-6e6a4179c96a@arm.com>
Date: Tue, 22 Sep 2026 22:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 01/20] KVM: arm64: protected VM: Handle user writes to
 CNTVCT_EL0/CNTPCT_EL0
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-2-suzuki.poulose@arm.com>
 <20260922122542.00006868@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260922122542.00006868@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_145401_204056_3C67B733 
X-CRM114-Status: GOOD (  25.36  )
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

On 22/09/2026 20:25, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 22:28:26 +0100
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> 
> Hi Suzuki,
> 
>> Protected VMs doesn't allow setting offsets for virtual and phyiscal
> 
> physical
> 
>> counters, as the offset is always fixed to 0. The VM ioclt is filtered
> 
> ioctl
> 
>> out based on the cap. However we don't prevent the userspace from trying
>> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
>> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
>>
>> Fix this by always "fixing" the timer offsets to 0 and marking that the
>> timer offset is set in the kvm->arch.flags at KVM init time for protected
>> VMs. A userspace writing to the CNT*CT_EL0 would observe success, without
>> any real effect. This was chosen over preventing the writes to these
>> registers and returning -EPERM.
> 
> Why?  I don't mind the decision but telling us what was chosen is something
> we can see in the code - patch description should give us the stuff we
> can't see.

I have modified the paragraph to :

"Fix this by always "fixing" the timer offsets to 0 and marking that the
timer offset is set in the kvm->arch.flags at KVM init time for
protected VMs. This prevents the access to the VM specific vm_offset at
low cost. A userspace writing to the CNT*CT_EL0 would observe success,
without any real effect. This is cleaner over spilling *_is_protected()"
checks and "matches" what we really do in practise. i.e., always run
with "fixed counter offset of 0".

> 
> One comment on the comment below.
>>
>> Reported by Sashiko
>>
>> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
>> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v18:
>>   - Retain NULL vm_offset for protected VMs to avoid host tampering with the
>>     offset.
>>   - Moved the flag setting into kvm_timer_init_vm(), where it should have been
>>     in the first place
>> ---
>>   arch/arm64/kvm/arch_timer.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
>> index 6ac3321f4c575..226cd5a495c8b 100644
>> --- a/arch/arm64/kvm/arch_timer.c
>> +++ b/arch/arm64/kvm/arch_timer.c
>> @@ -1110,8 +1110,7 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
>>   		timer_context_init(vcpu, i);
>>   
>>   	/* Synchronize offsets across timers of a VM if not already provided */
>> -	if (!vcpu_is_protected(vcpu) &&
>> -	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
>> +	if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
>>   		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
>>   		timer_set_offset(vcpu_ptimer(vcpu), 0);
>>   	}
>> @@ -1133,6 +1132,15 @@ void kvm_timer_init_vm(struct kvm *kvm)
>>   	 */
>>   	for (int i = 0; i < NR_KVM_TIMERS; i++)
>>   		kvm->arch.timer_data.ppi[i] = get_vgic_ppi(kvm, default_ppi[i]);
>> +
>> +	/*
>> +	 * Protected VMs don't allow any offset being set from userspace,
>> +	 * either set via writes to the counters or using the dedicated
> This sentence confused me.  Second clause isn't obviously the ways that
> are being blocked. Maybe shorten to:
> 
> 	Protected VMs don't allow the offset to be set from userspace,
> 	whether via writes to the counters or the dedicated ioctl.

Ack, will improve it.

Cheers
Suzuki

> 
>> +	 * ioctl. Pretend the offset has already been set and rely on the
>> +	 * default offset being 0.
>> +	 */
>> +	if (kvm_vm_is_protected(kvm))
>> +		set_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &kvm->arch.flags);
>>   }
>>   
>>   void kvm_timer_cpu_up(void)
> 


