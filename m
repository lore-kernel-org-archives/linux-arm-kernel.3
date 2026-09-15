Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F467C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOU0OkP3dbgGRFSiMQnoiuQDJrKtF1NoZnFOq7/Pl9Y=; b=eDPWs3y9oaIHdzIY7O1FS0rAQ6
	UseftkbdaBmpXD21pIfuH5CSf5aJ0YRQY15z4yaFtxUZtfFyUuYKAX40xQPZUZK0yl+sxeTNcOzRO
	aK9ZMYt+8QKi+84CSbiWpEOCtnv5nUvt56yLUgAyHr0DK9AIkddwnSwT5YwyGU6Zfcwa7aDszTouD
	0ACKgAq7qMzVkFG3uAx++5DIgoeUXi0moEE9ljurzbqW3dcxL66amzVXp3p4kZZEqMT7Ly005IxFy
	hLeHTngRY5bKDndF3Kk9XbnPQ8235Db3eIi1/C7JHasaL3xmXTV/widGLx8LYFBagbJ6B7EQ0r0VN
	KrGzE6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQf-00000007IoT-3aMn;
	Tue, 15 Sep 2026 15:50:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQ8-00000007INY-2ORw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:50:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0E6515A1;
	Tue, 15 Sep 2026 08:50:03 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7D833F882;
	Tue, 15 Sep 2026 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487407; bh=kLfMsIfvtix9HRGhI1LbWAkQl/p2UK/wmVVuQM9xjoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fPNhmIBHWs2DNgdpfsazb1noO++NHgFJIhG9JAjP7l6I2W+o15TZApYA10Fs77kRg
	 QvwODn/gwYHrM7ujhpjvAElen4b5L32+5q+casCaNuAZUiHj8ui1nIjHFn29zLvtZ4
	 spWTlAsvPm/JZ7XVrd1WVh7Nma6d+sWQq/8BV0iA=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:49:10 +0100
Subject: [PATCH 24/25] perf test: Add CoreSight AUX sample decoding test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-24-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487341; l=6971;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kLfMsIfvtix9HRGhI1LbWAkQl/p2UK/wmVVuQM9xjoM=;
 b=FB94Ni0Ju4Zb0A/OTrxX2DMxUkZ5uO+G81x6c0Sb6i5exMXh1W/H2brTyYyoXP5Isn/GDHyRW
 IGeN4xsKL05AZgapYTSQTJK6FlLDIjboWjOeyruPC3DoaUHjJVAfRWc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_085008_701885_AA132855 
X-CRM114-Status: GOOD (  20.41  )
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

Add a shell test that records the brstack workload with 8 KiB AUX
samples attached to cycle events. Pin the workload to a CPU with a TRBE
sink and use per-thread recording with trace timestamps and context IDs
disabled, exercising decoding with the owning sample's context.

Check branch stacks and callchains with --itrace=L4, L64, G3 and G3L64.
Require at least one sample to reach both requested depths, with all
callchain frames belonging to the workload, and reject samples exceeding
either limit. Use a callchain depth of three to match the nested calls
in brstack.

Compare with AUX decoding enabled and disabled to verify that adding
history preserves the original PMU samples.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/tests/shell/coresight/aux_sample.sh | 189 +++++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/aux_sample.sh b/tools/perf/tests/shell/coresight/aux_sample.sh
new file mode 100755
index 0000000000000000000000000000000000000000..887ad6a085eacdfd192db3863fbb61dae1aa19b5
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/aux_sample.sh
@@ -0,0 +1,189 @@
+#!/bin/bash -e
+# SPDX-License-Identifier: GPL-2.0
+# CoreSight AUX samples with callchains and branch stacks (exclusive)
+
+export LC_ALL=C
+
+skip()
+{
+	echo "[Skip] $1"
+	exit 2
+}
+
+perf list pmu | grep -q 'cs_etm//' || skip "cs_etm is not available"
+perf check feature -q libopencsd || skip "perf was built without OpenCSD"
+[ "$(id -u)" = 0 ] || skip "No root permission"
+command -v taskset >/dev/null || skip "taskset is not available"
+
+# AUX sample now supports per CPU sink (e.g., TRBE). Select a usable CPU
+# and name its sink explicitly to avoid a shared sink.
+sink=
+for dev in /sys/bus/coresight/devices/trbe[0-9]*; do
+	[ -d "$dev" ] || continue
+	name=${dev##*/}
+	cpu=${name#trbe}
+	[ -e "/sys/bus/event_source/devices/cs_etm/cpu$cpu" ] || continue
+	if taskset -c "$cpu" true 2>/dev/null; then
+		sink=$name
+		break
+	fi
+done
+[ -n "$sink" ] || skip "No usable TRBE CPU is available"
+
+tmpdir=$(mktemp -d /tmp/perf-cs-aux-sample.XXXXXX)
+
+cleanup()
+{
+	rm -rf "$tmpdir"
+}
+
+trap cleanup EXIT
+trap 'exit 1' TERM INT
+
+fail()
+{
+	echo "$1" >&2
+	cat "$tmpdir/stderr" >&2
+	exit 1
+}
+
+cf="$tmpdir/ctl"
+af="$tmpdir/ack"
+mkfifo "$cf" "$af"
+
+# Disable trace timestamps and context IDs to use the owning sample's context.
+# Use a per-thread mmap so the explicit sink is only used on the pinned CPU.
+if ! taskset -c "$cpu" perf record -o "$tmpdir/data" --aux-sample=8192 \
+	-e "{cs_etm/@$sink,timestamp=0,contextid=0/u,cycles/period=100003/u}" \
+	--per-thread -D -1 --control fifo:"$cf","$af" -- \
+	perf test --record-ctl fifo:"$cf","$af" -w brstack 1000000 \
+	>/dev/null 2>"$tmpdir/stderr"; then
+	# Kernels without snapshot_aux reject the sampling event at open time.
+	if grep -Eq 'sys_perf_event_open.*event \(.*cycles.*\): Invalid argument' \
+		"$tmpdir/stderr"; then
+		skip "Kernel does not accept CoreSight AUX sampling"
+	fi
+	fail "Failed to record CoreSight AUX samples"
+fi
+
+perf evlist -v -i "$tmpdir/data" >"$tmpdir/evlist" 2>"$tmpdir/stderr" ||
+	fail "Failed to read AUX sample attributes"
+grep -Eq 'sample_type:.*\|AUX(,|\|).*aux_sample_size: 8192(,|$)' \
+	"$tmpdir/evlist" || fail "Missing AUX sample attributes"
+
+check_history()
+{
+	local options=$1
+	local max_branches=$2
+	local max_callchains=$3
+	local output="$tmpdir/script-$options"
+
+	perf script -i "$tmpdir/data" --itrace="$options" \
+		-F comm,pid,tid,cpu,event,ip,sym,brstack >"$output" \
+		2>"$tmpdir/stderr" || fail "Failed to decode AUX samples with $options"
+
+	# Some windows may contain incomplete trace. Require at least one cycle
+	# sample to reach both requested depths, and reject any that exceed them.
+	if ! awk -v max_branches="$max_branches" \
+		-v max_callchains="$max_callchains" '
+		function check_sample() {
+			if (in_sample == 0) {
+				return
+			}
+
+			if (branch_entries > max_branches || callchain_frames > max_callchains) {
+				depth_exceeded = 1
+			}
+
+			# Both depths must be reached in the same sample, with all
+			# callchain frames belonging to the brstack workload.
+			if (branch_entries == max_branches &&
+			    callchain_frames == max_callchains &&
+			    workload_frames == max_callchains) {
+				found_sample = 1
+			}
+
+			branch_entries = 0
+			callchain_frames = 0
+			workload_frames = 0
+			in_sample = 0
+		}
+		{
+			# A blank line marks the end of a sample.
+			if (NF == 0) {
+				check_sample()
+				next
+			}
+
+			# Sample header: comm pid/tid [cpu] event ...
+			# The event may include a PMU prefix and configuration terms.
+			if ($4 ~ /(^|\/)cycles([,\/:]|$)/) {
+				check_sample()
+				in_sample = 1
+			}
+			if (in_sample == 0) {
+				next
+			}
+
+			# Each branch entry is a field in 0xFROM/0xTO/... form.
+			for (i = 1; i <= NF; i++) {
+				if ($i ~ /^0x[[:xdigit:]]+\/0x[[:xdigit:]]+\//) {
+					branch_entries++
+				}
+			}
+
+			# Callchain rows start with a hexadecimal IP, then a symbol.
+			if ($1 ~ /^[[:xdigit:]]+$/) {
+				callchain_frames++
+				if ($2 ~ /^brstack(_|$)/) {
+					workload_frames++
+				}
+			}
+		}
+		END {
+			# Account for the last sample even without a trailing blank line.
+			check_sample()
+
+			if (depth_exceeded != 0) {
+				print "AUX sample history exceeds the requested depth" > "/dev/stderr"
+				exit 1
+			}
+			if (found_sample == 0) {
+				printf "No sample has %d branches and %d workload callchain frames\n", \
+					max_branches, max_callchains > "/dev/stderr"
+				exit 1
+			}
+			exit 0
+		}
+	' "$output"; then
+		head -n 80 "$output" >&2
+		fail "Missing AUX sample history or incorrect depth with $options"
+	fi
+}
+
+check_sample_identity()
+{
+	local fields=comm,pid,tid,cpu,event,ip
+
+	# Hiding history must leave exactly the original PMU samples, including
+	# their PID/TID, CPU and sampled IP, with no synthesized events. Per-thread
+	# recording does not require sample timestamps.
+	perf script -i "$tmpdir/data" --no-itrace -F "$fields" \
+		>"$tmpdir/original" 2>"$tmpdir/stderr" || fail "Failed to read cycle samples"
+	perf script -i "$tmpdir/data" --itrace=L4 -F "$fields" \
+		>"$tmpdir/decoded" 2>"$tmpdir/stderr" || fail "Failed to decode cycle samples"
+	diff -u "$tmpdir/original" "$tmpdir/decoded" ||
+		fail "AUX decoding changed the original cycle samples"
+}
+
+check_history L4 4 0
+check_history L64 64 0
+
+# brstack -> brstack_bench -> brstack_foo -> brstack_bar provides three
+# nested calls whose caller frames can be reconstructed from an AUX window.
+check_history G3 0 3
+check_history G3L64 64 3
+
+check_sample_identity
+
+echo "CoreSight AUX sample decoding: PASS"

-- 
2.34.1


