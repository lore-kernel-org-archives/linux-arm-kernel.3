Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB66AFA1FD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iefujo3GvEuh673SYJx1ZU2EVzghhXSeX/cq2mh28C4=; b=LYUk2GvP9nMWZhxsqwJdgzSdux
	TO9b6zSSdqa72xfE5R6S4LtcV7s4lfBL20GXfpigS8AdeOWQmakSqAicbdpF62kfM9Hz11e1+rcmJ
	Bo/kKGM829BcV6K6w9r5HyFXl4kkwcUXe8DxFb5+XNMyYJX2QmdSjUUaYPTqA83M3ATvloPcoGo9/
	recaHT0STX2EZ5rUZDyjLDgSuVnlo+bBaO4Ck9hikkQz8CQbWMBZG1AXurTEeGr7tZ8/qOixgrVhi
	qO3nfGXtcXSNWg3kFZHy2Y3Z6JfrhcNSjZq9PboDQlz4H9DteGaS20iI1svBNeOnQxNHd58P+cjE+
	i5rhye/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaxc-0000000AXrn-1FO2;
	Wed, 22 Apr 2026 17:02:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaxU-0000000AXrL-1uaJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:01:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3E1F1F37;
	Wed, 22 Apr 2026 10:01:42 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 280343F23F;
	Wed, 22 Apr 2026 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776877308; bh=Ag1z714621KJWO6QLszbpXo2w9rPzOsLA0Qccy4x9ww=;
	h=From:Date:Subject:To:Cc:From;
	b=WfhZ5nIvh4+srijbQLeL9vlDBmWVvbBi+1pNt6QeMrKzpF5pBoV374YsgSuxd34DK
	 8ov9UnxJ0xxIbnz1yX8GnCW1K7+o5OL7arHcDi85OZP5zmb2J0lYjaSzYVXBPDbgfl
	 OtOvtFiDsV4ysvLpoE2L9Bkij2Zfomh5dZwYUv4Y=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 22 Apr 2026 18:01:39 +0100
Subject: [PATCH] kselftest/arm64: Fix build failure with GCC-15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com>
X-B4-Tracking: v=1; b=H4sIAPL+6GkC/4WNXQrDIBCErxL2uZasqP156j1KCKJrIjQ/uBJag
 nevzQXKPH0zzMwOTCkSw73ZIdEWOS5zBTw14EY7DySirwyylaZVEgXTK2TizL1Nk1H94BxqgTq
 YYHx78f4KtbsmCvF97D67ymPkvKTPcbPhz/23uKGoCoakcoja3h41Pbtlgq6U8gWavh75uAAAA
 A==
X-Change-ID: 20260421-selftests_arm64_gcc15-15f6f6d07dd8
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776877306; l=1427;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Ag1z714621KJWO6QLszbpXo2w9rPzOsLA0Qccy4x9ww=;
 b=/KKGMRaK6Jw8UqSVDKa5FC28/dFLr10q+zpEQ9zp/SxTOily3TNBjAHGDaKskULHLkaIZ3goB
 5IoBo6hedfBBD5PvOY3cd0Fsr17EQT6SaZJGSLRRUxGrtQgVrdMGjlS
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_100152_565015_57E0B9B6 
X-CRM114-Status: GOOD (  10.09  )
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

GCC-15 defines NT_ARM_GCS in the toolchain headers, causing gcs-util.h
to skip its fallback definition of struct user_gcs. This leads to the
compiler error.

Fix this by including <asm/ptrace.h> to provide the proper definition.

Fixes: a505a52b4e29 ("kselftest/arm64: Add a GCS test program built with the system libc")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/testing/selftests/arm64/gcs/libc-gcs.c | 1 +
 1 file changed, 1 insertion(+)

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


