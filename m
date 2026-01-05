Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DF4CD0406
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMgoeh4gYpUXEdSBCbE7evyOo1WBu9v+2MID43Drjf0=; b=LNDlLOXXEDW3nZKHp+0kPKNXgF
	YNc1dk23bqz44l3QXGiHG1RMT3+cb29ZsEVotgxUnx/HkRswQ+nfRNUKHLbG6KqLeoqg+NH5lHXMC
	0eNyT7DV/eA4S4MGlzbIari4equOxTHpopyDcpSp7iAfYwFNH17aPqQV0iyif8mROsZJ0NOTKhLFM
	qeTNnNzJRzsuc5F6O0C4ZiOTk6x+Bfty8Lo7kG/jfIgz3n8X1iMBOeaQTlE+vn1OXKTLLsN38KftW
	CnMWhKx5NQ3o/RywONUBy5C/JNhMNeZfME2kqvjplytqiOHMxIhBz9+zUCGLpdhlyjKcVWf8sRb+t
	83HUocAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrmf-0000000C5ih-0eKw;
	Mon, 05 Jan 2026 21:06:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrmd-0000000C5iA-2oKj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 21:06:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE5E96013A;
	Mon,  5 Jan 2026 21:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F56C116D0;
	Mon,  5 Jan 2026 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767647194;
	bh=4cLq/CaKkyPJSPiRRC3v7YCzlgUUsrtS2k32vjdQu7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LIRsUPKuDv+Mks0Qe7ANH/OdcNIFKOVaftpxF5IwRNWDb8WKqzCbiLSuu/0ZgOMai
	 ykgsseC0sVG/7zKYsN9g+dNLTCmjj5rNSZmFxaMajI//YgqSy9wWVxevwPc7Vo3z2I
	 tNyzjeVitH53IsOQ+YyXo+uLk90aE1KZXkQp050Wt+1uBIi2Qt/N8uXt8LW8lEkqFj
	 Ym5YCkU/YYYY3qiF418UP2wYXPvYw+8N4C0yD7ec7m3OO4NC3KvHf7P1bpmYvbBNb2
	 EvCeYZlfQAnac/34RrSmA2LtbkzcoJY5qIkSQ4AL86nBJag4vSJYBpPiO/mk5xY5IO
	 ubFOk7ghqoc1g==
Date: Mon, 5 Jan 2026 21:06:28 +0000
From: Will Deacon <will@kernel.org>
To: Jeongin Yeo <leo.yeo@luaberry.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com,
	akpm@linux-foundation.org, david@kernel.org, kevin.brodsky@arm.com,
	dev.jain@arm.com, quic_zhenhuah@quicinc.com,
	lorenzo.stoakes@oracle.com, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: prevent context switching during idmap is
 mapped
Message-ID: <aVwn1PgxgiBsNK6o@willie-the-truck>
References: <20251202004223.108388-1-leo.yeo@luaberry.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202004223.108388-1-leo.yeo@luaberry.com>
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

On Tue, Dec 02, 2025 at 12:42:23AM +0000, Jeongin Yeo wrote:
>  cpu_install_idmap replaces ttbr0 to install idmap. replace_phys uses
>  idmap_cpu_replace_ttbr1 which is located in idmap,
>  thus it requires ttbr0 to point idmap. 
>  
>  However, if a kernel task has switched out right after
>  cpu_install_idmap, when kernel task is loaded, its ttbr0 is
>  mapped to reserved_pg_dir which doesn't contain any idmap
>  functions.
>  Therefore, the kernel task cannot find any functions to run,
>  causing memory fault.
>  
>  As far as I can verify from the current arm64 tree,
>  no in-tree caller invokes this function from a preemptible context.
>  
>  Nevertheless, future work might allow this function to be called in
>  preemptive state. Encapsulating the idmap sequence with
>  preempt_disable() and preempt_enable() prevents this possible problem.
> 
> Signed-off-by: Jeongin Yeo <leo.yeo@luaberry.com>
> ---
>  arch/arm64/mm/mmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 2ba01dc8ef82..c3da836ebe8d 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -29,6 +29,7 @@
>  #include <linux/mm_inline.h>
>  #include <linux/pagewalk.h>
>  #include <linux/stop_machine.h>
> +#include <linux/preempt.h>
>  
>  #include <asm/barrier.h>
>  #include <asm/cputype.h>
> @@ -2136,7 +2137,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
>  		ttbr1 |= TTBR_CNP_BIT;
>  
>  	replace_phys = (void *)__pa_symbol(idmap_cpu_replace_ttbr1);
> -
> +	preempt_disable();
>  	cpu_install_idmap();
>  
>  	/*
> @@ -2148,6 +2149,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
>  	local_daif_restore(daif);
>  
>  	cpu_uninstall_idmap();
> +	preempt_enable();
>  }

__cpu_replace_ttbr1() is a _very_ low-level helper with only a handful
of arch-specific callers and so we shouldn't be worrying about random
functions calling it with preemption enabled.

Will

