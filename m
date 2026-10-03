Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAC9CA5FEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=el7RdsuPQmPVCa/coAHdRCW5aUIql/HQngm8YsWnGFg=; b=FAUJU67OVdeLyc7sBLB+CpR3Ac
	eqI/qwR6XLHfPyDNxcOw44TNG8uu5FloKbftg2fz/XeaYu6s9mygTWQsdrNhm2937bJMKmG8E16jb
	CSm8dmSHklalMBfOXCJPiMrCaHUgfHHB80KgJ0BG+FOltQNejUE3Z/AucxDVnKaT4YUy+WiiV5Ejx
	QXKHLZ6jq/Fo91xh/upQ9UV7zhM7k++fQy3l889zPUicmyTOxUv9TJ/IFQ6kT6a3axYkGj6k90MtH
	hZ8Ur52JiV7IjfVY5THQaZ8uhvzn4MriGNbdKEG6vyFuGDe59FnNyy5u4oYVQvMvaaVYzRco35udc
	YBIyd++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVk-0000000CnOv-2fFu;
	Sat, 03 Oct 2026 00:21:56 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVd-0000000CnE2-0gke
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:50 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2e2d3a3ff86so187185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986908; x=1791591708; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el7RdsuPQmPVCa/coAHdRCW5aUIql/HQngm8YsWnGFg=;
        b=rp0Rfc4mOVwseK0F0PuRaZju3/ulCFO85YXVebD/QjFVhac7/9pAe3+YfD3fTsIzFp
         yQr6j7HAuGsi0ckDSLUEqne2TgdFANWU4WXKDIvlD2MgJIrtlo+s4uV7a1eDV9DgVZz7
         FJoaO4ZY47nUd7K0aKvhjyRDqK6UNsxHLoY+o1RqFddcSUhsdIr2s1qb7TjmakppuIX5
         cI+t67VtEJk6PCgDbJCEg1q+c84i+1R7PEamIAUBVV7d+ng9XpNi3oXKzfQmRIhpYpRt
         NuH/zPJ63cJ+lI7UyThZr7bsEPvMahe6DdU86hwacDgLuwFV4/Hxk0HDKRVNTcnvHbzP
         6d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986908; x=1791591708;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el7RdsuPQmPVCa/coAHdRCW5aUIql/HQngm8YsWnGFg=;
        b=Jp+KySzQiT6WDfBGYzg7FlaPIkpFPJqDj3GrC6aeiYvvzUPyBFJXkjVdV7U3V6hsL6
         pA0AmKmJ2FZ39eeGWp56gZHUullnh21Q7/+CcrHlw2U7DX0KWaoNLDrs+wWOwfP2MEIn
         sauysW6JARTMkiFZCuFo5QGzHQOWy4He6tSXDw0MF1fjaM6gNr4Rsv+PofRHIbalMHIE
         Vu89Y70/1hr79SEGCZMbM/JIAz8ftpYhmX6oLq5nmzjFgot0w6FUArn/Ji1FvBmASqDD
         HYkxsVXh+FUWCWOv1QU0Mg9eah8uL/3eEGU780AhAyytMgVyFtM2IjcqMCwYT0gwvdIj
         0+zg==
X-Forwarded-Encrypted: i=1; AKwUvBz2ZtJ/WeTZNAFHa5RB4PcGnIbYBFCmhZk1rweafiw6EWBB9qky07biVmrhMmQ03ZCOK0nSr4UH+cTIhQ9lHLPz@lists.infradead.org
X-Gm-Message-State: AFq9FYKkWW63bjBDWOoXh7+1WC2nZ5S9tBov21wCYTtN+eQAoRmFWMnw
	sUte+crj/xmvK+001ve1t152uQS/FyexeHQu7QLve3wl60XziRBkq9CCdHzeuKJtZQaNqPVX2JN
	zfcgnDMzVzLsH07UPxQp0bg==
X-Received: from plhb14.prod.google.com ([2002:a17:903:228e:b0:2dd:bff7:1e38])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:191:b0:2dd:c053:d741 with SMTP id d9443c01a7336-2e49b684cffmr41681905ad.40.1790986907988;
 Fri, 02 Oct 2026 17:21:47 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:18 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-16-jthoughton@google.com>
Subject: [PATCH v2 15/20] selftests/mm: Add HugeTLB vmemmap optimization
 stress test
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172149_757197_18B51963 
X-CRM114-Status: GOOD (  24.89  )
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

Add a script that stresses HugeTLB vmemmap optimization (HVO), in
particular on architectures that update the vmemmap in place while it
may be concurrently accessed:

  - Check that optimizing N folios frees exactly N * (vmemmap pages per
    folio - 1) vmemmap pages (per nr_memmap_pages and
    nr_memmap_boot_pages), and that restoring them gives them back.
  - Repeatedly optimize and restore folios by resizing the hugepage pool,
    while concurrently reading struct pages through /proc/kpageflags and
    /proc/kpagecount, compacting memory, and optionally reading
    page_owner and offlining/onlining memory blocks.
  - Do the same with fail_hugetlb_vmemmap_pte fault injection enabled,
    if available, to exercise the rollback and partially-optimized folio
    paths.

After each phase, the pool must shrink back to its original size and the
memmap accounting must return to its baseline. Finally, the kernel log
must not contain warnings or oopses.

Assisted-by: LLM
Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/hugetlb_vmemmap_stress.sh    | 347 ++++++++++++++++++
 .../selftests/mm/ksft_hugetlb_vmemmap.sh      |   4 +
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 4 files changed, 357 insertions(+)
 create mode 100755 tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
 create mode 100755 tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index beacc0f87304..51d8fba80c03 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -149,6 +149,7 @@ TEST_PROGS += ksft_cow.sh
 TEST_PROGS += ksft_gup_test.sh
 TEST_PROGS += ksft_hmm.sh
 TEST_PROGS += ksft_hugetlb.sh
+TEST_PROGS += ksft_hugetlb_vmemmap.sh
 TEST_PROGS += ksft_hugevm.sh
 TEST_PROGS += ksft_kmemleak_confirm.sh
 TEST_PROGS += ksft_kmemleak_dedup.sh
@@ -180,6 +181,7 @@ TEST_FILES += test_hmm.sh
 TEST_FILES += va_high_addr_switch.sh
 TEST_FILES += charge_reserved_hugetlb.sh
 TEST_FILES += hugetlb_reparenting_test.sh
+TEST_FILES += hugetlb_vmemmap_stress.sh
 TEST_FILES += test_page_frag.sh
 TEST_FILES += run_vmtests.sh
 
diff --git a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
new file mode 100755
index 000000000000..94357a4a45c2
--- /dev/null
+++ b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
@@ -0,0 +1,347 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Stress test for HugeTLB vmemmap optimization (HVO).
+#
+# Phases:
+#   1. accounting: allocate N hugepages, check that nr_memmap_pages +
+#      nr_memmap_boot_pages drops by exactly N * (vmemmap pages per folio - 1),
+#      then free them and check it returns to the baseline.
+#   2. stress: churn the pool (optimize/restore) while concurrently reading
+#      struct pages (/proc/kpageflags, /proc/kpagecount), compacting memory,
+#      and optionally reading page_owner and offlining/onlining memory.
+#   3. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
+#      both the optimize rollback and the restore (partial HVO) paths.
+#
+# After each phase the pool is drained back to its original size, memmap
+# accounting must be back at the phase's baseline, and the kernel log must
+# not contain warnings/oopses.
+#
+# The fault-injection phases require CONFIG_FAIL_HUGETLB_VMEMMAP and
+# CONFIG_FAULT_INJECTION_DEBUG_FS, and are skipped otherwise.
+
+set -u
+
+KSFT_PASS=0
+KSFT_FAIL=1
+KSFT_SKIP=4
+
+size_kb=
+nr=16
+duration=60
+prob=20
+readers=4
+struct_page_size=64
+do_page_owner=0
+do_hotplug=0
+
+usage() {
+	cat <<EOF
+Usage: $0 [options]
+  -s KB     hugepage size in kB (default: default hugepage size)
+  -n N      number of hugepages to churn (default: $nr)
+  -t SEC    duration of each stress phase (default: $duration)
+  -p PCT    fault-injection probability in percent (default: $prob)
+  -j N      number of struct page reader processes (default: $readers)
+  -S BYTES  sizeof(struct page) (default: $struct_page_size)
+  -o        also read /sys/kernel/debug/page_owner during stress
+  -m        also offline/online memory blocks during stress (dissolves
+            free hugepages, exercising the restore path)
+
+For exact accounting checks, run on a hugepage size whose pool is
+initially empty (e.g. no boot-time reservations of that size).
+EOF
+	exit $KSFT_SKIP
+}
+
+while getopts "s:n:t:p:j:S:omh" opt; do
+	case $opt in
+	s) size_kb=$OPTARG ;;
+	n) nr=$OPTARG ;;
+	t) duration=$OPTARG ;;
+	p) prob=$OPTARG ;;
+	j) readers=$OPTARG ;;
+	S) struct_page_size=$OPTARG ;;
+	o) do_page_owner=1 ;;
+	m) do_hotplug=1 ;;
+	*) usage ;;
+	esac
+done
+
+log() { echo "# $*"; }
+skip() { echo "SKIP: $*"; exit $KSFT_SKIP; }
+
+failures=0
+fail() { echo "FAIL: $*"; failures=$((failures + 1)); }
+pass() { echo "PASS: $*"; }
+
+[ "$(id -u)" -eq 0 ] || skip "must be run as root"
+
+[ -r /proc/sys/vm/hugetlb_optimize_vmemmap ] ||
+	skip "HVO not supported (no vm.hugetlb_optimize_vmemmap)"
+[ "$(cat /proc/sys/vm/hugetlb_optimize_vmemmap)" = 1 ] ||
+	skip "HVO disabled (vm.hugetlb_optimize_vmemmap=0)"
+grep -q '^nr_memmap_pages ' /proc/vmstat ||
+	skip "no nr_memmap_pages in /proc/vmstat"
+
+[ -n "$size_kb" ] || size_kb=$(awk '/^Hugepagesize:/ {print $2}' /proc/meminfo)
+hp_dir=/sys/kernel/mm/hugepages/hugepages-${size_kb}kB
+[ -d "$hp_dir" ] || skip "no ${size_kb}kB hugepages"
+
+page_size=$(getconf PAGESIZE)
+vmemmap_pages=$(( size_kb * 1024 / page_size * struct_page_size / page_size ))
+freed_per_folio=$(( vmemmap_pages - 1 ))
+[ "$freed_per_folio" -gt 0 ] ||
+	skip "${size_kb}kB hugepages are not HVO-optimizable"
+
+dbgfs=/sys/kernel/debug
+mountpoint -q $dbgfs || mount -t debugfs none $dbgfs 2>/dev/null
+
+orig_nr=$(cat "$hp_dir/nr_hugepages")
+target_nr=$(( orig_nr + nr ))
+marker="hvo-stress-$$-$(date +%s)"
+tmpdir=$(mktemp -d)
+pids=()
+
+log "hugepage size ${size_kb}kB, page size $page_size"
+log "struct page size $struct_page_size"
+log "vmemmap pages/folio: $vmemmap_pages ($freed_per_folio freed by HVO)"
+log "pool: $orig_nr initially, churning between $orig_nr and $target_nr"
+[ "$orig_nr" -eq 0 ] ||
+	log "WARNING: pool not initially empty, accounting may be inexact"
+
+memmap_total() {
+	awk '/^nr_memmap_(boot_)?pages / {s += $2} END {print s + 0}' \
+		/proc/vmstat
+}
+
+set_nr() {
+	echo "$1" > "$hp_dir/nr_hugepages" 2>/dev/null
+	cat "$hp_dir/nr_hugepages"
+}
+
+# Shrink the pool back to orig_nr. Restore may transiently fail (e.g. with
+# fault injection active), so retry for a while.
+drain() {
+	local i cur surplus
+
+	for i in $(seq 20); do
+		# Pages whose vmemmap could not be restored are kept as free
+		# surplus pages, which shrinking nr_hugepages does not free.
+		# Writing the current size converts them back to persistent
+		# pages first.
+		set_nr "$(cat "$hp_dir/nr_hugepages")" > /dev/null
+		cur=$(set_nr "$orig_nr")
+		[ "$cur" -eq "$orig_nr" ] && return 0
+		sleep 1
+	done
+	surplus=$(cat "$hp_dir/surplus_hugepages")
+	fail "pool stuck at $cur hugepages ($surplus surplus)," \
+		"expected $orig_nr"
+	return 1
+}
+
+fa_dir() { echo "$dbgfs/$1"; }
+
+fa_enable() {
+	local d
+	d=$(fa_dir "$1")
+	echo 0 > "$d/verbose"
+	echo N > "$d/task-filter"
+	echo 1 > "$d/interval"
+	echo 1000000 > "$d/times"
+	echo "$prob" > "$d/probability"
+}
+
+# Disable and print the number of injected failures.
+fa_disable() {
+	local d left
+	d=$(fa_dir "$1")
+	echo 0 > "$d/probability"
+	left=$(cat "$d/times")
+	echo 0 > "$d/times"
+	echo $(( 1000000 - left ))
+}
+
+check_dmesg() {
+	local bad pat
+
+	pat='WARNING:|BUG[: ]|Oops|Unable to handle kernel'
+	pat+='|Internal error|KASAN:|UBSAN:'
+	pat+='|list_(add|del) corruption|page dumped because'
+	bad=$(dmesg | sed -n "/$marker/,\$p" | grep -E "$pat")
+	if [ -n "$bad" ]; then
+		fail "kernel log reports problems:"
+		echo "$bad" | head -20 | sed 's/^/#   /'
+	fi
+}
+
+## Workers
+
+churn() {
+	while :; do
+		set_nr "$target_nr" > /dev/null
+		set_nr "$orig_nr" > /dev/null
+	done
+}
+
+kpage_reader() {
+	while :; do
+		dd if=/proc/kpageflags of=/dev/null bs=4M status=none
+		dd if=/proc/kpagecount of=/dev/null bs=4M status=none
+	done
+}
+
+compactor() {
+	while :; do
+		echo 1 > /proc/sys/vm/compact_memory
+		sleep 1
+	done
+}
+
+page_owner_reader() {
+	while :; do
+		cat $dbgfs/page_owner > /dev/null
+	done
+}
+
+hotplugger() {
+	local blk state removable
+
+	while :; do
+		for blk in /sys/devices/system/memory/memory*; do
+			state=$(cat "$blk/state" 2>/dev/null)
+			removable=$(cat "$blk/removable" 2>/dev/null || echo 1)
+			[ "$state" = online ] || continue
+			[ "$removable" = 1 ] || continue
+			echo "$blk" >> "$tmpdir/hotplug"
+			# A signal aborts a pending offline_pages().
+			timeout 10 sh -c "echo offline > $blk/state" 2>/dev/null
+			echo online > "$blk/state" 2>/dev/null
+			sleep 1
+		done
+	done
+}
+
+start_workers() {
+	local i
+
+	churn & pids+=($!)
+	for i in $(seq "$readers"); do
+		kpage_reader & pids+=($!)
+	done
+	compactor & pids+=($!)
+	if [ "$do_page_owner" -eq 1 ]; then
+		if [ -r $dbgfs/page_owner ]; then
+			page_owner_reader & pids+=($!)
+		else
+			log "page_owner not available, not reading it"
+		fi
+	fi
+	[ "$do_hotplug" -eq 1 ] && { hotplugger & pids+=($!); }
+}
+
+stop_workers() {
+	[ "${#pids[@]}" -gt 0 ] || return 0
+	kill "${pids[@]}" 2>/dev/null
+	wait "${pids[@]}" 2>/dev/null
+	pids=()
+}
+
+cleanup() {
+	local blk t
+
+	stop_workers
+	for t in fail_hugetlb_vmemmap_pte; do
+		[ -d "$(fa_dir $t)" ] && fa_disable $t > /dev/null
+	done
+	if [ -f "$tmpdir/hotplug" ]; then
+		sort -u "$tmpdir/hotplug" | while read -r blk; do
+			[ "$(cat "$blk/state")" = online ] ||
+				echo online > "$blk/state" 2>/dev/null
+		done
+	fi
+	set_nr "$orig_nr" > /dev/null
+	rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+trap 'exit $KSFT_FAIL' INT TERM
+
+# Run a stress phase. $1: name, $2: fault attr to enable ("" for none).
+stress_phase() {
+	local name=$1 fa=$2 base after injected
+
+	if [ -n "$fa" ] && [ ! -d "$(fa_dir "$fa")" ]; then
+		echo "SKIP: $name (no $(fa_dir "$fa"))"
+		return
+	fi
+
+	log "phase $name: ${duration}s"
+	base=$(memmap_total)
+	[ -n "$fa" ] && fa_enable "$fa"
+	start_workers
+	sleep "$duration"
+	stop_workers
+	if [ -n "$fa" ]; then
+		injected=$(fa_disable "$fa")
+		log "$name: injected $injected failures"
+		[ "$injected" -gt 0 ] ||
+			log "WARNING: $name: no failures injected"
+	fi
+
+	drain || return
+	after=$(memmap_total)
+	if [ "$after" -ne "$base" ]; then
+		fail "$name: memmap pages $after after drain, expected $base"
+	else
+		pass "$name"
+	fi
+}
+
+accounting_phase() {
+	local base got added after expect
+
+	log "phase accounting"
+	base=$(memmap_total)
+	got=$(set_nr "$target_nr")
+	added=$(( got - orig_nr ))
+	if [ "$added" -le 0 ]; then
+		fail "accounting: could not allocate any ${size_kb}kB hugepages"
+		return
+	fi
+	[ "$added" -eq "$nr" ] || log "accounting: only allocated $added of $nr"
+
+	after=$(memmap_total)
+	expect=$(( base - added * freed_per_folio ))
+	if [ "$after" -ne "$expect" ]; then
+		fail "accounting: memmap pages $after after optimizing" \
+			"$added folios, expected $expect (baseline $base)"
+	else
+		pass "accounting: optimize freed $(( base - after ))" \
+			"vmemmap pages"
+	fi
+
+	drain || return
+	after=$(memmap_total)
+	if [ "$after" -ne "$base" ]; then
+		fail "accounting: memmap pages $after after restore," \
+			"expected $base"
+	else
+		pass "accounting: restore"
+	fi
+}
+
+echo "$marker" > /dev/kmsg
+
+accounting_phase
+stress_phase stress ""
+stress_phase pte-inject fail_hugetlb_vmemmap_pte
+
+check_dmesg
+
+if [ "$failures" -ne 0 ]; then
+	echo "FAILED: $failures check(s)"
+	exit $KSFT_FAIL
+fi
+echo "OK"
+exit $KSFT_PASS
diff --git a/tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh b/tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh
new file mode 100755
index 000000000000..905b75b2cfb4
--- /dev/null
+++ b/tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0
+
+./run_vmtests.sh -t hugetlb_vmemmap
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index a1b45a3dedae..8dcdee7be501 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -77,6 +77,8 @@ separated by spaces:
 	test transparent huge pages
 - hugetlb
 	test hugetlbfs huge pages
+- hugetlb_vmemmap
+	test the hugetlb vmemmap optimization
 - migration
 	invoke move_pages(2) to exercise the migration entry code
 	paths in the kernel
@@ -312,6 +314,8 @@ echo "$enable_soft_offline" > /proc/sys/vm/enable_soft_offline
 CATEGORY="hugetlb" run_test ./hugetlb-read-hwpoison
 fi
 
+CATEGORY="hugetlb_vmemmap" run_test ./hugetlb_vmemmap_stress.sh
+
 if [ $VADDR64 -ne 0 ]; then
 	# va high address boundary switch test
 	CATEGORY="hugevm" run_test bash ./va_high_addr_switch.sh
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


