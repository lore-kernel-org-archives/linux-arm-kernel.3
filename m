Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECDEFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fq1GlMG9A+Z0F92cKJJviLR+aocBdIFtc2BEmaz5G0o=; b=pAT/tlxAg+Igpz/6hPIJiUKrKT
	KduWbcEWy1XB5ay/1UDlfc7aW3ZU/lWHv2vK/7lu2ZMMhUWlIp8jVTfLUKQdiDLdDj2tcPjCGYRX6
	NieqFLBbOOBL6BQI/1aFFr7TngcmC3MX3Si6gHTZGHRvUmcsRtMbseKxWf7YyhnT37SHBq8B0zIHF
	uLzs4ZvT3gy5aVBN1TbcG7UwThDg0Q28w6akeLopkeJ0112Z6TXrRJNaRtKB7CjxyVXGlsZJiuTX4
	M63C8g1YzXXazVcIFTyAf/NIQsrFlmVHTCQpqt/Y2gmC5ytGhN05xnoZ397Xw9nQ/VqSjfHvOCNu/
	VNKC+4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5w6-00000003lZe-2Rh7;
	Wed, 29 Apr 2026 14:30:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5w3-00000003lYt-2NOc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:30:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82B5E1BCB;
	Wed, 29 Apr 2026 07:30:34 -0700 (PDT)
Received: from [10.57.62.76] (unknown [10.57.62.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE18C3F62B;
	Wed, 29 Apr 2026 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777473040; bh=yYUcrffafPaOm77R9dKuGdogYVbwK0I1WaJfySVSriM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uyCgDRP/abTLDH1GF4bhkMX0G6Uck4hgIgyUBRuXB/drSr9g4g9bKGm5viIR9oygl
	 cP56E8UqUoyxELCQIEk1OYF0wK9VrLrDWxYYc+nMmpWw8waMr9WI7BvBrp4N2WqRfM
	 sg1QsRk3kKCYoyYwdAkATJHWTz8jmDVV0zK0xhLo=
Message-ID: <2f5692d7-6589-4717-8258-f43d8227d74a@arm.com>
Date: Wed, 29 Apr 2026 16:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/15] arm64: mm: Don't abuse memblock NOMAP to check
 for overlaps
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-28-ardb+git@google.com>
 <8a315ca2-3754-4a66-990e-55b85191aa6e@arm.com>
 <1f9c1ca5-c15c-4a08-aa8c-cbe64f7f205b@app.fastmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <1f9c1ca5-c15c-4a08-aa8c-cbe64f7f205b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_073043_737709_CA1EA1AC 
X-CRM114-Status: GOOD (  17.12  )
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

On 29/04/2026 16:23, Ard Biesheuvel wrote:
> On Wed, 29 Apr 2026, at 12:54, Kevin Brodsky wrote:
>> On 27/04/2026 17:34, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> Now that the DRAM mapping routines respect existing table mappings and
>>> contiguous block and page mappings, it is no longer needed to fiddle
>>> with the memblock tables to set and clear the NOMAP attribute in order
>>> to omit text and rodata when creating the linear map.
>>>
>>> Instead, map the kernel text and rodata alias first with the desired
>>> attributes, so that they will not be remapped later with different
>>> attributes when mapping the memblocks.
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> ---
>>>  arch/arm64/mm/mmu.c | 24 +++++++-------------
>>>  1 file changed, 8 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 5e2348b15783..1a4b4337d29a 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -1148,12 +1148,15 @@ static void __init map_mem(void)
>>>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>>  
>>>  	/*
>>> -	 * Take care not to create a writable alias for the
>>> -	 * read-only text and rodata sections of the kernel image.
>>> -	 * So temporarily mark them as NOMAP to skip mappings in
>>> -	 * the following for-loop
>>> +	 * Map the linear alias of the [_text, __init_begin) interval
>>> +	 * as non-executable now, and remove the write permission in
>>> +	 * mark_linear_text_alias_ro() above (which will be called after
>>> +	 * alternative patching has completed). This makes the contents
>>> +	 * of the region accessible to subsystems such as hibernate,
>>> +	 * but protects it from inadvertent modification or execution.
>>>  	 */
>>> -	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
>>> +	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
>> Is it now necessary for that mapping to be tagged? If so, it should
>> probably be called out in the commit message.
>>
> As you've pointed out, the initial r/w mapping of the linear alias of rodata
> will need to be mapped tagged before moving the zero page there. So this patch
> will just preserve that, rather than remapping the region tagged explicitly as
> it does now.

Right! I got lost in all the mappings :)

- Kevin

