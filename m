Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C932BC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsYNsvH4cf/V3Ckqz8icVqJXuBgiJ7pi66nB8j0Rwtw=; b=4ZQVMxA7kUutnVrFTOCxbCEeY5
	Ntr84QZxtTTB1ZrYGy1A+DW1C9U+Q6EdEDiFuKaT14BSralkAWD8s4AgDUMVUAr1sjy708RCE4i2t
	OGqdmoRmVguwYWLsvUFA6fg0i8/mCBcEVki7ZBU5zYBtu1KTwmlMLI3AgD9VHBcsIeG29H43uMBnU
	ABLsC2Wel20UTkMQT56sOemSUjsDKFBSRGxPCFhdck7Z1fc0Vf0y+ed6/5GcQGs8OIhrMf9ZSrM9C
	cMLbwnvDwBe4VGaBarC32oORCkiCPJTV9BBJmJGfS10iCgNUoMSXNAgLFLj6EeptINCeJDRzkKqma
	VQMVWhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZMi-00000006FNB-2fmE;
	Tue, 04 Mar 2025 20:59:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXx3-0000000619Q-40XZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 19:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEA0F5C6384;
	Tue,  4 Mar 2025 19:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC3FC4CEE5;
	Tue,  4 Mar 2025 19:29:09 +0000 (UTC)
Date: Tue, 4 Mar 2025 19:29:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	will@kernel.org, peterz@infradead.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, memxor@gmail.com,
	zhenglifeng1@huawei.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH 3/4] arm64: barrier: Add smp_cond_load_relaxed_timewait()
Message-ID: <Z8dUg5zzclvDpPtZ@arm.com>
References: <20250203214911.898276-1-ankur.a.arora@oracle.com>
 <20250203214911.898276-4-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203214911.898276-4-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_112914_037200_324FBFEB 
X-CRM114-Status: GOOD (  17.62  )
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

On Mon, Feb 03, 2025 at 01:49:10PM -0800, Ankur Arora wrote:
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 1ca947d5c939..25721275a5a2 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -216,6 +216,44 @@ do {									\
>  	(typeof(*ptr))VAL;						\
>  })
>  
> +#define __smp_cond_load_relaxed_timewait(ptr, cond_expr,		\
> +					 time_expr_ns, time_limit_ns)	\
> +({									\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr)						\
> +			break;						\
> +		__cmpwait_relaxed(__PTR, VAL);				\
> +		if ((time_expr_ns) >= (time_limit_ns))			\
> +			break;						\
> +	}								\
> +	(typeof(*ptr))VAL;						\
> +})

Rename this to something like *_evstrm as this doesn't really work
unless we have the event stream. Another one would be *_wfet.

> +
> +/*
> + * For the unlikely case that the event-stream is unavailable,
> + * ward off the possibility of waiting forever by falling back
> + * to the generic spin-wait.
> + */
> +#define smp_cond_load_relaxed_timewait(ptr, cond_expr,			\
> +				       time_expr_ns, time_limit_ns)	\
> +({									\
> +	__unqual_scalar_typeof(*ptr) _val;				\
> +	int __wfe = arch_timer_evtstrm_available();			\

This should be a bool.

> +									\
> +	if (likely(__wfe))						\
> +		_val = __smp_cond_load_relaxed_timewait(ptr, cond_expr,	\
> +							time_expr_ns,	\
> +							time_limit_ns);	\
> +	else								\
> +		_val = __smp_cond_load_relaxed_spinwait(ptr, cond_expr,	\
> +							time_expr_ns,	\
> +							time_limit_ns);	\
> +	(typeof(*ptr))_val;						\
> +})

Not sure there's much to say here, this depends on the actual interface
introduced by patch 1. If we make some statements about granularity of
some time_cond_expr check, we'll have to take that into account.

-- 
Catalin

