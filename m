Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8A0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCjTDwFj2KWNd1jCDA9nTD0PkDT+GyDs4rwXMlsXX4Y=; b=ZUOu2i99lVNiiFQ8hKwqjcC630
	iajc9vMOtIgotlxUnlqD/ztnZVk+hy7DSsSFJvDQYNrfKTrzav3LypbngtRHOOF4qx70as6LQUmb8
	0xwIdkUsQG7cAR97cNLWyCaUAXqUhGVE0g0rRMBw+VfyDAjC2Xx5gWbkdWuQOOqDN0S6g1Cn5wUJR
	aE1IZXCcOblu4LY7uQhHbRWQ2XdEaKzQVQSDUb/rKU+42J5cGW1AXue9D7rVT8c9wcm7ABMYRXXlL
	1vbDLlroY5HhiTOsVTHz8r3GR0+HRLLeyTLIUe7csr8eRkCg5wJiX1qDUfVz/POhHpUp94/i/qbMp
	je/cH7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFx9M-0000000AEJE-1kLm;
	Mon, 03 Nov 2025 16:11:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFx9J-0000000AEIX-3JUs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:11:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF01A43237;
	Mon,  3 Nov 2025 16:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A46CC4CEE7;
	Mon,  3 Nov 2025 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762186276;
	bh=V1CU9ZdjaPBn/WuqIoDgCoBVzQIejoJ47+/3Iu7JZPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=npyBUuqjUIKg4InV+qpRD6OtpMB4/GHdS8B1NFF+Q9yYKiP+sb3TgKsbqJH8Sa1rZ
	 IjmKf10sHhPZ9tJBExNMfKK9yT/VFR2YIZ9V/xn9DQdnHw+celZDegZhXdLQrF/SN5
	 lUex3DQHMkchog6zMIgVbKEfsJTbKokiYZLXNK0+peJ+RcXLboT6AnCcS4v+iq0vdd
	 UNq+DePKElJQaoqkKpkF65sYRbAzqC1oOL9GKK49eQoY+wljWRBdmHyv0D0R45C04e
	 nEuXWJ5n/3CnJfkZVAWRCYTclKE+cKq52lFKq1tbquYMBGM5LejdtS3JnqVMyuKIJJ
	 wBZRvG6pryrXw==
Message-ID: <15381b5c-726f-4eda-8ffd-c95c0acd7635@kernel.org>
Date: Mon, 3 Nov 2025 17:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] sparc/mm: replace batch->active with
 in_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-11-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251029100909.3381140-11-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_081117_872456_72810E18 
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

On 29.10.25 11:09, Kevin Brodsky wrote:
> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper in_lazy_mmu_mode()
> to tell whether a batch struct is active instead of tracking it
> explicitly.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/sparc/include/asm/tlbflush_64.h | 1 -
>   arch/sparc/mm/tlb.c                  | 9 +--------
>   2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 4e1036728e2f..6133306ba59a 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -12,7 +12,6 @@ struct tlb_batch {
>   	unsigned int hugepage_shift;
>   	struct mm_struct *mm;
>   	unsigned long tlb_nr;
> -	unsigned long active;
>   	unsigned long vaddrs[TLB_BATCH_NR];
>   };
>   
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index 7b5dfcdb1243..879e22c86e5c 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,11 +52,7 @@ void flush_tlb_pending(void)
>   
>   void arch_enter_lazy_mmu_mode(void)
>   {
> -	struct tlb_batch *tb;
> -
>   	preempt_disable();
> -	tb = this_cpu_ptr(&tlb_batch);
> -	tb->active = 1;
>   }
>   
>   void arch_flush_lazy_mmu_mode(void)
> @@ -69,10 +65,7 @@ void arch_flush_lazy_mmu_mode(void)
>   
>   void arch_leave_lazy_mmu_mode(void)
>   {
> -	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> -
>   	arch_flush_lazy_mmu_mode();
> -	tb->active = 0;
>   	preempt_enable();
>   }
>   
> @@ -93,7 +86,7 @@ static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
>   		nr = 0;
>   	}
>   
> -	if (!tb->active) {
> +	if (!in_lazy_mmu_mode()) {
>   		flush_tsb_user_page(mm, vaddr, hugepage_shift);
>   		global_flush_tlb_page(mm, vaddr);
>   		goto out;

(messing up my transition to the email address as Thunderbird defaults 
to my old one still on mails received through RH servers)

Did we get this tested with some help from sparc64 folks?

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David


