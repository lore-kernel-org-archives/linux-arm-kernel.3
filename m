Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330F8C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYA4JnxbTf0JCzdYr9ZqvkjonlZytGF2uNItx0EAGxw=; b=U+AzzMOpxutNOTekpUusb74XlV
	WE/OkvAcGRIzRIDoLSeYg0MH8dhMES7MwjcbujKPvS6PsDCyCupHsYs31Ca0Qx+yKv7YlLpfi6mzF
	9y4ebu//LVAzfHok+LddO//RCqkG2XPRiFwrWk72EAirhuXp/JjVY/8xLxNnsDw5phSDIvoCvkbR1
	8MVMGpEpL4LQs2XxocW8iFNL14+H9Lvk+nMpekHCM13W9To5aoOa5Yt1Qvq71o1fmwcep6LcGg2aH
	aatWDYYTkTnKf3Hxw+kTbEMFgyhsiTcw/pO+HHmnKMEvW+YaVnS15J8HJqvdrvvnJIxR/5uivpI7g
	1gCyz3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AVY-00000000BzS-1krZ;
	Thu, 03 Sep 2026 16:41:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AVW-00000000ByZ-0N4G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:41:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F4E81596;
	Thu,  3 Sep 2026 09:41:39 -0700 (PDT)
Received: from [10.57.6.2] (unknown [10.57.6.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9A193F673;
	Thu,  3 Sep 2026 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788453702; bh=fMTmPuGTue6HNbPKyeiunkqMe/FTnn9ZFj8qnYLsnh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JRoxl9E+QrX+IO3atrSghjI9x/qg48SBeUoB1iHXHkCx7rak+q7DUoHyAtcB2PWYV
	 hmycgMaqDchkjeaR2c2OvTp7h462MRv11iGZ4k/gz8RFYH0JjEvEaYuMwxBYfLXZdP
	 a/vAsnGfvbfQ8np3IkFUOQE1xCeEA50NtIZsQ9qE=
Message-ID: <66270f42-931f-4043-b24c-edcc4cad74b8@arm.com>
Date: Thu, 3 Sep 2026 18:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 02/25] set_memory: Introduce set_memory_pkey() stub
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
 <20260818-kpkeys-v9-2-743ad31b2c8f@arm.com>
 <apbiQtt-cAlLkDqV@a079125.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <apbiQtt-cAlLkDqV@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094146_219038_46371783 
X-CRM114-Status: GOOD (  23.83  )
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

On 01/09/2026 16:33, Linu Cherian wrote:
> Kevin,
>
> On Tue, Aug 18, 2026 at 03:08:44PM +0100, Kevin Brodsky wrote:
>> Introduce a new function, set_memory_pkey(), which sets the
>> protection key (pkey) of pages in the specified linear mapping
>> range. Architectures implementing kernel pkeys (kpkeys) must
>> provide a suitable implementation; an empty stub is added as
> Could you make it explicit here why we are restricting this only
> to the linear mapping range ? Would be helpful to add the reasoning
> in the commit message and as comments.
>
> Essentially we are also making a assumption here that there are no
> aliases to the linear map ?

We're not assuming this, this function is called on pages that are also
mapped as part of the kernel image. But indeed it ignores aliases,
unlike e.g. set_memory_ro(). Really its name is wrong as discussed below.

>> fallback.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  include/linux/set_memory.h | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
>> index 3030d9245f5a..7b3a8bfde3c6 100644
>> --- a/include/linux/set_memory.h
>> +++ b/include/linux/set_memory.h
>> @@ -84,4 +84,11 @@ static inline int set_memory_decrypted(unsigned long addr, int numpages)
>>  }
>>  #endif /* CONFIG_ARCH_HAS_MEM_ENCRYPT */
>>  
>> +#ifndef CONFIG_ARCH_HAS_KPKEYS
>> +static inline int set_memory_pkey(unsigned long addr, int numpages, int pkey)
>> +{
>> +	return 0;
>> +}
>> +#endif
> Would be better to make this (linar map range)constraint on the API name or that passed
> as a boolean flag ?

Indeed, in fact I've been thinking about renaming this function for a
while and I've already done it locally :) It'll be set_direct_map_pkey()
in the next version.

> Also, it would be better to have the __is_lm_address checks in this generic wrapper which
> then calls arch_set_memory_pkey ?

That's not unreasonable, but such pattern isn't used by other functions
in set_memory.h and I'd rather not deviate too much without a good reason.

- Kevin

