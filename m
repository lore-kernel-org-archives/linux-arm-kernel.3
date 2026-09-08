Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4690C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX/eAbNpULP9xBKBYr9JHDVZUyeTRdaUG21xU8KFsGY=; b=m+rRDc6Q9kSZ0p70LBFr701az4
	pw2YjpWi+yTgL2La5RUPLk17usrBIxTHqojAF1qwq2ifbXY45saURddaRnEs9gaSxicGoPgwR51ah
	FsqTuEQ1JIPNB2eOAQluFd/wNpsToYKsV7FKAZ4Tq5tZKMz9UbtewiJnhVP9RUte2c0ETIWVIS0XQ
	82VhTi0tMkwLf1jNU0SqE23OE/UHsB7YD3o4gTJcj5fn02Nhfca6kzTTNDRKBpM2KlXqTjVtfBJ6R
	6itY8+unJdvyN6A8FvChwr+Vq1x3gGEN30STNUlBMBpgbn1EQ5Ta8kezqubdwXuoZMkuKYXvL85OY
	OGfzN7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSZ-00000008fSF-0ecX;
	Tue, 08 Sep 2026 09:49:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSY-00000008fQ3-1ElC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wX/eAbNpULP9xBKBYr9JHDVZUyeTRdaUG21xU8KFsGY=; b=eCYvu/uYVi8DNeMAMPqlcevIXy
	N2RqRAL/+HyuGSBbtpoUT7IP+aI8XBQpSSAIfun5tUGMMHV1Uj75Zggdb6+H3zL/F1lgDd+qRZX1N
	9RrI+gnogDjPEzKyqSC/G1g9qKbuzwnrom+wkUuk+MtXnDMYoDgxKnhy07uYQ2yfQRxIM4L1ecA1a
	5348ZPCZBD6NNDi4uLzXHu/NywcpZQj+AtEYfFxenDMGQd9sUMrIJ5ePHNjDIMgJmG7aZZanK0sgw
	50gGmWEbPjZDekwwdtAemUeOTd8QSgrDg+WI/xA/Rck+wtGPPVQil8EoewbTP2MB0Okq7JCYzLAJz
	h9FBze4w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3sSR-0000000HE5X-2G3i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:49:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AE741476;
	Tue,  8 Sep 2026 02:49:33 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 685AE3F7B4;
	Tue,  8 Sep 2026 02:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788860977; bh=kJteEwoT3OdITFopCoesbDyojoKuGSBp7kslVKQdQY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bnEijS8UoORGgws4/gA0W4HiONlIvwJMlSXD8OSU/r3dg/eT6i8+aRl9HfVheUaUS
	 jvbmdRo2tL2vQpBZlOOwEVT3bN917GE2o282Fo2hN0lkk+zG8H03BMgZ26A3d4piwM
	 cNK8rOVVEt5zZV461cpirSw+FvdQcp6Aynp4+T4M=
Message-ID: <7c8b3430-e233-486e-b4fd-3c1f5d05d97d@arm.com>
Date: Tue, 8 Sep 2026 10:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/7] firmware: arm_rmm: Check for RMI support at init
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-3-suzuki.poulose@arm.com>
 <25894d08-0fec-4dcd-9d5e-e8270ff9d26c@redhat.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <25894d08-0fec-4dcd-9d5e-e8270ff9d26c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104939_930665_AF53551B 
X-CRM114-Status: GOOD (  21.10  )
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

On 08/09/2026 07:46, Gavin Shan wrote:
> Hi Suzuki,
> 
> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> Query the RMI version number and check if it is a compatible version.
>> The first two feature registers are read and exposed for future code to
>> use.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

...

>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ 
>> arm_rmm/rmi.c
>> new file mode 100644
>> index 0000000000000..008a783407b4e
>> --- /dev/null
>> +++ b/drivers/firmware/arm_rmm/rmi.c
>> @@ -0,0 +1,101 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023-2026 ARM Ltd.
>> + */
>> +
>> +#include <linux/cpufeature.h>
>> +#include <linux/memblock.h>
>> +#include <linux/arm-rmi-cmds.h>
>> +#include <linux/slab.h>
>> +
>> +#include <asm/memory.h>
>> +#include <asm/pgtable-hwdef.h>
>> +
>> +/* Currently only the first 2 registers are used by Linux */
>> +#define RMI_FEAT_REG_COUNT    2
>> +static __ro_after_init unsigned long 
>> rmi_feat_reg_cache[RMI_FEAT_REG_COUNT];
>> +
> 
> I would drop RMI_FEAT_REG_COUNT and use ARRAY_SIZE(rmi_feat_reg_cache) 
> in the code.
> Besides, __ro_after_init is usually put at the last the declaration.
> 
> static unsigned long rmi_feat_reg_cache[RMI_FEAT_REG_COUNT] 
> __ro_after_init;
> 
>> +unsigned long rmi_feat_reg(unsigned long id)
>> +{
>> +    if (WARN_ON(id >= RMI_FEAT_REG_COUNT))
>> +        return 0;
>> +
>> +    return rmi_feat_reg_cache[id];
>> +}
>> +EXPORT_SYMBOL_GPL(rmi_feat_reg);
>> +
> 
> I would suggest to rename 'id' to 'index' since it represents the feature
> register index instead of feature register ID.
> 
> unsigned long rmi_feat_reg(unsigned long index)
> {
>     :
> }
> EXPORT_SYMBOL_GPL(rmi_feat_reg);
> 


>> +/*
>> + * Note arm64_init_rmi() must be called before kvm_init_rmi() 
>> otherwise KVM
>> + * will not support realm guests. subsys_initcall() is called before
>> + * module_init() (used for KVM) so this is OK.
>> + */
>> +subsys_initcall(arm64_init_rmi);
>> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
>> new file mode 100644
>> index 0000000000000..2fb1f7f86d71e

>> +static inline int rmi_features(unsigned long index, unsigned long *out)
>> +{
>> +    struct arm_smccc_res res;
>> +
>> +    arm_smccc_1_1_invoke(SMC_RMI_FEATURES, index, &res);
>> +
>> +    if (res.a0 == RMI_SUCCESS && out)
>> +        *out = res.a1;
>> +
>> +    return res.a0;
>> +}
>> +
> 
> We needn't expose rmi_features() through include/linux/arm-rmi-cmds.h 
> since it's
> used for once in rmi.c::rmi_read_features(). I would suggest to drop it 
> by combining
> the code with that function.

Thanks for the review, I will address them in the next version.

Cheers
Suzuki



