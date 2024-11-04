Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C89D132D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKcQzeQorQTf4VJFMb84i4HpvFw/CNWnI9HoK6FQn9Y=; b=PIww5NGf/fB3KCIixmPuc9OciX
	BJjHSAbJkhgNafnJ8Ky9i0mXVtqxnSC34JdMst3Wot1CQHLBJDwfeThzdpuRJbkohr/DmivsbG2jD
	eboB629EnNtKdxlYIqiIMxinxDMKiNxwd/HMi8EYUYKxf6qH1KWLqzCUwOU6IT1y71bO3t/sbf+hN
	UaZv+Ercj+kC2p/fTCnLoV0N2yCsTAxO/NsWg6Tf8WGhTNT1Hie29O7/qQ/uk0PZnMGcOvTpy4+cg
	r1Bmz7Pgy4+KUtvMvdlOERopsaJgYDfwe8TPcbgB7+TmLwiSa+NidXPagUCWJK0jq1vcErsSTQk/V
	SVaU+IJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yPk-0000000E7Pt-3xmN;
	Mon, 04 Nov 2024 14:50:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xTD-0000000Dw7r-2dXZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:50:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 286E0A418A9;
	Mon,  4 Nov 2024 13:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2632FC4CECE;
	Mon,  4 Nov 2024 13:50:11 +0000 (UTC)
Date: Mon, 4 Nov 2024 13:50:09 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64/mm: Sanity check PTE address before runtime
 P4D/PUD folding
Message-ID: <ZyjREXyABoQtkV8O@arm.com>
References: <20241101155800.3917462-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101155800.3917462-2-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_055015_749186_F341C254 
X-CRM114-Status: GOOD (  14.96  )
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

On Fri, Nov 01, 2024 at 04:58:01PM +0100, Ard Biesheuvel wrote:
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index dd5dcf7ae056..0d729adf894c 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -740,6 +740,11 @@ static inline bool pud_table(pud_t pud) { return true; }
>  				 PUD_TYPE_TABLE)
>  #endif
>  
> +static inline long sign_of(unsigned long addr)
> +{
> +	return (int)(addr >> 24) >> 31L; // bit 55 is the sign bit
> +}

That's a pretty generic name that trickles into the core code. It should
be renamed to something that suggests arm64 addresses (and maybe some
underscores to imply private). Also, this assumes untagged addresses but
I haven't checked whether that's the case for all call sites.

>  extern pgd_t init_pg_dir[];
>  extern pgd_t init_pg_end[];
>  extern pgd_t swapper_pg_dir[];
> @@ -932,6 +937,8 @@ static inline phys_addr_t p4d_page_paddr(p4d_t p4d)
>  
>  static inline pud_t *p4d_to_folded_pud(p4d_t *p4dp, unsigned long addr)
>  {
> +	VM_BUG_ON(((u64)p4dp / sizeof(p4d_t) - sign_of(addr)) % PTRS_PER_P4D);
> +
>  	return (pud_t *)PTR_ALIGN_DOWN(p4dp, PAGE_SIZE) + pud_index(addr);
>  }

I think I get it but please add a comment in the code, otherwise in a
week time I'll wonder what this is.

Even better if it could be written in a less cryptic way ;).

-- 
Catalin

