Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4716C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3qso1Q0z1mVInc8XqAHKtGZeoRDu8/ph6I3e76SdB8=; b=vF8o7qy4v1yulpJiZzIchrDu3c
	Mi5CsO6RUGOWwDWzNhWsQemQH0JBkpsxEm0V0LTRDM967QfBwyo5tcRTIFCZPZdFVEvaBTaPVk+sa
	dOwRlCm2idhWc4x8jbNfAJC+yo6/N54RTp4HBhcOemIaApB8TdNe08Pe35anVW9FSUiikRAPei7n2
	4VKFdjlw64ELsDJXhJTT9j8Nks0S0a6Gym819XMIc4jJ/OCKSuqE0lSQzDq1F9T+NuFVpCS03QAaR
	TP03zM1z+R2j1rlImwIycK0dvC+1e2LZgPq2mD/MTdFvfvlgbGbYn7+iwh0MTsaR0lxOyJAl+xTD5
	U7dZnLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtREJ-0000000C38N-3QQA;
	Mon, 10 Aug 2026 14:43:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtREH-0000000C37u-0p1D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:43:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09F9614BF;
	Mon, 10 Aug 2026 07:43:48 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3913F3F86F;
	Mon, 10 Aug 2026 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786373032; bh=VkzYFuLchlwJSvO1cByJNfVkdEU8sgvxxagzcKl5gOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PlCzdKPMm7x8K/Od7wLEqiKm4370YEMfmHX6sOtFxEmJv4P+H/fq9tlb/QcAhYlCr
	 aOtpeqkDDW596Dn0G3/QTbUN3QbtjRIHy/+JKR/LEvBVldPLO4Id3mXUcMDo+dbSca
	 sTa8ERLD3CQI3uA6xMHGRZkirzcWeb3WtnGb3770=
Message-ID: <048c8d59-d47d-4f64-b93d-3b041636e230@arm.com>
Date: Mon, 10 Aug 2026 15:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
To: Jason Gunthorpe <jgg@ziepe.ca>, Peter Griffin <peter.griffin@linaro.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 willmcvicker@google.com, jyescas@google.com
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
 <amOpSPmc36+YXgCQ@nvidia.com>
 <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
 <20260810141553.GP200537@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260810141553.GP200537@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074353_281529_1AA22168 
X-CRM114-Status: GOOD (  13.26  )
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

On 10/08/2026 3:15 pm, Jason Gunthorpe wrote:
> On Fri, Aug 07, 2026 at 03:37:37PM +0100, Peter Griffin wrote:
> 
>>>> @@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
>>>>        if (cfg & BIT(1)) {
>>>>                used_bits[1] |=
>>>>                        cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
>>>> -                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
>>>> +                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
>>>> +                                 STRTAB_STE_1_INSTCFG);
>>>>                used_bits[2] |=
>>>>                        cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
>>>>                                    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
>>>
>>> This adds for "stage-1" and "stage-2", while missing "bypass"?
>>
>> I need to follow up again on this point, but I don't believe currently
>> we require the override for Laguna when it's in bypass.
> 
> Oh? Why not?
> 
> Is the issue the IOPTEs are set to no-exec or something like that?

In general, there isn't expected to be anything in the memory system 
downstream of the SMMU that makes use of the Privileged or 
Instruction/Data attributes, so I would assume that is the case on this 
SoC. FWIW, hardware folks would be quite keen on relaxing the 
architecture to say that an SMMU isn't even required to propagate those 
attributes at all.

Thanks,
Robin.

