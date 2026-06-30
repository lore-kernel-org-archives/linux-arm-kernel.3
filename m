Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F42C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBg35UbhV6mbQWeCQ9pQpDL4bAnyZsscC2WQYIptGg4=; b=xU9m6oeYflOR0rjfkPuarRrKvG
	WKrr1wi030XL+Uj11/SN67oSvS7fZvVM8DZc2cN778Fprk1e3dT+pJT3ch4NEAsdmcGA4N69QoRRz
	ZZ6cJuOfv1pKcNQbObTAM4oCMaXxyq4w//W412lUxMSoFSkEpu/wpIi4vLjgLLPJcHuFXrQ724YSa
	symRHsooBCOhlyhNZUFfPmnmKk+iYB7bFUw8cka9oqUEqSW4fdhi0p8/p6MOi7gfriN9N/1dHHbL9
	CJ+GXqw0ldJAuN2Z3zTPm5FtwQhsChDAslY0Xtxam6BODLOnRCRegAKaUZHbQ3NEu/J7Xmnw/L+Vb
	XmNYYsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUaB-0000000GNXG-3cyF;
	Tue, 30 Jun 2026 09:16:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUa9-0000000GNWk-3hky
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:16:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68EE12C1C;
	Tue, 30 Jun 2026 02:16:36 -0700 (PDT)
Received: from [10.57.81.132] (unknown [10.57.81.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F30143FAFB;
	Tue, 30 Jun 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782811000; bh=pOGqr+6YjRRrGfqyTm37l0BuFHy9XPuCtkGh7B9Kr+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OhlBURWGxQqcbV6J2ZjbPLWqe0+OO9mHDyY8RjjqBPKuIiYpX91UGBHlnRLA2voBR
	 ZGfe8UhEF+CVHnpiOUhkK+Si+HmROlqhNQzZWseJfpnlDEHoIShP9UCusiuqoiShd4
	 QVu9mycDBfqeZmeTAPiDcXgKfSZGryWFP031nXt4=
Message-ID: <e4f98e9d-9f02-46d3-90ff-22ec711ba85b@arm.com>
Date: Tue, 30 Jun 2026 11:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v8 05/24] arm64: Implement asm/kpkeys.h using POE
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
 <20260526-kpkeys-v8-5-eaaacdacc67c@arm.com>
 <f8507ad6-761c-4073-85ae-bddb2a07d660@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <f8507ad6-761c-4073-85ae-bddb2a07d660@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_021642_015774_8D418774 
X-CRM114-Status: GOOD (  29.17  )
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

On 22/06/2026 15:35, David Hildenbrand (Arm) wrote:
> On 5/26/26 13:15, Kevin Brodsky wrote:
>> Implement the kpkeys interface if CONFIG_ARM64_POE is enabled.
>> The permissions for KPKEYS_PKEY_DEFAULT (pkey 0) are set to RWX as
>> this pkey is also used for code mappings.
>>
>> To allow <asm/kpkeys.h> to be included from assembly, also add
>> appropriate #ifdef's to <asm/por.h>.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/include/asm/kpkeys.h | 59 +++++++++++++++++++++++++++++++++++++++++
>>  arch/arm64/include/asm/por.h    |  4 +++
>>  2 files changed, 63 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
>> new file mode 100644
>> index 000000000000..4dbfeb3dfcfe
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/kpkeys.h
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_KPKEYS_H
>> +#define __ASM_KPKEYS_H
>> +
>> +#include <asm/barrier.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/por.h>
>> +
>> +#include <asm-generic/kpkeys.h>
>> +
>> +/*
>> + * Equivalent to por_set_kpkeys_context(0, KPKEYS_CTX_DEFAULT), but can also be
>> + * used in assembly.
>> + */
>> +#define POR_EL1_INIT	POR_ELx_PERM_PREP(KPKEYS_PKEY_DEFAULT, POE_RWX)
> Okay, this matches
>
> #define POR_EL0_INIT		POR_ELx_PERM_PREP(0, POE_RWX)
>
> Is there a good reason we need KPKEYS_PKEY_DEFAULT at all (and not similarly
> just hardcode it to 0)?

I did wonder about that. As per the discussion on patch 1 I don't see
that value ever changing, so I'm fine with hardcoding 0 if that feels
more consistent/intuitive.

> Just wondering, because apparently we didn't care about adding an indicator for
> user space pkey 0.

It's never too late to add a constant for userspace as well, but of
course since it's been ABI for so long the value isn't going to change.

>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +static inline bool arch_supports_kpkeys(void)
>> +{
>> +	return system_supports_poe();
>> +}
>> +
>> +#ifdef CONFIG_ARM64_POE
>> +
>> +static inline u64 por_set_kpkeys_context(u64 por, int ctx)
>> +{
>> +	por = por_elx_set_pkey_perms(por, KPKEYS_PKEY_DEFAULT, POE_RWX);
>> +
>> +	return por;
> Why not
>
> return por_elx_set_pkey_perms(por, KPKEYS_PKEY_DEFAULT, POE_RWX);
>
> ?

Because of patch 17, I wanted to minimise the diff. Happy to change it
if that feels less surprising.

> In light of API discussions, it would be nicer if arch_kpkeys_set_context()
> would just return the old context. But that would mean that restoring the
> context would require another read_sysreg_s(SYS_POR_EL1);

Correct, that's what I wanted to avoid.

> So instead of returning magic register values, that should be wrapped in some
> arch state struct as mentioned as reply to a previous patch.

Agreed.

>> +}
>> +
>> +static __always_inline void __kpkeys_set_pkey_reg_nosync(u64 pkey_reg)
>> +{
>> +	write_sysreg_s(pkey_reg, SYS_POR_EL1);
>> +}
>> +
>> +static __always_inline u64 arch_kpkeys_set_context(int ctx)
>> +{
>> +	u64 prev_por = read_sysreg_s(SYS_POR_EL1);
>> +	u64 new_por = por_set_kpkeys_context(prev_por, ctx);
> Both can be const.

Sure.

> But maybe you just use a single "por" variable.

Not sure how? prev_por is returned and new_por is based on its value.

>> +
>> +	__kpkeys_set_pkey_reg_nosync(new_por);
>> +	isb();
>> +
>> +	return prev_por;
>> +}
>> +
>> +static __always_inline void arch_kpkeys_restore_pkey_reg(u64 pkey_reg)
>> +{
>> +	__kpkeys_set_pkey_reg_nosync(pkey_reg);
>> +	isb();
> Why is that isb() for both callers outside of the function? Do you expect
> another user that doesn't need the isb?

Outside of __kpkeys_set_pkey_reg_nosync() that is? That function is also
used by patch 22, which doesn't want the ISB because we already have an
ISB somewhere else. The naming follows that of __set_pte_nosync().

- Kevin

