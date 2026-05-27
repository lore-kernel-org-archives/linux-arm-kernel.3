Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EC8CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sv59KgmPS9YwACthNWBPKz9+XMUx70b0VSrwo1dUH0g=; b=0J5U+DpiftltKb1xAZ4LB6QT42
	PW3qKilCvsVm7ze3tKzlZFruoqqtwCTm2RyUfg+pxDGj7hGz1DVdEIxeqfrfeQQSCauFxbjTaP0lS
	tzkw5yZtpa7eJE0tYSzxxvUcPcd7xoE1TIUbywItkqoFdHMzeMXfYj1IDnocfMDKw7zXXs1rXuzVf
	QY0fRlDyaE8FWoxkHdYkQKZolZoRmczvCQSlZKthYl56/TOxEByjaiD1uQjdzguZRCl5jyLzJyNVY
	0qrcHrMWCgmjNYVU0wYr0H4iTJjywzs3etm7XdTyveG0Uw7q1w5uAX+cwI0y0fLLfjy3njtwz3Q6b
	CgFJrZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Yy-00000003XVb-1Aqm;
	Wed, 27 May 2026 08:24:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Yv-00000003XVE-1YK1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:24:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBA6B2880;
	Wed, 27 May 2026 01:24:16 -0700 (PDT)
Received: from [10.57.93.47] (unknown [10.57.93.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EE113F7D8;
	Wed, 27 May 2026 01:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779870261; bh=bL0SGvpJMA0jKAYtYfSGI2V/YyddodRJo0fhchnToSo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kfnU3J8365dlkSur+Ghyy3KcliIFgbIFf/gzBx99N+i08GclVyKtMVVzUswqs3S9H
	 BbFy3b02pCkmlZFcMYymisrIST9qibyRe//b/zxYjemYcHtRq1ZAzuRlvchaO3WnEr
	 CFON8PFlu+HITiEmjXFYRSAySy6bNgRNL0wPH9wg=
Message-ID: <b4eb4ea8-f4d6-4be2-81b1-4a8a46abe94e@arm.com>
Date: Wed, 27 May 2026 10:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v8 01/24] mm: Introduce kpkeys
To: Linus Walleij <linusw@kernel.org>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Ira Weiny
 <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
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
 <CAD++jLnURXzgAgkWCcYX0dLOLqHQw+gn96V1dzDa_0Aoi3430Q@mail.gmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <CAD++jLnURXzgAgkWCcYX0dLOLqHQw+gn96V1dzDa_0Aoi3430Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_012425_499176_7E63166F 
X-CRM114-Status: GOOD (  30.94  )
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

On 26/05/2026 15:17, Linus Walleij wrote:
> Hi Kevin,
>
> here is just a few drive-by review comments pertaining to the
> API which will be used for all architectures wanting to use
> pkeys.

Appreciated, thanks!

> [...]
>
>> Because each architecture implementing pkeys uses a different
>> representation for the pkey register, and may reserve certain pkeys
>> for specific uses, support for kpkeys must be explicitly indicated
>> by selecting ARCH_HAS_KPKEYS and defining the following functions in
>> <asm/kpkeys.h>, in addition to the macros provided in
>> <asm-generic/kpkeys.h>:
>>
>> - arch_kpkeys_set_context()
>> - arch_kpkeys_restore_pkey_reg()
>> - arch_supports_kpkeys()
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> I'm following so far.
>
> Is there no need for something like
>
> ctx = arch_kpkeys_request_context(KEY_TYPE) ?
>
> I'm just thinking of the scenario that e.g. two architectures want
> to request the same type of key for some generic resource, but
> the underlying implementation is vastly different for the two
> architectures, so relying on hard-coded arch-specific constants
> may not work. I'm also thinking about archs supporting different
> versions/types of kpkeys in a multi-platform executable kernel
> that may execute on several different silicon with the same ISA.

I'm not sure I understand what potential limitations this is trying to
address. The only thing that is imposed by the framework is the value of
KPKEYS_CTX_*, which is purely symbolic. Everything else is up to the
architecture, including the value of each key (which could be determined
at runtime if needed) and the permissions associated to each context.

Conceptually a context is a set of permission overlays for all existing
keys, it doesn't have to be tied to just one key.

> Maybe this is too much upfront design, I understand it needs to
> be kept simple.
>
>> +#ifndef KPKEYS_PKEY_DEFAULT
>> +#define KPKEYS_PKEY_DEFAULT    0
>> +#endif
> (...)
>> +#define KPKEYS_CTX_DEFAULT     0
>> +
>> +#define KPKEYS_CTX_MIN         KPKEYS_CTX_DEFAULT
>> +#define KPKEYS_CTX_MAX         KPKEYS_CTX_DEFAULT
> I was thinking an enum:
>
> enum kpkey_type {
>     KPKEY_DEFAULT = 0,
>     KPKEY_MMU_TABLE = 1,
>    ....
> };
>
> since this is what is used later.
>
>> +/**
>> + * kpkeys_set_context() - switch kpkeys context
>> + * @ctx: the context to switch to
>> + *
>> + * Switches to specified kpkeys context. @ctx must be a compile-time
>> + * constant. The arch-specific pkey register will be updated accordingly, and
>> + * the original value returned.
>> + *
>> + * Return: the original pkey register value if the register was written to, or
>> + *         KPKEYS_PKEY_REG_INVAL otherwise (no write to the register was
>> + *         required).
>> + */
>> +static __always_inline u64 kpkeys_set_context(int ctx)
> Should ctx be unsigned here? I'm nor sure what a negativ context
> would mean.
> kpkeys_set_context(unsigned int ctx)

That's a good point, now that we say "context" and not "level" an enum
would be a better representation. I would directly use:

    u64 kpkeys_set_context(enum kpkeys_ctx ctx);

... unless we really need another layer of abstraction.

- Kevin

> And then I was thinking:
>
> unsigned int kpkeys_request_context(enum kpkey_type type) {}...
>
> + arch_ -prefixed version of the same.
>
> unsigned int ctx;
> ctx = kpkeys_request_context(KPKEY_MMU_TABLE);
> (...)
>
> Constant sinking in the compiler will optimize the arch
> function to a constant in the object code so it will still
> be fast just a bit more talkative in source form.
>
> Yours,
> Linus Walleij

