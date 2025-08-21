Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC69CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJB6QwOEvl7l+otteqECM8Lr7fPkEjpmPJaXukRIWi0=; b=QiVSVOMduXS3XMblaFMQ2uQBa5
	yg5RjRxLrKI19eIXts7oH0W20z5CB/mDDR9+V/ZARUxEC+OddhbDKMX6GJmHHNhASBGmeHOf5ypSr
	kWwJGkQLGCDIoKyVoNmHI8IlxU/l06c74JgeWCYNbe0PoowXojDn4GSkd7HEDOMi8Oz50uLo/ySGk
	XEPFFa7HyRXAGY0afhk5701Ez+LL4C8XN2gWC0SlbileoN0s7bdHcarbtSu5mkEzK9ef0ShBak56j
	rPO1RRi78qIsHco3JWuDyJia1Eic550NjtD0FyR7mZ9lELxatAV3V1ypUmQbmaf8z/ijSckPrCu4J
	qp0PXM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAsF-00000000IgC-3zzm;
	Thu, 21 Aug 2025 19:22:59 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6yU-0000000HJwm-1Ux6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755789186;
	bh=h/4lrKAX6pF/gjGhEXhKe5bBTHwGePjRZnh/r+I4xI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iAK3Yt209KoUD5hZLoakwBGYllm7FZn2mNfFs8SUAjwxpvDND+DcEhqweUbyX04ZS
	 Ec2UW43S3gLMOWXSQu461XAx0VZg5ureV6xd61Jxc0+VIIa5D4M/UwaQQD8fS2mmSN
	 8m5SKRzpBm2jGKj4zmdSZKrvvVWJC+N7BIDNfX00=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 Aug 2025 17:13:03 +0200
Subject: [PATCH 2/2] kselftest/arm64/gcs: Use nolibc's getauxval()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-nolibc-gcs-fixes-v1-2-88519836c915@weissschuh.net>
References: <20250821-nolibc-gcs-fixes-v1-0-88519836c915@weissschuh.net>
In-Reply-To: <20250821-nolibc-gcs-fixes-v1-0-88519836c915@weissschuh.net>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755789186; l=1309;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=h/4lrKAX6pF/gjGhEXhKe5bBTHwGePjRZnh/r+I4xI4=;
 b=hIZZJkYzmN2hdyvFbNdtAvwuxrH719lR2ZzZJRUedITZyThsSbc/iRxqfkT61PGxExwDfboaA
 rHiSZqT3Cx3Dy4prmE4ufwjTxVehaU0ivf0eJruoKdrB4KZF1fPQude
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_081310_565876_3A873115 
X-CRM114-Status: GOOD (  10.85  )
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

Nolibc now does have getauxval(), use it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/arm64/gcs/basic-gcs.c b/tools/testing/selftests/arm64/gcs/basic-gcs.c
index 100d2a983155f7347a19b2b8b88f9494dc6a51d5..250977abc3988685abf68666d35b7a8547f74f4e 100644
--- a/tools/testing/selftests/arm64/gcs/basic-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/basic-gcs.c
@@ -10,6 +10,7 @@
 
 #include <sys/mman.h>
 #include <asm/mman.h>
+#include <asm/hwcap.h>
 #include <linux/sched.h>
 
 #include "kselftest.h"
@@ -386,14 +387,13 @@ int main(void)
 
 	ksft_print_header();
 
-	/*
-	 * We don't have getauxval() with nolibc so treat a failure to
-	 * read GCS state as a lack of support and skip.
-	 */
+	if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
+		ksft_exit_skip("SKIP GCS not supported\n");
+
 	ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
 			  &gcs_mode, 0, 0, 0);
 	if (ret != 0)
-		ksft_exit_skip("Failed to read GCS state: %d\n", ret);
+		ksft_exit_fail_msg("Failed to read GCS state: %d\n", ret);
 
 	if (!(gcs_mode & PR_SHADOW_STACK_ENABLE)) {
 		gcs_mode = PR_SHADOW_STACK_ENABLE;

-- 
2.50.1


