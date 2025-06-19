Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BC4C77B7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyZjmzTSk3Ts7RThnG0FelPPt0qvetxwBx5Be/gySDI=; b=znhOxeTO4I+ONMb7dq9lqkRwI+
	b7VpHdVdkUU3F28b5p8FUsmpx/zi7Sl/8nOJs8vc2Jiyv06wS/wZjz4zhVaE/OXQht40b9nKm9/tU
	vwjQM8swGPGvxZNr9KlFn5bkuk6WZ8CZ733V7GOsc9PmSGkLqkT2dequVa2Cou8GKfVCugVlQRgT9
	GynGrjTQ4jbCJUPjK6KDbk9T1vWzi7BBH0FLEtIHOS4zo9uBcL1C3oFFzCBACQwd2n8cRS3TPST8d
	qIJ1ooMm8IamPjEYBUYzmcKk/DHKqnoCuO+jg1bx+Lp3KYGcWKyMKM74F59AEAqiwfkMdealBl2c8
	qE++Bu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLpV-0000000ECmp-1RH2;
	Thu, 19 Jun 2025 20:25:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKwv-0000000E6Na-1Fh0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:29:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE80A5C077C;
	Thu, 19 Jun 2025 19:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E41C4CEED;
	Thu, 19 Jun 2025 19:29:19 +0000 (UTC)
Date: Thu, 19 Jun 2025 20:29:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com, will@kernel.org,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, broonie@kernel.org, ardb@kernel.org,
	baohua@kernel.org, suzuki.poulose@arm.com, david@redhat.com,
	jgg@ziepe.ca, nicolinc@nvidia.com, jsnitsel@redhat.com,
	mshavit@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v7 4/4] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
Message-ID: <aFRlDSZ2PPnHixjc@arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-5-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617095104.6772-5-miko.lenczewski@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_122925_426685_A5E031E5 
X-CRM114-Status: GOOD (  22.27  )
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

On Tue, Jun 17, 2025 at 09:51:04AM +0000, Mikołaj Lenczewski wrote:
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..203357061d0a 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -68,7 +68,144 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>  			pte = pte_mkyoung(pte);
>  	}
>  
> -	__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
> +	/*
> +	 * On eliding the __tlb_flush_range() under BBML2+noabort:
> +	 *
> +	 * NOTE: Instead of using N=16 as the contiguous block length, we use
> +	 *       N=4 for clarity.
> +	 *
> +	 * NOTE: 'n' and 'c' are used to denote the "contiguous bit" being
> +	 *       unset and set, respectively.
> +	 *
> +	 * We worry about two cases where contiguous bit is used:
> +	 *  - When folding N smaller non-contiguous ptes as 1 contiguous block.
> +	 *  - When unfolding a contiguous block into N smaller non-contiguous ptes.
> +	 *
> +	 * Currently, the BBML0 folding case looks as follows:
> +	 *
> +	 *  0) Initial page-table layout:
> +	 *
> +	 *   +----+----+----+----+
> +	 *   |RO,n|RO,n|RO,n|RW,n| <--- last page being set as RO
> +	 *   +----+----+----+----+
> +	 *
> +	 *  1) Aggregate AF + dirty flags using __ptep_get_and_clear():
> +	 *
> +	 *   +----+----+----+----+
> +	 *   |  0 |  0 |  0 |  0 |
> +	 *   +----+----+----+----+
> +	 *
> +	 *  2) __flush_tlb_range():
> +	 *
> +	 *   |____ tlbi + dsb ____|
> +	 *
> +	 *  3) __set_ptes() to repaint contiguous block:
> +	 *
> +	 *   +----+----+----+----+
> +	 *   |RO,c|RO,c|RO,c|RO,c|
> +	 *   +----+----+----+----+

From the initial layout to point (3), we are also changing the
permission. Given the rules you mentioned in the Arm ARM, I think that's
safe (hardware seeing either the old or the new attributes). The
FEAT_BBM description, however, only talks about change between larger
and smaller blocks but no mention of also changing the attributes at the
same time. Hopefully the microarchitects claiming certain CPUs don't
generate conflict aborts understood what Linux does.

> +	 *
> +	 *  4) The kernel will eventually __flush_tlb() for changed page:
> +	 *
> +	 *                  |____| <--- tlbi + dsb
[...]
> +	 * It is also important to note that at the end of the BBML2 folding
> +	 * case, we are still left with potentially all N TLB entries still
> +	 * cached (the N-1 non-contiguous ptes, and the single contiguous
> +	 * block). However, over time, natural TLB pressure will cause the
> +	 * non-contiguous pte TLB entries to be flushed, leaving only the
> +	 * contiguous block TLB entry. This means that omitting the tlbi+dsb is
> +	 * not only correct, but also keeps our eventual performance benefits.

Step 4 above implies some TLB flushing from the core code eventually.
What is the situation mentioned in the paragraph above? Is it only until
we get the TLB flushing from the core code?

[...]
> +	if (!system_supports_bbml2_noabort())
> +		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>  
>  	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);

Eliding the TLBI here is all good but looking at the overall set_ptes(),
why do we bother with unfold+fold for BBML2? Can we not just change
them in place without going through __ptep_get_and_clear()?

-- 
Catalin

