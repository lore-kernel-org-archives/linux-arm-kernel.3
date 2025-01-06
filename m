Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D0BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nk0YD7fNZ96edA6XWVdevkZ4psExRyahv3jZK/GcPA=; b=YMlaI1/ZqZ4IXTzQXySroFXR0W
	AaRS9ogPEN+4xXXI9VRjE6V03hpnRBCPxgsP5ft7pUaYeWVT8sm6kpspyl5xkuMzPdAoJPfWGhk3c
	S0O0OurL9RjIFKcQuH8/TZp5/uhyi2h+M6DjHiVIAqy3VlHl1PK6bmDQLDnRFUL6JxWDltaykACGX
	Gu5HbsJTGpEBDH7Q4p71E6kYOxhhoUQWG/gmH2HZkvELhfCtaN8l8uWqtNF8bQcbcmpGOi7wqkTsC
	u/3uvm/OvsOLz8FbLT+P+eZS1YMOFcaSMBheqHWzbk5q3RXfmiHGbRlrtpYjYjM2ORsEzxboXS8/S
	ZVyo9OpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnkN-00000001Vrs-2CVU;
	Mon, 06 Jan 2025 14:06:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUngj-00000001UdS-1HQD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:02:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 780A6143D;
	Mon,  6 Jan 2025 06:03:04 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D6C03F59E;
	Mon,  6 Jan 2025 06:02:35 -0800 (PST)
Date: Mon, 6 Jan 2025 14:02:29 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Itai Handler <itai.handler@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: Issues with kexec on arm64
Message-ID: <Z3vidU68gtR9Neih@J2N7QTR9R3>
References: <CAFpOueSJFyAa2q=0S5Ch6cCy_ORKBV8Y-FUTq6bTky37LJ7M_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFpOueSJFyAa2q=0S5Ch6cCy_ORKBV8Y-FUTq6bTky37LJ7M_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_060238_359729_F376D361 
X-CRM114-Status: GOOD (  24.48  )
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

On Tue, Dec 24, 2024 at 01:36:41PM +0200, Itai Handler wrote:
> [Sorry about my previous e-mail on this subject. It got corrupted.
> Please ignore it.]
> 
> Hello,

Hi,

> 
> I'm encountering kernel panics / system hangs when attempting to
> kexec a vmlinux file on arm64 architecture.
> 
> It happens both on qemu and on real hardware.
>
> These issues occur on all kernels from v4.19 to the latest mainline.
> A sample panic output looks as follows:
>   kernel BUG at arch/arm64/mm/mmu.c:217!
>   Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>   CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0 #292
>   Hardware name: linux,dummy-virt (DT)
>   pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : __create_pgd_mapping+0xe8/0x3b0
>   lr : __create_pgd_mapping+0x44/0x3b0
>   sp : fffffe00804d3c20
>   x29: fffffe00804d3c20 x28: fffffe0080620000 x27: fffffffefdbc0000
>   x26: fffffe0080300000 x25: 0000000040010000 x24: fffffffefdbc8020
>   x23: fffffe0080010000 x22: 0000000000000040 x21: fffffe0080010000
>   x20: fffffe0080300000 x19: 0040000000000783 x18: 0000000000000000
>   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>   x14: fffffffefdde0000 x13: fffffe00804d3c78 x12: 0000000000001d68
>   x11: 0000000000001d64 x10: fffffe00804d3c2c x9 : fffffffefdde0000
>   x8 : 0000000040420000 x7 : 0000000000001d68 x6 : 0000000000000000
>   x5 : fffffe00a0010000 x4 : 0000000000001004 x3 : fffffe0480010000
>   x2 : fffffe00804f7ec0 x1 : 0000000000000000 x0 : 0000000000000000
>   Call trace:
>    __create_pgd_mapping+0xe8/0x3b0
>    map_kernel_segment+0x74/0xb0
>    paging_init+0xec/0x4f8
>    setup_arch+0x234/0x52c
>    start_kernel+0x64/0x500
>    __primary_switched+0xb4/0xbc
>   Code: f9400300 92400400 f1000c1f 54000060 (d4210000)
>   ---[ end trace 0000000000000000 ]---
>   Kernel panic - not syncing: Oops - BUG: Fatal exception
> 
> I bisected those panics to 8eb7e28d4c642c310f25c18f80a44dd4b01c694e
> ("arm64/mm: move runtime pgds to rodata"), which was added on v4.19.
> 
> I also reconstructed the full call trace (by adding "noinline" to the
> relevant functions):
>   alloc_init_cont_pte+0x6c/0x1e0
>   init_pmd+0x154/0x1c8
>   alloc_init_cont_pmd+0x11c/0x174
>   alloc_init_pud+0xc4/0x148
>   __create_pgd_mapping+0xa8/0x130
>   map_kernel_segment+0xc8/0x168
>   map_kernel+0x98/0x1a8
>   paging_init+0x7c/0x418
>   setup_arch+0x224/0x570
>   start_kernel+0x5c/0x4f0
> 

Does your system have GICv3 and an ITS? If so, and assuming you're not
using EFI to boot in the first place, what *might* be happening here is
that the GIC is still using property/pending tables allocated bye the
first kernel, and after that memory gets reallocated, the GIC writes
back and corrupts that memory. That would be very sensitive to memory
layout, which could explain why the bisect leads to something that
changes that.

We have a solution for that with EFI (where we can use a configuration
table to indicate that the memory is in use), but we don't currently
have a solution in the absence of EFI, and we should probably forbid
kexec in that case...

Mark.

> My understanding is that the panic occurs inside alloc_init_cont_pte,
> at the BUG_ON(pmd_bad(..)) line.
> 
> kexec-tools version: 2.0.29
> qemu version: 8.1.94 (v8.2.0-rc4)
> 
> The .config files are created using the following script:
>   make tinyconfig
>   # --- Options to enable ---
>   scripts/config --enable CONFIG_EXPERT
>   scripts/config --enable CONFIG_TTY
>   scripts/config --enable CONFIG_PRINTK
>   scripts/config --enable CONFIG_BUG
>   scripts/config --enable CONFIG_STACKTRACE
>   scripts/config --enable CONFIG_BINFMT_ELF
>   scripts/config --enable CONFIG_BINFMT_SCRIPT
>   scripts/config --enable CONFIG_PROC_FS
>   scripts/config --enable CONFIG_BLOCK
>   scripts/config --enable CONFIG_BLK_DEV
>   scripts/config --enable CONFIG_BLK_DEV_NULL_BLK
>   scripts/config --enable CONFIG_BLK_DEV_INITRD
>   scripts/config --enable CONFIG_PANIC_ON_OOPS
>   scripts/config --enable CONFIG_DEVTMPFS
>   scripts/config --enable CONFIG_DEVTMPFS_MOUNT
>   scripts/config --enable CONFIG_NET
>   scripts/config --enable CONFIG_PCI
>   scripts/config --enable CONFIG_PCI_HOST_GENERIC
>   scripts/config --enable CONFIG_VIRTIO_MENU
>   scripts/config --enable CONFIG_VIRTIO_BLK
>   scripts/config --enable CONFIG_VIRTIO_PCI
>   scripts/config --enable CONFIG_NET_9P
>   scripts/config --enable CONFIG_NET_9P_VIRTIO
>   scripts/config --enable CONFIG_9P_FS
>   scripts/config --enable CONFIG_CONFIGFS_FS
>   scripts/config --enable CONFIG_SUSPEND
>   scripts/config --enable CONFIG_PROC_KCORE
>   scripts/config --enable CONFIG_KEXEC
>   scripts/config --enable CONFIG_SERIAL_AMBA_PL011
>   scripts/config --enable CONFIG_SERIAL_AMBA_PL011_CONSOLE
>   scripts/config --enable CONFIG_POSIX_TIMERS
>   scripts/config --enable CONFIG_KALLSYMS
>   scripts/config --enable CONFIG_ARM64_64K_PAGES
>   # --- Options to disable ---
>   scripts/config --disable CONFIG_IPV6
>   scripts/config --disable CONFIG_WIRELESS
>   scripts/config --disable CONFIG_SWAP
>   make olddefconfig
> 
> To run the qemu VM I use the following script:
>   APPEND="earlycon console=ttyAMA0 loglevel=8"
>   qemu-system-aarch64 \
>     -M virt \
>     -cpu cortex-a53 \
>     -smp 4 \
>     -m 4096 \
>     -kernel ~/vmshare/Image \
>     -initrd ~/vmshare/rootfs.cpio \
>     -nographic \
>     -append "${APPEND}" \
>     -fsdev local,id=vmshare,path=$HOME/vmshare,security_model=mapped,multidevs=remap
> \
>     -device virtio-9p-pci,fsdev=vmshare,mount_tag=vmshare \
> 
> I built the root filesystem using buildroot 2024.08.2, using the following
> defconfig:
>   BR2_aarch64=y
>   BR2_ARM64_PAGE_SIZE_64K=y
>   BR2_KERNEL_HEADERS_4_19=y
>   BR2_PACKAGE_HOST_GDB=y
>   BR2_GDB_VERSION_15=y
>   BR2_PACKAGE_KEXEC=y
>   BR2_PACKAGE_KEXEC_ZLIB=y
>   BR2_TARGET_ROOTFS_CPIO=y
>   BR2_PACKAGE_HOST_KMOD=y
> 
> To kexec the file I use the following command:
>   kexec -d -c -l /media/vmshare/vmlinux \
>     --initrd=/media/vmshare/rootfs.cpio \
>     --reuse-cmdline \
>     && kexec -d -e
> 
> Thanks,
> Itai Handler
> 

