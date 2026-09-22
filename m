Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D353C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 23:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kElfCnkCFruzVM3SaxHurt7TPit3re6e4vf8FVGEvw4=; b=IL9wVRSsEh/vrGQF3e7HRODIKT
	q5HpgY++uQB9ubXN8/x1Vy5IhVosBk4kyh4+j6rC3cg1O4sRY9C8BpxBRBjuTLSZ3J1nB2buLTGto
	ebE8iYkpz1RoaDFLkjHwcuqT9Mbq9hMfhD1MDs4T1nrCXb9xgIOP0wqycsDPtWvEBAzQlg+0qKV8h
	qftRSs/7ONy5WpaxKC/Ykz1rOdSq73FyXsqN6z8yivBHifnwhQRJSrZDAxBUSmUI3sDZ33AOB3qjX
	xr4RBIkmlVjHFNPbOyPTnS5so4j+KWDhls/h9J4Zv7MXbnGMXZjQ231tWtNEqLiyKOuIAX9aVzV2g
	g1Ca6ujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ALH-00000006lEg-1kwU;
	Tue, 22 Sep 2026 23:56:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ALE-00000006lEI-16eE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 23:56:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A988D1576;
	Tue, 22 Sep 2026 16:55:58 -0700 (PDT)
Received: from [10.57.9.113] (unknown [10.57.9.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF8233F86C;
	Tue, 22 Sep 2026 16:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790121362; bh=G8e6M2uF5epg0mdfJRhXU7Czxsd8V/rsRUnhd2e/rrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lXkRV98IlCqEa2C1khLd5C/DO/ZTEFQkQu/n//GoWxoIScMUHPHfA23likhQx/JAJ
	 Co84JB7vhjPa8oK53a/9h+ii2RGG0r3oaFh9exwYqC+1a6NWsH+GwXXyAilBEt6a2V
	 kyJYdkk0MkYF/W59YXBGyRub4EhwgWIEmkA+3bz4=
Message-ID: <84e8bbc0-30de-4741-933c-c24337507edb@arm.com>
Date: Wed, 23 Sep 2026 00:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 10/20] KVM: arm64: Abstract out memory abort handling
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
 <20260920212845.707-11-suzuki.poulose@arm.com>
 <20260922153826.000044fb@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260922153826.000044fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_165604_452271_C73E5F4E 
X-CRM114-Status: GOOD (  20.49  )
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

On 22/09/2026 23:38, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 22:28:35 +0100
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> 
>> Move the memory abort handling under VM specific s2 operation.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Trivial comment + request to follow through on adding the local
> variable for kvm. I think the other places that can be used
> survive the other changes in this patch set.
> 
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index d97a4a1bca23f..cf293d09e940a 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
> 
> 
>> +static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>> +{
>> +	int ret;
>> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
>> +
>> +	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
>> +			!kvm_is_write_fault(vcpu) &&
>> +			!kvm_vcpu_trap_is_exec_fault(vcpu));
>> +
>> +	if (kvm_slot_has_gmem(s2fd->memslot))
>> +		ret = gmem_abort(s2fd);
>> +	else
>> +		ret = user_mem_abort(s2fd);
>> +	return ret;
> 
> Personal preference but I'd just do
> 		return gmem_abort(s2fd);
> 	else
> 		return user_mem_abort(s2fd);

Ack

> 
> and save a couple of lines. I'd keep the else to make it clear it is
> an either / or choice rather than an if something true one.
> 
>> +}
>> +
>>   /* Resolve the access fault by making the page young again. */
>>   static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>>   {
>> @@ -2287,6 +2303,7 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>>   int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>   {
>>   	struct kvm_s2_trans nested_trans, *nested = NULL;
>> +	struct kvm *kvm = vcpu->kvm;
> 
> If introducing this, also use it for the other places vcpu->kvm is used
> in this function.  Separate patch though to keep down noise.
> Looks like that's mostly to shorten the chain of dereferences in the
> locks.

Added a preparatory patch to convert the other users to a local "kvm"
variable.

Cheers
Suzuki


