Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BD1EA4E3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnZsRVa7TKTu3rdGMbbBfS8yhleAx6uoxT6xF90O43I=; b=Rwz0FJkU4v3Dhv3uS7inSVvQ+l
	3wUNXvyw/mkxGbVi/e8y9nyzN+8Wuq4UrLcYhITl+p6s2GyE8ZB3aEo45hW84mR/VRhSLt8OzA0Cz
	7C+fZHCAKxXtrDvqPRhTXBI2Vs+sAEvsHMsRoVaxiun8bT6lIAvfc6p0sS2ts9ZQtVpBrGqZjTESJ
	xVq3AjZA/dQzoOFWyhVUH5jOVleUFmen0o+VM0A5BtaKSoq+LUtwuMUjNWnfZqD6PhRAf1yn8PAwn
	Xo1sdQefRyhj35lbtGJpAxXxk+M5jr7JfeC3bBi6RvKJlJWIJXUfKnhrqc3s/O92cwD/nqBlGAnOS
	c3LPw3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx66b-0000000DU91-1Sxx;
	Mon, 02 Mar 2026 16:26:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx66Y-0000000DU8f-18TY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DDB24336D;
	Mon,  2 Mar 2026 16:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B98C19423;
	Mon,  2 Mar 2026 16:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772468805;
	bh=kdYmkec+vibcZGizPRkgLEMx84dJqP3cy2bXqQiGjvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyGGH6hpbWifdwqL06YTWOp2jCkLAQLRupwY4AWdy7uM/ORn2LZ68eN3Ej780fkSJ
	 uZYhDiZtyYikwnFmrs2KSA00qp5Bwp4PskpXBZQ5M1MYPHgAz0HsVp4kd7EfX7unax
	 fvjZ8ue6hAWYTzKCbc7bv/LRysF/CdRQgA2GvlxSpfaD1gBIQnfuH/YyGqbIwsjJqm
	 A1HPXSHtHDV1gncgp++jOjBtX5pWU/WCo7wySnb98yKqNU6VQLkNcG60bbGx62eyog
	 e0tEqf4havobIDdFtijMkmsMAs1A0XcJEDYLUmQdsmYxFdvYWFW2Ltq+bRKpBW5zoN
	 WYcEd9PsF8J9A==
Date: Tue, 3 Mar 2026 00:08:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: runtime-const: save one instruction when
 ARM64_VA_BITS <= 48
Message-ID: <aaW16asneuOsKLKl@xhacker>
References: <20260225144613.30846-1-jszhang@kernel.org>
 <aaHHfCL4hdV4z9Uo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaHHfCL4hdV4z9Uo@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_082646_332067_29A3DF88 
X-CRM114-Status: GOOD (  24.64  )
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

On Fri, Feb 27, 2026 at 04:34:04PM +0000, Catalin Marinas wrote:
> On Wed, Feb 25, 2026 at 10:46:13PM +0800, Jisheng Zhang wrote:
> > Currently, the runtime_const_ptr() uses 4 instructions to move a long
> > imm to GP, but when ARM64_VA_BITS <= 48(which is true for android and
> > armbian), the top 8bits of runtime cont ptr is all '1', so we can make
>                     ^^^^^
>                     8 or 16?

16 ;)
> 
> > use of the movn instruction to construct the imm's top 8bits and lower
> > 16bits at the same time, thus save one instruction.
> 
> This works as long as KASAN_{SW,HW}_TAGS is disabled, otherwise the top
> byte of a pointer is not guaranteed to be 0xff. I think both
> filename_init() and dcache_init() can pass tagged pointers.

oops, you are right! I missed both: KASAN_SW_TAGS is disabled due to
overhead while KASAN_HW_TAGS doesn't work since I don't have the
platform. Will take care these two options in the future.
> 
> > diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
> > index be5915669d23..6797dd37d690 100644
> > --- a/arch/arm64/include/asm/runtime-const.h
> > +++ b/arch/arm64/include/asm/runtime-const.h
> > @@ -7,6 +7,8 @@
> >  /* Sigh. You can still run arm64 in BE mode */
> >  #include <asm/byteorder.h>
> >  
> > +#if CONFIG_ARM64_VA_BITS > 48
> 
> You could use VA_BITS, it's shorter, though if you add the KASAN checks
> it's a pretty long #if to copy all over the place. We could untag the
> pointer but it kind of defeats the purpose of enabling KASAN in the
> first place.

Usually, the runtime const ptr is set once during boot then read onlly
so IMHO we don't need KASAN to catch the ptr related memory bugs.

> 
> Given that Android enables KASAN_HW_TAGS by default, not sure we should
> bother with this change. Do you have any perf data to show that it's
> worth it?

Good question. I guess a micro benchmark just measure the 4 instructions
vs 3 instructions thus 25% saving can't persuade you to merge it. Let me
find or write a userspace program to iterate a deep directory to show
the improvement. Any hint is appreciated.

Thanks

