Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263B0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 00:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkq6+hTRkdUDdaYlc+REtv7JE1N7d6vxMR2IWeLpG8M=; b=ObnNgbeVRtbNi3sRLuFsrjsQLd
	38Gd/4ve+x8wN40ViJDps8MFOlPBhLSjGcfNM/k3TyTG1B9HDfy9FLuno4bSo6LguPG1ribXmCMMZ
	RvcrkXmSHXyuXltk3tCC+/SejXqoEUnDx3RXl4byszwlmQIWMz9y1ou5cazZOL2FTyjbaxGGGy2rV
	qyV/KamdvX2cnzD25Twy4EdWJS9MkIduqd/AxeOCtMv+rLUepvd1c8XYJ7NmGwOyi55Cq4DGJNXps
	MGkVgTb771U9qNE/mWJFIhSVmNUYm2bwQ6+uk/BUpgsxsZ1g1TSI2Aavq2i5Etl124vFGan1iNOKu
	6WGw3SDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOnNz-00000006KOh-1QHD;
	Sat, 21 Dec 2024 00:30:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOnMm-00000006KGY-2vA8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 00:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56481A42870;
	Sat, 21 Dec 2024 00:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A47C4CECD;
	Sat, 21 Dec 2024 00:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734740951;
	bh=IzxXLwvHBuQmkKfGhr36ir9sbQQSFNJ9a01lnLgtE7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fA1J7854GMTXCPW61KQrP2Fnlsr77ZGlrIJRzwkHF0vFmqpFW38arR3i2NSuKKF6E
	 Remj9ZeoBAR1GRi6Ll5wUOtlsNnefCbNhHPJvZj+kUCKrSFHDDqjuDESO/8JqN3pRg
	 A9PjJnzQq0mhCVnWMHbLfcL8CegfS+7j72wtTo4MT3+C9nrt1eiNTy9NY2wTWYB1UV
	 5jzD33ZMLFb2fN3GXHhpKQ0jCoyCibxeyNCA6iG/unEhPlUrz0v5R+C2LLcYhXmApc
	 7ZBO8LXBoOafK4uYM2KPGgQzgoc5/d0nLYynH237G/xShOe36C33HKN/c2/VJTn1qc
	 Bo2Ko2AXzytfA==
Date: Fri, 20 Dec 2024 17:29:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v3 6/6] arm64/mm: Drop configurable 48-bit physical
 address space limit
Message-ID: <20241221002906.GA2558963@ax162>
References: <20241212081841.2168124-8-ardb+git@google.com>
 <20241212081841.2168124-14-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212081841.2168124-14-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_162912_876316_DB2F8CFF 
X-CRM114-Status: GOOD (  18.87  )
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

Hi Ard,

On Thu, Dec 12, 2024 at 09:18:48AM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, the maximum supported physical address space can be
> configured as either 48 bits or 52 bits. The only remaining difference
> between these in practice is that the former omits the masking and
> shifting required to construct TTBR and PTE values, which carry bits #48
> and higher disjoint from the rest of the physical address.
> 
> The overhead of performing these additional calculations is negligible,
> and so there is little reason to retain support for two different
> configurations, and we can simply support whatever the hardware
> supports.

I am seeing a boot failure after this change as commit 32d053d6f5e9
("arm64/mm: Drop configurable 48-bit physical address space limit") in
next-20241220 with several distribution configurations that all set
ARM64_VA_BITS_48. I can reproduce it on bare metal and in QEMU. Simply:

$ echo 'CONFIG_ARM64_VA_BITS_52=n
CONFIG_ARM64_VA_BITS_48=y' >kernel/configs/repro.config

$ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- mrproper defconfig repro.config Image.gz

$ git diff --no-index .config.old .config
diff --git a/.config.old b/.config
index c6dfbacfae06..371145bbe022 100644
--- a/.config.old
+++ b/.config
@@ -290,7 +290,7 @@ CONFIG_MMU=y
 CONFIG_ARM64_CONT_PTE_SHIFT=4
 CONFIG_ARM64_CONT_PMD_SHIFT=4
 CONFIG_ARCH_MMAP_RND_BITS_MIN=18
-CONFIG_ARCH_MMAP_RND_BITS_MAX=18
+CONFIG_ARCH_MMAP_RND_BITS_MAX=33
 CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=11
 CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
 CONFIG_STACKTRACE_SUPPORT=y
@@ -304,7 +304,7 @@ CONFIG_GENERIC_CALIBRATE_DELAY=y
 CONFIG_SMP=y
 CONFIG_KERNEL_MODE_NEON=y
 CONFIG_FIX_EARLYCON_MEM=y
-CONFIG_PGTABLE_LEVELS=5
+CONFIG_PGTABLE_LEVELS=4
 CONFIG_ARCH_SUPPORTS_UPROBES=y
 CONFIG_ARCH_PROC_KCORE_TEXT=y
 CONFIG_BUILTIN_RETURN_ADDRESS_STRIPS_PAC=y
@@ -426,7 +426,9 @@ CONFIG_ARM64_4K_PAGES=y
 # CONFIG_ARM64_16K_PAGES is not set
 # CONFIG_ARM64_64K_PAGES is not set
 # CONFIG_ARM64_VA_BITS_39 is not set
-CONFIG_ARM64_VA_BITS=52
+CONFIG_ARM64_VA_BITS_48=y
+# CONFIG_ARM64_VA_BITS_52 is not set
+CONFIG_ARM64_VA_BITS=48
 CONFIG_ARM64_LPA2=y
 # CONFIG_CPU_BIG_ENDIAN is not set
 CONFIG_CPU_LITTLE_ENDIAN=y
@@ -11259,6 +11261,3 @@ CONFIG_MEMTEST=y
 #
 # end of Rust hacking
 # end of Kernel hacking
-
-CONFIG_ARM64_VA_BITS_52=n
-CONFIG_ARM64_VA_BITS_48=y

$ qemu-system-aarch64 --version | head -1
QEMU emulator version 9.2.0 (qemu-9.2.0-1.fc42)

# With TCG, there is a crash
$ qemu-system-aarch64 \
	-display none \
	-nodefaults \
	-cpu max,pauth-impdef=true \
	-machine virt,gic-version=max,virtualization=true \
	-append 'console=ttyAMA0 earlycon' \
	-kernel arch/arm64/boot/Image.gz \
	-initrd rootfs.cpio \
	-m 512m -serial mon:stdio
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
[    0.000000] Linux version 6.13.0-rc2-00006-g32d053d6f5e9 (nathan@c3-large-arm64) (aarch64-linux-gcc (GCC) 14.2.0, GNU ld (GNU Binutils) 2.42) #1 SMP PREEMPT Fri Dec 20 23:42:18 UTC 2024
...
[    0.000000] Unable to handle kernel paging request at virtual address ffff80008001ffe8
[    0.000000] Mem abort info:
[    0.000000]   ESR = 0x0000000096000004
[    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.000000]   SET = 0, FnV = 0
[    0.000000]   EA = 0, S1PTW = 0
[    0.000000]   FSC = 0x04: level 0 translation fault
[    0.000000] Data abort info:
[    0.000000]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    0.000000]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    0.000000]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.000000] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000041f10000
[    0.000000] [ffff80008001ffe8] pgd=0000000000000000, p4d=0000000000000000, pud=1000000043017403, pmd=1000000043018403, pte=006800000800f713
[    0.000000] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0-rc2-00006-g32d053d6f5e9 #1
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 800000c9 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : readl_relaxed+0x0/0x8
[    0.000000] lr : gic_validate_dist_version+0x18/0x3c
[    0.000000] sp : ffffb0df9bf63c90
[    0.000000] x29: ffffb0df9bf63c90 x28: 0000000000000000 x27: 0000000000000000
[    0.000000] x26: ffffb0df9bf63d78 x25: 0000000000000008 x24: dead000000000122
[    0.000000] x23: ffff800080010000 x22: ffffb0df9bf63d88 x21: ffffb0df9bf63d78
[    0.000000] x20: 0000000000000000 x19: ffff39131ff08a68 x18: 0000000000000001
[    0.000000] x17: 0000000000000068 x16: 0000000000000100 x15: ffffb0df9b722ee0
[    0.000000] x14: 0000000000000000 x13: ffff800080021000 x12: ffff80008001ffff
[    0.000000] x11: 0000000000000000 x10: 0000000008010000 x9 : 0000000008010000
[    0.000000] x8 : ffff80008001ffff x7 : ffff391303017008 x6 : ffff800080020000
[    0.000000] x5 : 000000000000003f x4 : 000000000000003f x3 : 0000000000000000
[    0.000000] x2 : 0000000000000000 x1 : 000000000000ffe8 x0 : ffff80008001ffe8
[    0.000000] Call trace:
[    0.000000]  readl_relaxed+0x0/0x8 (P)
[    0.000000]  gic_validate_dist_version+0x18/0x3c (L)
[    0.000000]  gic_of_init+0x98/0x278
[    0.000000]  of_irq_init+0x1d4/0x34c
[    0.000000]  irqchip_init+0x18/0x40
[    0.000000]  init_IRQ+0x9c/0xb4
[    0.000000]  start_kernel+0x528/0x6d4
[    0.000000]  __primary_switched+0x88/0x90
[    0.000000] Code: a8c17bfd d50323bf d65f03c0 d503201f (b9400000)
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

# Using KVM, there is just a hang
$ qemu-system-aarch64 \
	-display none \
	-nodefaults \
	-machine virt,gic-version=max \
	-append 'console=ttyAMA0 earlycon' \
	-kernel arch/arm64/boot/Image.gz \
	-initrd rootfs.cpio \
	-cpu host \
	-enable-kvm \
	-m 512m \
	-smp 8 \
	-serial mon:stdio

Is this a configuration issue? Reverting this change makes everything
work again.

Cheers,
Nathan

