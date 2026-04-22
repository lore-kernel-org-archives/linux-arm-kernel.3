Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E77FA1FD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcZCRUAU5LVHv9nGMNvJqrx7vxNVE1JvhlKQAgVhEas=; b=qbusECvju8ZZaKL6YScimFcF2q
	SgD2mJCAD76+yh14ovD76kF0Whi2xYl49lkxbAoDKO2TXHLfzC2ginmHqq5N1U343vyeZN64VPd0Y
	efeHbya4V2NEcBdKtqCkyNpmSzo61hIYUukYzVDXSWgNVqWlWgllfK5O4HgMruPXbnCnMvnEapVAy
	icruebB3bCwPWi6h0tYMfS15pi6dEcJ968KOsDf1BPU2L1muQKdNlKVMNJEbuMUHWBOxTF2OsNCMv
	pYvnoeb4i1i9cgbceyJjYxDyvaqzokI98KqzwXepccY6AEM4PDaE96uNL+BGOVEhGUocR5W/X0sy5
	bpcCuu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCb-0000000AYZt-27SB;
	Wed, 22 Apr 2026 17:17:29 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCV-0000000AYUC-2War
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:17:25 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b934e96af9dso554313966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776878241; x=1777483041; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wcZCRUAU5LVHv9nGMNvJqrx7vxNVE1JvhlKQAgVhEas=;
        b=O4UXI0VHhcHen989EORyLZk/2Qm07iYCqLKGULeMCvhBqnlZlV0uFSgjTVTXxvG7tM
         7CQnwVolHFhT9IVBzPoKDavBNfTvNzdjS5pxuvsPirLcW3Io+kjZzIFXWkWJdSQqFNll
         14R0KuxhCcDleK6F6Sy7+mG/nTqr4Z0WSgGncHuJ75dALHEI/1VQwXYvuXNAggzGnQke
         tJ/LUGy6DVYh9wkNtsksOFhmXcbnPAS+uz0Bp92yH7o312KDGLXpZzPvqZNsqNu74W5q
         0BZUqprgh4klHjvaXy5RYVOfwqf+h5J5KaqblNMfBizHKadFL//PdC/iMvl0NWT3XKvW
         VUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878241; x=1777483041;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcZCRUAU5LVHv9nGMNvJqrx7vxNVE1JvhlKQAgVhEas=;
        b=jTRxCIP30H2W8tXZMmXZTO4UnsibJcHWOuuFcozNKO1oxO0+4A9PumZo9SWyRH/D2x
         zaffwZ9u8bR6c3ohpLdEEpY/LwIbaFJ87jAid7GbZovFpzE8kjJT4QejsV5V0p/UOy2c
         sIILKWKvHO5luox/JAC8C/Q0Agvz5xfTCH0OeimpIDOpAeidVXKf6xoWzCZ6nTlxfb5q
         S9NxcuR3MFK7Lnx4mzrdwNG8KPUIYIPJ8Pl4ajGk1rZTDuZO1mmIGjYXRX3KtFa1psRR
         LIh1hHizbDIT5WCsQVTcDVVH4cUcWujrzzJg0mJvyeSKPNNtx4LujIYxdVIYTLTmmWNp
         fFHQ==
X-Gm-Message-State: AOJu0Yy3ZL/0dg4UButpxJ8C7m0VNv1LtjPtrH4mwdsi3Hwn/ZwP0yMo
	yRrG7vQsT6G8pWuiYPjGTFjMzgH2kPeLOnGaF1y0kx867Ps0ckaxXPOdMxfYzUBF6nESxmE4CE3
	+2JG281lZoUyZunernf0vbTPvYoR2xpgkVJ9gsEsRsEFeZXRX860IX4DGf4653qK7IOtSNV9Yjr
	6hAvjSByBE/AYv01xyl54qu/MZIZJjNNwCqAasw4nXSbyl
X-Received: from ejdcm14.prod.google.com ([2002:a17:906:f58e:b0:b9c:fe2c:3a3f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3d8e:b0:ba7:4cd9:ca12
 with SMTP id a640c23a62f3a-ba74cd9eeebmr444625566b.13.1776878240359; Wed, 22
 Apr 2026 10:17:20 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:17:00 +0200
In-Reply-To: <20260422171655.3437334-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20260422171655.3437334-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4418; i=ardb@kernel.org;
 h=from:subject; bh=ErLhjrwZtabJiZbBHdT2Zv/irzL+HhFBwdex5+husi0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfMlU9+kxjsequwlC/7+F1XOXzRv6cWlHOedvFubg7l7T
 391L4nuKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABN55sfIcFfPvUPS/ptzn9RD
 53NxYmw7m7/VXzx+kLX1Rtuy1dPfiDMydBqeWrSioMXYRO1/yI8Oy9YqhsuSAUGxjXtFKj/HKrM wAgA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260422171655.3437334-14-ardb+git@google.com>
Subject: [PATCH 4/8] lib/crc: Turn NEON intrinsics crc64 implementation into
 common code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101723_717378_F394356F 
X-CRM114-Status: GOOD (  14.64  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Move and rename the CRC64 NEON intrinsics implementation source file and
rename the function name to reflect that it is NEON code that can be
shared. This will be wired up for 32-bit ARM in a subsequent patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/crc/Makefile                                   |  6 ++---
 lib/crc/arm64/crc64-neon.h                         | 21 ++++++++++++++++
 lib/crc/arm64/crc64.h                              |  4 +--
 lib/crc/{arm64/crc64-neon-inner.c => crc64-neon.c} | 26 +++-----------------
 4 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index ff213590e4e3..193257ae466f 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -39,9 +39,9 @@ crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
 CFLAGS_crc64-main.o += -I$(src)/$(SRCARCH)
 
-CFLAGS_REMOVE_arm64/crc64-neon-inner.o += $(CC_FLAGS_NO_FPU)
-CFLAGS_arm64/crc64-neon-inner.o += $(CC_FLAGS_FPU) -march=armv8-a+crypto
-crc64-$(CONFIG_ARM64) += arm64/crc64-neon-inner.o
+CFLAGS_REMOVE_crc64-neon.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_crc64-neon.o += $(CC_FLAGS_FPU) -I$(src)/$(SRCARCH) -march=armv8-a+crypto
+crc64-$(CONFIG_ARM64) += crc64-neon.o
 
 crc64-$(CONFIG_RISCV) += riscv/crc64_lsb.o riscv/crc64_msb.o
 crc64-$(CONFIG_X86) += x86/crc64-pclmul.o
diff --git a/lib/crc/arm64/crc64-neon.h b/lib/crc/arm64/crc64-neon.h
new file mode 100644
index 000000000000..fcd5b1e6f812
--- /dev/null
+++ b/lib/crc/arm64/crc64-neon.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
+{
+	return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 0),
+						vgetq_lane_u64(b, 0)));
+}
+
+static inline uint64x2_t pmull64_high(uint64x2_t a, uint64x2_t b)
+{
+	poly64x2_t l = vreinterpretq_p64_u64(a);
+	poly64x2_t m = vreinterpretq_p64_u64(b);
+
+	return vreinterpretq_u64_p128(vmull_high_p64(l, m));
+}
+
+static inline uint64x2_t pmull64_hi_lo(uint64x2_t a, uint64x2_t b)
+{
+	return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 1),
+						vgetq_lane_u64(b, 0)));
+}
diff --git a/lib/crc/arm64/crc64.h b/lib/crc/arm64/crc64.h
index 60151ec3035a..c7a69e1f3d8f 100644
--- a/lib/crc/arm64/crc64.h
+++ b/lib/crc/arm64/crc64.h
@@ -8,7 +8,7 @@
 #include <linux/minmax.h>
 #include <linux/sizes.h>
 
-u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len);
+u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
 
 #define crc64_be_arch crc64_be_generic
 
@@ -19,7 +19,7 @@ static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
 		size_t chunk = len & ~15;
 
 		scoped_ksimd()
-			crc = crc64_nvme_arm64_c(crc, p, chunk);
+			crc = crc64_nvme_neon(crc, p, chunk);
 
 		p += chunk;
 		len &= 15;
diff --git a/lib/crc/arm64/crc64-neon-inner.c b/lib/crc/crc64-neon.c
similarity index 62%
rename from lib/crc/arm64/crc64-neon-inner.c
rename to lib/crc/crc64-neon.c
index 28527e544ff6..4753fb94a4be 100644
--- a/lib/crc/arm64/crc64-neon-inner.c
+++ b/lib/crc/crc64-neon.c
@@ -6,7 +6,9 @@
 #include <linux/types.h>
 #include <asm/neon-intrinsics.h>
 
-u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len);
+#include "crc64-neon.h"
+
+u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
 
 /* x^191 mod G, x^127 mod G */
 static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
@@ -15,27 +17,7 @@ static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
 static const u64 bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
 				    0x34d926535897936aULL };
 
-static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
-{
-	return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 0),
-						vgetq_lane_u64(b, 0)));
-}
-
-static inline uint64x2_t pmull64_high(uint64x2_t a, uint64x2_t b)
-{
-	poly64x2_t l = vreinterpretq_p64_u64(a);
-	poly64x2_t m = vreinterpretq_p64_u64(b);
-
-	return vreinterpretq_u64_p128(vmull_high_p64(l, m));
-}
-
-static inline uint64x2_t pmull64_hi_lo(uint64x2_t a, uint64x2_t b)
-{
-	return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 1),
-						vgetq_lane_u64(b, 0)));
-}
-
-u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len)
+u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
 {
 	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);
 	uint64x2_t v0 = { crc, 0 };
-- 
2.54.0.rc1.555.g9c883467ad-goog


