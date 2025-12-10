Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B1DD3C933
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKUcoWRGEpioVsYqfJYYUwDSXTCCDSTxDl6r47kG8IA=; b=EHTze9lLtDmJNh49+6esL/KTAx
	MJ5vtu+jGaX99r+Xm1ldY/wzJz0aknhpgZ7LX5leva/zR/CF+gl6WhXsbbX/4UzbzYSQ9Jo5rlosi
	PHIRoDVx6tcVTediVGFepzvvDr6ihzBwn+7BhzAzHpGDGpiyvjpQMs7KPFmLLbDZzGWSuIZqOR8dL
	5kCwVM9ezTstSzSvg0nWHSFKV+D++iLPO8ifK0P0kg86RvbnQVzI96e82N+E0GxYypko/9xvlPZTI
	z+sWZ7c/+5uXiobgXWh6ANjsDiRtl5cwmLqptGwFpkvFfUz0cNEO+nc8K9v37Ojd3B67DT29K+pjU
	YH8S6inw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTNzj-0000000FgyZ-0xq8;
	Wed, 10 Dec 2025 17:28:55 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTNzh-0000000Fgy1-0kSm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 17:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1765387730; x=1765646930;
	bh=uKUcoWRGEpioVsYqfJYYUwDSXTCCDSTxDl6r47kG8IA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XQg25V1LFYpvoYroj2dRRJCBZNsgxg7t/VnqW9cMbGn3CIxQENLETA/NkSkPKowp+
	 Xf0w0hIwjaW3WHYwCshE6mXEQiKDQPFMGlZuKa3PZV4VP/VYD1sN4y+CuEYhvGej9f
	 xydCpgdmxD0Aiqn8d7wOnX8WdVVA7jPIRxamZvSmn7Y9TtnWbVRvngZkZj2b4AtNkf
	 sKwHQggNmSA8qYPQaS8H4cOm3AtmH0DizAI7EYE2yQYrynpiE2HU6rK+lz8OZGPQBn
	 YOidNzDQ252kNJLRQHsxuLiv7DacGfaS3d3tz3CyROZ4Xe5H3tRmHSd5tA4sg1ELcx
	 /qcLFnPwCEGXA==
Date: Wed, 10 Dec 2025 17:28:43 +0000
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: [PATCH v7 02/15] kasan: arm64: x86: Make special tags arch specific
Message-ID: <0db7ec3b1a813b4d9e3aa8648b3c212166a248b7.1765386422.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1765386422.git.m.wieczorretman@pm.me>
References: <cover.1765386422.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: dcbf8ea52fee4f67b789474d9088b2f73bd5f9cb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_092853_375880_E4E53DA9 
X-CRM114-Status: GOOD (  23.83  )
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

KASAN's tag-based mode defines multiple special tag values. They're
reserved for:
- Native kernel value. On arm64 it's 0xFF and it causes an early return
  in the tag checking function.
- Invalid value. 0xFE marks an area as freed / unallocated. It's also
  the value that is used to initialize regions of shadow memory.
- Min and max values. 0xFD is the highest value that can be randomly
  generated for a new tag. 0 is the minimal value with the exception of
  arm64's hardware mode where it is equal to 0xF0.

Metadata macro is also defined:
- Tag width equal to 8.

Tag-based mode on x86 is going to use 4 bit wide tags so all the above
values need to be changed accordingly.

Make tag width and native kernel tag arch specific for x86 and arm64.

Base the invalid tag value and the max value on the native kernel tag
since they follow the same pattern on both mentioned architectures.

Also generalize KASAN_SHADOW_INIT and 0xff used in various
page_kasan_tag* helpers.

Give KASAN_TAG_MIN the default value of zero, and move the special value
for hw_tags arm64 to its arch specific kasan-tags.h.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Co-developed-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v7:
- Reorder defines of arm64 tag width to prevent redefinition warnings.
- Remove KASAN_TAG_MASK so it's only defined in mmzone.h (Andrey
  Konovalov)
- Merge the 'support tag widths less than 8 bits' with this patch since
  they do similar things and overwrite each other. (Alexander)

Changelog v6:
- Add hardware tags KASAN_TAG_WIDTH value to the arm64 arch file.
- Keep KASAN_TAG_MASK in the mmzone.h.
- Remove ifndef from KASAN_SHADOW_INIT.

Changelog v5:
- Move KASAN_TAG_MIN to the arm64 kasan-tags.h for the hardware KASAN
  mode case.

Changelog v4:
- Move KASAN_TAG_MASK to kasan-tags.h.

Changelog v2:
- Remove risc-v from the patch.

 MAINTAINERS                         |  2 +-
 arch/arm64/include/asm/kasan-tags.h | 14 ++++++++++++++
 arch/arm64/include/asm/kasan.h      |  2 --
 arch/arm64/include/asm/uaccess.h    |  1 +
 arch/x86/include/asm/kasan-tags.h   |  9 +++++++++
 include/linux/kasan-tags.h          | 19 ++++++++++++++-----
 include/linux/kasan.h               |  3 +--
 include/linux/mm.h                  |  6 +++---
 include/linux/page-flags-layout.h   |  9 +--------
 9 files changed, 44 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm64/include/asm/kasan-tags.h
 create mode 100644 arch/x86/include/asm/kasan-tags.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bf6385efe04..a591598cc4b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13420,7 +13420,7 @@ L:=09kasan-dev@googlegroups.com
 S:=09Maintained
 B:=09https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&produc=
t=3DMemory%20Management
 F:=09Documentation/dev-tools/kasan.rst
-F:=09arch/*/include/asm/*kasan.h
+F:=09arch/*/include/asm/*kasan*.h
 F:=09arch/*/mm/kasan_init*
 F:=09include/linux/kasan*.h
 F:=09lib/Kconfig.kasan
diff --git a/arch/arm64/include/asm/kasan-tags.h b/arch/arm64/include/asm/k=
asan-tags.h
new file mode 100644
index 000000000000..259952677443
--- /dev/null
+++ b/arch/arm64/include/asm/kasan-tags.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_KASAN_TAGS_H
+#define __ASM_KASAN_TAGS_H
+
+#define KASAN_TAG_KERNEL=090xFF /* native kernel pointers tag */
+
+#ifdef CONFIG_KASAN_HW_TAGS
+#define KASAN_TAG_MIN=09=090xF0 /* minimum value for random tags */
+#define KASAN_TAG_WIDTH=09=094
+#else
+#define KASAN_TAG_WIDTH=09=098
+#endif
+
+#endif /* ASM_KASAN_TAGS_H */
diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.=
h
index e1b57c13f8a4..d2841e0fb908 100644
--- a/arch/arm64/include/asm/kasan.h
+++ b/arch/arm64/include/asm/kasan.h
@@ -6,8 +6,6 @@
=20
 #include <linux/linkage.h>
 #include <asm/memory.h>
-#include <asm/mte-kasan.h>
-#include <asm/pgtable-types.h>
=20
 #define arch_kasan_set_tag(addr, tag)=09__tag_set(addr, tag)
 #define arch_kasan_reset_tag(addr)=09__tag_reset(addr)
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index 6490930deef8..ccd41a39e3a1 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -22,6 +22,7 @@
 #include <asm/cpufeature.h>
 #include <asm/mmu.h>
 #include <asm/mte.h>
+#include <asm/mte-kasan.h>
 #include <asm/ptrace.h>
 #include <asm/memory.h>
 #include <asm/extable.h>
diff --git a/arch/x86/include/asm/kasan-tags.h b/arch/x86/include/asm/kasan=
-tags.h
new file mode 100644
index 000000000000..68ba385bc75c
--- /dev/null
+++ b/arch/x86/include/asm/kasan-tags.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_KASAN_TAGS_H
+#define __ASM_KASAN_TAGS_H
+
+#define KASAN_TAG_KERNEL=090xF /* native kernel pointers tag */
+
+#define KASAN_TAG_WIDTH=09=094
+
+#endif /* ASM_KASAN_TAGS_H */
diff --git a/include/linux/kasan-tags.h b/include/linux/kasan-tags.h
index 4f85f562512c..ad5c11950233 100644
--- a/include/linux/kasan-tags.h
+++ b/include/linux/kasan-tags.h
@@ -2,13 +2,22 @@
 #ifndef _LINUX_KASAN_TAGS_H
 #define _LINUX_KASAN_TAGS_H
=20
+#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
+#include <asm/kasan-tags.h>
+#endif
+
+#ifndef KASAN_TAG_WIDTH
+#define KASAN_TAG_WIDTH=09=090
+#endif
+
+#ifndef KASAN_TAG_KERNEL
 #define KASAN_TAG_KERNEL=090xFF /* native kernel pointers tag */
-#define KASAN_TAG_INVALID=090xFE /* inaccessible memory tag */
-#define KASAN_TAG_MAX=09=090xFD /* maximum value for random tags */
+#endif
+
+#define KASAN_TAG_INVALID=09(KASAN_TAG_KERNEL - 1) /* inaccessible memory =
tag */
+#define KASAN_TAG_MAX=09=09(KASAN_TAG_KERNEL - 2) /* maximum value for ran=
dom tags */
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-#define KASAN_TAG_MIN=09=090xF0 /* minimum value for random tags */
-#else
+#ifndef KASAN_TAG_MIN
 #define KASAN_TAG_MIN=09=090x00 /* minimum value for random tags */
 #endif
=20
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 670de5427c32..5cb21b90a2ec 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -39,8 +39,7 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
 /* Software KASAN implementations use shadow memory. */
=20
 #ifdef CONFIG_KASAN_SW_TAGS
-/* This matches KASAN_TAG_INVALID. */
-#define KASAN_SHADOW_INIT 0xFE
+#define KASAN_SHADOW_INIT KASAN_TAG_INVALID
 #else
 #define KASAN_SHADOW_INIT 0
 #endif
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8e9268cf929e..b61090a80e3f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1762,7 +1762,7 @@ static inline u8 page_kasan_tag(const struct page *pa=
ge)
=20
 =09if (kasan_enabled()) {
 =09=09tag =3D (page->flags.f >> KASAN_TAG_PGSHIFT) & KASAN_TAG_MASK;
-=09=09tag ^=3D 0xff;
+=09=09tag ^=3D KASAN_TAG_KERNEL;
 =09}
=20
 =09return tag;
@@ -1775,7 +1775,7 @@ static inline void page_kasan_tag_set(struct page *pa=
ge, u8 tag)
 =09if (!kasan_enabled())
 =09=09return;
=20
-=09tag ^=3D 0xff;
+=09tag ^=3D KASAN_TAG_KERNEL;
 =09old_flags =3D READ_ONCE(page->flags.f);
 =09do {
 =09=09flags =3D old_flags;
@@ -1794,7 +1794,7 @@ static inline void page_kasan_tag_reset(struct page *=
page)
=20
 static inline u8 page_kasan_tag(const struct page *page)
 {
-=09return 0xff;
+=09return KASAN_TAG_KERNEL;
 }
=20
 static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-l=
ayout.h
index 760006b1c480..b2cc4cb870e0 100644
--- a/include/linux/page-flags-layout.h
+++ b/include/linux/page-flags-layout.h
@@ -3,6 +3,7 @@
 #define PAGE_FLAGS_LAYOUT_H
=20
 #include <linux/numa.h>
+#include <linux/kasan-tags.h>
 #include <generated/bounds.h>
=20
 /*
@@ -72,14 +73,6 @@
 #define NODE_NOT_IN_PAGE_FLAGS=091
 #endif
=20
-#if defined(CONFIG_KASAN_SW_TAGS)
-#define KASAN_TAG_WIDTH 8
-#elif defined(CONFIG_KASAN_HW_TAGS)
-#define KASAN_TAG_WIDTH 4
-#else
-#define KASAN_TAG_WIDTH 0
-#endif
-
 #ifdef CONFIG_NUMA_BALANCING
 #define LAST__PID_SHIFT 8
 #define LAST__PID_MASK  ((1 << LAST__PID_SHIFT)-1)
--=20
2.52.0



