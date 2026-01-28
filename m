Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C67D35688
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDrDHaxzPUqDOGHtSAjw8UIOY7PPSYbUnoNgzHvr5I0=; b=Z01Q0ko+mC1gMX86BeX5X19RtI
	ksv5rQozZETyfsf0EQu/ukylVcFoeFp5oCsZPeK3bI//sw2TPeIbI3KEXCAX6lIzrL7oYc8bbOgiH
	e85VtAXUUn7Io0AWsyIGR0439rj1Xpxajr7kuC+5ynlspIO9M5HCbq1S0Xkaw22CrVu8JOkIAfgko
	M9GYyvIOiHU973lwF1z2Kw1Bmd60vVsWry+IUaqcAzmKxrRwC5Zu+3Hfx1sgHUhgXpDlfLm2EqEnD
	Owx0gGu+F9ie8VxTsyyQWGM3KacSyt4Cz0fcIBhhiNT9glhLNJCi0yv+bADrMbcIBwi/kHliXW084
	QMWYJygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkzjm-0000000FYbC-0TN7;
	Wed, 28 Jan 2026 07:13:14 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkzji-0000000FYal-1Xvd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 07:13:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lDrDHaxzPUqDOGHtSAjw8UIOY7PPSYbUnoNgzHvr5I0=;
	b=GNnmKJXMOHfYxhNgVBD7aQXjjtZO1CwYmiFKicdhYA6iwUIQjplxkGPLDZ4VvWG0Au+0kgJ/6
	3bLirJmYGft9AUlO4U5m2sXFWL3IYjb1AgWi1zrTFAJ+M5YnT1v5GjvmtbE3GozIddRJ9kXs2Vk
	cBVcPYqEiLnA567zo+XIgzo=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4f1D0H4cJyz12LDP;
	Wed, 28 Jan 2026 15:09:03 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id E85124056C;
	Wed, 28 Jan 2026 15:12:57 +0800 (CST)
Received: from [10.174.179.179] (10.174.179.179) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 28 Jan 2026 15:12:57 +0800
Message-ID: <c78b76c5-8709-44d0-85c3-feccd41b2ddd@huawei.com>
Date: Wed, 28 Jan 2026 15:12:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mm: fix pass user prot to ioremap_prot in
 generic_access_phys
To: <akpm@linux-foundation.org>, <david@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <zengheng4@huawei.com>,
	<ryan.roberts@arm.com>, <anshuman.khandual@arm.com>,
	<wangkefeng.wang@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>
References: <20260127090129.412084-1-tujinjiang@huawei.com>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <20260127090129.412084-1-tujinjiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.179]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_231311_062925_F5F888EE 
X-CRM114-Status: GOOD (  21.02  )
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


在 2026/1/27 17:01, Jinjiang Tu 写道:
> Here is a syzkaller error log:
>    [0000000020ffc000] pgd=080000010598d403, p4d=080000010598d403, pud=0800000125ddb403,
>                       pmd=080000007833c403, pte=01608000007fcfcf
>    Unable to handle kernel read from unreadable memory at virtual address ffff80008ea89000
>    KASAN: probably user-memory-access in range [0x0000000475448000-0x0000000475448007]
>    Mem abort info:
>      ESR = 0x000000009600000f
>      EC = 0x25: DABT (current EL), IL = 32 bits
>      SET = 0, FnV = 0
>      EA = 0, S1PTW = 0
>      FSC = 0x0f: level 3 permission fault
>    Data abort info:
>      ISV = 0, ISS = 0x0000000f, ISS2 = 0x00000000
>      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>    swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000001244aa000
>    [ffff80008ea89000] pgd=100000013ffff403, p4d=100000013ffff403, pud=100000013fffe403,
> 		     pmd=100000010a453403, pte=01608000007fcfcf
>    Internal error: Oops: 000000009600000f [#1] SMP
>    Modules linked in: team
>    CPU: 1 PID: 10840 Comm: syz.9.83 Kdump: loaded Tainted: G
>    Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
>    pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    pc : __memcpy_fromio+0x80/0xf8
>    lr : generic_access_phys+0x20c/0x2b8
>    sp : ffff8000a0507960
>    x29: ffff8000a0507960 x28: 1ffff000140a0f44 x27: ffff00003833cfe0
>    x26: 0000000000000000 x25: 0000000000001000 x24: 0010000000000001
>    x23: ffff80008ea89000 x22: ffff00004ea63000 x21: 0000000000001000
>    x20: ffff80008ea89000 x19: ffff00004ea62000 x18: 0000000000000000
>    x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000806f1e3c
>    x14: ffff8000806f1d44 x13: 0000000041b58ab3 x12: ffff7000140a0f23
>    x11: 1ffff000140a0f22 x10: ffff7000140a0f22 x9 : ffff800080579d24
>    x8 : 0000000000000004 x7 : 0000000000000003 x6 : 0000000000000001
>    x5 : ffff8000a0507910 x4 : ffff7000140a0f22 x3 : dfff800000000000
>    x2 : 0000000000001000 x1 : ffff80008ea89000 x0 : ffff00004ea62000
>    Call trace:
>      __memcpy_fromio+0x80/0xf8
>      generic_access_phys+0x20c/0x2b8
>      __access_remote_vm+0x46c/0x5b8
>      access_remote_vm+0x18/0x30
>      environ_read+0x238/0x3e8
>      vfs_read+0xe4/0x2b0
>      ksys_read+0xcc/0x178
>      __arm64_sys_read+0x4c/0x68
>      invoke_syscall+0x68/0x1a0
>      el0_svc_common.constprop.0+0x11c/0x150
>      do_el0_svc+0x38/0x50
>      el0_svc+0x50/0x258
>      el0t_64_sync_handler+0xc0/0xc8
>      el0t_64_sync+0x1a4/0x1a8
>    Code: 91002339 aa1403f7 8b190276 d503201f (f94002f8)
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
> To fix it, define arch_mk_kernel_prot() to convert user prot to kernel
> prot for arm64, and call arch_mk_kernel_prot() in generic_access_phys(),
> so that a user prot is passed to ioremap_prot().
>
> Fixes: 893dea9ccd08 ("arm64: Add HAVE_IOREMAP_PROT support")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> ---
> Change since v1:
>   * fix in ther caller generic_access_phys(), suggested by Catalin Marinas.
>
>   arch/arm64/include/asm/io.h | 11 +++++++++++
>   mm/memory.c                 | 12 +++++++++++-
>   2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 83e03abbb2ca..fe8607eafab6 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -267,6 +267,17 @@ int arm64_ioremap_prot_hook_register(const ioremap_prot_hook_t hook);
>   
>   #define ioremap_prot ioremap_prot
>   
> +#define arch_mk_kernel_prot arch_mk_kernel_prot
> +static inline pgprot_t arch_mk_kernel_prot(pgprot_t user_prot)
> +{
> +	unsigned long kernel_prot_val;
> +
> +	kernel_prot_val = _PAGE_KERNEL & ~(PTE_WRITE | PTE_ATTRINDX_MASK);
> +	kernel_prot_val |= pgprot_val(user_prot) & (PTE_WRITE | PTE_ATTRINDX_MASK);
> +
> +	return __pgprot(kernel_prot_val);
> +}

I found I misunderstand the READ/WRITE permisson here.
If the pte is writeale, the PTE_WRITE is 1, and PTE_RDONLY means dirty or not (With DBM).
If the pte is read-only, the PTE_WRITE is 0, and PTE_RDONLY is 1.

Since generic_access_phys() have checked if the user can write with:

		if ((write & FOLL_WRITE) && !pte_write(pte))
		return -EINVAL;

So, maybe we could always grant writable permission, just as x86's ioremap() does?

Thanks.

> +
>   #define _PAGE_IOREMAP PROT_DEVICE_nGnRE
>   
>   #define ioremap_wc(addr, size)	\
> diff --git a/mm/memory.c b/mm/memory.c
> index da360a6eb8a4..68fcfc3bbad8 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6836,6 +6836,14 @@ void follow_pfnmap_end(struct follow_pfnmap_args *args)
>   EXPORT_SYMBOL_GPL(follow_pfnmap_end);
>   
>   #ifdef CONFIG_HAVE_IOREMAP_PROT
> +#ifndef arch_mk_kernel_prot
> +#define arch_mk_kernel_prot arch_mk_kernel_prot
> +static inline pgprot_t arch_mk_kernel_prot(pgprot_t user_prot)
> +{
> +	return user_prot;
> +}
> +#endif
> +
>   /**
>    * generic_access_phys - generic implementation for iomem mmap access
>    * @vma: the vma to access
> @@ -6853,6 +6861,7 @@ int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
>   {
>   	resource_size_t phys_addr;
>   	pgprot_t prot = __pgprot(0);
> +	pgprot_t kernel_prot;
>   	void __iomem *maddr;
>   	int offset = offset_in_page(addr);
>   	int ret = -EINVAL;
> @@ -6870,7 +6879,8 @@ int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
>   	if ((write & FOLL_WRITE) && !writable)
>   		return -EINVAL;
>   
> -	maddr = ioremap_prot(phys_addr, PAGE_ALIGN(len + offset), prot);
> +	kernel_prot = arch_mk_kernel_prot(prot);
> +	maddr = ioremap_prot(phys_addr, PAGE_ALIGN(len + offset), kernel_prot);
>   	if (!maddr)
>   		return -ENOMEM;
>   

