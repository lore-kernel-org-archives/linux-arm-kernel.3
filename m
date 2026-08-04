Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FFDC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwIlf/7Evmvt247IE4OinLG+J81ldxUzqSmjbn1lj4I=; b=MFjA8bLJxWSw757owjKQK7HdBn
	q6RoCTHTurbuyjE48eh45CVPP9TwVSxrhRiwqSxC1h3XvjDwL5DuqLnaZG1IEDSAaqIPJUNyQffBq
	7/DUtKRo03PCSksm9BK4LZo39Eq+JCRUESY7BTKpLbbUWBwqgQCsMGOLaWI0gIeeNTtlN9DuVN1zE
	rA9s88PkLyiKKHwSyfxzzYLMhZIEkSzJ0g8mYHtTmdbI/ze1eCKjK2LHDMLpJE5+I+atrZZGR7VAo
	EIzMnpvB01/kssvLsKPwMcTnUayE+A0901A3mdLVuA1Hs/ejM/WVufBpw274egcSBT+8TZTh4d/kL
	ijMWK7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEbJ-00000001qwa-1hSF;
	Tue, 04 Aug 2026 12:50:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEbI-00000001qwG-08kf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:50:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4524360A77;
	Tue,  4 Aug 2026 12:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA74A1F000E9;
	Tue,  4 Aug 2026 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847831;
	bh=dwIlf/7Evmvt247IE4OinLG+J81ldxUzqSmjbn1lj4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YABf4fdg/D3MZ/bWjeLut7tnE92glPPUblZGjARSmDu+SgTZpTVi3WlLm5HquAEGf
	 J2bpoFXvno4uXAcJ7Qo2ETmUHwVx7QaU4Q6WWLBRWh0ptmCIMDZ7RFbr0vY3E7y26f
	 HxBmGepETc20zSML41v9hWk4GYBDyII5UeitdQ7FJ1clvB48Hd99D6tRp7kXQbSc+/
	 XRPUWDoOmZMUHaf+U1rl7d5ImlwquVOEdD/uQN4srP+6xLmPHZhNDl1rgq1RFigrZq
	 Gs2boYFuSu/p89NeE3nlhVrLloKDlGkdWJOQ09Yz3skgBGv9l0vTzQ2rYw7eRih4tx
	 ETPFvsGGDEVUQ==
Message-ID: <dcdb8cab-c18c-4995-ad1d-2f2d4700e7c1@kernel.org>
Date: Tue, 4 Aug 2026 14:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] mm/powerpc/8xx: constify ptep_get() argument
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Pedro Falcato <pfalcato@suse.de>
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
 <20260803164400.531199-4-pfalcato@suse.de> <anHI4B-lMu6AJJfA@lucifer>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <anHI4B-lMu6AJJfA@lucifer>
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

Hi Lorenzo,

Le 04/08/2026 à 13:13, Lorenzo Stoakes (ARM) a écrit :
> On Mon, Aug 03, 2026 at 05:43:57PM +0100, Pedro Falcato wrote:
>> There is no need for write access to the PTE.
>>
>> Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> 
> With below addressed LGTM so:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
>> ---
>>   arch/powerpc/include/asm/nohash/32/pte-8xx.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
>> index e2ea8ba9f8ca..f2bab31040c7 100644
>> --- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
>> +++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
>> @@ -226,7 +226,7 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
>>
>>   #ifdef CONFIG_PPC_16K_PAGES
>>   #define ptep_get ptep_get
>> -static inline pte_t ptep_get(pte_t *ptep)
>> +static inline pte_t ptep_get(const pte_t *ptep)
>>   {
>>   	pte_basic_t val = READ_ONCE(ptep->pte);
>>   	pte_t pte = {val, val, val, val};
> 
> Worth making these const too (that {val, val, val, val} horrifies me btw :)?

Any suggestion welcome.

powerpc 8xx page table is independant on page size. When you use 16k 
pages, depending on the address you hit the page for the first time, the 
HW assist page table walk will fetch one of four 4k cells in page table 
that need to be identical as they all four define the same 16k page. Not 
sure I'm clear.

Christophe


