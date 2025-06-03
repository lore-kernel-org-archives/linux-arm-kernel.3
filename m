Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F07C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=A0l5G93fC29AgVAtcdaJmVpgHO/IQHFXQv4WdPYaaHE=; b=EqHPEwgnNEVtmf
	/Vy+QlnqgXO89Kw99zGig5h6Fvs/SvtqtIJWZFTxer8rEm2W2UxE6rq9c6rg1Vl3V4e5wg6MpRuwC
	8xOpc/BMkovEp4IPUOd1PVvmtyBMpyAfDpDR1TWUtGSqgnRsJvAC0F5vetYz3S+UwFh27DQX81uDh
	rgVfyBbw2Y+uF9UUuLo/zIIxyZM+YsOYG1APFIrNDdKYdM+VlrCjZM6RkT7eK2na2d5myB2jtgvWr
	d8eHCY4hs8XNEcBmENapa/tUWKtMip/i6d9Vv9wn1DZqZX5z5hggSdn3A5jze9+TFI191Th6Uj6eT
	9D2RsZjfw7OveZJLsTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZJs-0000000BtXf-2WgS;
	Tue, 03 Jun 2025 21:37:16 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZFU-0000000Bss9-0p6i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 21:32:45 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3dc8ab0ac67so115136775ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 14:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748986362; x=1749591162; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0l5G93fC29AgVAtcdaJmVpgHO/IQHFXQv4WdPYaaHE=;
        b=JRXaHGl9GaflBCXKhYcnrBzyj4HJMgFVWcPuymj6Ay2rKdS3BFQiiSog8dR1gtN/cX
         /s+fYNiJQ/FRV+zCCHVV+vK60n6AVdGwD0EdDe5EZSmGybzLeAxUZqjaDOIqp7h8EopD
         D8QWSSnIqZ/oJMgVa5OIEEIAUSnBfd+jIV+NyyQmL8j4stqngpd4OF6bB8k/SGoE5gxK
         mhsCpHRkg5YISz0H+fZaZmlQuo1dqSVW44TcI8REHPtRN2FR+HECm4Ec5EOauQQi+9Dj
         HaggEUfOsFVilMYN3VNs5wg7d+9wAJl2nnQ+zihRVVUi79bD/Xr4B0GL48TCgwHDwud6
         YqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748986362; x=1749591162;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0l5G93fC29AgVAtcdaJmVpgHO/IQHFXQv4WdPYaaHE=;
        b=YgyFRBFCOuRq6XNCKXZOLVm5Qsq5XTXd5eeQVCIjWeYWs5wXoThFnp3Qe4PdIjDZdI
         pQPvNEraa6bOBT+bnS/mBLCkRY6j+O2KVYc6q/EObqYGbU1YZ53j1/LdbJ8OBOKFXFwy
         nJQjQR8hsfs6rvUjGduMqgGl8ykDMSp0YDetw8v/GyTt8+9GT8W2UbJ070k8BaOWjDnr
         Wl5H/k+owQ3a1JR0FdRFLb3AG/9PPKGtBiAOnDeKfEXR0Wv4pCDa5AeTTkKvwW9CTxgq
         UoawRljGNSXyoxTTM6fEud/yfrEsoPVGdsm3GpseqqUb8IDFOB4m5dtTYgx1NG8SArA8
         ITRg==
X-Forwarded-Encrypted: i=1; AJvYcCXhK1Nv2FNlyHGqfaB481MTkJKZmIq7oyTidggNIrIbd2lX8HNDQfeIuewgPStLuKwVRIAxCSS6BVTU/0zVjLCp@lists.infradead.org
X-Gm-Message-State: AOJu0YwudWjaXlOTXfxSYnme0s8uifXPbxcp+MIHoURQzweoSJxG4TPe
	HYTFSMMfhdjKKyyBz+W/BZbIv8cdWIhhpg8KsAdK6feCvfOLT6H6GJwBjgKqZAkNHM6IxxcKR8+
	ZHceIc/2uO0cRuLOgvs7A1YUCpw==
X-Google-Smtp-Source: AGHT+IEpZcrefEWDzzUjOLjOnRYEdIFZat5s3G0oLfOvn/O8rphYPOQ1GWMYf3Wj71ilVVre/pSRPvqRpgjiaR79Qg==
X-Received: from ilbbm14.prod.google.com ([2002:a05:6e02:330e:b0:3d9:2b64:6884])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a92:c241:0:b0:3dc:7a9a:44d5 with SMTP id e9e14a558f8ab-3ddbedc8c8fmr6231205ab.22.1748986362621;
 Tue, 03 Jun 2025 14:32:42 -0700 (PDT)
Date: Tue, 03 Jun 2025 21:32:41 +0000
In-Reply-To: <aD4llDZwb_sC_Ptj@linux.dev> (message from Oliver Upton on Mon, 2
 Jun 2025 15:28:36 -0700)
Mime-Version: 1.0
Message-ID: <gsnt4iww3406.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 06/17] KVM: arm64: Introduce method to partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_143244_235786_EAE46085 
X-CRM114-Status: GOOD (  27.53  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jun 02, 2025 at 07:26:51PM +0000, Colton Lewis wrote:
>>   static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>>   {
>> +	u8 hpmn = vcpu->kvm->arch.arm_pmu->hpmn;
>> +
>>   	preempt_disable();

>>   	/*
>>   	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
>>   	 * to disable guest access to the profiling and trace buffers
>>   	 */
>> -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
>> -					 *host_data_ptr(nr_event_counters));
>> -	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
>> +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
>> +	vcpu->arch.mdcr_el2 |= (MDCR_EL2_HPMD |
>> +				MDCR_EL2_TPM |

> This isn't safe, as there's no guarantee that kvm_arch::arm_pmu is
> pointing that the PMU for this CPU. KVM needs to derive HPMN from some
> per-CPU state, not anything tied to the VM/vCPU.

I'm confused. Isn't this function preparing to run the vCPU on this
CPU? Why would it be pointing at a different PMU?

And HPMN is something that we only want set when running a vCPU, so
there isn't any per-CPU state saying it should be anything but the
default value (number of counters) outside that context.

Unless you just mean I should check the number of counters again and
make sure HPMN is not an invalid value.

>> +/**
>> + * kvm_pmu_partition() - Partition the PMU
>> + * @pmu: Pointer to pmu being partitioned
>> + * @host_counters: Number of host counters to reserve
>> + *
>> + * Partition the given PMU by taking a number of host counters to
>> + * reserve and, if it is a valid reservation, recording the
>> + * corresponding HPMN value in the hpmn field of the PMU and clearing
>> + * the guest-reserved counters from the counter mask.
>> + *
>> + * Passing 0 for @host_counters has the effect of disabling  
>> partitioning.
>> + *
>> + * Return: 0 on success, -ERROR otherwise
>> + */
>> +int kvm_pmu_partition(struct arm_pmu *pmu, u8 host_counters)
>> +{
>> +	u8 nr_counters;
>> +	u8 hpmn;
>> +
>> +	if (!kvm_pmu_reservation_is_valid(host_counters))
>> +		return -EINVAL;
>> +
>> +	nr_counters = *host_data_ptr(nr_event_counters);
>> +	hpmn = kvm_pmu_hpmn(host_counters);
>> +
>> +	if (hpmn < nr_counters) {
>> +		pmu->hpmn = hpmn;
>> +		/* Inform host driver of available counters */
>> +		bitmap_clear(pmu->cntr_mask, 0, hpmn);
>> +		bitmap_set(pmu->cntr_mask, hpmn, nr_counters);
>> +		clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
>> +		if (pmuv3_has_icntr())
>> +			clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
>> +
>> +		kvm_debug("Partitioned PMU with HPMN %u", hpmn);
>> +	} else {
>> +		pmu->hpmn = nr_counters;
>> +		bitmap_set(pmu->cntr_mask, 0, nr_counters);
>> +		set_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
>> +		if (pmuv3_has_icntr())
>> +			set_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
>> +
>> +		kvm_debug("Unpartitioned PMU");
>> +	}
>> +
>> +	return 0;
>> +}

> Hmm... Just in terms of code organization I'm not sure I like having KVM
> twiddling with *host* support for PMUv3. Feels like the ARM PMU driver
> should own partitioning and KVM just takes what it can get.

Okay. I can move the code.

>> @@ -239,6 +245,13 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
>>   	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
>>   		return;

>> +	if (reserved_host_counters) {
>> +		if (kvm_pmu_partition_supported())
>> +			WARN_ON(kvm_pmu_partition(pmu, reserved_host_counters));
>> +		else
>> +			kvm_err("PMU Partition is not supported");
>> +	}
>> +

> Hasn't the ARM PMU been registered with perf at this point? Surely the
> driver wouldn't be very pleased with us ripping counters out from under
> its feet.

AFAICT nothing in perf registration cares about the number of counters
the PMU has. The PMUv3 driver tracks its own available counters through
cntr_mask and I modify that during partition.

Since this is still initialization of the PMU, I don't believe anything
has had a chance to use a counter yet that will be ripped away.

Aesthetically It makes since to change this if I move the partitioning
code to the PMUv3 driver, but I think it's inconsequential to the
function.

