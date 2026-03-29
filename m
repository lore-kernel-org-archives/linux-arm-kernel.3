Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D87CF3D5F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mR7zW5huiWH1x5CVyoEzlAdCsPYlEqDzaC0AadT8DWY=; b=aK2VV2dgxXD8KR0kjJtNGr7JN1
	y2XGsbAtZj32jsm4smCw06UbpAhNoMidCCjuCK2iqLxmQR8ReaOLSD41PrjG56wlZBk7KDcsHIxep
	Fkp8a1FQJNIITWwLeoUiMrIpkg6fPAp7/EoUe+8GyhPecYconx0/CgRHt2czl+0Ym4eCo8h3dVKlK
	5/INpcdOIPHCSaDccJEBh/wS+hZ/1k1wVamDEiECw/DDcOhbz3YgKOO9Us9kXNYURzu5++cXtV9Ik
	hdFMTCR8pu5QhYpFsqEWiINt2EzBsGKGSvROfPhX9byMTrRrymFVE0+KgzoMHnFHyi++LUE2nciyq
	CDD4dLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6koF-00000009iIg-3D0E;
	Sun, 29 Mar 2026 07:43:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6koC-00000009iIH-2TeN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 07:43:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so45747395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 00:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774770222; x=1775375022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR7zW5huiWH1x5CVyoEzlAdCsPYlEqDzaC0AadT8DWY=;
        b=aA/2y3Komurqa2T7jHKbO8uj2xj1Fw34L2pQQVQvE2hc6Vnpd1TxVza06yquSXZAKq
         tEKp7qM+ieDv2iq/iudzC2IUtzDsXSGJkq4pZlMuCO88iv27xyGUmoGYqExdaAigt12X
         Zf7qWw1nBsvfpTFpG0lnS99dyb5WUzcoc4GpxjRc2McRc3T0wZL0R31d5QdTTz8Lt7Wt
         tpH/wo3k+4B76chKfSffOQQjuNYBXwiNW1VL2BXmhhBbuBRV5LBjDOQXqNzzYOR0Sm5e
         vWX7q/JCa5LVf/n3tN/ufStzDqiXV0FvUFy5csusG5/Bu+YuZxjdxaiVow/xMgYje4NI
         iPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774770222; x=1775375022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mR7zW5huiWH1x5CVyoEzlAdCsPYlEqDzaC0AadT8DWY=;
        b=byV/BQgDnemoY4+OOEeanv6mhRjKVwmEwczi6JDqC5OHijVCe/o3fXnixAAhuMadxP
         xXY9jjFD7/evm703hcwsNV08iiaDHyRltD8nztbBeOjIxyoel5favhzg6awMcbIEL9BB
         3FlaZZvSFG0vF2wv096EsUywepjqHQ5jxmbq6Kwnn1gCoYSxu+VUVIrLO2dI8gqGLep8
         UNyrgMdHvaT1o9CrI1QzVmD61OyOsZgv/kwz+wMqyDjDoDairU8/cfUcLs+FpcubiqUY
         MbV1xvfm+owjl9dUSw5Lgocx5r5SS/KzqIRzB1racXl4BK0aI3KfS97x3TZk94EVXTy4
         9Wwg==
X-Forwarded-Encrypted: i=1; AJvYcCVLgo+cTZIlUTYbipkTprfOBUWPkOWmV8eFmRaR+oVW+7ESbmecoNuFsu8fz95jtCGfeVXFMMylqjnsLfWxqR2L@lists.infradead.org
X-Gm-Message-State: AOJu0YzTKdh9YSdkObDz7HtcZbgXR0TXL8WPorhT7Web6LM4Ucma6E7l
	eLDCHqgvq7qe0wuwnTlUSu81bnDSDjh7EbWwGlVTh4JWA7wFIUj8w//C
X-Gm-Gg: ATEYQzwKKg3ujvXNRvHrcJ+TsJhMjZs49mzfoKfMctmkfRE7dDYdkSePKHoN8vVb7vR
	X+Mo6H8tjHBda+W24n6pCd3o7iq1COYnYHaC5gFGnRviYvObe5HlAYlRtM5Etp1OAhpYlwxsaqs
	kid8IbSAuuFiAShM9mA48/GfUENqmug+jLdNB2UiWtGem36HXL+N3/IASKatxtn/d+zHWP4kbKj
	Br1IDIeYHnMq4yE3tIZnAv4Tw4gQYA3GpWX95NQ6rKGToRrmLAkxF2+M7wVYQPHT/zZ9juxAPl6
	MPn94hR5e+ofKx2C5sf2fcCx6+fIB+6BHNbRA2bC7/KJkXHJ6WYMye1FzPD5/MZR7wYSv4TuM1e
	KS1FFdt5TTfytYfKdwGtZhUTRHbLqFwl/RSKIVIPYUxz5yKIbE5WCnFadGhDGWm9VUuWA2upQ85
	oimnVAKef1N/5wEiAumAvtCR16ffUnsmRu
X-Received: by 2002:a05:600c:8b31:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-48727efabdemr165719785e9.31.1774770221785;
        Sun, 29 Mar 2026 00:43:41 -0700 (PDT)
Received: from lima-dev.. ([45.89.90.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d38a5fsm193112255e9.12.2026.03.29.00.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:43:41 -0700 (PDT)
From: Demian Shulhan <demyansh@gmail.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ebiggers@kernel.org,
	ardb@kernel.org,
	Demian Shulhan <demyansh@gmail.com>
Subject: [PATCH v3] lib/crc: arm64: add NEON accelerated CRC64-NVMe implementation
Date: Sun, 29 Mar 2026 07:43:38 +0000
Message-ID: <20260329074338.1053550-1-demyansh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317065425.2684093-1-demyansh@gmail.com>
References: <20260317065425.2684093-1-demyansh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_004344_670973_16E4A317 
X-CRM114-Status: GOOD (  19.70  )
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

Implement an optimized CRC64 (NVMe) algorithm for ARM64 using NEON
Polynomial Multiply Long (PMULL) instructions. The generic shift-and-XOR
software implementation is slow, which creates a bottleneck in NVMe and
other storage subsystems.

The acceleration is implemented using C intrinsics (<arm_neon.h>) rather
than raw assembly for better readability and maintainability.

Key highlights of this implementation:
- Uses 4KB chunking inside scoped_ksimd() to avoid preemption latency
  spikes on large buffers.
- Pre-calculates and loads fold constants via vld1q_u64() to minimize
  register spilling.
- Benchmarks show the break-even point against the generic implementation
  is around 128 bytes. The PMULL path is enabled only for len >= 128.

Performance results (kunit crc_benchmark on Cortex-A72):
- Generic (len=4096): ~268 MB/s
- PMULL (len=4096): ~1556 MB/s (nearly 6x improvement)

Signed-off-by: Demian Shulhan <demyansh@gmail.com>
---
v2: - Removed KERNEL_MODE_NEON check from Kconfig as it's redundant on arm64.
  - Added missing prototype for crc64_nvme_arm64_c to fix sparse/W=1 warning.
  - Improved readability in Makefile with extra newlines and comments.
  - Removed redundant include guards in crc64.h.
  - Switched to do-while loops for better optimization in hot paths.
  - Added comments explaining the magic constants (fold/Barrett).
---
v3: - Removed big-endian fallback from the commit message.
  - Rewrote the comment explaining the final Barrett reduction step.
  - Adjusted the formatting of the scoped_ksimd() call.
---
 lib/crc/Kconfig                  |  1 +
 lib/crc/Makefile                 |  8 +++-
 lib/crc/arm64/crc64-neon-inner.c | 78 ++++++++++++++++++++++++++++++++
 lib/crc/arm64/crc64.h            | 30 ++++++++++++
 4 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 lib/crc/arm64/crc64-neon-inner.c
 create mode 100644 lib/crc/arm64/crc64.h

diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 70e7a6016de3..16cb42d5e306 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -82,6 +82,7 @@ config CRC64
 config CRC64_ARCH
 	bool
 	depends on CRC64 && CRC_OPTIMIZATIONS
+	default y if ARM64
 	default y if RISCV && RISCV_ISA_ZBC && 64BIT
 	default y if X86_64
 
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index 7543ad295ab6..c9c35419b39c 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -38,9 +38,15 @@ obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
 CFLAGS_crc64-main.o += -I$(src)/$(SRCARCH)
+
+CFLAGS_REMOVE_arm64/crc64-neon-inner.o += -mgeneral-regs-only
+CFLAGS_arm64/crc64-neon-inner.o += -ffreestanding -march=armv8-a+crypto
+CFLAGS_arm64/crc64-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)
+crc64-$(CONFIG_ARM64) += arm64/crc64-neon-inner.o
+
 crc64-$(CONFIG_RISCV) += riscv/crc64_lsb.o riscv/crc64_msb.o
 crc64-$(CONFIG_X86) += x86/crc64-pclmul.o
-endif
+endif # CONFIG_CRC64_ARCH
 
 obj-y += tests/
 
diff --git a/lib/crc/arm64/crc64-neon-inner.c b/lib/crc/arm64/crc64-neon-inner.c
new file mode 100644
index 000000000000..881cdafadb37
--- /dev/null
+++ b/lib/crc/arm64/crc64-neon-inner.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Accelerated CRC64 (NVMe) using ARM NEON C intrinsics
+ */
+
+#include <linux/types.h>
+#include <asm/neon-intrinsics.h>
+
+u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len);
+
+#define GET_P64_0(v) ((poly64_t)vgetq_lane_u64(vreinterpretq_u64_p64(v), 0))
+#define GET_P64_1(v) ((poly64_t)vgetq_lane_u64(vreinterpretq_u64_p64(v), 1))
+
+/* x^191 mod G, x^127 mod G */
+static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
+					0x21e9761e252621acULL };
+/* floor(x^127 / G), (G - x^64) / x */
+static const u64 bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
+				    0x34d926535897936aULL };
+
+u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len)
+{
+	uint64x2_t v0_u64 = { crc, 0 };
+	poly64x2_t v0 = vreinterpretq_p64_u64(v0_u64);
+	poly64x2_t fold_consts =
+		vreinterpretq_p64_u64(vld1q_u64(fold_consts_val));
+	poly64x2_t v1 = vreinterpretq_p64_u8(vld1q_u8(p));
+
+	v0 = vreinterpretq_p64_u8(veorq_u8(vreinterpretq_u8_p64(v0),
+					   vreinterpretq_u8_p64(v1)));
+	p += 16;
+	len -= 16;
+
+	do {
+		v1 = vreinterpretq_p64_u8(vld1q_u8(p));
+
+		poly128_t v2 = vmull_high_p64(fold_consts, v0);
+		poly128_t v0_128 =
+			vmull_p64(GET_P64_0(fold_consts), GET_P64_0(v0));
+
+		uint8x16_t x0 = veorq_u8(vreinterpretq_u8_p128(v0_128),
+					 vreinterpretq_u8_p128(v2));
+
+		x0 = veorq_u8(x0, vreinterpretq_u8_p64(v1));
+		v0 = vreinterpretq_p64_u8(x0);
+
+		p += 16;
+		len -= 16;
+	} while (len >= 16);
+
+	/* Multiply the 128-bit value by x^64 and reduce it back to 128 bits. */
+	poly64x2_t v7 = vreinterpretq_p64_u64((uint64x2_t){ 0, 0 });
+	poly128_t v1_128 = vmull_p64(GET_P64_1(fold_consts), GET_P64_0(v0));
+
+	uint8x16_t ext_v0 =
+		vextq_u8(vreinterpretq_u8_p64(v0), vreinterpretq_u8_p64(v7), 8);
+	uint8x16_t x0 = veorq_u8(ext_v0, vreinterpretq_u8_p128(v1_128));
+
+	v0 = vreinterpretq_p64_u8(x0);
+
+	/* Final Barrett reduction */
+	poly64x2_t bconsts = vreinterpretq_p64_u64(vld1q_u64(bconsts_val));
+
+	v1_128 = vmull_p64(GET_P64_0(bconsts), GET_P64_0(v0));
+
+	poly64x2_t v1_64 = vreinterpretq_p64_u8(vreinterpretq_u8_p128(v1_128));
+	poly128_t v3_128 = vmull_p64(GET_P64_1(bconsts), GET_P64_0(v1_64));
+
+	x0 = veorq_u8(vreinterpretq_u8_p64(v0), vreinterpretq_u8_p128(v3_128));
+
+	uint8x16_t ext_v2 = vextq_u8(vreinterpretq_u8_p64(v7),
+				     vreinterpretq_u8_p128(v1_128), 8);
+
+	x0 = veorq_u8(x0, ext_v2);
+
+	v0 = vreinterpretq_p64_u8(x0);
+	return vgetq_lane_u64(vreinterpretq_u64_p64(v0), 1);
+}
diff --git a/lib/crc/arm64/crc64.h b/lib/crc/arm64/crc64.h
new file mode 100644
index 000000000000..cc65abeee24c
--- /dev/null
+++ b/lib/crc/arm64/crc64.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * CRC64 using ARM64 PMULL instructions
+ */
+
+#include <linux/cpufeature.h>
+#include <asm/simd.h>
+#include <linux/minmax.h>
+#include <linux/sizes.h>
+
+u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len);
+
+#define crc64_be_arch crc64_be_generic
+
+static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
+{
+	if (len >= 128 && cpu_have_named_feature(PMULL) &&
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
-- 
2.43.0


