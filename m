Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F34CA1006
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+KZq7FEh1HiZtccp84BCLyXrmJYg2gHHvn4Bx4DxxU=; b=hOysymxcaobgRvajje3pWyleTP
	L+QiFN5i5yIyCaan+Kv3QpUQoqURgZyNe+Zf2v20oKaUw34KRQ8iFwANYPVQ4BLxGrRRGPRc3O6qP
	LqVUUGRYlbvMI8KepMlOD+FuN9XBfzV/esmA3Hyq7qOJ0hRZt4oVAW6MPXuSUDtpS+XcThRGP9aJM
	/cipY/228kbdUEjSnF6oWbA92BAysq+wVKRbjCMZY+2NxQqy2e+fm+aiJMFlQ3hmYyjiiiLrdKSb/
	cmm1GUM4CSOJekj0XLhctB5XYblDSuLVy+OnsEyVnAsZkcM/HLZzKVpNIg2wiYS3rVacz2TQBadAE
	8+9oUiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5wM-0000000CwJj-1MRE;
	Mon, 01 Sep 2025 14:55:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut30U-0000000C6NV-2nCI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 11:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ED9340AF1;
	Mon,  1 Sep 2025 11:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A105C4CEF0;
	Mon,  1 Sep 2025 11:47:26 +0000 (UTC)
Date: Mon, 1 Sep 2025 12:47:24 +0100
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
Subject: Re: [PATCH v4 2/5] arm64: barrier: Add
 smp_cond_load_relaxed_timewait()
Message-ID: <aLWHzEAx_-BozA4V@arm.com>
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
 <20250829080735.3598416-3-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829080735.3598416-3-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_044730_722871_A5CA841C 
X-CRM114-Status: GOOD (  13.37  )
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

On Fri, Aug 29, 2025 at 01:07:32AM -0700, Ankur Arora wrote:
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index f5801b0ba9e9..9b29abc212db 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -219,6 +219,28 @@ do {									\
>  	(typeof(*ptr))VAL;						\
>  })
>  
> +extern bool arch_timer_evtstrm_available(void);

In theory, this doesn't work if CONFIG_ARM_ARCH_TIMER is disabled,
though that's not the case for arm64. Maybe add a short comment that's
re-declared here to avoid include dependencies.

> +
> +#define smp_cond_load_relaxed_timewait(ptr, cond_expr, time_check_expr)	\
> +({									\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	bool __wfe = arch_timer_evtstrm_available();			\
> +									\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr)						\
> +			break;						\
> +		if (time_check_expr)					\
> +			break;						\
> +		if (likely(__wfe))					\
> +			__cmpwait_relaxed(__PTR, VAL);			\
> +		else							\
> +			cpu_relax();					\
> +	}								\
> +	(typeof(*ptr)) VAL;						\
> +})
> +
>  #include <asm-generic/barrier.h>
>  
>  #endif	/* __ASSEMBLY__ */

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

