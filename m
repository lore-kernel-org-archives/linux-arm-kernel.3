Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE2CC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 04:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JmjNMPXmoiVzhKYmyHmqewcdSFNEWf9s+Tbsz3Tsvw=; b=XTim3KVdYwfQzNhwBQdrInn2Y0
	yzE2xoDGqqcQS91zvQ9mVzGQuZD9SvEsHz1UmOLJGx176vBJPWKRQW2aLmc5IsFfgci1EkyZ1HJNn
	7PoVuTZaknbKBhtfhKDi4ph1bTDmIqXkA4/qhCPFSz1TpWCCDmKp/UPDfaesvxWEJNI+fe9mryTmv
	RKvYir8S1SprJ+DFi8QgIja3ZeiF5V8DcAior053D46LdLZQ4W74mBG+6gQWzuA7I1J9NPSVtY1P+
	maa7GhTBflhFOp3vU7EEh9YB5xBbUaP0CgJJVQVrI2Gq7AB/1ymBUKzaRveWS3soa7jUfxtNtxsQA
	Yf+n/pTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsSs-0000000HFwc-23yh;
	Thu, 08 May 2025 04:02:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsQr-0000000HFnh-0j0v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 04:00:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71B45106F;
	Wed,  7 May 2025 21:00:08 -0700 (PDT)
Received: from [10.162.43.19] (K4MQJ0H1H2.blr.arm.com [10.162.43.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48E9C3F5A1;
	Wed,  7 May 2025 21:00:14 -0700 (PDT)
Message-ID: <613ae7bd-b006-4f5a-8916-345001beb50f@arm.com>
Date: Thu, 8 May 2025 09:30:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Drop duplicate check in pmd_trans_huge()
To: Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 anshuman.khandual@arm.com, ryan.roberts@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, yangyicong@hisilicon.com, shan.gavin@gmail.com
References: <20250508035142.189726-1-gshan@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250508035142.189726-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_210025_268532_5971B985 
X-CRM114-Status: GOOD (  15.53  )
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



On 08/05/25 9:21 am, Gavin Shan wrote:
> pmd_val(pmd) is inclusive to pmd_present(pmd) since the PMD entry
> value isn't zero when pmd_present() returns true. Just drop the
> duplicate check done by pmd_val(pmd).
> 
> No functional changes intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> Found this by code inspection
> ---
>   arch/arm64/include/asm/pgtable.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index d3b538be1500..2599b9b8666f 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -739,8 +739,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
>   	 * If pmd is present-invalid, pmd_table() won't detect it
>   	 * as a table, so force the valid bit for the comparison.
>   	 */
> -	return pmd_val(pmd) && pmd_present(pmd) &&
> -	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
> +	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
>   }
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>   

LGTM

Reviewed-by: Dev Jain <dev.jain@arm.com>

