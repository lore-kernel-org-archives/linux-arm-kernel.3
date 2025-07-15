Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B568C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 21:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lHYPYS7zfSlOWB+va/OKmBHB01EJrKRYUwliSkqma3A=; b=lEiGniew+Lt3KEprMjsAH5fp6i
	LI+DpVTrVFP9wO7Y11WqWzSq/PF2PfEbfrvL+w11XT6k69izD5DIMPJ6kkrw6LcLeuQPcXNP/D6cr
	2AjBzPjXN6EB6+VtfecRG5+1RDdZx5wVqvbrn/trsobxdT1KyKtiFylNBCzs31oy6HNqj0fgfl7Ff
	eTooSLbYzkVwVEVqlIOICW3WGyQfmFT7c4nO6POgBUwlKFHIlFS/WxLTR2wlmux9AaFbdMReU3QCC
	tqPjJw3mqU8nvy/arFmOd3EmQ5nq+gtp5h/rTfBc7oBwiDRGCplA6uF3b7Gxl3B2hEI+FbgC4aAOY
	jWsT3Awg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubn0U-00000006F1p-3hGj;
	Tue, 15 Jul 2025 21:16:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubmy5-00000006EuB-0zfJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 21:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 600F1A53630;
	Tue, 15 Jul 2025 21:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA76C4CEE3;
	Tue, 15 Jul 2025 21:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752614019;
	bh=mM1tF2s/b0ZogAi+jxdz4PVOTJW2G4lze14RMnYdd78=;
	h=From:Date:Subject:To:Cc:From;
	b=UaFQhWEflC8ObsgIHRpF2et4e41GDEat80M6auCJBdhbsH6TmZ69cjyUCaF7JM13W
	 acctdOa7q0H6AKSpF3sKr+XC2GzEec4Mx40VUbu7QU1YCpHOPUqnFUr1OQ6Vn/I3aT
	 +sE9kzfRsaKNjVFSRsFREFv4qp5fFI1IvNjM2YEyo39+Gs4LJy4C4VvA9YeNO0R1tu
	 RraAVr/Cu2/vceflYarGAjllZUfVgx8aXulY4Lp/Alh7LnZfKJZyeHRSFzgO5dKH2r
	 U7B8k7IX9aiuSR+J6ivT4fe300q8Xvn0DitUlTV2I6Tf9SR8AjMbAD2+wHsud9nG9c
	 Cx7IyWkwkKvHQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 15 Jul 2025 22:11:41 +0100
Subject: [PATCH] kselftest/arm4: Provide local defines for AT_HWCAP3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-arm64-selftest-bodge-hwcap3-v1-1-541b54bc43bb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAzEdmgC/x3MywqEMAxA0V+RrA3Ux1T0V8RF2kYN+KIRZ0D8d
 8ssD1zuDcpRWKHLboh8icq+JRR5Bn6mbWKUkAylKT+mKQxSXG2Nyst4sp7o9pCa+evpqNBZcpU
 hZ1sfIB2OyKP8/vd+eJ4XG3gtf20AAAA=
X-Change-ID: 20250710-arm64-selftest-bodge-hwcap3-b6ab30ab69cd
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mM1tF2s/b0ZogAi+jxdz4PVOTJW2G4lze14RMnYdd78=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBodsSB/7q/BSdILq7fHH1g2g2xJyjqobvln9I5J
 CmG6HPR+QmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaHbEgQAKCRAk1otyXVSH
 0GG+B/wIkoEOIyKfVBaVDbXG1m57caT23WlApoKSOoYziL0zqUa8bn//xVQw0JGfjNMfU31c2gI
 VVmq33UXmcvQEOSaKRa+kIaaOYOVOnMUQ91jJ0Qnu5N2D8VWLh/BZInlAfAcvaqzy/YDU9oviiq
 5D/VMi5hCrxgArDcGGmm0GCCmE+y2fNWw1RuCw+ZQvXPbr3wW9Pp7Us8xvqRzlDSRfw9yi8Eehx
 fSzq43Lwy9fDqjtz67In2e8ovCqMlrfBtCD0fTGjNWeeVGt2EKEc9oSsd4WDQHVNr6iZW89ZViU
 rtziSlLPq/buf3xi3bRwrf8ExA0vdh/G+trEE1zn2SgnWtw2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_141341_410893_696D2E92 
X-CRM114-Status: GOOD (  11.69  )
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

Some build environments for the selftests are not picking up the newly
added AT_HWCAP3 when using the libc headers, even with headers_install
(which we require already for the arm64 selftests).  As a quick fix add
local definitions of the constant to tools use it, while auxvec.h is
installed with some toolchains it needs some persuasion to get picked up.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c       | 4 ++++
 tools/testing/selftests/arm64/mte/check_prctl.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 35f521e5f41c..aa902408facd 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -21,6 +21,10 @@
 
 #define TESTS_PER_HWCAP 3
 
+#ifndef AT_HWCAP3
+#define AT_HWCAP3 29
+#endif
+
 /*
  * Function expected to generate exception when the feature is not
  * supported and return when it is supported. If the specific exception
diff --git a/tools/testing/selftests/arm64/mte/check_prctl.c b/tools/testing/selftests/arm64/mte/check_prctl.c
index 4c89e9538ca0..c36c4c49ff95 100644
--- a/tools/testing/selftests/arm64/mte/check_prctl.c
+++ b/tools/testing/selftests/arm64/mte/check_prctl.c
@@ -12,6 +12,10 @@
 
 #include "kselftest.h"
 
+#ifndef AT_HWCAP3
+#define AT_HWCAP3 29
+#endif
+
 static int set_tagged_addr_ctrl(int val)
 {
 	int ret;

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250710-arm64-selftest-bodge-hwcap3-b6ab30ab69cd

Best regards,
--  
Mark Brown <broonie@kernel.org>


