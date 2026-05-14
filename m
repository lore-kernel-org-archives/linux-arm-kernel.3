Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40530CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ODwOeawQeH9yG3JQIK6jfQJAoFNmQmpkBT15tfR0sa0=; b=jckFdAlImd0zfd
	KREJfXLTZEMwnU0SC9wBWPt4RusB9RcfspzOYOutrX4QdLz3h77SsnyPOobSaQXSIy0zJWQr2R+xL
	1dtObHVBtevWDclNAVm7MSmrcU5oTaqp+KevhYg+axvx+9OyE0J1Pq3KfXeOZruXSeUImq0b1QfOJ
	WKWsfyP/oMMMErFT7h6+JrGKEvKH4MZBRbIPrf2zfcN9fBFyOwRzsh/LNeIUQKzm3vO/zk1Qmu0iO
	vt4PoRhRxvM1EzUmH1dwLcYBn+hgUqSGE1vAUldQsTf2PhnrUNlrOHXJ8okMZpdC469igmNGK4XbH
	biGOu0gdN8KKVxMSAYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbH8-00000006NLf-2mqH;
	Thu, 14 May 2026 18:59:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbH6-00000006NKx-1HxC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 18:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:References;
	bh=ODwOeawQeH9yG3JQIK6jfQJAoFNmQmpkBT15tfR0sa0=; b=IPAegbhz8ijWeSVembUnDbbmW4
	zABtg2L/e+4kiiSnUdFUjnuQIE6djMyCLqmOz6/02kx2XSv2gu73UqGRND0ZqRRCQSTP2ExR3LfTB
	t+SGReok6ZZp0w7DE2MZwnmSH822TKMXjwSzJOSNboBnnUsYOhtgRY3lDgvsuNLsgp50HF7JnBe8M
	uc+TT1qRynimZbQmFBrz74PGSP0yHr1SnS/1LMnLTepN5vKuGO5BECjjrXJNnnBXJMqiSOzLeKJq4
	H0K+5YkvYU7Bc3X/ACSHylpknxZI0TA6o7gKepQc94DNwdr+xiUFtIGU3Ph1UBIFmE8E8FQEDY/7p
	DM2iicBw==;
Received: from mail-yx1-xb14a.google.com ([2607:f8b0:4864:20::b14a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbH2-00000003fq4-3Iob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 18:59:11 +0000
Received: by mail-yx1-xb14a.google.com with SMTP id 956f58d0204a3-65c21049da9so18284954d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778785146; x=1779389946; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ODwOeawQeH9yG3JQIK6jfQJAoFNmQmpkBT15tfR0sa0=;
        b=Pzw8wwHiy0tgKvBnmhd7wyWE8iTke0oO3IdKFUQJWqkK5Wjkb0hqwwZfpx8pSJBu12
         uX0lFIatbQ3yGqwuAviTaHvQhcfqESUglNtd2M1yY8XYADaNSuLC33jdC2ODeGnfwL+e
         cI6H8ShF4hyjbuHKPt+W8h/Ff3fMtUfySOOwUbbKsMGY6glTLIUwAGJ0XVNJLcyYr3sF
         aIOqlzrJ/AJFoQX14DtwNFohuI7rNWI7coPyysqGU4gGz7t5SLGkFN4o5NP0xalgw/H9
         A87r76//JPB5w3f1E9+3mrkkVVVw9Hbcfr54BHu2Cv8wCvm2NZZJhO4Yp+piFZoo3K3t
         CJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778785146; x=1779389946;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODwOeawQeH9yG3JQIK6jfQJAoFNmQmpkBT15tfR0sa0=;
        b=ssGJYLEfZGNVcJ6/hWW30sx/Rr398n5OGtHsJAmBkUZwZ/qJAlneHcwOHBHeAW2N9S
         QyYvYd/dRM4eO9FjBVzE+6QOScbHPb5k7IX6+JbCmd/5EB0I2/sp57g3miGPZjjuMwXG
         RI/AErEhCuL+PSUeJNDMfWLXd28jMJcoGqvk/73KU3tlCFpLpmTEQ7vopVYcnvwt/nN0
         flGdsktK7zGNgcmVM+KU7AbMnWJfPQ0l3KT71c3GKuAARk/79J0tpL5D1V1icnrs6jFz
         56t7XAijXwF8ic/cta+hRFRMD9hvvA+1It+UPgGA0ga9qDuzXI37wao6gpNkMhJvIoGN
         Sp7g==
X-Forwarded-Encrypted: i=1; AFNElJ+40nce5xPXHVXGxi9bXmOQeDWffo16tOBVTpBpoHOlpCgHh/cI6UhdDdrYChKF93DyE/ZUdnVfxdPB+eCVFa9l@lists.infradead.org
X-Gm-Message-State: AOJu0YyRL6Y1YyMuPBeIpADJXD6apni+8MME6jctrNiBcwMFzPl16vS/
	+BuHtf/KxteVX/+vksKjUm9Kljd7MnmK1v7L7lIKWH3GYZQUBp3PtELKTkHdPZ9qwVRkWdu9Xez
	UtJSwJyLlYJNo5Zig2OIRG1EbQw==
X-Received: from yxxr14.prod.google.com ([2002:a53:aece:0:b0:651:c562:b43b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690e:191d:b0:651:b7e2:6835 with SMTP id 956f58d0204a3-65e227be0e1mr578484d50.35.1778785145996;
 Thu, 14 May 2026 11:59:05 -0700 (PDT)
Date: Thu, 14 May 2026 18:59:05 +0000
In-Reply-To: <agRBzkVcR-qZZdx2@kernel.org> (message from Oliver Upton on Wed,
 13 May 2026 02:18:06 -0700)
Mime-Version: 1.0
Message-ID: <gsnto6ihbyx2.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 10/20] KVM: arm64: Context swap Partitioned PMU guest registers
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_195909_228719_294FFE53 
X-CRM114-Status: GOOD (  16.33  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Mon, May 04, 2026 at 09:18:03PM +0000, Colton Lewis wrote:
>> +
>> +/**
>> + * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved  
>> counters
>> + * @pmu: Pointer to arm_pmu struct
>> + *
>> + * Compute the bitmask that selects the host-reserved counters in the
>> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
>> + * in HPMN..N
>> + *
>> + * Return: Bitmask
>> + */
>> +u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
>> +{
>> +	u8 nr_counters = *host_data_ptr(nr_event_counters);
>> +
>> +	if (kvm_pmu_is_partitioned(pmu))
>> +		return GENMASK(nr_counters - 1, pmu->max_guest_counters);
>> +
>> +	return ARMV8_PMU_CNT_MASK_ALL;
>> +}
>> +
>> +/**
>> + * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved  
>> counters
>> + * @pmu: Pointer to arm_pmu struct
>> + *
>> + * Compute the bitmask that selects the guest-reserved counters in the
>> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
>> + * in 0..HPMN and the cycle and instruction counters.
>> + *
>> + * Return: Bitmask
>> + */
>> +u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
>> +{
>> +	if (kvm_pmu_is_partitioned(pmu))
>> +		return ARMV8_PMU_CNT_MASK_C | GENMASK(pmu->max_guest_counters - 1, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * kvm_pmu_load() - Load untrapped PMU registers
>> + * @vcpu: Pointer to struct kvm_vcpu
>> + *
>> + * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
>> + * to only bits belonging to guest-reserved counters and leave
>> + * host-reserved counters alone in bitmask registers.
>> + */
>> +void kvm_pmu_load(struct kvm_vcpu *vcpu)
>> +{
>> +	struct arm_pmu *pmu;
>> +	unsigned long guest_counters;
>> +	u64 mask;
>> +	u8 i;
>> +	u64 val;
>> +
>> +	/*
>> +	 * If we aren't guest-owned then we know the guest isn't using
>> +	 * the PMU anyway, so no need to bother with the swap.
>> +	 */
>> +	if (!kvm_vcpu_pmu_is_partitioned(vcpu))
>> +		return;
>> +
>> +	preempt_disable();
>> +
>> +	pmu = vcpu->kvm->arch.arm_pmu;
>> +	guest_counters = kvm_pmu_guest_counter_mask(pmu);
>> +
>> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>> +		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
>> +
>> +		if (i == ARMV8_PMU_CYCLE_IDX) {
>> +			write_sysreg(val, pmccntr_el0);
>> +		} else {
>> +			write_sysreg(i, pmselr_el0);
>> +			write_sysreg(val, pmxevcntr_el0);

> This is wrong, you would need an intervening ISB. It'd be better to
> avoid the ISB altogether and just use {read,write}_pmevcntrn().

Good catch, I was using {read,write}_pmevcntrn here before but changed
it after your feedback that:

> I'd prefer KVM directly accessed the PMU registers to
> avoid the possibility of taking some instrumented codepath in the
> future.

https://lore.kernel.org/kvm/aUH7oC41XaEMsXf_@kernel.org/

I assume this is a compromise with that.

