Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99A3C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8EYsSQinOPLpZR/JfHY5JWlijLWh7GmxY4KXuh35rg=; b=K9XxJrpMBJAXQGStfkTCyMr7FW
	d5P5V2Q+h8tojzj8JKhmcnSyJkZRp1bTs+XFcRCUHJYrNAfUo2TeP1HmRl8dVmg4mLDYPcYVTKM+U
	epuXXJnp7mRfcSp+rHP55WnlhK1TDwOZ1faPKgJ/kwYMj2UK8sOJCN8rEaoUGAncoxc/gY00guJkE
	bdJ4FjkenvYxK0XxiajxnfVPTAk72GizL+JQFU6xE7LoXYABcOXNSJOiq8XREiV+3TtG8O53VN8bs
	6KQWBzoa1+2JByEjPwCVbXhWRcvIzQbuT7eReaQu+f0eKY4ab72orL/81yB3gMdCO7YBEm5g5rGNc
	pZygsMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTcY-0000000CUig-1HGd;
	Mon, 10 Aug 2026 17:17:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTcV-0000000CUhs-1QXr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:17:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDDD814BF;
	Mon, 10 Aug 2026 10:16:56 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F4B23F632;
	Mon, 10 Aug 2026 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786382220; bh=0bVvXIx8KWhgK4X84+7K0kxtx1IFrC/NFT7STqVMwiw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c+BrrfAC17BNePDSGhiLYFazAIUh6R4smxAykXhY/36GHerYa79otAGaIdIK0J1px
	 HuzgIbWscOUsd3c1sHy3XFZ3HBcRFeltPkH5Y3gDJFBZbYtECIBLutHbkK8z1/XH4J
	 LtpKlGnWrUGXJ4+hfzeENIJoz5bCp4dIRVgVor2A=
Message-ID: <77edba4a-b6b0-4b50-9328-7c177a0af283@arm.com>
Date: Mon, 10 Aug 2026 18:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override
 feature
To: Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 willmcvicker@google.com, jyescas@google.com
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck>
 <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
 <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
 <anmvW1LkypAGW6Sc@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <anmvW1LkypAGW6Sc@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_101703_462636_7AEEB408 
X-CRM114-Status: GOOD (  29.40  )
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

On 10/08/2026 12:00 pm, Will Deacon wrote:
> On Fri, Aug 07, 2026 at 04:25:11PM +0100, Peter Griffin wrote:
>> On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrote:
>>>
>>> On 26/07/2026 2:16 pm, Will Deacon wrote:
>>>> On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
>>>>> These two patches add support for a new "arm,instdata-override" DT property
>>>>> that enables the override of the instruction/data attribute of incoming
>>>>> traffic to Data by setting the INSTCFG override bits.
>>>>>
>>>>> It is intended to be specified when the smmu can't guarantee that these
>>>>> attributes are provided correctly from the client device.
>>>>
>>>> This is going to need an in-tree user and a much more detailed
>>>> description of what is being worked around before we consider this for
>>>> inclusion.
>>
>> Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
>> yet for Laguna SoC which adds the smmu nodes and this property because
>> 1) I want to land the initial SoC/board DT first
>> 2) I want agreement on the DT property name. Currently I used
>> "arm,instdata-override" which is what downstream used. However, since
>> this is intended to work around silicon errata something like
>> "google,lga-instcfg-data-override" might be more appropriate?
>>
>> For Laguna SoC the first in-tree user of this is the amb_smmu smmu
>> instance which is used by the Synopsis dwc3 IP. The Laguna dwc3 glue
>> driver is already upstream at drivers/usb/dwc3/dwc3-google.c
>>
>>>>
>>>> In particular, if a particular client is emitting data reads as
>>>> instructions, then a better work around would be to avoid mapping its
>>>> domains using IOMMU_NOEXEC. But I can't tell what's going on from the
>>>> limited description provided here.
>>>
>>> Unless it's also emitting the privileged bit and thus falling foul of
>>> the implicit Unpriv-W -> Priv-XN rule, but then we also have the means
>>> to deal with devices which actually do that themselves (hello pl330...),
>>> so that would seemingly only leave the case of some innocent piece of
>>> AMBA-interfaced IP which doesn't expect to need special attributes, but
>>> the system integrator has gone out of their way to tie the AxPROT bits
>>> to some wacky value, which I would put in "erratum workaround" territory.
>>>
>>
>> You're correct Robin. It is an erratum workaround for the Laguna SoC
>> due to some custom usage of the AxPROT bits which differs from the
>> standard ARM SMMU handling for Privileged/Unprivileged and
>> Instruction/Data transaction attributes. The effect is all
>> transactions appear to the SMMU as "Privileged Instruction" accesses.
> 
> Ah, so this sounds like what Robin was worried about.
> 
>> The software workaround in this series enables the SMMU's INSTCFG
>> override feature to ignore the incoming value and treat all SMMU
>> transactions as "Data".
>>
>> One small clarification: in the cover letter I incorrectly said this
>> was set only for some SMMU IP instances, but that is incorrect. It is
>> actually set on *all* arm-smmu-v3 IP instances in the Laguna SoC.
>>
>> Does the above provide the additional detail you need Will?
> 
> So it sounds like using the instcfg override on this hardware still breaks
> IOMMU_PRIV and IOMMU_NOEXEC:
> 
>    1. If you don't pass IOMMU_PRIV, you still get privileged transactions

However this is inherently true of VMSA stage 1 anyway - I admit I had 
to double-check, but we don't have any user-only permissions (other than 
perhaps execute as implied by explicit or implicit PXN). IOMMU_PRIV can 
only _remove_ unprivileged access.

>    2. If you don't pass IOMMU_NOEXEC, you do not get execute permission
> 
> Is that correct?
> 
> Perhaps it would be better to override PRIVCFG to force unprivileged,
> then reject IOMMU_PRIV and ignore IOMMU_NOEXEC?

 From what Daniel said, it sounds like the privileged attribute is still 
the doing of the device itself rather than the integration issue in this 
case, so while nobbling PRIVCFG might also achieve the end result of 
making IOMMU_READ | IOMMU_WRITE pages mostly not fault on reads, it 
seems less appropriate as a workaround. Particularly since IOMMU_PRIV is 
exposed via a general DMA API attribute, while IOMMU_NOEXEC is only 
accessible to dedicated IOMMU API/io-pgtable users.

Thanks,
Robin.

