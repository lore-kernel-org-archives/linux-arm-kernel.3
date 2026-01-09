Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3697FD1A62D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuEPFXwpA0mKNl88FVEjYS7qhedn7DBhcZJPJrkSAtY=; b=eOLZA+dpD+u1YQJULw91V4Mrfg
	U/AoNGKoRUk560jS2NXHWy/EBn//UYgbpV+TtdRSrS8YWjetD+YiZIp9Uxe08FZvu9IViAZvpdv8L
	jrFXASz4luFoS5mWGgfmEFr9F2qpGUpv2NYiJL8ZCv3EnS7U9CDUYxj0/HKaxAhDWhyc/zBru6BqU
	6E0ttdX+PB15xNT80BZZf2SPSdt4xNIYHZ3hijrYWB25rT6jOQ/AnEF6K+NWoJo+JRVLFcpfku3kZ
	l0YJxBc7NatOf44+PwEwiAnJY2v2x7f7hBI2eyOccbeWrw7fsUw3aYnTaP+v/gofWgxouCCalPgeI
	bFVUgcvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDHw-00000002OeZ-0iUC;
	Fri, 09 Jan 2026 14:16:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDHt-00000002OeC-1VsQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:16:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9546840C32;
	Fri,  9 Jan 2026 14:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1E0C19421;
	Fri,  9 Jan 2026 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767968184;
	bh=CrekNb1dyF5mdDmLDlXBHlZWJJ6T0rEqpIAPw8943rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WG46vr/EzI5fbUdRrIc3zQ3nu8+ECZ/t7wbnWcjsusUN84kOQ8YmlLLE4JjpIcvcX
	 YitKYrV/LbR+LfReyDPxL/QBCHeXBZ7VvqC6GC93gC6HW9LHURXlAdDhhgf1lmPaa4
	 DtcPDy5a5TiazlSFVHClgCUSYTTsK9u5p7SOjhchrNvccMZjKKIBi76J6mPeaqBgAL
	 ohkI3oEQe7JejBBlHD7e9iZ6xMehQ5ADBVn30LHU8F2ETT3DkwuZs4sxERFXSF4SCW
	 7aVx1T9AA9+jkZg708xRh5mtPLZk0MXlg1sZJyG0sXbruSWyyy368nTs3v91142ER+
	 ayMmzicQeFRkw==
Date: Fri, 9 Jan 2026 14:16:17 +0000
From: Will Deacon <will@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v8 04/12] arm64: support WFET in
 smp_cond_relaxed_timeout()
Message-ID: <aWENsQywXuM880_l@willie-the-truck>
References: <20251215044919.460086-1-ankur.a.arora@oracle.com>
 <20251215044919.460086-5-ankur.a.arora@oracle.com>
 <aWAjMbSqN2g7v58Z@willie-the-truck>
 <874iovp34a.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874iovp34a.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_061625_460610_EC5AEA61 
X-CRM114-Status: GOOD (  21.07  )
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

On Fri, Jan 09, 2026 at 01:05:57AM -0800, Ankur Arora wrote:
> 
> Will Deacon <will@kernel.org> writes:
> 
> > On Sun, Dec 14, 2025 at 08:49:11PM -0800, Ankur Arora wrote:
> >> +#define __CMPWAIT_CASE(w, sfx, sz)						\
> >> +static inline void __cmpwait_case_##sz(volatile void *ptr,			\
> >> +				       unsigned long val,			\
> >> +				       s64 timeout_ns)				\
> >> +{										\
> >> +	unsigned long tmp;							\
> >> +										\
> >> +	if (!alternative_has_cap_unlikely(ARM64_HAS_WFXT) || timeout_ns <= 0) {	\
> >> +		asm volatile(							\
> >> +		"	sevl\n"							\
> >> +		"	wfe\n"							\
> >> +		"	ldxr" #sfx "\t%" #w "[tmp], %[v]\n"			\
> >> +		"	eor	%" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"	\
> >> +		"	cbnz	%" #w "[tmp], 1f\n"				\
> >> +		"	wfe\n"							\
> >> +		"1:"								\
> >> +		: [tmp] "=&r" (tmp), [v] "+Q" (*(u##sz *)ptr)			\
> >> +		: [val] "r" (val));						\
> >> +	} else {								\
> >> +		u64 ecycles = arch_timer_read_counter() +			\
> >> +				NSECS_TO_CYCLES(timeout_ns);			\
> >> +		asm volatile(							\
> >> +		"	sevl\n"							\
> >> +		"	wfe\n"							\
> >> +		"	ldxr" #sfx "\t%" #w "[tmp], %[v]\n"			\
> >> +		"	eor	%" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"	\
> >> +		"	cbnz	%" #w "[tmp], 2f\n"				\
> >> +		"	msr s0_3_c1_c0_0, %[ecycles]\n"				\
> >> +		"2:"								\
> >> +		: [tmp] "=&r" (tmp), [v] "+Q" (*(u##sz *)ptr)			\
> >> +		: [val] "r" (val), [ecycles] "r" (ecycles));			\
> >> +	}									\
> >
> > Why not have a separate helper for the WFXT version and avoid the runtime
> > check on timeout_ns?
> 
> My main reason for keeping them together was that a separate helper
> needed duplication of a lot of the __CMPWAIT_CASE and __CMPWAIT_GEN
> stuff.
> 
> Relooking at it, I think we could get by without duplicating the
> __CMPWAIT_GEN (the WFE helper just needs to take an unused timeout_ns
> paramter).
> 
> But, it seems overkill to get rid of the unnecessary check on timeout_ns
> (which AFAICT should be well predicted) and the duplicate static branch.

tbh, I was actually struggling to see what the check achieves. In fact,
why is 'timeout_ns' signed in the first place? Has BPF invented time
travel now? :p

If the requested timeout is 0 then we should return immediately (or issue
a WFET which will wake up immediately).

If the requested timeout is negative, then WFET may end up with a really
long timeout, but that should still be no worse than a plain WFE.

If the check is only there to de-multiplex __cmpwait() vs
__cmpwait_relaxed_timeout() as the caller, then I think we should just
avoid muxing them in the first place. The duplication argument doesn't
hold a lot of water when the asm block is already mostly copy-paste.

Will

