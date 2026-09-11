Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB359C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFZFzLU+j8zGYoJfi7wAIRgoAoWwhWRfPpTPi420EAw=; b=WccMAdAtzBUjzTxt3DxrO+vZmj
	KUn1v9rlyEQ49QO7n10RFatN9VXS3x1DATmDDP7oJJaRCdVJMW0NdWVL1H10INgQqVIS+6gaZLoFc
	iCufrPeKpuC4VUdznzg+NNI+NW2WvFI/cgE4uLiJCUktX1QSw5hw7M/ijAh2z7MfCYeOMXEiTFbCS
	IMliZkly8ToeFdHnK6Q0WwM3BjRwYHfwxdRagwiLLTJkerEvUz0nLIPkjB6Yc6pa1ulrB0fwU3+eI
	gI/zA5uHe4S3uiIELa9B/TC9zkp5GfSHV6wNqXRQoBouuOLDI7zoQDeK39bniVnD6SVjAVGU2AQXf
	m3wDcwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zfJ-0000000GXU3-0A2y;
	Fri, 11 Sep 2026 11:43:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zfG-0000000GXTL-1PPY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:43:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B22681655;
	Fri, 11 Sep 2026 04:43:22 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A51553F59E;
	Fri, 11 Sep 2026 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789127006; bh=ta82qRvpLbTuMvcPpvsizJtKFnj0c62EIcpwVjAC8FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDty84m4BpIC3uWJlujhyCSYF9RHuMfeT3hJIq9BuGcZ9sRyih/H/wZ4XEXupSY55
	 cVzfizxQW5vye6JsQlfPLUu7iQXafWAmjdQcz3yHceBQpvR6JyqXcfAA9cYfcxmBiE
	 bENIKq/wkCzwmdgEpABCo96CyL9gu8WCKg/FdxgE=
Date: Fri, 11 Sep 2026 12:43:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH v4 05/21] arm64: cmpxchg128: LSE: Remove redundant
 operands
Message-ID: <aqPpU2fHtK4CXOc6@J2N7QTR9R3>
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-6-mark.rutland@arm.com>
 <1b0a435e-68c1-46c2-8fc0-310694728772@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b0a435e-68c1-46c2-8fc0-310694728772@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_044330_414621_B3E22305 
X-CRM114-Status: GOOD (  16.89  )
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
Cc: ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2026 at 11:06:48AM +0100, Vladimir Murzin wrote:
> On 9/8/26 16:17, Mark Rutland wrote:
> > @@ -291,15 +291,13 @@ __lse__cmpxchg128##name(volatile u128 *ptr, u128 old, u128 new)		\
> >  	register unsigned long x1 asm ("x1") = o.high;			\
> >  	register unsigned long x2 asm ("x2") = n.low;			\
> >  	register unsigned long x3 asm ("x3") = n.high;			\
> > -	register unsigned long x4 asm ("x4") = (unsigned long)ptr;	\
> >  									\
> >  	asm volatile(							\
> >  	__LSE_PREAMBLE							\
> >  	"	casp" #mb "\t%[old1], %[old2], %[new1], %[new2], %[v]\n"\
> >  	: [old1] "+&r" (x0), [old2] "+&r" (x1),				\
> >  	  [v] "+Q" (*(u128 *)ptr)					\
> > -	: [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4),		\
> > -	  [oldval1] "r" (o.low), [oldval2] "r" (o.high)			\
> 
> Both 'old1' and #old are read and write and that reflected by '+' constraint modifier.
> However, I do not fully understand why we need earlyclobber for them:
>  - they are not written before read
>  - we already constrained registers, so they do not overlap
>  - cmpxchg few lines above doesn't need it

I agree that the earlyclobber shouldn't be necessary for 'old1' or
'old2'. I expect it shouldn't have a negative effect on code generation
here, as removing it doesn't give the compiler any new freedom to
allocate registers differently, but maybe it causes the compiler to do a
bit more work internally.

I'll leave this patch as-is for now, but I am happy to delete the
earlyclobber in a subsequent patch (or to ack a patch doing so), if
people want?

> I had a look at ll/sc counterpart and both earlyclobebr and '=' constraint modifier
> make sense there, since we do not want registers to overlap and they are written.
> 
> I admit might be missing something. Anyway, FWIW

I don't think you're missing anything here. I suspect we just
copy-pasted the LL/SC constraints without thinking too hard when this
was added in commit:

  b23e139d0b66c021 ("arch: Introduce arch_{,try_}_cmpxchg128{,_local}()")

> Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

Thanks!

Mark.

> 
> > +	: [new1] "r" (x2), [new2] "r" (x3)				\
> >  	: cl);								\
> >  									\
> >  	r.low = x0; r.high = x1;					\
> > -- 2.30.2
> > 
> 

