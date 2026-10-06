Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B13CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndLbXF3FabNtb+dQsv+BJtM4Aj2t7FSPtRaAHVuld68=; b=qGYicoSfqCSSTqNeLegDsQ+5o+
	0S87D5oussB9eOzPOifl07mQPYmP/ZUr+N5oyC0R28CSu9by3F7Y43HojiT6rdfPlUBCrCg2Ohx6F
	dsxks8eUQQJSWCBpZMIwhK1fMYoLVvtdA62EPxd7gmjsVPj0ZjSnzMUHg359a4Gd86VV9eIY1tCEx
	zBhNpeHEi5E4JP/nbOfHe/MRSMrqIpZEhqpzwqB98krbKgPGZE8qvkgPYrLIdxZWNEDNl0eMlaVy7
	njXNvQrt2lYcbCu0E1atr1UuiYdEyN2w9Xl4WjHCDFz+0VUlCmN4ejAuZlIM8aCuelQt6P9NBD9tt
	iX5G2zRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyTu-0000000070L-2m3x;
	Tue, 06 Oct 2026 06:16:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyTs-000000006zi-0ULk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791267411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ndLbXF3FabNtb+dQsv+BJtM4Aj2t7FSPtRaAHVuld68=;
	b=RBoQZAFeMjVHFHGqP9cV5DOF3BPT7VALnkSRGzGXYRiWgxX/N/MBE+MoahITH1JHppKChf
	rp7m2obBGipn2wgZderh2S+AwZ9LJDT0BuBib68mR87mQ8Zsc3vFEDxE4gtIgxTSehebxq
	SNQfCeIAVvZ9Vl6YW8U+RHA6LYPjbbo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-Mg6pRtukNUeISOZe4-yIJA-1; Tue, 06 Oct 2026 02:16:49 -0400
X-MC-Unique: Mg6pRtukNUeISOZe4-yIJA-1
X-Mimecast-MFC-AGG-ID: Mg6pRtukNUeISOZe4-yIJA_1791267408
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4b70941efso2030788a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267408; x=1791872208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndLbXF3FabNtb+dQsv+BJtM4Aj2t7FSPtRaAHVuld68=;
        b=CuQeL2XE0M4KiImRheJzpCRyPfRQV/KEYVMD0+vbU7F1mWzho7CD8J8YaziaSDESeI
         VZQigkYMU2T/dd9HQC/XH1x7xX2Lg/jKRk2aC5Ug4r2pm7/1lgTgilpBSRtkAMaVs48A
         im8vYppZ44CD/KvWARu/EsuJbXySGqqo3VqQjJKJQWAc9HJVQWiy/q2mIkWBF3bUhfAo
         /0ctbYWMTM2y5XnBfP5E6QgkghT0dUnDnOAVu5f4UCcrWe6RDg8X96x//gyCWuv3D7DR
         L92NbYz0NwnVETk0so/HcEsMcKpkjWnb/2CSIfRuLeiGD9+snA6xIPlVtRb3yCE5vBGP
         rJIw==
X-Forwarded-Encrypted: i=1; AKwUvBw88NtpOjgBZ6IAqVgefJGqROovL1oYEaaw/ui+TH0bd0Od7OWrVJqQ42Mk1cAEx2Ol2M25P1i9hTajhUGtulh4@lists.infradead.org
X-Gm-Message-State: AFq9FYJIqVg+el8X6OKFVjvo7trZa3cICLLDZCYaXdwS1ioIm9rpcrzz
	2/xvrQ0k7xUp9vIVme7b11HoTLLrm43oPhDJeewUC5n/8PPAsV7ZxRGG6xjo6X3t1mVi3jvcn/4
	0Wipkjzgoo6ZJpzGyhaOKsB4Sk0JCf7mJyAybjXAKYrMLmCTgDCkbi2UJZmGIEPAmhSGaMe50Ml
	8S
X-Gm-Gg: AYBFou1DMvP0GCrthxEl+tAUKNm3f8Oh6Nh4IDwgcY3fKy1dNU1ZvcFjJrXb2+yzfdD
	ITRmlyQPOPXzMJhFq5rmVVrqI7Mi2//yxmQBNJXnI2o3ok7C+2Txy98dkYgOaeJ7hp6jMCN5Sgi
	m/2Ib7sobu5jXw0tCMwjB0v4di7nSzQHJgNgI0icTSHd29/MU6YZa6Rnc3hEeVTQYyrtAsYZdrU
	fZZ7J81gEJgtqDZT/i5bCKU3OHC5ZfStopVlT/UtutgfYTfrpBN7AKjPVa9C08uwQVeslWiB7j7
	FpoWUxoyRCBitst+r2ugfiMQNWA086/P4vB5e6zerL4PP0BtCUf99jbzZqpgv0m6y6sGffeWn4D
	4ma/Rob/yU6zqDe9JUGdk5j2LibvhhNIcvzKFDOONig==
X-Received: by 2002:a17:90b:28c6:b0:3a4:b30b:b50a with SMTP id 98e67ed59e1d1-3a873697b55mr247321a91.25.1791267408193;
        Mon, 05 Oct 2026 23:16:48 -0700 (PDT)
X-Received: by 2002:a17:90b:28c6:b0:3a4:b30b:b50a with SMTP id 98e67ed59e1d1-3a873697b55mr247306a91.25.1791267407661;
        Mon, 05 Oct 2026 23:16:47 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8211b74c8sm3504720a91.0.2026.10.05.23.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 23:16:47 -0700 (PDT)
Message-ID: <6bd785aa-4693-407d-b70a-39b1d0eda63e@redhat.com>
Date: Tue, 6 Oct 2026 16:16:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 23/23] KVM: arm64: CCA: Control user register access
 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-24-suzuki.poulose@arm.com>
 <52e3e45a-751e-40b2-8dd3-3db589ddebee@redhat.com>
 <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2PLhEdYNkTCR0vZ3y9oANIja2iAjYkRDgsKC9nNMvfE_1791267408
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_231652_314880_C5068035 
X-CRM114-Status: GOOD (  18.76  )
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

On 10/6/26 4:01 PM, Suzuki K Poulose wrote:
> On 06/10/2026 06:47, Gavin Shan wrote:
>> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>
>>> The RMM restricts the access to the register states that the host can
>>> read/modify for a given Realm.
>>>
>>> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>>>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>>>        requests.
>>>        MMIO emulation in the unprotected space.
>>>
>>> Additionally we use the sysreg configuration to advertise/configure the
>>> following Realm parameters, which are required before the Realm Descriptor
>>> is created:
>>>   - SVE Vector Length
>>>   - Number of HW Breakpoints/Watchpoints
>>>   - PMU Counters.
>>>
>>> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and SVE_VLS for
>>> the configuration of Realm creation parameters. We don't support PMUs for
>>> the Realm VMs yet, so PMCR is not exposed.
>>>
>>> The RMM makes similar restrictions for reading of the guest's registers
>>> (this is *confidential* compute after all), however we don't impose the
>>> restriction here. This allows the VMM to read (stale) values from the
>>> registers which might be useful to read back the initial values even if
>>> the RMM doesn't provide the latest version. For migration of a realm VM,
>>> a new interface will be needed so that the VMM can receive an
>>> (encrypted) blob of the VM's state.
>>>
>>> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.
> 
>>>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>>>   {
>>>       int size;
>>> @@ -553,6 +572,9 @@ static int copy_core_reg_indices(const struct kvm_vcpu *vcpu,
>>>           u64 reg = KVM_REG_ARM64 | KVM_REG_ARM_CORE | i;
>>>           int size = core_reg_size_from_offset(vcpu, i);
>>> +        if (vcpu_is_rec(vcpu) && !kvm_realm_validate_core_reg(i))
>>> +            continue;
>>> +
>>>           if (size < 0)
>>>               continue;
>>> @@ -598,6 +620,9 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>>>       if (!vcpu_has_sve(vcpu))
>>>           return 0;
>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>> +        return 1; /* KVM_REG_ARM64_SVE_VLS */
>>> +
>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>           return 1; /* KVM_REG_ARM64_SVE_VLS */
>>>
>>
>> Aren't above two checks conflicting to each other?
> 
> Do they? We allow SVE_VLS only for the Realms and we allow that
> before the vCPUs are finalized. For normal VMs, depending on
> whether the vcpus are finalized, we either send 1 or the full list.
> 

num_sve_regs() can be called for 3 cases: (a) non-finalized RECs; (b) finalized
RECs; (c) Other finalized vCPUs, correct? "if (kvm_vm_is_realm(vcpu->kvm))", which
would be "if (vcpu_is_rec(vcpu))", covers (a) and (b). We needn't the excessive
check "if (!kvm_arm_vcpu_sve_finalized(vcpu))". So the check would be something
as below after this series is applied:

	/*
	 * KVM_REG_ARM64_SVE_VLS is visible on realm vCPU no matter if it
	 * has been finalized.
	 */
	if (vcpu_is_rec(vcpu))
		return 1;

This check "if (vcpu_is_rec(vcpu))" belongs to PATCH[22]. Hope I make myself
clear this time :)

>>
>>> @@ -625,6 +650,10 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>>>           return -EFAULT;
>>>       ++num_regs;
>>> +    /* For Realms only support SVE_VLS */
>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>> +        return num_regs;
>>> +
>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>           return num_regs;
>>
>> Same question here.
> 
> As above.
> 
> Suzuki

Thanks,
Gavin


