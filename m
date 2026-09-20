Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B08C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 01:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwncbw4qnktwMUdamkw495YcvOi05tP1KDNfroFtpcM=; b=pZnxrZgbk3gTZglJZA2O/tM9uT
	P9Z4AzUMH681L63zKWeaTF7k7RXe0k3dzM5R2NsxFHY5BHnkJZCXgYEBd8IRy9uTvuW35v/qNRlov
	7avDBC9QLp0oa5E7LR1YyhhwXL0AYhrx4d/Pxy4X+2AfiE2Eo/1fWtAjMAPXYaYl6fpUgo/1r6JPl
	KB6uddfM0j+lG8ztjeLZKw8zsxpo7wWQHJse5v9Xk9iv/VPSSibNztI1Tfjt7WJ9fK/VIi2VNIcp+
	kyc8Z9zSxRH9FG9xSnqbIMQgPkGg68SLrwysfelcFJ86BjZ1yoB9XM7lW4J/eVWuFE3eggWpOXWE9
	h61VBhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86bL-0000000Gjk0-2dnf;
	Sun, 20 Sep 2026 01:44:19 +0000
Received: from out-143.mta0.migadu.com ([2001:41d0:1004:224b::8f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86bH-0000000GjjR-2aNw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 01:44:18 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uhFrnOJQrVcts7+mbJYO8uPHkN/h18B5/Sljmky4Xtw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789868653; v=1; x=1790473453;
 b=thC3MB5FexUQeXCx24/aOCBMWfBAk6ZXzPtDtB3ZhFRnbSFE17wMC2A8Lp20gmKwpmmLj750
 AL8hQtOL1H67KF5vFmA52/qzzFiWtT4/u/FFInoM8TH78fbGwbOqcj4Sog1lh4G7rIRHN1ZDqf8
 LRusZ7hG4dcimMwakUyFhXDk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6661032fce2597bd;
	Sun, 20 Sep 2026 01:44:13 +0000
X-Mizu-Trace-ID: 6661032fce2597bd
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Vikram Sethi <vsethi@nvidia.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: use generic MMIO accessors
Date: Sun, 20 Sep 2026 09:43:51 +0800
Message-ID: <20260920014357.7069-3-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920014357.7069-1-qingfang.deng@linux.dev>
References: <20260920014357.7069-1-qingfang.deng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_184417_198018_B0CADBAD 
X-CRM114-Status: UNSURE (   9.71  )
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

Use the generic raw write accessors in place of the inline assembly
stores. Include asm-generic/mmio.h after the arm64 ordering hooks so
these accessors are also available to the write-combining helpers
before asm-generic/io.h is included.

Retain the raw read overrides when either the Cortex-A57 erratum 832075
or NVIDIA Olympus erratum 1027 workaround is configured. This preserves
the alternative-patched load-acquire instructions and pre-load barriers.
Use generic raw reads when neither workaround is enabled.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v2: new patch
---
 arch/arm64/include/asm/io.h | 37 ++++++-------------------------------
 1 file changed, 6 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 49a7002661a9..2fdac25bc31b 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -19,37 +19,9 @@
 #include <asm/cpufeature.h>
 #include <asm/rsi.h>
 
-/*
- * Generic IO read/write.  These perform native-endian accesses.
- */
-#define __raw_writeb __raw_writeb
-static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
-{
-	volatile u8 __iomem *ptr = addr;
-	asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
-}
-
-#define __raw_writew __raw_writew
-static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
-{
-	volatile u16 __iomem *ptr = addr;
-	asm volatile("strh %w0, %1" : : "rZ" (val), "Qo" (*ptr));
-}
-
-#define __raw_writel __raw_writel
-static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
-{
-	volatile u32 __iomem *ptr = addr;
-	asm volatile("str %w0, %1" : : "rZ" (val), "Qo" (*ptr));
-}
-
-#define __raw_writeq __raw_writeq
-static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
-{
-	volatile u64 __iomem *ptr = addr;
-	asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
-}
-
+#if defined(CONFIG_ARM64_ERRATUM_832075) || \
+	defined(CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM)
+/* Keep the raw read overrides for the device-load erratum alternatives. */
 #define __raw_readb __raw_readb
 static __always_inline u8 __raw_readb(const volatile void __iomem *addr)
 {
@@ -102,6 +74,7 @@ static __always_inline u64 __raw_readq(const volatile void __iomem *addr)
 		     : "=r" (val) : "r" (addr));
 	return val;
 }
+#endif
 
 /* IO barriers */
 #define __io_ar(v)							\
@@ -125,6 +98,8 @@ static __always_inline u64 __raw_readq(const volatile void __iomem *addr)
 #define __io_br(v)
 #define __io_aw(v)
 
+#include <asm-generic/mmio.h>
+
 /* arm64-specific, don't use in portable drivers */
 #define __iormb(v)		__io_ar(v)
 #define __iowmb()		__io_bw()
-- 
2.43.0


