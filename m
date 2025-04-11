Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4281C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGsMlcPoa4Ztq1qLPW0CR/RnfQr8Al1DSqzMYzmwT04=; b=d9RM3V8dCYAHmq7ndwtaVBGoLc
	eaa0rCxdY2ZLnM1h1AEGkXleS1XeHjCHKG1brEXPVZylCiBfei++9pa/ST2jhJpFTTbVsHWCy+gjD
	GcWpid20gvDmckQm+cRPQT0uD+nzXqARa+OMSpQooCnTR6VCMXZyIMjb43U5IK8lvhCP9dKAwSx4D
	pQdonx0iP+xB5mD+h/0mH22SFtjcOxi6QfKluHK/WZVYsQsFKx3VLYUXdfRlzcgIr7QQJCzSDel+U
	QW8x9GCQ+aRThWC8PFrWFuxxLuXzW8/aK6BYqklGJZ9CgU8nC0GILldvcX5/sTQRwOTuxIzaFtO8C
	rrVUBr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IO8-0000000EYs4-1GoM;
	Fri, 11 Apr 2025 17:42:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IDL-0000000EWym-2kok
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 17:30:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D8BC106F;
	Fri, 11 Apr 2025 10:30:50 -0700 (PDT)
Received: from [10.163.75.48] (unknown [10.163.75.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91C733F59E;
	Fri, 11 Apr 2025 10:30:45 -0700 (PDT)
Message-ID: <7dccb3a2-f5e2-4f9e-8f5c-465a1d3ffdb6@arm.com>
Date: Fri, 11 Apr 2025 23:00:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
To: Barry Song <21cnbao@gmail.com>, Xavier <xavier_qy@163.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 ryan.roberts@arm.com, ioworker0@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Zi Yan <ziy@nvidia.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
 <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_103051_781905_174D32C3 
X-CRM114-Status: GOOD (  19.54  )
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

+others

On 11/04/25 2:55 am, Barry Song wrote:
> On Mon, Apr 7, 2025 at 9:23 PM Xavier <xavier_qy@163.com> wrote:
>>
>> This commit optimizes the contpte_ptep_get function by adding early
>>   termination logic. It checks if the dirty and young bits of orig_pte
>>   are already set and skips redundant bit-setting operations during
>>   the loop. This reduces unnecessary iterations and improves performance.
>>
>> Signed-off-by: Xavier <xavier_qy@163.com>
>> ---
>>   arch/arm64/mm/contpte.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index bcac4f55f9c1..ca15d8f52d14 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>
>>          pte_t pte;
>>          int i;
>> +       bool dirty = false;
>> +       bool young = false;
>>
>>          ptep = contpte_align_down(ptep);
>>
>>          for (i = 0; i < CONT_PTES; i++, ptep++) {
>>                  pte = __ptep_get(ptep);
>>
>> -               if (pte_dirty(pte))
>> +               if (!dirty && pte_dirty(pte)) {
>> +                       dirty = true;
>>                          orig_pte = pte_mkdirty(orig_pte);
>> +               }
>>
>> -               if (pte_young(pte))
>> +               if (!young && pte_young(pte)) {
>> +                       young = true;
>>                          orig_pte = pte_mkyoung(orig_pte);
>> +               }
>> +
>> +               if (dirty && young)
>> +                       break;
> 
> This kind of optimization is always tricky. Dev previously tried a similar
> approach to reduce the loop count, but it ended up causing performance
> degradation:
> https://lore.kernel.org/linux-mm/20240913091902.1160520-1-dev.jain@arm.com/
> 
> So we may need actual data to validate this idea.

The original v2 patch does not work, I changed it to the following:

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..db0ad38601db 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, 
unsigned long addr,
  }
  EXPORT_SYMBOL_GPL(__contpte_try_unfold);

+#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
+       int _start; \
+       pte_t *_ptep = ptep; \
+       for (_start = start; _start < CONT_PTES; _start++, ptep++) { \
+               if (pte_##flag(__ptep_get(_ptep))) { \
+                       orig_pte = pte_mk##flag(orig_pte); \
+                       break; \
+               } \
+       }
+
  pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
  {
         /*
@@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
         for (i = 0; i < CONT_PTES; i++, ptep++) {
                 pte = __ptep_get(ptep);

-               if (pte_dirty(pte))
+               if (pte_dirty(pte)) {
                         orig_pte = pte_mkdirty(orig_pte);
+                       CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
+                       break;
+               }

-               if (pte_young(pte))
+               if (pte_young(pte)) {
                         orig_pte = pte_mkyoung(orig_pte);
+                       CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
+                       break;
+               }
         }

         return orig_pte;

Some rudimentary testing with micromm reveals that this may be 
*slightly* faster. I cannot say for sure yet.

> 
>>          }
>>
>>          return orig_pte;
>> --
>> 2.34.1
>>
> 
> Thanks
> Barry
> 


