Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A070C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lIBEm48K7kx+TQb2o7cJxdcD+TD2KdtNI8Np109gcQ=; b=eupnphyCzdMLHR41GhoFCBdfzx
	1GdoaS6MGdXrI+gIx0Q6dzMaFO3io3FUciJGYXQOHLjdNFI7IbR5oGunVYB2k8RNp0MjOTmi+8qBo
	uc8EKPMiqFz/ZjNXRAB3q04U+blRBJwXTgayxiEuWoLlqfJOZgAvNbSw73LRfp3Xe/w2dEEkoZ733
	ssXetcaamnzSaHUsEzYCfEJM+cHk/X4/h0jFUA0AntCICy8mo6cc5LptK57BkfTQx/FYfIRJgVnlL
	yh2hMQigOkSTDrUIiLO1ssr9YF6qgN6skLslUoM6QELnyeIsuwaAM2TUoX0mjBD+4ZZBcq7aM9Hmw
	FRHNxr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVSD-0000000ARn5-3bAo;
	Thu, 13 Feb 2025 09:24:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVLa-0000000AQIB-2uNw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:17:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1F4C16F3;
	Thu, 13 Feb 2025 01:17:46 -0800 (PST)
Received: from [10.57.81.93] (unknown [10.57.81.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C1C53F58B;
	Thu, 13 Feb 2025 01:17:23 -0800 (PST)
Message-ID: <67bcb2f2-8cc1-43e3-b5cc-6c8ef5da8a95@arm.com>
Date: Thu, 13 Feb 2025 09:17:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/16] mm: Generalize arch_sync_kernel_mappings()
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-16-ryan.roberts@arm.com>
 <43c256b6-7e44-41bb-b0c5-866fd4faab5c@arm.com>
 <ff93eb30-ddb6-476b-a209-3329d6e3b06f@arm.com>
 <d7c6edbc-957b-475b-b87c-db246ec1413f@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <d7c6edbc-957b-475b-b87c-db246ec1413f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_011726_841629_1D847C04 
X-CRM114-Status: GOOD (  15.62  )
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

>>>> +/**
>>>> + * arch_update_kernel_mappings_end - A batch of kernel pgtable mappings have
>>>> + * been updated.
>>>> + * @start: Virtual address of start of range that was updated.
>>>> + * @end: Virtual address of end of range that was updated.
>>>> + *
>>>> + * An optional hook to inform architecture code that a batch update is complete.
>>>> + * This balances a previous call to arch_update_kernel_mappings_begin().
>>>> + *
>>>> + * An architecture may override this for any purpose, such as exiting a lazy
>>>> + * mode previously entered with arch_update_kernel_mappings_begin() or syncing
>>>> + * kernel mappings to a secondary pgtable. The default implementation calls an
>>>> + * arch-provided arch_sync_kernel_mappings() if any arch-defined pgtable level
>>>> + * was updated.
>>>> + *
>>>> + * Context: Called in task context and may be preemptible.
>>>> + */
>>>> +static inline void arch_update_kernel_mappings_end(unsigned long start,
>>>> +						   unsigned long end,
>>>> +						   pgtbl_mod_mask mask)
>>>> +{
>>>> +	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>>>> +		arch_sync_kernel_mappings(start, end);
>>>> +}
>>>
>>> One arch call back calling yet another arch call back sounds bit odd. 
>>
>> It's no different from the default implementation of arch_make_huge_pte()
>> calling pte_mkhuge() is it?
> 
> Agreed. arch_make_huge_pte() ---> pte_mkhuge() where either helpers can be
> customized in the platform is another such example but unless necessary we
> should probably avoid following that. Anyways it's not a big deal I guess.
> 
>>
>>> Also
>>> should not ARCH_PAGE_TABLE_SYNC_MASK be checked both for __begin and __end
>>> callbacks in case a platform subscribes into this framework. 
>>
>> I'm not sure how that would work? The mask is accumulated during the pgtable
>> walk. So we don't have a mask until we get to the end.
> 
> A non-zero ARCH_PAGE_TABLE_SYNC_MASK indicates that a platform is subscribing
> to this mechanism. So could ARCH_PAGE_TABLE_SYNC_MASK != 0 be used instead ?

There are now 2 levels of mechanism:

Either: arch defines ARCH_PAGE_TABLE_SYNC_MASK to be non-zero and provides
arch_sync_kernel_mappings(). This is unchanged from how it was before.

Or: arch defines it's own version of one or both of
arch_update_kernel_mappings_begin() and arch_update_kernel_mappings_end().

So a non-zero ARCH_PAGE_TABLE_SYNC_MASK indicates that a platform is subscribing
to the *first* mechanism. It has nothing to do with the second mechanism. If the
platform defines arch_update_kernel_mappings_begin() it wants it to be called.
If it doesn't define it, then it doesn't get called.

Thanks,
Ryan


