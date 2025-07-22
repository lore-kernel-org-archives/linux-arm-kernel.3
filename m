Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561D1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 11:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjvIu0AiEF6PoDheUCu9bA6PNVJuFkAx1z0Y/h5wkUg=; b=wbDCxL/7ByS/IdB3IrcGx78hSj
	fA2POJr8KHdqfZ0qWzF2Qp2sOmj7mKLCuNPY5Fm3b/xJgSNJMJP5poByYXK45Rw2WjDJOLm0nVq3j
	bWVdbquA5zXpSq9b7/ScAcCUDu5RujeEmdqKQpz1JQKDK4mha5QNwtr4YbJM1BLmDg+fjKa4vhph/
	4VGCKWzqIWEI62sukTk3Ht8V5YmxN6p/5eiWQFcG1n/7ZstU6dQ70KwIs8PjcutIJIa+X+4BnFtm+
	1zJY6kO8uMkq3MKJYFfY2DPPlbPVcV8SfoJtbP1IQvZ9yDiZVAbH8pNG4A7C9KVnLf0SSXYfZAZ0X
	qNoJmwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBWA-00000002KvW-23HO;
	Tue, 22 Jul 2025 11:50:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBJw-00000002J8h-0HDS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 11:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hjvIu0AiEF6PoDheUCu9bA6PNVJuFkAx1z0Y/h5wkUg=; b=CZVAXIncHDaonQtfPaCgkMruBM
	esjt0tHHfmgwxLIJHEvAUKDZqF41pHCsYuzxBAq90I9Jvg4Bj/VM1dkCxR9FdxLhCHNPRlBrvYTt5
	ro3bzKD4iB5oaHvXzscKPNSrZ2HpSvVj1/xv1eaVIW5XHgVKFp2ko1sIHyi0WHhsKxeRR1RrDy5L6
	w4VuI1+vSwfDL/tGpWL3L49riOOHF9VApaiEH6uAkwMw16jk+M0KVgXrCvmCfepbQY/31Y/iFfE3N
	+ItgVpekoy9KOdP/jEGkQBzetbqTexaL1yhK/CC5rt9+HsbJHsb5fj+GCX9Ng2Tbm7wXBCAdxV5V1
	Jkmlisrg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBJs-0000000BGaJ-2YpH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 11:38:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 852BF152B;
	Tue, 22 Jul 2025 04:37:54 -0700 (PDT)
Received: from [10.1.30.167] (XHFQ2J9959.cambridge.arm.com [10.1.30.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C77853F6A8;
	Tue, 22 Jul 2025 04:37:56 -0700 (PDT)
Message-ID: <ac0b2fcd-6f90-4802-be46-dc1c20d55d2e@arm.com>
Date: Tue, 22 Jul 2025 12:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] mm: Introduce FPB_RESPECT_WRITE for PTE batching
 infrastructure
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-5-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250718090244.21092-5-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_123805_028304_E7626DDF 
X-CRM114-Status: GOOD (  18.47  )
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

On 18/07/2025 10:02, Dev Jain wrote:
> Patch 6 optimizes mprotect() by batch clearing the ptes, masking in the new
> protections, and batch setting the ptes. Suppose that the first pte
> of the batch is writable - with the current implementation of
> folio_pte_batch(), it is not guaranteed that the other ptes in the batch
> are already writable too, so we may incorrectly end up setting the
> writable bit on all ptes via modify_prot_commit_ptes().
> 
> Therefore, introduce FPB_RESPECT_WRITE so that all ptes in the batch
> are writable or not.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  mm/internal.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 5b0f71e5434b..28d2d5b051df 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -208,17 +208,20 @@ typedef int __bitwise fpb_t;
>  /* Compare PTEs respecting the soft-dirty bit. */
>  #define FPB_RESPECT_SOFT_DIRTY		((__force fpb_t)BIT(1))
>  
> +/* Compare PTEs respecting the writable bit. */
> +#define FPB_RESPECT_WRITE		((__force fpb_t)BIT(2))
> +
>  /*
>   * Merge PTE write bits: if any PTE in the batch is writable, modify the
>   * PTE at @ptentp to be writable.
>   */
> -#define FPB_MERGE_WRITE			((__force fpb_t)BIT(2))
> +#define FPB_MERGE_WRITE			((__force fpb_t)BIT(3))
>  
>  /*
>   * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
>   * modify the PTE at @ptentp to be young or dirty, respectively.
>   */
> -#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(3))
> +#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(4))
>  
>  static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  {
> @@ -226,7 +229,9 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  		pte = pte_mkclean(pte);
>  	if (likely(!(flags & FPB_RESPECT_SOFT_DIRTY)))
>  		pte = pte_clear_soft_dirty(pte);
> -	return pte_wrprotect(pte_mkold(pte));
> +	if (likely(!(flags & FPB_RESPECT_WRITE)))
> +		pte = pte_wrprotect(pte);
> +	return pte_mkold(pte);
>  }
>  
>  /**


