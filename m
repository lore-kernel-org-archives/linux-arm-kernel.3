Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5015FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xO1mgQoBlV4I9lpY7sTUg15hABYhZSQSUYna5tUa3DA=; b=Of4dp9SKcDLGJvn24gKJ3Ap3GM
	Za1oVBTUObHddPYNXdUY8BO2wqSmsqVasxt/AcIFsTPAIa7FDkT9cDcTTUi89MXnUZrn094f+UuY6
	PfxQQtxAeidH8z6W4inEuCGagz4yAo6e9yzhWZo6vosl2pqlD6JOiKijUV1wPRj2qzodL4J5qOaGr
	96MIltYcwuXR/5z8B16cRVHI1iH/cgL9HTFnHCLnwRei3gmn3yUHcIMeZHbVAJO7/uwfRorVhaIpT
	QxnUyaPClwbxif/KvkDakBaWKbam+MQf3o1Scew4yYHP4iWv7xFnHLVqTs4u1PeX98vfamueLegaN
	Tsf4BBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCbFT-0000000BCQv-05dx;
	Sat, 25 Oct 2025 10:11:47 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCbFQ-0000000BCQH-1Qwx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 10:11:45 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4ctwWh4BY3z1T4Fg;
	Sat, 25 Oct 2025 18:10:40 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id ECC6B180488;
	Sat, 25 Oct 2025 18:11:38 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 25 Oct 2025 18:11:38 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 25 Oct 2025 18:11:38 +0800
Message-ID: <ba558cbf-86df-67a8-e873-bc90d27cbf0b@hisilicon.com>
Date: Sat, 25 Oct 2025 18:11:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 3/7] KVM: arm64: Handle DABT caused by LS64*
 instructions on unsupported memory
Content-Language: en-US
To: Oliver Upton <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<yangyccccc@gmail.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	"Zhou Wang" <wangzhou1@hisilicon.com>
References: <20251024090819.4097819-1-wangzhou1@hisilicon.com>
 <20251024090819.4097819-4-wangzhou1@hisilicon.com>
 <aPvZWY57ppqqWm50@linux.dev>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <aPvZWY57ppqqWm50@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_031144_764177_0BE2A6FD 
X-CRM114-Status: GOOD (  19.41  )
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

On 2025/10/25 3:54, Oliver Upton wrote:
> Hi Zhou,
> 
> On Fri, Oct 24, 2025 at 05:08:15PM +0800, Zhou Wang wrote:
>> +/**
>> + * kvm_inject_dabt_excl_atomic - inject a data abort for unsupported exclusive
>> + *				 or atomic access
>> + * @vcpu: The VCPU to receive the data abort
>> + * @addr: The address to report in the DFAR
>> + *
>> + * It is assumed that this code is called from the VCPU thread and that the
>> + * VCPU therefore is not currently executing guest code.
>> + */
>> +void kvm_inject_dabt_excl_atomic(struct kvm_vcpu *vcpu, u64 addr)
>> +{
>> +	u64 esr;
>> +
>> +	/* Reuse the general DABT injection routine and modify the DFSC */
>> +	kvm_inject_sea(vcpu, false, addr);
> 
> This potentially injects a nested SEA which I'm not sure you want. There
> still is an interaction with nested, from DDI0487L.a B2.2.6:
> 
>   For the EL1&0 translation regime, if the atomic instruction is not
>   supported because of the memory type that is defined in the first
>   stage of translation, or the second stage of translation is not
>   enabled, then this exception is a first stage abort and is taken to
>   EL1. Otherwise, the exception is a second stage abort and is taken to EL2.
> 
> We don't need to worry about the S1 memory type since hardware will
> handle that for us. But we do need to consider whether the guest
> hypervisor enabled stage-2 translation or not and route accordingly.
> 
> int kvm_inject_nested_excl_atomic(struct kvm_vcpu *vcpu, u64 addr)
> {
> 	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_DABT_LOW) |
> 		  FIELD_PREP(ESR_ELx_FSC, ESR_ELx_FSC_EXCL_ATOMIC) |
> 		  ESR_ELx_IL;
> 
> 	vcpu_write_sys_reg(vcpu, addr, FAR_EL2);
> 	return kvm_inject_nested_sync(vcpu, esr);
> }
> 
> int kvm_inject_excl_atomic(struct kvm_vcpu *vcpu, u64 addr)
> {
> 	if (is_nested_ctxt(vcpu) && (vcpu_read_sys_reg(vcpu, HCR_EL2) & HCR_VM))
> 		return kvm_inject_nested_excl_atomic(vcpu, addr);
> 
> 	__kvm_inject_sea(vcpu, false, addr);
> 	esr = vcpu_read_sys_reg(vcpu, exception_esr_elx(vcpu));
> 	esr &= ~ESR_ELx_FSC;
> 	esr |= ESR_ELx_FSC_EXCL_ATOMIC;
> 	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
> 	return 1;
> }

Hi Oliver,

Thanks for pointing this, will modify exception injection with
above code.

Best,
Zhou

> 
> Thanks,
> Oliver
> .

