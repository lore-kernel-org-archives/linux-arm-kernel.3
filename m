Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A235C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOvm1ahou09G6IuPH1qiTG1R9h7kmikS/h9ygn7ST8g=; b=d0d9eei33v8sA1YoRWO5XM/SLe
	Ff/WyqTa/XKNEFvyotlAbgVUg25GEoum4Bny9cLgqmx6omNoyjqfeon/Niou/zhCNSOp9hx/YX1P6
	p6LyO/CJtuk0yCcHh2tW0wbr8Lhh4GkV1iD34rP7/i5MfMPf7xk/ntaUoRkU1tvwF+c6Ov/K5nVNy
	1lPBOvJBpDZkbyaCKTZyu7c1pWk2DbzLEKDSKR/EeBf8lOofOJZct5tCB2RvXjrOqP4j9FQL5rcUG
	sZtWbMD2/c26WLsE+4LQ7l93Abx62E0ZuHHvRpUuk+5Q6yGIrc6Ls+uQHT2rptrSj/DuSIJxu+CBp
	ibAgjWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oo6-00000008iIo-2sep;
	Wed, 23 Sep 2026 15:22:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ono-00000008i4T-2tp7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jOvm1ahou09G6IuPH1qiTG1R9h7kmikS/h9ygn7ST8g=; b=SMk10EwYZuOnV78/CadbZZeRlU
	RJlj35eBZtNqsFZA9Y7bp0bgOoxXkqfB5rcbdtoaBeos3oVh+Y2Dq0YXyQwFoeJyCOgDwk+4k8DxY
	OvyH3S7WfJgJeZGiY50HBe9Q+pFm9iYHftwMVAGJbImZJ7Bg7V5CeYCLLCP5q968cJSg2HzvcbeE2
	ysrgFBN0lTb+kzy6ovIWdQ3AGqiwwiOszbVp1am+CXTy5xU/v0QfaBF9Vhp6DCS7lM12VzGuZhlj0
	+wwtKdlKPkxd6u7Jc6OWbnd/m9lBoG9+2sQSFThcWz5B9Apdg8X6xGig9TtNRun4X1da1LuxYKb6g
	EzRQw7xQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Onj-0000000Evhf-3FYm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DC811E2F;
	Wed, 23 Sep 2026 08:22:23 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EE3C3F86F;
	Wed, 23 Sep 2026 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176946; bh=9E/qd6jg0Rof28rV1XuWJc0vRTRpsBID5XI48+8mKF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r1MxpRStJNSPHcgVHysUljDmHSLOivvPbjyzGUsbmeaeI8+jCcZP5RQUUkxW9jW+b
	 mi1ykmFg0y1pysnKpnWbRJWXm78LVppZS6gj0dLfgt/5BwUrHmeQLkUHUGRfSl4IcE
	 84O8igkU6cMBsHMcHEUDLgx+DnaBoMu7O9kBqMbo=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:52 +0100
Subject: [PATCH v2 12/14] perf tests: Check CoreSight syscall entry and
 exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-12-6ab8c07a5455@arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Suyash Mahar <smahar@meta.com>, 
 Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=1624;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9E/qd6jg0Rof28rV1XuWJc0vRTRpsBID5XI48+8mKF0=;
 b=4CWv8CvPVQyYp3GMJIhy/EI7F8lzkLhtsiBFi4MK/qtUj+x8lxsWO24q2hVNbk9PyEaLoTK07
 lvHbqjzePrLCvhm/lD2KxZzHNtPmwGN6lr6wVdBGx2R4BQvISbQ7NC5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_162230_136588_E3040EED 
X-CRM114-Status: GOOD (  10.72  )
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

Record the existing callchain workload, which issues gettid() through
SVC. The test requires syscall/sysret pairs to advance the PC by four
bytes.

For example, an expected syscall/sysret pair is:

  syscall           bb76e4 => ffff800080010c00 insn: 01 00 00 d4
  ...
  sysret  ffff800080012284 =>           bb76e8 insn: e0 03 9f d6

The entry instruction is SVC #0 at 0xbb76e4. On syscall completion,
ERET returns to 0xbb76e8, the instruction immediately after SVC.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../tests/shell/coresight/syscall_entry_exit.sh     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/syscall_entry_exit.sh b/tools/perf/tests/shell/coresight/syscall_entry_exit.sh
new file mode 100755
index 0000000000000000000000000000000000000000..bf61b1fdf6f15e290295afc7577870c6864ddd93
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/syscall_entry_exit.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# CoreSight syscall entry and exit (exclusive)
+
+# shellcheck source=../lib/coresight_exception.sh
+. "$(dirname "$0")/../lib/coresight_exception.sh"
+
+test_syscall_entry_exit()
+{
+	# callchain() invokes gettid() through SVC, which returns to PC + 4.
+	if ! record_trace callchain; then
+		cat "$tmpdir/record.log"
+		echo "Failed to record the callchain workload"
+		return 1
+	fi
+	decode_trace || return 1
+	check_exception_pairs "syscall" "sysret" 4 || return 1
+}
+
+setup_exception_test || exit $?
+test_syscall_entry_exit

-- 
2.34.1


