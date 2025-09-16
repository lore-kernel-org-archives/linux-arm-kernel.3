Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB2CCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5algiJowsupruLgiwfoq5sFCjxbuLn44vK54GwZ45cU=; b=lT3G+8MIvYuPA4T3gUC0Bddhmv
	xVI5fkeLGJxXbDxPLbF/FGqQxEdSAamMjLVdy5VF31IZYfUeaFM0eBW3ZytRaa/JLSqsfzREH0EZI
	xf3JMxf8MVj0sFlexTAozt+balLsW9wofwxIc7tjXunMSfO+8u9k7hhLHmm+eiiATAHdB2+w4B2b7
	0EmR8TaTsus8rLgC6VfLUVG+N499Kew8Gqd32yN8/izH/rNC7NYXPaF+Fy0HkUGMX2jYLO/SL0aSk
	4LzLefYOGytzUVo5sIETlPd90PFVcTS+i+8M2RRh4v1Wr9ReLZdR/Rr72r8VBr91IA8leZx9w64cS
	ayfxtBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyV6Q-00000007p3i-1fuc;
	Tue, 16 Sep 2025 12:48:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyV6O-00000007p2u-1ek5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 12:48:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 472F62B;
	Tue, 16 Sep 2025 05:47:58 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DCCC3F673;
	Tue, 16 Sep 2025 05:48:03 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:47:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 4/6] arm64: futex: refactor futex atomic
 operation
Message-ID: <aMlcf5oUNZU65u_I@J2N7QTR9R3.cambridge.arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-5-yeoreum.yun@arm.com>
 <aMRQIeIdyiWVR8a0@arm.com>
 <aMfrR0vserl/hfZ3@e129823.arm.com>
 <aMhrscd1gz_syMtL@arm.com>
 <aMh4q4-xAPHnaOul@willie-the-truck>
 <aMkLb6jPiSbzeRWL@arm.com>
 <aMk1qxS3htyaTgEQ@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMk1qxS3htyaTgEQ@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_054808_515395_05B2244E 
X-CRM114-Status: GOOD (  32.85  )
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

On Tue, Sep 16, 2025 at 11:02:19AM +0100, Yeoreum Yun wrote:
> Hi,
> > On Mon, Sep 15, 2025 at 09:35:55PM +0100, Will Deacon wrote:
> > > On Mon, Sep 15, 2025 at 08:40:33PM +0100, Catalin Marinas wrote:
> > > > On Mon, Sep 15, 2025 at 11:32:39AM +0100, Yeoreum Yun wrote:
> > > > > So I think it would be better to keep the current LLSC implementation
> > > > > in LSUI.
> > > >
> > > > I think the code would look simpler with LL/SC but you can give it a try
> > > > and post the code sample here (not in a new series).
> > >
> > > If you stick the cas*t instruction in its own helper say, cmpxchg_user(),
> > > then you can do all the shifting/masking in C and I don't reckon it's
> > > that bad. It means we (a) get rid of exclusives, which is the whole
> > > point of this and (b) don't have to mess around with PAN.
> >
> > We get rid of PAN toggling already since FEAT_LSUI introduces
> > LDTXR/STTXR. But, I'm all for CAS if it doesn't look too bad. Easier
> > I think if we do a get_user() of a u64 and combine it with the futex u32
> > while taking care of CPU endianness. All in a loop. Hopefully the
> > compiler is smart enough to reduce masking/or'ing to fewer instructions.
> >
> 
> Sorry for my wrong previous email.
> 
> Here is what i intened with CAS operation:
> 
> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> index 1d6d9f856ac5..0aeda7ced2c0 100644
> --- a/arch/arm64/include/asm/futex.h
> +++ b/arch/arm64/include/asm/futex.h
> @@ -126,6 +126,60 @@ LSUI_FUTEX_ATOMIC_OP(or, ldtset, al)
>  LSUI_FUTEX_ATOMIC_OP(andnot, ldtclr, al)
>  LSUI_FUTEX_ATOMIC_OP(set, swpt, al)
> 
> +
> +#define LSUI_CMPXCHG_HELPER(suffix, start_bit)                                 \
> +static __always_inline int                                                     \
> +__lsui_cmpxchg_helper_##suffix(u64 __user *uaddr, u32 oldval, u32 newval)      \
> +{                                                                              \
> +       int ret = 0;                                                            \
> +       u64 oval, nval, tmp;                                                    \
> +                                                                               \
> +       asm volatile("//__lsui_cmpxchg_helper_" #suffix "\n"                    \
> +       __LSUI_PREAMBLE                                                         \
> +"      prfm    pstl1strm, %2\n"                                                \
> +"1:    ldtr    %x1, %2\n"                                                      \
> +"      mov     %x3, %x1\n"                                                     \
> +"      bfi     %x1, %x5, #" #start_bit ", #32\n"                               \
> +"      bfi     %x3, %x6, #" #start_bit ", #32\n"                               \
> +"      mov     %x4, %x1\n"                                                     \
> +"2:    caslt   %x1, %x3, %2\n"                                                 \
> +"      sub     %x1, %x1, %x4\n"                                                \
> +"      cbz     %x1, 3f\n"                                                      \
> +"      mov     %w0, %w7\n"                                                     \
> +"3:\n"                                                                         \
> +"      dmb     ish\n"                                                          \
> +"4:\n"                                                                         \
> +       _ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w0)                                   \
> +       _ASM_EXTABLE_UACCESS_ERR(2b, 4b, %w0)                                   \
> +       : "+r" (ret), "=&r" (oval), "+Q" (*uaddr), "=&r" (nval), "=&r" (tmp)    \
> +       : "r" (oldval), "r" (newval), "Ir" (-EAGAIN)                            \
> +       : "memory");                                                            \
> +                                                                               \
> +       return ret;                                                             \
> +}
> +
> +LSUI_CMPXCHG_HELPER(lo, 0)
> +LSUI_CMPXCHG_HELPER(hi, 32)
> +
> +static __always_inline int
> +__lsui_cmpxchg_helper(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> +{
> +       int ret;
> +       unsigned long uaddr_al;
> +
> +       uaddr_al = ALIGN_DOWN((unsigned long)uaddr, sizeof(u64));
> +
> +       if (uaddr_al != (unsigned long)uaddr)
> +               ret = __lsui_cmpxchg_helper_hi((u64 __user *)uaddr_al, oldval, newval);
> +       else
> +               ret = __lsui_cmpxchg_helper_lo((u64 __user *)uaddr_al, oldval, newval);
> +
> +       if (!ret)
> +               *oval = oldval;
> +
> +       return ret;
> +}

I think Will expects that you do more of this in C, e.g. have a basic
user cmpxchg on a 64-bit type, e.g.

/*
 * NOTE: *oldp is NOT updated if a fault is taken.
 */
static __always_inline int
user_cmpxchg64_release(u64 __usr *addr, u64 *oldp, u64 new)
{
	int err = 0;

	asm volatile(
	__LSUI_PREAMBLE
	"1:	caslt	%x[old], %x[new], %[addr]\n"
	"2:\n"
	_ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w0) 
	: [addr] "+Q" (addr),
	  [old] "+r" (*oldp)
	: [new] "r" (new)
	: "memory"
	);

	return err;
}

That should be the *only* assembly you need to implement.

Atop that, have a wrapper that uses get_user() and that helper above to
implement the 32-bit user cmpxchg, with all the bit manipulation in C:

/*
 * NOTE: *oldp is NOT updated if a fault is taken.
 */
static int user_cmpxchg32_release(u32 __user *addr, u32 *oldp, u32 new)
{
	u64 __user *addr64 = PTR_ALIGN_DOWN(addr, sizeof(u64));
	u64 old64, new64;
	int ret;

	if (get_user(old64, uaddr64))
		return -EFAULT;

	/*
	 * TODO: merge '*oldp' into 'old64', and 'new' into 'new64',
	 * taking into account endianness and alignment
	 */

	ret = user_cmpxchg64_release(uaddr64, &old64, new64);
	if (ret)
		return ret;

	/*
	 * TODO: extract '*oldp' from 'old64', taking into account
	 * endianness and alignment.
	 */

	return 0;
}

Then use that 32-bit user cmpxchg for any cases which need it.

As the compiler will have visiblity of all of the bit manipulation, it
will hopefully be able to fold that together appropriately.

Mark.

