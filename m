Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971ACC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TT3xqx0tC78I7m+k2tl3Pez4/p5gr7cxzHpQEtihcM8=; b=fXrrsY5Hsg7epw8JrqneysuhqQ
	y7s9s+7FbjDs3chm+Z/kP5wRHgq3tJli0xxSHS1mbjzdeRdt5RTDuYJ8jAj09EHiydIgFh4z8eV/q
	JVWuUspiWdJcnndtiZyGQIHI6Lo7YpLHkPhl7myl1EErxDFeK5CT/+7PP6FNtPo/S3hb3vIdbI+NI
	W86hfi71c4xWqLFv5RMhmquMt7ZwattnNxAxYGpmu2hc59r6w+dVx/v/3By98xSsRopPs+0g2o2lD
	WO7MeMUlfC5vmia7cheifYg0gIt8QbM8lDP59KczJTZDVtK3+W3M8/iMU29Ji41XmIHuu/LsAbrxe
	ORitUaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR27-0000000CXER-3jH2;
	Thu, 03 Jul 2025 20:59:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMm0-0000000BzQj-39na
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:26:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3ABAA5C58C8;
	Thu,  3 Jul 2025 16:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57858C4CEE3;
	Thu,  3 Jul 2025 16:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751560015;
	bh=0se/eq+gWDDz/zPGLfe64NetxynymgwpyPlKXYP8XIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F9xYnMulVuNGNvAGTBMpLlkUdOXV29MzVXEe033VuqVu/tGe+RWsJngzdz4IffUZF
	 TlFfr0OzdjCXXzY5GuscScdCqMN4WdRq00y7yQ79g33zU0CeoS7fDu5zmWPpovhul5
	 ZpqA/v/ijUwmYLGzJmt8RMJ2UuKToISDuzKDPkyqtBjsZ0ev9agFlQ4yyBi80TBfV+
	 c9pcjON/ohz7/AITWDxJYIcAcipay9tALB0V3775LUsr27Z0zso2ElZBpm547GWVvL
	 /Seqd/LMJsI+P9t4/SG/wnc32xVf9Rwn8YlZIaCiUv6D0bP+sqI5ZeiRE+LEbZPRwp
	 cUgjf2kBSiWFA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 03 Jul 2025 17:23:24 +0100
Subject: [PATCH v2 3/3] kselftest/arm64: Add lsfe to the hwcaps test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-arm64-lsfe-v2-3-eced80999cb4@kernel.org>
References: <20250703-arm64-lsfe-v2-0-eced80999cb4@kernel.org>
In-Reply-To: <20250703-arm64-lsfe-v2-0-eced80999cb4@kernel.org>
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
 h=from:subject:message-id; bh=0se/eq+gWDDz/zPGLfe64NetxynymgwpyPlKXYP8XIU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoZq9DrX1z69CleuGaYuiPYfm4x17/sToCyk2zP
 Nm99VorSU2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaGavQwAKCRAk1otyXVSH
 0LtRB/45/MTmfubRL3pBtMgXgWZMq82PR/jkn5ACdHwS7IGViT7FD2ZmgEzsylFTLDfTmP4bjqb
 pbVkdOsCSZJylYyOKBy6J9aDXd7tjwVYbfLr1jFUylvwqe2j5aZ27QCwhe1PC+DOzTvNkqEzvEB
 UIUPledQkbmnZJXMySkE4RVNqUaTB8ws5T8BGrQjz+ncH0gVf+yZfXpkdxiXetLZ4QTqNj1FjDR
 ip9vM1mAiEyMlpLqJeNt0L/XcFLEWNFVgOO78k+oVlAMlESket+6r99C6oAxaBjOv9nmGxTRVCw
 0i3NukLDRtFDCW/v6+sTv43stjBooDOAlxzXewZLYPF/ko5z
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_092656_842432_C754A315 
X-CRM114-Status: GOOD (  12.27  )
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
index 35f521e5f41c..faa0f82f27e0 100644
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
+	asm volatile(".inst 0x7c200000"
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


