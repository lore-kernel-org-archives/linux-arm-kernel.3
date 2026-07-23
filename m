Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C0AC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbh5oIqumP3TZ7I91UCicSqtwO14EdOWWi0koNVordQ=; b=AEl+gROfnwofke/DSfHpD1PpAB
	hMTTuAnn/lVvRtRFiR18iOtO3KRQNLrdf9De2uxSxqaZk9ILMTSj5SW/60ytUrpcG4ZVSkZ7hOvH2
	L8tddnYzj/TtGgr7DM76NL65Q1FpsA17K5FnCYIgLPVNZ3aaNywsrSqqgwykRTXXlmsbZqddZKKds
	4f3klMaKtbAzrCkhZtvBdmE0uJHvV/svT6R+8iLFmteXNzhb8sbnpoeFfHLimIR0yyCptWimcVr0h
	bxraor4xc9mMHGvlMidrf29aQKW1ZZzFB0Bat3AZRI8nQLBslig0Q904qLmdpl1D1D/t91k2zBd94
	ynMb+l9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyHu-0000000EtoS-35GV;
	Thu, 23 Jul 2026 18:36:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyHr-0000000Etnr-0xkv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 18:36:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E291F1477;
	Thu, 23 Jul 2026 11:36:44 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73B903F59E;
	Thu, 23 Jul 2026 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784831809; bh=mt4YKmyqwblZu9Yi/XK+TWV4gvlyCaMDaWwZh9mOHSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZWTwap8LUuuI9s1Cu7RkzZ8/8pwlagag+aLHpq8IeilVnafnyQGjgfQqvZcN/AIl
	 3aoTV+zepbO/VOAkxw8e7KdjPm6ulDYQSjxxndvEvzalJm1KJQYL5POL3lov2UJS76
	 tTUmBvHLSFLfyPOnCka080375ebci15FP2IVAmk8=
Date: Thu, 23 Jul 2026 19:36:46 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v2] arm64: futex: Consolidate 'old == new' check in
 __lsui_cmpxchg32()
Message-ID: <amJfPgqDirZz2w2E@e129823.arm.com>
References: <20260723130304.3161-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723130304.3161-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_113651_462300_74A0DC2B 
X-CRM114-Status: GOOD (  25.40  )
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

> The LSUI futex implementation relies on a cmpxchg() loop to implement
> FUTEX_OP_XOR, as the architecture doesn't provide unprivileged *EOR
> atomics. Since the unprivileged 'CAST' instructions used to implement
> the cmpxchg() can only operate on 64-bit memory locations, the
> __lsui_cmpxchg32() helper function performs a song and dance to marshall
> the 32-bit futex value into the correct part of a 64-bit register and
> fill the remaining bytes with the neighbouring data.
> 
> A consequence of this structure is that the 'CAST' failure/success
> condition ends up being split into two separate 32-bit checks across
> __lsui_cmpxchg32() and its caller. This is a little fiddly to read and
> introduces some additional local variables which can be avoided if the
> check is done in one place.
> 
> Tweak __lsui_cmpxchg32() so that it performs the full 64-bit check on
> the value returned from the 'CAST' instruction and returns success to
> its caller only in the case that the cmpxchg() operation has succeeded.
> With that in place, simplify the outer loop in __lsui_futex_atomic_eor()
> to pass 'oldval' by reference and return unless the cmpxchg() operation
> returns -EAGAIN. __lsui_futex_cmpxchg() then swallows the -EAGAIN if the
> futex word has changed.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
> 
> v1: https://lore.kernel.org/r/20260519090823.7216-1-will@kernel.org
> 
>  arch/arm64/include/asm/futex.h | 61 ++++++++++++----------------------
>  1 file changed, 22 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> index d1d2ff9d323a..79c6d86c38a9 100644
> --- a/arch/arm64/include/asm/futex.h
> +++ b/arch/arm64/include/asm/futex.h
> @@ -151,42 +151,31 @@ __lsui_cmpxchg64(u64 __user *uaddr, u64 *oldval, u64 newval)
>  }
>  
>  static __always_inline int
> -__lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> +__lsui_cmpxchg32(u32 __user *uaddr, u32 *oldval, u32 newval)
>  {
>  	u64 __user *uaddr64;
>  	bool futex_pos, other_pos;
> -	u32 other, orig_other;
>  	union {
>  		u32 futex[2];
>  		u64 raw;
> -	} oval64, orig64, nval64;
> +	} orig64, oval64, nval64;
>  
>  	uaddr64 = (u64 __user *)PTR_ALIGN_DOWN(uaddr, sizeof(u64));
>  	futex_pos = !IS_ALIGNED((unsigned long)uaddr, sizeof(u64));
>  	other_pos = !futex_pos;
>  
> -	oval64.futex[futex_pos] = oldval;
> -	if (get_user(oval64.futex[other_pos], (u32 __user *)uaddr64 + other_pos))
> +	orig64.futex[futex_pos] = *oldval;
> +	if (get_user(orig64.futex[other_pos], (u32 __user *)uaddr64 + other_pos))
>  		return -EFAULT;
>  
> -	orig64.raw = oval64.raw;
> -
> +	nval64 = oval64 = orig64;
>  	nval64.futex[futex_pos] = newval;
> -	nval64.futex[other_pos] = oval64.futex[other_pos];
>  
>  	if (__lsui_cmpxchg64(uaddr64, &oval64.raw, nval64.raw))
>  		return -EFAULT;
>  
> -	oldval = oval64.futex[futex_pos];
> -	other = oval64.futex[other_pos];
> -	orig_other = orig64.futex[other_pos];
> -
> -	if (other != orig_other)
> -		return -EAGAIN;
> -
> -	*oval = oldval;
> -
> -	return 0;
> +	*oldval = oval64.futex[futex_pos];
> +	return oval64.raw == orig64.raw ? 0 : -EAGAIN;
>  }
>  
>  static __always_inline int
> @@ -202,7 +191,7 @@ __lsui_futex_atomic_and(int oparg, u32 __user *uaddr, int *oval)
>  static __always_inline int
>  __lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
>  {
> -	u32 oldval, newval, val;
> +	u32 oldval, newval;
>  	int ret, i;
>  
>  	if (get_user(oldval, uaddr))
> @@ -214,33 +203,27 @@ __lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
>  	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
>  		newval = oldval ^ oparg;
>  
> -		ret = __lsui_cmpxchg32(uaddr, oldval, newval, &val);
> -		switch (ret) {
> -		case -EFAULT:
> -			return ret;
> -		case -EAGAIN:
> -			continue;
> -		}
> -
> -		if (val == oldval) {
> -			*oval = val;
> -			return 0;
> -		}
> -
> -		oldval = val;
> +		ret = __lsui_cmpxchg32(uaddr, &oldval, newval);
> +		if (ret != -EAGAIN)
> +			break;
>  	}
>  
> -	return -EAGAIN;
> +	*oval = oldval;
> +	return ret;
>  }
>  
>  static __always_inline int
>  __lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
>  {
> -	/*
> -	 * Callers of futex_atomic_cmpxchg_inatomic() already retry on
> -	 * -EAGAIN, no need for another loop of max retries.
> -	 */
> -	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
> +	u32 curval = oldval;
> +	int ret;
> +
> +	ret = __lsui_cmpxchg32(uaddr, &curval, newval);
> +	if (ret == -EAGAIN && curval != oldval)
> +		ret = 0;
> +
> +	*oval = curval;
> +	return ret;
>  }
>  #endif	/* CONFIG_ARM64_LSUI */
>  

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

-- 
Sincerely,
Yeoreum Yun

