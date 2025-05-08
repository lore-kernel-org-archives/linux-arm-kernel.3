Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DD9C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 05:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJaU7Taq2wkcBw5XP6I4muIyUr7EX1hFti7tkjljSfg=; b=Rd9i+P9A1p2W1DIfNH0Jc+fMiA
	Fu1mMoMrt7jWFpcPt9RzMRsg2RtIA+jhNZl9f4wxCkw5I+v0KgxnzvSUmTQCdgHui+WJIAeoZjwzs
	NfkMu8XdmHc4wNJyJ5g65HL5zXKa1ZQhtI7kc0U+jiZkpYC9sPrRTKFAJIFTSmXiLhPE0Y2oBvO9l
	riKOMxhEPrYlOA48+y7bo1o0jpOv564WQldSbq9+RLDTODs98jDcT05yZGEo08ie92BJoqiP+BIVh
	B8wfqJc/uIV/qrk1Prsxrz4pXX0WxizrV7Gg3oRck7qjLClLglR+ZxA9TFbeD5lIQfbEsnYJhgLyM
	pSmR6S9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCu5X-0000000HOYe-1DwX;
	Thu, 08 May 2025 05:46:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCu3Z-0000000HOPq-0W78
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 05:44:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AD15106F;
	Wed,  7 May 2025 22:44:17 -0700 (PDT)
Received: from [10.163.54.182] (unknown [10.163.54.182])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D35D73F673;
	Wed,  7 May 2025 22:44:23 -0700 (PDT)
Message-ID: <4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com>
Date: Thu, 8 May 2025 11:14:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Drop duplicate check in pmd_trans_huge()
To: Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 yangyicong@hisilicon.com, shan.gavin@gmail.com
References: <20250508035142.189726-1-gshan@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250508035142.189726-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_224429_207989_1F3018E3 
X-CRM114-Status: GOOD (  17.83  )
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

On 5/8/25 09:21, Gavin Shan wrote:
> pmd_val(pmd) is inclusive to pmd_present(pmd) since the PMD entry
> value isn't zero when pmd_present() returns true. Just drop the
> duplicate check done by pmd_val(pmd).

Agreed, pmd_val() is redundant here because a positive pmd_present()
also ensures a positive pmd_val().

#define pmd_present(pmd) pte_present(pmd_pte(pmd))
#define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))

#define pte_valid(pte)           (!!(pte_val(pte) & PTE_VALID))
#define pte_present_invalid(pte) ((pte_val(pte) & (PTE_VALID |
				  PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)

pte_present() cannot return positive here unless either of the flags
PTE_VALID or PTE_PRESENT_INVALID is set which implies pte_val() would
also return positive.

Probably it would be better to add the above details in the commit
message here as well.

The earlier commit skipped dropping pmd_val() in order to keep then
proposed change confined to just adding new pmd_table() check, even
though pmd_val() redundancy was evident as well which should have
been dropped there after.

d1770e909898 ("arm64/mm: Check pmd_table() in pmd_trans_huge()")

> 
> No functional changes intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> Found this by code inspection
> ---
>  arch/arm64/include/asm/pgtable.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index d3b538be1500..2599b9b8666f 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -739,8 +739,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
>  	 * If pmd is present-invalid, pmd_table() won't detect it
>  	 * as a table, so force the valid bit for the comparison.
>  	 */
> -	return pmd_val(pmd) && pmd_present(pmd) &&
> -	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
> +	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> 
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

