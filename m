Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3DFD778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arKGCctrdsfQGPyMUlAxQ2/8+tmzN8yfWV9Z3XZP5U0=; b=SnlB/R6DG0mI3wgZSUPZI1rWoX
	IuIs+hqSa+MgL3ErkP8NNB6rdOIaW66VLN0pPFAlRxFQE04eVLsBdSbSCK0H2FTcPxY6sUHXxlUFR
	mePjS5TXosT/nnQYr54wJ1qNrSWgegdkdnu5yCsYhnEQKMfs7xbTZkZGjJQMzd0RqG7aDh5WfNzC1
	YgqAW8pns0SMKsgInJn7R3D3kp2aXN+pPGZ9qCnOhvObLGcfojhb9CUvTCqg856co5EF4XZ6NldOI
	6wxgcVBCd7zSEXErGNAlGU1pliH/DTS7N1NE3QDGBLh6BosFhI8m4iBLYBa368dERVuXTXvAoCU8O
	jnSQ2RJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjM13-00000009MGY-1EVK;
	Fri, 23 Jan 2026 18:36:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjM10-00000009MG8-45FT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 18:36:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBA081476;
	Fri, 23 Jan 2026 10:36:05 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 802393F694;
	Fri, 23 Jan 2026 10:36:10 -0800 (PST)
Date: Fri, 23 Jan 2026 18:36:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, will@kernel.org,
	zengheng4@huawei.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] arm64: mm: explicitly use kernel pte for ioremap_prot()
Message-ID: <aXO_l_4OrC7Ja4rP@arm.com>
References: <20260123030238.835748-1-tujinjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123030238.835748-1-tujinjiang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_103615_910306_A0EE23CD 
X-CRM114-Status: GOOD (  25.02  )
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

On Fri, Jan 23, 2026 at 11:02:38AM +0800, Jinjiang Tu wrote:
> Here is a syzkaller error log:
>   [0000000020ffc000] pgd=080000010598d403, p4d=080000010598d403, pud=0800000125ddb403,
>                      pmd=080000007833c403, pte=01608000007fcfcf
>   Unable to handle kernel read from unreadable memory at virtual address ffff80008ea89000
>   KASAN: probably user-memory-access in range [0x0000000475448000-0x0000000475448007]
>   Mem abort info:
>     ESR = 0x000000009600000f
>     EC = 0x25: DABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>     FSC = 0x0f: level 3 permission fault
>   Data abort info:
>     ISV = 0, ISS = 0x0000000f, ISS2 = 0x00000000
>     CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>     GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>   swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000001244aa000
>   [ffff80008ea89000] pgd=100000013ffff403, p4d=100000013ffff403, pud=100000013fffe403,
> 		     pmd=100000010a453403, pte=01608000007fcfcf
>   Internal error: Oops: 000000009600000f [#1] SMP
>   Modules linked in: team
>   CPU: 1 PID: 10840 Comm: syz.9.83 Kdump: loaded Tainted: G
>   Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
>   pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : __memcpy_fromio+0x80/0xf8
>   lr : generic_access_phys+0x20c/0x2b8
>   sp : ffff8000a0507960
>   x29: ffff8000a0507960 x28: 1ffff000140a0f44 x27: ffff00003833cfe0
>   x26: 0000000000000000 x25: 0000000000001000 x24: 0010000000000001
>   x23: ffff80008ea89000 x22: ffff00004ea63000 x21: 0000000000001000
>   x20: ffff80008ea89000 x19: ffff00004ea62000 x18: 0000000000000000
>   x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000806f1e3c
>   x14: ffff8000806f1d44 x13: 0000000041b58ab3 x12: ffff7000140a0f23
>   x11: 1ffff000140a0f22 x10: ffff7000140a0f22 x9 : ffff800080579d24
>   x8 : 0000000000000004 x7 : 0000000000000003 x6 : 0000000000000001
>   x5 : ffff8000a0507910 x4 : ffff7000140a0f22 x3 : dfff800000000000
>   x2 : 0000000000001000 x1 : ffff80008ea89000 x0 : ffff00004ea62000
>   Call trace:
>     __memcpy_fromio+0x80/0xf8
>     generic_access_phys+0x20c/0x2b8
>     __access_remote_vm+0x46c/0x5b8
>     access_remote_vm+0x18/0x30
>     environ_read+0x238/0x3e8
>     vfs_read+0xe4/0x2b0
>     ksys_read+0xcc/0x178
>     __arm64_sys_read+0x4c/0x68
>     invoke_syscall+0x68/0x1a0
>     el0_svc_common.constprop.0+0x11c/0x150
>     do_el0_svc+0x38/0x50
>     el0_svc+0x50/0x258
>     el0t_64_sync_handler+0xc0/0xc8
>     el0t_64_sync+0x1a4/0x1a8
>   Code: 91002339 aa1403f7 8b190276 d503201f (f94002f8)
> 
> The local syzkaller first maps I/O address from /dev/mem to userspace,
> overiding the stack vma with MAP_FIXED flag. As a result, when reading
> /proc/$pid/environ, generic_access_phys() is called to access the region,
> which triggers a PAN permission-check fault and causes a kernel access
> fault.
> 
> The root cause is that generic_access_phys() passes a user pte to
> ioremap_prot(), the user pte sets PTE_USER and PTE_NG bits.  Consequently,
> any subsequent kernel-mode access to the remapped address raises a fault.
> 
> To fix it, similar to ioremap_prot() in x86, use _PAGE_KERNEL as template,
> and update PTE_WRITE and PTE_ATTRINDX according to the pgprot argument.
> 
> Fixes: 893dea9ccd08 ("arm64: Add HAVE_IOREMAP_PROT support")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> ---
>  arch/arm64/mm/ioremap.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
> index 10e246f11271..78a63a14465f 100644
> --- a/arch/arm64/mm/ioremap.c
> +++ b/arch/arm64/mm/ioremap.c
> @@ -18,6 +18,7 @@ void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
>  			   pgprot_t pgprot)
>  {
>  	unsigned long last_addr = phys_addr + size - 1;
> +	unsigned long new_pgprot_val;
>  
>  	/* Don't allow outside PHYS_MASK */
>  	if (last_addr & ~PHYS_MASK)
> @@ -27,6 +28,11 @@ void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
>  	if (WARN_ON(pfn_is_map_memory(__phys_to_pfn(phys_addr))))
>  		return NULL;
>  
> +	new_pgprot_val = _PAGE_KERNEL & ~(PTE_WRITE | PTE_ATTRINDX_MASK);
> +	new_pgprot_val |= (pgprot_val(pgprot) & PTE_WRITE)
> +				| (pgprot_val(pgprot) & PTE_ATTRINDX_MASK);
> +	pgprot = __pgprot(new_pgprot_val);
> +
>  	/*
>  	 * If a hook is registered (e.g. for confidential computing
>  	 * purposes), call that now and barf if it fails.

generic_access_phys() is really weird - it takes the user PTE attributes
and passes them to the kernel ioremap_prot(), hoping for the best. My
immediate thought was to fix this in the core code. However, we also
need to preserve the original memory type from vma->vm_page_prot and I
don't think we have any generic macros to just preserve the attributes
but with kernel permissions (pte_mkkernel?).

-- 
Catalin

