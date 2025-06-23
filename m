Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3A8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=siFLzwIAOMTOqClC7suVWWbB5nxNFCIXsyRndF3ikEw=; b=CZuL9A+124VJEA2fPd4xQzUqEw
	VUbWH9gUyWZYBki55BEyBa74YJp1+hAaCe2VbxE1bUnGjyAOjfnpghoNa9B2vMz54ed/ub1r4TqlF
	A7WOCuhm/fL6y7Z5hqa4y4uin+v2ba+frXx7+/5lKlOE8FEx7YIs2YDr7FNDMcmhZ4T4+1cmxW3t0
	I1u8cGmJzAUFGmKMtGQvkuUOnPW14N+K1QgyGtmZ/A6C1Xlxku2xsm9urA9td/x+xoO56LPMOfO72
	JhIIirzL94fm6Urb1JNpbsWebyIBTiFb2cqwnPOM5CSZV7B+iYA0wNjNZMe7Nl/c5vllrrHuprouI
	XUw1jl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdCe-000000027nP-00Uq;
	Mon, 23 Jun 2025 09:11:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTd2X-000000025aP-24Vp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:00:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-453426170b6so28970295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750669232; x=1751274032; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=siFLzwIAOMTOqClC7suVWWbB5nxNFCIXsyRndF3ikEw=;
        b=K9t/21VoMp3Z16UqCYJ0yk+uKthrde3DzHPpogsoguA3o4bF7xRAhkDKNu95Spatst
         rUz10jBwrrD7F5nvoeIGT1gtEOmI3+pCFwr75BPPTisJgvXuWNU2Ak1osQXtK9dt5k99
         HFc5T9ZN51bwKOYzUx17RvPpPMsXie739fwldqwq/3oqVkhQb5oBm9l9TmY533e1+ahN
         vgC1AF8frGuEjHp7BFHpvtrhPJw2TGDu2YZ78mxvqwxwmLFBSgVY+uXGOm9RU2RiXhBx
         F/ISz3LV13Nt9EPbwZY1b/EkF0B6llrySpJ9wdnjuqt5KN2cNAgjP8BB8NSdxdebvgsi
         UJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669232; x=1751274032;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siFLzwIAOMTOqClC7suVWWbB5nxNFCIXsyRndF3ikEw=;
        b=ltsO4m7iOd6SJVgXRkAoQMoc+4yYJkhhQUxYNxQm/EBfWz+ryDuCT3/IAlNTkqz0T7
         XkZX2oC9RPyu8LgEEMon5Dy6f2pLjYAbgzrpie7XW4vbfg+YakQ4SIfyihtSGnMbB1zt
         vbTUiVJVvgEa2QGMr8Y9jKC1tyI3NqjjwLhrQmHi54NsvFs1gsRmZp7ur8w41Rb1IGx+
         7vluQ6nDVDnfTrgwLv9xp2Yuz9W7GX2yJWnkLzWtrzowdiLO6nHHcGjgyKfi6kAxpVqQ
         +Luh2cwtigEOz1U1C5q/UfVPFdxv0A050NT/d9CzlZZQsD5FyO3pmU1odISSNfhMi3sf
         ojSg==
X-Forwarded-Encrypted: i=1; AJvYcCX/NnnIxxNZM+1MRg7OGxs+f0xv40sKZqEAV47w3BXU8WuicqRqw1RLu5OlljKkoJ6wg3C/d7AfG56/ntdcQjA7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywla6VcAbmmNKKKyZPHptonzhAjl120KRS8zN7VQV01CliXEO7q
	WBgbT0MWqzUsYTVMTTxhcWVA6gPXg+mSgprMaWAxnw/WZkZnOzydmbibBu69HkMT5qo=
X-Gm-Gg: ASbGncvlSv+6QzPLdRk7LXUQE9vWIusp6FiBC3N0qInGkz7cectYZoz78FtKWP519wN
	S3M00dyT63wZd9Utq3hGE7fN4w+MmEWHdXUe8OyhP3l8qpog03xLrFtQBIjZBKup5MNLkC07uBu
	FV2QZcfrH4MfGjbpiyTyI0Y+tYUmqZ4FUqcbSRYR2p2G5lOZIkzfMY5odUxzff/6MtiaqEqXGPN
	hXA1ifBkUJQTiG1jbbJfuHNZZ+KAHeVmW9eQC7MBaKmFiPjrCjScnH5ASyW6eu9z+CBULTw2leo
	WOJHo8zsBZXrFVjKonMrQ9HYS+386zA2XtXOSsRpnNlh8ciynn6/65NzU3b7bXpQ7RxPIYY=
X-Google-Smtp-Source: AGHT+IGkyqpAd4PKjweiZIrNYoNuQtSQVAILSe9BTXOL6u/AcWrW0AzZFAdpnr/1NYC99Pz/ubfMDw==
X-Received: by 2002:a05:6000:26c8:b0:3a5:8977:e0f8 with SMTP id ffacd0b85a97d-3a6d27e16f5mr9070564f8f.19.1750669231601;
        Mon, 23 Jun 2025 02:00:31 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f104d4sm9040043f8f.11.2025.06.23.02.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 23 Jun 2025 10:00:12 +0100
Subject: [PATCH] perf test: Change all remaining #!/bin/sh to #!/bin/bash
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-james-perf-bash-tests-v1-1-f572f54d4559@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJsXWWgC/x3M3QpAQBBA4VfRXJtiWDavIheLwSg/7WxS8u42l
 9/FOQ8oe2GFJnnA8yUqxx6RpwkMi9tnRhmjgTIyWUUFrm5jxZP9hL3TBQNrULSWqtzZsjaGILa
 n50nu/9t27/sBbwDWF2cAAAA=
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, Collin Funk <collin.funk1@gmail.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 bpf@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_020033_565506_DA702B99 
X-CRM114-Status: GOOD (  16.64  )
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

There are 43 instances of posix shell tests and 35 instances of bash. To
give us a single consistent language for testing in, replace
all #!/bin/sh to #!/bin/bash. Common sources that are included in both
different shells will now work as expected. And we no longer have to fix
up bashisms that appear to work when someone's system has sh symlinked
to bash, but don't work on other systems that have both shells
installed.

Although we could have chosen sh, it's not backwards compatible so it
wouldn't be possible to bulk convert without re-writing the existing
bash tests.

Choosing bash also gives us some nicer features including 'local'
variable definitions and regexes in if statements that are already
widely used in the tests.

It's not expected that there are any users with only sh available due to
the large number of bash tests that exist.

Discussed in relation to running shellcheck here:
https://lore.kernel.org/linux-perf-users/e3751a74be34bbf3781c4644f518702a7270220b.1749785642.git.collin.funk1@gmail.com/

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/perf-targz-src-pkg                          | 2 +-
 tools/perf/tests/shell/amd-ibs-swfilt.sh                     | 2 +-
 tools/perf/tests/shell/buildid.sh                            | 2 +-
 tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 2 +-
 tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 2 +-
 tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 2 +-
 tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 2 +-
 tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 2 +-
 tools/perf/tests/shell/diff.sh                               | 2 +-
 tools/perf/tests/shell/ftrace.sh                             | 2 +-
 tools/perf/tests/shell/lib/perf_has_symbol.sh                | 2 +-
 tools/perf/tests/shell/lib/probe_vfs_getname.sh              | 2 +-
 tools/perf/tests/shell/lib/setup_python.sh                   | 2 +-
 tools/perf/tests/shell/lib/waiting.sh                        | 2 +-
 tools/perf/tests/shell/list.sh                               | 2 +-
 tools/perf/tests/shell/lock_contention.sh                    | 2 +-
 tools/perf/tests/shell/perf-report-hierarchy.sh              | 2 +-
 tools/perf/tests/shell/probe_vfs_getname.sh                  | 2 +-
 tools/perf/tests/shell/record+probe_libc_inet_pton.sh        | 2 +-
 tools/perf/tests/shell/record+script_probe_vfs_getname.sh    | 2 +-
 tools/perf/tests/shell/record+zstd_comp_decomp.sh            | 2 +-
 tools/perf/tests/shell/record_bpf_filter.sh                  | 2 +-
 tools/perf/tests/shell/record_offcpu.sh                      | 2 +-
 tools/perf/tests/shell/record_sideband.sh                    | 2 +-
 tools/perf/tests/shell/script.sh                             | 2 +-
 tools/perf/tests/shell/stat+csv_summary.sh                   | 2 +-
 tools/perf/tests/shell/stat+shadow_stat.sh                   | 2 +-
 tools/perf/tests/shell/stat_all_pfm.sh                       | 2 +-
 tools/perf/tests/shell/stat_bpf_counters.sh                  | 2 +-
 tools/perf/tests/shell/stat_bpf_counters_cgrp.sh             | 2 +-
 tools/perf/tests/shell/test_arm_callgraph_fp.sh              | 2 +-
 tools/perf/tests/shell/test_arm_coresight.sh                 | 2 +-
 tools/perf/tests/shell/test_arm_coresight_disasm.sh          | 2 +-
 tools/perf/tests/shell/test_arm_spe.sh                       | 2 +-
 tools/perf/tests/shell/test_arm_spe_fork.sh                  | 2 +-
 tools/perf/tests/shell/test_bpf_metadata.sh                  | 2 +-
 tools/perf/tests/shell/test_intel_pt.sh                      | 2 +-
 tools/perf/tests/shell/trace+probe_vfs_getname.sh            | 2 +-
 tools/perf/tests/shell/trace_btf_enum.sh                     | 2 +-
 tools/perf/tests/shell/trace_exit_race.sh                    | 2 +-
 tools/perf/tests/shell/trace_record_replay.sh                | 2 +-
 tools/perf/tests/shell/trace_summary.sh                      | 2 +-
 tools/perf/tests/tests-scripts.c                             | 2 +-
 43 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/tools/perf/tests/perf-targz-src-pkg b/tools/perf/tests/perf-targz-src-pkg
index b3075c168cb2..52a90e6bd8af 100755
--- a/tools/perf/tests/perf-targz-src-pkg
+++ b/tools/perf/tests/perf-targz-src-pkg
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 # Test one of the main kernel Makefile targets to generate a perf sources tarball
 # suitable for build outside the full kernel sources.
diff --git a/tools/perf/tests/shell/amd-ibs-swfilt.sh b/tools/perf/tests/shell/amd-ibs-swfilt.sh
index 83937aa687cc..7045ec72ba4c 100755
--- a/tools/perf/tests/shell/amd-ibs-swfilt.sh
+++ b/tools/perf/tests/shell/amd-ibs-swfilt.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # AMD IBS software filtering
 
 echo "check availability of IBS swfilt"
diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell/buildid.sh
index 3383ca3399d4..d2eb213da01d 100755
--- a/tools/perf/tests/shell/buildid.sh
+++ b/tools/perf/tests/shell/buildid.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # build id cache operations
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/coresight/asm_pure_loop.sh b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
index c63bc8c73e26..0301904b9637 100755
--- a/tools/perf/tests/shell/coresight/asm_pure_loop.sh
+++ b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/bash -e
 # CoreSight / ASM Pure Loop (exclusive)
 
 # SPDX-License-Identifier: GPL-2.0
diff --git a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh b/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
index 8e29630957c8..1f765d69acc3 100755
--- a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
+++ b/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/bash -e
 # CoreSight / Memcpy 16k 10 Threads (exclusive)
 
 # SPDX-License-Identifier: GPL-2.0
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
index 0c4c82a1c8e1..7f43a93a2ac2 100755
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
+++ b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/bash -e
 # CoreSight / Thread Loop 10 Threads - Check TID (exclusive)
 
 # SPDX-License-Identifier: GPL-2.0
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
index d3aea9fc6ced..a94d2079ed06 100755
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
+++ b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/bash -e
 # CoreSight / Thread Loop 2 Threads - Check TID (exclusive)
 
 # SPDX-License-Identifier: GPL-2.0
diff --git a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
index 7429d3a2ae43..cb3e97a0a89f 100755
--- a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
+++ b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/bash -e
 # CoreSight / Unroll Loop Thread 10 (exclusive)
 
 # SPDX-License-Identifier: GPL-2.0
diff --git a/tools/perf/tests/shell/diff.sh b/tools/perf/tests/shell/diff.sh
index e05a5dc49479..fe05fdebcab5 100755
--- a/tools/perf/tests/shell/diff.sh
+++ b/tools/perf/tests/shell/diff.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf diff tests
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/ftrace.sh b/tools/perf/tests/shell/ftrace.sh
index c243731d2fbf..7f8aafcbb761 100755
--- a/tools/perf/tests/shell/ftrace.sh
+++ b/tools/perf/tests/shell/ftrace.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf ftrace tests
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/lib/perf_has_symbol.sh b/tools/perf/tests/shell/lib/perf_has_symbol.sh
index 561c93b75d77..0b35cce0b13d 100644
--- a/tools/perf/tests/shell/lib/perf_has_symbol.sh
+++ b/tools/perf/tests/shell/lib/perf_has_symbol.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
 perf_has_symbol()
diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
index 58debce9ab42..88cd0e26d5f6 100644
--- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
 
 perf probe -l 2>&1 | grep -q probe:vfs_getname
diff --git a/tools/perf/tests/shell/lib/setup_python.sh b/tools/perf/tests/shell/lib/setup_python.sh
index c2fce1793538..a58e5536f2ed 100644
--- a/tools/perf/tests/shell/lib/setup_python.sh
+++ b/tools/perf/tests/shell/lib/setup_python.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
 if [ "x$PYTHON" = "x" ]
diff --git a/tools/perf/tests/shell/lib/waiting.sh b/tools/perf/tests/shell/lib/waiting.sh
index bdd5a7c71591..3a152892e077 100644
--- a/tools/perf/tests/shell/lib/waiting.sh
+++ b/tools/perf/tests/shell/lib/waiting.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
 tenths=date\ +%s%1N
diff --git a/tools/perf/tests/shell/list.sh b/tools/perf/tests/shell/list.sh
index 76a9846cff22..0c04b3159cef 100755
--- a/tools/perf/tests/shell/list.sh
+++ b/tools/perf/tests/shell/list.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf list tests
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/lock_contention.sh b/tools/perf/tests/shell/lock_contention.sh
index 30d195d4c62f..dde5bc737eb2 100755
--- a/tools/perf/tests/shell/lock_contention.sh
+++ b/tools/perf/tests/shell/lock_contention.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # kernel lock contention analysis test
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/perf-report-hierarchy.sh b/tools/perf/tests/shell/perf-report-hierarchy.sh
index 02e3b6aee4ed..e3c6f9a24f33 100755
--- a/tools/perf/tests/shell/perf-report-hierarchy.sh
+++ b/tools/perf/tests/shell/perf-report-hierarchy.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf report --hierarchy
 # SPDX-License-Identifier: GPL-2.0
 # Arnaldo Carvalho de Melo <acme@redhat.com> 
diff --git a/tools/perf/tests/shell/probe_vfs_getname.sh b/tools/perf/tests/shell/probe_vfs_getname.sh
index 0f52654c914a..5fe5682c28ce 100755
--- a/tools/perf/tests/shell/probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/probe_vfs_getname.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Add vfs_getname probe to get syscall args filenames (exclusive)
 
 # SPDX-License-Identifier: GPL-2.0
diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
index c4bab5b5cc59..cfad1bd7b780 100755
--- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
+++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # probe libc's inet_pton & backtrace it with ping (exclusive)
 
 # Installs a probe on libc's inet_pton function, that will use uprobes,
diff --git a/tools/perf/tests/shell/record+script_probe_vfs_getname.sh b/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
index 1ad252f0d36e..002f7037f182 100755
--- a/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Use vfs_getname probe to get syscall args filenames (exclusive)
 
 # Uses the 'perf test shell' library to add probe:vfs_getname to the system
diff --git a/tools/perf/tests/shell/record+zstd_comp_decomp.sh b/tools/perf/tests/shell/record+zstd_comp_decomp.sh
index 8929046e9057..f6b82223834e 100755
--- a/tools/perf/tests/shell/record+zstd_comp_decomp.sh
+++ b/tools/perf/tests/shell/record+zstd_comp_decomp.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Zstd perf.data compression/decompression
 
 # SPDX-License-Identifier: GPL-2.0
diff --git a/tools/perf/tests/shell/record_bpf_filter.sh b/tools/perf/tests/shell/record_bpf_filter.sh
index 4d6c3c1b7fb9..383574cb3bd3 100755
--- a/tools/perf/tests/shell/record_bpf_filter.sh
+++ b/tools/perf/tests/shell/record_bpf_filter.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf record sample filtering (by BPF) tests
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/record_offcpu.sh b/tools/perf/tests/shell/record_offcpu.sh
index 21a22efe08f5..860a2d6f4b75 100755
--- a/tools/perf/tests/shell/record_offcpu.sh
+++ b/tools/perf/tests/shell/record_offcpu.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf record offcpu profiling tests (exclusive)
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/record_sideband.sh b/tools/perf/tests/shell/record_sideband.sh
index ac70ac27d590..2182551873be 100755
--- a/tools/perf/tests/shell/record_sideband.sh
+++ b/tools/perf/tests/shell/record_sideband.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf record sideband tests
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/script.sh b/tools/perf/tests/shell/script.sh
index d3e2958d2242..7007f1cdf761 100755
--- a/tools/perf/tests/shell/script.sh
+++ b/tools/perf/tests/shell/script.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf script tests
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/stat+csv_summary.sh b/tools/perf/tests/shell/stat+csv_summary.sh
index 323123ff4d19..9a4353db3825 100755
--- a/tools/perf/tests/shell/stat+csv_summary.sh
+++ b/tools/perf/tests/shell/stat+csv_summary.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf stat csv summary test
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/stat+shadow_stat.sh b/tools/perf/tests/shell/stat+shadow_stat.sh
index 0c7d79a230ea..8824f445d343 100755
--- a/tools/perf/tests/shell/stat+shadow_stat.sh
+++ b/tools/perf/tests/shell/stat+shadow_stat.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf stat metrics (shadow stat) test
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/stat_all_pfm.sh b/tools/perf/tests/shell/stat_all_pfm.sh
index 4d004f777a6e..c08c186af2c4 100755
--- a/tools/perf/tests/shell/stat_all_pfm.sh
+++ b/tools/perf/tests/shell/stat_all_pfm.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf all libpfm4 events test
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/stat_bpf_counters.sh b/tools/perf/tests/shell/stat_bpf_counters.sh
index 95d2ad5d17c6..f43e28a136d3 100755
--- a/tools/perf/tests/shell/stat_bpf_counters.sh
+++ b/tools/perf/tests/shell/stat_bpf_counters.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf stat --bpf-counters test (exclusive)
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh b/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
index 2ec69060c42f..ff2e06c408bc 100755
--- a/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
+++ b/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf stat --bpf-counters --for-each-cgroup test
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/test_arm_callgraph_fp.sh b/tools/perf/tests/shell/test_arm_callgraph_fp.sh
index 9caa36130175..9172dd68a81d 100755
--- a/tools/perf/tests/shell/test_arm_callgraph_fp.sh
+++ b/tools/perf/tests/shell/test_arm_callgraph_fp.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Check Arm64 callgraphs are complete in fp mode
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index 573af9235b72..1c750b67d141 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Check Arm CoreSight trace data recording and synthesized samples (exclusive)
 
 # Uses the 'perf record' to record trace data with Arm CoreSight sinks;
diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index be2d26303f94..0dfb4fadf531 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Check Arm CoreSight disassembly script completes without errors (exclusive)
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/test_arm_spe.sh b/tools/perf/tests/shell/test_arm_spe.sh
index a69aab70dd8a..bb76ea88aa14 100755
--- a/tools/perf/tests/shell/test_arm_spe.sh
+++ b/tools/perf/tests/shell/test_arm_spe.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Check Arm SPE trace data recording and synthesized samples (exclusive)
 
 # Uses the 'perf record' to record trace data of Arm SPE events;
diff --git a/tools/perf/tests/shell/test_arm_spe_fork.sh b/tools/perf/tests/shell/test_arm_spe_fork.sh
index 8efeef9fb956..5bcca51c03ac 100755
--- a/tools/perf/tests/shell/test_arm_spe_fork.sh
+++ b/tools/perf/tests/shell/test_arm_spe_fork.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Check Arm SPE doesn't hang when there are forks
 
 # SPDX-License-Identifier: GPL-2.0
diff --git a/tools/perf/tests/shell/test_bpf_metadata.sh b/tools/perf/tests/shell/test_bpf_metadata.sh
index 11df592fb661..bc9aef161664 100755
--- a/tools/perf/tests/shell/test_bpf_metadata.sh
+++ b/tools/perf/tests/shell/test_bpf_metadata.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 #
 # BPF metadata collection test.
diff --git a/tools/perf/tests/shell/test_intel_pt.sh b/tools/perf/tests/shell/test_intel_pt.sh
index 32a9b8dcb200..8ee761f03c38 100755
--- a/tools/perf/tests/shell/test_intel_pt.sh
+++ b/tools/perf/tests/shell/test_intel_pt.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Miscellaneous Intel PT testing (exclusive)
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/trace+probe_vfs_getname.sh b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
index 5d5019988d61..7a0b1145d0cd 100755
--- a/tools/perf/tests/shell/trace+probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Check open filename arg using perf trace + vfs_getname (exclusive)
 
 # Uses the 'perf test shell' library to add probe:vfs_getname to the system
diff --git a/tools/perf/tests/shell/trace_btf_enum.sh b/tools/perf/tests/shell/trace_btf_enum.sh
index c37017bfeb5e..572001d75d78 100755
--- a/tools/perf/tests/shell/trace_btf_enum.sh
+++ b/tools/perf/tests/shell/trace_btf_enum.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf trace enum augmentation tests
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/trace_exit_race.sh b/tools/perf/tests/shell/trace_exit_race.sh
index 1e247693e756..db300cde94fb 100755
--- a/tools/perf/tests/shell/trace_exit_race.sh
+++ b/tools/perf/tests/shell/trace_exit_race.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf trace exit race
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/trace_record_replay.sh b/tools/perf/tests/shell/trace_record_replay.sh
index 6b4ed863c1ef..88d30a03dcec 100755
--- a/tools/perf/tests/shell/trace_record_replay.sh
+++ b/tools/perf/tests/shell/trace_record_replay.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf trace record and replay
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/shell/trace_summary.sh b/tools/perf/tests/shell/trace_summary.sh
index f9bb7f9388be..22e2651d5919 100755
--- a/tools/perf/tests/shell/trace_summary.sh
+++ b/tools/perf/tests/shell/trace_summary.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf trace summary (exclusive)
 # SPDX-License-Identifier: GPL-2.0
 
diff --git a/tools/perf/tests/tests-scripts.c b/tools/perf/tests/tests-scripts.c
index 1d5759d08141..684feed58254 100644
--- a/tools/perf/tests/tests-scripts.c
+++ b/tools/perf/tests/tests-scripts.c
@@ -85,7 +85,7 @@ static char *shell_test__description(int dir_fd, const char *name)
 	if (io.fd < 0)
 		return NULL;
 
-	/* Skip first line - should be #!/bin/sh Shebang */
+	/* Skip first line - should be #!/bin/bash Shebang */
 	if (io__get_char(&io) != '#')
 		goto err_out;
 	if (io__get_char(&io) != '!')

---
base-commit: edf2cadf01e8f2620af25b337d15ebc584911b46
change-id: 20250623-james-perf-bash-tests-88261a847552

Best regards,
-- 
James Clark <james.clark@linaro.org>


