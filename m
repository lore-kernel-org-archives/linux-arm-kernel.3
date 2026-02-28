Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E64FEE4CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 06:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbZImSoVtEilQkXkLNoNkgw19xA6XzEro29+lfHIRts=; b=BXdsKJASbEw+jYDYr0fzZFYDFY
	zjqp6n9JgpUs9UCKtam+KGW6JcHsrgZNCR6qT6fNe15Da+rcFkNomu5YgXY/hCBks/aJA9EzwY4La
	5e/UvONPJQL0TZPDftU8WxFc8kar6JObyti0vbiMedqhql9qqHs78kk2k2ZdRyil07j6+YENMlo/y
	/7DGX7z1MeKpUfnsRd24KPgEY48VHeWb2W8Aa5PD0cbhzxk+GazfUHzfFcKsPwiiPWufUJ3FGedAq
	C2OGeHY1YHVofw014fvWfKgehFs1+sQjKRTa4MUuOtk5ardfO4CHquiai6F+mUWoxLSr/d5Hx0WuK
	OshMpDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDU1-00000009XBX-1ih1;
	Sat, 28 Feb 2026 06:07:21 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwDTy-00000009XBA-3pi2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 06:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772258830; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=nbZImSoVtEilQkXkLNoNkgw19xA6XzEro29+lfHIRts=;
	b=gBa5UBg36SmjJgJRYOFK30tAeH9tlUVWpg8iARLOc2Wt6Nsaka7YnBMzuQVbPeX/RbyBgwMkPlyyG0c85F9cCWi1Z6P59UAb7zTMwfRYxC0u+jYrJ08tT1Q/m/2e95pIZn2m60Cqnq4VMY7O0/PMxPgXx7SEXJ+Gsk6eBE+oNIw=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WzwdgFz_1772258819 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 28 Feb 2026 14:07:09 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,  Anshuman Khandual
 <anshuman.khandual@arm.com>,  Jianpeng Chang
 <jianpeng.chang.cn@windriver.com>,  Will Deacon <will@kernel.org>,
  Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arm64: mm: Add PTE_DIRTY back to PAGE_KERNEL* to fix
 kexec/hibernation
In-Reply-To: <20260227185544.1482632-1-catalin.marinas@arm.com> (Catalin
	Marinas's message of "Fri, 27 Feb 2026 18:53:06 +0000")
References: <20260227185544.1482632-1-catalin.marinas@arm.com>
Date: Sat, 28 Feb 2026 14:06:59 +0800
Message-ID: <87wlzxwge4.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_220719_167893_62A0C58F 
X-CRM114-Status: GOOD (  18.40  )
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
> pte_mkwrite()") changed pte_mkwrite_novma() to only clear PTE_RDONLY
> when PTE_DIRTY is set. This was to allow writable-clean PTEs for swap
> pages that haven't actually been written.
>
> However, this broke kexec and hibernation for some platforms. Both go
> through trans_pgd_create_copy() -> _copy_pte(), which calls
> pte_mkwrite_novma() to make the temporary linear-map copy fully
> writable. With the updated pte_mkwrite_novma(), read-only kernel pages
> (without PTE_DIRTY) remain read-only in the temporary mapping.
> While such behaviour is fine for user pages where hardware DBM or
> trapping will make them writeable, subsequent in-kernel writes by the
> kexec relocation code will fault.
>
> Add PTE_DIRTY back to all _PAGE_KERNEL* protection definitions. This was
> the case prior to 5.4, commit aa57157be69f ("arm64: Ensure
> VM_WRITE|VM_SHARED ptes are clean by default"). With the kernel
> linear-map PTEs always having PTE_DIRTY set, pte_mkwrite_novma()
> correctly clears PTE_RDONLY.
>
> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: <stable@vger.kernel.org>
> Reported-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
> Link: https://lore.kernel.org/r/20251204062722.3367201-1-jianpeng.chang.cn@windriver.com
> Cc: Will Deacon <will@kernel.org>
> Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>
> Cc: Guenter Roeck <linux@roeck-us.net>

LGTM, Thanks!  Feel free to add my

Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>

in the future versions.

> ---
>
> Since no-one posted this as a proper patch, here it is. However, I could
> not reproduce the initial kexec failure, so for me kexec is working with
> our without this patch.
>
> Testing appreciated before we decide to merge it. Thanks.
>
>  arch/arm64/include/asm/pgtable-prot.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 2b32639160de..f560e6420267 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -50,11 +50,11 @@
>  
>  #define _PAGE_DEFAULT		(_PROT_DEFAULT | PTE_ATTRINDX(MT_NORMAL))
>  
> -#define _PAGE_KERNEL		(PROT_NORMAL)
> -#define _PAGE_KERNEL_RO		((PROT_NORMAL & ~PTE_WRITE) | PTE_RDONLY)
> -#define _PAGE_KERNEL_ROX	((PROT_NORMAL & ~(PTE_WRITE | PTE_PXN)) | PTE_RDONLY)
> -#define _PAGE_KERNEL_EXEC	(PROT_NORMAL & ~PTE_PXN)
> -#define _PAGE_KERNEL_EXEC_CONT	((PROT_NORMAL & ~PTE_PXN) | PTE_CONT)
> +#define _PAGE_KERNEL		(PROT_NORMAL | PTE_DIRTY)
> +#define _PAGE_KERNEL_RO		((PROT_NORMAL & ~PTE_WRITE) | PTE_RDONLY | PTE_DIRTY)
> +#define _PAGE_KERNEL_ROX	((PROT_NORMAL & ~(PTE_WRITE | PTE_PXN)) | PTE_RDONLY | PTE_DIRTY)
> +#define _PAGE_KERNEL_EXEC	((PROT_NORMAL & ~PTE_PXN) | PTE_DIRTY)
> +#define _PAGE_KERNEL_EXEC_CONT	((PROT_NORMAL & ~PTE_PXN) | PTE_CONT | PTE_DIRTY)
>  
>  #define _PAGE_SHARED		(_PAGE_DEFAULT | PTE_USER | PTE_RDONLY | PTE_NG | PTE_PXN | PTE_UXN | PTE_WRITE)
>  #define _PAGE_SHARED_EXEC	(_PAGE_DEFAULT | PTE_USER | PTE_RDONLY | PTE_NG | PTE_PXN | PTE_WRITE)

---
Best Regards,
Huang, Ying

