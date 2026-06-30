Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFF0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVi0bfnm6CkyWOx2B3ngEmCvXtH++YDEdZa8Kmvr0VI=; b=AFkkyouTejzYPLvcoTw3Vu5t/0
	CM5y2zB/xs3qyjVcxm2XgbBs+fa9eAMBkkHD375YR0QS39o7mcZ5ZaVzoY/0A/ZJ0PiUtEATa32E5
	cywKCWRKo3YiCUnmLwKvGkf/bAJmKN3fY1tl/6nH0AQegnLEDJX8DQ96NT7ZqI2IHuaFdOgjGRrR1
	Q1KMxG/78VwD4JxLTA868aGoFabPuMLPSyhdSykDIE5ScaCNi8iMtpTG2VsYikwiI+Pv2eij4bTxq
	D/lvgPh3i9MAtbvQlzMLchEZ8nJmCXIMoWwSxMuyLtwQG6Or3vRzE4CbUeiR6hfCtr/Qi54WZaF10
	XTsSi0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUZP-0000000GNOf-22MF;
	Tue, 30 Jun 2026 09:15:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUZM-0000000GNNe-178s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:15:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 579662C1C;
	Tue, 30 Jun 2026 02:15:46 -0700 (PDT)
Received: from [10.57.81.132] (unknown [10.57.81.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDA043FAFB;
	Tue, 30 Jun 2026 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782810950; bh=sVn7JJGwZOLyL4bxlpoMBgAzZBKKk9c/Cy1C3BZSWug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hnex8kTIqJvDaCwWDLDms17GUHLABmXpVlHniMOGFY9lEm0cRriX6yLe9fcG0DQqa
	 qEkiKClZ7FQfIJKCVlnr4qWxNJT3I0hCP27j0vIhDQd78gJFmS9Mr/RG6zkIZ1LeLV
	 d0Td8sQg68FW8THEVVnk5GPM4swe7eEP7w7hlH1k=
Message-ID: <0554305f-d2a1-4727-bada-0fba203a8af6@arm.com>
Date: Tue, 30 Jun 2026 11:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v8 04/24] arm64: Introduce por_elx_set_pkey_perms()
 helper
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-hardening@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
 <20260526-kpkeys-v8-4-eaaacdacc67c@arm.com>
 <e334c595-92ab-4eb9-a096-35602d57ae6d@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <e334c595-92ab-4eb9-a096-35602d57ae6d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_021552_401250_A89B6E28 
X-CRM114-Status: GOOD (  18.99  )
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

On 22/06/2026 15:16, David Hildenbrand (Arm) wrote:
> On 5/26/26 13:15, Kevin Brodsky wrote:
>> Introduce a helper that sets the permissions of a given pkey
>> (POIndex) in the POR_ELx format, and make use of it in
>> arch_set_user_pkey_access().
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/include/asm/por.h |  7 +++++++
>>  arch/arm64/mm/mmu.c          | 26 ++++++++++----------------
>>  2 files changed, 17 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
>> index d913d5b529e4..bffb4d2b1246 100644
>> --- a/arch/arm64/include/asm/por.h
>> +++ b/arch/arm64/include/asm/por.h
>> @@ -31,4 +31,11 @@ static inline bool por_elx_allows_exec(u64 por, u8 pkey)
>>  	return perm & POE_X;
>>  }
>>  
>> +static inline u64 por_elx_set_pkey_perms(u64 por, u8 pkey, u64 perms)
>> +{
>> +	u64 shift = POR_ELx_PERM_SHIFT(pkey);
>> +
>> +	return (por & ~(POE_MASK << shift)) | (perms << shift);
>> +}
>> +
>>  #endif /* _ASM_ARM64_POR_H */
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index dd85e093ffdb..493310cf0486 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -2339,8 +2339,8 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
>>  #ifdef CONFIG_ARCH_HAS_PKEYS
>>  int arch_set_user_pkey_access(int pkey, unsigned long init_val)
>>  {
>> -	u64 new_por;
>> -	u64 old_por;
>> +	u64 new_perms;
> You should spell out the renaming of the variable.

Sure, will do.

> Given that perms is 4bit per key, should we use a u8 for it instead?

We could, in fact I'm just noticing that this all very inconsistent
right now: the POE_* constants are defined as UL, but por_elx_allows_*
and other functions use u8. I'll clean that up in a separate patch and
use u8 here.

>> +	u64 por;
>>  
>>  	if (!system_supports_poe())
>>  		return -ENOSPC;
>> @@ -2354,25 +2354,19 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
>>  		return -EINVAL;
>>  
>>  	/* Set the bits we need in POR:  */
>> -	new_por = POE_RWX;
>> +	new_perms = POE_RWX;
>>  	if (init_val & PKEY_DISABLE_WRITE)
>> -		new_por &= ~POE_W;
>> +		new_perms &= ~POE_W;
>>  	if (init_val & PKEY_DISABLE_ACCESS)
>> -		new_por &= ~POE_RW;
>> +		new_perms &= ~POE_RW;
>>  	if (init_val & PKEY_DISABLE_READ)
>> -		new_por &= ~POE_R;
>> +		new_perms &= ~POE_R;
>>  	if (init_val & PKEY_DISABLE_EXECUTE)
>> -		new_por &= ~POE_X;
>> +		new_perms &= ~POE_X;
>>  
>> -	/* Shift the bits in to the correct place in POR for pkey: */
>> -	new_por = POR_ELx_PERM_PREP(pkey, new_por);
>> -
>> -	/* Get old POR and mask off any old bits in place: */
>> -	old_por = read_sysreg_s(SYS_POR_EL0);
>> -	old_por &= ~(POE_MASK << POR_ELx_PERM_SHIFT(pkey));
>> -
>> -	/* Write old part along with new part: */
>> -	write_sysreg_s(old_por | new_por, SYS_POR_EL0);
>> +	por = read_sysreg_s(SYS_POR_EL0);
>> +	por = por_elx_set_pkey_perms(por, pkey, new_perms);
>> +	write_sysreg_s(por, SYS_POR_EL0);
> Was wondering whether to move reading+writing of the register into the same
> helper, but you cannot reuse this exactly the same way for SYS_POR_EL1 as it seems.

It wouldn't be useful because the new user of the helper,
por_set_kpkeys_context(), doesn't itself read or write the register.

> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

- Kevin

