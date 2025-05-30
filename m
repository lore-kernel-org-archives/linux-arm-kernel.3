Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4D0C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 07:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMK+kVI2QrLT6/t0lrpwkbhoVqKkVt2ErKTQbnAA56M=; b=nk3ZKCwn/CJuCQ1FNtr3t3+nbd
	jU03H/yT3QRRYQ7jN8MU6JQkR/Gp2WqnqIPCGkbhIioJ7n/wVct5c8YFsWyRRt/7LZS8fv74hVdk8
	LVxCPiQMIPsicq7Lt6eMzg/43Cu/0TEWtbCflayCtISLDwWLlhsoYcikb7MFVo2UmjRuGYJktdIGJ
	8kH+HDDIxXlurh++H6Krjd2iurHYKoEaLv+DKTunkhw+yxlWes6qvw+Gf9Mua1bdu58vpsv5zKHPH
	aDpkeTiwwvb/QMy0hpPNyc14U4xzeavjR05W7YcnAveksxqhkifVQUEodC1Yw++nOwiFQRUZ/tPrW
	R7NoqrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKtqP-0000000HPKH-2Ank;
	Fri, 30 May 2025 07:07:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKtoH-0000000HP8d-3Hh7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 07:05:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88EE016F8;
	Fri, 30 May 2025 00:05:27 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6101E3F5A1;
	Fri, 30 May 2025 00:05:42 -0700 (PDT)
Message-ID: <63060234-007e-450b-a4d5-dacb9d2b87d5@arm.com>
Date: Fri, 30 May 2025 08:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Restrict pagetable teardown to avoid false
 warning
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: david@redhat.com, anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250527082633.61073-1-dev.jain@arm.com>
 <914071fe-c133-4c9d-bb2d-9b9fca8a1798@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <914071fe-c133-4c9d-bb2d-9b9fca8a1798@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_000545_871931_62044441 
X-CRM114-Status: GOOD (  17.14  )
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

On 30/05/2025 04:55, Dev Jain wrote:
> 
> On 27/05/25 1:56 pm, Dev Jain wrote:
>> Commit 9c006972c3fe removes the pxd_present() checks because the caller

nit: "Commit 9c006972c3fe" should have actually been:

Commit 9c006972c3fe ("arm64: mmu: drop pXd_present() checks from
pXd_free_pYd_table()")

>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
>> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
>> a pmd_present() check in pud_free_pmd_page().
>>
>> This problem was found by code inspection.
>>
>> Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from
>> pXd_free_pYd_table())
> 
> I missed double quotes around the fixes commit message. Can Will or Catalin fix
> that,
> or shall I resend.

For future, I have the following in my ~/.gitconfig

"""
[pretty]
        fixes = Fixes: %h (\"%s\")
        commit = Commit %h (\"%s\")
"""

Then I can do:

$ git show --pretty=fixes <SHA> | head -n 1

or

$ git show --pretty=commit <SHA> | head -n 1

to get the correct format. Note that "Fixes:" is a tag and should all be on a
single line. "Commit" is just a way to refer to other commits in prose and can
be broken across lines at the usual character limit.

Perhaps there is an even easier way to do it, but this works for me.

Thanks,
Ryan


> 
>> Cc: <stable@vger.kernel.org>
>> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> This patch is based on 6.15-rc6.
>>
>> v2->v3:
>>   - Use pmdp_get()
>>
>> v1->v2:
>>   - Enforce check in caller
>>
>>   arch/arm64/mm/mmu.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ea6695d53fb9..5a9bf291c649 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1286,7 +1286,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>       next = addr;
>>       end = addr + PUD_SIZE;
>>       do {
>> -        pmd_free_pte_page(pmdp, next);
>> +        if (pmd_present(pmdp_get(pmdp)))
>> +            pmd_free_pte_page(pmdp, next);
>>       } while (pmdp++, next += PMD_SIZE, next != end);
>>         pud_clear(pudp);


