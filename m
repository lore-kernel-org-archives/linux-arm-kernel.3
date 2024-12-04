Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1807E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSOqBzFuf6TtEcP4WmW9ziCCynrpbdU7GCNn9SgX7ZY=; b=NGW3wXxCDH5QVUe+ivz2vwKN4z
	CmypmGRdYww4ZRdsX+G1rvuqm8oxrNPJFdBcgrHM36LYfC7ehTBNleORXEn2+7TetBYcFgf8+ZR2R
	cR/5mvIp0pDy9Eioh3A7IDcTD9d2q+3+nfjuKdZ9xI4X+NpW/cLO70NRu0mEWyMAsIG/P2C3DYTq/
	LwvMubjXFoZ6IcA2SIfMYjmHQEh79GNZ+4dwhca+yuUL6fDm7rwSiHhGshR4051GqHHDigESA+0cJ
	R+o5pj6LlbGq53UeFrDOx5XevWiyC9yWM+SfMUAZFTdxXEjBDoB55rpZuQbXjg0cZjBpYxFvRRRl/
	7k3j0S1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlPK-0000000BzfU-3i3b;
	Wed, 04 Dec 2024 09:10:54 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlNM-0000000BzI4-3VlC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:08:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y3BTX4DDsz1kvGw;
	Wed,  4 Dec 2024 17:06:24 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 2902D1401F1;
	Wed,  4 Dec 2024 17:08:41 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 4 Dec 2024 17:08:40 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>
Subject: Re: [PATCH 5/5] KVM: arm64: Handle DABT caused by LS64* instructions
 on unsupported memory
To: Marc Zyngier <maz@kernel.org>
References: <20241202135504.14252-1-yangyicong@huawei.com>
 <20241202135504.14252-6-yangyicong@huawei.com> <87o71trtrx.wl-maz@kernel.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <357fbc9b-c73e-7494-0c48-27917b95005f@huawei.com>
Date: Wed, 4 Dec 2024 17:08:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87o71trtrx.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_010853_237933_2212A6ED 
X-CRM114-Status: GOOD (  30.89  )
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

On 2024/12/3 17:38, Marc Zyngier wrote:
> On Mon, 02 Dec 2024 13:55:04 +0000,
> Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> FEAT_LS64* instructions only support to access Device/Uncacheable
>> memory, otherwise a data abort for unsupported Exclusive or atomic
> 
> Not quite. FEAT_LS64WB explicitly supports Write-Back mappings.

thanks for the information, I didn't know this since it's not listed on DDI0487K.a,
have seen this feature from [1]. will refine the comments and mention the behaviour
applies when no FEAT_LS64WB.

[1] https://developer.arm.com/documentation/109697/2024_09/Feature-descriptions/The-Armv9-6-architecture-extension

> 
>> access (0x35) is generated per spec. It's implementation defined
>> whether the target exception level is routed and is possible to
>> implemented as route to EL2 on a VHE VM. Per DDI0487K.a Section
>> C3.2.12.2 Single-copy atomic 64-byte load/store:
>>
>>   The check is performed against the resulting memory type after all
>>   enabled stages of translation. In this case the fault is reported
>>   at the final enabled stage of translation.
>>
>> If it's implemented as generate the DABT to the final enabled stage
>> (stage-2), inject a DABT to the guest to handle it.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  arch/arm64/kvm/mmu.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index c9d46ad57e52..b7e6f0a27537 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1787,6 +1787,20 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>  		return 1;
>>  	}
>>  
>> +	/*
>> +	 * If instructions of FEAT_{LS64, LS64_V, LS64_ACCDATA} operated on
>> +	 * unsupported memory regions, a DABT for unsupported Exclusive or
>> +	 * atomic access is generated. It's implementation defined whether
>> +	 * the exception will be taken to, a stage-1 DABT or the final enabled
>> +	 * stage of translation (stage-2 in this case as we hit here). Inject
>> +	 * a DABT to the guest to handle it if it's implemented as a stage-2
>> +	 * DABT.
>> +	 */
>> +	if (esr_fsc_is_excl_atomic_fault(esr)) {
>> +		kvm_inject_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
>> +		return 1;
>> +	}
> 
> This doesn't seem quite right. This is injecting an *External* Data
> Abort, which is not what the spec says happens, as you are emulating
> the *first* acceptable behaviour:
> 
>   "The check is performed at each enabled stage of translation, and
>    the fault is reported for the first stage of translation that
>    provides an inappropriate memory type. In this case, the value of
>    the HCR_EL2.DC bit does not cause accesses generated by the
>    instructions to generate a stage 1 Data abort,"
> 
> So while the exception is reported at a different EL, the fault should
> still be an "unsupported Exclusive or atomic access". 

yes it's trying to emulate the first behaviour to let guest OS handle it
as how host OS handle it - send a SIGBUS to the EL0 task if it's performing
on unsupported memory type. Currently if such cases happens the VM will be
killed without the handling here. Keep the injected FSC as "unsupported
Exclusive or atomic access" should be more proper, will make it in next
version.

> But that's also
> assuming that S2 has a device mapping, and it is EL1 that did
> something wrong. Surely you should check the IPA against its memory
> type?

in my case it happens when both S1 and S2 mapping is normal memory, for example
running the hwcap test (PATCH 3/5) in the VM. But yes the memory type should
be checked here.

> 
> Further questions: what happens when a L2 guest triggers such fault?
> I don't think you can't arbitrarily route it back to L2 without
> looking at why it faulted.
> 

will see what affect to the nested VM case. but as you point out, it's
too early to inject the abort here, at least we should check the memory
type. will address it.

Thanks.





