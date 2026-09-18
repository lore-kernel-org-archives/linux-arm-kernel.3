Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CACC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POZ8I3KruROeVIpmgCcthihZacjjcRxYvIovx0soJVQ=; b=Jl0a/e11EK5AzwvdijCXFf84RV
	HxsJgLoIfgyrybTGUq1xJg9ODnBjv8ocBOly52g4/JLZN3tK9OWvfhTsraAnV9QkGppKPGb3aPZ2Y
	KyyQFlDmUFaSqfWXjxLah53hvusqy1vmVetGanPpv9aCK84qScNVOtuu29PPupBx/axIUoqMn3rZQ
	xzkm/o27aaNrtQLX7r8Jwf6MfEE1KIZtUDCWWgDeA1+HWpyCP1qOZ59+Q8i7rl6tqe3V99ksIEiET
	c7LxOPQkeStermQ9mLzuW+ewT4Rd839ecDZcDCv0+rb1y+ZMg/4qcRwMAcKR8LKKD+VSrlEOS/Unp
	aS8aPMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VBk-0000000DzI0-07Li;
	Fri, 18 Sep 2026 09:47:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VBh-0000000DzHO-35cB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:47:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3186168F;
	Fri, 18 Sep 2026 02:47:15 -0700 (PDT)
Received: from [10.57.6.197] (unknown [10.57.6.197])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801D93F882;
	Fri, 18 Sep 2026 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789724839; bh=eSlqW067KZEESlksS4pzEEOFJpVLZHMuQ6i8lq4fTU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fETqMfGisKk6NTxLoU1SBAaZzF4uzWxwEO9GudmINWmDd6C/oSVjhWMWDT2uStWJ5
	 ycmJ+DkKfZGrxwDKDUK3kQ1Wtz273cxB6y7o27WOQyO49zZ/JZpH46scbKmQExn0DR
	 sZ95l4hiNczrmOzTk5BdWjJEPwCKoXP6SGVSRv7s=
Message-ID: <76fb1cc8-60f4-4725-a839-76fcf928e232@arm.com>
Date: Fri, 18 Sep 2026 10:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 05/23] KVM: arm64: Track the type of VM in kvm_arch
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <20260915160141.3543048-6-suzuki.poulose@arm.com>
 <CA+EHjTz65G0MM=tOrzmk=jMweBX1us6FqfrmSkQs4KSyAEoxhg@mail.gmail.com>
 <e26cbb4e-84e2-4fcc-9eb0-93bfd4aff4a7@arm.com>
 <CA+EHjTw6TOSEs1GtUcUy9WACpGRJBA9yTn9Ro_+tiD=XkeHr4g@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTw6TOSEs1GtUcUy9WACpGRJBA9yTn9Ro_+tiD=XkeHr4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_024721_827551_CD26867C 
X-CRM114-Status: GOOD (  15.79  )
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

On 18/09/2026 10:14, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On <date>, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> [...]
>> +       if (WARN_ON_ONCE(!kvm))
>> +               return false;
>> +
>> +       /* Cover both pKVM host and Realm VMs */
>> +       if (!kvm_vm_hyp_is_distrusting(kvm))
>> +               return true;
> 
> I'd drop the WARN_ON_ONCE. 

I would say, we need it. i.e., we are filtering kvm_arch_vm_ioctl(),
where it is called from the kvm instance ioctl. So, kvm must be !NULL.


> And this early return needs the `>=` from
> patch 13, or non-protected pKVM VMs skip the filter.
> 

Of course, This snippet is for Patch 20 and I have fixed the comparison.


>> I resorted to is_protected_kvm_enabled() to make it faster than using
>> the vm_flavor checks. I could rever those anyways.
> 
> Agreed it's the faster test. I'd just call it by name at the three
> sites rather than through a macro.
> 
>> Do you mean something like :
>>
>>          if (kvm_vm_is_protected_pkvm(host_kvm))
>>                  hyp_vm->kvm.arch.vm_flavor = VM_PROTECTED_PKVM;
>>          else
>>                  hyp_vm->kvm.arch.vm_flavor = VM_PKVM;
> 
> Yes, exactly that.
> 
>> Do we additionally need to WARN_ON() if we encounter a VM_REALM ?
> 
> No, the host shouldn't be able to trigger a WARN at EL2.

Alright.

> 
>> Apologies, I thought this one didn't change, but later patches changes
>> them, which is why I kept this.
> 
> No worries. With those two in, please keep the tag.

Thanks
Suzuki

> 
> Cheers,
> /fuad


