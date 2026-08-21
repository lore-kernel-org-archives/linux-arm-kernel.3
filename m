Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60614C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghssS34122+SF9JGQaRPjJsmiH0qvioNjK1NWp3olSk=; b=f5SJKuCr4QGZBqCKsG0PVHxM/3
	fOK8X0BOgd5fVeiF0tZeIw8R0wPIuvPpN7PZDGjKuYhA2l8imL7aVgUiRAz2GIizFIXUZ0tQ8bIWd
	0dtRDUsIO+zDGbi/mNweIRRjaszCQYsdovcubRtcZeZEuetgzHXJwq4gjfIHaS8WaCjC5r5k/QJzA
	j6LuKLQ6oTeAU0r4mVocNZjIpO4mKfe6rPGzwyC5tk5qW6kN89UP7TyTqchIiv7gyrs39Tlozxy1X
	k5CH01O6OoIoG/wuvb+4Td14iWdcBsNXxis/TNSzDZ5au9FPXks+6yxqc3sHOlAuwikNztc3Gt2d1
	4P4IS4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtE-0000000Cxdd-08mh;
	Fri, 21 Aug 2026 09:50:20 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsg-0000000Cx9q-2BA3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso399088f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305785; x=1787910585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghssS34122+SF9JGQaRPjJsmiH0qvioNjK1NWp3olSk=;
        b=ti8OpiBMfLEWTN2K2uEzTLtlfDyYtA4MG8HK59Hh15ddLU+fO6Tvje1N4tkMk7JEYq
         INWJuO8/Uqdbmv5fiE6NTbho60FDYxVcCX1yFDJirgvmXm64BYJC5iMm/hYw5xoxHGaK
         A+ONiPpz1vNuQiJN1+j1BZ0dgDc3AT83XHQvTRXKO4Nb9nSCCtTLH9pA0CI/fUms7TlH
         DwKMvGT36nGdU8G9iswPMdFFtbU81gYYvYFMpwNnP31+FKbz1uC2rgslxAspAqV23nLq
         O47975z4JcuqZPZohrdJ1Y2L+AEtFZzy8UnQT7Mv8VvBI2XTLmx1A6iD9JPXfH36WEaL
         tEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305785; x=1787910585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghssS34122+SF9JGQaRPjJsmiH0qvioNjK1NWp3olSk=;
        b=QDotIzBu+LiiJRcDaZDEuxFtWmO/4NnwLo+B97dpEXfMfy+ayT5QlBzIJbX3w+QrJ8
         dwifRec5Ied+rCuxtZVwJxUOAT0Hx10cPrdFqftUDcjb9ILDKENxdt0Qxa2ZcvH7A9zF
         RwdOs9kjWoLY5EGybmM/xErPTwRC0MpLiJ5BjSJva+zpM+XXXLIA4N1Li0Q/HcP6qzdF
         h0Wrmi9dVYalYMXYxvebcyLx1nKn+LXpucahObhyr+k4+aCXatmvIrfJKf4xcc341HB0
         vYvPHI4tyMNGfyPT8xv/KaXiMwVr2E6+EEeQehd/Guj2IdGc5GcwHRxL6Y06exwXhBmM
         ODiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFUH1fxk2nKLgCmUWdKiXPN3RocnkYLpUbiR4RecAnghlWhT4P6uZ+/ULiD2ALh8gpcFBnVqIP9YRgXez9MP8F@lists.infradead.org
X-Gm-Message-State: AFuF++n9C/8n8y/I1+TOVAISgKljvb8seJpcFgqVV6pqObkfisu+UdIZ
	wfjrSnxB5YyQkRg6dYgt04UKZjVfpBswG0cEZULjF2CMg/aLwnrwzNLbZ3fzdhyvmRI=
X-Gm-Gg: AR+sD10MKRhALGPf7HRO4BMXME5mhNvLHGIPLk0h2aIvndQnCcwmvYKTF3scd8vILhC
	yYcn/MBCBti1zZtsb9ckIB3H9BqgeyYjrtcGlGuvSieaNc+KBHoXdvWB/oMmYezkUoDdM67CYH/
	yU08Sws/tGHbPLX/odxxlOfqMLmHOLUNQSisPj3wfJM5nrHZKHR9eMZLKHT92xIl/UOABb0kQwc
	rTkou/951JRTO0CKbDFPTGYYzt9YoViPN5YyrtGhLizTnyMdpH7Q04JDKuQhRQAJwRAKbxUDcEh
	B6NbPSoD9CwnIe5eVuaRYOZoL2TFwV1boQ9HLXVO67+qgltoiUN+Mho8Qd7hKgxjZcc0ay/enUz
	EQ9dV8CloiPcZwlpgUvgLSEILKvzlP8KjF2GDwZ+VnN2fA36c35kqicxviAai3w/ShioxpQAvKM
	4DuSzvdGsokZcKtm2cJAakfvWA2MVNWem/0lmRwTEywHFekljmC+f85BRtO45xCDNI64aFB9D/x
	cQ=
X-Received: by 2002:a5d:5846:0:b0:481:3124:c71f with SMTP id ffacd0b85a97d-482c0b907camr6412779f8f.17.1787305784814;
        Fri, 21 Aug 2026 02:49:44 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:12 +0100
Subject: [PATCH v2 14/14] perf cs-etm: Test multiple per-thread threads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-14-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024946_593184_124EB97A 
X-CRM114-Status: GOOD (  14.81  )
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

Launch something that has multiple child threads, attach to it and
make sure that all child threads are present in the samples

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../perf/tests/shell/coresight/per-thread-multi.sh | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread-multi.sh b/tools/perf/tests/shell/coresight/per-thread-multi.sh
new file mode 100755
index 000000000000..ea525ed5e18b
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread-multi.sh
@@ -0,0 +1,78 @@
+#!/bin/bash -e
+# CoreSight per-thread multiple threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if ! tmpdir=$(mktemp -d /tmp/perf-cs-callchain-test.XXXXXX); then
+	echo "mktemp failed"
+	exit 1
+fi
+
+cleanup_files()
+{
+	if [[ $parent ]]; then
+		kill -9 $parent
+		wait $parent || true
+	fi
+	if [[ $perf ]]; then
+		kill -9 $perf
+		wait $perf || true
+	fi
+	rm -rf "$tmpdir"
+	trap - EXIT TERM INT
+}
+
+trap cleanup_files EXIT
+trap 'cleanup_files; exit 1' TERM INT
+
+# Launch 2 threads to run indefinitely
+nthreads=2
+perf test -w named_threads $nthreads 0 &
+parent=$!
+
+# While parent still exists, wait for the 2 children to spawn
+while kill -0 "$parent" 2>/dev/null; do
+  threads=(/proc/"$parent"/task/*)
+
+  if (( ${#threads[@]} >= $(($nthreads + 1)))); then
+    break
+  fi
+
+  sleep 0.1
+done
+
+echo "Recording..."
+perf record -o "$tmpdir/data" -e cs_etm//u --per-thread -Se -m,64K --pid $parent > /dev/null 2>&1 &
+perf=$!
+
+sleep 1
+
+kill $parent
+wait $parent || true
+unset parent
+wait $perf
+unset perf
+
+echo "Decoding..."
+perf script -i "$tmpdir/data" > "$tmpdir/script" 2>/dev/null
+
+# Exit early unless there is a dedicated sink per core which only TRBE
+# guarantees. This is because shared sinks will report BUSY if two threads try
+# to use them at the same time
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping output validation"
+	exit 0
+fi
+
+# Check all threads were traced and they have the correct thread name and symbol
+for i in $(seq 1 $nthreads); do
+	if ! grep -q "thread${i} .* named_threads_thread${i}" "$tmpdir/script"; then
+		echo "Error: thread${i} missing" >&2
+		exit 1
+	fi
+done
+
+exit 0

-- 
2.43.0


