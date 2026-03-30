Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E181061B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnoHPio8SWbp7aTOGjpK4H9muqZI6VxbArk5JjQuqD8=; b=WmYJFN7k6IFed9uFe61CpRX4mW
	nfqMHZFANCfA75I92uvd/RJTxZMG/A1+aepRKlDJEATXs1sOIdqLAPyanNYiL0fvfjAEOWrPQZgP3
	ezf9XHjP3dSOXtevCyNtoNU4Lcjz01QW9iHeorLm97WexderFftNpyf16SyJCxat+nyKQ7xkK2N2k
	MK0d/0WFJNzIM3/S/Mzmj+XjsRwUC17FHlpLGSP+/Al/XADsuT2Z41Zn0C4y1wlP5CdiipPZrIJOX
	LC56z+frKNK3KsCJS8ffve2TSqkomM0GJ9IKqW31W0s3FxLxete2oyW3xNIOPXSDNpScU75UhADbG
	S9+Z2GhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DtO-0000000BSBl-10uR;
	Mon, 30 Mar 2026 14:47:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DtD-0000000BS7k-2KAr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:46:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41F0644544;
	Mon, 30 Mar 2026 14:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D62DC2BCB7;
	Mon, 30 Mar 2026 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882011;
	bh=Jv9spUpAK9RVhgbG4TZly9WpqFqZUiyy7ckkNarpWN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yj7icNuh/R+mnYDYtOIYPrRN7XLx5pI89g9nkoqHWAbJZBpDaUstlaxv0MgrJebQi
	 k/edNz/ZzULdZVu5GCPgdymI9Z9a+8xRDlOUAYSK+W9ph1bRK36VaZA7fov8FI/tBH
	 iswdvA82MTHihhWnU4zRE5kgvoCHLASq8tJXJPCsayiV4hXOY+jUYP0B2QKOCKZaTT
	 WA2gH6wX2VSPXXXnFc7ghqQNwjd+zQ5ULjdoMqXk36nM+GW2N4CVHVxdOdArg69NLb
	 AQz/nstcOEVtLzCQXwzwzlqaTWZiJbaq9OVE6dsv7tgC6p+59Y4cS3xKgWbEZkzi3o
	 smB1AmfC/7HEA==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Demian Shulhan <demyansh@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 5/5] lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
Date: Mon, 30 Mar 2026 16:46:36 +0200
Message-ID: <20260330144630.33026-12-ardb@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330144630.33026-7-ardb@kernel.org>
References: <20260330144630.33026-7-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845; i=ardb@kernel.org; h=from:subject; bh=Jv9spUpAK9RVhgbG4TZly9WpqFqZUiyy7ckkNarpWN8=; b=owGbwMvMwCn83sBh/rljoYmMp9WSGDJP9Zzg37rFUviswuLoLZ6vOMPkf0p6iNdlue0yZlDbq CxaOGFdx1QWBmFOBlkxRZadyjndr11E3+krVObAzGFlAhnCwMUpABPZv5KxhifLWdK+gGXZrZeG xh0x3Zx/Q8+/NGOd1nRvWUBj4r/6du8skTUa9/94HZS7t+nYMyclxoYvYdrph8/32+qoVp+90L7 /UuNj3hvKhz0D48+Ver0SvMwXE7Ti5951wf68bd4M/d+FCwE=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_074651_632329_B63A5682 
X-CRM114-Status: GOOD (  16.44  )
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

Tweak the NEON intrinsics crc64 code written for arm64 so it can be
built for 32-bit ARM as well. The only workaround needed is to provide
alternatives for vmull_p64() and vmull_high_p64() on Clang, which only
defines those when building for the AArch64 or arm64ec ISA.

KUnit benchmark results (Cortex-A53 @ 1 Ghz)

Before:

   # crc64_nvme_benchmark: len=1: 35 MB/s
   # crc64_nvme_benchmark: len=16: 78 MB/s
   # crc64_nvme_benchmark: len=64: 87 MB/s
   # crc64_nvme_benchmark: len=127: 88 MB/s
   # crc64_nvme_benchmark: len=128: 88 MB/s
   # crc64_nvme_benchmark: len=200: 89 MB/s
   # crc64_nvme_benchmark: len=256: 89 MB/s
   # crc64_nvme_benchmark: len=511: 89 MB/s
   # crc64_nvme_benchmark: len=512: 89 MB/s
   # crc64_nvme_benchmark: len=1024: 90 MB/s
   # crc64_nvme_benchmark: len=3173: 90 MB/s
   # crc64_nvme_benchmark: len=4096: 90 MB/s
   # crc64_nvme_benchmark: len=16384: 90 MB/s

After:

   # crc64_nvme_benchmark: len=1: 32 MB/s
   # crc64_nvme_benchmark: len=16: 76 MB/s
   # crc64_nvme_benchmark: len=64: 71 MB/s
   # crc64_nvme_benchmark: len=127: 88 MB/s
   # crc64_nvme_benchmark: len=128: 618 MB/s
   # crc64_nvme_benchmark: len=200: 542 MB/s
   # crc64_nvme_benchmark: len=256: 920 MB/s
   # crc64_nvme_benchmark: len=511: 836 MB/s
   # crc64_nvme_benchmark: len=512: 1261 MB/s
   # crc64_nvme_benchmark: len=1024: 1531 MB/s
   # crc64_nvme_benchmark: len=3173: 1731 MB/s
   # crc64_nvme_benchmark: len=4096: 1851 MB/s
   # crc64_nvme_benchmark: len=16384: 1858 MB/s

Enable big-endian support only on GCC - the code generated by Clang is
horribly broken.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/crc/Kconfig                  |  1 +
 lib/crc/Makefile                 |  5 ++-
 lib/crc/arm/crc64.h              | 36 ++++++++++++++++++++
 lib/crc/arm64/crc64-neon-inner.c | 35 +++++++++++++++++++
 4 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 31038c8d111a..2f93d4c4d52d 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -82,6 +82,7 @@ config CRC64
 config CRC64_ARCH
 	bool
 	depends on CRC64 && CRC_OPTIMIZATIONS
+	default y if ARM && KERNEL_MODE_NEON && !(CPU_BIG_ENDIAN && CC_IS_CLANG)
 	default y if ARM64
 	default y if RISCV && RISCV_ISA_ZBC && 64BIT
 	default y if X86_64
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index ff213590e4e3..b6c381cc66bb 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -39,8 +39,11 @@ crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
 CFLAGS_crc64-main.o += -I$(src)/$(SRCARCH)
 
+crc64-cflags-$(CONFIG_ARM) += -march=armv8-a -mfpu=crypto-neon-fp-armv8
+crc64-cflags-$(CONFIG_ARM64) += -march=armv8-a+crypto
 CFLAGS_REMOVE_arm64/crc64-neon-inner.o += $(CC_FLAGS_NO_FPU)
-CFLAGS_arm64/crc64-neon-inner.o += $(CC_FLAGS_FPU) -march=armv8-a+crypto
+CFLAGS_arm64/crc64-neon-inner.o += $(CC_FLAGS_FPU) $(crc64-cflags-y)
+crc64-$(CONFIG_ARM) += arm64/crc64-neon-inner.o
 crc64-$(CONFIG_ARM64) += arm64/crc64-neon-inner.o
 
 crc64-$(CONFIG_RISCV) += riscv/crc64_lsb.o riscv/crc64_msb.o
diff --git a/lib/crc/arm/crc64.h b/lib/crc/arm/crc64.h
new file mode 100644
index 000000000000..7c8d54f38e5c
--- /dev/null
+++ b/lib/crc/arm/crc64.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * CRC64 using ARM PMULL instructions
+ */
+
+#include <asm/simd.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
+
+u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len);
+
+#define crc64_be_arch crc64_be_generic
+
+static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
+{
+	if (len >= 128 && static_branch_likely(&have_pmull) &&
+	    likely(may_use_simd())) {
+		do {
+			size_t chunk = min_t(size_t, len & ~15, SZ_4K);
+
+			scoped_ksimd()
+				crc = crc64_nvme_arm64_c(crc, p, chunk);
+
+			p += chunk;
+			len -= chunk;
+		} while (len >= 128);
+	}
+	return crc64_nvme_generic(crc, p, len);
+}
+
+#define crc64_mod_init_arch crc64_mod_init_arch
+static void crc64_mod_init_arch(void)
+{
+	if (elf_hwcap2 & HWCAP2_PMULL)
+		static_branch_enable(&have_pmull);
+}
diff --git a/lib/crc/arm64/crc64-neon-inner.c b/lib/crc/arm64/crc64-neon-inner.c
index 28527e544ff6..99607dbb7bfd 100644
--- a/lib/crc/arm64/crc64-neon-inner.c
+++ b/lib/crc/arm64/crc64-neon-inner.c
@@ -15,6 +15,40 @@ static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
 static const u64 bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
 				    0x34d926535897936aULL };
 
+#if defined(CONFIG_ARM) && defined(CONFIG_CC_IS_CLANG)
+static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
+{
+	uint64_t l = vgetq_lane_u64(a, 0);
+	uint64_t m = vgetq_lane_u64(b, 0);
+	uint64x2_t result;
+
+	asm("vmull.p64	%q0, %1, %2" : "=w"(result) : "w"(l), "w"(m));
+
+	return result;
+}
+
+static inline uint64x2_t pmull64_high(uint64x2_t a, uint64x2_t b)
+{
+	uint64_t l = vgetq_lane_u64(a, 1);
+	uint64_t m = vgetq_lane_u64(b, 1);
+	uint64x2_t result;
+
+	asm("vmull.p64	%q0, %1, %2" : "=w"(result) : "w"(l), "w"(m));
+
+	return result;
+}
+
+static inline uint64x2_t pmull64_hi_lo(uint64x2_t a, uint64x2_t b)
+{
+	uint64_t l = vgetq_lane_u64(a, 1);
+	uint64_t m = vgetq_lane_u64(b, 0);
+	uint64x2_t result;
+
+	asm("vmull.p64	%q0, %1, %2" : "=w"(result) : "w"(l), "w"(m));
+
+	return result;
+}
+#else
 static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
 {
 	return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 0),
@@ -34,6 +68,7 @@ static inline uint64x2_t pmull64_hi_lo(uint64x2_t a, uint64x2_t b)
 	return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 1),
 						vgetq_lane_u64(b, 0)));
 }
+#endif
 
 u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len)
 {
-- 
2.53.0.1018.g2bb0e51243-goog


