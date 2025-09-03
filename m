Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3FDCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRNrGXPL9T6MFAobFuX6q6GgkpC51qH78rhQEJ0d8TY=; b=E3TuCRMpnWfgHApT7PutR+WDtl
	kCnQMDF59nkiDCf2tkdpoj2aI/A4t/n/nAVKwlgUgF2Rn8RehM0Lfufldckk/tzKVmhsNowA11cZu
	Kda52b6w2XfNvZEXoyaeKuufiPHHlrpS/HYgmkG1aXCGCwMDRHDu1YUSdx4nHlyUKcc8b99j8aWrD
	PuFsZQkKBlF8K79sRC0fVGeXGlkbvttdQZTLBZRgcJ4lpzeu21cKxfiGqahdppRGfSwX/pYrLQjKK
	Xmy/QpZFPh8qg1+f028EVcqBCFT2js12cWJcHs4IjTZH5WDqCkxWaPjIOI3Z/NFnO6nAVxrpRQ2IE
	HlvdxI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQR-00000008DyO-26yy;
	Thu, 04 Sep 2025 02:10:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsx8-00000007QOy-12Sf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 19:15:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5534D6013F;
	Wed,  3 Sep 2025 19:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB42C4CEE7;
	Wed,  3 Sep 2025 19:15:26 +0000 (UTC)
Date: Wed, 3 Sep 2025 20:15:24 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ard Biesheuvel <ardb@kernel.org>, Dev Jain <dev.jain@arm.com>,
	scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v7 3/6] arm64: mm: support large block mapping when
 rodata=full
Message-ID: <aLiTzJ6E-YBIYuGo@arm.com>
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-4-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829115250.2395585-4-ryan.roberts@arm.com>
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

On Fri, Aug 29, 2025 at 12:52:44PM +0100, Ryan Roberts wrote:
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 34e5d78af076..114b88216b0c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -481,6 +481,8 @@ void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>  			     int flags);
>  #endif
>  
> +#define INVALID_PHYS_ADDR	-1

Nitpick: (-1UL) (or (-1ULL), KVM_PHYS_INVALID is defined as the latter).

Otherwise the patch looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

