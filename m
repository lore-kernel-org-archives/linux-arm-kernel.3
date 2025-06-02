Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A06EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlWOdcP2/rkZtQ7rahUUcfFvUti3hWcus6aVPkL4cuk=; b=Wv5LeYeR6g1HmRO1C8uDTz4Ft4
	9CncaAniBhuELB7uuBz1WhhoopXTqGR0udN1daMkyYrubFD1l0wXImPqqjbZZIIP/QShUH16R+XHS
	Zro4tqDDC4qdp5RyKIfAk/TmCAjoHo2O9EyfJinExCSynxa4hxZusYsIMjmKeABX4xpb4ouexxQRD
	SPYY0lgmr3ufTIsKYZXiR1p/oGHkmJQOHxOtEk7vscZVH+AdtwY2jEiqAn6gCfuBwTjI+B3ld4A9v
	WMTOOHGtldq1wcRccNcM1ZzyXDNQvE1ihqsyqJvUKEYPezGdRtsAby6JIcFLsagWWieWwRg14M8ew
	tOlVTYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6uV-00000007jgh-2KA7;
	Mon, 02 Jun 2025 15:17:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6sI-00000007jLr-0RiB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:14:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABBED1424;
	Mon,  2 Jun 2025 08:14:34 -0700 (PDT)
Received: from [10.57.64.248] (unknown [10.57.64.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22FDA3F5A1;
	Mon,  2 Jun 2025 08:14:46 -0700 (PDT)
Message-ID: <673853c4-b7b0-4a7f-915e-37646ae8cf6f@arm.com>
Date: Mon, 2 Jun 2025 16:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/43] arm64: RME: Handle realm enter/exit
To: "Emi Kisanuki (Fujitsu)" <fj0570is@fujitsu.com>,
 "'kvm@vger.kernel.org'" <kvm@vger.kernel.org>,
 "'kvmarm@lists.linux.dev'" <kvmarm@lists.linux.dev>
Cc: 'Catalin Marinas' <catalin.marinas@arm.com>,
 'Marc Zyngier' <maz@kernel.org>, 'Will Deacon' <will@kernel.org>,
 'James Morse' <james.morse@arm.com>, 'Oliver Upton'
 <oliver.upton@linux.dev>, 'Suzuki K Poulose' <suzuki.poulose@arm.com>,
 'Zenghui Yu' <yuzenghui@huawei.com>,
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
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <TYCPR01MB11463D8002D90705A7F860B85C366A@TYCPR01MB11463.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081454_236831_0344EEF0 
X-CRM114-Status: GOOD (  23.60  )
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

On 29/05/2025 05:52, Emi Kisanuki (Fujitsu) wrote:
> Hello, I comment below.

Hi Emi,

>> Subject: [PATCH v8 16/43] arm64: RME: Handle realm enter/exit
>>
>> Entering a realm is done using a SMC call to the RMM. On exit the exit-codes
>> need to be handled slightly differently to the normal KVM path so define our own
>> functions for realm enter/exit and hook them in if the guest is a realm guest.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---

[..]

>> +/*
>> + * Return > 0 to return to guest, < 0 on error, 0 (and set exit_reason)
>> +on
>> + * proper exit to userspace.
>> + */
>> +int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret) {
>> +	struct realm_rec *rec = &vcpu->arch.rec;
>> +	u8 esr_ec = ESR_ELx_EC(rec->run->exit.esr);
>> +	unsigned long status, index;
>> +
>> +	status = RMI_RETURN_STATUS(rec_run_ret);
>> +	index = RMI_RETURN_INDEX(rec_run_ret);
>> +
>> +	/*
>> +	 * If a PSCI_SYSTEM_OFF request raced with a vcpu executing, we
>> might
>> +	 * see the following status code and index indicating an attempt to run
>> +	 * a REC when the RD state is SYSTEM_OFF.  In this case, we just need
>> to
>> +	 * return to user space which can deal with the system event or will try
>> +	 * to run the KVM VCPU again, at which point we will no longer attempt
>> +	 * to enter the Realm because we will have a sleep request pending on
>> +	 * the VCPU as a result of KVM's PSCI handling.
>> +	 */
>> +	if (status == RMI_ERROR_REALM && index == 1) {
>> +		vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
>> +		return 0;
>> +	}
> Running kvm-unit-tests-cca selftest(smp) test in quick succession may trigger these conditions, resulting in the following error logs.
>  Error: KVM exit reason: 0 ("KVM_EXIT_UNKNOWN")
> 
> Since KVM_EXIT_UNKNOWN is used when no specific exit reason applies, I think it would be better to make it identifiable as an error.
> How about adding and setting a new ARM64 exit_reason value to indicate that the PSCI_SYSTEM_OFF request is conflicting with a running vcpu?

Aneesh pointed this out to me off-list. We agreed that KVM_EXIT_SHUTDOWN
was more appropriate here. I'll make the change for v9.

Thanks,
Steve

> Best Regards,
> Emi Kisanuki
>> +
>> +	if (rec_run_ret)
>> +		return -ENXIO;
>> +
>> +	vcpu->arch.fault.esr_el2 = rec->run->exit.esr;
>> +	vcpu->arch.fault.far_el2 = rec->run->exit.far;
>> +	vcpu->arch.fault.hpfar_el2 = rec->run->exit.hpfar;
>> +
>> +	update_arch_timer_irq_lines(vcpu);
>> +
>> +	/* Reset the emulation flags for the next run of the REC */
>> +	rec->run->enter.flags = 0;
>> +
>> +	switch (rec->run->exit.exit_reason) {
>> +	case RMI_EXIT_SYNC:
>> +		return rec_exit_handlers[esr_ec](vcpu);
>> +	case RMI_EXIT_IRQ:
>> +	case RMI_EXIT_FIQ:
>> +		return 1;
>> +	case RMI_EXIT_PSCI:
>> +		return rec_exit_psci(vcpu);
>> +	case RMI_EXIT_RIPAS_CHANGE:
>> +		return rec_exit_ripas_change(vcpu);
>> +	}
>> +
>> +	kvm_pr_unimpl("Unsupported exit reason: %u\n",
>> +		      rec->run->exit.exit_reason);
>> +	vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
>> +	return 0;
>> +}
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c index
>> 33eb793d8bdb..bee9dfe12e03 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -863,6 +863,25 @@ void kvm_destroy_realm(struct kvm *kvm)
>>  	kvm_free_stage2_pgd(&kvm->arch.mmu);
>>  }
>>
>> +int kvm_rec_enter(struct kvm_vcpu *vcpu) {
>> +	struct realm_rec *rec = &vcpu->arch.rec;
>> +
>> +	switch (rec->run->exit.exit_reason) {
>> +	case RMI_EXIT_HOST_CALL:
>> +	case RMI_EXIT_PSCI:
>> +		for (int i = 0; i < REC_RUN_GPRS; i++)
>> +			rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
>> +		break;
>> +	}
>> +
>> +	if (kvm_realm_state(vcpu->kvm) != REALM_STATE_ACTIVE)
>> +		return -EINVAL;
>> +
>> +	return rmi_rec_enter(virt_to_phys(rec->rec_page),
>> +			     virt_to_phys(rec->run));
>> +}
>> +
>>  static void free_rec_aux(struct page **aux_pages,
>>  			 unsigned int num_aux)
>>  {
>> --
>> 2.43.0
>>
> 


