Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6265ACD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rutAQAQbRcONt+TKAz5ivC7J2+sBJj9YBxxqg/7YtKM=; b=EVN1JMpuQSS6p+fll87k96VKtz
	HloobOHP0JtCQqIDgJlJ2v4+Pm3e/iQiSe30MnP4FYWmIX6m9FQZfCMQCeRdSUm83MR4gVTW5s6Xg
	DkaRgaUUrZsQN5g0dSLtUn4BuZoe9WP+8adDe2G7pjRNlXf0ZwZ8JyGmGkOZ8GbGkcIaarLczkigx
	DbMalNAMSqDcaDIdbjFriY32ejB+GrkhlVQsGVynHG5Zee8ChfkBodxJ6GYP2T6o2XZG/4n3sN2uX
	nXWgURWW+cOuNfRsbsrqgcipfH21d4XwuiiV0WYbY/LKlIxMjo9v7eeK+OXMbTJWpgMIuNMl9i/O+
	QwUV0Ieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVaA-000000036gd-2C7d;
	Mon, 08 Jun 2026 08:43:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVa7-000000036gG-1APg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:43:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DE1A3290;
	Mon,  8 Jun 2026 01:43:30 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 693C33F99C;
	Mon,  8 Jun 2026 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780908215; bh=FjzT5RcBQdDdIEoaNoG32miDcUBIMi1hQyHWzkZszv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3K2BCo0/UBNqU0k0thuEuhnek8OYAJF79Xh+dFBb16uvJzUHv0//2JXHjFGytIIY
	 ZTcaOYXijTpBDiXvaHTdKouF7fWJCVNNJxmbHGVH4xqTlTynktxZc/o7XT6d1vqF9l
	 2bj0jXSxM/9AaXUe8OGPBioPd65MM7iMjNx4qrig=
Date: Mon, 8 Jun 2026 09:43:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tejun Heo <tj@kernel.org>
Cc: Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrea Righi <arighi@nvidia.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 bpf-next] arm64: mm: Complete the PTE store in
 ptep_try_set()
Message-ID: <aiaAsTnEtwHx9JqE@arm.com>
References: <088f52fd25860ca961449d53f91b214a@kernel.org>
 <5f68f44310d4878185fd5ebc52d66530b99f174c6d04ab1170dc53cefaa54568@mail.kernel.org>
 <1780862659.ccb18e27e916dc4b@kernel.org>
 <aiXVFK_qb54is8b1@arm.com>
 <7f5f7c94601312c1a401fb18998291cc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f5f7c94601312c1a401fb18998291cc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_014339_675139_71CC3330 
X-CRM114-Status: GOOD (  20.00  )
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

On Sun, Jun 07, 2026 at 09:25:47PM -1000, Tejun Heo wrote:
> ptep_try_set() installs a kernel PTE with try_cmpxchg() but, unlike
> __set_pte(), skips the barriers that arm64 requires after writing a valid
> kernel PTE. Without them a subsequent access can fault instead of seeing
> the new mapping.
> 
> Issue them with emit_pte_barriers() rather than __set_pte_complete().
> ptep_try_set() must finish the store before it returns, but
> __set_pte_complete() would defer the barriers when the calling context is in
> lazy MMU mode.
> 
> v2: Emit the barriers directly instead of __set_pte_complete(). (Catalin)

Nit: I'd place this after the --- line.

> Fixes: 258df8fce42f ("mm: Add ptep_try_set() for lockless empty-slot installs")
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Link: https://lore.kernel.org/all/aiRFcz78QTZdIHHB@arm.com/
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 3ce0f2a6cab6..3e579c26b383 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1838,7 +1838,16 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
>  {
>  	pteval_t old = 0;
>  
> -	return try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte));
> +	if (!try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte)))
> +		return false;
> +
> +	/*
> +	 * The store must be complete by the time this returns, but the caller
> +	 * may be in lazy MMU mode, where __set_pte_complete() would defer the
> +	 * barriers. Issue them directly.
> +	 */
> +	emit_pte_barriers();
> +	return true;
>  }
>  #define ptep_try_set ptep_try_set

It looks fine now. Thanks!

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

