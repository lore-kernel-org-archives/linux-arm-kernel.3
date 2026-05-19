Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F58FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gh9xlTYcxaxKCfdyVho+/0oG+2pdptD9y0fRPPkfG3A=; b=HfCGBuPsxHrjvZGBO0XffI8r31
	NQysa7oFWCAyl7X7y4jpiQkipOR5x/N1uuIJyElxscWbZ6DkpglXJLKf0R4/6foDT1YXesRq6v9IP
	0pttQFr1JNXadS5KkvDm8UNzd2nwLIyYOf/U5GuXUgxCyYcnTspE+h3xerjrkbLCZrZAwwL+SO/S/
	7sq2o9rRBiH8AI7sLhd7Pzh5jwJQAYw8n8zWtNDzpc3eUYNoEbaXRfWowZs9+sPQwx7U9iyo+uXCB
	3+G8omP2ggST/x75bUjB5dlDo0JgnyW1nqpl7Kzt49ImBpBR+Q9k+A5mznL1JTy1ylgHduC0IulPL
	d9yaA0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGgq-00000000udn-0eh1;
	Tue, 19 May 2026 09:24:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGgn-00000000ucg-24k7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:24:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76DA92008;
	Tue, 19 May 2026 02:24:28 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C4043F632;
	Tue, 19 May 2026 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779182673; bh=hGT/Th2iFqAGbCN/C3Rw9Y4NntmjTKBassSxc//xyrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6Z2QW51819UpuPO2umtncLJzV0wtvkJbMQUAyY9mUDZMfI/mhmjRJOG4UvOmtwag
	 tb77JlWlU0SC3oNf0jTOAY3TK7vHVCl4sMk/b348yfktgazsZQ1yh0HBEIeZPsMtPn
	 YCLepwN69C8pCC5fVVmcROgxUX0Iv55bQuJLz32A=
Date: Tue, 19 May 2026 10:24:30 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: futex: Consolidate 'old == new' check in
 __lsui_cmpxchg32()
Message-ID: <agwsTjIeOKn6Ofkw@e129823.arm.com>
References: <20260519090823.7216-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519090823.7216-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_022437_614106_5CBB3F77 
X-CRM114-Status: GOOD (  27.24  )
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

Thanks.

At the time of writing the code, expected the upper layer to handle
changes to the futex value for cmpxchg. However, it now seems that it
simply returns -EAGAIN there as well.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

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
> returns -EAGAIN.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/futex.h | 53 ++++++++++++----------------------
>  1 file changed, 18 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> index d1d2ff9d323a..db84a7b2de74 100644
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
> +	int ret;
> +
>  	/*
>  	 * Callers of futex_atomic_cmpxchg_inatomic() already retry on
>  	 * -EAGAIN, no need for another loop of max retries.
>  	 */
> -	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
> +	ret = __lsui_cmpxchg32(uaddr, &oldval, newval);
> +	*oval = oldval;
> +	return ret;
>  }
>  #endif	/* CONFIG_ARM64_LSUI */
>  
> -- 
> 2.54.0.563.g4f69b47b94-goog
> 

-- 
Sincerely,
Yeoreum Yun

