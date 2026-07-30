Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6212C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y99WMBGSSRYl6ya/cGUyHS3jGzf28+XeXb2WbbqBBT4=; b=pnEkwUefj3rp+6nIKU7miuS/Xo
	RuX7L35c4mMPGg4SZAnCvvJUrx7DKb/fGZ/kC2OaWFWifu59GZ39TJumsz49FvDoHh8pLt0m6807T
	O+Sg/xv+Et2NhgZebcM0K2VELizejsTevbTISpezjxecTh820H25G22b9ZIFFfUzsz/tD1ekBD1WP
	YFfU0l/RTgS7CGoVMaYwp+ZEdFy2FaVKInW2/K8mps44i7RoLF8uDq9Yxfg2XDRED3WMNMCrmiSk2
	5Ce7PgkXm93Ls8avhOTBbKBd6ylAi4x7KKP7b2f8E6vVBGaTinSmmsZ0IGGkwrrELowDNtirwTeHQ
	TYCT5I/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSD2-0000000Ansl-3jnS;
	Thu, 30 Jul 2026 14:58:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSCz-0000000Ans9-3zDI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:58:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 394B3204C;
	Thu, 30 Jul 2026 07:57:59 -0700 (PDT)
Received: from [10.57.41.95] (unknown [10.57.41.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DF9A3F66F;
	Thu, 30 Jul 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785423483; bh=QdUEHiQ1g/E0KBV9ww2GwULKMU6hS4iCjwpIc1PjORE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PxaMbIWZ76NWB0IhSbwuVG5xdlD0nokGYuRpStDa6hcRmS3rfVz3Ub+vD3vCuGCSN
	 TzJ4OMLGkHjuSAPETRjF1i0ttIuOKRiijX7a5rHPJm3XevUAFKjxiqM1lNa6RIWADM
	 bmxGC6YA0zRI94VtR8CqUD8YAW55psINh80KlfiQ=
Message-ID: <763eb5db-e9af-4b3a-b05b-746700cf0304@arm.com>
Date: Thu, 30 Jul 2026 15:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 14/37] KVM: arm64: CCA: Handle realm enter/exit
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, Kohei Enju <enju.kohei@fujitsu.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-15-steven.price@arm.com>
 <amcOp7tpRCkI29vt@FCCLS0092175.localdomain>
 <08599315-2dd3-4602-a902-09b197265b44@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <08599315-2dd3-4602-a902-09b197265b44@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_075806_154361_061DB143 
X-CRM114-Status: GOOD (  26.21  )
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

On 30/07/2026 14:58, Steven Price wrote:
> On 27/07/2026 09:14, Kohei Enju wrote:
>> Hi Steven, I have a comment about rec_exit_sys_reg() below.
>>
>> On 07/15 15:28, Steven Price wrote:
>>> Entering a realm is done using a SMC call to the RMM. On exit the
>>> exit-codes need to be handled slightly differently to the normal KVM
>>> path so define our own functions for realm enter/exit and hook them
>>> in if the guest is a realm guest.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>> Changes since v13:
>>>   * The RMM is now required to provide an ESR value with the correct
>>>     information to emulate MMIO, so we no longer need to hardcode 0s in
>>>     rec_exit_sys_reg().
>>>   * The PSCI changes mean that there is a potential race when turning on
>>>     a VCPU which can cause a RMI_ERROR_REC return. Exit to user space
>>>     with -EAGAIN in this case.
>>> Changes since v12:
>>>   * Call guest_state_{enter,exit}_irqoff() around rmi_rec_enter().
>>>   * Add handling of the IRQ exception case where IRQs need to be briefly
>>>     enabled before exiting guest timing.
>>> Changes since v8:
>>>   * Introduce kvm_rec_pre_enter() called before entering an atomic
>>>     section to handle operations that might require memory allocation
>>>     (specifically completing a RIPAS change introduced in a later patch).
>>>   * Updates to align with upstream changes to hpfar_el2 which now (ab)uses
>>>     HPFAR_EL2_NS as a valid flag.
>>>   * Fix exit reason when racing with PSCI shutdown to return
>>>     KVM_EXIT_SHUTDOWN rather than KVM_EXIT_UNKNOWN.
>>> Changes since v7:
>>>   * A return of 0 from kvm_handle_sys_reg() doesn't mean the register has
>>>     been read (although that can never happen in the current code). Tidy
>>>     up the condition to handle any future refactoring.
>>> Changes since v6:
>>>   * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>>>     vcpu to the error.
>>>   * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>>>     this exit type.
>>>   * Split code handling a RIPAS change triggered by the guest to the
>>>     following patch.
>>> Changes since v5:
>>>   * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>>>     change on next entry rather than immediately on the exit. This allows
>>>     the VMM to 'reject' a RIPAS change by refusing to continue
>>>     scheduling.
>>> Changes since v4:
>>>   * Rename handle_rme_exit() to handle_rec_exit()
>>>   * Move the loop to copy registers into the REC enter structure from the
>>>     to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>>>     where the handler exits to user space and user space wants to modify
>>>     the GPRS.
>>>   * Some code rearrangement in rec_exit_ripas_change().
>>> Changes since v2:
>>>   * realm_set_ipa_state() now provides an output parameter for the
>>>     top_iap that was changed. Use this to signal the VMM with the correct
>>>     range that has been transitioned.
>>>   * Adapt to previous patch changes.
>>> ---
>>>
>>> [...]
>>>
>>> +static int rec_exit_sys_reg(struct kvm_vcpu *vcpu)
>>> +{
>>> +	struct realm_rec *rec = &vcpu->arch.rec;
>>> +	unsigned long esr = kvm_vcpu_get_esr(vcpu);
>>> +	int rt = kvm_vcpu_sys_get_rt(vcpu);
>>> +	bool is_write = (esr & ESR_ELx_SYS64_ISS_DIR_MASK) == ESR_ELx_SYS64_ISS_DIR_WRITE;
>>> +	int ret;
>>> +
>>> +	if (is_write)
>>> +		vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[rt]);
>>
>> When rt is 31 (XZR), does exit.gprs[rt] trigger an out-of-bounds read
>> since REC_RUN_GPRS is 31? Although the padding after the gprs means this
>> OOB may not cause any practical issue, would it make sense to skip the
>> access when rt is 31?
>>

RMM mandates that the ESR_ELx.ISS.RT == 0 on an exit due to System 
register access. See "A4.3.4.4 REC exit due to System register access"

So this shouldn't be a problem, but doesn't hurt to defend the host
against a malicious RMM ?

Suzuki



>> if (is_write && rt != 31)
>>      vcpu_set_reg(vcpu, rt, rec->run->exit.gprs[rt]);
> 
> Very true - as you say in practise this isn't a big issue because
> vcpu_set_reg() is a no-op, so it's just a read of padding. But
> definitely worth fixing.
> 
>>> +
>>> +	ret = kvm_handle_sys_reg(vcpu);
>>> +	if (!is_write)
>>> +		rec->run->enter.gprs[rt] = vcpu_get_reg(vcpu, rt);
>>
>> The same applies here:
>>
>> if (!is_write && rt != 31)
>>      rec->run->enter.gprs[rt] = vcpu_get_reg(vcpu, rt);
> 
> And the same here - a zero written into the padding.
> 
> Thanks for the review!
> 
> Steve
> 
>>> +
>>> +	return ret;
>>> +}
> 


