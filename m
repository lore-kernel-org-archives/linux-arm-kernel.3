Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB1CC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8ZEIDDOAvbld7L9/nQWkBl00b8uwYrx/LGF9pE90tw=; b=qlSdZoB57UBOMtEro6/aVBzaFq
	5PV2b1KO0HEJNJnFHxdGSX8FxGAxgooIPXpBBafj/WlpR3PR7rY1AtwOVDT7yCr1rsoNCBW1b2Uog
	OIDKbOi4LhtBqsCOW5CeltSDIYU+fiBORIA5nXjVpqplPJm7L7EDDzucNjGpomII7hKcgJwcSQMsa
	HBvEFfFfS+j8rxyMrBHwmpRWWoZKJZCjODiEfyOAkb/dl5zMk77ZAsVjEIemPzFLGSRmiYVrItJV4
	OfgM5kcxfL9N18RmkoiIPZbO5CLHVsYyl0PoyIBYdv3b3PDQnV1RuHJjV45cp49586m+uCwn5aFn5
	41kGWJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKXi-000000086lO-2i2G;
	Tue, 18 Aug 2026 14:11:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKXb-000000086fp-28Jc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:11:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C40119F6;
	Tue, 18 Aug 2026 07:11:43 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 578593F85F;
	Tue, 18 Aug 2026 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062307; bh=6wbz7M9AxUaVbPIWUUWjzRRnSMPq0HS+t9xWqqATY50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eegD3Q5zeLXme4NvXnUJNYwKafnS1JAt4VVHBEbHdSs/9LuqzzWjqNenBJoOpv+oW
	 UeD15hUuXB2GUF+Nw3cbWEYXVCC9G8Y9+PFLZekCFB3REt156/mNAaAHvbVLijXgkX
	 a4CLhHodZe6F1Gjhm9EgzjUU1gV7P6m3VeSq9A3s=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 18 Aug 2026 15:08:47 +0100
Subject: [PATCH RFC v9 05/25] arm64: Implement asm/kpkeys.h using POE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-kpkeys-v9-5-743ad31b2c8f@arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
In-Reply-To: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787062276; l=3520;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=6wbz7M9AxUaVbPIWUUWjzRRnSMPq0HS+t9xWqqATY50=;
 b=qSs2aR0MM51fpLHnCL+cqiL5CeqWF8AjtCb69VRsQre+Xry4+dqxT+AElsKlSRpe1daufmoo0
 DHdsQ6uk7EFBwHC3vYbMZnfyPIBOBhD6kw+KHDnL00yy/Gvme1fBgMK
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071147_637567_4D9D5B0C 
X-CRM114-Status: GOOD (  18.47  )
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

Implement the kpkeys interface if CONFIG_ARM64_POE is enabled.
The permissions for pkey 0 are set to RWX as this pkey is also used
for code mappings. POR_EL1 is left untouched if we have already
entered the requested context.

To allow <asm/kpkeys.h> to be included from assembly, also add
appropriate #ifdef's to <asm/por.h>.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/kpkeys.h       | 67 +++++++++++++++++++++++++++++++++++
 arch/arm64/include/asm/kpkeys_types.h | 15 ++++++++
 arch/arm64/include/asm/por.h          |  4 +++
 3 files changed, 86 insertions(+)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
new file mode 100644
index 000000000000..09fd5a849cb0
--- /dev/null
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_KPKEYS_H
+#define __ASM_KPKEYS_H
+
+#include <linux/kpkeys_types.h>
+
+#include <asm/barrier.h>
+#include <asm/cpufeature.h>
+#include <asm/por.h>
+
+/*
+ * Equivalent to por_set_kpkeys_context(0, KPKEYS_CTX_DEFAULT), but can also be
+ * used in assembly.
+ */
+#define POR_EL1_INIT	POR_ELx_PERM_PREP(0, POE_RWX)
+
+#ifndef __ASSEMBLY__
+
+static inline bool arch_supports_kpkeys(void)
+{
+	return system_supports_poe();
+}
+
+#ifdef CONFIG_ARM64_POE
+
+static inline u64 por_set_kpkeys_context(u64 por, enum kpkeys_ctx ctx)
+{
+	por = por_elx_set_pkey_perms(por, 0, POE_RWX);
+
+	return por;
+}
+
+static __always_inline void __kpkeys_set_pkey_reg_nosync(u64 pkey_reg)
+{
+	write_sysreg_s(pkey_reg, SYS_POR_EL1);
+}
+
+static __always_inline
+struct kpkeys_state arch_kpkeys_enter_context(enum kpkeys_ctx ctx)
+{
+	const u64 prev_por = read_sysreg_s(SYS_POR_EL1);
+	const u64 new_por = por_set_kpkeys_context(prev_por, ctx);
+
+	if (prev_por == new_por)
+		return (struct kpkeys_state) { .entered_context = false };
+
+	__kpkeys_set_pkey_reg_nosync(new_por);
+	isb();
+
+	return (struct kpkeys_state) {
+		.entered_context = true,
+		.arch_state.por = prev_por,
+	};
+}
+
+static __always_inline
+void arch_kpkeys_leave_context(const struct kpkeys_state *state)
+{
+	__kpkeys_set_pkey_reg_nosync(state->arch_state.por);
+	isb();
+}
+
+#endif /* CONFIG_ARM64_POE */
+
+#endif	/* __ASSEMBLY__ */
+
+#endif	/* __ASM_KPKEYS_H */
diff --git a/arch/arm64/include/asm/kpkeys_types.h b/arch/arm64/include/asm/kpkeys_types.h
new file mode 100644
index 000000000000..e9c59a26ee7a
--- /dev/null
+++ b/arch/arm64/include/asm/kpkeys_types.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_KPKEYS_TYPES_H
+#define __ASM_KPKEYS_TYPES_H
+
+#include <linux/types.h>
+
+#ifndef __ASSEMBLY__
+
+struct arch_kpkeys_state {
+	u64 por;
+};
+
+#endif	/* __ASSEMBLY__ */
+
+#endif	/* __ASM_KPKEYS_TYPES_H */
diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
index 19b3dd1d43a0..dddabf6ffae6 100644
--- a/arch/arm64/include/asm/por.h
+++ b/arch/arm64/include/asm/por.h
@@ -10,6 +10,8 @@
 
 #define POR_EL0_INIT	POR_ELx_PERM_PREP(0, POE_RWX)
 
+#ifndef __ASSEMBLY__
+
 static inline bool por_elx_allows_read(u64 por, u8 pkey)
 {
 	u8 perm = POR_ELx_PERM_GET(pkey, por);
@@ -38,4 +40,6 @@ static inline u64 por_elx_set_pkey_perms(u64 por, u8 pkey, u8 perms)
 	return (por & ~(POE_MASK << shift)) | ((u64)perms << shift);
 }
 
+#endif	/* __ASSEMBLY__ */
+
 #endif /* _ASM_ARM64_POR_H */

-- 
2.51.2


