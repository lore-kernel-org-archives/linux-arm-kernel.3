Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79B2C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zq8IpaMhz3nRLokE5Y6J87NVhZxZSHgDWUh5tPMsgOw=; b=rNvj0vYIFtxSji6/oNYc/bjM5Z
	kAwkkl0r80N4mPWb0460ovhp0fF2BtQfEHOVXtRH9+kWrQbEL4P2FsZk31AcuzKzJxg0tKg6ylSsz
	qMEoGalzkHc5o30HxT/+wDzxjMbZN5J//Hs3kweB1VPZ7T6oD84vYNnlNrUYOaXq2xgMi6cUm5ZrI
	F6f7/asU5yVX0DxxZjc6dLp5mrWKg2XViRglDBhKc+WKsQRBbw4aanXhlTB9NCmF0Wvx0o1umqIOC
	jHITmlNUPVawMoSSbIG3EIOeXVYi2jF5j5tCejbU/EGKXcJfPaRDfPh4XIVBizlOXoH7kA7dIw2g3
	8DXB2AOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHY-0000000DnJX-08LO;
	Mon, 24 Feb 2025 13:14:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXPx-0000000DfMT-2mq1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:18:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B76E61756;
	Mon, 24 Feb 2025 04:18:53 -0800 (PST)
Received: from [10.1.27.150] (XHFQ2J9959.cambridge.arm.com [10.1.27.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D73FA3F6A8;
	Mon, 24 Feb 2025 04:18:34 -0800 (PST)
Message-ID: <30b3ed49-1e83-40ed-8e59-f891eb416289@arm.com>
Date: Mon, 24 Feb 2025 12:18:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] arm64/mm: Hoist barriers out of set_ptes_anysz()
 loop
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-7-ryan.roberts@arm.com> <Z7m7e1W8LpYvV_h0@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z7m7e1W8LpYvV_h0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_041837_747233_31A798DD 
X-CRM114-Status: GOOD (  11.95  )
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

On 22/02/2025 11:56, Catalin Marinas wrote:
> On Mon, Feb 17, 2025 at 02:07:58PM +0000, Ryan Roberts wrote:
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index e255a36380dc..e4b1946b261f 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -317,10 +317,8 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>>  	WRITE_ONCE(*ptep, pte);
>>  }
>>  
>> -static inline void __set_pte(pte_t *ptep, pte_t pte)
>> +static inline void __set_pte_complete(pte_t pte)
>>  {
>> -	__set_pte_nosync(ptep, pte);
>> -
>>  	/*
>>  	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
>>  	 * or update_mmu_cache() have the necessary barriers.
> 
> Unrelated to this patch but I just realised that this comment is stale,
> we no longer do anything in update_mmu_cache() since commit 120798d2e7d1
> ("arm64: mm: remove dsb from update_mmu_cache"). If you respin, please
> remove the update_mmu_cache() part as well.

Will do!

> 
> Thanks.
> 


