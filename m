Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA15CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnaxKrr9WkZ/tVfA8N+OUVzjsgqSje0wq+OidC+bDKo=; b=BYojqiPkqkw1y1VbAFTKsAZ7mL
	3xFvwA84yOYpj4R5X4KRYEPS5j6orjXfHGtSAccLvDxm0X8IgDm//yJnYK0YFg/sSnGLztPIX5V7G
	Qa5xEt6S90BIj45QLmIOy9iN+/FhIaueXU+Mkk6NKhuUh/jkHmAgJPY++0i5GQtDMhWh37FT2ZA0/
	xLWwAO4//Z8GuwUsEEeKjtZ7D3fPE/6ed1to5yskrqjmGlsOtJMCEABrDml5ugnZ/S+FP5Q/w3Nbe
	L1mc6m3OpelTOtcTlaMhOExeOuZGxKr90KdInxWHrezkxatjmp1ceODedT52T1AtK8xJGZsFTzgAS
	rt8hXilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLIY-00000006Y5V-0TdP;
	Fri, 08 May 2026 13:31:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLIV-00000006Y51-1y9d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:31:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB72C32CE;
	Fri,  8 May 2026 06:31:12 -0700 (PDT)
Received: from [10.57.63.248] (unknown [10.57.63.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22E883F836;
	Fri,  8 May 2026 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778247078; bh=JYZqDBKKjLeeqvrl+VwK6aI+mrwXx8FfCqW46Btn9cY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LYmZgXXUj7zK2hyjZUFAIchohbj0LAGJFNR9LLv5EKkNPemzSuxgHqpv1OFcM7FvY
	 Wf+TQr60SS0pm6uyVXyx+cNrTxBdhSj4b3TMy4LnxBec3FyCdZPvRXw5SNF8AMEVJm
	 AMdMHrpIzXGjylSN20xzJbMkGHXey5GnjB01pdpg=
Message-ID: <f31043cc-45dd-457f-8031-0cef51c9470e@arm.com>
Date: Fri, 8 May 2026 14:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and
 Hardware Dirty bits
To: Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jean-Philippe Brucker <jpb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260503135413.1108138-1-nicolinc@nvidia.com>
 <af0SdkjQOZxnnaQb@google.com> <20260508123550.GB9254@nvidia.com>
 <af3hWGp3etGOIdEn@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <af3hWGp3etGOIdEn@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_063119_588658_D3BC997B 
X-CRM114-Status: GOOD (  22.86  )
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

On 2026-05-08 2:12 pm, Pranjal Shrivastava wrote:
> On Fri, May 08, 2026 at 09:35:50AM -0300, Jason Gunthorpe wrote:
>> On Thu, May 07, 2026 at 10:30:14PM +0000, Pranjal Shrivastava wrote:
>>>> @@ -92,6 +92,16 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
>>>>   
>>>>   		target->data[1] = cpu_to_le64(virt_to_phys(mm->pgd) &
>>>>   					      CTXDESC_CD_1_TTB0_MASK);
>>>> +
>>>> +		/*
>>>> +		 * Enable Hardware Access and Dirty updates (DBM) if supported.
>>>> +		 * This is safe to enable by default, as PTE_WRITE and PTE_DBM
>>>> +		 * share the same bit.
>>>> +		 */
>>>> +		if (master->smmu->features & ARM_SMMU_FEAT_HA)
>>>> +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
>>>> +		if (master->smmu->features & ARM_SMMU_FEAT_HD)
>>>> +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
>>>
>>> IIUC, we should be setting these if IO_PGTABLE_QUIRK_ARM_HD is present?
>>
>> SVA does not use IO_PGTABLE at all, and it directly constructs its own
>> CD.
>>
>> No relation between those two flows.
> 
> I understand that but I mean we need to know if the system supports
> HTTU ? Like for SMMU we use the IO_PGTABLE_QUIRK, shouldn't we be
> checking if the CPU's tables support HTTU?
> 
> Are we assuming that if the SMMU IDR presents HTTU capability the MMU
> would also have it? I think an unconditional enablement is risky as we
> may not have system-wide HTTU support.
> 
> If we look at arm_smmu_master_sva_supported, the driver already
> maintains a strict agreement between the CPU and SMMU for SVA.
> It checks sanitized CPU ID registers for things like PARANGE & ASIDBITS,
> and it uses system_supports_bbml2_noabort() to decide whether to enable
> FEAT_BBML2.
> 
> Shouldn't we follow this exact same pattern for HTTU ?
> We should probably be checking cpu_has_hw_af() (from asm/cpufeature.h)
> in the SVA support check or here if we wanna enable HTTU.

It might make sense to depend on CONFIG_ARM64_HW_AFDBM - when that is 
enabled, then IIRC we already expect to cope with some CPUs not 
supporting hardware updates, so it should still be fine for an SMMU to 
make them even if no CPU does. However, if it's disabled then I'm not 
sure if missing access flag faults (if SMMU HA silently sets them) might 
be an issue - for dirty, we'd just never put down the Writeable-Clean 
permission so enabling SMMU HD wouldn't do anything anyway.

Thanks,
Robin.

