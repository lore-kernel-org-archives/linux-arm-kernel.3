Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99158CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7awe7XzUSM9RqCZt0q0OUijjc6X6jEj50LJA+AeAGY=; b=skQMYfWZdVqvBTNie1rZ4KNgxe
	dsdPF7kTZB3xL5Gi5QgRC3RSsbRvMyyl5eh0mYwwk7UQQUycDNqhHwelIudPLBVAVA/KDCgOJ9tZd
	mgFwNa5X7ZQX69TyCfrRwitvREHUlSb4dBo6mZHBMXJ3+HCb4IdShCetBYS4A+6Ra654K2NVvLnH6
	jAfCj1DaoC+JEf5Y3XBpytyy7Epua5NMINTLOo6tzdmwdvnRr8iHXh0jCWp7Vbkl5fejxksL8egSI
	is1tAZLIgka8TsjI2GluOOvdg3pgQYRgCgXRvaprGAu46rjrYRPVc2i85eUjSqFN5gYYkwejXFhAJ
	P54A3MwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyW0B-00000007ywi-0goG;
	Tue, 16 Sep 2025 13:45:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyW0A-00000007ywI-0s3F
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Sep 2025 13:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G7awe7XzUSM9RqCZt0q0OUijjc6X6jEj50LJA+AeAGY=; b=B+6840ZibyyIE5eBeIfZRUjbSs
	POvyD+TPS+jFjXHPfBPgU+LGYMqVkvvNFpKLtojvilLdNHjfZPTqgorl5mbYFXfdgdl8oDflkcCM8
	XAhR4cL9wlA5FvnLYWh53F1/yXMv2uNtblfBIAqsShyOk25Z8cXXMfGgNIDqEulmwNkECRUB0pp1Z
	grts8DIVrRyYoFzw+s6duzXpP+gbYI30lv2PjYY7ww1RKJfDS0jek5tfaOcBoHsHmyrJFx6yBOeBF
	+F6Nyrev1hHm6TVNyD66dtKYNHhfM0irPgkzEm9CjCRDZ0bvI3I9Z8wDyU5+3JBtXJ/6evxMbCuCo
	9gEG5g5Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyW06-00000007CeA-1X6O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 13:45:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F3F6113E;
	Tue, 16 Sep 2025 06:45:29 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0286D3F66E;
	Tue, 16 Sep 2025 06:45:34 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:45:32 +0100
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
Message-ID: <aMlp_Covl57nnVoe@J2N7QTR9R3.cambridge.arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-5-yeoreum.yun@arm.com>
 <aMRQIeIdyiWVR8a0@arm.com>
 <aMfrR0vserl/hfZ3@e129823.arm.com>
 <aMhrscd1gz_syMtL@arm.com>
 <aMh4q4-xAPHnaOul@willie-the-truck>
 <aMkLb6jPiSbzeRWL@arm.com>
 <aMk1qxS3htyaTgEQ@e129823.arm.com>
 <aMlcf5oUNZU65u_I@J2N7QTR9R3.cambridge.arm.com>
 <aMllyaObyciHEEFX@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMllyaObyciHEEFX@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_144543_129261_3C16F820 
X-CRM114-Status: GOOD (  21.62  )
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

On Tue, Sep 16, 2025 at 02:27:37PM +0100, Yeoreum Yun wrote:
> Hi Mark,
> 
> [...]
> > > diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> > > index 1d6d9f856ac5..0aeda7ced2c0 100644
> > > --- a/arch/arm64/include/asm/futex.h
> > > +++ b/arch/arm64/include/asm/futex.h
> > > @@ -126,6 +126,60 @@ LSUI_FUTEX_ATOMIC_OP(or, ldtset, al)
> > >  LSUI_FUTEX_ATOMIC_OP(andnot, ldtclr, al)
> > >  LSUI_FUTEX_ATOMIC_OP(set, swpt, al)
> > >
> > > +
> > > +#define LSUI_CMPXCHG_HELPER(suffix, start_bit)                                 \
> > > +static __always_inline int                                                     \
> > > +__lsui_cmpxchg_helper_##suffix(u64 __user *uaddr, u32 oldval, u32 newval)      \
> > > +{                                                                              \
> > > +       int ret = 0;                                                            \
> > > +       u64 oval, nval, tmp;                                                    \
> > > +                                                                               \
> > > +       asm volatile("//__lsui_cmpxchg_helper_" #suffix "\n"                    \
> > > +       __LSUI_PREAMBLE                                                         \
> > > +"      prfm    pstl1strm, %2\n"                                                \
> > > +"1:    ldtr    %x1, %2\n"                                                      \
> > > +"      mov     %x3, %x1\n"                                                     \
> > > +"      bfi     %x1, %x5, #" #start_bit ", #32\n"                               \
> > > +"      bfi     %x3, %x6, #" #start_bit ", #32\n"                               \
> > > +"      mov     %x4, %x1\n"                                                     \
> > > +"2:    caslt   %x1, %x3, %2\n"                                                 \
> > > +"      sub     %x1, %x1, %x4\n"                                                \
> > > +"      cbz     %x1, 3f\n"                                                      \
> > > +"      mov     %w0, %w7\n"                                                     \
> > > +"3:\n"                                                                         \
> > > +"      dmb     ish\n"                                                          \
> > > +"4:\n"                                                                         \
> > > +       _ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w0)                                   \
> > > +       _ASM_EXTABLE_UACCESS_ERR(2b, 4b, %w0)                                   \
> > > +       : "+r" (ret), "=&r" (oval), "+Q" (*uaddr), "=&r" (nval), "=&r" (tmp)    \
> > > +       : "r" (oldval), "r" (newval), "Ir" (-EAGAIN)                            \
> > > +       : "memory");                                                            \
> > > +                                                                               \
> > > +       return ret;                                                             \
> > > +}
> > > +
> > > +LSUI_CMPXCHG_HELPER(lo, 0)
> > > +LSUI_CMPXCHG_HELPER(hi, 32)
> > > +
> > > +static __always_inline int
> > > +__lsui_cmpxchg_helper(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> > > +{
> > > +       int ret;
> > > +       unsigned long uaddr_al;
> > > +
> > > +       uaddr_al = ALIGN_DOWN((unsigned long)uaddr, sizeof(u64));
> > > +
> > > +       if (uaddr_al != (unsigned long)uaddr)
> > > +               ret = __lsui_cmpxchg_helper_hi((u64 __user *)uaddr_al, oldval, newval);
> > > +       else
> > > +               ret = __lsui_cmpxchg_helper_lo((u64 __user *)uaddr_al, oldval, newval);
> > > +
> > > +       if (!ret)
> > > +               *oval = oldval;
> > > +
> > > +       return ret;
> > > +}
> >
> > I think Will expects that you do more of this in C, e.g. have a basic
> > user cmpxchg on a 64-bit type, e.g.
> >
> > /*
> >  * NOTE: *oldp is NOT updated if a fault is taken.
> >  */
> > static __always_inline int
> > user_cmpxchg64_release(u64 __usr *addr, u64 *oldp, u64 new)
> > {
> > 	int err = 0;
> >
> > 	asm volatile(
> > 	__LSUI_PREAMBLE
> > 	"1:	caslt	%x[old], %x[new], %[addr]\n"
> > 	"2:\n"
> > 	_ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w0)
> > 	: [addr] "+Q" (addr),
> > 	  [old] "+r" (*oldp)
> > 	: [new] "r" (new)
> > 	: "memory"
> > 	);
> >
> > 	return err;
> > }
> >
> > That should be the *only* assembly you need to implement.
> >
> > Atop that, have a wrapper that uses get_user() and that helper above to
> > implement the 32-bit user cmpxchg, with all the bit manipulation in C:
> 
> Thanks for your suggestion. But small question.
> I think it's enough to use usafe_get_user() instead of get_user() in here
> since when FEAT_LSUI enabled, it doeesn't need to call
> uaccess_ttbr0_enable()/disable().

Regardless of uaccess_ttbr0_enable() and uaccess_ttbr0_disable()
specifically, API-wise unsafe_get_user() is only supposed to be called
between user_access_begin() and user_access_end(), and there's some
stuff we probably want to add there (e.g. might_fault(), which
unsafe_get_user() lacks today).

Do we call those?

Mark.

