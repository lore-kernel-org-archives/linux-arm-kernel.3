Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07360F8FA86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taBtA+ri8scCV7v75zAPrf4/c0PMoKoCmfynrTBJGS0=; b=ez/5TgcjQM37XnM9OhyRCKgdw7
	4u0ehclktbvvdzCVCeiSh5LewNItjTqgIXJszK10uzHXDa8TPYEURM+2XUhI4qCWvvT99DELFFCWL
	3HwHoyZXZrobUi8hHvxWd41bg87wiiIZh7LdV2rzOxFq520I8vRt88GuGnF3UZrbrgB0aWzyh0B2K
	N0XRsag20aWSZFz9kDbnP60mXt2I6neaUGtyYwZ0f9UfYRk5EV639El/d1vUE72qkmV6emehAsKim
	zfA09CPVsHkT/QPmtLytUymNBdhsffKIygNmHgtc/VgPK/ieFxCIya+l21de/D90waYUvhdI3pvDm
	zGiYbP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCJy-00000008kuT-2Ol8;
	Tue, 21 Apr 2026 14:43:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCJv-00000008ksY-1Dfi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:43:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9A4625DE;
	Tue, 21 Apr 2026 07:43:16 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E88403FAF5;
	Tue, 21 Apr 2026 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776782602; bh=p9bdjlhoG2EqguOOpOu5ObgF3kpj690/lD2+dGUSX94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiIV33xkcYjsI3igqSQxQsbZpSAYHDVc87sh2ssX9mBR5iX8ekC58P+/1IlzbVhlZ
	 R4Ry7oJKdhRqFNqJ2EICuy3g96fZVsOoIfTt2VY6Va4jc7NgitwPL7Jb4Cwv7WBpHP
	 C6kws5bOwd6tovUY5A3PnaOVNDy5dSw69cTzSInI=
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/4] kselftest/arm64: Add POE helpers to test_signals_utils.h
Date: Tue, 21 Apr 2026 15:42:51 +0100
Message-ID: <20260421144252.1440365-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260421144252.1440365-1-kevin.brodsky@arm.com>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_074323_369832_CEF20580 
X-CRM114-Status: GOOD (  10.03  )
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

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../selftests/arm64/signal/test_signals_utils.h  | 16 ++++++++++++++++
 .../arm64/signal/testcases/poe_siginfo.c         | 15 ---------------
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


