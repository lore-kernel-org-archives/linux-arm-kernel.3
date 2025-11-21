Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247AACFA761
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=95i1p9owPsncEna8IT6dFRMEiBK6JP9W4qSsbGs/sRs=; b=dHMQvzCXCpiUW4DqatSvfiuXyA
	HCW0iZBkhAkXMYCPaVHAllOIhzsE1AGC9hyLnBciThfaDtgP1hFyO5uo02sSfT7NLGp6nneNEVKjN
	jfefzTBwulKSx/0ei+ofg9vfxUWgzuKnXP1tbhpwBon/vmu8mSruoZAWoJbtGt+4YIbZGMKX3MT8E
	biwhlYrfIThvrkOA2UzuVvETjkiEx1d9cMMKfLXBoGGzD+cK6l+ZXeGQB9NAyNU+H+ZW3O58vyYXs
	wcD5jnkWEZAi9a6bif/kz6//8qxHvHX1vXokRXUZ+5UoN8wQDBXAgcdqR5WxPQ9R1+lfcCLG8YdhM
	moIjtdjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNx5-00000008BVr-0fsn;
	Fri, 21 Nov 2025 10:01:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNwx-00000008BTq-2XaZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 10:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763719262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=95i1p9owPsncEna8IT6dFRMEiBK6JP9W4qSsbGs/sRs=;
	b=i8mntFpNb2qInGJhMK0Lg8kXThOq49AvMul9wOl2ONhtujz+8wabCYKEYpu07UStmCoF3a
	s2wThgmA5QupitwLkIFmcXiLyrWOlVc1tzJss6QnU4uWyXEQrSH+EUl4il3pd0M1UJNEVI
	o2wBP1EVnSzWokeNA6SE6AuEG4/jueU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-546-3nTmsyRbM6qtk_GlSnfP7w-1; Fri,
 21 Nov 2025 05:00:58 -0500
X-MC-Unique: 3nTmsyRbM6qtk_GlSnfP7w-1
X-Mimecast-MFC-AGG-ID: 3nTmsyRbM6qtk_GlSnfP7w_1763719257
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C176B195609F;
	Fri, 21 Nov 2025 10:00:56 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.78])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 08D6B1955F66;
	Fri, 21 Nov 2025 10:00:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 0/9] treewide: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Fri, 21 Nov 2025 11:00:35 +0100
Message-ID: <20251121100044.282684-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_020107_788700_EE848354 
X-CRM114-Status: GOOD (  18.70  )
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

 Hi Arnd!

Could you please help to get the remaining patches of this macro
renaming series merged? I already got most patches from the initial
version merged through the architecture specific trees (thanks to every
maintainer who helped me here!), but for alpha and arm 32-bit, I did
not manage to get the attention of the maintainers. Hexagon got an
Acked-by by Brian, but the patches did not get merged yet.

Anyway, original patch series description follows:

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembly and C source code.
However, all the supported versions of the GCC and Clang compilers
also define the macro __ASSEMBLER__ automatically already when compiling
assembly code, so some kernel headers are using __ASSEMBLER__ instead.
With regards to userspace code, this seems also to be constant source
of confusion, see for example these links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it would make sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurances of __ASSEMBLY__ into __ASSEMBLER__ and
finally removes the -D__ASSEMBLY__ from the Makefiles.

I split the patches per architecture to ease the review, and I also
split the uapi headers from the normal ones in case we decide that
uapi needs to be treated differently from the normal headers here.

v4:
- Most patches from the original series got already merged via the
  tree of the individual architectures, so the amount of patches here
  has been greatly reduced
- Rebased patches on top of linux-next, fixed conflicts and new
  occurances

Thomas Huth (9):
  alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in the alpha headers
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  uapi: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  include: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  x86/headers: Replace __ASSEMBLY__ stragglers with __ASSEMBLER__
  treewide: Stop defining __ASSEMBLY__ for assembler files

 Documentation/dev-tools/checkuapi.rst          |  2 +-
 Makefile                                       |  2 +-
 arch/alpha/include/asm/console.h               |  4 ++--
 arch/alpha/include/asm/page.h                  |  4 ++--
 arch/alpha/include/asm/pal.h                   |  4 ++--
 arch/alpha/include/asm/thread_info.h           |  8 ++++----
 arch/arm/include/asm/arch_gicv3.h              |  4 ++--
 arch/arm/include/asm/assembler.h               |  2 +-
 arch/arm/include/asm/barrier.h                 |  4 ++--
 arch/arm/include/asm/cache.h                   |  2 +-
 arch/arm/include/asm/cp15.h                    |  4 ++--
 arch/arm/include/asm/cputype.h                 |  4 ++--
 arch/arm/include/asm/current.h                 |  4 ++--
 arch/arm/include/asm/delay.h                   |  4 ++--
 arch/arm/include/asm/domain.h                  |  8 ++++----
 arch/arm/include/asm/fpstate.h                 |  2 +-
 arch/arm/include/asm/ftrace.h                  |  6 +++---
 arch/arm/include/asm/hardware/cache-b15-rac.h  |  2 +-
 arch/arm/include/asm/hardware/cache-l2x0.h     |  4 ++--
 arch/arm/include/asm/hardware/dec21285.h       |  2 +-
 arch/arm/include/asm/hardware/ioc.h            |  2 +-
 arch/arm/include/asm/hardware/iomd.h           |  4 ++--
 arch/arm/include/asm/hardware/memc.h           |  2 +-
 arch/arm/include/asm/hwcap.h                   |  2 +-
 arch/arm/include/asm/irq.h                     |  2 +-
 arch/arm/include/asm/jump_label.h              |  4 ++--
 arch/arm/include/asm/kexec.h                   |  4 ++--
 arch/arm/include/asm/kgdb.h                    |  4 ++--
 arch/arm/include/asm/mach/arch.h               |  2 +-
 arch/arm/include/asm/mcpm.h                    |  4 ++--
 arch/arm/include/asm/memory.h                  |  4 ++--
 arch/arm/include/asm/mpu.h                     |  4 ++--
 arch/arm/include/asm/opcodes.h                 | 12 ++++++------
 arch/arm/include/asm/page.h                    |  4 ++--
 arch/arm/include/asm/pgtable-2level.h          |  4 ++--
 arch/arm/include/asm/pgtable-3level.h          |  4 ++--
 arch/arm/include/asm/pgtable-nommu.h           |  4 ++--
 arch/arm/include/asm/pgtable.h                 | 10 +++++-----
 arch/arm/include/asm/probes.h                  |  4 ++--
 arch/arm/include/asm/proc-fns.h                |  4 ++--
 arch/arm/include/asm/ptrace.h                  |  4 ++--
 arch/arm/include/asm/system_info.h             |  4 ++--
 arch/arm/include/asm/system_misc.h             |  4 ++--
 arch/arm/include/asm/thread_info.h             |  2 +-
 arch/arm/include/asm/thread_notify.h           |  2 +-
 arch/arm/include/asm/tlbflush.h                | 10 +++++-----
 arch/arm/include/asm/tls.h                     |  4 ++--
 arch/arm/include/asm/unified.h                 |  6 +++---
 arch/arm/include/asm/unwind.h                  |  4 ++--
 arch/arm/include/asm/v7m.h                     |  4 ++--
 arch/arm/include/asm/vdso.h                    |  4 ++--
 arch/arm/include/asm/vdso/cp15.h               |  4 ++--
 arch/arm/include/asm/vdso/gettimeofday.h       |  4 ++--
 arch/arm/include/asm/vdso/processor.h          |  4 ++--
 arch/arm/include/asm/vdso/vsyscall.h           |  4 ++--
 arch/arm/include/asm/vfp.h                     |  2 +-
 arch/arm/include/asm/virt.h                    |  4 ++--
 arch/arm/include/uapi/asm/ptrace.h             |  4 ++--
 arch/arm/mach-at91/pm.h                        |  2 +-
 arch/arm/mach-exynos/smc.h                     |  4 ++--
 .../mach-footbridge/include/mach/hardware.h    |  2 +-
 arch/arm/mach-imx/hardware.h                   |  2 +-
 arch/arm/mach-imx/mxc.h                        |  2 +-
 arch/arm/mach-omap2/control.h                  |  8 ++++----
 arch/arm/mach-omap2/soc.h                      |  4 ++--
 arch/arm/mach-omap2/sram.h                     |  4 ++--
 arch/arm/mach-pxa/irqs.h                       |  2 +-
 arch/arm/mach-pxa/pxa-regs.h                   |  2 +-
 arch/arm/mach-s3c/map-base.h                   |  2 +-
 arch/arm/mach-sa1100/include/mach/bitfield.h   |  2 +-
 arch/arm/mach-sa1100/include/mach/hardware.h   |  2 +-
 arch/arm/mach-tegra/reset.h                    |  2 +-
 arch/arm/mach-tegra/sleep.h                    |  2 +-
 arch/arm/tools/gen-mach-types                  |  2 +-
 arch/arm64/kernel/vdso32/Makefile              |  1 -
 arch/hexagon/include/asm/hexagon_vm.h          |  4 ++--
 arch/hexagon/include/asm/mem-layout.h          |  6 +++---
 arch/hexagon/include/asm/page.h                |  4 ++--
 arch/hexagon/include/asm/processor.h           |  4 ++--
 arch/hexagon/include/asm/thread_info.h         | 12 ++++++------
 arch/hexagon/include/uapi/asm/registers.h      |  4 ++--
 arch/loongarch/vdso/Makefile                   |  2 +-
 arch/mips/boot/compressed/Makefile             |  2 +-
 arch/mips/vdso/Makefile                        |  2 +-
 arch/powerpc/boot/Makefile                     |  2 +-
 arch/powerpc/platforms/cell/spufs/Makefile     |  2 +-
 arch/s390/Makefile                             |  2 +-
 arch/x86/boot/Makefile                         |  2 +-
 arch/x86/boot/compressed/Makefile              |  2 +-
 arch/x86/include/asm/irqflags.h                |  4 ++--
 arch/x86/include/asm/percpu.h                  |  2 +-
 arch/x86/include/asm/runtime-const.h           |  6 +++---
 arch/x86/realmode/rm/Makefile                  |  2 +-
 arch/xtensa/kernel/Makefile                    |  2 +-
 drivers/firmware/efi/libstub/Makefile          |  2 +-
 drivers/memory/emif.h                          |  4 ++--
 drivers/net/wan/Makefile                       |  2 +-
 include/asm-generic/barrier.h                  |  4 ++--
 include/asm-generic/bug.h                      |  4 ++--
 include/asm-generic/current.h                  |  2 +-
 include/asm-generic/error-injection.h          |  2 +-
 include/asm-generic/fixmap.h                   |  4 ++--
 include/asm-generic/getorder.h                 |  4 ++--
 include/asm-generic/int-ll64.h                 |  6 +++---
 include/asm-generic/kprobes.h                  |  4 ++--
 include/asm-generic/memory_model.h             |  4 ++--
 include/asm-generic/mmu.h                      |  2 +-
 include/asm-generic/pgtable-nop4d.h            |  4 ++--
 include/asm-generic/pgtable-nopmd.h            |  4 ++--
 include/asm-generic/pgtable-nopud.h            |  4 ++--
 include/asm-generic/rwonce.h                   |  4 ++--
 include/asm-generic/signal.h                   |  4 ++--
 include/asm-generic/vdso/vsyscall.h            |  4 ++--
 include/linux/amba/serial.h                    |  4 ++--
 include/linux/annotate.h                       | 18 +++++++++---------
 include/linux/arm-smccc.h                      | 10 +++++-----
 include/linux/bitmap.h                         |  4 ++--
 include/linux/bits.h                           |  6 +++---
 include/linux/cfi_types.h                      |  6 +++---
 include/linux/compiler.h                       |  4 ++--
 include/linux/compiler_types.h                 |  4 ++--
 include/linux/edd.h                            |  4 ++--
 include/linux/err.h                            |  2 +-
 include/linux/export.h                         |  2 +-
 include/linux/init.h                           |  6 +++---
 include/linux/ioport.h                         |  4 ++--
 include/linux/irqchip/arm-gic-v3.h             |  2 +-
 include/linux/irqchip/arm-gic.h                |  4 ++--
 include/linux/jump_label.h                     | 10 +++++-----
 include/linux/kexec.h                          |  2 +-
 include/linux/linkage.h                        |  6 +++---
 include/linux/mem_encrypt.h                    |  4 ++--
 include/linux/mmzone.h                         |  4 ++--
 include/linux/objtool.h                        |  8 ++++----
 include/linux/objtool_types.h                  |  4 ++--
 include/linux/of_fdt.h                         |  4 ++--
 include/linux/pe.h                             |  4 ++--
 include/linux/percpu-defs.h                    |  4 ++--
 include/linux/pfn.h                            |  2 +-
 include/linux/pgtable.h                        |  4 ++--
 include/linux/platform_data/emif_plat.h        |  4 ++--
 include/linux/serial_s3c.h                     |  4 ++--
 include/linux/static_call_types.h              |  4 ++--
 include/linux/ti-emif-sram.h                   |  2 +-
 include/linux/types.h                          |  4 ++--
 include/soc/imx/cpu.h                          |  2 +-
 include/soc/tegra/flowctrl.h                   |  4 ++--
 include/soc/tegra/fuse.h                       |  4 ++--
 include/uapi/asm-generic/int-l64.h             |  4 ++--
 include/uapi/asm-generic/int-ll64.h            |  4 ++--
 include/uapi/asm-generic/signal-defs.h         |  2 +-
 include/uapi/asm-generic/signal.h              |  4 ++--
 include/uapi/linux/a.out.h                     |  4 ++--
 include/uapi/linux/const.h                     |  4 ++--
 include/uapi/linux/edd.h                       |  4 ++--
 include/uapi/linux/hdlc/ioctl.h                |  4 ++--
 include/uapi/linux/sched.h                     |  2 +-
 include/uapi/linux/types.h                     |  4 ++--
 include/vdso/datapage.h                        |  6 +++---
 include/vdso/helpers.h                         |  4 ++--
 include/vdso/processor.h                       |  4 ++--
 include/vdso/vsyscall.h                        |  4 ++--
 include/xen/arm/interface.h                    |  2 +-
 include/xen/interface/xen-mca.h                |  4 ++--
 include/xen/interface/xen.h                    |  8 ++++----
 scripts/Makefile.build                         |  2 +-
 scripts/gfp-translate                          |  2 +-
 tools/include/asm-generic/barrier.h            |  4 ++--
 tools/include/asm/alternative.h                |  2 +-
 tools/include/linux/bits.h                     |  6 +++---
 tools/include/linux/cfi_types.h                |  6 +++---
 tools/include/linux/compiler.h                 |  4 ++--
 tools/include/linux/objtool_types.h            |  4 ++--
 tools/include/linux/static_call_types.h        |  4 ++--
 tools/include/uapi/linux/const.h               |  4 ++--
 .../trace/beauty/include/uapi/linux/sched.h    |  2 +-
 .../testing/selftests/kvm/lib/riscv/handlers.S |  4 ----
 .../testing/selftests/vDSO/vgetrandom-chacha.S |  2 --
 178 files changed, 342 insertions(+), 349 deletions(-)

-- 
2.51.1


