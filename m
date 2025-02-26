Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B60C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+fqdQWLrg7ifJX9iUDj6h0MM8pxgyoJDsCoHitt3FY=; b=aixzF5xyJ72NCpvHEM3EK53j1c
	IZFtYp0/P1JZJuLd2ShvX8lICA7lBmijC6NgtlxvODpr3EHa4Yeh+WjNkGKXJ5x4GZyk6KaiUXs5l
	bj7ePv6Qpcqy210/UB2VUYlxtWg9A1fJdWttlLPG/szArgj4Xox5lNnpgJKPtKBQ0vq5BRgDq45SW
	FFmxe3Jy4InS+sWfEV7iNTG1PmPaAw1zftsUgJiitz+NilzpszbjjhQgsRDWW4wPdcrQSFYk+KdiC
	MGOZJnl3wJEDQXmMMSxB5W3p/jiIA0yYPEpZ/SS9cyxNmuYOhqxHXzD5Z5H48BUoLw96e1k7i9GGg
	JfTFAz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnClG-00000002sDD-0FTn;
	Wed, 26 Feb 2025 08:27:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCU7-00000002p26-1JAt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:09:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A0441516;
	Wed, 26 Feb 2025 00:09:54 -0800 (PST)
Received: from [10.57.84.229] (unknown [10.57.84.229])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C9B03F673;
	Wed, 26 Feb 2025 00:09:32 -0800 (PST)
Message-ID: <bc5af769-6d3a-4003-81c2-f5fe5cf8550c@arm.com>
Date: Wed, 26 Feb 2025 08:09:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: hugetlb: Fix huge_ptep_get_and_clear() for
 non-present ptes
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
 Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Dev Jain <dev.jain@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-3-ryan.roberts@arm.com>
 <20250221153156.GC20567@willie-the-truck>
 <6ebf36f2-2e55-49b2-8764-90fd972d6e66@arm.com>
 <20250225221812.GA23870@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250225221812.GA23870@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_000939_443373_F2FCAC72 
X-CRM114-Status: GOOD (  14.81  )
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

On 25/02/2025 22:18, Will Deacon wrote:
> On Mon, Feb 24, 2025 at 12:11:19PM +0000, Ryan Roberts wrote:
>> On 21/02/2025 15:31, Will Deacon wrote:
>>> On Mon, Feb 17, 2025 at 02:04:15PM +0000, Ryan Roberts wrote:
>>>> +	pte = __ptep_get_and_clear(mm, addr, ptep);
>>>> +	present = pte_present(pte);
>>>> +	while (--ncontig) {
>>>> +		ptep++;
>>>> +		addr += pgsize;
>>>> +		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
>>>> +		if (present) {
>>>> +			if (pte_dirty(tmp_pte))
>>>> +				pte = pte_mkdirty(pte);
>>>> +			if (pte_young(tmp_pte))
>>>> +				pte = pte_mkyoung(pte);
>>>> +		}
>>>>  	}
>>>
>>> nit: With the loop now structured like this, we really can't handle
>>> num_contig_ptes() returning 0 if it gets an unknown size. Granted, that
>>> really shouldn't happen, but perhaps it would be better to add a 'default'
>>> case with a WARN() to num_contig_ptes() and then add an early return here?
>>
>> Looking at other users of num_contig_ptes() it looks like huge_ptep_get()
>> already assumes at least 1 pte (it calls __ptep_get() before calling
>> num_contig_ptes()) and set_huge_pte_at() assumes 1 pte for the "present and
>> non-contig" case. So num_contig_ptes() returning 0 is already not really
>> consumed consistently.
>>
>> How about we change the default num_contig_ptes() return value to 1 and add a
>> warning if size is invalid:
> 
> Fine by me!
> 
> I assume you'll fold that in and send a new version, along with the typo
> fixes?

Yep, I'll aim to post this today. I have a few review comments for s390 to add
in too.

> 
> Cheers,
> 
> Will


