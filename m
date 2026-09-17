Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4044AC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhlxAcOiIPvNCI6XtYYt37UegodbaukuWdLcedU9a6M=; b=I3tSn1024TzidcHQ2IKJ4cLVIA
	Zlbo/doo/AUsebXtRCpaWfqfVe93Jrs3BwtLYNoIaCK7CO5Q8RtFjKfqleqjc9zQuyEXsUjDK8oKW
	uHZ9t2I/YVC3mYKoaLk26Eso5DNLqmz+HhYOVYXPorbzPsqRgV+Juq7NJytHh+9YzOUizc7ZPHLg6
	okFm2j1iVy0XUYDGP6GbgakHwVOnI3cdIAFZmbC/czWkYH79P5OHD7moKybwSukNGaaYa9H6gHwIg
	q7HYGK5FM4BltfK0ivbBkDbfBZ+KehuqSr2PugXTAeTLCoG1xtZEUiZwWO6bR3eYrqP2TS89di4Vi
	hDpf4uQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FZR-0000000C2YI-0Mrx;
	Thu, 17 Sep 2026 17:06:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FZO-0000000C2Wm-3GAo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:06:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B5FB143D;
	Thu, 17 Sep 2026 10:06:41 -0700 (PDT)
Received: from [10.57.6.197] (unknown [10.57.6.197])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99A9F3F7B4;
	Thu, 17 Sep 2026 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789664804; bh=xBQBpGmS5H6+MF+EvG/bUTp6vl9EzHg61YvBRsg6TLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e4s95459WLZ2gmCkD5mOtCaYCTAiUjwdIdAGe6Kjx6WPpwpiNfe5HJLwYOtd2ewqj
	 4XBgTCiC6wXridMPn70qDNChGX/o94y3YAO3qKDhHGvgkDO7vWXYvHa6uhPjcyka+h
	 bfYSLlIvhj10KknkHpEnmyAuyrAN0RoYjqDNGBsA=
Message-ID: <eac603c7-bcab-4c6c-a2ed-bf831d609a2e@arm.com>
Date: Thu, 17 Sep 2026 18:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 12/23] KVM: arm64: Widen the scope of "protected" VMs
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <20260915160141.3543048-13-suzuki.poulose@arm.com>
 <8633v85ch1.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <8633v85ch1.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100646_900521_91082F1A 
X-CRM114-Status: GOOD (  19.29  )
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

On 17/09/2026 12:44, Marc Zyngier wrote:
> On Tue, 15 Sep 2026 17:01:30 +0100,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> On arm64 we have "protected" VMs that run on PKVM as a confidential compute
>> guest. Given we already have the construct of "kvm_vm_is_protected" in the core
>> KVM code, use that for all confidential compute guests including Realms that
>> we are about to add.
>>
>> Use the VM flavor to detect the "protected" VMs by introducing a marker.
>> Add explicit helper to detect if a given VM is a "protected" VM under PKVM.
>> Change the existing users that precisely want to check the VM type. These
>> include :
>>    - kvm_arch_prepare_memory_region - For preventing memslot changes after pVM
>>      creation.
>>
>> All the others are retained as a wider check for confidential guest VMs.
>> These are:
>>   - kvm_vm_ioctl_set_counter_offset - For disallowing timer offset configuration
>>   - io_mem_abort for dabt handling without valid syndrome information
>>
>> Both of which are true for Realms too.
>>
>> Realms support is restricted to VHE host and thus "kvm_vm_is_protected()"
>> checks in the pkvm hyp specific code doesn't need to change, as the only
>> protected guests it deals with is "protected PKVM" guests.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/include/asm/kvm_host.h | 4 +++-
>>   arch/arm64/kvm/mmu.c              | 2 +-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 7ce46d853c47e..1bb43c57fb0f0 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -329,6 +329,7 @@ enum kvm_arm_vm_flavor {
>>   	VM_NVHE,
>>   	VM_VHE,
>>   	VM_PKVM,		/* Normal guests on pKVM */
>> +	MARKER(__VM_PROTECTED),
>>   	VM_PROTECTED_PKVM,	/* Protected VM */
>>   	VM_FLAVOR_MAX,
>>   };
>> @@ -1535,7 +1536,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>>   
>>   #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>>   
>> -#define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
>> +#define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor >= __VM_PROTECTED)
>> +#define kvm_vm_is_protected_pkvm(kvm)	((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
>>   #define kvm_vm_is_unprotected_pkvm(kvm)	((kvm)->arch.vm_flavor == VM_PKVM)
>>
> 
> This really should be added from where you introduce the enumeration,
> as my original patch did. Otherwise, this is pure churn for no benefit.

Ack, the idea was to introduce this, after converting the existing
code with the new wrappers. I will fold that change here.

Cheers
Suzuki

> 
> Thanks,
> 
> 	M.
> 


