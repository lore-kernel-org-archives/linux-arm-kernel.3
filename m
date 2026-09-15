Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7B7C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdW9aBAWYtF2a7cHNlg0ZUdW7R/41cFQiuZoqmyaai0=; b=Jn9tOv6HKsA64F
	1ic5a3XVJP1WFmmGrCYYxlY+7ImZnHbFNmuqI6BIiUvQ7LoJkdlAa3x7JATLvuq3B3gccuHRZdxZO
	E03LCcdQoW5anHJvF3QIAkeqntB+WmoON8FIwB1XE09qlaicFdFYDznJ9kXCHIbvhGipo8WsH7JOF
	uPDuy2G3IHy17IUlr8PrVFNX+CJPMjRNCFd+gd8sExMn8q8oeiuTuBVjOh08aCWUVupD7UbffZwcz
	Bd4qNxVXuai+uBYh9J7nESO3mZQjPaxTOi3RERdYoAaJCzt9Uczb/Bl4okNfk5qG7zbEiJs0QSb4w
	sdIDXm89u1cJGDDMksSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U22-00000006uj3-0pxo;
	Tue, 15 Sep 2026 14:21:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U1z-00000006uiF-2Z6h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:21:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 558261516;
	Tue, 15 Sep 2026 07:21:03 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7228C3F7B4;
	Tue, 15 Sep 2026 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789482066; bh=8kgnQwL/0VBtF0XCi65qh7izruKbtNAb+I2J2OSqPYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u2x7AyH3rzvJaL/E5rRKKWZew33lKE9xTelpEjt5w8ejIjdXo5y568qfagnCugAVc
	 ml63aQPy1N9ysR2RDt3avZWoyfSvnEzRK/kpWHNnr53BvhHjh8CW+KbzR9s7gHSv3/
	 JTCydre/4J1Nh7vc/NhfjTYVB/DD3qsMUNxAJ/8c=
Message-ID: <b78df0e5-9375-47d6-a203-95b931c988d7@arm.com>
Date: Tue, 15 Sep 2026 15:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/21] arm64: percpu: Remove _pcp_protect*() wrappers
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-22-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-22-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_072107_730783_AAA774E1 
X-CRM114-Status: GOOD (  17.35  )
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
Cc: ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 9/8/26 16:17, Mark Rutland wrote:
> Now that all this_cpu_*() operations are preemptible, there are no users
> of _pcp_protect() or _pcp_protect_return().
> 
> Remove them both, along with the associated comment regarding
> preemption.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/percpu.h | 27 ---------------------------
>  1 file changed, 27 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 5cd98e20e825d..6ec6e212932d3 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -368,33 +368,6 @@ PERCPU_CMPXCHG_OP(x,  , 64)
>  #undef PERCPU_XCHG_OP
>  #undef PERCPU_CMPXCHG_OP
>  
> -/*
> - * It would be nice to avoid the conditional call into the scheduler when
> - * re-enabling preemption for preemptible kernels, but doing that in a way
> - * which builds inside a module would mean messing directly with the preempt
> - * count. If you do this, peterz and tglx will hunt you down.
> - *
> - * Not to mention it'll break the actual preemption model for missing a
> - * preemption point when TIF_NEED_RESCHED gets set while preemption is
> - * disabled.
> - */
> -
> -#define _pcp_protect(op, pcp, ...)					\
> -({									\
> -	preempt_disable_notrace();					\
> -	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
> -	preempt_enable_notrace();					\
> -})
> -
> -#define _pcp_protect_return(op, pcp, args...)				\
> -({									\
> -	typeof(pcp) __retval;						\
> -	preempt_disable_notrace();					\
> -	__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);	\
> -	preempt_enable_notrace();					\
> -	__retval;							\
> -})
> -
>  #define _pcp_wrap(op, pcp, ...)						\
>  ({									\
>  	op(&(pcp), __VA_ARGS__);					\
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


