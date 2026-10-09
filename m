Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BCFCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyCekRw9sufTyDzZAdbNFK7/Qt5VQKyaiRdhuHgwJrU=; b=nWnVzr7DhHrlt2BdADkDRxcLBa
	T12kZ8p07kyRKhlpYe1OXQxKGJ+UcnVd4BX3Se4zY9HOhlEawV8b0tdu6FKkPJhHZmyuAUss2eUDh
	oNWniEpyYdSY79rl+cYiuZXwENOiOXlAxDti4F3JoLtwLXATaPgmOuOIStErvGqQUZDjRW3b2P8Hp
	OdAyVz3WooZJCKFi2u87V3cLx+3QGI2PGn/YUhiHAQP5Y77LtRxad6EU+xF6iUvjUjyu6W+4dmijm
	xl268kWa/vcXdIdxw2BPvXjC1a3icNkNsyPBG/YJr1uKivzIw2GgtOx16W1oNNC6i8iExW5VZpjeD
	fBfPtb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Gc-00000005MfV-0rkM;
	Fri, 09 Oct 2026 03:27:30 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1GY-00000005MdV-1qoS;
	Fri, 09 Oct 2026 03:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791516443; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=dyCekRw9sufTyDzZAdbNFK7/Qt5VQKyaiRdhuHgwJrU=;
	b=U+WbzG6jgZoMteiC/ffr8/lAYnEVYKsB8Ct7Yb4kUZzzf8keytj0VBGBU+GHIK1Sgdjnl5tzS5j2oOJLG3qzJ/rAbaarOfnGkTPgpfItLR9UR0APO8tfqVd6j1qAwMG9NrTPQZdr1ctcyw1USU0LEXzMGHJ9LVDHWFOOXtEPo38=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R581e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XCS-sKT_1791516441;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCS-sKT_1791516441 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 11:27:22 +0800
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
	anup@brainfault.org,
	david.laight.linux@gmail.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] perf riscv: Implement rdtsc()
Date: Fri,  9 Oct 2026 11:27:14 +0800
Message-ID: <20261009032715.2841-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009032715.2841-1-cp0613@linux.alibaba.com>
References: <20261009032715.2841-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_202726_960240_C9661EE6 
X-CRM114-Status: GOOD (  12.79  )
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

Perf has no riscv implementation of rdtsc(), so it links against the weak
stub in util/tsc.c and every caller reads a constant 0 that cannot be
told apart from a counter standing still.

Implement rdtsc() over the time CSR with rdtime.  The time CSR is a TSC
equivalent on riscv: readable from user mode, constant frequency, and the
same counter riscv's arch_perf_update_userpage() builds the user page
conversion fields from, so the counter and perf time share a timebase.

Define it for RV64 only.  Reading the counter whole on RV32 takes time and
timeh in a loop, and no RV32 user in tools/perf needs it that much, so
RV32 keeps the weak stub.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 tools/perf/arch/riscv/util/Build |  1 +
 tools/perf/arch/riscv/util/tsc.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)
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
index 000000000000..3dd419ce9d2a
--- /dev/null
+++ b/tools/perf/arch/riscv/util/tsc.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/types.h>
+
+#include "../../../util/tsc.h"
+
+/*
+ * RV32 is left to the weak stub: reading the counter whole there takes time
+ * and timeh in a loop, and no RV32 user in tools/perf needs it that much.
+ */
+#if defined(__riscv) && __riscv_xlen == 64
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
+
+#endif
-- 
2.50.1


