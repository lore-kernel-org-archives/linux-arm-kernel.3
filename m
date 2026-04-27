Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41D2FF8869
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ge+gLOghAHu+0FzCbaZCe2wrIYxRBjK2+0E6CvN8qo=; b=wpftdx1bA2CPGqbiB+kcv5Bsha
	sxx/cCQrdWV3/1x1BV5bnh6MxuUU8VdaHMXYzrEMR3YQrLFVasd4+Tz3OgtAp8xy9d0Yunaxqx697
	k7AKU8ig8SQGMeU9SLOer894RQsiKpD7+W80iWhJKfs+9fWPeU4B3CPQL7DXS6biOrkTuA5pn0yam
	rVx7Xu4ofQ7C8p4J/0ZMenz39r3q3P6ZEnO2fjmhEgSJ0ALFRy532hMKPWSbXjvjd4ax4GmXBUWqw
	q2kYHPrs+IFvfVAZORPQB0Yv9bbENWP85SXbJ2i0daXqMrxs6Lg++AxNrKTew/LBG0PSjiBpEWXn+
	L7lJxRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKhC-0000000GqeN-3HmE;
	Mon, 27 Apr 2026 12:04:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKh6-0000000GqbW-2ksk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 12:04:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 023032437;
	Mon, 27 Apr 2026 05:04:02 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA85A3F62B;
	Mon, 27 Apr 2026 05:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777291447; bh=ldcRjHyX3ikGZr7TkP8sF4TKynkn1s47t2JOAAGYL7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Miik+htNqUHD8vM0xx8JqEjpijJJ/3fmWSdcOzhiUxUJX8LFyjsOuhSbRJ6QTtLCF
	 x98ojX4IXXUjskp5T8b8iUrxWEOkFCf6JjJnIoySQSzjTKSt/V1TDI4v64H/FLFMrg
	 9YAfKQxrgNv/njWtR81B9dfN559OxTMw8e1GvVXQ=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 27 Apr 2026 13:03:36 +0100
Subject: [PATCH v2 4/5] kselftest/arm64: Move/add POE helpers to
 test_signals_utils.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-poe_signal-v2-4-2bd9d6f16ab4@arm.com>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
In-Reply-To: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777291437; l=2017;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=ldcRjHyX3ikGZr7TkP8sF4TKynkn1s47t2JOAAGYL7E=;
 b=r24fR4zGfLVsqC3/BUO4grJOZYk9vXPaWiQGFFkqbpPG0E3bWUZYasLlLJnROsUstdfZcv6rz
 l5q3dEkmPbMB4V4cqfkWkRZN/jzikVM6ShcRdFYHENfVT5ULyQjmCrh
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_050408_815470_16DBFF07 
X-CRM114-Status: UNSURE (   9.88  )
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

In preparation to adding further POE signal tests, move
get_por_el0() to test_signals_utils.h and add set_por_el0().

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../testing/selftests/arm64/signal/test_signals_utils.h  | 16 ++++++++++++++++
 .../selftests/arm64/signal/testcases/poe_siginfo.c       | 15 ---------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.h b/tools/testing/selftests/arm64/signal/test_signals_utils.h
index 36fc12b3cd60..2c7b8c64a35a 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.h
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.h
@@ -57,6 +57,22 @@ static inline __attribute__((always_inline)) uint64_t get_gcspr_el0(void)
 	return val;
 }
 
+#define SYS_POR_EL0 "S3_3_C10_C2_4"
+
+static inline uint64_t get_por_el0(void)
+{
+	uint64_t val;
+
+	asm volatile("mrs %0, " SYS_POR_EL0 "\n" : "=r"(val));
+
+	return val;
+}
+
+static inline void set_por_el0(uint64_t val)
+{
+	asm volatile("msr " SYS_POR_EL0 ", %0\n" :: "r"(val));
+}
+
 static inline bool feats_ok(struct tdescr *td)
 {
 	if (td->feats_incompatible & td->feats_supported)
diff --git a/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c b/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
index 36bd9940ee05..e15fedf4da6e 100644
--- a/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
+++ b/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
@@ -21,21 +21,6 @@ static union {
 	char buf[1024 * 128];
 } context;
 
-#define SYS_POR_EL0 "S3_3_C10_C2_4"
-
-static uint64_t get_por_el0(void)
-{
-	uint64_t val;
-
-	asm volatile(
-		"mrs	%0, " SYS_POR_EL0 "\n"
-		: "=r"(val)
-		:
-		: );
-
-	return val;
-}
-
 int poe_present(struct tdescr *td, siginfo_t *si, ucontext_t *uc)
 {
 	struct _aarch64_ctx *head = GET_BUF_RESV_HEAD(context);

-- 
2.51.2


