Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D388ECAC591
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13ciK3iFZo2cfMjvx5yCuh5mgHIxY0ExzptMTzae7MU=; b=3dkEiE7O72yoKZBNb1ZL134m5n
	oeV1mgHFGJ4evHFnqvS7YPDKZfRu6bg1reBD/X8psKhWiipoEVgZ/kO9GgENy8ecVsVnL3z8/RrGG
	nVoEw0kluwgTxObgbb2nXXrW/Xrb8KIjuzKtn3SUTp3jkFPNicTycwSFIIb0POkITJo+kUd1RyLk2
	f1cJEoqJV0K2mHYrEdFLylT8j6nHbOyzgYlLqkZDMj16J6sK9hKiQDfZa/j0V596Tnht3WAz3F9zc
	IA4GgV/6R9/27diZE/NWmcKUEZZgVyHyqzxfYx1O+FX7rXd38gor24W12aKh7ZM6beJpmbgOP8sQ7
	NvoNiOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvssH-00000005Bxy-34Ua;
	Tue, 09 Sep 2025 07:34:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvrSA-00000004a33-0nix
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 06:03:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1715315A1;
	Mon,  8 Sep 2025 23:03:30 -0700 (PDT)
Received: from [10.163.72.34] (unknown [10.163.72.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2433F66E;
	Mon,  8 Sep 2025 23:03:31 -0700 (PDT)
Message-ID: <a2f95b96-cc0a-44a4-bd2a-05ba65b39b6a@arm.com>
Date: Tue, 9 Sep 2025 11:33:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: refactor the rodata=xxx
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>,
 Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, cl@linux.com,
 Shubhang@os.amperecomputing.com, corbet@lwn.net, paulmck@kernel.org,
 akpm@linux-foundation.org, rostedt@goodmis.org, Neeraj.Upadhyay@amd.com,
 bp@alien8.de, ardb@kernel.org, suzuki.poulose@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org
References: <20250909033236.4099-1-shijie@os.amperecomputing.com>
 <20250909033236.4099-2-shijie@os.amperecomputing.com>
 <bc0ae013-2314-4513-a759-cbf2b922aa6a@arm.com>
 <a18f3b2a-0869-436b-ab20-41a92f1f468a@amperemail.onmicrosoft.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <a18f3b2a-0869-436b-ab20-41a92f1f468a@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_230342_300702_7C076D30 
X-CRM114-Status: GOOD (  17.49  )
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



On 09/09/25 10:56 AM, Shijie Huang wrote:
> 
> On 09/09/2025 12:29, Anshuman Khandual wrote:
>> On 09/09/25 9:02 AM, Huang Shijie wrote:
>>> As per admin guide documentation, "rodata=on" should be the default on
>>> platforms. Documentation/admin-guide/kernel-parameters.txt describes
>>> these options as
>>>
>>>     rodata=         [KNL,EARLY]
>>>             on      Mark read-only kernel memory as read-only (default).
>>>             off     Leave read-only kernel memory writable for debugging.
>>>             full    Mark read-only kernel memory and aliases as read-only
>>>                     [arm64]
>>>
>>> But on arm64 platform, RODATA_FULL_DEFAULT_ENABLED is enabled by default,
>>> so "rodata=full" is the default instead.
>>>
>>> This patch implements the following changes:
>>>   - Make "rodata=on" behaviour same as the original "rodata=full".
>>>     This keeps align with the x86.
>>>   - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
>>>   - Drop the original "rodata=full"
>>>
>>> After this patch, the "rodata=on" will be the default on arm64 platform
>>> as well.
>>>
>>> Different rodata options may have different performance, so record more
>>> detail information here:
>>>
>>>   rodata=on (default)
>>>      This applies read-only attributes to VM areas and to the linear
>>>      alias of the backing pages as well. This prevents code or read-
>>>      only data from being modified (inadvertently or intentionally),
>>>      via another mapping for the same memory page.
>>>
>>>      But this might cause linear map region to be mapped down to base
>>>      pages, which may adversely affect performance in some cases.
>>>
>>>   rodata=off
>>>      This provides more block mappings and contiguous hints for linear
>>>      map region which would minimize TLB footprint. This also leaves
>>>      read-only kernel memory writable for debugging.
>>>
>>>   rodata=noalias
>>>      This provides more block mappings and contiguous hints for linear
>>>      map region which would minimize TLB footprint. This leaves the linear
>>>      alias of read-only mappings in the vmalloc space writeable, making
>>                         typo     ^^^^^^^^
> What's the typo? It seems "writeable" is okay.

Alright.
>>>      them susceptible to inadvertent modification by software.
>>>
>>> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
>>> ---
>>>   Documentation/admin-guide/kernel-parameters.txt | 5 +++--
>>>   arch/arm64/include/asm/setup.h                  | 4 ++--
>>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index db84a629f7b1..138e0db5af64 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -6418,8 +6418,9 @@
>>>       rodata=        [KNL,EARLY]
>>>           on    Mark read-only kernel memory as read-only (default).
>>>           off    Leave read-only kernel memory writable for debugging.
>>> -        full    Mark read-only kernel memory and aliases as read-only
>>> -                [arm64]
>>> +        noalias    Mark read-only kernel memory as read-only but retain
>>> +            writable aliases in the direct map for regions outside
>>> +            of the kernel image. [arm64]
>> Should not the arm64 specific performance implications be mentioned
>> in the above documentation update as well ? But in case this appears
>> too much platform specific - probably do consider adding them above
>> or inside arch_parse_debug_rodata() as an in-code documentation.
> 
> Will had already suggested do not add them for the arch_parse_debug_rodata():
> 
> https://lists.infradead.org/pipermail/linux-arm-kernel/2025-September/1060135.html
Alright.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

