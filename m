Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C7AC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwgZQtPkOLtb0xChb4D3pCq0xHrRPfr9yUxlDmlpYbY=; b=cLr0PsluZ6K3XURaEqNJ75FP9k
	AFXW9UKMXh4p8tbs2HpNCYCoOGKvzIX9hZltEAA5ggpZQaZJm2RGF2pc7iMLx7dLkho1iRnj/tgD5
	eqCLkbx3GLJ+7dq1LWUhv1a1G2KgAAduTW1/zGxP6CC1v6XCd0aPZ8NdeP++JIU8viTOaULgInDko
	aDIg2VqvM5A6kuqtcy1PNaMzc7FmoEIBJnn8g6yZ6tFzjMZ6vWhPXbT7KUH2BU7+Q9bgGZwOilycu
	EMKyitN/RQ0KLSNvP2g4CEBbXvNA0JFOpaQSlpjdWf75NxJsDY3jQh/6GxjzDzjrUkyYcXMM4Mfvq
	DH1IEEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSWt-00000008pbo-12Ce;
	Wed, 26 Mar 2025 15:18:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS9K-00000008lFr-0TMJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:54:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F099D1424;
	Wed, 26 Mar 2025 07:54:35 -0700 (PDT)
Received: from [10.57.82.15] (unknown [10.57.82.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E974F3F63F;
	Wed, 26 Mar 2025 07:54:26 -0700 (PDT)
Message-ID: <5a5f22cb-1bd7-4dcb-85cc-f412de79b87b@arm.com>
Date: Wed, 26 Mar 2025 10:54:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] mm/page_table_check: Batch-check pmds/puds just
 like ptes
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-4-ryan.roberts@arm.com>
 <CA+CK2bA3ctd6+G9DrJZ3RvnehPCrf7hEJ3boFJ5pkMTZyVmDSQ@mail.gmail.com>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CA+CK2bA3ctd6+G9DrJZ3RvnehPCrf7hEJ3boFJ5pkMTZyVmDSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_075434_198631_7F4D7A60 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
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

On 26/03/2025 10:48, Pasha Tatashin wrote:
>> -void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud)
>> +void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
>> +               unsigned int nr)
>>  {
>> +       unsigned int i;
>> +       unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
> 
> nit: please order declarations from longest to shortest, it usually
> helps with readability. (here and in pmd)

Noted, I'll fix this.

> 
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Thanks!

> 
> Pasha


