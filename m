Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6267DF43848
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOMJEclslTGko0CKo3zJ9nnmBRPTykeI0IPan0usj1E=; b=CPpmYiKJO/YJK8j2READMA9eeX
	G2nmMiJDH4+Rk+tYhshkGMCqkI74UG9F2rQi0lgrBnKPzatmrXbBdnT/p63ynk8GF14Ee1PjKkfN1
	y1Gy3nO2X+CkBJ+2AAAZi1aDAZK9FXmqSrg7I+SqNM24MSP8XgbFIvEKYIn8n3ChSFJMwE7BHB3wU
	TdkJz+e8oJYOVWPWdIh7Ofo2OTpN6VgzeY8jW7LR5tB+65rxNAz4s1cQLusf5LQZ2lsBlZACycti1
	m/KbY2/xkFC/88+dAaA+x6LJwTC9g2bghzv9vhRVcn02LeCDUvii9slqOyXhHFWtnMYjSgj6WS4eN
	qP+cdS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2Vm-00000001LS0-2tom;
	Wed, 15 Apr 2026 15:50:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2Vk-00000001LRf-410Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:50:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77E3F3543;
	Wed, 15 Apr 2026 08:50:33 -0700 (PDT)
Received: from [10.57.61.135] (unknown [10.57.61.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AC703F7B4;
	Wed, 15 Apr 2026 08:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776268239; bh=KOMJEclslTGko0CKo3zJ9nnmBRPTykeI0IPan0usj1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hR3+dovgqaAoCeD7Tj26ImE/aKDrkOG7n2ey9QHxI3X9difSYSy69sYtkr08iAEHk
	 fyQlQqCCEJG3ZsAktdUrlv/o6tLioBkfsevEDHaXxc5Hh//9nV+0z8WKgSU1JBm0v0
	 6SAa+zLxImrdvyYlNd1yAhbhoIUq82FWMkSjwMhM=
Message-ID: <fea9c939-f955-4020-bed6-427e592f0024@arm.com>
Date: Wed, 15 Apr 2026 17:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/30] mm: Introduce kpkeys
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
 <20260227175518.3728055-2-kevin.brodsky@arm.com>
 <eaca640b-5006-489b-8b2d-148a3c4073da@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <eaca640b-5006-489b-8b2d-148a3c4073da@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_085041_096451_F6FF58CB 
X-CRM114-Status: GOOD (  20.45  )
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

On 15/04/2026 15:00, David Hildenbrand (Arm) wrote:
> On 2/27/26 18:54, Kevin Brodsky wrote:
>> kpkeys is a simple framework to enable the use of protection keys
>> (pkeys) to harden the kernel itself. This patch introduces the basic
>> API in <linux/kpkeys.h>: a couple of functions to set and restore
>> the pkey register and macros to define guard objects.
>>
>> kpkeys introduces a new concept on top of pkeys: the kpkeys level.
>> Each level is associated to a set of permissions for the pkeys
>> managed by the kpkeys framework. kpkeys_set_level(lvl) sets those
>> permissions according to lvl, and returns the original pkey
>> register, to be later restored by kpkeys_restore_pkey_reg(). To
>> start with, only KPKEYS_LVL_DEFAULT is available, which is meant
>> to grant RW access to KPKEYS_PKEY_DEFAULT (i.e. all memory since
>> this is the only available pkey for now).
>>
>> Because each architecture implementing pkeys uses a different
>> representation for the pkey register, and may reserve certain pkeys
>> for specific uses, support for kpkeys must be explicitly indicated
>> by selecting ARCH_HAS_KPKEYS and defining the following functions in
>> <asm/kpkeys.h>, in addition to the macros provided in
>> <asm-generic/kpkeys.h>:
> I don't quite understand the reason for using levels. Levels sounds like
> it would all be in some ordered fashion, where higher levels have access
> to lower levels.

That was originally the idea indeed, but in practice I don't expect
levels to have a strict ordering, as it's not practical for composing
features.

> Think of that as a key that can unlock all "lower" locks, not just a
> single lock.
>
> Then, the question is about the ordering once we introduce new
> keys/locks. With two, it obviously doesn't matter :)
>
> So naturally I wonder whether levels is really the right abstraction
> here, and why we are not simply using "distinct" keys, like
>
> KPKEY_DEFAULT
> KPKEY_PGTABLE
> KPKEY_SUPER_SECRET1
> KPKEY_SUPER_SECRET2
>
> Is it because you want KPKEY_PGTABLE also be able to write to KPKEY_DEFAULT?

Right, and in general a given level may be able to write to any number
of pkeys. That's why I don't want to conflate pkeys and levels. Agreed
that "level" might not be the clearest term though, since there's no
strict ordering.

> But how would you handle KPKEY_SUPER_SECRET1 and KPKEY_SUPER_SECRET2 then?

Presumably those would also have access to KPKEY_DEFAULT. However, if
you consider the reverse situation where the level is less privileged
than the default (say an eBPF program), then write access to
KPKEY_DEFAULT would not be granted.

Also worth noting on the notion of level that POE2 will bring further
per-level restrictions, besides which pkeys can be accessed. For
instance, we could prevent an unprivileged level from executing certain
instructions. This isn't in scope for this series, but this is a
consideration in the design of the kpkeys abstractions.

- Kevin

