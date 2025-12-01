Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB60D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Er0ga7cjSZ0JKeVRoO5GUwHS5fC5Y/9LAo9V07HY5YE=; b=j85nPml7vnIJPbdMoJm44oeAeP
	nn/NOCncpR4mcWyca6dZmhIqKzx4qg3Oi7A7dFGDkHJ8m0IogiicEc0cpzEhKQjnrdjQD2Q/FUrAj
	ZRKXa772HS6We2FVg/D7ENeUPlYlTSNHmWmNMgYKR6ag6257SBZ6o3Usz7BC26FVvCkcTiNIV6DhG
	rKeHRp7Z5uvDSTgmzY3WuQ2G1+/PvD5DnjCXL9hmF6N4Iumc2wwThQW6bXl0Tk2CBvTgZjKja1hdf
	PyHSV+3TpJwvVA4iqyi2NtRupUlkWU7GC8ZaYfN+IcHFdH0eSi7Whv0BxO2PaX7sMFNn53HxeGlE1
	ZIHCs13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzVA-000000038uV-1e8X;
	Mon, 01 Dec 2025 08:43:20 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzV7-000000038rR-0eZt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 08:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764578590; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=Er0ga7cjSZ0JKeVRoO5GUwHS5fC5Y/9LAo9V07HY5YE=;
	b=e0L4hd1fvr+orB2YpNUQmBdRwYf7QwKwS85gA3i4HGkQ8ARG7lnF800yvnVKh9DLDwaAo3R5NoWGogfPWnwWwF1AQE6PjznIx33PAajLsbVWdTx6154M3F+XVF/EyXUhWGmBEvXoVbAHiMHz+jaAqKTNr4gjTN2MJxf5yB+xjX0=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wtol.eq_1764578571 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 01 Dec 2025 16:43:07 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Cc: catalin.marinas@arm.com,  will@kernel.org,  ardb@kernel.org,
  anshuman.khandual@arm.com,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
In-Reply-To: <ac172927-1475-464c-b925-5fec2cfa1b1e@windriver.com> (Jianpeng
	Chang's message of "Mon, 1 Dec 2025 15:54:37 +0800")
References: <20251127034350.3600454-1-jianpeng.chang.cn@windriver.com>
	<87qztiec4e.fsf@DESKTOP-5N7EMDA>
	<ac172927-1475-464c-b925-5fec2cfa1b1e@windriver.com>
Date: Mon, 01 Dec 2025 16:42:50 +0800
Message-ID: <87v7iqh9th.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004317_839177_5405D924 
X-CRM114-Status: GOOD (  24.00  )
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

Jianpeng Chang <jianpeng.chang.cn@windriver.com> writes:

> On 11/28/25 5:32 PM, Huang, Ying wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> Hi, Jianpeng,
>>
>> Jianpeng Chang <jianpeng.chang.cn@windriver.com> writes:
>>
>>> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
>>> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
>>> when the page is already dirty (PTE_DIRTY is set). While this optimization
>>> prevents unnecessary dirty page marking in normal memory management paths,
>>> it breaks kexec on some platforms like NXP LS1043.
>>>
>>> The issue occurs in the kexec code path:
>>> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>>>     writable copy of the linear mapping
>>> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>>>     are writable for the new kernel image copying
>>> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
>>> 4. When kexec tries to copy the new kernel image through the linear
>>>     mapping, it fails on read-only pages, causing the system to hang
>>>     after "Bye!"
>>>
>>> The same issue affects hibernation which uses the same trans_pgd code path.
>>>
>>> Fix this by explicitly clearing PTE_RDONLY in _copy_pte() for both
>>> kexec and hibernation, ensuring all pages in the temporary mapping are
>>> writable regardless of their dirty state. This preserves the original
>>> commit's optimization for normal memory management while fixing the
>>> kexec/hibernation regression.
>>>
>>> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
>> IMHO, this isn't the right "Fixes" tag.  The original _copy_pte() code
>> should be the fixing target.
>
> Hi Ying,
>
> According to my understanding, the Fixes tag should point to the
> commit that directly
>
> introduced the issue. While _copy_pte() was introduced with
> pte_mkwrite_novma() in
>
> commit 6ecc21bb432d, at that time pte_mkwrite_novma() always cleared
> the PTE_RDONLY

Per my understanding, that is not correct to clearing PTE_RDONLY in
pte_mkwrite_novma() in the first place.

However, "Fixes" flag is used for patch backporting too.  For that, the
original tag is better.  So, It's OK for me now.

> bit unconditionally, and kexec worked correctly. Should we blame a
> change that was
>
> working properly at the time, or am I missing something here?
>
>>
>>> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
>>> ---
>>>   arch/arm64/mm/trans_pgd.c | 12 ++++++++++--
>>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
>>> index 18543b603c77..ad4e5e4fcc91 100644
>>> --- a/arch/arm64/mm/trans_pgd.c
>>> +++ b/arch/arm64/mm/trans_pgd.c
>>> @@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>>                 * Resume will overwrite areas that may be marked
>>>                 * read only (code, rodata). Clear the RDONLY bit from
>>>                 * the temporary mappings we use during restore.
>>> +              *
>>> +              * For kexec/hibernation, we need writable access regardless
>>> +              * of the page's dirty state, so force clear PTE_RDONLY.
>>>                 */
>>> -             __set_pte(dst_ptep, pte_mkwrite_novma(pte));
>>> +             pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>>> +             pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>>> +             __set_pte(dst_ptep, pte);
>> Why not
>>
>>          __set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte));
> I agree that using pte_mkdirty() is indeed better, makes the
> modification clearer and avoids the helper function. I will change it.

Thanks!

>> ?
>>
>>>        } else if (!pte_none(pte)) {
>>>                /*
>>>                 * debug_pagealloc will removed the PTE_VALID bit if
>>> @@ -57,7 +62,10 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>>                 */
>>>                BUG_ON(!pfn_valid(pte_pfn(pte)));
>>>
>>> -             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
>>> +             pte = pte_mkvalid(pte);
>>> +             pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>>> +             pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>>> +             __set_pte(dst_ptep, pte);
>>>        }
>>>   }

---
Best Regards,
Huang, Ying

