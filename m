Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E65CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/raFEmVevCb0wadUdt+C3hPmO6Zg+nwGzWRXQlV7olA=; b=LGgBoBTVnQqSeiD+2xYxc4iKbK
	i83mf4XdHF7WJR91XAkqDwxVxpAGLIJ6M7QrW9H3PUOVuf77aPqXFLU+cK0cMulo0u9ZIkcZUlStS
	RLySMvRoWYzBuwHdhuaxS3q05nwjKWe1M47Apt60A3wsspIbUKfrTTEm5HI2LMQHR2GrCgZohuv2W
	t0Q1MlrBRBk2vemh0aguADTPHwDAstJot1WkUNpaXuWdRZwY9USg2pkvyemTwAeqvIFMecXq6frxl
	CbtZbHZE6SoitNHmfXKYiXWk7mxdc6TITH/tEQ+CGUuXGg6EhbFI0+ck4mad9d8BJFUsULFqOLZEa
	AmJx7aIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLcl-0000000ASvp-1sCh;
	Tue, 19 Aug 2025 12:39:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJgE-0000000A96B-3MDV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19B635C5C36;
	Tue, 19 Aug 2025 10:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1E8C113D0;
	Tue, 19 Aug 2025 10:34:49 +0000 (UTC)
Date: Tue, 19 Aug 2025 11:34:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	arnd@arndb.de, will@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	rafael@kernel.org, daniel.lezcano@linaro.org
Subject: Re: [PATCH v3 1/5] asm-generic: barrier: Add
 smp_cond_load_relaxed_timewait()
Message-ID: <aKRTRyQAaWFtRvDv@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-2-ankur.a.arora@oracle.com>
 <aJXWyxzkA3x61fKA@arm.com>
 <877bz98sqb.fsf@oracle.com>
 <aJy414YufthzC1nv@arm.com>
 <87bjoi2wdf.fsf@oracle.com>
 <aJ3K4tQCztOXF6hO@arm.com>
 <87plctwq7x.fsf@oracle.com>
 <aKNo9pxx2w9sjJjc@arm.com>
 <87sehotp9q.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sehotp9q.fsf@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_033502_941509_BBA97B07 
X-CRM114-Status: GOOD (  23.65  )
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

On Mon, Aug 18, 2025 at 12:15:29PM -0700, Ankur Arora wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Sun, Aug 17, 2025 at 03:14:26PM -0700, Ankur Arora wrote:
> >> __cmpwait_relaxed() will need adjustment to set a deadline for WFET.
> >
> > Yeah, __cmpwait_relaxed() doesn't use WFET as it doesn't need a timeout
> > (it just happens to have one with the event stream).
> >
> > We could extend this or create a new one that uses WFET and takes an
> > argument. If extending this one, for example a timeout argument of 0
> > means WFE, non-zero means WFET cycles. This adds a couple of more
> > instructions.
> 
> Though then we would need an ALTERNATIVE for WFET to fallback to WFE where
> not available. This is a minor point, but how about just always using
> WFE or WFET appropriately instead of choosing between the two based on
> etime.
> 
>   static inline void __cmpwait_case_##sz(volatile void *ptr,              \
>                                   unsigned long val,                      \
>                                   unsigned long etime)                    \
>                                                                           \
>           unsigned long tmp;                                              \
>                                                                           \
>           const unsigned long ecycles = xloops_to_cycles(nsecs_to_xloops(etime)); \
>           asm volatile(                                                   \
>           "       sevl\ n"                                                \
>           "       wfe\ n"                                                 \
>           "       ldxr" #sfx "\ t%" #w "[tmp], %[v]\n"                    \
>           "       eor     %" #w "[tmp], %" #w "[tmp], %" #w "[val]\ n"    \
>           "       cbnz    %" #w "[tmp], 1f\ n"                            \
>           ALTERNATIVE("wfe\ n",                                           \
>                   "msr s0_3_c1_c0_0, %[ecycles]\ n",                      \
>                   ARM64_HAS_WFXT)                                         \
>           "1:"                                                            \
>           : [tmp] "=&r" (tmp), [v] "+Q" (*(u##sz *)ptr)                   \
>           : [val] "r" (val), [ecycles] "r" (ecycles));                    \
>   }
> 
> This would cause us to compute the end time unnecessarily for WFE but,
> given that nothing will use the output of that computation, wouldn't
> WFE be able to execute before the result of that computation is available?
> (Though I guess WFE is somewhat special, so the usual rules might not
> apply.)

The compiler cannot tell what's happening inside the asm block, so it
will compute ecycles, place it in a register before the asm. The
hardware won't do anything smarter like skip the computation because the
register holding ecycles is not going to be used (or it is going to be
re-written later). So I wouldn't want to penalise the existing
smp_cond_load_acquire() which only needs a WFE.

We could patch WFET in and always pass -1UL in the non-timeout case but
I think we are better off just duplicating the whole thing. It's going
to be inlined anyway, so it's not like we end up with lots of these
functions.

-- 
Catalin

