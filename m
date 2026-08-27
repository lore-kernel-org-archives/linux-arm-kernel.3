Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D99C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34Dtmvt3zN7M94TyOsy1MTVXxuVNaJjKTkKoeC0jces=; b=DY2TXhi6SKjGVLvzxq1t/HLLNw
	tka83kYt+BnVg5bxE0XhhX9xUk6c68gAGZ1hOi+ghckKrJTfdMy2ieWBqmLZ9GbdAvWolFhGPHKv8
	7ER1F9Hii7YmtDwuT4JhECSYHuDypjR0gS3NezPqBv6pYOa90az3U/AwJpHCmb0Y5HjBCLQKzXyUU
	Q0c8OQ/qFk3+Rgxh5tMWAsWvelo/WByjk7B6eyzkBEh7mDqrgk1kfpNj1ebg2soBCrj7vdah15qmi
	q7wontMij0Kwcq6Lkf5E8IbyhBqAEIlc3fsW1J4li84Wy9PxnNSDcj8VzoVhFBuuVbvDJxKEjfOTo
	FQ82MvMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzePG-00000004XxB-3uQf;
	Thu, 27 Aug 2026 18:00:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzePC-00000004XuJ-1wGH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:00:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EEAF54048B;
	Thu, 27 Aug 2026 18:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E93B1F000E9;
	Thu, 27 Aug 2026 18:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787853649;
	bh=34Dtmvt3zN7M94TyOsy1MTVXxuVNaJjKTkKoeC0jces=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VEa7iod/ZA7FsZJcJpxmzSDKvjcN95PR5Qd4ONhy+hVd95mVVp1QMNtbgFnN7W7iU
	 I6icjmCX6987khWYGgiV1XM9/c5RgKHfBh5g/ST1JN1iSzw7qpLwNNfyDWsx89XHaj
	 DKHZEoGJ0Gc4xGGRvYbLIskyHsA9Y+GO2peSvKBIDZpzt5GPtEVovQ2cBuv34ofuGt
	 AtjCDDHVI5rsOrIHMXawVh8rtL6BRhv/VPcXZOzE3cf5CNeOyxVGF7o6vtkuu3hlVX
	 6OsChegan7zURJI9Gy/2OdBv028AOv0S7VLqdq67Ze8OZsRQ792wZ7qBXsqN3gXj+P
	 1q/uz0r3i8bkw==
Message-ID: <f082aff3-ec63-48fa-94c5-159ca0c5a33e@kernel.org>
Date: Thu, 27 Aug 2026 20:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 01/25] mm: Introduce kpkeys
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-hardening@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
 Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, Linus Walleij <linusw@kernel.org>,
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
 <20260818-kpkeys-v9-1-743ad31b2c8f@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260818-kpkeys-v9-1-743ad31b2c8f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 8/18/26 16:08, Kevin Brodsky wrote:
> kpkeys is a simple framework to enable the use of protection keys
> (pkeys) to harden the kernel itself. This patch introduces the basic
> API in <linux/kpkeys.h>: a couple of functions to enter/leave a
> kpkeys context and macros to define guard objects.
> 
> kpkeys introduces a new concept on top of pkeys: the kpkeys context.
> Each context is associated with a set of permissions for the pkeys
> managed by the kpkeys framework. kpkeys_enter_context(ctx) sets
> those permissions according to ctx, and returns the original kpkeys
> state (typically the arch-specific pkeys register) that is later
> restored by calling kpkeys_leave_context(). To start with, only
> KPKEYS_CTX_DEFAULT is available, which is meant to grant RW access
> to KPKEYS_PKEY_DEFAULT (i.e. all memory since this is the only
> available pkey for now).
> 
> The underlying representation of each kpkeys context is entirely
> architecture-specific. Support for kpkeys must be explicitly
> indicated by selecting ARCH_HAS_KPKEYS and defining the following
> functions in <asm/kpkeys.h>:
> 
> * arch_kpkeys_enter_context()
> * arch_kpkeys_leave_context()
> * arch_supports_kpkeys()
> 
> Additionally, <asm/kpkeys_types.h> must define struct arch_kpkeys_state,
> which typically provides storage for the pkeys register.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  include/linux/kpkeys.h       | 104 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/kpkeys_types.h |  25 +++++++++++
>  mm/Kconfig                   |   2 +
>  3 files changed, 131 insertions(+)
> 
> diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
> new file mode 100644
> index 000000000000..eac522f55214
> --- /dev/null
> +++ b/include/linux/kpkeys.h
> @@ -0,0 +1,104 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _LINUX_KPKEYS_H
> +#define _LINUX_KPKEYS_H
> +
> +#include <linux/bug.h>
> +#include <linux/cleanup.h>
> +#include <linux/kpkeys_types.h>
> +
> +/**
> + * KPKEYS_GUARD_NOOP() - define a guard type that does nothing
> + * @name: the name of the guard type
> + *
> + * Define a guard type that does nothing, useful to match a real guard type
> + * that is defined under an #ifdef.
> + */
> +#define KPKEYS_GUARD_NOOP(name)						\
> +	__DEFINE_CLASS_IS_CONDITIONAL(name, false);			\
> +	DEFINE_CLASS(name, bool, (void)_T, false, void);		\
> +	static inline void *class_##name##_lock_ptr(bool *_T)		\
> +	{ return _T; }
> +
> +#ifdef CONFIG_ARCH_HAS_KPKEYS
> +
> +#include <asm/kpkeys.h>
> +
> +/**
> + * KPKEYS_GUARD_COND() - define a guard type that conditionally switches to
> + *                       a given kpkeys context
> + * @name: the name of the guard type
> + * @ctx: the kpkeys context to switch to
> + * @cond: an expression that is evaluated as condition
> + *
> + * Define a guard type that switches to @ctx if @cond evaluates to true,
> + * and does nothing otherwise.
> + */
> +#define KPKEYS_GUARD_COND(name, ctx, cond)				\
> +	__DEFINE_CLASS_IS_CONDITIONAL(name, false);			\
> +	DEFINE_CLASS(name, struct kpkeys_state,				\
> +		     kpkeys_leave_context(&_T),				\
> +		     (cond) ? kpkeys_enter_context(ctx) :		\
> +			      (struct kpkeys_state) {}, void);		\
> +	static inline							\
> +	void *class_##name##_lock_ptr(struct kpkeys_state *_T)		\
> +	{ return _T; }
> +
> +/**
> + * KPKEYS_GUARD() - define a guard type that switches to a given kpkeys context
> + *                  if kpkeys are supported
> + * @name: the name of the guard type
> + * @ctx: the kpkeys context to switch to
> + *
> + * Define a guard type that switches to @ctx if the system supports kpkeys.
> + */
> +#define KPKEYS_GUARD(name, ctx)						\
> +	KPKEYS_GUARD_COND(name, ctx, kpkeys_supported())
> +
> +/**
> + * kpkeys_enter_context() - enter a kpkeys context
> + * @ctx: the context to switch to
> + *
> + * Enters the specified kpkeys context. @ctx must be a compile-time constant.
> + *
> + * Return: state to be passed to kpkeys_leave_context().
> + */
> +static __always_inline
> +struct kpkeys_state kpkeys_enter_context(enum kpkeys_ctx ctx)
> +{
> +	BUILD_BUG_ON_MSG(!__builtin_constant_p(ctx),
> +			 "kpkeys_enter_context() only takes constant values");
> +	BUILD_BUG_ON_MSG(ctx < 0 || ctx >= KPKEYS_CTX_COUNT,
> +			 "Invalid value passed to kpkeys_enter_context()");
> +
> +	return arch_kpkeys_enter_context(ctx);
> +}
> +
> +/**
> + * kpkeys_leave_context() - leave a kpkeys context
> + * @state: state returned by kpkeys_enter_context()
> + *
> + * Restores the state saved when entering a kpkeys context. If no context was
> + * entered, this function does nothing.
> + */
> +static __always_inline
> +void kpkeys_leave_context(const struct kpkeys_state *state)
> +{
> +	if (state->entered_context)
> +		arch_kpkeys_leave_context(state);
state->entered_context is a common code variable, but it's not set by
commoncode. Is there a reason?

IOW, should arch_kpkeys_enter_context() only return the arch parts, and
entered_context would be set in common code?

Also, should entering bail out if the context was already entered.

Last but not least, when would we expect to call kpkeys_leave_context() but the
context was not entered?

If this is really arch-specific stuff, probably it should go entirely into arch
doe. If this is common code stuff, likely it should be maintained entirely in
common code.


Overall this looks much cleaner to me compared to what I reviewed the last time
(was that v8? I don't remember :D )


-- 
Cheers,

David

