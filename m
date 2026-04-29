Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B1DFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qnZJF6+PocIE6N4t3qrfCm7aGyp5cja+bMxBHDAVQGw=; b=KStSppa1nmcSdefz+WR+fad6cM
	nUbJ3zQBOhZMF7oqBxhIEGidwCyEktoMQQi1I09wEVn4oYs5LwS7kCsRzMlVtGiBI6eiGVgtNmPcO
	5dYSVxEsekI5b9MgBSy33DIRG2VwTRWBsSKvWG6CELoYdCJRcOnyt5s7LJBGZfss9/Wzpu/NF7nkE
	X8W6TFax46S7Tdm1nJw3QVtIipwdrOo+O0XntsI97xwe5SQiOk+18gsUhLEjWvAivkzbxEnxhvR6J
	HOQfJzk0/5j2j+c7S2BAvanHurxjsU0BrlPFA8eqSCO0JIMCiyg5ZLa6k32wOuesGumwR3wCfwpoN
	5ImOil2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5vn-00000003lWH-17b0;
	Wed, 29 Apr 2026 14:30:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5vk-00000003lUz-3HsC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:30:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A0C31BCB;
	Wed, 29 Apr 2026 07:30:15 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 266573F62B;
	Wed, 29 Apr 2026 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777473020; bh=NeTi0hcg9k2DhscAT1pWi2bTz0jNI0ckGm9XSnnSZtg=;
	h=From:Date:Subject:To:Cc:From;
	b=GoHYCE886zt5RciRweVcm4eYf4raaP/Z1bsOcZu9zlaWV/ApmSxpYRcUq/nwebda7
	 JnvoxAqOi66YbIhecxeQz3kJx0JF5gd3QCN1iY3Hy9Uo76Suwv9ry1tyrlynoLIljB
	 TM9BjdVGQ6zmQURohswcej8WlJax9YiT4R8i6hTE=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 29 Apr 2026 15:30:10 +0100
Subject: [PATCH v3] kselftest/arm64: Include <asm/ptrace.h> for user_gcs
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
X-B4-Tracking: v=1; b=H4sIAPEV8mkC/4WOQQrCMBBFryJZW8mkSUxdeQ+REpJJG7CtJCUop
 Xc3LaJuVGb1Z3jvz0QiBo+RHDYTCZh89EOfQ7ndENPqvsHC25wJo0xSzqCIeHEjxjHWOnSS140
 xIAoQTjpp6d5aRTJ7Dej8bfWezjm3Po5DuK81CZbtP2OCIo+TyLgBELo65uvODN2if7LsF0ttB
 RVqoY1wL3b5JbHP/q8Olh2GQsktKlUq/XbM8/wAqf5YHzgBAAA=
X-Change-ID: 20260421-selftests_arm64_gcc15-15f6f6d07dd8
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777473018; l=2139;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=NeTi0hcg9k2DhscAT1pWi2bTz0jNI0ckGm9XSnnSZtg=;
 b=nCAdQH9kseptMnD4vgoZwFhM1LLWcbMCmI7saEWkM1WwAGkQcUVAWjj0uLqHyD4gUknNIvGE4
 g+dYNpkD0Q6AlyE6QWMDsH4cj0WkXoYKotr/2ubEHr2K9BKpau8IKCq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_073024_950510_91BBEDD8 
X-CRM114-Status: GOOD (  11.17  )
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

kselftest includes kernel uAPI headers with option:

  -isystem $(top_srcdir)/usr/include

Include <asm/ptrace.h> in libc-gcs.c for the definition of struct
user_gcs from the uAPI headers, and remove the redundant
definition in gcs-util.h.

Fixes: a505a52b4e29 ("kselftest/arm64: Add a GCS test program built with the system libc")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v3:
- Moved to include <asm/ptrace.h> in libc-gcs.c (Catalin).
- Removed the redundant definition in gcs-util.h (Catalin).
- Link to v2: https://lore.kernel.org/r/20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com

Changes in v2:
- Refined commit log (Mark Brown).
- Moving header to gcs-util.h (Mark Brown).
- Link to v1: https://lore.kernel.org/r/20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com
---
 tools/testing/selftests/arm64/gcs/gcs-util.h | 6 ------
 tools/testing/selftests/arm64/gcs/libc-gcs.c | 1 +
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing/selftests/arm64/gcs/gcs-util.h
index c99a6b39ac147b4efbc9b5fbadb43daf4da2c85e..7a81bb07ed4b8b82ee90d93b336b26760703d55b 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-util.h
+++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
@@ -18,12 +18,6 @@
 
 #ifndef NT_ARM_GCS
 #define NT_ARM_GCS 0x410
-
-struct user_gcs {
-	__u64 features_enabled;
-	__u64 features_locked;
-	__u64 gcspr_el0;
-};
 #endif
 
 /* Shadow Stack/Guarded Control Stack interface */
diff --git a/tools/testing/selftests/arm64/gcs/libc-gcs.c b/tools/testing/selftests/arm64/gcs/libc-gcs.c
index 17b2fabfec386e523e788d8bcfcafa553c93bd9b..72e82bfbecc99e34da71d56cf5401c137d6e9a48 100644
--- a/tools/testing/selftests/arm64/gcs/libc-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
@@ -16,6 +16,7 @@
 
 #include <asm/hwcap.h>
 #include <asm/mman.h>
+#include <asm/ptrace.h>
 
 #include <linux/compiler.h>
 

---
base-commit: 4ee64205ffaa587e8114d84a67ac721399ccb369
change-id: 20260421-selftests_arm64_gcc15-15f6f6d07dd8

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


