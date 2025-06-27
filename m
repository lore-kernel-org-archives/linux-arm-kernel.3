Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDB6C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xiieb2WqLEwdrVbqHr0RP+7qjZBU3OA1Es4scuOQ7c=; b=vGFLHoqB+Og4F4KRpebZZInub2
	iOX4ntnzjm28FE9KcZTGww4aVRczE2Wr3yR/yZ+WHoJDB/gtdP/o9InycWyjVRg2XTjINt0t7XxGO
	aDlPCMWK5bM5o7R8P/Xt9YC23HrTdEA536/6gnyezXKVcP+d8ZHjmjAn+Yoji+F8zsDm26zwpoA2n
	5qpN4f/9ytKhGq0GzfGJ/7yA8SH2+SZkFus7xqwq673gf/wdiseBtHEqUlqJiei83xYDyfq9hHg4A
	ylgtEzci3NFrqFktTzffgsrUamOTwJtCJKQtq+FXYlllIGUqjFpMCYzC893nRlg31Qx6mz+ffS/q7
	0okubEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVENQ-0000000FYoW-22Sf;
	Fri, 27 Jun 2025 19:04:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCpB-0000000FPFX-0Gua
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F52F61439;
	Fri, 27 Jun 2025 17:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD342C4CEF1;
	Fri, 27 Jun 2025 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751045116;
	bh=lH2UPYp6QCoEhr4YOD4G34RicJOUqUNXtxpfpE/H2hQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mkF1UUJ/jF5LyPnV9B8BJwjRIGHIl8zLQkLQBsrWZKEGb8SBkvLa8jRSNa6qgMQZv
	 pBIIc0622B0Gw2SQ6vVqwWr6289TmMZxjXrA8ZuvvVzIZhVCUMnvrUrlfjbx7S2d+2
	 AXYocZpqY0qZ4cr1S1ADPeQtAkLpSFYRyS054D8waAKCBQtXM7w5snKxUdq/J/bWAc
	 GsCeURDU6QpyBmLMKdN5n8+cWrLRckFu5MeZCXfBXDFkAMZM+jE6/HIzfm6LHdJJhE
	 6k079+yJOD0zdKdDxb6RqMnUbktSjcbBjN9KoxQR+yJHbShOXQ9kkzSSDort40GUxK
	 9++ZdvO+uSIrg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 27 Jun 2025 18:20:46 +0100
Subject: [PATCH 3/3] kselftest/arm64: Add lsfe to the hwcaps test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-arm64-lsfe-v1-3-68351c4bf741@kernel.org>
References: <20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org>
In-Reply-To: <20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lH2UPYp6QCoEhr4YOD4G34RicJOUqUNXtxpfpE/H2hQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoXtPvHdrwxtM6K55h9ibmBPuatpZ0f6ZPAQ+ii
 cvW6CW1ddaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaF7T7wAKCRAk1otyXVSH
 0IQKB/0TOvdgLavdQtvO6QYDy5rzRWcJ2bv8jmEwtiA6ZLIXdyI8DSOJnxX6gJP6juqegfqPfTz
 iLvcK7uYQGzTs868wXkYC1LgUVJMX0f3gKSX0wJ6p8cGOduRvD5ZO3MB0ve0CdNP4hgxvaxM2ov
 Mdv05y+jtfzgNxJht4TI3X4PXwstUNqvphKdetij0jZiV/m+t5l6gLmYbkAJEoAz3kf+p0hkT8k
 Z9D17eNlB5ptmsmq13v1Qlnz9ya3zr1irOCD5nTMjkpRLXucuLLcrOCmKiwV0a8T7ZApbNJbXsR
 CHp5ZsrGCMS5LRNT1pH78PzHtRSp4Fpsr4huWOw/79Rkf+LD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

This feature has no traps associated with it so the SIGILL is not reliable.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 35f521e5f41c..9dfca2eb7c41 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -17,6 +17,8 @@
 #include <asm/sigcontext.h>
 #include <asm/unistd.h>
 
+#include <linux/auxvec.h>
+
 #include "../../kselftest.h"
 
 #define TESTS_PER_HWCAP 3
@@ -165,6 +167,18 @@ static void lse128_sigill(void)
 		     : "cc", "memory");
 }
 
+static void lsfe_sigill(void)
+{
+	float __attribute__ ((aligned (16))) mem = 0;
+	register float *memp asm ("x0") = &mem;
+
+	/* LDFADD H0, H0, [X0] */
+	asm volatile(".inst 0x7c600000"
+		     : "+r" (memp)
+		     :
+		     : "cc", "memory");
+}
+
 static void lut_sigill(void)
 {
 	/* LUTI2 V0.16B, { V0.16B }, V[0] */
@@ -758,6 +772,13 @@ static const struct hwcap_data {
 		.cpuinfo = "lse128",
 		.sigill_fn = lse128_sigill,
 	},
+	{
+		.name = "LSFE",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_LSFE,
+		.cpuinfo = "lsfe",
+		.sigill_fn = lsfe_sigill,
+	},
 	{
 		.name = "LUT",
 		.at_hwcap = AT_HWCAP2,

-- 
2.39.5


