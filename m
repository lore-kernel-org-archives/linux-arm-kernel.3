Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D038C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XawQTOQeMrC2goaYpbqyNPdZ1yS9UOUVP9VgBUrnkUk=; b=O2IpvWr3OpWJdGgZAeyIf23jEq
	MUmnH8eHC+lLGe/QqKINaib4HJwoJMKUbk/ajHZdZkUCAjZUVY9jpp41oI7WbTce3OXW5boCYmEBL
	xfI4BXHRO2ng31einpVQmoaJ03Kfc36BwQK4OBKvKCA0kLydS+kURpg2TX5xP5fG9X86q6xLpeiv2
	pL3mZDLM4nKiFZjOuooWZnZLvWz0TbsDJlIJkpQxooYcZtW/zhIkTKWBrHIIX8WD4PWAQGaJtoO/R
	vwBA7zSmYV+Qag2CL+NGuSInraLcC7rpaNDrnYE7CJFC9mGH6u1yg+yta9bw4Ki+d+B9I2VgBR5RW
	2JLTf/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUXX-0000000GMks-0K19;
	Tue, 30 Jun 2026 09:13:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUXV-0000000GMkf-1j6O
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XawQTOQeMrC2goaYpbqyNPdZ1yS9UOUVP9VgBUrnkUk=; b=hT2hU8gwGY7lAxfz0tRbk3meBZ
	VW8mxTmiGEqY8mwPzpNN7ROJVv5gZbCBUfQXqF31nds8ccPxFxbAcoBf0F+iItn0tS8y/iP5c+9u7
	HYBLbP1rlBWEb6m12sQiZzcrUGsKs2efQOpRL6nkRqqpB/Qxa3QIwjqYQz+eKY7V0eR62ElxmNyr1
	GW/GFefUiiVLdTTQnnbMOCcvJXpPc7iiLuKi+OIWIn2aDH1jVx/+u/TOm3VEWfdNMOYoTqFB2vBg2
	zBk1YOXRgOQj4hPpja46n505txy3bQkq+RM+V2njI8/ntz2RPgt3GKJXJiJTed6PmXoEN+K0BQd76
	BqBCKIcQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weUXR-00000001h45-0kV0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:13:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1060E2C1C;
	Tue, 30 Jun 2026 02:13:47 -0700 (PDT)
Received: from [10.57.81.132] (unknown [10.57.81.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5203D3FAFB;
	Tue, 30 Jun 2026 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782810831; bh=xfhzNa7i/skfAP7X8l/W5lXDtIlKtNWwDUgCZO/Necw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W+spzFSPXCTHtXozMKrEXROXtZhxJU1ZPPwnZbwUuHnyjZLPYrxvGDhFIL3bT4ggq
	 MIMuLnGKJR2VyWXW20lFvLPHd4hXWwG0VjLZkDBmx8IkF/PxK+cQ9Gg40yaSIymMfM
	 rwPOWCXB4qduy/a+rMan2D1x3U+Zv8qM31+xwRAc=
Message-ID: <cc586a87-871e-4b13-a4fd-f7c0757dc602@arm.com>
Date: Tue, 30 Jun 2026 11:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v8 01/24] mm: Introduce kpkeys
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
 <20260526-kpkeys-v8-1-eaaacdacc67c@arm.com>
 <70f4dcdf-c45f-47d3-91df-a7897bd86ff4@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <70f4dcdf-c45f-47d3-91df-a7897bd86ff4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_101353_940635_ADD10025 
X-CRM114-Status: GOOD (  37.85  )
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

On 16/06/2026 17:19, David Hildenbrand (Arm) wrote:
> On 5/26/26 13:15, Kevin Brodsky wrote:
>> kpkeys is a simple framework to enable the use of protection keys
>> (pkeys) to harden the kernel itself. This patch introduces the basic
>> API in <linux/kpkeys.h>: a couple of functions to set and restore
>> the pkey register and macros to define guard objects.
>>
>> kpkeys introduces a new concept on top of pkeys: the kpkeys context.
>> Each context is associated to a set of permissions for the pkeys
>> managed by the kpkeys framework. kpkeys_set_context(ctx) sets those
>> permissions according to ctx, and returns the original pkey
>> register, to be later restored by kpkeys_restore_pkey_reg(). To
>> start with, only KPKEYS_CTX_DEFAULT is available, which is meant to
>> grant RW access to KPKEYS_PKEY_DEFAULT (i.e. all memory since this
>> is the only available pkey for now).
>>
>> Because each architecture implementing pkeys uses a different
>> representation for the pkey register, and may reserve certain pkeys
>> for specific uses, support for kpkeys must be explicitly indicated
>> by selecting ARCH_HAS_KPKEYS and defining the following functions in
>> <asm/kpkeys.h>, in addition to the macros provided in
>> <asm-generic/kpkeys.h>:
>>
>> - arch_kpkeys_set_context()
>> - arch_kpkeys_restore_pkey_reg()
> Looking at this, and wondering about "why do we get registers involved in this
> API" I would probably have an interface like:
>
> 	arch_kpkeys_enter_context()
> 	arch_kpkeys_leave_context()
>
> Whereby you return a "struct kpkeys_state" or sth like that.
>
> You could either let the architecture define what's in the state, or
> alternatively store some generic data in there as well.
>
> struct kpkeys_state {
> 	bool entered_context;
> 	struct arch_pkey_state arch;
> };
>
> Maybe the "entered_context" or however you would want to call it could avoid the
> KPKEYS_PKEY_REG_INVAL (which confuses me ;) )?

Yep that would do the trick. And would make Sashiko happier too, using a
magic register value isn't great ;)

> But the KPKEYS_PKEY_REG_INVAL usage confuses me. I understand the
> KPKEYS_GUARD_COND + kpkeys_restore_pkey_reg() one, but not the one where
> arch_kpkeys_set_context() would return that value.

Right, that's used in a follow-up series to protect struct cred, so that
unnecessary switches are avoided in case of nesting [1]. I wonder if I
shouldn't fold that patch into this one. I don't think nesting is likely
to occur in this series, but the extra branch probably doesn't add much
cost either (it's easily predicted).

[1]
https://lore.kernel.org/linux-mm/20250815090000.2182450-2-kevin.brodsky@arm.com/

>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  include/asm-generic/kpkeys.h |  17 ++++++
>>  include/linux/kpkeys.h       | 122 +++++++++++++++++++++++++++++++++++++++++++
>>  mm/Kconfig                   |   2 +
>>  3 files changed, 141 insertions(+)
>>
>> diff --git a/include/asm-generic/kpkeys.h b/include/asm-generic/kpkeys.h
>> new file mode 100644
>> index 000000000000..ab819f157d6a
>> --- /dev/null
>> +++ b/include/asm-generic/kpkeys.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_GENERIC_KPKEYS_H
>> +#define __ASM_GENERIC_KPKEYS_H
>> +
>> +#ifndef KPKEYS_PKEY_DEFAULT
>> +#define KPKEYS_PKEY_DEFAULT	0
>> +#endif
> Do we currently expect an architecture to overwrite this? How does this interact
> with KPKEYS_CTX_DEFAULT?

That's a fair point, pkey 0 being the default is pretty much hardcoded
and I don't see that ever changing.

The value isn't coupled to that of KPKEYS_CTX_DEFAULT, which is purely
symbolic.

> Nobody in this patch uses it, so maybe it should be added where actually needed.

Agreed, the ifdefery can be removed.

>> [...]
>>
>> +/**
>> + * kpkeys_set_context() - switch kpkeys context
>> + * @ctx: the context to switch to
>> + *
>> + * Switches to specified kpkeys context. @ctx must be a compile-time
>> + * constant. The arch-specific pkey register will be updated accordingly, and
>> + * the original value returned.
> Are these arch details and registers relevant? Ideally, we'd keep it very simple
> here ...
>
>> + *
>> + * Return: the original pkey register value if the register was written to, or
>> + *         KPKEYS_PKEY_REG_INVAL otherwise (no write to the register was
>> + *         required).
> ... and here. Not sure if any caller cares about these details. Again, with some
> abstract state we could maybe handle that internally.
>
> "Return: the pkey state to pass to kpkeys_restore_pkey_reg" (or however that
> function will be called)

Yep agreed.

>> + */
>> +static __always_inline u64 kpkeys_set_context(int ctx)
>> +{
>> +	BUILD_BUG_ON_MSG(!__builtin_constant_p(ctx),
>> +			 "kpkeys_set_context() only takes constant values");
>> +	BUILD_BUG_ON_MSG(ctx < KPKEYS_CTX_MIN || ctx > KPKEYS_CTX_MAX,
>> +			 "Invalid value passed to kpkeys_set_context()");
>> +
>> +	return arch_kpkeys_set_context(ctx);
>> +}
>> +
>> +/**
>> + * kpkeys_restore_pkey_reg() - restores a pkey register value
>> + * @pkey_reg: the pkey register value to restore
>> + *
>> + * This function is meant to be passed the value returned by
>> + * kpkeys_set_context(), in order to restore the pkey register to its original
>> + * value (thus restoring the original kpkeys context).
>> + */
>> +static __always_inline void kpkeys_restore_pkey_reg(u64 pkey_reg)
>> +{
>> +	if (pkey_reg != KPKEYS_PKEY_REG_INVAL)
>> +		arch_kpkeys_restore_pkey_reg(pkey_reg);
>> +}
>> +
>> +static inline bool kpkeys_enabled(void)
> Is the enabled vs. supported intentional?

That's a fair point. It is intentional for
kpkeys_hardened_pgtables*_enabled() in patch 11: on arm64,
arch_supports_kpkeys*() always return true if POE is detected, while
kpkeys_hardened_pgtables*_enabled() also require
CONFIG_KPKEYS_HARDENED_PGTABLES=y.

For kpkeys_enabled() the condition is CONFIG_ARCH_HAS_KPKEYS=y, which is
always true if we support POE. So it would be reasonable to rename it to
kpkeys_supported() (and maybe more intuitive, since it doesn't imply any
functional change).


Thanks for the very useful suggestions and sorry for the late replies!

- Kevin

>> +{
>> +	return arch_supports_kpkeys();
>> +}
>> +
>
>

