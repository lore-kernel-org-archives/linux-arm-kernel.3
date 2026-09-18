Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72216C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adaWS53/yZLYHZ+Xxfx4JKH0tTFMzbnKDhmlR60b7OQ=; b=ad+pS1nuIgmOfn+UWK0CdfGywK
	k5S7zdcMqrnnEfsQP10svqBWLFMPIDePfqpBpMpqU+28xb69AwJNV5TgBmAHEbU48U14YAjRFw5pL
	kIlUccvdz2Pjko7rlfekgwh9tuRBW87XqRe8Qabul88RaEvoC6tqpZH7T/WVCFN+JUi/S0z3e85dO
	OJuV7MrG4gkqsDxuaBjXaxBJqGAdeFQMqHlpJ2f6I+BWsIDuD+dM+fYmdcbuqsB07xy1bzzbyb2jH
	XF7yfl88FFLYfI+HF7hUFQQDfuOccGRaWeMU4S1Ava8l2MBZFuckyhYW0CE6so08q1ZSA21l+Qa3v
	e6uFaDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7URI-0000000DsMx-14GG;
	Fri, 18 Sep 2026 08:59:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7URF-0000000DsM6-0fok
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:59:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1C06168F;
	Fri, 18 Sep 2026 01:59:14 -0700 (PDT)
Received: from [10.57.6.197] (unknown [10.57.6.197])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A15FA3F86F;
	Fri, 18 Sep 2026 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789721958; bh=1M1QtH7NdzkDYZ09YQzOvcKU43QqUz+DMQ3u7GB+BTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gMhNVUf7FU14C3AvALw/IJRAU0r5ZC7LybOmBcwkNWc+DAjCckG9KnP01I1wmlwyC
	 jwkpPhL4ENWatRqaHBHlgShatqY/nVK4er+43d5StSotzGLtEXPJotp0f1EKvtUnpj
	 Bzj946PL96YGt37gh2bvsO5zxsWPabKAQrRAacd0=
Message-ID: <e26cbb4e-84e2-4fcc-9eb0-93bfd4aff4a7@arm.com>
Date: Fri, 18 Sep 2026 09:59:14 +0100
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
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTz65G0MM=tOrzmk=jMweBX1us6FqfrmSkQs4KSyAEoxhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_015921_280546_2FDFF557 
X-CRM114-Status: GOOD (  21.16  )
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

On 17/09/2026 12:24, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Tue, 15 Sep 2026 17:01:23 +0100, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
> [...]
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> [...]
>> +#define kvm_vm_hyp_is_pkvm(kvm)                (is_protected_kvm_enabled())
> 
> I'd keep is_protected_kvm_enabled() at the three call sites: this
> takes a VM and ignores it, so it reads as per-VM when it's the mode,
> and patch 20's comment about not being able to use the kvm_vm_ helpers
> with a NULL kvm goes away too.

Actually, that comment is invalid. kvm_arch_vm_ioctl_allowed, is only
called from the kvm_arch_vm_ioctl() with a valid kvm instance. I have 
changed that hunk to:


+/*
+ * Check whether the KVM VM IOCTL is allowed. For pKVM and Realm VMs, 
certain
+ * ioctls are not allowed. Further, certain features are allowed only for
+ * non-protected VMs in pKVM.
+ */
+static inline bool kvm_arch_vm_ioctl_allowed(struct kvm *kvm, unsigned 
int ioctl)
+{
+       long ext;
+       int r;
+
+       /*
+        * We are guaranteed to be called with a valid kvm instance, as the
+        * only caller is kvm_arch_vm_ioctl(). Catch any deviations, as we
+        * rely on the kvm instance below.
+        */
+       if (WARN_ON_ONCE(!kvm))
+               return false;
+
+       /* Cover both pKVM host and Realm VMs */
+       if (!kvm_vm_hyp_is_distrusting(kvm))
+               return true;
+

I resorted to is_protected_kvm_enabled() to make it faster than using
the vm_flavor checks. I could rever those anyways.

> 
>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> [...]
>> @@ -432,7 +432,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
>>
>>           hyp_vm->host_kvm = host_kvm;
>>           hyp_vm->kvm.created_vcpus = nr_vcpus;
>> -        hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
>> +        hyp_vm->kvm.arch.vm_flavor = READ_ONCE(host_kvm->arch.vm_flavor);
> 
> Could EL2 reduce this to VM_PKVM or VM_PROTECTED_PKVM here instead of
> storing what it reads? The host supplies the value, and it's now an
> enum rather than a bool. Patch 12 relies on EL2 only ever seeing those
> two, and with VM_REALM above the marker a host-written value passes
> kvm_vm_is_protected() but not the == form, if EL2 ever adds one.

Do you mean something like :

	if (kvm_vm_is_protected_pkvm(host_kvm))
		hyp_vm->kvm.arch.vm_flavor = VM_PROTECTED_PKVM;
	else
		hyp_vm->kvm.arch.vm_flavor = VM_PKVM;

Do we additionally need to WARN_ON() if we encounter a VM_REALM ?

> 
> Both hunks are new since v17, which is where I gave the Reviewed-by.
> Happy to keep it if you can settle these please.

Apologies, I thought this one didn't change, but later patches changes 
them, which is why I kept this.

Cheers
Suzuki


