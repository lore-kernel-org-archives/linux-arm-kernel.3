Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E35CA100A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNFPFG2R723ik3j5TNVjofwR6+rszTAyg4anKufSok4=; b=ZEfUJWx00ShI0KN4HQH5qFLUah
	t0XxDKV4E0gojNh3mPIm9dpxx5F4ZKQ3ezenCkipP+gGFiWMaWfwjhzhseFx+Q54a+ou5qNBoFHrz
	t4PuVZkkuea2zDB1UTlC32MRW0iOFtnhCcrffIzMStk5Y7eQx94u3NYXFktsUaScIHtRYFRWdUBjR
	GUT4MJvp0b5CktR3MRQFbU0CKZk+ICT4/jpZZnerKYmKh3vytg/k+fWtHLXZpe9vRzUTyVR5vjb9W
	2910q0/FFY91mQL6hnX8uXT2+F48lkMBhe4eIxf1VerE/gSR0Th4LrdPfxA4pXUAwwtX1VBYJORBB
	4hjVbhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uS-0000000Ck9W-0LEu;
	Mon, 01 Sep 2025 13:49:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2iU-0000000C3Vs-2XGe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 11:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08807601DC;
	Mon,  1 Sep 2025 11:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0166C4CEF4;
	Mon,  1 Sep 2025 11:28:50 +0000 (UTC)
Date: Mon, 1 Sep 2025 12:28:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	arnd@arndb.de, will@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v4 5/5] rqspinlock: use smp_cond_load_acquire_timewait()
Message-ID: <aLWDcJiZWD7g8-4S@arm.com>
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
 <20250829080735.3598416-6-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829080735.3598416-6-ankur.a.arora@oracle.com>
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

On Fri, Aug 29, 2025 at 01:07:35AM -0700, Ankur Arora wrote:
> diff --git a/arch/arm64/include/asm/rqspinlock.h b/arch/arm64/include/asm/rqspinlock.h
> index a385603436e9..ce8feadeb9a9 100644
> --- a/arch/arm64/include/asm/rqspinlock.h
> +++ b/arch/arm64/include/asm/rqspinlock.h
> @@ -3,6 +3,9 @@
>  #define _ASM_RQSPINLOCK_H
>  
>  #include <asm/barrier.h>
> +
> +#define res_smp_cond_load_acquire_waiting() arch_timer_evtstrm_available()

More on this below, I don't think we should define it.

> diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> index 5ab354d55d82..8de1395422e8 100644
> --- a/kernel/bpf/rqspinlock.c
> +++ b/kernel/bpf/rqspinlock.c
> @@ -82,6 +82,7 @@ struct rqspinlock_timeout {
>  	u64 duration;
>  	u64 cur;
>  	u16 spin;
> +	u8  wait;
>  };
>  
>  #define RES_TIMEOUT_VAL	2
> @@ -241,26 +242,20 @@ static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
>  }
>  
>  /*
> - * Do not amortize with spins when res_smp_cond_load_acquire is defined,
> - * as the macro does internal amortization for us.
> + * Only amortize with spins when we don't have a waiting implementation.
>   */
> -#ifndef res_smp_cond_load_acquire
>  #define RES_CHECK_TIMEOUT(ts, ret, mask)                              \
>  	({                                                            \
> -		if (!(ts).spin++)                                     \
> +		if ((ts).wait || !(ts).spin++)		      \
>  			(ret) = check_timeout((lock), (mask), &(ts)); \
>  		(ret);                                                \
>  	})
> -#else
> -#define RES_CHECK_TIMEOUT(ts, ret, mask)			      \
> -	({ (ret) = check_timeout((lock), (mask), &(ts)); })
> -#endif

IIUC, RES_CHECK_TIMEOUT in the current res_smp_cond_load_acquire() usage
doesn't amortise the spins, as the comment suggests, but rather the
calls to check_timeout(). This is fine, it matches the behaviour of
smp_cond_load_relaxed_timewait() you introduced in the first patch. The
only difference is the number of spins - 200 (matching poll_idle) vs 64K
above. Does 200 work for the above?

>  /*
>   * Initialize the 'spin' member.
>   * Set spin member to 0 to trigger AA/ABBA checks immediately.
>   */
> -#define RES_INIT_TIMEOUT(ts) ({ (ts).spin = 0; })
> +#define RES_INIT_TIMEOUT(ts) ({ (ts).spin = 0; (ts).wait = res_smp_cond_load_acquire_waiting(); })

First of all, I don't really like the smp_cond_load_acquire_waiting(),
that's an implementation detail of smp_cond_load_*_timewait() that
shouldn't leak outside. But more importantly, RES_CHECK_TIMEOUT() is
also used outside the smp_cond_load_acquire_timewait() condition. The
(ts).wait check only makes sense when used together with the WFE
waiting.

I would leave RES_CHECK_TIMEOUT() as is for the stand-alone cases and
just use check_timeout() in the smp_cond_load_acquire_timewait()
scenarios. I would also drop the res_smp_cond_load_acquire() macro since
you now defined smp_cond_load_acquire_timewait() generically and can be
used directly.

-- 
Catalin

