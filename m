Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783D1C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U42tw1y0k942XVtnPzGlYX2brrEYf5JHD+QtSXJ7aPk=; b=yOWbuVQgLbBCv3AgWNfj89kwa+
	7d/bopZrThIrLnGuaP077ali2mChHDfEBWUywerjzyGfPnrYiPsBnqYs1l8uuvxx7wAKs+AIUIfD4
	P1YiLukqaqLtL6caVUk0ubH6YTlQkKdSv6r45Sr9Twcv+hb0+nUEK8gFZDr5rWi+RY4Rt3fIL08X3
	GXX8CqPd05jk/IsMLSpoZ6/L5lyfaFuUSgFcFrE5ppnPDPZWB+pmp3cge8DVIah+WdldN4BN3QYyy
	O6JUoWCFZaz7BlQ0qc4yxwgETnzobdNB7jWuFFJ2n3o0uRvqHh6Gzj6Fwz5Db6hvk3Oc4UcyjGAxq
	0It37HVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzya-00000009DNN-3JUt;
	Mon, 19 May 2025 12:52:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzta-00000009CKz-0DY8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:47:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ED211655;
	Mon, 19 May 2025 05:46:52 -0700 (PDT)
Received: from [10.57.95.69] (unknown [10.57.95.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93A2C3F5A1;
	Mon, 19 May 2025 05:47:03 -0700 (PDT)
Message-ID: <df7eb016-bea4-489d-aecb-1a47eb5e33b2@arm.com>
Date: Mon, 19 May 2025 13:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Restrict pagetable teardown to avoid false
 warning
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250518095445.31044-1-dev.jain@arm.com>
 <5763d921-f8a8-4ca6-b5b5-ad96eb5cda11@arm.com>
 <7680e775-d277-45ea-9b6c-1f16b8b55a3f@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <7680e775-d277-45ea-9b6c-1f16b8b55a3f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_054706_181911_A2677227 
X-CRM114-Status: GOOD (  19.65  )
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

On 19/05/2025 13:16, David Hildenbrand wrote:
> On 19.05.25 11:08, Ryan Roberts wrote:
>> On 18/05/2025 10:54, Dev Jain wrote:
>>> Commit 9c006972c3fe removes the pxd_present() checks because the caller
>>
>> nit: please use the standard format for describing commits: Commit 9c006972c3fe
>> ("arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table()")
>>
>>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
>>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>>> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
>>> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
>>> a pmd_present() check in pud_free_pmd_page().
>>>
>>> This problem was found by code inspection.
>>>
>>> This patch is based on 6.15-rc6.
>>
>> nit: please remove this to below the "---", its not part of the commit log.
>>
>>>
>>> Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from
>>> pXd_free_pYd_table())
>>>
>>
>> nit: remove empty line; the tags should all be in a single block with no empty
>> lines.
>>
>>> Cc: <stable@vger.kernel.org>
>>> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>> v1->v2:
>>>   - Enforce check in caller
>>>
>>>   arch/arm64/mm/mmu.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index ea6695d53fb9..5b1f4cd238ca 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -1286,7 +1286,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>       next = addr;
>>>       end = addr + PUD_SIZE;
>>>       do {
>>> -        pmd_free_pte_page(pmdp, next);
>>> +        if (pmd_present(*pmdp))
>>
>> pmd_free_pte_page() is using READ_ONCE() to access the *pmdp to ensure it can't
>> be torn. I suspect we don't technically need that in these functions because
>> there can be no race with a writer.
> 
> Yeah, if there is no proper locking in place the function would already
> seriously mess up (double freeing etc).

Indeed; there is no locking, but this portion of the vmalloc VA space has been
allocated to us exclusively, so we know there can be no one else racing.

> 
>> But the arm64 arch code always uses
>> READ_ONCE() for dereferencing pgtable entries for safely. Perhaps we should be
>> consistent here?
> 
> mm/vmalloc.c:   if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))

Yes, I saw that. I know that we don't technically need READ_ONCE(). I'm just
proposng that for arm64 code we should be consistent with what it already does.
See Commit 20a004e7b017 ("arm64: mm: Use READ_ONCE/WRITE_ONCE when accessing
page tables")

Thanks,
Ryan

> 
> 
> :)
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 


