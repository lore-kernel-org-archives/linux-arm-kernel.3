Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AA5C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuwXm/KPf6RDslGYCt3jqgPRy+xckTKT0BiYlwGRyfY=; b=YEeMepGJp5JgQw5nV9iu9O3Xk2
	eyR7UrY9V5gHUHoih506uDOeFY+vd+jUP7zhMFX0VFxedSpoXGbwLxlg6ZsZiqxrLjBdLwYadtRnx
	UOjmIkWSFfrQH6KQe5GL7DcXE7UriZb0SYUMMI/9p08MSfUvYsTEEoJ/bCVrAIpw31wS63bK4IDVR
	AXxW6lY0bCdtRVEeJXlQ1IACpLtKvLfRkQptla5o68zQ0GqUjElcd2zktzd1Sfd5TWQCsPlqtDcjF
	gELuzUO4NCJkvEsPm7WVjA++oJOVWHd27RBdcw2I5oqZ3d7z098sBkg9xRg7otQr6iYxXcOoric7/
	OUTp0+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAHu-0000000Aug4-2Q1h;
	Thu, 06 Mar 2025 12:25:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9ZS-0000000AoOY-0CPN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 11:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vuwXm/KPf6RDslGYCt3jqgPRy+xckTKT0BiYlwGRyfY=; b=Gh1Veyk4CYN/i4F4o/oKhEcSRh
	PV+119L0ue/ZydITDqLG1PKiGVL7oqILg2h/rkam4vC8k9tHlHfGnH8xFYD+AtvB5VQUFlvXhdiNs
	TBSoBmWKsnzQ/iW8H2ZlHwx+ErygIJi1WpaVKt49AC1hjE+WBrRi10YoQYMINYrjp2lvalM2eb1JQ
	cFPwqdeREvLssQJkLrFxY81An/yfxFXI1j5WYhar1FuPnEHtcJAySZoh7QWaltPbiiyhWRjFBX08J
	zRUYNHFXq6CXo5kBtcoh6HnlG2JnP5j7V2qBexyk/8AXHs7T6RtLJ9M3vM5Sw87E0X6AxRY8ghCfj
	JkxqxzgA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9ZO-0000000135g-3SXP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:39:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C90891007;
	Thu,  6 Mar 2025 03:39:29 -0800 (PST)
Received: from [10.57.38.145] (unknown [10.57.38.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E204C3F66E;
	Thu,  6 Mar 2025 03:39:14 -0800 (PST)
Message-ID: <7ad365f0-d335-4da1-845a-8fe3bc5eb055@arm.com>
Date: Thu, 6 Mar 2025 11:39:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] arm64: realm: Fix DMA address for devices
Content-Language: en-GB
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: maz@kernel.org, steven.price@arm.com, aneesh.kumar@kernel.org,
 gshan@redhat.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
 <CGME20250303113525eucas1p1099e087e2c11b9021603a6f13f8135c4@eucas1p1.samsung.com>
 <2b6d5287-bdea-4ec3-a07f-986bd3c3b285@arm.com>
 <7b5c90cf-00e4-4684-8719-f380badab064@samsung.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <7b5c90cf-00e4-4684-8719-f380badab064@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_113919_198503_3B11DC22 
X-CRM114-Status: GOOD (  23.81  )
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

On 04/03/2025 13:40, Marek Szyprowski wrote:
> Hi,
> 
> On 03.03.2025 12:35, Suzuki K Poulose wrote:
>> On 27/02/2025 14:41, Suzuki K Poulose wrote:
>>> Linux can be run as a Confidential Guest in Arm CCA from Linux v6.13.
>>> The address
>>> space (GPA or IPA) of a Realm VM is split into two halves, with
>>> private bottom
>>> half and shared top half. In Linux we treat the "top" bit of the IPA
>>> space as
>>> an attribute, to indicate whether it is shared or not (MSB == 1
>>> implies shared).
>>> Stage2 (GPA to PA) translations used by the CPU accesses, cover the
>>> full IPA space,
>>> and are managed by RMM. The "top" bit as attribute is only a software
>>> construct.
>>>
>>> At present any device passed through to a Realm is treated as
>>> untrusted and the
>>> Realm uses bounce buffering for any DMA, using the "decrypted"
>>> (shared) DMA
>>> buffers (i.e., IPA with top bit set). In Linux, we only send the
>>> "DMA" address
>>> masking the "top" bit. In Arm CCA, SMMU for untrusted devices are
>>> managed by the
>>> non-secure Host and thus it can be confusing for the host/device when
>>> an unmasked
>>> address is provided. Given there could be other hypervisors than
>>> Linux/KVM
>>> running Arm CCA guests, the Realm Guest must adhere to a single
>>> convention for
>>> the DMA address. This gets further complicated when we add support
>>> for trusted
>>> devices, which can DMA into the full Realm memory space, once
>>> accepted. Thus,
>>> a DMA masked address (with "top" bit lost) will prevent a trusted
>>> device from
>>> accessing a shared buffer.
>>>
>>> To resolve this Arm has decided to standardise the DMA address used
>>> by the Realm
>>> to include the full IPA address bits (including the "top" bit, which
>>> Linux uses
>>> as an attribute). This implies, any DMA to a shared buffer must have
>>> the top bit
>>> of the IPA space set.
>>>
>>> There is already a provision to do this in phys_to_dma* and
>>> dma_to_phys(), but
>>> that is specific to AMD SME and is quite the opposite of what we need
>>> for Arm CCA.
>>> i.e., For Arm CCA we need to set the bit for "decrypted" DMA and
>>> clear the bit
>>> for "encrypted".
>>>
>>> This series converts the existing __sme_* helpers to a bit more
>>> generalised versions :
>>> dma_addr_decrypted() and dma_encrypted(). Also, while converting a
>>> DMA address back
>>> to CPU physical address requires clearing off any
>>> "encryption/decryption" bits.
>>> I have named this "dma_addr_canonical()". (The other options are :
>>>     * dma_addr_clear_encryption - Well, not just for encryption, but
>>> we clear decryption
>>>       too, so not ideal.
>>>     * dma_addr_normal
>>>     * dma_addr_clear
>>>     * dma_addr_default
>>>
>>> This also implies that the VMMs must take care to :
>>>
>>>    1. Create the S2-SMMU mappings for VFIO at the "unprotected" alias.
>>>    2. Always mask the "top" bit off any IPA it receives from the Realm
>>> for DMA.
>>>       KVM already does that today and no changes are required.
>>>
>>> A kvmtool branch with the changes above is available here [1]. There
>>> are two
>>> patches [2] & [3], that are really required on top of the Arm CCA
>>> support.
>>>
>>> Ideally it would be good to get this backported to v6.13 stable
>>> kernel releases
>>> to make sure that they are compliant with this change.
>>>
>>
>> Please could you take a look at this series and let us know your
>> thoughts ? If you are happy with the changes, are you happy to pull
>> this through the DMA MAP tree ? The relevant bits have been reviewed/
>> acked by people (arm64 and AMD bits).
> 
> The changes look fine. However I won't be able to setup new dma-mapping
> git tree this week because I got really sick has to stay in bed. :/ If
> You don't want such delay, please merge it via ARM64 tree. Here is my:

Sorry to hear that. Hope you feel better soon.

> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks Marek.

Btw, this series fixes the "Realm Guest" support for Linux, which was 
merged in v6.13. To be precise, this should have :

Fixes: 42be24a4178f ("arm64: Enable memory encrypt for Realms")

Will/Catalin,

Please let me know if you would like me to send the series with
all the Acks, Reviews and mainly the Fixes tag added ?

Kind regards
Suzuki

> 
> 
> Best regards


