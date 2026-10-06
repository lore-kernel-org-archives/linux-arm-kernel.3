Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B36ECA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 05:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTPY8ZZpfxQqN4oLycdqvwObABo/0V3Go5JYh0Bs4ig=; b=qIwXR+uxmXo3u2JiZF42jabiQu
	BeF/rnYlabvWxWEDFA1gBsn0L3YUXh3Uy79C+f9207gMApNOZxd3NbtmjGq6s5h3bPy4DN9c0oqsN
	7+awCxy4NQKAgQzrLWPmZvhzja3PwnuT1Ke6jw09IeaKhQ51pJPBbxghGZJRMzSmVYBnGg/RHoFGl
	Bp2WUYSWrd+SAbuKMRcZqh90pPGCoOXhkahas3gBUSwc2mfjGGGsLoB8z+rSglkqq1pVMrkabAxgw
	Mkz7YhRM5Jw1i6MDPYcbzcLhyVzxTOea3dzjI/zGI6aQM44Wwg5JbvYL9+HJbVTFIyl6TOHtnwLdf
	FCxkFt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxgk-0000000040k-15XA;
	Tue, 06 Oct 2026 05:26:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxgi-0000000040Q-0Xqr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 05:26:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9664C143D;
	Mon,  5 Oct 2026 22:25:59 -0700 (PDT)
Received: from [10.57.10.233] (unknown [10.57.10.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 047533F763;
	Mon,  5 Oct 2026 22:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791264363; bh=T27n/CS63jvcAJPIpOTMHb6o5n0o35jyMs3J5GrsRf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZOHKzYeyr5pX4PXgwPjbv5swyyCShOtBM3F7PorhIUACLRNa6afD1gd34KGVUSMvH
	 yLeH9ABhsdHbazhWnOJyZOKqaqIJpYxADcWkcM6mFFw8TPBJCbMKFzVVINsbqd8vR9
	 rV+VBMmlOlhIWlwrbiUTNkzXXfJkUZ5+22UDGmVk=
Message-ID: <32f0b0f6-bea4-49b1-a735-f9786cfc6e52@arm.com>
Date: Tue, 6 Oct 2026 07:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 13/23] KVM: arm64: Abstract out memory abort handling
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-14-suzuki.poulose@arm.com>
 <d8bdfcaf-3b4f-4ab1-9b73-597c60bbb60b@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <d8bdfcaf-3b4f-4ab1-9b73-597c60bbb60b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_222604_235350_2BDB1593 
X-CRM114-Status: GOOD (  12.54  )
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

On 06/10/2026 04:07, Gavin Shan wrote:
> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>> Move the memory abort handling under VM specific s2 operation.
>>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v21:
>>   - Rename protected_vm_mem_abort => protected_pkvm_mem_abort for 
>> consistency
>>     with the other callbacks.
>> ---
>>   arch/arm64/include/asm/kvm_host.h |  2 ++
>>   arch/arm64/kvm/mmu.c              | 33 ++++++++++++++++++-------------
>>   2 files changed, 21 insertions(+), 14 deletions(-)
>>
> 
> One nitpick below. In either way:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks Gavin !

...

>> +static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>> +{
>> +    struct kvm_vcpu *vcpu = s2fd->vcpu;
>> +
>> +    VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
>> +            !kvm_is_write_fault(vcpu) &&
>> +            !kvm_vcpu_trap_is_exec_fault(vcpu));
>> +
>> +    if (kvm_slot_has_gmem(s2fd->memslot))
>> +        return gmem_abort(s2fd);
>> +    else
>> +        return user_mem_abort(s2fd);
>> +}
> 
> The "if...else" block is moved from kvm_handle_guest_abort(), but it 
> might be
> clearer if we have:
> 
>      if (kvm_slot_has_gmem(s2fd->memslot))
>          return gmem_abort(s2fd);
> 
>      return user_mem_abort(s2fd);

This was chosen based on another review comment. So, lets stick with 
this now.

Cheers
Suzuki

