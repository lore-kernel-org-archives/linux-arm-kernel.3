Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE1A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1QvGSim/;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HGi9Be5T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=idpyB3wgpvjBHxuW32YaXd0au8kRjOVi2L6+27t/1JE=; b=1QvGSim/Lstol2
	Tnb90Q308xglQI9qQg2yG9c6OYmouNVB7YyTCbrSYfmwBvMaWeUWrlwiVf+VFiJdSG6kZ2RSNAwqz
	NLE/3ip5Xh+tWAtjtBrm77n6G0Wh/GwUDhHazFeJ5Yyib0JziV94q8ffgjIi0mDNvukAacwtxygKf
	nEPMPGCTlxtxxTYH6l98P8lYBs1I0LSVJeinbh8+qBSpKvqsV6UcEvuUVBqfJ1knGQ/OIaXbSoRfe
	ELvLRKHljEAd1ClhefnTYZeGtXoztzeP+JKA8PNCD0D0Ir5jUdEPD6o/Tk7gYU7FI+wlZhqXL3oJk
	+eIsOLaQ/NwncI0gv8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoJQ-0000000ByBH-0qU1;
	Fri, 30 Oct 2026 15:14:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIl-0000000BxdX-36SY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:13:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9941F1682;
	Fri, 30 Oct 2026 08:13:51 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F0EF3F59E;
	Fri, 30 Oct 2026 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373234; bh=vziERIi8LrySqcEJ/HArFy53XXcyTmszjoyyYLltKXY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HGi9Be5TA9gatIVfYsfZZWHbEXNxTD1DO8KNR2ssmHRAASrTEcLJ/wR6ckGbRwy/s
	 gxBy42hS60MWmZt+ouqEhAHQoByoQh5tDYl157fOTmvdxq7E1YM7pLguA0XO79c0Mr
	 SbTcj0fVtt91B8BUSR8XeyVLcFSc1lkYvGyHTH/s=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:19 +0000
Subject: [PATCH v3 12/14] perf tests: Check CoreSight syscall entry and
 exit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-12-7629b52ab047@arm.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=1861;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=vziERIi8LrySqcEJ/HArFy53XXcyTmszjoyyYLltKXY=;
 b=0gzf2fGP6i+qnYdLDxfD9HhsKzmG9uwUE2NL2i9X+YxRdS0yFYDQxV2J3sp4Rlac73qbqoXEQ
 FyY3h3HxF0MBW2h9ySe736E6S12Q2VH2FrYHCNZtRMzsjmVj4W7NUfD
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081355_957748_88CAFD5B 
X-CRM114-Status: GOOD (  11.13  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Record the existing callchain workload, which issues gettid() through
SVC. The test requires syscall/sysret pairs to advance the PC by four
bytes.

For example, an expected syscall/sysret pair is:

  syscall           bb76e4 => ffff800080010c00 insn: 01 00 00 d4
  ...
  sysret  ffff800080012284 =>           bb76e8 insn: e0 03 9f d6

The entry instruction is SVC #0 at 0xbb76e4. On syscall completion,
ERET returns to 0xbb76e8, the instruction immediately after SVC.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../tests/shell/coresight/syscall_entry_exit.sh    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/syscall_entry_exit.sh b/tools/perf/tests/shell/coresight/syscall_entry_exit.sh
new file mode 100755
index 0000000000000000000000000000000000000000..cf49f9961bf710da2738ef92c12887d5fc1f06d1
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/syscall_entry_exit.sh
@@ -0,0 +1,32 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# CoreSight syscall entry and exit (exclusive)
+
+. "$(dirname "$0")/../lib/coresight_exception.sh"
+
+test_syscall_entry_exit()
+{
+	local attempt result
+
+	# callchain() invokes gettid() through SVC, which returns to PC + 4.
+	for attempt in 1 2 3; do
+		echo "Recording syscalls (attempt $attempt/3)"
+		if ! record_trace callchain; then
+			cat "$tmpdir/record.log"
+			echo "Failed to record the callchain workload"
+			return 1
+		fi
+		decode_trace || return 1
+		check_exception_pairs "syscall" "sysret" 4
+		result=$?
+		if [ "$result" -ne 2 ]; then
+			return "$result"
+		fi
+	done
+
+	echo "FAIL: No complete syscall pair after three recordings"
+	return 1
+}
+
+setup_exception_test || exit $?
+test_syscall_entry_exit

-- 
2.34.1


