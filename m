Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6DFC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3KmLDyIZwBiYKG5MJLxqg0jmexGCDH6/duaM+TDhfw=; b=MGsCAPEnJ7Oono0RII/uke5NOI
	2UVZbKMTR6KIPYKJMkihqasgCJLDC3cDBNHKvOzWrMVKr6MXAYjCDrt4Gexw7l3opAcWGfgOSkx9y
	eWQQZXNx8aJpE/ICPhn5sOb3sby9Nar3FHT7RreuDCbr+WYFeR6HlkcZL7k0Hp5tKsYdWtS72KNXs
	L1W4qE2+uSbhtrRXOEMGFB4PVljDQsIH9/aQV7ebc+6xDy0QLY4Ze63pCnNzgRUpQOL/cwYJ1c0f2
	k3GxZ14oGgUP7rl/y/S8B2nHXS2o3++4fxWa0wk/+zvt7X148UqLYIBWbsBuVwjDMB+fhKZDzS9TV
	VMOXD2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXN6-000000011m5-01Vw;
	Thu, 13 Aug 2026 15:29:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXMo-000000011gI-16a4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:29:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 298761576;
	Thu, 13 Aug 2026 08:29:09 -0700 (PDT)
Received: from [10.1.25.28] (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FA5B3F632;
	Thu, 13 Aug 2026 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786634953; bh=/QD7BRHajvoQsee6evmAg1MF6Mele3ZPoIrU1O/8bqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WVwsfOlzjKMLQCPV/Kun+w+rcBJQ56P0bCLXJQcQH51ZRSbmJt9LdaqGEvNLwUh/u
	 zU6TjugDY38iS6UzQ4WvkoUx2Hs1mWylme0xEXkUQe5wRDoeSaKo73ycu+VyyfHY3k
	 1qZXM3/+R1fGvFSiETSCfNb01S8ZovMwfZp/uenA=
Message-ID: <23ef41bc-1028-4cc0-8415-d93d60b0ac47@arm.com>
Date: Thu, 13 Aug 2026 15:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 21/45] KVM: arm64: CCA: Handle realm enter/exit
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
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
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-22-steven.price@arm.com> <yq5a33wu3t4k.fsf@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <yq5a33wu3t4k.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_082914_392226_F566917F 
X-CRM114-Status: GOOD (  11.78  )
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

On 04/08/2026 14:36, Aneesh Kumar K.V wrote:
> Steven Price <steven.price@arm.com> writes:
>> +
>> +	switch (rec->run->exit.exit_reason) {
>> +	case RMI_EXIT_SYNC:
>> +		/*
>> +		 * HPFAR_EL2_NS is hijacked to indicate a valid HPFAR value,
>> +		 * see __get_fault_info()
>> +		 */
>> +		vcpu->arch.fault.hpfar_el2 = rec->run->exit.hpfar | HPFAR_EL2_NS;
>> +		rec_exit_sync(vcpu);
>> +		return ARM_EXCEPTION_TRAP;
>> +	case RMI_EXIT_IRQ:
>> +	case RMI_EXIT_FIQ:
>> +		return ARM_EXCEPTION_IRQ;
>> +	case RMI_EXIT_SERROR:
>> +		return ARM_EXCEPTION_EL1_SERROR;
>> +	case RMI_EXIT_PSCI:
>> +		rec_exit_hvc(vcpu);
>> +		kvm_make_request(KVM_REQ_RMI, vcpu);
>>
> 
> I'm also wondering whether we can move the kvm_make_request() call until
> after the PSCI/HOST_CALL handling is complete. I tried a quick hack, but
> it did not look particularly clean, since we would end up adding
> RMM-specific checks in handle_hvc():
> 
> ret = kvm_smccc_call_handler(vcpu);
> 
> if (vcpu_is_rec(vcpu) &&
>     (vcpu->arch.rec.run->exit.exit_reason == RMI_EXIT_PSCI ||
>      vcpu->arch.rec.run->exit.exit_reason == RMI_EXIT_HOST_CALL))
> 	kvm_make_request(KVM_REQ_RMI, vcpu);
> 
> That said, having rec_exit_hvc(vcpu) and kvm_make_request() back-to-back
> is also somewhat confusing. Perhaps we could at least add a comment
> explaining why the request must always be made here.

Agreed, a comment would make it clearer what's going on. I'll add that.
As you say I'm not convinced trying to delay the kvm_make_request() call
is the answer because it ends up with an ugly RMM-specific check.

Thanks,
Steve

> 
>> +		return ARM_EXCEPTION_TRAP;
>> +	case RMI_EXIT_RIPAS_CHANGE:
>> +		rec_exit_hvc(vcpu);
>> +		return ARM_EXCEPTION_TRAP;
>> +	}
>> +
>> +	return rec_exit_fatal(vcpu, "Unsupported Realm exit reason",
>> +			      rec->run->exit.exit_reason);
>> +}
> 
> -aneesh


