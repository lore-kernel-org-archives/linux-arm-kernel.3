Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCE0C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ2VWlpKeEiLEf/5Ln29C1rdKHqi8QQc5Jr1aEMZJdM=; b=2iTtY3mnb4uyHeumDpeKKLvNgN
	xjxH/k22g8gC7uVBeVflzEIeaenauPBjjjdka8KOWdcZpsy1macf8Ia7NJcYOhVvBn8vaAVXrTz6+
	JaT2o9/aArxebY6feXwr78DFWacuJ+vkziqvCkPk5hED/M5sw5N9/efjW0zh2gus3MOu2xOV3zH+Z
	PSy8D9DbcFyRfH7MvDJbwp/1WfW0LhtOQeEAYAovn5DbbihPNAdsd+Htr/yzJvCk6IqccRbnlJq8S
	uFdNSXSdbNSyGtU3MB449j7EcjEVNwZs02o+vO8IzoSaVZ/32bnPMp3qLIRBLSVMyRCDh2lewtyC9
	u7wHwNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQR2-00000005DCe-1qxh;
	Fri, 21 Feb 2025 10:39:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQFP-00000005Ayc-1WPS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 10:27:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D36C6169C;
	Fri, 21 Feb 2025 02:27:21 -0800 (PST)
Received: from [10.57.85.120] (unknown [10.57.85.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 320623F5A1;
	Fri, 21 Feb 2025 02:26:59 -0800 (PST)
Message-ID: <1ac64c39-419b-4fac-8820-bbfb4e6afec4@arm.com>
Date: Fri, 21 Feb 2025 10:26:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: hugetlb: Fix huge_ptep_get_and_clear() for
 non-present ptes
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 Mark Rutland <mark.rutland@arm.com>, Dev Jain <dev.jain@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-3-ryan.roberts@arm.com>
 <e26a59a1-ff9a-49c7-b10a-c3f5c096a2c4@arm.com>
 <5477d161-12e7-4475-a6e9-ff3921989673@arm.com>
 <50f48574-241d-42d8-b811-3e422c41e21a@arm.com> <Z7hNgSBw6lfwwcch@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z7hNgSBw6lfwwcch@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_022707_499173_B8E8FF3C 
X-CRM114-Status: GOOD (  17.43  )
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

On 21/02/2025 09:55, Catalin Marinas wrote:
> On Thu, Feb 20, 2025 at 12:07:35PM +0530, Anshuman Khandual wrote:
>> On 2/19/25 14:28, Ryan Roberts wrote:
>>> On 19/02/2025 08:45, Anshuman Khandual wrote:
>>>> On 2/17/25 19:34, Ryan Roberts wrote:
>>>>> +	while (--ncontig) {
>>>>
>>>> Should this be converted into a for loop instead just to be in sync with other
>>>> similar iterators in this file.
>>>>
>>>> for (i = 1; i < ncontig; i++, addr += pgsize, ptep++)
>>>> {
>>>> 	tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
>>>> 	if (present) {
>>>> 		if (pte_dirty(tmp_pte))
>>>> 			pte = pte_mkdirty(pte);
>>>> 		if (pte_young(tmp_pte))
>>>> 			pte = pte_mkyoung(pte);
>>>> 	}
>>>> }
>>>
>>> I think the way you have written this it's incorrect. Let's say we have 16 ptes
>>> in the block. We want to iterate over the last 15 of them (we have already read
>>> pte 0). But you're iterating over the first 15 because you don't increment addr
>>> and ptep until after you've been around the loop the first time. So we would
>>> need to explicitly increment those 2 before entering the loop. But that is only
>>> neccessary if ncontig > 1. Personally I think my approach is neater...
>>
>> Thinking about this again. Just wondering should not a pte_present()
>> check on each entries being cleared along with (ncontig > 1) in this
>> existing loop before transferring over the dirty and accessed bits -
>> also work as intended with less code churn ?
> 
> Shouldn't all the ptes in a contig block be either all present or all
> not-present? Is there any point in checking each individually?

I agree, that's why I was just testing it once outside the loop. I'm confident
my code and Anshuman's alternative are both correct. So it's just a stylistic
choice really. I'd prefer to leave it as is, but will change if there is
consensus. I'm not sure I'm hearing that though.

Catalin, do you want me to respin the series to fix up the typos that Anshuman
highlighted, or will you handle that?

Thanks,
Ryan


