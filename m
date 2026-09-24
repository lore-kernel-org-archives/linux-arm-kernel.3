Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11FBC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkdsyrhyA/vNO4RhdAlaZTJ12eqNCfPF/sfVFVUwzLg=; b=oENXLmPHB96oauLwsf2R2eJ8qT
	egL98K/Bj4p7bcah9qLApwzw7de/rghdPn2o8XoJjx1h2BvO8xxQUs6arrqKcdaCLiQnT8uwN6JbV
	u+BaOLHZzsdMp8sNog4Th64iF+UPuoQrqMnCRSwH7J1qxcj2BmP70gpgq5Xh33JUu8lq8iAOQAjAY
	/c0cjBFereK6MuJxYy3R49ye81Vh4oJZD3LrnBYZZak0/n+fLkRzvwhdknsX5fHfm7/ZdI0JqONnl
	znMUjJcz/ni1skUsZqpDlpP2A5OtQmh59IXBZ0HSMgIOiIGmfCciKo7S1lcjDdhv/J2Q9YVbTzKlL
	kxoBtzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iTr-0000000AxvF-3L0s;
	Thu, 24 Sep 2026 12:23:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iTp-0000000AxuU-320r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 12:23:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 500FF152B;
	Thu, 24 Sep 2026 05:23:08 -0700 (PDT)
Received: from [10.57.83.110] (unknown [10.57.83.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C5E13F86C;
	Thu, 24 Sep 2026 05:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790252591; bh=6RiiprozYmDqlvYaiBGVz8TgL+fPnC8hgT90X3WinvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VL2sSYmXUX7Oe1yYpOSWfGPfVESz/LeVs6qkwp1c7ZID3I/9r7KlqFgNVuLSNzCV9
	 EeeFBxAp7V1h25U7R5kNeEy+s+vXRYgfbFAS4N86NhOR8+pYZ62Ffl8B6WkVroZ3GM
	 9+ukhLWw1BwYdiBWnZvL8p/PGxHli+OEN3B4LpSg=
Message-ID: <a37eb779-b180-450c-8691-8d31b9717f16@arm.com>
Date: Thu, 24 Sep 2026 13:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: use hw_pte_val for HW PTE loads and stores
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20260922-pte0_arm-v2-0-a3f1ddff0a8a@arm.com>
 <20260922-pte0_arm-v2-3-a3f1ddff0a8a@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260922-pte0_arm-v2-3-a3f1ddff0a8a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_052313_839390_5A11DBF7 
X-CRM114-Status: GOOD (  17.51  )
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

On 22/09/2026 18:31, Muhammad Usama Anjum wrote:
> __ptep_get() returns a SW PTE value, while __set_pte_nosync() accepts
> one. When HW PTE storage uses a distinct hw_pte_t, reading or writing
> *ptep as a pte_t no longer satisfies those interfaces.
> 
> Use hw_pte_val() to expose the pteval_t stored in either the hw_pte_t
> wrapper or its pte_t alias. __set_pte_nosync() writes pte_val(pte) to
> that storage, while __ptep_get() reads it and reconstructs a pte_t with
> __pte().
> 
> This avoids imposing a generic conversion interface between HW and SW
> PTE representations, which may require architecture-specific context
> in the future.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/include/asm/pgtable.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 4768ec59de555..ce6580ab63128 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -360,7 +360,7 @@ static inline pte_t pte_clear_uffd(pte_t pte)
>  
>  static inline void __set_pte_nosync(hw_pte_t *ptep, pte_t pte)
>  {
> -	WRITE_ONCE(*ptep, pte);
> +	WRITE_ONCE(hw_pte_val(*ptep), pte_val(pte));
>  }
>  
>  static inline void __set_pte_complete(pte_t pte)
> @@ -381,7 +381,7 @@ static inline void __set_pte(hw_pte_t *ptep, pte_t pte)
>  
>  static inline pte_t __ptep_get(hw_pte_t *ptep)
>  {
> -	return READ_ONCE(*ptep);
> +	return __pte(READ_ONCE(hw_pte_val(*ptep)));
>  }
>  
>  extern void __sync_icache_dcache(pte_t pteval);
> 


