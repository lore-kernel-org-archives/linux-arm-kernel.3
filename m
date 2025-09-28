Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4071CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HQsWcOOQOPFRh+csyXpVaXXlYECUrdq9XpTTlGCeshY=; b=lkzcY9o2GkCPpK1sksCwmYSsgM
	8L7BJ63gORMTgidtkn+xMw2nu2wGKBIFMJxZ4YGIiauZHRfkk1LP598o7MRUe6LkzY3Rwle7swRyV
	6fpf7mgTVqwpWvdZWaRXd3iH9zFEAexRvK/1CcfvrDbVHwPSCOVhCsgIXUXHRoTkXgn2wuPX76V2Y
	ixFY6zDGjGxRtp8HDCIOHJxrdwXWZWfT5Fg74c1glbNcObYpcfIEdX4a44+NCU6N9Z7erBXdG0k78
	NU6SYgiIcKS+GV95r5zPjbRHHRNGzOMOsOZTLItBtZEl3ab7UziA5LgMclraD6zG/cizRSJTjfweX
	Eli3bCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nBw-0000000ETHS-2K0k;
	Sun, 28 Sep 2025 08:55:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nBu-0000000ETFn-2BXI;
	Sun, 28 Sep 2025 08:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HQsWcOOQOPFRh+csyXpVaXXlYECUrdq9XpTTlGCeshY=; b=eoLvKu4ksJ4WLw5t0JSu/6zmtD
	RNM7Rqqku+Ag4jXgRozXjzd+ZqEZcPSLzMCP50v3gl1/Ioaa3T2QTjdKa3DdlyDhpNuRVVeFIigZs
	6lf+VUcvQHweFK+SE5xLrwISApTcQAHzNOekL1IisN/RPhu53r6cKGniRSWOa+yFBPTujf6DZtEbg
	kRswIPvYP4CjHFJnK67lU+HN97cpxnbu46gDHzPJP4KwuoVxXQvVWOyzVM/T39JItn/B2s9VSSO2g
	4rIiLBffjkHxqvNEi9Vpk7HVo/a9Z7BtTrAxcweuQEg2bZ1i+ohmzCC0jv4HjDSukTuGdAeT+gdlO
	7MlzBUFQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nBp-0000000H078-0mnk;
	Sun, 28 Sep 2025 08:55:33 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_tLz99hoBswPAA--.33201S3;
	Sun, 28 Sep 2025 16:55:16 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxpeTw99hoCnK5AA--.60733S2;
	Sun, 28 Sep 2025 16:55:12 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] efistub: Only link libstub to final vmlinux
Date: Sun, 28 Sep 2025 16:55:06 +0800
Message-ID: <20250928085506.4471-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJBxpeTw99hoCnK5AA--.60733S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF4rCF15tF13uFykWry5Jrc_yoWrCFykpa
	nakr4qvrWkWrWvq3s7G3yUWw15KFn8trZIqFyDCFZ0yr4UZwn29rZxJrZrAFZ8Xr1DAFWS
	qr1xKFyakF1DA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_095530_432453_FAB1AC3B 
X-CRM114-Status: UNSURE (   8.77  )
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

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
the following objtool warning on LoongArch:

  vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
  falls through to next function __efistub_exit_boot_func()

This is because efi_boot_kernel() doesn't end with a return instruction
or an unconditional jump, then objtool has determined that the function
can fall through into the next function.

At the beginning, try to do something to make efi_boot_kernel() ends with
an unconditional jump instruction, but this modification seems not proper.

Since the efistub functions are useless for stack unwinder, they can be
ignored by objtool. After many discussions, no need to link libstub to
the vmlinux.o, only link libstub to the final vmlinux.

Do the similar things for arm64 and riscv, otherwise there may be objtool
warnings when arm64 and riscv support objtool, this is to make consistent
with the archs that use libstub.

Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Makefile                | 1 +
 arch/arm64/Makefile     | 5 ++++-
 arch/loongarch/Makefile | 5 ++++-
 arch/riscv/Makefile     | 5 ++++-
 scripts/link-vmlinux.sh | 5 ++---
 5 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 10355ecf32cb..8ba2e28ef3d1 100644
--- a/Makefile
+++ b/Makefile
@@ -1201,6 +1201,7 @@ KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
 export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_LIBS_PRELINK
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8b..038f37ef2143 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -156,7 +156,10 @@ KBUILD_CPPFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
 KBUILD_AFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
 
 libs-y		:= arch/arm64/lib/ $(libs-y)
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+
+ifdef CONFIG_EFI_STUB
+KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
+endif
 
 # Default target when executing plain make
 boot		:= arch/arm64/boot
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index ae419e32f22e..4eb904c20718 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -169,7 +169,10 @@ CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev
 endif
 
 libs-y += arch/loongarch/lib/
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+
+ifdef CONFIG_EFI_STUB
+KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
+endif
 
 drivers-y		+= arch/loongarch/crypto/
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index df57654a615e..cfd82b2c1bbf 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -173,7 +173,10 @@ boot-image-$(CONFIG_XIP_KERNEL)		:= xipImage
 KBUILD_IMAGE				:= $(boot)/$(boot-image-y)
 
 libs-y += arch/riscv/lib/
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+
+ifdef CONFIG_EFI_STUB
+KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
+endif
 
 ifeq ($(KBUILD_EXTMOD),)
 ifeq ($(CONFIG_MMU),y)
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 51367c2bfc21..b3cbff31d8a9 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -61,12 +61,11 @@ vmlinux_link()
 	shift
 
 	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
-		# Use vmlinux.o instead of performing the slow LTO link again.
 		objs=vmlinux.o
-		libs=
+		libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
 	else
 		objs=vmlinux.a
-		libs="${KBUILD_VMLINUX_LIBS}"
+		libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
 	fi
 
 	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
-- 
2.42.0


