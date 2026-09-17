Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0EFC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIaqL5DIGin3TQ5gP4rFdIcPkxE78SunZscTQSmAw2E=; b=0mqIkqSP+Ff/xZWx29rvkz7xiM
	cwOWza+yg9hOVQdewEl8f3QyRBWbm6jlWVnb+XlRy1vvnGWWAxcCKjVEbfesKBnowXcaflIe/HsHO
	N32nMkPZ4oz2o3SfquEvmuITqy7ic404tmcl27GsEKKCDF3s5kBgzZwt4Is7t18jibsWJ41QKp43u
	rHo/6WvJqhndxZDy/JgZoYfs7LP0QQZnLBvFymUkXNY59Xzc7Fb7PtAx1QfSJI9dxn/jzq2zKcBg3
	KjnPdI/V4VrN8YbCg7YNAho2m94FwZ7JSKBQxeK25GXd09mqHueHnOekKsN7xFZ3kKKwUPJh7eDez
	pPrIfpyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FHH-0000000BzLC-2t48;
	Thu, 17 Sep 2026 16:48:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FHD-0000000BzJ0-3Yol
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:48:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 922AE143D;
	Thu, 17 Sep 2026 09:47:53 -0700 (PDT)
Received: from [10.57.6.197] (unknown [10.57.6.197])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 363063F86F;
	Thu, 17 Sep 2026 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789663677; bh=OVTdVYW4tByjiVxyCkYDgohXJD20Howf0MtVHvJ6joI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CH5gFberx7XfLcBWrdd12V63FKFULCygnd+iN6kj21c1iX60i0RQgUrQDusLX1rO/
	 IfcdlzzsNuv+gxVhAuRFPn3N1a3z94Z40B3Zm8ua9Ub0KB+1voRiDzpJI/MNqBIWP3
	 P6YMK8IMn5yM1C/VhSlFo+js0w1pfmZTyp2pAbvo=
Message-ID: <d51bbcf4-f396-4009-994a-ef335d8963c8@arm.com>
Date: Thu, 17 Sep 2026 17:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 11/23] KVM: arm64: Use kvm_vm_is_unprotected() for
 !kvm_vm_is_protected()
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <20260915160141.3543048-12-suzuki.poulose@arm.com>
 <CA+EHjTzOR7xczcb1HbUAi3H7K8ta=pFcdjxJb7UixZEh7QS-Eg@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTzOR7xczcb1HbUAi3H7K8ta=pFcdjxJb7UixZEh7QS-Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_094759_955223_60378DAF 
X-CRM114-Status: GOOD (  11.51  )
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

On 17/09/2026 12:47, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Tue, 15 Sep 2026 17:01:29 +0100, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
> [...]
>> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> [...]
>> @@ -490,7 +490,7 @@ static void handle_exit_pkvm_state(struct kvm_vcpu *vcpu, int exception_index)
>>   {
>>           int exception_code = ARM_EXCEPTION_CODE(exception_index);
>>
>> -        if (!is_protected_kvm_enabled() || kvm_vm_is_protected(vcpu->kvm))
>> +        if (!kvm_vm_is_unprotected_pkvm(vcpu->kvm))
>>                   return;
> 
> Could the two pKVM-only helpers keep the static key in front? With
> `is_protected_kvm_enabled() &&` inside kvm_vm_is_unprotected_pkvm()
> and kvm_vm_is_protected_pkvm(), as kvm_vm_is_protected() had it before
> patch 5, the boot-patched branch skips the load again for every user.
> This runs on every exit: the old test is a cpucap, so on a host
> without pKVM the function returns straight away, while the new one
> loads vcpu->kvm->arch.vm_flavor on every host. The wide
> kvm_vm_is_protected() can't have it, since Realms run without pKVM.

Ack

Suzuki

> 
> Cheers,
> /fuad


