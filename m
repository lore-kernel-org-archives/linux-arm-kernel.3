Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EWR0nWJN;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LuAd9ScQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+rM42lMVWYrTyqPz3fPMPzSnMbUrQ5yCmC7jK/qTA9M=; b=EWR0nWJNCqaHvV
	MYl2Ai/7RHlSWPRG7Oy8zTrHKLvfpa9hIW+8iEu4LLWJ47bnkVtOaAtEbM5H8OJG19CvbRf01Fk+u
	4VZvjCs6wm+WvzTXLSHK/LnfJIsj4q4uHSrl74anuRvNvtys81jcn3MvJ9cLWJg1dDi9ttOJqPLDs
	wK20dnqkbmnEkqgnJhJqx4MMs7E8O76ufSh9Wl6LXnxoN79Zd/wypMDym+d6suwxD5M48YL4QavK+
	CmnvepHy6M6Fgjazmxb01VqB/e6i3dmTcEvnnYwPEXuc14DLCT13BAiIEgMZH5a891unnuFXOTuEB
	vyxanjmMTr+Hg2QwJprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoJQ-0000000ByC3-2mou;
	Fri, 30 Oct 2026 15:14:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIq-0000000Bxk5-2vu6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:14:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9FF91682;
	Fri, 30 Oct 2026 08:13:56 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A22B23F59E;
	Fri, 30 Oct 2026 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373239; bh=ud+KGbq8vc4zGQ8mJPdEUGfwVQqtsWXdPrjpP0/C8CA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LuAd9ScQsOiJzzolp6bSj5UdKDSOyu1j+JUaW5x7BIlJXffN/JGqSZNj5Gc30j0Dy
	 45Im3CEQwhKy4jfl5IdFCi8rg7lu1iXxPkO3baiwt4RUFw0HT1+Inh+aVb4DCCePUY
	 RjVJPP1oGq1vyHMtOyIV1BnnQ+bVT7e4DBZfVqQ4=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:21 +0000
Subject: [PATCH v3 14/14] perf tests: Check CoreSight emulated instruction
 entry and exit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-14-7629b52ab047@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=2576;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ud+KGbq8vc4zGQ8mJPdEUGfwVQqtsWXdPrjpP0/C8CA=;
 b=J+IpPXgeZpt+yD5qjm+xAxSH2eL2hkn8/kHiIR8jsu3OebW9Ysc7gBjHTyKPgCecuuDCBoBkD
 lS0wmbWXA3WBJ6bc5Bk8FP+TPT2Z+fVUa7tVyUx5nprMxNE1N8044pK
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081400_930065_194B5E20 
X-CRM114-Status: GOOD (  14.50  )
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

Use traploop's EL0 read of ID_AA64ISAR0_EL1 to check an emulated
instruction. The kernel emulates MRS and advances the return PC by four
bytes.

Select MRS entries by instruction encoding and reuse the common FIFO
recorder and pair checker. An instruction page fault at MRS also matches
the opcode filter and returns to the same PC. Retry recordings when the
pair check fails or finds no complete pair, and fail after three
unsuccessful attempts. Recording and decoding errors fail immediately.

For example, an expected int/iret pair is:

  int            5cc808 => ffff800080010c00 insn: 00 06 38 d5
  ...
  iret ffff800080012284 =>           5cc80c insn: e0 03 9f d6

The entry instruction is MRS X0, ID_AA64ISAR0_EL1. After emulating the
read at 0x5cc808, the kernel returns via ERET to the next instruction at
0x5cc80c.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../perf/tests/shell/coresight/trap_entry_exit.sh  | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/trap_entry_exit.sh b/tools/perf/tests/shell/coresight/trap_entry_exit.sh
new file mode 100755
index 0000000000000000000000000000000000000000..4521e4f4ba58100c7da7a915d729df7ad814f031
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/trap_entry_exit.sh
@@ -0,0 +1,39 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# CoreSight emulated instruction entry and exit (exclusive)
+
+. "$(dirname "$0")/../lib/coresight_exception.sh"
+
+test_trap_entry_exit()
+{
+	local attempt result
+
+	# traploop reads ID_AA64ISAR0_EL1 from EL0. The kernel emulates MRS and
+	# advances the saved PC, so IRET must resume four bytes after the trap.
+	for attempt in 1 2 3; do
+		echo "Recording emulated instructions (attempt $attempt/3)"
+		if ! record_trace traploop 256; then
+			cat "$tmpdir/record.log"
+			echo "Failed to record the traploop workload"
+			return 1
+		fi
+		decode_trace || return 1
+		# Select MRS Xt, ID_AA64ISAR0_EL1; the low five bits select Xt.
+		check_exception_pairs "int.*insn: [01][[:xdigit:]] 06 38 d5" "iret" 4
+		result=$?
+
+		# An instruction page fault at MRS can also match the opcode filter.
+		# Retry failed checks to tolerate such transient faults.
+		case $result in
+		0) return 0 ;;
+		1|2) continue ;;
+		*) return "$result" ;;
+		esac
+	done
+
+	echo "FAIL: No valid trap pair after three recordings"
+	return 1
+}
+
+setup_exception_test || exit $?
+test_trap_entry_exit

-- 
2.34.1


