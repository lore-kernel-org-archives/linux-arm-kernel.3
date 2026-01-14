Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17864D31A16
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bsSYT5Z1t0Ue69EheEHF7hxKttSFoeDbi3ynLX/3AM=; b=EK04EOCeiV0MDgrifb9mV1CI4a
	Ij1h5EaO/ZlHd0LB8giyOI/ilGnUZMAtE+8gBL59BjSdv9dMC85X4I4ykgN3jIlj9DuJF6nkAm/M6
	j2+s9kiGb84yVaGI4dCrnqBYM7a7daTuh+9DKRUVqfvLdErQUYKdHtN6GCL8/rsc08PDFOWMjkArF
	owMUJZWvUGYNeAhxobxfsjG0zNGwms0StsweWmPJTINh5gY6i3uxUcDWKi5p2rZqeCTUSkuorqj8v
	IddSll7DTszrkRb6Zqx19XYsRl/1JtY8vcjKvVxZbXgwJugjNs55USt2hMfWt5n7SjCWSebp609i4
	p/QzYVTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvBA-00000008BLC-1Buy;
	Wed, 14 Jan 2026 07:20:32 +0000
Received: from smtp-out3.simply.com ([94.231.106.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvAw-00000008BJr-0CSu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 07:20:25 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4drcvb0mT6z1DR2b;
	Wed, 14 Jan 2026 08:20:11 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4drcvY6Y97z1DDXQ;
	Wed, 14 Jan 2026 08:20:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1768375210;
	bh=+bsSYT5Z1t0Ue69EheEHF7hxKttSFoeDbi3ynLX/3AM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W0aE3JG9goSHRurW/f80QzESeYLCdz+1cCdlJriVIGX/Ex1LcwRgyEotsO+y02khS
	 FhemM5xiIXD5RYq2dB6AZqI2t8TT/4xXbpur4a/f7pRBb3H2S+LkwN0GSy2rANeE1D
	 Pgsg4O//8AASht2KWtGRQK2AaPGI5F2sOEAbuLOqCRbtqk7ar1sH1X9impRapmfR68
	 JsDB2vJ2shh93AI3xLEc371Bwxp3owy1ZLilXgIqaDVXYrndrwpqo9JHNNqgET7dzy
	 tcIDzuCYYnQoxRAZrybVgK7ezKJw0EEplTcQoXefOAkjkbsbESP4Cja7daHOaHwUWK
	 nlNb1c20WwN1w==
Message-ID: <6c0a9851-9ec9-4a49-9d77-171f36a78448@gaisler.com>
Date: Wed, 14 Jan 2026 08:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/14] sparc/mm: implement arch_flush_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-5-kevin.brodsky@arm.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20251215150323.2218608-5-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232018_388778_67336BCD 
X-CRM114-Status: GOOD (  20.18  )
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

On 2025-12-15 16:03, Kevin Brodsky wrote:
> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
> 
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter.
> 
> Note: the additional this_cpu_ptr() call on the
> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
> patch.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/sparc/include/asm/tlbflush_64.h | 2 +-
>  arch/sparc/mm/tlb.c                  | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 8b8cdaa69272..925bb5d7a4e1 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -43,8 +43,8 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  
>  void flush_tlb_pending(void);
>  void arch_enter_lazy_mmu_mode(void);
> +void arch_flush_lazy_mmu_mode(void);
>  void arch_leave_lazy_mmu_mode(void);
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
>  
>  /* Local cpu only.  */
>  void __flush_tlb_all(void);
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index a35ddcca5e76..7b5dfcdb1243 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -59,12 +59,19 @@ void arch_enter_lazy_mmu_mode(void)
>  	tb->active = 1;
>  }
>  
> -void arch_leave_lazy_mmu_mode(void)
> +void arch_flush_lazy_mmu_mode(void)
>  {
>  	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
>  
>  	if (tb->tlb_nr)
>  		flush_tlb_pending();
> +}
> +
> +void arch_leave_lazy_mmu_mode(void)
> +{
> +	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> +
> +	arch_flush_lazy_mmu_mode();
>  	tb->active = 0;
>  	preempt_enable();
>  }

Acked-by: Andreas Larsson <andreas@gaisler.com>

Cheers,
Andreas


