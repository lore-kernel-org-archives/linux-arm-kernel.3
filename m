Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C31D6ACDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfTnXPfQhUsErotz7Q75pjApwiZhopPstmmgc52ak6Y=; b=z6hdJdkupS2bMtwQZYyqQODwma
	U1OjuXNYypvUw5texMPG+ztclz52zkEWLj3pcBkQ2giR6jwPJ6dFL89jH/WYOBMnboUN5OVnD4Jsw
	09Xb0EKNjz310DLAokdx3Z6rU1p3MX7/tm+TGxBBS5jtuTPCAhRdOLhAUMeRzsma3jUjeFY4tm5Pp
	w7cARSOdf5ErEoCvfEkY0gjcriEceihwBwIQ7rVIS+QhVFm3iEMakYtBifeTaSGLfSonJeCY4ccUj
	xpH1+8UA/1CsV9BBiiAky2KvwnpEMbl//ZaLkhqUW/Z8wUOOV3gi60wbjUhLbP2PBqRTUptH+hwwD
	adWbE/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCnj-00000008P7g-05jx;
	Thu, 18 Dec 2025 12:08:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCng-00000008P6o-3UHc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:08:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC3CBFEC;
	Thu, 18 Dec 2025 04:08:00 -0800 (PST)
Received: from [10.1.39.180] (unknown [10.1.39.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 418C33F762;
	Thu, 18 Dec 2025 04:08:05 -0800 (PST)
Message-ID: <0caffb55-f242-4b01-b60a-c8749aadf661@arm.com>
Date: Thu, 18 Dec 2025 12:08:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mm: rmap: support batched checks of the references
 for large folios
Content-Language: en-GB
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <545dba5e899634bc6c8ca782417d16fef3bd049f.1765439381.git.baolin.wang@linux.alibaba.com>
 <cb4d7243-d8c6-4706-a254-6f5afc148910@arm.com>
 <89cdd927-fc88-42cf-b8a1-2fbd736d5f7c@linux.alibaba.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <89cdd927-fc88-42cf-b8a1-2fbd736d5f7c@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_040808_903358_155BF1F4 
X-CRM114-Status: GOOD (  10.40  )
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

>>>   +#define clear_flush_young_ptes clear_flush_young_ptes
>>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>>> +                    unsigned long addr, pte_t *ptep,
>>> +                    unsigned int nr)
>>> +{
>>> +    if (likely(nr == 1))
>>> +        return __ptep_clear_flush_young(vma, addr, ptep);
>>
>> Bug: This is broken if core-mm tries to call this for nr=1 on a pte that is part
>> of a contpte mapping.
>>
>> The similar fastpaths are here to prevent regressing the common small folio case.
> 
> Thanks for catching this. I had considered this before, but I still missed it.
> 
>> I guess here the best approach is (note no leading underscores):
>>
>>     if (likely(nr == 1))
>>         return ptep_clear_flush_young(vma, addr, ptep);
> 
> However, I prefer to use pte_cont() to check it. Later, I plan to clean up the
> ptep_clear_flush_young().
> 
>     if (nr == 1 && !pte_cont(__ptep_get(ptep))
>         return __ptep_clear_flush_young(vma, addr, ptep);

Sure. That would follow the pattern in clear_young_dirty_ptes(). Please use the
likely() hint as is done everywhere else:

	if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))

I notice that ptep_test_and_clear_young() and ptep_clear_flush_young() are both
testing aginst pte_valid_cont(). These could probably be relaxed to pte_cont()
since it is implicit the the pte must be valid?


