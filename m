Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA143C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnn/AYoSHbugk8b1Q7qn2t6H4dacOevAoUcpq3TWVlU=; b=zIN+y/ndWe0QB3NUE5GxcvZo4D
	p0eQBo3p2KL2R+Nb0y1CzpbXIx3qWATzKQMoNXifdqFm6EWIHdR4treYp/t9jQKIYsw1TnePScmLc
	OUN/ploQSmSkKQI49fSt9e8j8CgGSCePquE/0IM0EEp2NXkAxsB4v7zNMk1Ac4b9Y5akBkyiLVZZB
	IAMFIzVq9A7bqI1KvihXJAARsDfFFvODaUxSdR8F+rbZ4FyEoG0dMJbPTYjLsXsmyG49n9TY72xyl
	MD2rutyYbiBBeO4FhZclip4IEJkWoyiD744Rwrb9Y4egu+MxdzEr8VK69XKkKp8py3aSRRJorwHID
	Ynd83n0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AXg-00000000CYd-2xAj;
	Thu, 03 Sep 2026 16:44:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AXe-00000000CXL-1mQQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:43:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DF901596;
	Thu,  3 Sep 2026 09:43:54 -0700 (PDT)
Received: from [10.57.6.2] (unknown [10.57.6.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D35D3F673;
	Thu,  3 Sep 2026 09:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788453837; bh=vWWRzkp0+9oMKve+SrPMb4YS1xG2sCsAn/SyP8y3BvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tENFd08kZU5BI9AevP2DP6ylP6FwwMDs48XD+uMO7L0Bhz+L9BtkDN4I/SheeQ1Zu
	 vh3KCgFk+KLoT4gq3yBTLs7TWPaLUAlYsO6mFXeDPTzA2CxeRUO++TSblimvJgqJm4
	 jYV5T0gUjWBtFbQkkOYjGhGmPiH+d6vIqx+nfiEE=
Message-ID: <c234ed1b-b8ba-4a90-bb16-96d34878b893@arm.com>
Date: Thu, 3 Sep 2026 18:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 04/25] arm64: Introduce por_elx_set_pkey_perms()
 helper
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
 <20260818-kpkeys-v9-4-743ad31b2c8f@arm.com>
 <apbkbH6Q4p5KYmpE@a079125.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <apbkbH6Q4p5KYmpE@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094358_502206_B835DFB3 
X-CRM114-Status: GOOD (  14.22  )
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

On 01/09/2026 16:42, Linu Cherian wrote:
> Kevin,
>
> On Tue, Aug 18, 2026 at 03:08:46PM +0100, Kevin Brodsky wrote:
>> Introduce a helper that sets the permissions of a given pkey
>> (POIndex) in the POR_ELx format, and make use of it in
>> arch_set_user_pkey_access().
>>
>> new_por now represents the permissions of a single pkey, so rename
>> it to new_perms and change its type accordingly.
>>
>> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/include/asm/por.h |  7 +++++++
>>  arch/arm64/mm/mmu.c          | 26 ++++++++++----------------
>>  2 files changed, 17 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
>> index d913d5b529e4..19b3dd1d43a0 100644
>> --- a/arch/arm64/include/asm/por.h
>> +++ b/arch/arm64/include/asm/por.h
>> @@ -31,4 +31,11 @@ static inline bool por_elx_allows_exec(u64 por, u8 pkey)
>>  	return perm & POE_X;
>>  }
>>  
>> +static inline u64 por_elx_set_pkey_perms(u64 por, u8 pkey, u8 perms)
>> +{
>> +	u64 shift = POR_ELx_PERM_SHIFT(pkey);
>> +
>> +	return (por & ~(POE_MASK << shift)) | ((u64)perms << shift);
> We could use standard bit field access macros here ?

Good idea, will do.

- Kevin

