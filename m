Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EB8FA1FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Nk+V4+IGQogtqZ57zNWIgLS7HhnW5k487J8xiu14W4=; b=kbxmLLb+7r68//ZHvzMrYZ0PNu
	0aV+I1DzUFPIAvmY5JcSEc51cgdIsXSbjFl3kda2fzLQGJR0ze+9e7uifp+j80UeI5U+qiA/EJHtM
	3Q2gNi1+a7yzuwf5onEwbucODuFm2qSNHB/lxG9ZKHJZrPH4YRpQA+GGB/rB+CxkdnB9VZjbHwrWJ
	3NJLLZg5e9t9idgYYQJaVCFKlFXJoDrhC+ZL6JyLdAbolakJpaoBOzrImvlhDC5YMECSqbApbTPlt
	TZDfi9CF6+H/fs4KdRWMJxItK5spMCRPtIJ5ALY+efnUtvKpzdkiVA+Bf2qmWCZFndey67oSBvlgZ
	TY4FyW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbbV-0000000AaQy-0BPv;
	Wed, 22 Apr 2026 17:43:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbbT-0000000AaQa-0Fm2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:43:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C28361E4D;
	Wed, 22 Apr 2026 10:43:03 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15CAF3F641;
	Wed, 22 Apr 2026 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776879789; bh=OD5QrNLGVy+fEi3oiasM4441515XOrsFM0gTO7JatFM=;
	h=From:Date:Subject:To:Cc:From;
	b=viOR4vre1hbR8DXudh803GvGFD1B3tYM07XGjMnQPgaQUuwIRv/J6THMaZoh8KIY5
	 b3hVgQGy/1oazano3iRqt5l+lr2SI6jAz5hk2AGWtQgLikmumSssq0nrPW+rotF5Rq
	 xWW6e015aZGQ8x1lE0VAdAA5sZElpTsLJBVzR/88=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 22 Apr 2026 18:42:54 +0100
Subject: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
X-B4-Tracking: v=1; b=H4sIAJ0I6WkC/4WNwQrCMAxAf2X0bKUpbXWe/A8Zo7TpVnCbNGMoo
 /9uN8SjktNLeC8rI0wRiV2qlSVcIsVpLCAPFXO9HTvk0RdmUkgjlAROeA8z0kytTYNRbeccaA4
 6mGC8OHl/ZsV9JAzxuXdvTeE+0jyl1/5mgW37r7gALxMMSuUAtK2v5Xp007DlP6785QpfQ41WW
 6fD121yzm8ylrh39AAAAA==
X-Change-ID: 20260421-selftests_arm64_gcc15-15f6f6d07dd8
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776879788; l=1657;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=OD5QrNLGVy+fEi3oiasM4441515XOrsFM0gTO7JatFM=;
 b=BHlrn2gPuJk7Hm7WAa21pX6Bkogi8AxrTHk3EGTk6oYFKUUBAAHbQOP4/N5dhH88CQEbfP0ed
 nx7BJMxIuX2BfkFIYNWWwL/Sv5a+fBgeElNmG3MVZvypYZGfVfhYi4D
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_104311_167914_2E8CFDC3 
X-CRM114-Status: GOOD (  10.53  )
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

Building on Debian sid with GCC 15 fails:

    CC       libc-gcs
  libc-gcs.c: In function 'ptrace_read_write':
  libc-gcs.c:142:25: error: storage size of 'child_gcs' isn't known
    142 |         struct user_gcs child_gcs;
        |                         ^~~~~~~~~
  libc-gcs.c:142:25: warning: unused variable 'child_gcs' [-Wunused-variable]

For GCC-15, NT_ARM_GCS is defined in the libc header, causing gcs-util.h
to skip its fallback definition of struct user_gcs. This leads to the
compiler error.

Fix this by including <asm/ptrace.h> to provide the proper definition.

Fixes: a505a52b4e29 ("kselftest/arm64: Add a GCS test program built with the system libc")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Refined commit log (Mark Brown).
- Moving header to gcs-util.h (Mark Brown).
- Link to v1: https://lore.kernel.org/r/20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com
---
 tools/testing/selftests/arm64/gcs/gcs-util.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing/selftests/arm64/gcs/gcs-util.h
index c99a6b39ac147b4efbc9b5fbadb43daf4da2c85e..f583d4dbd0bfd964e08cf40b3951664c70bb031a 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-util.h
+++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
@@ -7,6 +7,7 @@
 #define GCS_UTIL_H
 
 #include <stdbool.h>
+#include <asm/ptrace.h>
 
 #ifndef __NR_map_shadow_stack
 #define __NR_map_shadow_stack 453

---
base-commit: 4ee64205ffaa587e8114d84a67ac721399ccb369
change-id: 20260421-selftests_arm64_gcc15-15f6f6d07dd8

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


