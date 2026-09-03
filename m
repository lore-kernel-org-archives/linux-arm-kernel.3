Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E297CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8pQRfh31VGnGXGPzZ2t/4UaiVIHP0r6rObZCl6Q+iY=; b=bP75jP5JUIktP/m6nxI7PdfQyr
	bhCUeWPY8PuvbjvB5yxUai92SDTfsbvdlTCTbUxVps9jF11epvhza0Jn4WumXBTMc62/MEAFPNq1l
	aaQVbKZy/N0vRwI/1bP+OzZFtmJaTKUXMzxYEJapezOZo6hUzCBqD9k6QgtgMfswpb9H/85Y5w6Qf
	Ojxet3P5uCyw/M+UV27/3IQ+XdRulT6C0KsQhtHkFJKTGZAa673DJGICTEPvTkrAf2rNXN7XFL6gy
	1AnHtChh+qz6xQOGIJEU2fxe2RZ96LyWyhwef5s0ycrDj/4KC88jiNmWJZSh2HeRzjQV4gQtRGuwu
	j53pmcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AVv-00000000C6l-0ICD;
	Thu, 03 Sep 2026 16:42:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AVs-00000000C5X-1BGQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:42:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEC7E1596;
	Thu,  3 Sep 2026 09:42:03 -0700 (PDT)
Received: from [10.57.6.2] (unknown [10.57.6.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F24943F673;
	Thu,  3 Sep 2026 09:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788453727; bh=hpWgr2ZJY3qJKLttzHDS9l/xybICdRKBZ0Vb9KipRwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jS2Asm/UwfhzBaNFvf9emw9gKWsaUHT9+Ly9ueyblpJtMszHw0BiQrvZPl/Bzqq5c
	 ROwk1AuUKsBRjDM/KXiD2FJZeqlNkN/NkAdAbAKu5SuquX6KDjPQzQ8pgcjEcU7WYq
	 AOJfjrL3ylui6l8L/lkx7tW8ReJG/FtIsmjp6kbU=
Message-ID: <91154245-af39-4e93-bf2f-dd878f86c9a0@arm.com>
Date: Thu, 3 Sep 2026 18:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 03/25] arm64: mm: Enable overlays for all EL1
 indirect permissions
To: Linu Cherian <linu.cherian@arm.com>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-3-743ad31b2c8f@arm.com>
 <apbjpkTgtdXZQ9Sm@a079125.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <apbjpkTgtdXZQ9Sm@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094208_410429_EA5C0E1C 
X-CRM114-Status: GOOD (  15.10  )
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

On 01/09/2026 16:39, Linu Cherian wrote:
> Kevin,
>
> On Tue, Aug 18, 2026 at 03:08:45PM +0100, Kevin Brodsky wrote:
>> In preparation of using POE inside the kernel, enable "Overlay
>> applied" for kernel memory types in PIR_EL1. This ensures that the
>> permissions set in POR_EL1 affect all kernel mappings.
>>
>> User memory types must be left untouched (overlays not applied)
>> because any privileged access to user memory (e.g. futex atomic
>> without FEAT_LSUI) would then be mistakenly checked against POR_EL1.
>>
>> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable-prot.h | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
>> index 212ce1b02e15..d4d45ab86a5a 100644
>> --- a/arch/arm64/include/asm/pgtable-prot.h
>> +++ b/arch/arm64/include/asm/pgtable-prot.h
>> @@ -183,9 +183,9 @@ static inline bool __pure lpa2_is_enabled(void)
>>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RW)     | \
>>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R)      | \
>>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW)     | \
>> -	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL_ROX),    PIE_RX)     | \
>> -	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL_EXEC),   PIE_RWX)    | \
>> -	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL_RO),     PIE_R)      | \
>> -	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL),        PIE_RW))
>> +	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL_ROX),    PIE_RX_O)   | \
>> +	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL_EXEC),   PIE_RWX_O)  | \
>> +	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL_RO),     PIE_R_O)    | \
>> +	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_KERNEL),        PIE_RW_O))
>>  
>>  #endif /* __ASM_PGTABLE_PROT_H */
> IMHO its better to have this patch just before, "arm64: Enable kpkeys" for
> easier review. Otherwise,

Sure, I'll move it.

> Reviewed-by: Linu Cherian <linu.cherian@arm.com>

Thanks!

- Kevin

