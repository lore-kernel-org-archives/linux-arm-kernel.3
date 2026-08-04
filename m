Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE65C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfiH5twDnELxoWkEWNQ53HPaRUzKBcx6UJ6WQR0aCQQ=; b=Y6ZRDycHni04zVUgdGw+QsLUCC
	ly+eh+OAL1ZNJ7xjVvnyHBMu0IGuALuR29fkl8Zqm4NnQB2hKRioO+zGKqeeBTVvQwr+iVozKD3hj
	lQzdCbyKRtVxGzYQKWMEiMgKGojzNiHzNJN1RXeybNxesb8n8yVl7GVBnR9/w0OmlxDS+nvuIMv89
	Gzp9RTPFX6O7UVMN+PWJPB+NFSmPdN4aX+ac70/05U6oBjQnqL6Uf5yE/gabDMCRL/r2FIq/+Hr62
	qPqmAfPwdKyjJZZiYwfAooTghWO5l+9oumhI8qthinqcwa3qBoq19jYikaAcOqPbjaV1TPQzjlxui
	sUiP4Rfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE43-00000001n4w-30mo;
	Tue, 04 Aug 2026 12:16:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE41-00000001n4b-49TJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:16:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF8851476;
	Tue,  4 Aug 2026 05:16:03 -0700 (PDT)
Received: from [10.57.44.180] (unknown [10.57.44.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E55483F66F;
	Tue,  4 Aug 2026 05:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785845768; bh=bcAMhZTiy49tEojqvYK5r5G3B51T0weL1dSTwGIlZwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c6UEwA1tfFd2CmIo6fSWGXXuYEzA2q181oOLDQYEGFGK+6ReJcnh1HF8CmR55UEwS
	 4KYLjtJBdGc+eGUnk52Cn0Ek0phGnFAEbNgF42/95p8y/PHexLLabxa6ezN6urQQx8
	 oo4Cl+2TiqW9TB+qhDx/Li/qJmx1beTxD+VNJIHc=
Message-ID: <c1f0aad2-33cb-4dab-b54d-d09998fed36e@arm.com>
Date: Tue, 4 Aug 2026 13:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 17/45] KVM: arm64: CCA: Tear down RTTs
Content-Language: en-GB
To: Alper Gun <alpergun@google.com>, Steven Price <steven.price@arm.com>
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
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-18-steven.price@arm.com>
 <CABpDEun3NPr7Na85pmOvdfYQ1DB-2nCcocsyDESXM15bzJU1og@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CABpDEun3NPr7Na85pmOvdfYQ1DB-2nCcocsyDESXM15bzJU1og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_051610_102204_021DB8E0 
X-CRM114-Status: GOOD (  20.31  )
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

Hi there

On 03/08/2026 23:29, Alper Gun wrote:
> On Mon, Aug 3, 2026 at 6:45 AM Steven Price <steven.price@arm.com> wrote:
>> [...]
>> +static void realm_unmap_stage2(struct kvm *kvm)
>> +{
>> +       struct realm *realm = &kvm->arch.realm;
>> +
>> +       lockdep_assert_held(&kvm->arch.config_lock);
>> +
>> +       if (realm->stage2_unmapped)
>> +               return;
>> +
>> +       write_lock(&kvm->mmu_lock);
>> +       kvm_stage2_unmap_range(&kvm->arch.mmu, 0,
>> +                              BIT(realm->ia_bits - 1), true);
>> +       write_unlock(&kvm->mmu_lock);
>> +
>> +       realm->stage2_unmapped = true;
>> +}
>> +
>> +int kvm_realm_teardown_stage2(struct kvm *kvm)
>> +{
>> +       lockdep_assert_held(&kvm->arch.config_lock);
>> +
>> +       realm_unmap_stage2(kvm);
>> +       return realm_destroy_rtts(kvm);
>> +}
> 
> Hi Steven,
> 
> I noticed a warning in dmesg when destroying a realm:
> 
>    [  158.533495] Call trace:
>    [  158.535927]  kvm_destroy_realm+0x208/0x218
>    [  158.540356]  kvm_arch_destroy_vm+0xc8/0xd8
>    [  158.544439]  kvm_put_kvm+0x324/0x4b0
>    [  158.548002]  kvm_vm_stats_release+0x1c/0x38

Thanks for the report and the detailed analysis.

> 
> I traced this and found the following:
> 
> At this point, calling realm_destroy_rtts() may fail destroying the RTTs
> because RECs are still active and the Realm is not terminated, but the
> walk finishes and still sets realm->rtts_destroyed = true.
> 
> Later, kvm_destroy_realm() calls rmi_realm_terminate() and then calls
> realm_destroy_rtts(kvm) again. But because realm->rtts_destroyed is already
> set to true, it exits early without tearing down the RTTs.
> 
> Consequently, rmi_realm_destroy() is invoked while the RTT tables still
> exist in RMM, which fails and triggers WARN_ON(rmi_realm_destroy).
> 
> The fix I used was to remove realm_destroy_rtts() from
> kvm_realm_teardown_stage2():
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -434,7 +434,7 @@ int kvm_realm_teardown_stage2(struct kvm *kvm)
>    lockdep_assert_held(&kvm->arch.config_lock);
> 
>    realm_unmap_stage2(kvm);
> - return realm_destroy_rtts(kvm);
> + return 0;
>   }
> 
> I think we don't need RTT destruction here as it will be handled cleanly in
> kvm_destroy_realm() later.

That sounds sensible to me, I will take a look and fix it locally for 
the next version.


Thanks
Suzuki

> 
> Thanks,
> Alper


