Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A2BC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 23:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QYXaYDgqkJqtd2+svQngfiSlGiL9bXTJTobnSbO9Md4=; b=lca38jmhf3sJQc
	FcFnwR7CIcljeRLzOjyOCrUwF4tyzBT8QZXd8EvM8ZvFSjHoHUOgguwuM5JSuEqLCLOZScagI9Xv3
	SkFMI7SfxMWDz3jAmZnVOll88QOJMhibuTSVJFRQQobTzBb6MYmSNPId2/AiYXQb4bWqm9e6k2dPn
	1MuZlbjTa7yv3V372yg1rLcFMf7KB2w1ojF7CnHxz0gMC+5ZxlRbyCXXzbDn5feClFWa2jCfRTEMj
	93idAe7mgBbP0kvxMMfNAzwGPXo/h8CStFFnMb0zRgHPMU38FFUoKXiFgUgPIBVdfsgT6D/XYc5i9
	2/YMP+igYnTNo8mDcSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJWQ-0000000AY2s-2roO;
	Tue, 21 Jul 2026 23:05:10 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJWO-0000000AY2A-2StK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 23:05:09 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4909b046dabso18926689b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 16:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784675107; x=1785279907; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QYXaYDgqkJqtd2+svQngfiSlGiL9bXTJTobnSbO9Md4=;
        b=im38x7UxWxCfjkO+fsMyIUZXV4sQqQBxAk10FiVqKh1lGlUDukyd38ul5DACuXxIEU
         pfQCWMXh/qj5HsZtftLJDiaMWm+slUyowXPlVusC6Jyj9QzzckskdewqT5CL8eqDYXHs
         NG2/Krny8xgGwheroUldiBp6jiIqodDypQw5UWRVn9hm8xrnRaiOZsgovM2ahcXKr9Sh
         MXR/bBLDSl4Q9RZkItbFGM2Tmu6e+d5tu2c35LdWH8Zn2h63kIq9WczGQR3eI9XiPhDA
         eS4zijY84SQtOfLw/ZQZYneW/FX8y45odcM03fMDUPBeec+MVfs5uxYEYn4d1xdPVIJ1
         FQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675107; x=1785279907;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYXaYDgqkJqtd2+svQngfiSlGiL9bXTJTobnSbO9Md4=;
        b=F/LqqYqfXAuff3uB6qGKLufqahzQPkRjPn/UbpUpUIYgR7W1JTBD7WBWJfMZHB9QHJ
         lYAnW5EiKRwi/j9Oh2DhUldla7pgJyfMpoixrYXrHa7GS6PoUW6FFuoWF7rNNqt8ZwG0
         8g2/UVZlkeNe8sJhPaqOaL1pBtTBLZMpWkBUAfLMX8uNkE4eFQNtIZ0q4Cy+qRQV1+kp
         /ZU1eptOGivrr9KQ+g30BOvX9Tq1NcVX6xsOI2/ESAlWHH3meAg0YBw3TuNxF+Np2WNl
         m5GtgqqhPz6+P3CiK3Yckij9w9l4nk31OVv57ys93f6w6vNfOXRI7Cj/Cing6k/OGYZv
         JWXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9i4ruOt5AIsjyL7eGGmbRm8ucAk0XzHzKQ04Py4Mw4vxiqjz52OIH61E6UZu86hopUUFFNsu+aJHEpxyR4pOx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1q5EyG8/d8NT8x2xiKubLrsNej37lM2HTAIeWo52Y5hPNCKzW
	VH/FmtlGuTSbRLCYko3mqDL+5p6ERpbTm0lqL2n7FHpGz3HvG2gZMF1GSSIgHpM1CbhvkFM/05m
	eUP+0qiplU3DWOOTkugBwnswsgg==
X-Received: from iowx7.prod.google.com ([2002:a05:6602:1607:b0:9a8:4cf8:3078])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1719:b0:495:f230:a340 with SMTP id 5614622812f47-4a4d049ce3emr10719954b6e.28.1784675106606;
 Tue, 21 Jul 2026 16:05:06 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:05:06 +0000
In-Reply-To: <3fc867c3-67a0-4fdd-b871-f2ba4d642f1f@linaro.org> (message from
 James Clark on Mon, 20 Jul 2026 17:46:37 +0100)
Mime-Version: 1.0
Message-ID: <gsnt8q7454gt.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 11/21] KVM: arm64: Context swap Partitioned PMU guest registers
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_160508_631895_FD9C9B05 
X-CRM114-Status: GOOD (  19.19  )
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

James Clark <james.clark@linaro.org> writes:

> On 12/06/2026 20:28, Colton Lewis wrote:
>> Save and restore newly untrapped registers that can be directly
>> accessed by the guest when the PMU is partitioned.

>> * PMEVCNTRn_EL0
>> * PMCCNTR_EL0
>> * PMSELR_EL0
>> * PMCR_EL0
>> * PMCNTEN_EL0
>> * PMINTEN_EL1

>> If we know we are not partitioned (that is, using the emulated vPMU),
>> then return immediately. A later patch will make this lazy so the
>> context swaps don't happen unless the guest has accessed the PMU.

>> PMEVTYPER is handled in a following patch since we must apply the KVM
>> event filter before writing values to hardware.

>> PMOVS guest counters are cleared to avoid the possibility of
>> generating spurious interrupts when PMINTEN is written. This is fine
>> because the virtual register for PMOVS is always the canonical value.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm/include/asm/arm_pmuv3.h |   4 +
>>    arch/arm64/kvm/arm.c             |   2 +
>>    arch/arm64/kvm/pmu-direct.c      | 183 +++++++++++++++++++++++++++++++
>>    include/kvm/arm_pmu.h            |  16 +++
>>    4 files changed, 205 insertions(+)


> [...]

>> +
>> +/**
>> + * kvm_pmu_put() - Put untrapped PMU registers
>> + * @vcpu: Pointer to struct kvm_vcpu
>> + *
>> + * Put all untrapped PMU registers from the VCPU into the PCPU. Mask
>> + * to only bits belonging to guest-reserved counters and leave
>> + * host-reserved counters alone in bitmask registers.
>> + */
>> +void kvm_pmu_put(struct kvm_vcpu *vcpu)
>> +{
>> +	struct arm_pmu *pmu;
>> +	unsigned long guest_counters;
>> +	unsigned long flags;
>> +	u64 mask;
>> +	u8 i;
>> +	u64 val;
>> +
>> +	/*
>> +	 * If we aren't guest-owned then we know the guest is not
>> +	 * accessing the PMU anyway, so no need to bother with the
>> +	 * swap.
>> +	 */
>> +	if (!kvm_pmu_is_partitioned(vcpu->kvm))
>> +		return;
>> +
>> +	preempt_disable();
>> +
>> +	pmu = vcpu->kvm->arch.arm_pmu;
>> +	guest_counters = kvm_pmu_guest_counter_mask(pmu);
>> +
>> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>> +		if (i == ARMV8_PMU_CYCLE_IDX)
>> +			val = read_pmccntr();
>> +		else
>> +			val = read_pmevcntrn(i);
>> +
>> +		__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + i, val);
>> +	}
>> +
>> +	val = read_sysreg(pmselr_el0);
>> +	__vcpu_assign_sys_reg(vcpu, PMSELR_EL0, val);
>> +
>> +	val = read_sysreg(pmcr_el0);
>> +	__vcpu_assign_sys_reg(vcpu, PMCR_EL0, val);
>> +
>> +	/* Mask these to only save the guest relevant bits. */
>> +	mask = kvm_pmu_guest_counter_mask(pmu);
>> +
>> +	val = read_sysreg(pmcntenset_el0);
>> +	__vcpu_assign_sys_reg(vcpu, PMCNTENSET_EL0, val & mask);
>> +
>> +	val = read_sysreg(pmintenset_el1);
>> +	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
>> +
>> +	/* Save pending guest hardware overflows. */
>> +	local_irq_save(flags);
>> +	val = read_sysreg(pmovsset_el0);
>> +	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, val & mask);
>> +	write_sysreg(val & mask, pmovsclr_el0);
>> +	local_irq_restore(flags);
>> +
>> +	/* Stop guest counters and disable interrupts in hardware. */
>> +	write_sysreg(mask, pmcntenclr_el0);
>> +	write_sysreg(mask, pmintenclr_el1);
>> +
>> +	kvm_pmu_set_guest_counters(pmu, 0);

> Hi Colton,

> This function doesn't get added until "KVM: arm64: Apply dynamic guest
> counter reservations" a few commits later.

> kvm_pmu_guest_counter_mask() is also used in a commit before it's added.

My bad. I'll correct that.

