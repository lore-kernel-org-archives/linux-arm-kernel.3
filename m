Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1109C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6d/oqOD8zQkyE4b/1qlMDMnxp88XlK2z79LX0andfQo=; b=G+30YN/ZuV2uOiSobzBWuNlg6l
	xYAwKGbusX5yhpJE4gLgpGFHW/MsUH7/o0z7WGUd+k5W8/SlEr4JZeLzZcVZv3FusJIPxdJd2hLMa
	CKUy1PmLII/+bAwFlH63dAvYYTVeHereJVXJoTh643udtJo02cZHyrKCSMfgLP1xeZvSpVqIk9ZLR
	GF96HsR7cKewr4lobor4TrhwIitSoLPHSenAcooe+ZzNWm79j22I82Cii68ZHXJTdrYUe49oqRoP9
	ppIJlicnIhZAZCMRgU9MKg4TVDC6n1cmm2tm4s93kiZf6pf/cduGZYzXpKY1Fy1ewXSoC6qezL6ib
	QBIyofmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6DX-0000000BLjb-0zKb;
	Fri, 26 Jun 2026 13:03:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6DV-0000000BLjE-198C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:03:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 976401A9A;
	Fri, 26 Jun 2026 06:03:25 -0700 (PDT)
Received: from [10.164.19.14] (unknown [10.164.19.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 061343F632;
	Fri, 26 Jun 2026 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782479010; bh=mLrqXzI6fndhpQWKl/d2+M3KKUFe6veWV+hQFDs0DeY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fWVkimfK0mRUOX//wOlw1rDvquS+agvpJcAkS7YH0I9Iij80JRXnFNzWSSx73410H
	 /LCvDunajkaQu7zfR9Ub8o+teDJWQm9KdOdC6CrtlF4zGNDAfgV0XM96pUYyvZf81x
	 BJYdWAs0Al+kc/xmBkoBGspCIyTHPR5fYUuw0fIk=
Message-ID: <e0031cbe-2a49-4611-ad48-bde73fe4cd1c@arm.com>
Date: Fri, 26 Jun 2026 18:33:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: refresh stale pmd snapshot after
 split_contpmd()
To: lirongqing <lirongqing@baidu.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Yang Shi
 <yang@os.amperecomputing.com>,
 Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625113953.2332-1-lirongqing@baidu.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260625113953.2332-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_060333_353368_3B7CD4B4 
X-CRM114-Status: GOOD (  18.95  )
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



On 25/06/26 5:09 pm, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> split_contpmd() modifies the pmd entries in-place by clearing the CONT
> bit, but the local 'pmd' variable still holds the old snapshot with CONT
> set. The subsequent split_pmd() call uses this stale value to derive the
> pgprot for the new PTE entries via pmd_pgprot(), causing the resulting
> PTEs to be populated with incorrect protection bits.

Since the block was CONTPMD, it means the pgprot was uniform on that block,
so after splitting, it should be safe to derive the pgprot from individual pmd's
right?

> 
> Fix this by re-reading the pmd from memory after split_contpmd() returns
> in both call sites: split_kernel_leaf_mapping_locked() and
> split_to_ptes_pmd_entry().
> 
> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  arch/arm64/mm/mmu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 12e862c..e510336 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -746,8 +746,10 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>  	if (!pmd_present(pmd))
>  		goto out;
>  	if (pmd_leaf(pmd)) {
> -		if (pmd_cont(pmd))
> +		if (pmd_cont(pmd)) {
>  			split_contpmd(pmdp);
> +			pmd = pmdp_get(pmdp);
> +		}
>  		/*
>  		 * PMD: If addr is PMD aligned then addr already describes a
>  		 * leaf boundary. Otherwise, split to contpte.
> @@ -891,8 +893,10 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>  	int ret = 0;
>  
>  	if (pmd_leaf(pmd)) {
> -		if (pmd_cont(pmd))
> +		if (pmd_cont(pmd)) {
>  			split_contpmd(pmdp);
> +			pmd = pmdp_get(pmdp);
> +		}
>  		ret = split_pmd(pmdp, pmd, gfp, false);
>  
>  		/*


