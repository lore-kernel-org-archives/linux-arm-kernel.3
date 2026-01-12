Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F52CF45B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiMOOEA6qNaiQDDGgdthf6TZH3O0GT1Wjo585EHcW4E=; b=aL8BeJ/hAYe73OcDbBo58tEa2E
	QBVDs7iLkxl0cpeamqZTl1czMFLF1yERGWy0IBepTXf4PkvyZ9VqLvcnFknFXvkgHcIG4phiQqj/y
	Ftfh/XwHyJMrhlifQSRjGMozZiW5J+Z8ry6A0aqr3f+srJ4uX44/m7ZRj69GghPSnLQVeTpeJywoH
	IrN/yI0aC+5YFVClfjeWqPZy8jq240NimlShWGwO5s6VmiPzA1jY4mb3YdDTOiukD8yaD5gkTvsvB
	0DbZAAUk6KlW0HoDrPL5zWNeGaOaZT4h1CVDckXMIOVFOTfGXOHHAm94VzhcIN37Ae7CL8rHYGe1d
	IChChfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLhW-00000005r4r-1Rye;
	Mon, 12 Jan 2026 17:27:34 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLhS-00000005r49-3Y7c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768238846; x=1768498046;
	bh=JiMOOEA6qNaiQDDGgdthf6TZH3O0GT1Wjo585EHcW4E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LjxjrDuCoGf0G2mwtHa5/HV7S/hBCta7EcOVZERcqDUqFwE0FNnq96D8jZFg2S/fK
	 OIygr+dLmg5ndkEUU/pCV4KSopBovq+rLu8BnJHFuSBjdWxC5E+VEKphqlx/vObzEs
	 lWYzLRBkT+vP/B9e114ATzUgVhAqtxlx13mvk+d97a4ycPwikhexcdCjCVo3gb6yhw
	 dKMr0iX8j6mRfpKSeO3L5kX0HaJRJPpgs/rV7U/88zDYkjOxscSNbBC/TE75sYeJ0e
	 T8uK8+pDljbYd2VSI45c1/2Y+LEbCcMkDveADsvGSrtuwd0hAK6ngQ1PQl5qGmvsH8
	 E4hwHdMcHDtnA==
Date: Mon, 12 Jan 2026 17:27:22 +0000
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: [PATCH v8 01/14] kasan: sw_tags: Use arithmetic shift for shadow computation
Message-ID: <4f31939d55d886f21c91272398fe43a32ea36b3f.1768233085.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1768233085.git.m.wieczorretman@pm.me>
References: <cover.1768233085.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 70a6fe20ee18bc60426e6e68f454786f4fa58ddd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_092731_171671_C5B22509 
X-CRM114-Status: GOOD (  24.66  )
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

From: Samuel Holland <samuel.holland@sifive.com>

Currently, kasan_mem_to_shadow() uses a logical right shift, which turns
canonical kernel addresses into non-canonical addresses by clearing the
high KASAN_SHADOW_SCALE_SHIFT bits. The value of KASAN_SHADOW_OFFSET is
then chosen so that the addition results in a canonical address for the
shadow memory.

For KASAN_GENERIC, this shift/add combination is ABI with the compiler,
because KASAN_SHADOW_OFFSET is used in compiler-generated inline tag
checks[1], which must only attempt to dereference canonical addresses.

However, for KASAN_SW_TAGS there is some freedom to change the algorithm
without breaking the ABI. Because TBI is enabled for kernel addresses,
the top bits of shadow memory addresses computed during tag checks are
irrelevant, and so likewise are the top bits of KASAN_SHADOW_OFFSET.
This is demonstrated by the fact that LLVM uses a logical right shift in
the tag check fast path[2] but a sbfx (signed bitfield extract)
instruction in the slow path[3] without causing any issues.

Using an arithmetic shift in kasan_mem_to_shadow() provides a number of
benefits:

1) The memory layout doesn't change but is easier to understand.
KASAN_SHADOW_OFFSET becomes a canonical memory address, and the shifted
pointer becomes a negative offset, so KASAN_SHADOW_OFFSET =3D=3D
KASAN_SHADOW_END regardless of the shift amount or the size of the
virtual address space.

2) KASAN_SHADOW_OFFSET becomes a simpler constant, requiring only one
instruction to load instead of two. Since it must be loaded in each
function with a tag check, this decreases kernel text size by 0.5%.

3) This shift and the sign extension from kasan_reset_tag() can be
combined into a single sbfx instruction. When this same algorithm change
is applied to the compiler, it removes an instruction from each inline
tag check, further reducing kernel text size by an additional 4.6%.

These benefits extend to other architectures as well. On RISC-V, where
the baseline ISA does not shifted addition or have an equivalent to the
sbfx instruction, loading KASAN_SHADOW_OFFSET is reduced from 3 to 2
instructions, and kasan_mem_to_shadow(kasan_reset_tag(addr)) similarly
combines two consecutive right shifts.

Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tr=
ansforms/Instrumentation/AddressSanitizer.cpp#L1316 [1]
Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tr=
ansforms/Instrumentation/HWAddressSanitizer.cpp#L895 [2]
Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Ta=
rget/AArch64/AArch64AsmPrinter.cpp#L669 [3]
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Co-developed-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
Changelog v7: (Maciej)
- Change UL to ULL in report.c to fix some compilation warnings.

Changelog v6: (Maciej)
- Add Catalin's acked-by.
- Move x86 gdb snippet here from the last patch.

Changelog v5: (Maciej)
- (u64) -> (unsigned long) in report.c

Changelog v4: (Maciej)
- Revert x86 to signed mem_to_shadow mapping.
- Remove last two paragraphs since they were just poorer duplication of
  the comments in kasan_non_canonical_hook().

Changelog v3: (Maciej)
- Fix scripts/gdb/linux/kasan.py so the new signed mem_to_shadow() is
  reflected there.
- Fix Documentation/arch/arm64/kasan-offsets.sh to take new offsets into
  account.
- Made changes to the kasan_non_canonical_hook() according to upstream
  discussion. Settled on overflow on both ranges and separate checks for
  x86 and arm.

Changelog v2: (Maciej)
- Correct address range that's checked in kasan_non_canonical_hook().
  Adjust the comment inside.
- Remove part of comment from arch/arm64/include/asm/memory.h.
- Append patch message paragraph about the overflow in
  kasan_non_canonical_hook().

 Documentation/arch/arm64/kasan-offsets.sh |  8 +++--
 arch/arm64/Kconfig                        | 10 +++----
 arch/arm64/include/asm/memory.h           | 14 ++++++++-
 arch/arm64/mm/kasan_init.c                |  7 +++--
 include/linux/kasan.h                     | 10 +++++--
 mm/kasan/report.c                         | 36 ++++++++++++++++++++---
 scripts/gdb/linux/kasan.py                |  5 +++-
 scripts/gdb/linux/mm.py                   |  5 ++--
 8 files changed, 76 insertions(+), 19 deletions(-)

diff --git a/Documentation/arch/arm64/kasan-offsets.sh b/Documentation/arch=
/arm64/kasan-offsets.sh
index 2dc5f9e18039..ce777c7c7804 100644
--- a/Documentation/arch/arm64/kasan-offsets.sh
+++ b/Documentation/arch/arm64/kasan-offsets.sh
@@ -5,8 +5,12 @@
=20
 print_kasan_offset () {
 =09printf "%02d\t" $1
-=09printf "0x%08x00000000\n" $(( (0xffffffff & (-1 << ($1 - 1 - 32))) \
-=09=09=09- (1 << (64 - 32 - $2)) ))
+=09if [[ $2 -ne 4 ]] then
+=09=09printf "0x%08x00000000\n" $(( (0xffffffff & (-1 << ($1 - 1 - 32))) \
+=09=09=09=09- (1 << (64 - 32 - $2)) ))
+=09else
+=09=09printf "0x%08x00000000\n" $(( (0xffffffff & (-1 << ($1 - 1 - 32))) )=
)
+=09fi
 }
=20
 echo KASAN_SHADOW_SCALE_SHIFT =3D 3
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7..c1b7261cdb96 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -434,11 +434,11 @@ config KASAN_SHADOW_OFFSET
 =09default 0xdffffe0000000000 if ARM64_VA_BITS_42 && !KASAN_SW_TAGS
 =09default 0xdfffffc000000000 if ARM64_VA_BITS_39 && !KASAN_SW_TAGS
 =09default 0xdffffff800000000 if ARM64_VA_BITS_36 && !KASAN_SW_TAGS
-=09default 0xefff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 &&=
 !ARM64_16K_PAGES)) && KASAN_SW_TAGS
-=09default 0xefffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) &&=
 ARM64_16K_PAGES && KASAN_SW_TAGS
-=09default 0xeffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
-=09default 0xefffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
-=09default 0xeffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
+=09default 0xffff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 &&=
 !ARM64_16K_PAGES)) && KASAN_SW_TAGS
+=09default 0xffffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) &&=
 ARM64_16K_PAGES && KASAN_SW_TAGS
+=09default 0xfffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
+=09default 0xffffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
+=09default 0xfffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
 =09default 0xffffffffffffffff
=20
 config UNWIND_TABLES
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memor=
y.h
index 9d54b2ea49d6..f127fbf691ac 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -89,7 +89,15 @@
  *
  * KASAN_SHADOW_END is defined first as the shadow address that correspond=
s to
  * the upper bound of possible virtual kernel memory addresses UL(1) << 64
- * according to the mapping formula.
+ * according to the mapping formula. For Generic KASAN, the address in the
+ * mapping formula is treated as unsigned (part of the compiler's ABI), so=
 the
+ * end of the shadow memory region is at a large positive offset from
+ * KASAN_SHADOW_OFFSET. For Software Tag-Based KASAN, the address in the
+ * formula is treated as signed. Since all kernel addresses are negative, =
they
+ * map to shadow memory below KASAN_SHADOW_OFFSET, making KASAN_SHADOW_OFF=
SET
+ * itself the end of the shadow memory region. (User pointers are positive=
 and
+ * would map to shadow memory above KASAN_SHADOW_OFFSET, but shadow memory=
 is
+ * not allocated for them.)
  *
  * KASAN_SHADOW_START is defined second based on KASAN_SHADOW_END. The sha=
dow
  * memory start must map to the lowest possible kernel virtual memory addr=
ess
@@ -100,7 +108,11 @@
  */
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 #define KASAN_SHADOW_OFFSET=09_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
+#ifdef CONFIG_KASAN_GENERIC
 #define KASAN_SHADOW_END=09((UL(1) << (64 - KASAN_SHADOW_SCALE_SHIFT)) + K=
ASAN_SHADOW_OFFSET)
+#else
+#define KASAN_SHADOW_END=09KASAN_SHADOW_OFFSET
+#endif
 #define _KASAN_SHADOW_START(va)=09(KASAN_SHADOW_END - (UL(1) << ((va) - KA=
SAN_SHADOW_SCALE_SHIFT)))
 #define KASAN_SHADOW_START=09_KASAN_SHADOW_START(vabits_actual)
 #define PAGE_END=09=09KASAN_SHADOW_START
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index abeb81bf6ebd..937f6eb8115b 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -198,8 +198,11 @@ static bool __init root_level_aligned(u64 addr)
 /* The early shadow maps everything to a single page of zeroes */
 asmlinkage void __init kasan_early_init(void)
 {
-=09BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=3D
-=09=09KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
+=09if (IS_ENABLED(CONFIG_KASAN_GENERIC))
+=09=09BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=3D
+=09=09=09KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
+=09else
+=09=09BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=3D KASAN_SHADOW_END);
 =09BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS), SHADOW_ALIGN));
 =09BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS_MIN), SHADOW_ALIGN=
));
 =09BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_END, SHADOW_ALIGN));
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 9c6ac4b62eb9..0f65e88cc3f6 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -62,8 +62,14 @@ int kasan_populate_early_shadow(const void *shadow_start=
,
 #ifndef kasan_mem_to_shadow
 static inline void *kasan_mem_to_shadow(const void *addr)
 {
-=09return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
-=09=09+ KASAN_SHADOW_OFFSET;
+=09void *scaled;
+
+=09if (IS_ENABLED(CONFIG_KASAN_GENERIC))
+=09=09scaled =3D (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)=
;
+=09else
+=09=09scaled =3D (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIFT);
+
+=09return KASAN_SHADOW_OFFSET + scaled;
 }
 #endif
=20
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 62c01b4527eb..b5beb1b10bd2 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -642,11 +642,39 @@ void kasan_non_canonical_hook(unsigned long addr)
 =09const char *bug_type;
=20
 =09/*
-=09 * All addresses that came as a result of the memory-to-shadow mapping
-=09 * (even for bogus pointers) must be >=3D KASAN_SHADOW_OFFSET.
+=09 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shif=
t
+=09 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (on
+=09 * both x86 and arm64). Thus, the possible shadow addresses (even for
+=09 * bogus pointers) belong to a single contiguous region that is the
+=09 * result of kasan_mem_to_shadow() applied to the whole address space.
 =09 */
-=09if (addr < KASAN_SHADOW_OFFSET)
-=09=09return;
+=09if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
+=09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
+=09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
+=09=09=09return;
+=09}
+
+=09/*
+=09 * For Software Tag-Based KASAN, kasan_mem_to_shadow() uses the
+=09 * arithmetic shift. Normally, this would make checking for a possible
+=09 * shadow address complicated, as the shadow address computation
+=09 * operation would overflow only for some memory addresses. However, du=
e
+=09 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
+=09 * kasan_mem_to_shadow() only operates on pointers with the tag reset,
+=09 * the overflow always happens.
+=09 *
+=09 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, the
+=09 * possible shadow addresses belong to a region that is the result of
+=09 * kasan_mem_to_shadow() applied to the memory range
+=09 * [0xFF000000000000, 0xFFFFFFFFFFFFFFFF]. Despite the overflow, the
+=09 * resulting possible shadow region is contiguous, as the overflow
+=09 * happens for both 0xFF000000000000 and 0xFFFFFFFFFFFFFFFF.
+=09 */
+=09if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_ARM64)) {
+=09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFULL << 56=
)) ||
+=09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
+=09=09=09return;
+=09}
=20
 =09orig_addr =3D (unsigned long)kasan_shadow_to_mem((void *)addr);
=20
diff --git a/scripts/gdb/linux/kasan.py b/scripts/gdb/linux/kasan.py
index 56730b3fde0b..4b86202b155f 100644
--- a/scripts/gdb/linux/kasan.py
+++ b/scripts/gdb/linux/kasan.py
@@ -7,7 +7,8 @@
 #
=20
 import gdb
-from linux import constants, mm
+from linux import constants, utils, mm
+from ctypes import c_int64 as s64
=20
 def help():
     t =3D """Usage: lx-kasan_mem_to_shadow [Hex memory addr]
@@ -39,6 +40,8 @@ class KasanMemToShadow(gdb.Command):
         else:
             help()
     def kasan_mem_to_shadow(self, addr):
+        if constants.CONFIG_KASAN_SW_TAGS and not utils.is_target_arch('x8=
6'):
+            addr =3D s64(addr)
         return (addr >> self.p_ops.KASAN_SHADOW_SCALE_SHIFT) + self.p_ops.=
KASAN_SHADOW_OFFSET
=20
 KasanMemToShadow()
diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
index 7571aebbe650..2e63f3dedd53 100644
--- a/scripts/gdb/linux/mm.py
+++ b/scripts/gdb/linux/mm.py
@@ -110,12 +110,13 @@ class aarch64_page_ops():
         self.KERNEL_END =3D gdb.parse_and_eval("_end")
=20
         if constants.LX_CONFIG_KASAN_GENERIC or constants.LX_CONFIG_KASAN_=
SW_TAGS:
+            self.KASAN_SHADOW_OFFSET =3D constants.LX_CONFIG_KASAN_SHADOW_=
OFFSET
             if constants.LX_CONFIG_KASAN_GENERIC:
                 self.KASAN_SHADOW_SCALE_SHIFT =3D 3
+                self.KASAN_SHADOW_END =3D (1 << (64 - self.KASAN_SHADOW_SC=
ALE_SHIFT)) + self.KASAN_SHADOW_OFFSET
             else:
                 self.KASAN_SHADOW_SCALE_SHIFT =3D 4
-            self.KASAN_SHADOW_OFFSET =3D constants.LX_CONFIG_KASAN_SHADOW_=
OFFSET
-            self.KASAN_SHADOW_END =3D (1 << (64 - self.KASAN_SHADOW_SCALE_=
SHIFT)) + self.KASAN_SHADOW_OFFSET
+                self.KASAN_SHADOW_END =3D self.KASAN_SHADOW_OFFSET
             self.PAGE_END =3D self.KASAN_SHADOW_END - (1 << (self.vabits_a=
ctual - self.KASAN_SHADOW_SCALE_SHIFT))
         else:
             self.PAGE_END =3D self._PAGE_END(self.VA_BITS_MIN)
--=20
2.52.0



