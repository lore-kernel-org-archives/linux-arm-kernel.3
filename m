Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80DDC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OUuBkFxHQvwLfZspjM/sL2r1bsrZ8568UGlPJR00gZM=; b=lbnpQg1JmZ46SS
	L3MZcGAUHlzlp/4WDAfKDLYMwLbwfYs6C0npnt/Me8G1u3J5QLKyq+SzCewHiFasDnYwPMuUU8CXf
	kVlECl/Ntyb0IRmw0jZXg8iyLD3vpl/tRnXMcw9+fr7SUwrdmhqJsu57MmhlFhuQP8K+uDJjzvjzb
	BZc9zA4ogUEEPM2bPSX11GMWJT4qXJT9uNdJ2qeMeAWJ/2YsTaJGVJ2lgfPBW6NlWRjepd3xdRz3q
	vL6q/oaAEVEMsm4jRf60CXKvX6vBmVyJCp5RokuNEAwMgWYEodLn+T2KvU7/3HmYy5Uv0ASvKrt4C
	BOLjN84MyDzJ4Vf6BfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrw4Y-00000005cqI-1Bhz;
	Thu, 06 Aug 2026 11:15:38 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrw4S-00000005cpI-3pQ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:15:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OUuBkFxHQvwLfZspjM/sL2r1bsrZ8568UGlPJR00gZM=;
	b=vLURiIrRe2aniUPa3vhtR2xoPLvnEnOkMzsE7OFjqr5v7rpJ89POYkYCTV53/q3RMr8tz5Z/l
	3xVIxPIsorJZPvcsKRC3mqsJ4eV/DCuS+IXsoSUrXXvErQOBF2kGMp2InXpMtFB7+Zh6gLv75lj
	qK2PKr/uE5GVtG92FO/XOZM=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hG4Fg6cPMzKm9N;
	Thu,  6 Aug 2026 19:05:43 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7103240586;
	Thu,  6 Aug 2026 19:15:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 6 Aug
 2026 19:15:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<ruanjinjie@huawei.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] kselftest/arm64: Fix abi test compilation errors
Date: Thu, 6 Aug 2026 19:15:46 +0800
Message-ID: <20260806111546.42042-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_041534_172518_F62D1A6C 
X-CRM114-Status: UNSURE (   9.53  )
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

The arm64 ABI selftests fail to compile due to missing include paths
for kernel headers, causing errors like incomplete type struct sock_filter
and implicit BPF macro declarations.

Add $(KHDR_INCLUDES) and -I$(top_srcdir)/tools/include to CFLAGS
to resolve the header search path. Also remove the hardcoded __NR_write
macro and include <asm/unistd.h> to obtain the correct syscall number.

Fixes: 21e37da12071 ("kselftest/arm64: Add testcase for SECCOMP_RET_TRACE orig_x0 bypass")
Fixes: 2fcbc4adf997 ("kselftest/arm64: Add seccomp ptrace x0 bypass test")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202608021842.jp6IBrFi-lkp@intel.com/
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v1->resend:
- Cc public email.
---
 tools/testing/selftests/arm64/abi/Makefile                   | 2 ++
 tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c | 5 +----
 .../selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c        | 5 +----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/Makefile b/tools/testing/selftests/arm64/abi/Makefile
index a01d3806eba8..e91d4cdf17ad 100644
--- a/tools/testing/selftests/arm64/abi/Makefile
+++ b/tools/testing/selftests/arm64/abi/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (C) 2021 ARM Limited
 
+CFLAGS += $(KHDR_INCLUDES) -I$(top_srcdir)/tools/include
+
 TEST_GEN_PROGS := hwcap ptrace syscall-abi tpidr2 seccomp_ptrace_x0_bypass seccomp_ret_trace_x0_bypass
 
 include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c b/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
index a00621a8949c..4ee8e5aaad6f 100644
--- a/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
+++ b/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
@@ -34,13 +34,10 @@
 #include <linux/elf.h>
 #include <linux/filter.h>
 #include <linux/seccomp.h>
+#include <asm/unistd.h>
 
 #include "kselftest.h"
 
-#ifndef __NR_write
-#define __NR_write 64
-#endif
-
 #define EXPECTED_TESTS 1
 
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
diff --git a/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c b/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c
index 3a69f53f4f88..a23081763328 100644
--- a/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c
+++ b/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c
@@ -44,13 +44,10 @@
 #include <linux/filter.h>
 #include <linux/seccomp.h>
 #include <linux/ptrace.h>
+#include <asm/unistd.h>
 
 #include "kselftest.h"
 
-#ifndef __NR_write
-#define __NR_write 64
-#endif
-
 #define PTRACE_EVENT_MASK(status) ((status) >> 16)
 
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-- 
2.34.1


