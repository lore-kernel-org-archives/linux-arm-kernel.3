Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DDEC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/FFsj5eZxy/dq4ieHOwY1YJ7qEFZIbh7dVWfAl62uY=; b=QA5Zy9wNXPTa4CRPvOdMlZYzVF
	uI7oogMHlznO7mLkXOsz6IqxXTkEhlp1VWcc1D5soXK+/pJKTTwEJm2evnUIa62Y9Qav/XpcOo6Ty
	sFw3TVyQNnC87OEmrPY5PQgUHX3LnxuCf2PYF4sGIL2Oz887clJAvLvn+P80E1DHN1I58bIKuX/9i
	OQpQxXOH44OyX99tD+6hWLmv1qIg6UsUTFE+zq7IiM5UPmiP25DXOdo++vqC//dasIAjl/l+wlgtg
	SOwrjHYS8bli9NHHc/unkMKhdR0rMnulB5cDndk3r3O02PZhKOQuS8X+mubsngn4jHKi0WFrAh38e
	Se2CUtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM70z-00000007kjK-1UwU;
	Mon, 02 Jun 2025 15:23:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6uA-00000007jdf-1uhH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:16:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC8071424;
	Mon,  2 Jun 2025 08:16:30 -0700 (PDT)
Received: from [10.57.47.191] (unknown [10.57.47.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BC4E3F5A1;
	Mon,  2 Jun 2025 08:16:43 -0700 (PDT)
Message-ID: <8a4c285e-2b6f-44f0-b1d8-0b5a6f6b6581@arm.com>
Date: Mon, 2 Jun 2025 16:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/43] arm64: RME: Handle realm enter/exit
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>,
 "Emi Kisanuki (Fujitsu)" <fj0570is@fujitsu.com>,
 "'kvm@vger.kernel.org'" <kvm@vger.kernel.org>,
 "'kvmarm@lists.linux.dev'" <kvmarm@lists.linux.dev>
Cc: 'Catalin Marinas' <catalin.marinas@arm.com>,
 'Marc Zyngier' <maz@kernel.org>, 'Will Deacon' <will@kernel.org>,
 'James Morse' <james.morse@arm.com>, 'Oliver Upton'
 <oliver.upton@linux.dev>, 'Zenghui Yu' <yuzenghui@huawei.com>,
 "'linux-arm-kernel@lists.infradead.org'"
 <linux-arm-kernel@lists.infradead.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 'Joey Gouly' <joey.gouly@arm.com>,
 'Alexandru Elisei' <alexandru.elisei@arm.com>,
 'Christoffer Dall' <christoffer.dall@arm.com>,
 'Fuad Tabba' <tabba@google.com>,
 "'linux-coco@lists.linux.dev'" <linux-coco@lists.linux.dev>,
 'Ganapatrao Kulkarni' <gankulkarni@os.amperecomputing.com>,
 'Gavin Shan' <gshan@redhat.com>,
 'Shanker Donthineni' <sdonthineni@nvidia.com>,
 'Alper Gun' <alpergun@google.com>,
 "'Aneesh Kumar K . V'" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-17-steven.price@arm.com>
 <TYCPR01MB11463D8002D90705A7F860B85C366A@TYCPR01MB11463.jpnprd01.prod.outlook.com>
 <673853c4-b7b0-4a7f-915e-37646ae8cf6f@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <673853c4-b7b0-4a7f-915e-37646ae8cf6f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081650_587250_A77A436D 
X-CRM114-Status: GOOD (  18.47  )
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

On 02/06/2025 16:14, Steven Price wrote:
> On 29/05/2025 05:52, Emi Kisanuki (Fujitsu) wrote:
>> Hello, I comment below.
> 
> Hi Emi,
> 
>>> Subject: [PATCH v8 16/43] arm64: RME: Handle realm enter/exit
>>>
>>> Entering a realm is done using a SMC call to the RMM. On exit the exit-codes
>>> need to be handled slightly differently to the normal KVM path so define our own
>>> functions for realm enter/exit and hook them in if the guest is a realm guest.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
> 
> [..]
> 
>>> +/*
>>> + * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason)
>>> +on
>>> + * proper exit to userspace.
>>> + */
>>> +int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret) {
>>> +	struct realm_rec *rec = &vcpu->arch.rec;
>>> +	u8 esr_ec = ESR_ELx_EC(rec->run->exit.esr);
>>> +	unsigned long status, index;
>>> +
>>> +	status = RMI_RETURN_STATUS(rec_run_ret);
>>> +	index = RMI_RETURN_INDEX(rec_run_ret);
>>> +
>>> +	/*
>>> +	 * If a PSCI_SYSTEM_OFF request raced with a vcpu executing, we
>>> might
>>> +	 * see the following status code and index indicating an attempt to run
>>> +	 * a REC when the RD state is SYSTEM_OFF.  In this case, we just need
>>> to
>>> +	 * return to user space which can deal with the system event or will try
>>> +	 * to run the KVM VCPU again, at which point we will no longer attempt
>>> +	 * to enter the Realm because we will have a sleep request pending on
>>> +	 * the VCPU as a result of KVM's PSCI handling.
>>> +	 */
>>> +	if (status == RMI_ERROR_REALM && index == 1) {
>>> +		vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
>>> +		return 0;
>>> +	}
>> Running kvm-unit-tests-cca selftest(smp) test in quick succession may trigger these conditions, resulting in the following error logs.
>>   Error: KVM exit reason: 0 ("KVM_EXIT_UNKNOWN")
>>
>> Since KVM_EXIT_UNKNOWN is used when no specific exit reason applies, I think it would be better to make it identifiable as an error.
>> How about adding and setting a new ARM64 exit_reason value to indicate that the PSCI_SYSTEM_OFF request is conflicting with a running vcpu?
> 
> Aneesh pointed this out to me off-list. We agreed that KVM_EXIT_SHUTDOWN
> was more appropriate here. I'll make the change for v9.

Sounds good to me

Cheers
Suzuki


