Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4371CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWlu++IkLJgmIIBwx2cLBua7jzd3jptMkl6ILCsMrLM=; b=GFejMDxgU5QaXtVxTny9bXYiov
	B1umYAVaFsGLv1v+YOlXWEfT2k/R5uL0Aw/cAH5J8jpf38iptPnhzKg6y8ErhMFcHuraNtOj+eQbP
	7ly7KRE+3l2jj7HUMevJkD/kZt2vTcFUx0pf9lIjJTnK0N8bKIuKCnDvFuTFVsBPkgP59kuvQxI5p
	lxFkfdcP5jM2aMwzd3YQGxW7jUaqgSwfdVLkWYHHl3Wsdqf96IoB+F6H9r0MpTj229MHQcypycZX6
	pzldRrj99EH/Bwesi+6TsEXI3Xp4yta9fJnh8siAgfFAthHg471Vn9kVVCwjD6pSXzZGhGbmg0fl2
	0gyBiigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJE4-00000001Ps7-1bza;
	Tue, 19 May 2026 12:07:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJE1-00000001PrT-37an
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:07:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0504A43ABE;
	Tue, 19 May 2026 12:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CFEC2BCB3;
	Tue, 19 May 2026 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779192424;
	bh=DJY95g0ZmUO/h+FGNqx68XzzoKPdsYRRU7J5WDRm+ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3oCDcW+sCdTzW8lCRMorld9sc9qwpqK6QWGt3aVnLkJ0uLmsDYwx2KnSlZbovXJv
	 lz3nRwxeNA49VZKeNVJKIYcOODXiJPFbbkZG9/Vzdpifx6C4plYR9WYefDq7QVu7tW
	 eG/RMMruCk9MSbvTkTBr+jkbGMzjGS5VMSF37XkRQm5cmLBOSdPz7mgdL6T3jHhXN6
	 r5/Ck12n8PAsB8oR5cLryIQnwReRyokbEDkIB+s6fLWQRBuudP75Nb2Y7U+uJ3+bKf
	 XIDMdWEUDUZBfUoivtPhBlF6jl3yIr2EF/ke+Nw5yo2KoQYoM8H56qoKpuNpO0kajn
	 rU6sqcMx9805w==
Date: Tue, 19 May 2026 13:06:59 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
	stable@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section
 mismatch warnings
Message-ID: <agxSY-BnTXv2TQWo@willie-the-truck>
References: <20260513145425.1579430-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513145425.1579430-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_050705_819133_75E9DD69 
X-CRM114-Status: GOOD (  25.34  )
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

On Wed, May 13, 2026 at 04:53:54PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-16 has gained some more advanced inter-procedual optimization
> techniques that enable it to inline the dummy_tlb_add_page() and
> dummy_tlb_flush() function pointers into a specialized version of
> __arm_v7s_unmap:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x2cc (section: .text) -> dummy_tlb_add_page (section: .init.text)
> ERROR: modpost: Section mismatches detected.
> 
> From what I can tell, the transformation is correct, as this is only
> called when __arm_v7s_unmap() is called from arm_v7s_do_selftests(),
> which is also __init. Since __arm_v7s_unmap() however is not __init,
> gcc cannot inline the inner function calls directly.
> 
> In debug_objects_selftest(), the same thing happens. Both the
> caller and the leaf function are __init, but the IPA pulls
> it into a non-init one:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x7c (section: .text.lookup_object_or_alloc) -> is_static_object (section: .init.text)
> 
> Marking the affected functions as not "__init" would reliably avoid this
> issue but is not a good solution because it removes an otherwise correct
> annotation. I tried marking the functions as 'noinline', but that ended
> up not covering all the affected configurations.
> 
> With some more experimenting, I found that marking these functions as
> __attribute__((noipa)) is both logical and reliable.
> 
> In order to keep the syntax readable, add a custom macro for this in
> include/linux/compiler_attributes.h next to other related macros and
> use it to annotate both files.
> 
> Link: https://lore.kernel.org/all/abRB6g-48ZX6Yl2r@willie-the-truck/
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: I merged both patches into one, to simplify the dependency
> on the new compiler_attributes.h macro.
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c  | 18 ++++++++++++------
>  include/linux/compiler_attributes.h | 11 +++++++++++
>  lib/debugobjects.c                  |  2 +-
>  3 files changed, 24 insertions(+), 7 deletions(-)

For the io-pgtable change:

Acked-by: Will Deacon <will@kernel.org>

Thanks, Arnd.

Will

