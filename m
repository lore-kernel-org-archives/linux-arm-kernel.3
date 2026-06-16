Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51496CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDttPmVkK7PjzfuqEJMsy98vD92bDffe+cw/FQrYvOg=; b=PqFxH/LmdAinAnDs3kSSpzpZ4Z
	UGSX2/tPinTIWRHBWpubqj4vL8mAysYosjb+5s6/KnosmjORPxi7ROH4wM8ejuyVkWpn3+/6O4pbm
	HLAHTSk5wqbqmEPoVWGKYT05B2ra4fAVO2zkjrrLb9k0vx9WhhLqDmIZgX9qRa3pX74Ju6zrVuGrN
	m1tAaJprflVy2GAJlPJIG2GkO3JnbQ3xFanAK2GU2oIq99Xc/QTWDrRpX6yrkKQrSPIiR2AkbzW5Q
	FKU+cAeISwVPF6NJ1pa79ZmkIri4iG3IFG6gAPA6BMeXlJcC5w2aCnjgYZ3X/S1F5SbY3yEbRUyQu
	IxTcEsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYe0-0000000GDK3-17V0;
	Tue, 16 Jun 2026 18:36:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYdx-0000000GDJb-20Gc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 18:36:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A13D6455D;
	Tue, 16 Jun 2026 11:36:05 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C23F53F905;
	Tue, 16 Jun 2026 11:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781634970; bh=O9Rlm5lIlrpq6PHiRYc3vGo7CeJfmnHdft5OJkD3V/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OU5d5Yl2Myl0vE9epYD+lmFXuL8qPFCyuaQUas6Q72FnH2CTqkvv6bpUPDBMEHwGl
	 bnIXXbi0yo9lAhmgVrZBDett0rF7kUENOMNtqsapch18qP43oM15D4a78+QbbNT2U2
	 raY+c3NnarSXb6h1xZSqwnFFfXmbbF0Dlyf6A6e8=
Date: Tue, 16 Jun 2026 19:36:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: futex: Consolidate 'old == new' check in
 __lsui_cmpxchg32()
Message-ID: <ajGXkoruw2kI_2Rp@arm.com>
References: <20260519090823.7216-1-will@kernel.org>
 <agx9DmAbHdAoSlWU@arm.com>
 <ah7md1ha86Anr7nb@willie-the-truck>
 <ajEW41-ncVO_nDY7@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajEW41-ncVO_nDY7@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_113613_775018_B2DFF418 
X-CRM114-Status: GOOD (  31.09  )
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

On Tue, Jun 16, 2026 at 10:26:59AM +0100, Yeoreum Yun wrote:
> > On Tue, May 19, 2026 at 04:09:02PM +0100, Catalin Marinas wrote:
> > > On Tue, May 19, 2026 at 10:08:22AM +0100, Will Deacon wrote:
> > > > The LSUI futex implementation relies on a cmpxchg() loop to implement
> > > > FUTEX_OP_XOR, as the architecture doesn't provide unprivileged *EOR
> > > > atomics. Since the unprivileged 'CAST' instructions used to implement
> > > > the cmpxchg() can only operate on 64-bit memory locations, the
> > > > __lsui_cmpxchg32() helper function performs a song and dance to marshall
> > > > the 32-bit futex value into the correct part of a 64-bit register and
> > > > fill the remaining bytes with the neighbouring data.
> > > 
> > > IIRC, the reason for the current __lsui_cmpxchg32() was not EOR but the
> > > expected futex_atomic_cmpxchg_inatomic() semantics. Looking at it again,
> > > we have wake_futex_pi() that does something else if the ret is 0 but the
> > > value differs. Looking at it again, the caller of wake_futex_pi()
> > > retries on -EAGAIN anyway, so I don't see a correctness issue, it will
> > > eventually hit the condition.
> > 
> > Hmm, but I think that means my patch does change the behaviour of
> > wake_futex_pi() in an undesirable way. For example, futex_unlock_pi()
> > will go round the retry loop for any change in the futex value, whereas
> > before we would go back to userspace only if the TID changed.
> > 
> > So I think we should swallow the -EAGAIN for the CAS-based cmpxchg() if
> > the futex word has changed, along the lines of the diff below.
> > 
> > Will
> > 
> > --->8
> > 
> > diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> > index db84a7b2de74..79c6d86c38a9 100644
> > --- a/arch/arm64/include/asm/futex.h
> > +++ b/arch/arm64/include/asm/futex.h
> > @@ -215,14 +215,14 @@ __lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
> >  static __always_inline int
> >  __lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> >  {
> > +       u32 curval = oldval;
> >         int ret;
> >  
> > -       /*
> > -        * Callers of futex_atomic_cmpxchg_inatomic() already retry on
> > -        * -EAGAIN, no need for another loop of max retries.
> > -        */
> > -       ret = __lsui_cmpxchg32(uaddr, &oldval, newval);
> > -       *oval = oldval;
> > +       ret = __lsui_cmpxchg32(uaddr, &curval, newval);
> > +       if (ret == -EAGAIN && curval != oldval)
> > +               ret = 0;
> > +
> > +       *oval = curval;
> >         return ret;
> >  }
> >  #endif /* CONFIG_ARM64_LSUI */
> 
> Agree. It is good that this additional patch does not change
> the existing behavior.
> 
> @Catalin, Could you check this please?

Ah, yes, looks good to me. I completely forgot about this.

-- 
Catalin

