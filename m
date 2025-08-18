Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439D9CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpBO34VKZyeAHB9kvp+LeWY/mfM/LNtUVyu6Xb4LSnU=; b=uBWpxibXw52YlVNfNAm6D1kzBw
	NMv9RN6xHpfl2y1OQpmnY9aNUw0YAf0dUIjeeU+e2REV2fxkZLQ3l6XnLIOlNF0xJ+d2xLiyhhWI+
	IHnvgf2fS5w+o16LYgWM083XGEGxkB2xzEveiVeMns2qRg8Wt3mFV0T4iy8GsVfXHA84dpgFKR3aP
	ASDpTQOGKIqj2EbPFy32chcE+A35M1hXh7bTawJr4yti5445odIDllPF2m6UwNUWDRFe+BEmKt7bc
	QmG/jGySarNDeIq0PSuECz5OvCp+Cc/0v0UpPhoS713vHiZlPFMjJiyZcDzu8y2cvbU8KRtEmOglA
	jiJajCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Nx-00000008i61-0E3s;
	Mon, 18 Aug 2025 21:27:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5V3-00000008Vjd-1cRW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC085601FF;
	Mon, 18 Aug 2025 19:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B7CC4CEED;
	Mon, 18 Aug 2025 19:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755545192;
	bh=Yp4rWZGTDT5KFNRfuZwRUzBhL1WXxvUosbp+WU+yAyM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=enYR4qj7ytofyZvFaTFCUCZu1/wM8GKJTrdhnlmPC6ADnC98OmNkXGeWKYxgkkiqa
	 JS/LtmHCCrQdxGDD8KFOLsz4q8ZxyD2h0cxqCrMLEK3Ze7Bwnj4vbXBAW8SIMc0ELF
	 7Ipj640hZ51Kz4yC7uauTta29m2s7d9Uo27IIEI9rzQYwkMVvbs1GxRaJ+ENLSWuC6
	 J6uSsSX9bh3IAYHCOTXWWRNtHgic/0kET6gfjGWr0Juyf5Bs9AWTobf8R0JznyREix
	 mQO3Ev9ysKTMxqHlbvymgM0A44bC2DcPDSI8EiEZPcW/SbC3YdClUypJYMRReLWSKd
	 BYz1JaMud4g2g==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 18 Aug 2025 20:21:20 +0100
Subject: [PATCH v3 3/3] kselftest/arm64: Add lsfe to the hwcaps test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-arm64-lsfe-v3-3-af6f4d66eb39@kernel.org>
References: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
In-Reply-To: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
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
 h=from:subject:message-id; bh=Yp4rWZGTDT5KFNRfuZwRUzBhL1WXxvUosbp+WU+yAyM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoo35cNLSX6TytXvCWIkh1aXNAVcK8MraPbgJUI
 mJwRba6cluJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKN+XAAKCRAk1otyXVSH
 0CH0CACCOVx3HNaVMqyPEwTi7A3oJxaPSzOk7n4/tjcUwCF85/+WFdLaEaHCuePMjrYUveEuGsw
 xCWs2hJ+6pJG5LR2/YwTcp75aeAxyCPybxR5Km1Lb1yotTpw2ZlaO1vQP6ZA3TbBfa41bQR8EMr
 dWqtGVwyJeN0eJRue9bp2yiwqwvSAKXS1JETnFsjAQSk3L3p6zDU4rf8ozCvjhOfGWm5bTBzO2j
 ePrni6UZoCwVxGZC4twgwRkO71CcRCKhUh+UrJcfAK+aSWcntU1rh7bL/p+qx3+fXAeS1KdYn01
 dZ/0qMkZ6lTfSrIHzp/T+EIBmfzZx4g9Py0TNy5DznPPFols
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
index 002ec38a8bbb..941890f69df6 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -17,6 +17,8 @@
 #include <asm/sigcontext.h>
 #include <asm/unistd.h>
 
+#include <linux/auxvec.h>
+
 #include "../../kselftest.h"
 
 #define TESTS_PER_HWCAP 3
@@ -169,6 +171,18 @@ static void lse128_sigill(void)
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
@@ -762,6 +776,13 @@ static const struct hwcap_data {
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


