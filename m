Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4830C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7Hv2hdAx0Pt2wkqhDEIzVP009P1CgpW1A1M0O6cjIY=; b=n+qIDwdu4F3JpR+88p9SzV6YXW
	UJq378Tnu7HThpON+x+Va5D274iT0v0FrxqBquaS+jcbcm2R3KOPchUyGUAAUyQqXboU67Sy4Nm2E
	QLA5LUb3Y4tVVW+lV0CuvuX9nKGvDJBaUiTTfx/DCECAmI9PHSfb1Hxm0DN4tD6eRRnz3R3TQ9Yoj
	py2OLKsrqICsed20d2Jv9tKUAG/nZf32E7ZFMQPPBdg8pe6dphgJ1vHnLpkB55Dt2voQ+S7mYYwPD
	Npz8LS9G3iJFbh/cYnXdecsbsFsZo1y2LcFyaQ1B2OGaqfjk9vCE5FbZPaANdrKslJXb3Fhk2r326
	IEWECwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwWJ-00000008URd-14Uk;
	Mon, 19 May 2025 09:10:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwUF-00000008Try-43yx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 09:08:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 543B51655;
	Mon, 19 May 2025 02:08:28 -0700 (PDT)
Received: from [10.57.95.69] (unknown [10.57.95.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEE2E3F6A8;
	Mon, 19 May 2025 02:08:39 -0700 (PDT)
Message-ID: <5763d921-f8a8-4ca6-b5b5-ad96eb5cda11@arm.com>
Date: Mon, 19 May 2025 10:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Restrict pagetable teardown to avoid false
 warning
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: david@redhat.com, anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250518095445.31044-1-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250518095445.31044-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_020844_055265_F5D96441 
X-CRM114-Status: GOOD (  19.89  )
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

On 18/05/2025 10:54, Dev Jain wrote:
> Commit 9c006972c3fe removes the pxd_present() checks because the caller

nit: please use the standard format for describing commits: Commit 9c006972c3fe
("arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table()")

> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
> a pmd_present() check in pud_free_pmd_page().
> 
> This problem was found by code inspection.
> 
> This patch is based on 6.15-rc6.

nit: please remove this to below the "---", its not part of the commit log.

> 
> Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table())
> 

nit: remove empty line; the tags should all be in a single block with no empty
lines.

> Cc: <stable@vger.kernel.org>
> Reported-by: Ryan Roberts <ryan.roberts@arm.com> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> v1->v2:
>  - Enforce check in caller
> 
>  arch/arm64/mm/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ea6695d53fb9..5b1f4cd238ca 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1286,7 +1286,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  	next = addr;
>  	end = addr + PUD_SIZE;
>  	do {
> -		pmd_free_pte_page(pmdp, next);
> +		if (pmd_present(*pmdp))

pmd_free_pte_page() is using READ_ONCE() to access the *pmdp to ensure it can't
be torn. I suspect we don't technically need that in these functions because
there can be no race with a writer. But the arm64 arch code always uses
READ_ONCE() for dereferencing pgtable entries for safely. Perhaps we should be
consistent here?

		if (pmd_present(READ_ONCE(*pmdp)))

> +			pmd_free_pte_page(pmdp, next);
>  	} while (pmdp++, next += PMD_SIZE, next != end);
>  
>  	pud_clear(pudp);


