Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A74CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 07:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3nfWI+ujIzwCP1N5ZqG6Gm8qME+gKFGAFiRfhLvgDk=; b=VA4s3GmrC3byiRua2iJuV6849y
	W/9h/j9ICJPBXLW3n3MdPaEM7OQStCV2xNBErGzC+bryjSGzjq6YoA0qXeMpgJ+wI9C9auIfMUubR
	XGw18o0W0EXTA8mdmfNeZ7Cnv1SjbpFjm1bCvz4tLNablqzRO7MoeFrFQ4vigdEEbSeqdsNCAmvlh
	bulsJpaRsI9uGa5F5SqCN+sJHqE+wol5LSZNf0RjUxuLpXwC1+XTmHI7FL9hRGdVfu302U633Kw+0
	OixLUgDIcWpBeIj+EyLNFel8GJlunyUw08CM3gvSm9bAO+kjC+aCawlB3pMnCR9qqCU/T9cCkXJjt
	15boFycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtqZ-0000000D6iq-3yCN;
	Sat, 03 Oct 2026 07:07:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCtqW-0000000D6iV-3lRK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 07:07:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25B942F;
	Sat,  3 Oct 2026 00:07:43 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 163E63F85F;
	Sat,  3 Oct 2026 00:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791011266; bh=fcWSRwYqC7iDa1xgy0kg2U7wsZFZJLJk1a4HcvjWK5I=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=PPj0gM2RRh21a27DM/q2/tyeKO0DsJnY3GH0PWCJS7UVYAEtbBp7Ez9b8ZaULD6Xj
	 2dnwFTOkOPfgCECZeEJndniLsNWLRZQ+EHqxBlRJDHEgJ740NaFO9F3W9cUZE9u/PJ
	 y52tz3Ck56R1gHYTC5TcmWjSuYfZE7m4ksWwojiM=
Message-ID: <d7a398b3-5cbe-4a1c-bdd3-c1c5925dfc33@arm.com>
Date: Sat, 3 Oct 2026 08:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com>
 <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org>
 <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
 <86pkxs2npx.wl-maz@kernel.org>
 <CA+EHjTy4rb+6z0bqh7sPqACES0EDpURdeoyiFGmdw3p0PENcOQ@mail.gmail.com>
 <86o6dc2ka1.wl-maz@kernel.org> <83e79119-b331-4640-b2c7-cc8135d71c77@arm.com>
In-Reply-To: <83e79119-b331-4640-b2c7-cc8135d71c77@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_000749_017718_E75B8CD3 
X-CRM114-Status: GOOD (  18.14  )
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

On 03/10/2026 06:53, Suzuki K Poulose wrote:
> On 02/10/2026 16:29, Marc Zyngier wrote:
>> On Fri, 02 Oct 2026 15:37:00 +0100,
>> Fuad Tabba <tabba@google.com> wrote:
>>>
>>> Hi Marc,
>>>
>>> On Fri, 02 Oct 2026 15:15:06 +0100, Marc Zyngier <maz@kernel.org> wrote:
>>> [...]
>>>> Honestly, we introduce the flavor stuff to make it easy to match
>>>> things on a particular VM type in a readable way. So why isn't this
>>>> reading:
>>>>
>>>>          if (vcpu->kvm->arch.vm_flavor != VM_PROTECTED_PKVM)
>>>>                  return;
>>>
>>> I know this is a sketch, but just in case: that's inverted. The sync
>>> only applies to non-protected pKVM VMs (EL2 ignores it for protected
>>> ones), so it would be != VM_PKVM.
>>
>> See what I meant about this stuff being completely intractable? I
>> still have no idea what it means! ;-)
>>
> 
> Just to be clear: unprotected_pkvm() != (vm_flavor != VM_PROTECED_PKVM).
> Rather, unprotected_pkvm => (vm_flavor == VM_PKVM).
> 
> And the code wanted to bail out early for !unprotected_pkvm(). We can
> stick in "is_protected_kvm_enabled()" for unprotected_pkvm predicate
> 
> But, I can drop the helper and use the vm_flavor check.

FWIW: Here is the diff for the above change. If you are happy
with the following, I could fold this in.


diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 90547fbbc8ad7..bcec14c587119 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -772,7 +772,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
                 kvm_call_hyp_nvhe(__pkvm_vcpu_put);

                 /* __pkvm_vcpu_put implies a sync of the state */
-               if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
+               if (vcpu->kvm->arch.vm_flavor == VM_PKVM)
                         vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
         }

@@ -1006,7 +1006,7 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu 
*vcpu)

         if (is_protected_kvm_enabled()) {
                 /* Start with the vcpu in a dirty state */
-               if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
+               if (vcpu->kvm->arch.vm_flavor == VM_PKVM)
                         vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
                 ret = pkvm_create_hyp_vm(kvm);
                 if (ret)
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 384c5d258c7f8..4e16e7d165515 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -490,7 +490,7 @@ static void handle_exit_pkvm_state(struct kvm_vcpu 
*vcpu, int exception_index)
  {
         int exception_code = ARM_EXCEPTION_CODE(exception_index);

-       if (!kvm_vm_is_unprotected_pkvm(vcpu->kvm))
+       if (!is_protected_kvm_enabled() || vcpu->kvm->arch.vm_flavor != 
VM_PKVM)
                 return;

         /*



Cheers
Suzuki>
> Cheers
> Suzuki
> 
>>     M.
>>
> 


