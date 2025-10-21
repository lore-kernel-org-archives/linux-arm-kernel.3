Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA1DCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JS0LeUwhlIw7hjeLiFOMMF88gibn32hLzkAIdUzT3+E=; b=m/ZMYyAgUbWqXcFnc6MgOXl5TS
	c0tmni9hisU/cBDp6O+SvlFmmdkN8vQYIVUNai3WY6145PHppHf87g/gC3JMBE66L2R7Zr+TJb1R0
	67PnLXY4DJl6cMoa1qnDrlRNBboaDvZmAR0UZh3dvBWVFa29/aClgN9mG27DIe2iiggfnuWmotZNV
	f5vF2SrZGR0IyceRqm3mCHAKJQ3UxBpCqe74k8hIUHqLC1XbvgW7MHNfUg9oHhL3e0qOTyCLxhwyA
	mWUy57tq6r3hMnKV1rij5k9WOZJPrAvWV0+t5rRaDXwyVkUDxKAJjNUSjvdbM1OVxUM/8jssUrGwq
	rtV8T25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDNH-0000000HKXf-2oKb;
	Tue, 21 Oct 2025 14:30:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDNF-0000000HKW3-1fHf;
	Tue, 21 Oct 2025 14:30:06 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761057000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JS0LeUwhlIw7hjeLiFOMMF88gibn32hLzkAIdUzT3+E=;
	b=TDjSEslf+74J5IkqxbH7EKFCeOy9rDtwyTAG4CBl91QecO/LOfBJuamaRgki19wnXmzo3L
	SqhHxTI7uj395SMVGnS8mInc+ldJ+4y14A+Tcar1t1rjk1P3oeuzs3c10NKrLSlp7vvjg1
	VO1O+FpON2MdfZDx3F07Yrx1LWm3Y1tfPuAVvpcu5B5UAr7m32Qar3mTzXGVgZBL/qgxSl
	M9opFpJxcueJycQLaJQ3wdIRJ/cBq2l9fv20bUR/0U+lK5gVKnfZf6PfXeExQ9Wlmv8R1s
	ZuvqMMx5rUW/pmozC8w6KZbofI1CcE3oULCQg5X4tGxerhKckq68CFYL4PWaaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761057000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JS0LeUwhlIw7hjeLiFOMMF88gibn32hLzkAIdUzT3+E=;
	b=gnEStIT2+yktjKDz7BaF+L145njHkg3c1jlLnNHRsA0/k3jev0BD99TtrH6ssZALtH2/2H
	tt8KIreM40BQSKDA==
To: David Laight <david.laight.linux@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
In-Reply-To: <20251020192859.640d7f0a@pumpkin>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de> <20251020192859.640d7f0a@pumpkin>
Date: Tue, 21 Oct 2025 16:29:58 +0200
Message-ID: <877bwoz5sp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_073005_738266_CE2706D3 
X-CRM114-Status: GOOD (  34.35  )
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

On Mon, Oct 20 2025 at 19:28, David Laight wrote:
> On Fri, 17 Oct 2025 12:09:08 +0200 (CEST)
> Thomas Gleixner <tglx@linutronix.de> wrote:
> That definitely looks better than the earlier versions.
> Even if the implementation looks like an entry in the obfuscated C
> competition.

It has too many characters for that. The contest variant would be:

for(u8 s=0;!s;s=1)for(typeof(u) t= S(m,u,s,e);!s;s=1)for(C(u##m##a,c)(t);!s;s=1)for(const typeof(u) u=t;!s;s=1)

> I don't think you need the 'masked' in that name.
> Since it works in all cases.
>
> (I don't like the word 'masked' at all, not sure where it came from.

It's what Linus named it and I did not think about the name much so far.

> Probably because the first version used logical operators.
> 'Masking' a user address ought to be the operation of removing high-order
> address bits that the hardware is treating as 'don't care'.
> The canonical operation here is uaddr = min(uaddr, guard_page) - likely to be
> a conditional move.

That's how it's implemented for x86:

>>  b84:	48 b8 ef cd ab 89 67 45 23 01  movabs $0x123456789abcdef,%rax
>>  b8e:	48 39 c7    	               cmp    %rax,%rdi
>>  b91:	48 0f 47 f8          	       cmova  %rax,%rdi

0x123456789abcdef is a compile time placeholder for $USR_PTR_MAX which is
replaced during early boot by the real user space topmost address. See below.

> I think that s/masked/sanitised/ would make more sense (the patch to do
> that isn't very big at the moment). I might post it.)

The real point is that it is optimized. It does not have to use the
speculation fence if the architecture supports "masking" because the CPU
can't speculate on the input address as the actual read/write address
depends on the cmova. That's similar to the array_nospec() magic which
masks the input index unconditionally so it's in the valid range before
it can be used for speculatively accessing the array.

So yes, the naming is a bit awkward.

In principle most places which use user_$MODE_access_begin() could
benefit from that. Also under the hood the scope magic actually falls
back to that when the architecture does not support the "masked"
variant.

So simply naming it scoped_user_$MODE_access() is probably the least
confusing of all.

>> If masked user access is enabled on an architecture, then the pointer
>> handed in to scoped_masked_user_$MODE_access() can be modified to point to
>> a guaranteed faulting user address. This modification is only scope local
>> as the pointer is aliased inside the scope. When the scope is left the
>> alias is not longer in effect. IOW the original pointer value is preserved
>> so it can be used e.g. for fixup or diagnostic purposes in the fault path.
>
> I think you need to add (in the kerndoc somewhere):
>
> There is no requirement to do the accesses in strict memory order
> (or to access the lowest address first).
> The only constraint is that gaps must be significantly less than 4k.

The requirement is that the access is not spilling over into the kernel
address space, which means:

       USR_PTR_MAX <= address < (1U << 63)

USR_PTR_MAX on x86 is either
            (1U << 47) - PAGE_SIZE (4-level page tables)
         or (1U << 57) - PAGE_SIZE (5-level page tables)

Which means at least ~8 EiB of unmapped space in both cases.

The access order does not matter at all.

>> +#define __scoped_masked_user_access(_mode, _uptr, _size, _elbl)					\
>> +for (bool ____stop = false; !____stop; ____stop = true)						\
>> +	for (typeof((_uptr)) _tmpptr = __scoped_user_access_begin(_mode, _uptr, _size, _elbl);	\
>
> Can you use 'auto' instead of typeof() ?

Compilers are mightily unhappy about that unless I do typecasting on the
assignment, which is not really buying anything.

>> +	     !____stop; ____stop = true)							\
>> +		for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;		\
>> +		     ____stop = true)					\
>> +			/* Force modified pointer usage within the scope */			\
>> +			for (const typeof((_uptr)) _uptr = _tmpptr; !____stop; ____stop = true)	\
>
> gcc 15.1 also seems to support 'const auto _uptr = _tmpptr;'

Older compilers not so much.

Thanks,

        tglx

