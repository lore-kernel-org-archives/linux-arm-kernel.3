Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F6ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 03:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PpcYW9rXkka09Jy11m9xJQRt/n8jdZMdqOTeKYVeZk=; b=2Y+paizhr7TFScP+Yd0ufKf+SI
	FJL338Ylq2yHHR8SEtgnIMN3tZoan9S0eTVugTKiwmxjstSAhPx+06SLB+0TLjDgfYNnLlZyF/gIJ
	IC0UE+WrlfrqVUVtc8j52zgELDKX/txz5CaptJYpIUTlgQbv8+V342oFMAFKkcdrnEIaD49YvhiRX
	ClEanQawmMysRyk6a2rSyAXXL4kko3WJyiGhmFfsT76DYUqaHbQfcxwEaoV7LrxDi9sa0f3hR/RKq
	bqVIeTF65ZM/KpNSzSiBOJ3k+nua1E4RGguYs5mBANdEL1tscF3WLJLDgSf9p5iOxu55ncsF1f8Yr
	2VII5DXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUPI-0000000Cy5k-2lvl;
	Wed, 05 Nov 2025 03:42:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUPF-0000000Cy5A-341P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 03:41:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29555415c5fso51170895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 19:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762314117; x=1762918917; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9PpcYW9rXkka09Jy11m9xJQRt/n8jdZMdqOTeKYVeZk=;
        b=mw43FkwHptiKiebzDdlRzgwJJ0VsqkIgmD+Xfnol9C1iwjvMYcgobTKUOLdcxM3NCP
         LCX6u+OKUnYe/b2QPhZAdKUTYKLxLo8UEuMx5DBlPhzt+CedcSuUPCsUzw/dT0gKLqrY
         wrJf2Fv95rXaQYuYcZg680VQkdcqSYWvuUnX/W8PshKANufE1GEIhZ+ovjq3mhg27Isb
         aBJ3IkI6dgRgzvvUyMdQADceDXBkG3eJwN+sIJnNeioA+z9Y5D3JQ6CruP3zWLfPhVhw
         t/NquOkJkE1gQRfSHiRmeYUpam9r580o7PgkT0uHYhUZuB/nFJrgx+M5MHNkPA1VZTir
         oUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762314117; x=1762918917;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PpcYW9rXkka09Jy11m9xJQRt/n8jdZMdqOTeKYVeZk=;
        b=plsq4KyaboX0DDC2rmTBzDFSbutHSMQppSVfpnqhfCRKkmHpbgCfjZpzMgQrxZNu9E
         mZ3hbId5kJhE/GhmntQgEktkg9kW5jHDNdYUY75dEd9pvModgYCw4jd7Uc7yYPYD5uQG
         Ov0bGkT1RjCjKuDcHyZqHQaNLSARGuwFq3+Qkd903M/aM2G1pJszgcr9DzC27XsVTJvK
         C7UfB/SEX7j/S60T/l4/czWT4BUvBdb2YN6OXUGO8R/gFJ6SJkaLclwz77hzZ9aTUP5J
         21gfeqKM9SjJ6a/vo0MWsODx58KliXvYxymSsVXhs6DVwMOiOv3b6hBrHcE3WkDudAL5
         Agvw==
X-Forwarded-Encrypted: i=1; AJvYcCV/cdUPTtB8ys6PxN/TH13oq/iX3qu7IZNeTnVkEZOE58R8f7G8ZoMJRLf82ZEh0cGMlQrBmGdWVRkqbSqJioMR@lists.infradead.org
X-Gm-Message-State: AOJu0YxuHWbHiUJebS4KOIRAgihdvzCcU71SCkjbvaTaF+vJYWwAWKBZ
	Al8Uz9FqbfX8/4LVdFZOm3F97wXHm/TSPlN+0on1h9aLMP1ovfvGt8tH
X-Gm-Gg: ASbGncumHbsb3oQy2FhyllhGeFjBU8QDJXD+tqhP4ygWuPBBCWBtFxMP5Lr0TpFb6p0
	QTz7tFTJVZrDO24wHDz8F+77XpddQQsiUoTjtdwWUl1IEAeSaXemyaODa2Ty3vh0Xr8+hcJJTek
	Hp+yDlvnbfpOJ0qiw/GukHjbuRGK8AWIOHOeJrZRxpfoRqGxDxM/Ldo56HgdkUmNFX0luPEgTAf
	vCJkwVpFQdoMVlbNNsfCaJMzuq16E5BJ8+NtpY/puPEZQyrrEaLEZ3lFas0vysY1uY8IqPAGWMO
	rNDVzaDuZFs8MqPTr8waihIFzUKeKYZt5/r8J/C5o6wK+z6DKEnkF/rPBjfu+zqQnZ9VzcQal/x
	gCi61xD3lBOTQAExCg/8tIBso2ErWRM30ERC+60VL7BbFxazXcOUQHZj851RY0J+2xEW26A==
X-Google-Smtp-Source: AGHT+IHU+u4c4m70sp/Km2qphWV2GETQaiqBJlBLQ9oH8KuDbSRxjLHzXNgoB+GOOUcEEs7QOw2HMQ==
X-Received: by 2002:a17:903:944:b0:295:7f1d:b02d with SMTP id d9443c01a7336-2962ad3340fmr26429125ad.22.1762314116721;
        Tue, 04 Nov 2025 19:41:56 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a61418sm43663725ad.96.2025.11.04.19.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 19:41:56 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 03/12] powerpc/mm: implement arch_flush_lazy_mmu_mode()
In-Reply-To: <20251029100909.3381140-4-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 08:45:06 +0530
Message-ID: <87pl9x41c5.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-4-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_194157_793938_2DCA8D6A 
X-CRM114-Status: GOOD (  26.23  )
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

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
>
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter.
>
> Note: the additional this_cpu_ptr() on the
> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
> patch.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 146287d9580f..7704dbe8e88d 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	batch->active = 1;
>  }
>  
> +static inline void arch_flush_lazy_mmu_mode(void)
> +{
> +	struct ppc64_tlb_batch *batch;
> +
> +	batch = this_cpu_ptr(&ppc64_tlb_batch);
> +
> +	if (batch->index)
> +		__flush_tlb_pending(batch);
> +}
> +

This looks a bit scary since arch_flush_lazy_mmu_mode() is getting
called from several of the places in later patches(). 

Although I think arch_flush_lazy_mmu_mode() will only always be called
in nested lazy mmu case right?

Do you think we can add a VM_BUG_ON(radix_enabled()); in above to make
sure the above never gets called in radix_enabled() case. 

I am still going over the patch series, but while reviewing this I
wanted to take your opinion.

Ohh wait.. There is no way of knowing the return value from
arch_enter_lazy_mmu_mode().. I think you might need a similar check to
return from arch_flush_lazy_mmu_mode() too, if radix_enabled() is true.


-ritesh


>  static inline void arch_leave_lazy_mmu_mode(void)
>  {
>  	struct ppc64_tlb_batch *batch;
> @@ -49,14 +59,11 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  		return;
>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
>  
> -	if (batch->index)
> -		__flush_tlb_pending(batch);
> +	arch_flush_lazy_mmu_mode();
>  	batch->active = 0;
>  	preempt_enable();
>  }
>  
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
> -
>  extern void hash__tlbiel_all(unsigned int action);
>  
>  extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
> -- 
> 2.47.0

