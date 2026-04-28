Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5418CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiqKgrN/QBWNqXlOu6YtEZR5uiy/ND3IRv9wIKu1+nw=; b=tPk9QuagaOc1j2I2/LAPA+X419
	i/5pVfG0zrJw8f6ez/wobRn3Ugice067HI7n/CoQkWg7giqTuTzRPFwmRtVi4PRUvKChOqqlNCZv/
	NyOxanSUP6OvzH8FpiJf+PPudmgkOj0Q7vBvYNlwhs1QrjtZThcJQM+UA3KrNyDcyaLkuT4vkkwqo
	IW0E6r1FXg+qLZTIxPqvCyX1M33IV3snkSmiuk0EtpQuJMRdZQcHC/tDhyDRsVjh2dppF7qAQq6Wm
	sxNQ4WNRBjH6OaydAiYhRolbJyi51w6HR1ADpAT9Ty1J6eQu7wZcDA7cyuG/Vhew2jq97LGScRtEG
	ERxQ2z0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkHE-00000001jBz-3P2F;
	Tue, 28 Apr 2026 15:23:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkHC-00000001jBJ-1xfM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 15:23:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9DBF1C0A;
	Tue, 28 Apr 2026 08:22:57 -0700 (PDT)
Received: from [10.57.21.11] (unknown [10.57.21.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A9FA3F7B4;
	Tue, 28 Apr 2026 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777389783; bh=Om8QGmof8/BcITtEzWX1Cbn/822D5GRchdbAMmDVVoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E8ZPSTep/LUn9gzYwuBIgGN4jIaXaTmBJNnNday4fnmjnZWOGAaUD7U99tv9XABic
	 QfWbpZbIsPrUhqF0O7HIkiHEK6KIi3oxFTN6+nepB4u+vemndbGockrfl0DgRV/Xu1
	 PjWCuB8Ue4y4+SGL+eVhFLZEJv0FWSaOfoV1QzY8=
Message-ID: <5399c16f-faf1-471e-ac37-7dd9d5ddb897@arm.com>
Date: Tue, 28 Apr 2026 16:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] coco: guest: arm64: Query host IPA-change
 alignment via RHI
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
References: <20260427063108.909019-1-aneesh.kumar@kernel.org>
 <20260427063108.909019-4-aneesh.kumar@kernel.org>
 <86y0i8zo9f.wl-maz@kernel.org> <yq5a4ikv1c7p.fsf@kernel.org>
 <86tssvyz2v.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86tssvyz2v.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_082306_606261_EA328085 
X-CRM114-Status: GOOD (  21.59  )
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

On 28/04/2026 14:49, Marc Zyngier wrote:
> On Tue, 28 Apr 2026 13:49:46 +0100,
> Aneesh Kumar K.V <aneesh.kumar@kernel.org> wrote:
>>
>> Marc Zyngier <maz@kernel.org> writes:
>>
>>> On Mon, 27 Apr 2026 07:31:08 +0100,
>>> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:
>>>>
>>>> Add the Realm Host Interface support needed to query host configuration
>>>> from a Realm guest. Define the RHI hostconf SMCs, add rsi_host_call(), and
>>>> use them during Realm initialization to retrieve the host IPA-change
>>>> alignment size.
>>>
>>> I don't understand what "IPA-change" means. What you are after is the
>>> host's sharing granule size.
>>>
>>
>> This is part of the RHI specification, and the call is named
>> RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT. The intent is to determine the
>> alignment requirements for changing IPA attributes (protected vs.
>> unprotected IPA
> 
> This really is a terrible name. Why the 'change' part? It doesn't
> change, it is a constant.

Agreed, it was supposed to mean IPA_STATE_CHANGE.

> 
> Oh well...
> 
> [...]
> 

...

>>>> +unsigned long rhi_get_ipa_change_alignment(void)
>>>> +{
>>>> +	long ret;
>>>> +	unsigned long ipa_change_align;
>>>> +
>>>> +	hyp_pagesize_rhicall.imm = 0;
>>>> +	hyp_pagesize_rhicall.gprs[0] = RHI_HOSTCONF_VERSION;
>>>> +	ret = rsi_host_call(lm_alias(&hyp_pagesize_rhicall));
>>>> +	if (ret != RSI_SUCCESS)
>>>> +		goto err_out;
>>>> +
>>>> +	if (hyp_pagesize_rhicall.gprs[0] != RHI_HOSTCONF_VER_1_0)
>>>> +		goto err_out;
>>>> +
>>>> +	hyp_pagesize_rhicall.imm = 0;
>>>> +	hyp_pagesize_rhicall.gprs[0] = RHI_HOSTCONF_FEATURES;
>>>> +	ret = rsi_host_call(lm_alias(&hyp_pagesize_rhicall));
>>>> +	if (ret != RSI_SUCCESS)
>>>> +		goto err_out;
>>>> +
>>>> +	if (!(hyp_pagesize_rhicall.gprs[0] & __RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT))
>>>> +		goto err_out;
>>>> +
>>>> +	hyp_pagesize_rhicall.imm = 0;
>>>> +	hyp_pagesize_rhicall.gprs[0] = RHI_HOSTCONF_GET_IPA_CHANGE_ALIGNMENT;
>>>> +	ret = rsi_host_call(lm_alias(&hyp_pagesize_rhicall));
>>>> +	if (ret != RSI_SUCCESS)
>>>> +		goto err_out;
>>>> +
>>>> +	ipa_change_align = hyp_pagesize_rhicall.gprs[0];
>>>> +	/* This error needs special handling in the caller */
>>>> +	if (ipa_change_align & (SZ_4K - 1))
>>>> +		return 0;
>>>> +
>>>> +	return ipa_change_align;
>>>> +
>>>> +err_out:
>>>> +	/*
>>>> +	 * For failure condition assume host is built with 4K page size
>>>> +	 * and hence ipa change alignment can be guest PAGE_SIZE.
>>>> +	 */
>>>> +	return PAGE_SIZE;
>>>> +}
>>>
>>> Why can't this be part of rsi.c? This is an RSI call, and it should be
>>> part of the RSI initialisation.
>>>
>>
>> This is an RHI call as per the specification, hence it has been added to
>> rhi.c.
> 
> News flash: this is the Linux kernel, not an ARM spec. We organise
> things based on the logical use, not on the TLA associated with it.
> 
> And RHI is implemented in terms of RSI. In rsi.c it goes. We don't
> need this pointless proliferation of helper files that only result in
> equally pointless global symbols.

RHI (Realm Host Interface) is not really the same as RSI. The former is
a service mechanism for Realms with the "Non-secure Hypervisor".  And
this single call is just one of the services. There are further more
services that will eventually come up (e.g., Device Assignment, Boot
Sync Protocol, Firmware Activity Log etc).

RSI (to be precise, RSI_HOST_CALL) is the transport to talk to the Host,
as that is the only way for the Realm to reach the Host. So, tbh, it
does make sense to keep this in rhic ?

Suzuki

