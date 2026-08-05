Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DDDC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 05:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7zCWK++jNfxfhEt8Y8jIgML8WXQN15ZQy6uHyDnBnc=; b=RNxkIq6JTLrzoMm21G3EWFdQQw
	t7Aj/LMj9w9MEgx3tQt9O4uD0QLTjKLB34r+atl6/YLDwrhQkoID1TsruYfGcn3waw2mlHLXt6F82
	66Q4fcGunsYt9X4UtlQpxW+nSxFxaDdE+zpvuGyJ5Y+KSDPLZsOjb/FKmqgO+M5P0YHF2fWC/Zfr5
	nv+WCnvy+4FWeQf9/UJWgnzyuBCb+yQsb3EbzUG3e69VglsnAWZIbODnY7k2gRS/TAXNhF/vrl/+p
	lB7xw+68kJoEXAuUIZzoLhHkuIDvGNbnO5NU4nMZ+QDdyBltNIzy0z+Fs1jz8D+hSMHncSTD5YozF
	ZHgNJJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrUdo-00000003H5j-0IeW;
	Wed, 05 Aug 2026 05:58:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrUdn-00000003H5P-16rk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 05:58:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12245403D2;
	Wed,  5 Aug 2026 05:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574631F000E9;
	Wed,  5 Aug 2026 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785909490;
	bh=v7zCWK++jNfxfhEt8Y8jIgML8WXQN15ZQy6uHyDnBnc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WpTfVY+gis0GaZ8Ilij2iuNXtip1yECYuuQNUlYVo6jVc87VSMT30kmNOwPl/ZTao
	 7oJbpElLKRYZM/H9E3uzPA0m2dDs7qxBrWfUSWeNQgVusyFJAB0zhgsb3CndB3eLBl
	 oVx+8kJVKo/dvCnEjFd77EC7hbxP5rQoI682riTb93MQ9TfiRSWCb3g5JOckn0oZli
	 58e+xTR7r2M3llPSRy5MrzI9rSBdgu2K2JYrZI3FiSOydblbfVLAtbSKgrhbcozdEM
	 SIQIBRN5owC9lJ1/5UdzSc5P9So3/Y8YL+DvqEaETnFE51wJndUFjamNuiFbFR2lzb
	 lLGJvpl87Db5A==
Message-ID: <595fe323-59d3-4f4a-92a3-ac5d67b7461b@kernel.org>
Date: Wed, 5 Aug 2026 07:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mm: constify the pte_offset_map_ro_nolock() return
 value
To: Pedro Falcato <pfalcato@suse.de>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-7-pfalcato@suse.de> <anHJ48Glq8EdHatd@lucifer>
 <anI6BEyTJFzQY-N9@pedro-suse.lan>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <anI6BEyTJFzQY-N9@pedro-suse.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 04/08/2026 à 21:22, Pedro Falcato a écrit :
> On Tue, Aug 04, 2026 at 12:22:19PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
>>
>>>   			if (!pte) {
>>>   				mmap_read_unlock(mm);
>>>   				result = SCAN_NO_PTE_TABLE;
>>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>>> index b91b1a98029c..2cfc6e608ef4 100644
>>> --- a/mm/pgtable-generic.c
>>> +++ b/mm/pgtable-generic.c
>>> @@ -308,8 +308,8 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>>>   	return NULL;
>>>   }
>>>
>>> -pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
>>> -				unsigned long addr, spinlock_t **ptlp)
>>> +const pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
>>
>> Can pmd be const too?
> 
> I was going to say "yes but then pmdp_get() also needs to be constfified" but
> actually no, it can't:
> 
> pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp) {
>          if (unlikely(pmd_bad(pmdval))) {
>                  pmd_clear_bad(pmd);
>                  goto nomap;
>          }
> }
> 
> so PTE mapping actually needs to write to the pmdp if the pmd looks bad.
> Tricky stuff :)

But if pmd is const, can it be bad at all ?

Christophe



