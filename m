Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E53C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJFJ/K9bRhHbh9aObqDCWyeE1pcCmkJcXdgq+xqodbk=; b=EP13dcZ8sSkE8Ax+rB5cDEiIr1
	WhbhWpeRyf7KKSvTQ0VV9gaDCMYcjAkx7lqtbXoFowrITaaHyP5tFXMdZy1TNYD8miULbF6SWVKfm
	2NrKipEEp6OZWwNPd0bErRMJ9c9s2BPsbG3bpCO5gG0fPa4EF+dwcblvtCqjmUQwmzuX+wA6Ajv6/
	MtoaRYDK7uVj0+irnmK+Rq8BHn3RtEHIHMn1wFYhdP0lDbsrbP04f2MuDD5XzowWe7aWk4jn/tgs2
	MuPqiltLgVKCXv4kFQ50OhGqq2B+enDtkSu096Irb4oO1Un1oVxZ941QfSD5rERoW/PPv/RjCL6Wh
	vSBnPj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyuC-0000000FGkl-0pMm;
	Sat, 17 Jan 2026 05:31:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyt4-0000000FFEE-1zLZ
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 17 Jan 2026 05:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qJFJ/K9bRhHbh9aObqDCWyeE1pcCmkJcXdgq+xqodbk=; b=Vt3mUdrIqeLS5MeJvPdUH65VmR
	k4re6jyPM7yJ7AmAGCPzmjp+teikIOlD5xIosplp16o7OtCNRWlQHUzCLzKHHoCIIOKyEUJhsQems
	KielssO/henEkDliJHmfsPm8DMGgcbAY2mcXf6dzElTz/lb0+KjHPPAIzMhXudD6ftlt15Smz4Ich
	b0mcsGUM+lRdOCwLf8/0jchvp1JgsnG0zLqYSXavLrqZysKvp1sqIV1taB1z0QQgtpa7svywWmEyK
	XWzS9Bvxv2n1YK99PyTmGJToYPfmdNoeZ1FmKjZhAmLZY9MeH+OD5rt/QWgPHFyU2Hi+g7SHvR+9K
	eVJ74j3w==;
Received: from mail-dl1-f73.google.com ([74.125.82.73])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysw-00000009siw-3QP3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:30:12 +0000
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12339eea50bso15301102c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627803; x=1769232603; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJFJ/K9bRhHbh9aObqDCWyeE1pcCmkJcXdgq+xqodbk=;
        b=px1xCB62YQs3CBCF4X02JRc5LVHFF6ilAFRtWrTUiVQZmc5xQLEBlJEPS6nzfsLTWj
         bqxRxKVHzI72xYSLP425glGME+kcEJIUCM3t9oN0L/V3VMsDZGXGrYblPEUyY4YR3NUS
         Xe3qBsQCrBS2j76OFqpzxpJVyUmwunc2abBBwTdDdz0Dco1ybGL2xroi8QKsnerfZmMc
         6NR3X2M7JwEcUtuf8Ik2Q1VK+4Te7WDylNyaOjCYYHWv9vmf8qsofTku6sgI2Phtc21k
         +gL+K/hP/a3tCkaHQKUd5joVGgZ/o4r8DcL3PYAos5hd/DNHthG8EIulXldOZc3jz7eY
         0vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627803; x=1769232603;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJFJ/K9bRhHbh9aObqDCWyeE1pcCmkJcXdgq+xqodbk=;
        b=Yxyba5jPuw9ja2nv4gXw2vQIf0UPpQDAE4Ixi//Zk/xmgl9X7KQGdO06P+FEmcI7Tv
         bPeQc3T4T1KK4gM7iWhFZosiLZtrWjX5eZvXPpcdeRsHSg+zk4SKnixz37BcyQfpkpKr
         GDt8sqrE2/Ad/zPTWRtzn0P/2qGP9AyugVs9We1vNwKtHyN0S6s0cU+b/T3o1IB8JTR/
         4jYrJUPQr0Z0kbhboQixjQSOaFELSX77mOiSJbPsPSEblJeKl1QxsDPXIKDsFFP3Os4X
         v9+aIWux65zNaHWvxZEXJITx3IBJLBvaFvyt2CS3Y0WAQoIUP8JczMLbNQurXlGvO6cL
         w38w==
X-Forwarded-Encrypted: i=1; AJvYcCUcVNFhhxNRGmsDaoPHoohfk9PLb3bzcRuRpOR+BnOeTvFvkuYXmamurdkhjSvY2vOINT2tyg6yc4qlz20aKSE1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx087Xsyx5HxQHNsQ1tHAWTIXz8kanEOQC0AFftUhfTINGxL928
	Fp3iEHZPoAKUruR/IvoKt8iM6Cm5dbS3nA96WeJw8+Ex4v4Guf7iTTdc47VTq8mfnf5BwdBedln
	yiHBKcFRYyA==
X-Received: from dlbqc7.prod.google.com ([2002:a05:7023:a87:b0:11d:cfa0:5ddf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6886:b0:11b:9386:a3c3
 with SMTP id a92af1059eb24-1244b395f30mr4327064c88.46.1768627802526; Fri, 16
 Jan 2026 21:30:02 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:49 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-24-irogers@google.com>
Subject: [PATCH v1 23/23] perf machine: Add inline information to frame
 pointer and LBR callchains
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_053008_570456_3D57B3CC 
X-CRM114-Status: GOOD (  19.96  )
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

Use append_inlines in frame pointer and LBR cases. Update the
addr2line test to also test frame pointers. LBR is also updated but
inaccuracy in the branched to IP means the inline information is
missing in the leaf. Leave LBR callchains untested for now.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/addr2line_inlines.sh |  31 +++++-
 tools/perf/util/machine.c                   | 104 +++++++++++---------
 2 files changed, 86 insertions(+), 49 deletions(-)

diff --git a/tools/perf/tests/shell/addr2line_inlines.sh b/tools/perf/tests/shell/addr2line_inlines.sh
index 4a5b6f5be23d..ce30d9c7e0bf 100755
--- a/tools/perf/tests/shell/addr2line_inlines.sh
+++ b/tools/perf/tests/shell/addr2line_inlines.sh
@@ -21,8 +21,28 @@ trap_cleanup() {
 }
 trap trap_cleanup EXIT TERM INT
 
-test_inlinedloop() {
-    echo "Inline unwinding verification test"
+test_fp() {
+    echo "Inline unwinding fp verification test"
+    # Record data. Currently only dwarf callchains support inlined functions.
+    perf record --call-graph fp -e task-clock:u -o "${perf_data}" -- perf test -w inlineloop 1
+
+    # Check output with inline (default) and srcline
+    perf script -i "${perf_data}" --fields +srcline > "${perf_script_txt}"
+
+    # Expect the leaf and middle functions to occur on lines in the 20s, with
+    # the non-inlined parent function on a line in the 30s.
+    if grep -q "inlineloop.c:2. (inlined)" "${perf_script_txt}" &&
+       grep -q "inlineloop.c:3.$" "${perf_script_txt}"
+    then
+        echo "Inline unwinding fp verification test [Success]"
+    else
+        echo "Inline unwinding fp verification test [Failed missing inlined functions]"
+        err=1
+    fi
+}
+
+test_dwarf() {
+    echo "Inline unwinding dwarf verification test"
     # Record data. Currently only dwarf callchains support inlined functions.
     perf record --call-graph dwarf -e task-clock:u -o "${perf_data}" -- perf test -w inlineloop 1
 
@@ -34,14 +54,15 @@ test_inlinedloop() {
     if grep -q "inlineloop.c:2. (inlined)" "${perf_script_txt}" &&
        grep -q "inlineloop.c:3.$" "${perf_script_txt}"
     then
-        echo "Inline unwinding verification test [Success]"
+        echo "Inline unwinding dwarf verification test [Success]"
     else
-        echo "Inline unwinding verification test [Failed missing inlined functions]"
+        echo "Inline unwinding dwarf verification test [Failed missing inlined functions]"
         err=1
     fi
 }
 
-test_inlinedloop
+test_fp
+test_dwarf
 
 cleanup
 exit $err
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 841b711d970e..30d606fbf040 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -2090,6 +2090,59 @@ struct iterations {
 	u64 cycles;
 };
 
+static int append_inlines(struct callchain_cursor *cursor, struct map_symbol *ms, u64 ip,
+			bool branch, struct branch_flags *flags, int nr_loop_iter,
+			u64 iter_cycles, u64 branch_from)
+{
+	struct symbol *sym = ms->sym;
+	struct map *map = ms->map;
+	struct inline_node *inline_node;
+	struct inline_list *ilist;
+	struct dso *dso;
+	u64 addr;
+	int ret = 1;
+	struct map_symbol ilist_ms;
+	bool first = true;
+
+	if (!symbol_conf.inline_name || !map || !sym)
+		return ret;
+
+	addr = map__dso_map_ip(map, ip);
+	addr = map__rip_2objdump(map, addr);
+	dso = map__dso(map);
+
+	inline_node = inlines__tree_find(dso__inlined_nodes(dso), addr);
+	if (!inline_node) {
+		inline_node = dso__parse_addr_inlines(dso, addr, sym);
+		if (!inline_node)
+			return ret;
+		inlines__tree_insert(dso__inlined_nodes(dso), inline_node);
+	}
+
+	ilist_ms = (struct map_symbol) {
+		.maps = maps__get(ms->maps),
+		.map = map__get(map),
+	};
+	list_for_each_entry(ilist, &inline_node->val, list) {
+		ilist_ms.sym = ilist->symbol;
+		if (first) {
+			ret = callchain_cursor_append(cursor, ip, &ilist_ms,
+						      branch, flags, nr_loop_iter,
+						      iter_cycles, branch_from, ilist->srcline);
+		} else {
+			ret = callchain_cursor_append(cursor, ip, &ilist_ms, false,
+						      NULL, 0, 0, 0, ilist->srcline);
+		}
+		first = false;
+
+		if (ret != 0)
+			return ret;
+	}
+	map_symbol__exit(&ilist_ms);
+
+	return ret;
+}
+
 static int add_callchain_ip(struct thread *thread,
 			    struct callchain_cursor *cursor,
 			    struct symbol **parent,
@@ -2170,6 +2223,11 @@ static int add_callchain_ip(struct thread *thread,
 	ms.maps = maps__get(al.maps);
 	ms.map = map__get(al.map);
 	ms.sym = al.sym;
+
+	if (append_inlines(cursor, &ms, ip, branch, flags, nr_loop_iter,
+			   iter_cycles, branch_from) == 0)
+		goto out;
+
 	srcline = callchain_srcline(&ms, al.addr);
 	err = callchain_cursor_append(cursor, ip, &ms,
 				      branch, flags, nr_loop_iter,
@@ -2888,49 +2946,6 @@ static int thread__resolve_callchain_sample(struct thread *thread,
 	return 0;
 }
 
-static int append_inlines(struct callchain_cursor *cursor, struct map_symbol *ms, u64 ip)
-{
-	struct symbol *sym = ms->sym;
-	struct map *map = ms->map;
-	struct inline_node *inline_node;
-	struct inline_list *ilist;
-	struct dso *dso;
-	u64 addr;
-	int ret = 1;
-	struct map_symbol ilist_ms;
-
-	if (!symbol_conf.inline_name || !map || !sym)
-		return ret;
-
-	addr = map__dso_map_ip(map, ip);
-	addr = map__rip_2objdump(map, addr);
-	dso = map__dso(map);
-
-	inline_node = inlines__tree_find(dso__inlined_nodes(dso), addr);
-	if (!inline_node) {
-		inline_node = dso__parse_addr_inlines(dso, addr, sym);
-		if (!inline_node)
-			return ret;
-		inlines__tree_insert(dso__inlined_nodes(dso), inline_node);
-	}
-
-	ilist_ms = (struct map_symbol) {
-		.maps = maps__get(ms->maps),
-		.map = map__get(map),
-	};
-	list_for_each_entry(ilist, &inline_node->val, list) {
-		ilist_ms.sym = ilist->symbol;
-		ret = callchain_cursor_append(cursor, ip, &ilist_ms, false,
-					      NULL, 0, 0, 0, ilist->srcline);
-
-		if (ret != 0)
-			return ret;
-	}
-	map_symbol__exit(&ilist_ms);
-
-	return ret;
-}
-
 static int unwind_entry(struct unwind_entry *entry, void *arg)
 {
 	struct callchain_cursor *cursor = arg;
@@ -2940,7 +2955,8 @@ static int unwind_entry(struct unwind_entry *entry, void *arg)
 	if (symbol_conf.hide_unresolved && entry->ms.sym == NULL)
 		return 0;
 
-	if (append_inlines(cursor, &entry->ms, entry->ip) == 0)
+	if (append_inlines(cursor, &entry->ms, entry->ip, /*branch=*/false, /*branch_flags=*/NULL,
+			   /*nr_loop_iter=*/0, /*iter_cycles=*/0, /*branch_from=*/0) == 0)
 		return 0;
 
 	/*
-- 
2.52.0.457.g6b5491de43-goog


