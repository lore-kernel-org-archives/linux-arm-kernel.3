Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F031CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAR+kZdKg8CQXZyfFqfHPkT3hq9wuaD/SsPffT0/d9M=; b=2JHrD5KLkHBExUAdRpHV6cvX0s
	55usNnax/63gPzHF1DvzryKTqJpMs3mUanyi+Eg0IL9Y/20fUsHDSsMRUSEb2BNh5R+1MtiBz5KeQ
	XgFiPQQJIoXi3Em7ndTNTgrgie3VkpPIxsHVRUaZCegwbHX1ujRITR4Rz/hc0om8FRgV3Q46FWifG
	srumr5xBwr7oUUrz+uexUsdxelaJLnK+2kD7iRMBVQRai07EwIfNa3tRhinsNLpKWo9JSo3GosCDd
	TC1DFzFf9mDGpjhzROOW56YBt0zknKeNckX45IhVvCXa9WCQWCeh9NOoUW7a25P00cZRsWpXriay+
	KRdQ2bTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQ4b-0000000FWE6-0DyV;
	Tue, 16 Jun 2026 09:27:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQ4Y-0000000FWDS-1ueF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 09:27:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 754D8451F;
	Tue, 16 Jun 2026 02:26:57 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 735453F763;
	Tue, 16 Jun 2026 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781602022; bh=akwRtrmOehERGjKh1XJj0GnjvAM3JAzOkBw8eLzNbYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmXAQMBQ+OfD2FgM+zUABycQwgwOIwhfkR8kErgVJ1eqngcODPDIrXJHkV4YNb0zX
	 b4tyu+kHIwydfu+6W6lI5nX0HrIZ6xjyk4w9VGpeI5vnNa1JRndy4ivLsJGlBRejeb
	 XS39H1lm3zWDoKlyULbVPpgLsK8XNsXWsjMQ9iaQ=
Date: Tue, 16 Jun 2026 10:26:59 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: futex: Consolidate 'old == new' check in
 __lsui_cmpxchg32()
Message-ID: <ajEW41-ncVO_nDY7@e129823.arm.com>
References: <20260519090823.7216-1-will@kernel.org>
 <agx9DmAbHdAoSlWU@arm.com>
 <ah7md1ha86Anr7nb@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah7md1ha86Anr7nb@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_022706_654716_2B0C3AD4 
X-CRM114-Status: GOOD (  28.15  )
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

> On Tue, May 19, 2026 at 04:09:02PM +0100, Catalin Marinas wrote:
> > On Tue, May 19, 2026 at 10:08:22AM +0100, Will Deacon wrote:
> > > The LSUI futex implementation relies on a cmpxchg() loop to implement
> > > FUTEX_OP_XOR, as the architecture doesn't provide unprivileged *EOR
> > > atomics. Since the unprivileged 'CAST' instructions used to implement
> > > the cmpxchg() can only operate on 64-bit memory locations, the
> > > __lsui_cmpxchg32() helper function performs a song and dance to marshall
> > > the 32-bit futex value into the correct part of a 64-bit register and
> > > fill the remaining bytes with the neighbouring data.
> > 
> > IIRC, the reason for the current __lsui_cmpxchg32() was not EOR but the
> > expected futex_atomic_cmpxchg_inatomic() semantics. Looking at it again,
> > we have wake_futex_pi() that does something else if the ret is 0 but the
> > value differs. Looking at it again, the caller of wake_futex_pi()
> > retries on -EAGAIN anyway, so I don't see a correctness issue, it will
> > eventually hit the condition.
> 
> Hmm, but I think that means my patch does change the behaviour of
> wake_futex_pi() in an undesirable way. For example, futex_unlock_pi()
> will go round the retry loop for any change in the futex value, whereas
> before we would go back to userspace only if the TID changed.
> 
> So I think we should swallow the -EAGAIN for the CAS-based cmpxchg() if
> the futex word has changed, along the lines of the diff below.
> 
> Will
> 
> --->8
> 
> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> index db84a7b2de74..79c6d86c38a9 100644
> --- a/arch/arm64/include/asm/futex.h
> +++ b/arch/arm64/include/asm/futex.h
> @@ -215,14 +215,14 @@ __lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
>  static __always_inline int
>  __lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
>  {
> +       u32 curval = oldval;
>         int ret;
>  
> -       /*
> -        * Callers of futex_atomic_cmpxchg_inatomic() already retry on
> -        * -EAGAIN, no need for another loop of max retries.
> -        */
> -       ret = __lsui_cmpxchg32(uaddr, &oldval, newval);
> -       *oval = oldval;
> +       ret = __lsui_cmpxchg32(uaddr, &curval, newval);
> +       if (ret == -EAGAIN && curval != oldval)
> +               ret = 0;
> +
> +       *oval = curval;
>         return ret;
>  }
>  #endif /* CONFIG_ARM64_LSUI */

Agree. It is good that this additional patch does not change
the existing behavior.

@Catalin, Could you check this please?

Thanks!

-- 
Sincerely,
Yeoreum Yun

