Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6F9CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lvf58REysbafuiio+PHgzYPPOXJAU2S7yZkdP1X1Ak4=; b=jgE94nLAMM/72z
	h6TV+xvRZLsTLqEHxllUtdEuyjKBobhvvpmZGWd+iJz2VtYKtenJYDipKKtqDdAAdZxUo0SpW/bmG
	j6Y0OoZhnf3J2FSav+CCMf7epZC5b8QOj2XSNsC/PT3V5QQWSq/KVyWan31n4dB15ewwyfbMBd6qA
	ngcQLFJW2gFa3V45r6Ja08CeeTUei/1aVuqGPDQqqcp4deoXwJZv71vp1TheUb394zv4GIVYaoqZo
	rtEb3zFIRWn54LmV/0NZAM6b0Qsr0lnn2QOp3glu3u6OU02oMC7wgdyvzdci6nVNejdoFtorECd6C
	Urk59GsSLRLnQg+Uy4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaBI-00000006Ezr-0L0j;
	Thu, 14 May 2026 17:49:08 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaBF-00000006Eyy-3Tzx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:49:07 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-439f1d2d2cdso3137167fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778780944; x=1779385744; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lvf58REysbafuiio+PHgzYPPOXJAU2S7yZkdP1X1Ak4=;
        b=fAo7yrilIVx1smp0Dl49oN6DYiiK3wR+pisV+bVjujMW9Zlfuxc/RjwHZIAWf0YeQj
         5vI6UU2gsJoQbklV9FiYPk9A0+Zxmkb83ve7rbCrgXEFd3Pq47QssRNk0zVzxKdRqUNe
         XnGUgnI82kugqAO1qKkzIwegfGsVDvgewtQlXDhMSD0CIysDcA04dqwUnd0gMtZ1b7Fq
         YqwDtvx1pMxETDQm0t1ITCRJdzBmx87SqXhcYnS5IOHN9w66IJgBZTGVNQ5g6a/0GGbv
         52t8iE+RFBILOBZQ88Hy1zBL1cjQhu5JUW+KUfa5Ui+Ed/UEMoHO5Miogb/DpKYhSBD4
         ligg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780944; x=1779385744;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvf58REysbafuiio+PHgzYPPOXJAU2S7yZkdP1X1Ak4=;
        b=gq4QIGTbAMd24auItYo2zYOU3VUPtz/wty0jtt2vjG9DjziQyX6FYPP9yAZoJe/YUm
         hAE1RtSJixSIkYME0Aatd5ClTHjZavPTwyMTO0llYDVVVLag6iCElM0mYWbzPeYUfJTI
         zsCg4KUFoAPKlaOzfEQFlzkX58OuDKC4ISGfnZHSWI4xEUjoh3l9BNUFhhAnysqBgAs8
         g/alK9Mqa+YwSJiZ9HUq2rxizzRsZvnKdKALU+yPgaX1PoYB47n5SVqcJCB7JPO2u4cL
         eU4oLcIvDiQ9G/TF+PRvx3UJBokAzdKSG2jVpOZ/uAhPMl9s5qZWaw22NoPTwLY+dzY+
         yAww==
X-Forwarded-Encrypted: i=1; AFNElJ9JaRswYFdO+l33QPNqyGmfGyBOdXo+K+BwoK8phrrfMrQCHqb3ibOr7WvkO/O75Xv2WwLAqHCoQyXj0O4PwaP9@lists.infradead.org
X-Gm-Message-State: AOJu0YwdV6Y3N29KgLK1HcrQotQQrzmmrT9DlDg4JpF/R3xRxhWTyQ7+
	+/UDoIYntwjmPPoYmuXczKy+1LndhPmA1lZQ/yoHhTGOKj7AYho7l8AEJBS5Gh1G3FQRu7D+8yi
	tEnIrKXpzXKVQN68tHcA6pZ5ozQ==
X-Received: from oaao19.prod.google.com ([2002:a05:6870:f013:b0:43a:1a0e:c45b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:a793:b0:434:efa3:9bd5 with SMTP id 586e51a60fabf-43a2ddcfbbamr377060fac.27.1778780943565;
 Thu, 14 May 2026 10:49:03 -0700 (PDT)
Date: Thu, 14 May 2026 17:49:02 +0000
In-Reply-To: <agQpbiD8Fi6fzomf@kernel.org> (message from Oliver Upton on Wed,
 13 May 2026 00:34:06 -0700)
Mime-Version: 1.0
Message-ID: <gsntwlx5c25t.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 07/20] KVM: arm64: Set up FGT for Partitioned PMU
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
X-CRM114-CacheID: sfid-20260514_104905_876084_2976E872 
X-CRM114-Status: GOOD (  20.30  )
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

Hi Oliver. Thanks for the review.

Oliver Upton <oupton@kernel.org> writes:

> On Mon, May 04, 2026 at 09:18:00PM +0000, Colton Lewis wrote:
>> +static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
>> +{
>> +	__compute_fgt(vcpu, HDFGRTR_EL2);
>> +
>> +	*vcpu_fgt(vcpu, HDFGRTR_EL2) |=
>> +		HDFGRTR_EL2_PMOVS
>> +		| HDFGRTR_EL2_PMCCFILTR_EL0
>> +		| HDFGRTR_EL2_PMEVTYPERn_EL0
>> +		| HDFGRTR_EL2_PMCEIDn_EL0
>> +		| HDFGRTR_EL2_PMMIR_EL1;
>> +}
>> +

> I've given this feedback at least twice already...

> Operators go on the preceding line in the case of line continuations.

I apologize for letting that slip through again.

>> +
>> +/**
>> + * kvm_pmu_is_partitioned() - Determine if given PMU is partitioned
>> + * @pmu: Pointer to arm_pmu struct
>> + *
>> + * Determine if given PMU is partitioned by looking at hpmn field. The
>> + * PMU is partitioned if this field is less than the number of
>> + * counters in the system.
>> + *
>> + * Return: True if the PMU is partitioned, false otherwise
>> + */
>> +bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>> +{
>> +	if (!pmu)
>> +		return false;
>> +
>> +	return pmu->max_guest_counters >= 0 &&
>> +		pmu->max_guest_counters <= *host_data_ptr(nr_event_counters);
>> +}
>> +
>> +/**
>> + * kvm_vcpu_pmu_is_partitioned() - Determine if given VCPU has a  
>> partitioned PMU
>> + * @vcpu: Pointer to kvm_vcpu struct
>> + *
>> + * Determine if given VCPU has a partitioned PMU by extracting that
>> + * field and passing it to :c:func:`kvm_pmu_is_partitioned`
>> + *
>> + * Return: True if the VCPU PMU is partitioned, false otherwise
>> + */
>> +bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
>> +{
>> +	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu) &&
>> +		false;
>> +}

> Ok, I'm thoroughly confused about these predicates.

> Whether or not a vCPU is using a partitioned PMU is a per-VM property.
> This is separate from whether or not the backing arm_pmu has a range of
> available counters for the guest to use.

> It is entirely possible that a VM *isn't* using the partitioned PMU
> feature (i.e. backed with perf events) yet the supporting arm_pmu has a
> guest counter range.

Yes and I add that to this predicate in a later patch when I introduce
the flag. I can always reorder to introduce the flag before (or along
with) this predicate.

>> +#if !defined(__KVM_NVHE_HYPERVISOR__)
>> +bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
>> +bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
>> +#else
>> +static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>> +#endif
>> +

> Don't use ifdeffery for this. Aim to have a single definition and rely
> on has_vhe() to do the rest of the work.

Will do.


> Thanks,
> Oliver

