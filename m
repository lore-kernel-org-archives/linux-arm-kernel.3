Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F369C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOhuochHAyZFrE0QZmNJN55rNw/wCGo76Z8G9VPPrHo=; b=pbj++pHJhRXZWLESBYXGfTdSaz
	IUqm49c99CXb1k755KZ0GsnGZOBBBtPo5BpXtoz1O0R3f+BBCWkA8aCU54o/ju+CkBAJaRTr/fZi+
	4/n5jYNc51dAx2rS2LobfexDq4QMAysTtK7T+vN1rjvv1XRPe6eNcyaINnWrM9AV7g6TIxBCEX5ae
	R6z3T1YlgiOflVboAchEI0mkywpjbpx3SoRNix5LInS7puYdSMelYVPAku+MuMDJoKbDRAKUYq8UA
	w/EjWY+kB5JWwdnEKipViO4+muCTwdzz5RDF28JrPAk0AsdyRIqGiPKwkR1VfVKk3Db7YKo7NFFSc
	4Mu1Z0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkF-00000008ZpJ-46O9;
	Thu, 27 Feb 2025 19:40:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhIk-00000008AGY-1UY9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:03:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C834E1424;
	Thu, 27 Feb 2025 09:04:12 -0800 (PST)
Received: from [10.57.39.40] (unknown [10.57.39.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C4A33F5A1;
	Thu, 27 Feb 2025 09:03:55 -0800 (PST)
Message-ID: <8e0cd41d-7cb1-4b78-9cc3-d7c92e86ec0c@arm.com>
Date: Thu, 27 Feb 2025 17:03:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: realm: Use aliased addresses for device DMA
 to shared buffers
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, will@kernel.org, maz@kernel.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, gshan@redhat.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
 <20250227144150.1667735-4-suzuki.poulose@arm.com> <Z8CNRqJ6dJAG0Daa@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <Z8CNRqJ6dJAG0Daa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090358_439677_BC436AE6 
X-CRM114-Status: GOOD (  10.62  )
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

On 27/02/2025 16:05, Catalin Marinas wrote:
> On Thu, Feb 27, 2025 at 02:41:50PM +0000, Suzuki K Poulose wrote:
>> When a device performs DMA to a shared buffer using physical addresses,
>> (without Stage1 translation), the device must use the "{I}PA address" with the
>> top bit set in Realm. This is to make sure that a trusted device will be able
>> to write to shared buffers as well as the protected buffers. Thus, a Realm must
>> always program the full address including the "protection" bit, like AMD SME
>> encryption bits.
>>
>> Enable this by providing arm64 specific dma_addr_{encrypted, canonical}
>> helpers for Realms. Please note that the VMM needs to similarly make sure that
>> the SMMU Stage2 in the Non-secure world is setup accordingly to map IPA at the
>> unprotected alias.
>>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> Cc: Tom Lendacky <thomas.lendacky@amd.com>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> In case this goes in via the DMA API tree:
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks Catalin.

> 
> (we could bikeshed on the names like unencrypted vs decrypted but I'm
> not fussed about)

It was initially decrypted, but Robin suggested that the DMA layer 
already uses "encrypted" and "unencrypted" (e.g., 
force_dma_unencrypted(), phys_to_dma_unencrypted() etc)

Cheers
Suzuki




