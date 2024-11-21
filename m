Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEDBE64000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 18:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ81cD6haVNKSrJ88FeCvX+Ck9Lu4ixaHGgo0zq5laU=; b=wkzXSwsmV4JZmGRhNU1qjzO2Ke
	PHUqX0QN/IMBtSnyaxjbOxeSkXqaG3LDu20d0hliXVfxtsGgku0UOjgXB/g6I5BzXCwkDL/iRzQQS
	UG5IwVKavaz//GDNXt7mtEUBY0NmuL3pGl1ABEMNcdT4uQRXJGyBOoXafZ1QP4a4icZjVSJmz90Ha
	Nxw6H5LB8egRNlUUrduuk4NVEP4goWP/VEguXbD5nH9ut8zNYT2ILJo8aZrxd/bFbN5n1zqd4/sqH
	VWRnvvmZiW+kjMjXMDbNyz6VaMV5LpMot/1A4NEmdPlgkHniFAguHVJqASScmnj8Gv0N9jFVh/jmY
	Ua9svRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBpp-00000000e95-42v0;
	Thu, 21 Nov 2024 18:23:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEBot-00000000e4N-27Yr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 18:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA4B0A40ED6;
	Thu, 21 Nov 2024 18:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9344C4CECC;
	Thu, 21 Nov 2024 18:22:20 +0000 (UTC)
Date: Thu, 21 Nov 2024 18:22:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v6.13-rc1] arm64: mte: set VM_MTE_ALLOWED for hugetlbfs
 at correct place
Message-ID: <Zz96WefRxFL0FMRq@arm.com>
References: <20241119200914.1145249-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119200914.1145249-1-yang@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_102223_608464_09C2EE30 
X-CRM114-Status: GOOD (  19.66  )
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

On Tue, Nov 19, 2024 at 12:09:14PM -0800, Yang Shi wrote:
> The commit 5de195060b2e ("mm: resolve faulty mmap_region() error path
> behaviour") moved vm flags validation before fop->mmap for file
> mappings.  But when commit 25c17c4b55de ("hugetlb: arm64: add mte support")
> was rebased on top of it, the hugetlbfs part was missed.  Mmapping
> hugetlbfs file may not have MAP_HUGETLB set.
> 
> Fixes: 25c17c4b55de ("hugetlb: arm64: add mte support")
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>

Since 5de195060b2e went into -rc7 and my arm64 tree was based on -rc1, I
did not test this combination. The patch looks fine, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

So I either merge it via the arm64 tree at -rc1 or Linus picks it up and
applies it directly during the merging window. Both options are fine,
it's not essential that MTE + hugetlbfs works at -rc1. Adding Linus and
Andrew in case they have any preference (and leaving the patch in place
below).

Thanks,

Catalin

> ---
>  arch/arm64/include/asm/mman.h | 3 ++-
>  fs/hugetlbfs/inode.c          | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
> index 1d53022fc7e1..21df8bbd2668 100644
> --- a/arch/arm64/include/asm/mman.h
> +++ b/arch/arm64/include/asm/mman.h
> @@ -7,6 +7,7 @@
>  #ifndef BUILD_VDSO
>  #include <linux/compiler.h>
>  #include <linux/fs.h>
> +#include <linux/hugetlb.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/types.h>
>  
> @@ -44,7 +45,7 @@ static inline unsigned long arch_calc_vm_flag_bits(struct file *file,
>  	if (system_supports_mte()) {
>  		if (flags & (MAP_ANONYMOUS | MAP_HUGETLB))
>  			return VM_MTE_ALLOWED;
> -		if (shmem_file(file))
> +		if (shmem_file(file) || is_file_hugepages(file))
>  			return VM_MTE_ALLOWED;
>  	}
>  
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 1bbf783b244a..2dea122e5b93 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -113,7 +113,7 @@ static int hugetlbfs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  	 * way when do_mmap unwinds (may be important on powerpc
>  	 * and ia64).
>  	 */
> -	vm_flags_set(vma, VM_HUGETLB | VM_DONTEXPAND | VM_MTE_ALLOWED);
> +	vm_flags_set(vma, VM_HUGETLB | VM_DONTEXPAND);
>  	vma->vm_ops = &hugetlb_vm_ops;
>  
>  	ret = seal_check_write(info->seals, vma);
> -- 

