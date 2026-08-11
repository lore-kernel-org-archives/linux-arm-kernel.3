Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD76C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghssS34122+SF9JGQaRPjJsmiH0qvioNjK1NWp3olSk=; b=O8D/XCU7tQksD1npxXZUUl/EWg
	93ZugMs+Dvtz3ZgzTNnpebJw2lWWaaQmal2CunU0gEraytQj61QzcKBylqC0r/2ai5A4iFKSaB0bh
	MchakaewdwoA0SqCxJutd4OYUB5YbE3piOXHHiEFYj6XukhAuXNFpAV3OPHUZwtOjlpz8HHCTxnYI
	l/al8KHA5MN+NJ8VAxll+trKdbqYeQO9OeJ8dv5hq9+QMRXtuKgnXCd9knTlKCumPz6tSakF/TIEZ
	SScxHa4h1fFeleskoK/3xmPj3/dscChjkXlm1DZBI59w3H8l+CR6fgGTj3xKkjubf7p6RIETgJKZC
	4lFuUm8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRq-0000000EKcS-2uZM;
	Tue, 11 Aug 2026 15:31:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRd-0000000EKPb-0EcR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:31:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so28814935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462271; x=1787067071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghssS34122+SF9JGQaRPjJsmiH0qvioNjK1NWp3olSk=;
        b=lRRzr7dl7r2casW1ywkK6mn0xFHEHBKKBa9dJW8NwFOfl9IIXWc2jRNRtVdiGOdTiG
         W9yLZX2o4FZue21YFm9eVbW1lGIDO7JcdkwprW6wRZt8VehLVvCVvr4KyWNie2njInMV
         c/0mBX3i/L7neKx7H5Hfg0wusaNOSvASziO2/1rt9mN/kISnIYWhHVjyPyjo+Jdh1eGB
         wFyO9uMh6gReuIlWwO5U/D4oejjOTunisVWchpN13KORw7BwDM/RVfM7DBq2ScA7cgAg
         Mbur3OMPsVeQThmwPoMbKbXXQ2wawKkKUKseyOGy1yIN6byx9nGoWBIJ2+oBAkd5Apt3
         9gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462271; x=1787067071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghssS34122+SF9JGQaRPjJsmiH0qvioNjK1NWp3olSk=;
        b=K4f/pulLlFt9hf2sIcinyTTt3V20ECKp1XfzQ3W42PqbOCEoFQNW0qtPwu6m0hZRNI
         n1jLNlNxZa7AI8jgbaQMEq5IJbyZx+dsESCpWRzErVwS56CLx1xM3DWFdy9C5b+a1D0o
         r21T+7nB3qT/qf0SMaqCzdQU+fWt9tzmqpYiAdnZnuueYQTjO4N3ROes8x4j5HqpTXz3
         Gjx7UkU3iwQHVgqrj1/XoFLHfzXXu9KOPTvmEmIsYKgk+QgGJMjpzx4w3c9yZy+9iEf8
         UIQeQqcC1IrFAYt7guQ70H2zTmJ40pvaD+iz79ZitcBL11rqpEGpDsk9CgUTUbMCQg1Z
         wwfg==
X-Forwarded-Encrypted: i=1; AHgh+RrNpy6yYllBaH5Zg6cdfDB8GVJU8S5rXqI7dhGFBHOU0JC04ofLy1sV9erV96SgEZUECtZokg1OVsdkNR5vh/Sl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7wnDj/AGdaCBTDCjJTvZkYIlcjuqv3mG7u+mGG4Z18hUxlak+
	VMBU5Lino2fReYLPdfmn+Kg4VK9BZkWo2mlhPyPFA/JzNj20OuMP5SocGh34mMfLNnA=
X-Gm-Gg: AR+sD134n1/E4k58rm5F6EZ5bcUnawHuEpWeoW5UF/nVQC6CiSfIJ3dGjbeqFOKgmCB
	omVRN3qmDvL/OGsl8ntD46SWXIxObTvWqNJDSvSlckiwDjNtxLKFIC0C+z65T1D4sYc7rG57/sz
	3pzkl4GS4Zujdezmc9jAmXMUimh5EXwO7QoCaeE5gYG9JxgNWQTuEJBU5bn+xWjDnl8reEnvek0
	fM1FKeobNA39YAEwXMwCFalpxN9zujHhtdoB6y9ztfQgfoUMRSW0spNeWU1As/Ww8LMhwCcmEYR
	w9lMsxKbUXRL1BnHyTzub+tpnIdeHkHV9ernoJ27ZDtyLL59g6zz2/q+OEOS8xeI7axmwMmYY+5
	h3E79NhU88PDjPYDuLnB8FdzU5Fcq/V5j+owpB/G8phsK+iqVdbBrJrMgfAoGulrH28YyE3LGXG
	cLxuZ0NwN3876ijPILnnAX6VCbBbOBm3dShLP/udFrVb19LvuiWHvn9UKQ2b1q2wlq
X-Received: by 2002:a05:600c:35c8:b0:498:28b:1025 with SMTP id 5b1f17b1804b1-49978433a49mr60012655e9.5.1786462271236;
        Tue, 11 Aug 2026 08:31:11 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:31:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:17 +0100
Subject: [PATCH 14/14] perf cs-etm: Test multiple per-thread threads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-14-90565318f5f8@linaro.org>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
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
 Suyash Mahar <smahar@meta.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_083115_408815_4D65B0F6 
X-CRM114-Status: GOOD (  14.72  )
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


