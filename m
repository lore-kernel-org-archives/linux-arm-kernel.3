Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64254C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6LI/tGVPTJtzfGc+js4lja1XoZyu6sJ13/yvNlyYCQ=; b=aAMGuzB8n7wqw/VrQS8Tm+/LHe
	HHTnO4sXNKqKlLLVG0AEDNMifAVyMZA+rTiUgzBKbQxwtt27QSwiMtZv2z8rwSce5GacIk+bbVzmR
	Q+qYKs8rZkDWDwQJHZP+AXWGKa3z/Nm0Ty/j7J5XXw+m5MCIuXVomJJPlxZWTQ00NtaCPqvikpppo
	AJlB+xFIlLxCThMYeOysl5bzcxJ0CVBjGsWlytLm8y1dyQzqZq80Xo7dgz2Dq8gIRtMjvhJ3cFxkx
	DqbOOWEuitS/20ib3VwpudAzapsfxRkcUk75Ih9v8m2AwnApBlpFAzxuFLpBlNSuYihTekZdsKB+/
	/YxTebXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7xf-00000000GhL-48VV;
	Mon, 28 Sep 2026 09:47:51 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7xd-00000000Gfy-2jZP;
	Mon, 28 Sep 2026 09:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790588866; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=x6LI/tGVPTJtzfGc+js4lja1XoZyu6sJ13/yvNlyYCQ=;
	b=C7oCadEJWctA9pmKwWasdGRTNpAW5Tjksa+IPi9sTN3cNobdR6J8Vs9WTLZgdSKtQs6VjEo9gxoJ9syf2nO45AHKVruJyYzdzBgaEiuJ/mDEXV0yijfipaEp58ZxV2kUe0u3if7jpy9qPQ5j4Aa71kdMvelsVlucSSy8GuYtNwQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBlsENU_1790588864;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBlsENU_1790588864 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 17:47:45 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: acme@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	john.g.garry@oracle.com,
	will@kernel.org,
	mike.leach@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	guoren@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] perf riscv: Implement rdtsc()
Date: Mon, 28 Sep 2026 17:47:38 +0800
Message-ID: <20260928094739.2605-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928094739.2605-1-cp0613@linux.alibaba.com>
References: <20260928094739.2605-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_024749_886616_91BB8BAA 
X-CRM114-Status: GOOD (  11.77  )
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

There is no riscv implementation of rdtsc(), so perf links against the
weak stub in util/tsc.c and every caller reads a constant 0 that is
indistinguishable from a real counter standing still.

Implement rdtsc() over the time CSR with rdtime.  The time CSR is a TSC
equivalent on riscv: it is readable from user mode, it ticks at a
constant frequency, and it is the same counter that riscv's
arch_perf_update_userpage() builds the user page conversion fields from,
so the counter and perf time share a timebase.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 tools/perf/arch/riscv/util/Build |  1 +
 tools/perf/arch/riscv/util/tsc.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/tsc.c

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 2328fb9a30a3..52cd6a481de8 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1 +1,2 @@
 perf-util-y += header.o
+perf-util-y += tsc.o
diff --git a/tools/perf/arch/riscv/util/tsc.c b/tools/perf/arch/riscv/util/tsc.c
new file mode 100644
index 000000000000..7cc4710ac38c
--- /dev/null
+++ b/tools/perf/arch/riscv/util/tsc.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/types.h>
+
+#include "../../../util/tsc.h"
+
+u64 rdtsc(void)
+{
+	u64 val;
+
+	/*
+	 * The time CSR ticks at a constant frequency and is the same counter
+	 * the kernel feeds into the user page conversion fields through
+	 * sched_clock(), so it is a TSC equivalent here.
+	 */
+	asm volatile("rdtime %0" : "=r" (val));
+
+	return val;
+}
-- 
2.50.1


