Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C41C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 23:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQsUOg9Wl3GBkj34Pd/P8J4rXOI9TTuELe3xCAfOaXs=; b=d4AEy1TcLtLJCX1Pk2nZeNz4PX
	v1fJXn33JI68gZJ0B02MzzrTf9/Lzyng85Dr1c0YwwXCerIHobOeHdfbn40mcT2tzfgOmvUdHjm5a
	7wgGRYuV49k0GGbgBy+de36CLwZLIgIspwijzby1Xg1ps5Nye+S3ZPu3lcbQkS0PGWngEGO0NToNs
	E4WjlCm9orRdWrh5pSgFL/5WlEDqph8VAowIwFssj07IcCG4QnzNoY9feJg0auk7IFk43914dQ/3p
	5H+pzuG2GRRUDwyrucR+C71bBU7WdH1XAo9HpqMatVMweRme4ovLx/+89DUvQJG8w9mHICVytA0ty
	PzPbXC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsriy-0000000CgOD-2704;
	Thu, 13 Mar 2025 23:12:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrhI-0000000CgBB-433s;
	Thu, 13 Mar 2025 23:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C5095C0F92;
	Thu, 13 Mar 2025 23:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839ACC4CEDD;
	Thu, 13 Mar 2025 23:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741907439;
	bh=85C5EaLBPcNm+VfXMxlgckNkHScFkxqfwrT4hbCXaS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r1LbO++h2zt9ITOCp8zaBNp5bCW3oO8IYrW9fm3oZilRLz2OfzDBHOVialXmivLvD
	 bsPejXMhoq8EeEH1UfZGgQO5BcyfMZ6opeDWAKOUunCcWeso9WZv2uAjmotrBYRJrB
	 wRsd1Lld8tuszHDkPkn9GPUZwcBYsR4A0hlP64N8=
Date: Thu, 13 Mar 2025 16:10:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me
Subject: Re: [PATCH v13 04/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
Message-Id: <20250313161038.8bd10fa54778e984d8f849d7@linux-foundation.org>
In-Reply-To: <20250211161404.850215-5-ajd@linux.ibm.com>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
	<20250211161404.850215-5-ajd@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_161041_107367_37BBA68E 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

On Wed, 12 Feb 2025 03:13:57 +1100 Andrew Donnellan <ajd@linux.ibm.com> wrote:

> This reverts commit 931c38e16499 ("mm/page_table_check: remove unused
> parameter in [__]page_table_check_pud_clear").
> 
> Reinstate previously unused parameters for the purpose of supporting
> powerpc platforms, as many do not encode user/kernel ownership of the
> page in the pte, but instead in the address of the access.

My x86-64 allmodconfig exploded.

./arch/x86/include/asm/pgtable.h: In function 'pudp_establish':
./arch/x86/include/asm/pgtable.h:1443:46: error: passing argument 2 of 'page_table_check_pud_set' makes integer from pointer without a cast [-Werror=int-conversion]
 1443 |         page_table_check_pud_set(vma->vm_mm, pudp, pud);
      |                                              ^~~~
      |                                              |
      |                                              pud_t *



#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
static inline pud_t pudp_establish(struct vm_area_struct *vma,
                unsigned long address, pud_t *pudp, pud_t pud)
{
	page_table_check_pud_set(vma->vm_mm, pudp, pud);
	...

