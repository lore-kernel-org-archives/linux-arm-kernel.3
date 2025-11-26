Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1B0D10390
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjCJduBhG222XQINroLnKpsK8H0msREV7UfwrKJclxE=; b=wKC1MmI2in7CErr2gE6Md0r0ZL
	IUp/NWkiNIcJqoPKcjk8M1DoCNT5WCpVCpRtu9+U5LUwa85UkLrfxH50N3HrPrZiwNlvfBKzE4Jze
	xyPLT1dBtf8FX0U1+4kBzFUH7PBEXsMFo/NZOj+CPcWu6kNTAEGudTo2FFDV+/gRB9Fikbm36BAsg
	N3TUVTqupxj68URChUfPWEfUbiTiRl39/QQK4WHLHcM3MPE3rQL6sG03cGTS1nogc7w6Jh3Y5yI5Z
	c6AX0oktEk62vTOc5Vg1RWtB1/0fTIXs3rUZltG3eU4kbY9+M1dFIt4Z/G5hHV5g2UJTPKpOSbCpo
	/NoGGsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBx9-0000000EiwL-2VQF;
	Wed, 26 Nov 2025 09:36:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBx6-0000000Eivs-1tj0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 09:36:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF9EA168F;
	Wed, 26 Nov 2025 01:36:33 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 665E93F6A8;
	Wed, 26 Nov 2025 01:36:39 -0800 (PST)
Date: Wed, 26 Nov 2025 09:36:32 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Seongsu Park <sgsu.park@samsung.com>
Cc: will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
	gary@garyguo.net, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: atomics: lse: Remove unused parameters from
 ATOMIC_FETCH_OP_AND macros
Message-ID: <aSa_YjbomFs2AIWv@J2N7QTR9R3>
References: <CGME20251126021037epcas1p2c5caf948ede87748ee1d4ef536a62126@epcas1p2.samsung.com>
 <20251126021025.3239562-1-sgsu.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126021025.3239562-1-sgsu.park@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_013644_531318_82DA2196 
X-CRM114-Status: GOOD (  14.60  )
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

On Wed, Nov 26, 2025 at 11:10:25AM +0900, Seongsu Park wrote:
> The ATOMIC_FETCH_OP_AND and ATOMIC64_FETCH_OP_AND macros accept 'mb' and 
> 'cl' parameters but never use them in their implementation. These macros 
> simply delegate to the corresponding andnot functions, which handle the 
> actual atomic operations and memory barriers.
> 
> Signed-off-by: Seongsu Park <sgsu.park@samsung.com>

FWIW, this was a leftover from commit:

  5e9e43c987b2 ("arm64: atomics: lse: define ANDs in terms of ANDNOTs")

... where I missed the leftover macro arguments.

AFAICT there aren't any other leftover macro arguments from that round
of asm improvments (or otherwise), so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/atomic_lse.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/atomic_lse.h b/arch/arm64/include/asm/atomic_lse.h
> index 87f568a94e55..afad1849c4cf 100644
> --- a/arch/arm64/include/asm/atomic_lse.h
> +++ b/arch/arm64/include/asm/atomic_lse.h
> @@ -103,17 +103,17 @@ static __always_inline void __lse_atomic_and(int i, atomic_t *v)
>  	return __lse_atomic_andnot(~i, v);
>  }
>  
> -#define ATOMIC_FETCH_OP_AND(name, mb, cl...)				\
> +#define ATOMIC_FETCH_OP_AND(name)					\
>  static __always_inline int						\
>  __lse_atomic_fetch_and##name(int i, atomic_t *v)			\
>  {									\
>  	return __lse_atomic_fetch_andnot##name(~i, v);			\
>  }
>  
> -ATOMIC_FETCH_OP_AND(_relaxed,   )
> -ATOMIC_FETCH_OP_AND(_acquire,  a, "memory")
> -ATOMIC_FETCH_OP_AND(_release,  l, "memory")
> -ATOMIC_FETCH_OP_AND(        , al, "memory")
> +ATOMIC_FETCH_OP_AND(_relaxed)
> +ATOMIC_FETCH_OP_AND(_acquire)
> +ATOMIC_FETCH_OP_AND(_release)
> +ATOMIC_FETCH_OP_AND(        )
>  
>  #undef ATOMIC_FETCH_OP_AND
>  
> @@ -210,17 +210,17 @@ static __always_inline void __lse_atomic64_and(s64 i, atomic64_t *v)
>  	return __lse_atomic64_andnot(~i, v);
>  }
>  
> -#define ATOMIC64_FETCH_OP_AND(name, mb, cl...)				\
> +#define ATOMIC64_FETCH_OP_AND(name)					\
>  static __always_inline long						\
>  __lse_atomic64_fetch_and##name(s64 i, atomic64_t *v)			\
>  {									\
>  	return __lse_atomic64_fetch_andnot##name(~i, v);		\
>  }
>  
> -ATOMIC64_FETCH_OP_AND(_relaxed,   )
> -ATOMIC64_FETCH_OP_AND(_acquire,  a, "memory")
> -ATOMIC64_FETCH_OP_AND(_release,  l, "memory")
> -ATOMIC64_FETCH_OP_AND(        , al, "memory")
> +ATOMIC64_FETCH_OP_AND(_relaxed)
> +ATOMIC64_FETCH_OP_AND(_acquire)
> +ATOMIC64_FETCH_OP_AND(_release)
> +ATOMIC64_FETCH_OP_AND(        )
>  
>  #undef ATOMIC64_FETCH_OP_AND
>  
> -- 
> 2.34.1
> 

