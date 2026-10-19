Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542F4CCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 01:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wabN2RpcS9yTy4X+yFbisN0o21RKH0fyf1fEhCrMYgc=; b=toHuL2Qi226ebEyUNdUkOzXOvC
	xEY7nAEqdaYyLNQD382XzV4pu7iVjbgJtLGW99a9RiEdfolkQiWdXPI15kHFm5wiWiI1PuHl9R/Ol
	g82Q94Wbayy5M4Q4yOFaD7bAD29k53fBvGnp1mD8EDUSRtMyXLP57K3bk1rCDG/7o5Ob5AdcJriKk
	SDoGUjGeADd699ewJyFyaHcPQmqEwKmiyS/Dt5TdQdQXMMauqhxkXQAw/Vg/6ckVWkTFEVehuHyQr
	17Mk+DJ89U0/IUYkWLEWo9rpFq4EEhvctYHPT44BaF6NGGU4q6R9AiAKN32YFhzj4oayGPx2IWnPP
	Iyv7Zw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIce2-00000006Pvb-0m7S;
	Mon, 19 Oct 2026 01:58:34 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIce0-00000006Pu6-0WP5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 01:58:33 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-35d7fa491deso1853114eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 18:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375111; x=1792979911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wabN2RpcS9yTy4X+yFbisN0o21RKH0fyf1fEhCrMYgc=;
        b=QxAYR2/JDqzkX7NAmVXUKcI66UKex0+W+yoYAnfU9uJUGTZqq87IqwzyH/9VD+gHkI
         cZOrgso+JM3K30mbhnhoCuu0F7KfRit5CelHhQx7lTQngcYIItCCBp2M6Kwbb3H6VY8u
         oWEuyLEWwzxkKRiQswT8ON7eI5qnIf8xaT7ECIlkWwK87Gc9qmhm84J93SaMqs5cLuXK
         r8q+aGCf5Kgbd53n5JTExGzw+rGbVGKkgs0ttGl7BVVWkCjHh1urV62LvHzD+T3JQ6pC
         47yDHirBZOUQOAxwNHdYIPd6aORj3IiYNENl9fmeRpzl2lCfMwazQHN6r+NyJYIOlF3N
         nQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375111; x=1792979911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wabN2RpcS9yTy4X+yFbisN0o21RKH0fyf1fEhCrMYgc=;
        b=N0Ul63yGKd2hmmhV8CnE8KsI9hsHAJByYVs2ntvy61LtBVOBDDRnTHAmvfaIG+4CIF
         gP0ra5B3yCjhpcrW3Iy6wpRiCSXKlWs+C7P7sOS+ClhSyjZAADDcxKFZrBvhx14Wg46e
         XVx5//9JvJ2mgY2fvvYk4266Y/h6pdK8IdRbiaBy92xdrrVEswJfY6XfntpRkWP4QzLw
         5yf/GTgbR56z4kqkeLunC3wxhdTiO94HgqXzjqyeRow5XtZ3FSAYSqp+cXxtV1whP3UY
         XnJZW8q7QxlpESvMzcd1M1YwRhoYgIinmHZRWGF4gK7OhSWTy/9075SkGlwthZ4WG2yv
         2uSQ==
X-Gm-Message-State: AFq9FYILuq7wSX0v/f6iAJtY0mszbT3pulXB2Iq4FCYeOcsYo+/40bX7
	yIdHtbvCMsuS3KuxaH1SY0kd4/SLKkZQlG3lEl65kGvRjsp9Pgorj9Ro
X-Gm-Gg: AYBFou1V8cdeYeT1uF2CQXx/9y/YTRNQcw6Z0U7SR1d2mIoZOp7US7proWHyfn3MUqi
	sePiGY/AQ1KZj/iGS4R3HPT/rK/zbSXwzKYOUS2YtrOs/xMhFPS0u5XHs6ZiUZqTjE1QIsp+TFt
	tmd/ANIB8aw0xakTcSZN4WkfBkZAXS1ibBx/lp8GbWs6EOB8DdmA4sMxjXwCd6/DXP0pLUTCyti
	FIhk7Ph7FueLRWoqsZ0AwJlnfq+Z4hS93eznn2qkiLBjrDLtlpeWMLZjKMQVMeqpu7/CAAt+8UD
	AXUcRfalrdTQgcIvFqlWDqmgThrPo14zEoZfDHhaiEqXwsjyh2UyueRXTDBdzLX4kS5szLWdHGe
	CNIuX+zyqLuqhEpIRC9hfLGyYHz6T4u1egyZFSELvBSP5MQI/OelPqqv3u3UoRZffiT6ZJNaCHZ
	97rK8LPgGrw/uWcba3yqDuYhKIivvEA3edEZQrd1KEMljNqxc5DKm6/6oT4p0f95JboipTjBdxo
	Lkg
X-Received: by 2002:a05:701b:4202:20b0:146:5f73:d45b with SMTP id a92af1059eb24-1850be495b5mr8924712c88.3.1792375110248;
        Sun, 18 Oct 2026 18:58:30 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm24177311c88.17.2026.10.18.18.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:58:29 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 19 Oct 2026 09:58:09 +0800
Subject: [PATCH 1/2] word-at-a-time: check the first byte in
 load_unaligned_zeropad()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_185832_184258_3243298B 
X-CRM114-Status: GOOD (  21.12  )
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

load_unaligned_zeropad() reads a word that may run into an unmapped
page and recovers through an exception fixup. It does the word loads of
sized_strscpy() and of the name compare in dentry_string_cmp(), path
components in hash_name() and hashlen_string(), and the trailing bytes
in x86's csum_partial().

It is inline assembly on every architecture that implements it, so
KASAN and KCSAN never see these loads, while read_word_at_a_time() at
least checks the first byte of each word. A use-after-free or
out-of-bounds read of a name handed to path lookup goes unreported, and
so does strscpy() reading from a bad source, which the kasan_strings
KUnit case expects to be reported. On x86_64 with generic KASAN:

  KASAN and string KUnit suites      failures
                                  before    after
  CONFIG_FORTIFY_SOURCE=n              1        0
  CONFIG_FORTIFY_SOURCE=y              1        0

Check the first byte at the start of load_unaligned_zeropad() on every
architecture, as read_word_at_a_time() does. All callers only load a
word whose first byte belongs to the string or buffer they read, so
the check does not flag their intended reads past the end. Add no-op
stubs for the powerpc selftest that builds the header in user space.

Suggested-by: Peter Collingbourne <peter@pcc.me.uk>
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 arch/arm/include/asm/word-at-a-time.h                           | 7 +++++++
 arch/arm64/include/asm/word-at-a-time.h                         | 7 +++++++
 arch/powerpc/include/asm/word-at-a-time.h                       | 6 ++++++
 arch/riscv/include/asm/word-at-a-time.h                         | 6 ++++++
 arch/s390/include/asm/word-at-a-time.h                          | 6 ++++++
 arch/x86/include/asm/word-at-a-time.h                           | 6 ++++++
 tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h | 3 +++
 tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h | 3 +++
 8 files changed, 44 insertions(+)

diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
index 5023f98d8293d..f672aad2e30e6 100644
--- a/arch/arm/include/asm/word-at-a-time.h
+++ b/arch/arm/include/asm/word-at-a-time.h
@@ -56,6 +56,9 @@ static inline unsigned long find_zero(unsigned long mask)
 #include <asm-generic/word-at-a-time.h>
 #endif
 
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
+
 #ifdef CONFIG_DCACHE_WORD_ACCESS
 
 /*
@@ -69,6 +72,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, tmp;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	ldr	%0, [%2]\n"
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
index 824ca6987a516..11ecca99057aa 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -40,6 +40,9 @@ static inline unsigned long zero_bytemask(unsigned long bits)
 #include <asm-generic/word-at-a-time.h>
 #endif
 
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
+
 /*
  * Load an unaligned word from kernel space.
  *
@@ -51,6 +54,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	__mte_enable_tco_async();
 
 	/* Load word from unaligned pointer addr */
diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/include/asm/word-at-a-time.h
index 54653a8634149..49c6a1f65c493 100644
--- a/arch/powerpc/include/asm/word-at-a-time.h
+++ b/arch/powerpc/include/asm/word-at-a-time.h
@@ -5,6 +5,8 @@
  * Word-at-a-time interfaces for PowerPC.
  */
 #include <linux/bitops.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
 #include <linux/wordpart.h>
 #include <asm/asm-compat.h>
 #include <asm/extable.h>
@@ -168,6 +170,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, offset, tmp;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	asm(
 	"1:	" PPC_LL "%[ret], 0(%[addr])\n"
 	"2:\n"
diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7e..fb7e2904dd7fd 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -11,6 +11,8 @@
 
 #include <asm/asm-extable.h>
 #include <linux/bitops.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -60,6 +62,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	" REG_L " %0, %2\n"
diff --git a/arch/s390/include/asm/word-at-a-time.h b/arch/s390/include/asm/word-at-a-time.h
index eaa19dee76994..59393cf065964 100644
--- a/arch/s390/include/asm/word-at-a-time.h
+++ b/arch/s390/include/asm/word-at-a-time.h
@@ -3,6 +3,8 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/bitops.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
 #include <linux/wordpart.h>
 #include <asm/asm-extable.h>
 #include <asm/bitsperlong.h>
@@ -52,6 +54,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long data;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	asm_inline volatile(
 		"0:	lg	%[data],0(%[addr])\n"
 		"1:	nopr	%%r7\n"
diff --git a/arch/x86/include/asm/word-at-a-time.h b/arch/x86/include/asm/word-at-a-time.h
index 422a47746657a..1319e1d87a9c4 100644
--- a/arch/x86/include/asm/word-at-a-time.h
+++ b/arch/x86/include/asm/word-at-a-time.h
@@ -3,6 +3,8 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/bitops.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -71,6 +73,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
+	kasan_check_read(addr, 1);
+	kcsan_check_read(addr, 1);
+
 	asm volatile(
 		"1:	mov %[mem], %[ret]\n"
 		"2:\n"
diff --git a/tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h b/tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h
new file mode 100644
index 0000000000000..000c92de6baf2
--- /dev/null
+++ b/tools/testing/selftests/powerpc/primitives/linux/kasan-checks.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* There is nothing for KASAN to check in user space. */
+#define kasan_check_read(p, size)	((void)(p), (void)(size))
diff --git a/tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h b/tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h
new file mode 100644
index 0000000000000..39c97bc15531e
--- /dev/null
+++ b/tools/testing/selftests/powerpc/primitives/linux/kcsan-checks.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* There is nothing for KCSAN to check in user space. */
+#define kcsan_check_read(p, size)	((void)(p), (void)(size))

-- 
2.43.0


