Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2DDCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 04:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIbJnt34Jnm75Xf3+0FOg0UHm+WTC5nRGyPf7jeT9To=; b=y6pFvCs8ZLk7HOUXHZybCqdFQF
	FK7Q0JPqj2E0LAsd1ZNJEjsGBx0yMJHGEGHso40d27QxK0q4lQ5MeE912xdXzV1X3KaxgG7lt+OjW
	kllSpfLz2z8MVC5B2Ay+1/nsnlkoAE1FLWJAEFkiJJRgfidoAKlstXM97jqrihzFCMhVJv6hW8phL
	KAcnJS6dOyZ6nHHLRMMAIvAG5wTSX9urU7an7yBMC7MTqL7AlrkFJZaXJjOG2J5AFSPU2qdgGVHng
	+jIKOv1tKzbHkjFpcoF5T7zX0fJ8hk1TrcVrBZK8Gn6MhflHRRvH1qkiuLEMFvIskl6OjxhK/DOJ1
	ZdkFHAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFlp1-00000009Ac9-1JHj;
	Mon, 03 Nov 2025 04:05:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFlow-00000009AbV-0TOa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 04:05:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D20A51A9A;
	Sun,  2 Nov 2025 20:05:18 -0800 (PST)
Received: from [10.164.136.41] (unknown [10.164.136.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5FCD3F694;
	Sun,  2 Nov 2025 20:05:23 -0800 (PST)
Message-ID: <e564295b-d5b6-4544-ab8e-dad48a2aee1e@arm.com>
Date: Mon, 3 Nov 2025 09:35:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] [PATCH v2] arm64/mm: Elide TLB flush in certain pte
 protection transitions
To: catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, wangkefeng.wang@huawei.com,
 ryan.roberts@arm.com, baohua@kernel.org, pjaroszynski@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017160251.96717-1-dev.jain@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20251017160251.96717-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_200530_204953_F5C5EA0A 
X-CRM114-Status: GOOD (  18.74  )
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

Gentle ping

On 17/10/25 9:32 pm, Dev Jain wrote:
> Currently arm64 does an unconditional TLB flush in mprotect(). This is not
> required for some cases, for example, when changing from PROT_NONE to
> PROT_READ | PROT_WRITE (a real usecase - glibc malloc does this to emulate
> growing into the non-main heaps), and unsetting uffd-wp in a range.
>
> Therefore, implement pte_needs_flush() for arm64, which is already
> implemented by some other arches as well.
>
> Running a userspace program changing permissions back and forth between
> PROT_NONE and PROT_READ | PROT_WRITE, and measuring the average time taken
> for the none->rw transition, I get a reduction from 3.2 microseconds to
> 2.85 microseconds, giving a 12.3% improvement.
>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> mm-selftests pass. Based on 6.18-rc1.
>
> v1->v2:
>   - Drop PTE_PRESENT_INVALID and PTE_AF checks, use ptdesc_t instead of
>     pteval_t, return !!diff (Ryan)
>
>   arch/arm64/include/asm/tlbflush.h | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 18a5dc0c9a54..40df783ba09a 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -524,6 +524,33 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>   {
>   	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
>   }
> +
> +static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
> +{
> +	ptdesc_t diff = oldval ^ newval;
> +
> +	/* invalid to valid transition requires no flush */
> +	if (!(oldval & PTE_VALID))
> +		return false;
> +
> +	/* Transition in the SW bits requires no flush */
> +	diff &= ~PTE_SWBITS_MASK;
> +
> +	return !!diff;
> +}
> +
> +static inline bool pte_needs_flush(pte_t oldpte, pte_t newpte)
> +{
> +	return __pte_flags_need_flush(pte_val(oldpte), pte_val(newpte));
> +}
> +#define pte_needs_flush pte_needs_flush
> +
> +static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
> +{
> +	return __pte_flags_need_flush(pmd_val(oldpmd), pmd_val(newpmd));
> +}
> +#define huge_pmd_needs_flush huge_pmd_needs_flush
> +
>   #endif
>   
>   #endif

