Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0822ECCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wii+Em+qxiradKpcbAmcUyZhsJ0s4QAy5vQvReV0AD8=; b=FyYmY/D1RxqpTzTW+svobBk5t+
	rQv1L0cAr3FPVXazSDFcVpjwbSSxGv7QIdR+ddFzAOZl/lpI0bjspjVE8WIky22SspEtM8oAaGSym
	MdrQnWCMvEib93zrSdrjk3iFkqai+RjesVQEzm0EwrgRgNGCl6x8a0Qac72tMI7aqSQrK8pUIfZlK
	YWJvdimFlk+ome43wuM3YRJD1pu8mCIdC7odLxr1wgfTm43jUsfqWhWg0Br23RzmpS5jI8/vHST0Z
	zI0KZ7JbWGl4t9yPk5BU0Gtx6M3o8tAO39npoh3MLVukRsnpz1wVOaRGjcfv4hLCOXQZZy3LH8WMb
	pskAJrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9hg-00000007IQK-0eK1;
	Sat, 01 Nov 2025 11:23:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9hf-00000007IQ9-1iLK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 11:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1789B601D2;
	Sat,  1 Nov 2025 11:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761F8C113D0;
	Sat,  1 Nov 2025 11:23:24 +0000 (UTC)
Date: Sat, 1 Nov 2025 11:23:22 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, Willy Tarreau <w@1wt.eu>,
	Yicong Yang <yangyicong@huawei.com>
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQXtqoUEtDr-xUeS@arm.com>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
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

On Fri, Oct 31, 2025 at 08:25:07PM -0700, Paul E. McKenney wrote:
> On Fri, Oct 31, 2025 at 04:38:57PM -0700, Paul E. McKenney wrote:
> > On Fri, Oct 31, 2025 at 10:43:35PM +0000, Catalin Marinas wrote:
> > > I just realised that patch doesn't touch percpu.h at all. So what about
> > > something like (untested):
> > > 
> > > -----------------8<------------------------
> > > diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> > > index 9abcc8ef3087..e381034324e1 100644
> > > --- a/arch/arm64/include/asm/percpu.h
> > > +++ b/arch/arm64/include/asm/percpu.h
> > > @@ -70,6 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
> > >  	unsigned int loop;						\
> > >  	u##sz tmp;							\
> > >  									\
> > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > >  	/* LL/SC */							\
> > >  	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
> > > @@ -91,6 +92,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
> > >  	unsigned int loop;						\
> > >  	u##sz ret;							\
> > >  									\
> > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
> > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> > >  	/* LL/SC */							\
> > >  	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
> > > -----------------8<------------------------
> > 
> > I will give this a shot, thank you!
> 
> Jackpot!!!
> 
> This reduces the overhead to 8.427, which is significantly better than
> the non-LSE value of 9.853.  Still room for improvement, but much
> better than the 100ns values.
> 
> I presume that you will send this up the normal path, but in the meantime,
> I will pull this in for further local testing, and thank you!

I think for this specific case it may work, for the futex as well but
not generally. The Neoverse-V2 TRM lists some controls in the
IMP_CPUECTLR_EL1, bits 29 to 33:

https://developer.arm.com/documentation/102375/0002

These can be configured depending on the system configuration but they
are too big knobs to cover all use-cases within an OS. This register is
typically configured by firmware, we don't touch it in Linux.

I'll dig some more but we may have to do tricks like prefetch if we
can't find a hardware configuration that satisfies all cases.

-- 
Catalin

