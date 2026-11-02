Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3BB606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4FltxZ3i;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uu/OXzPc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BoSygA+rSUd5kKs81oMTEOx8OUAzT9ufCoQu9dV/md0=; b=4FltxZ3iVlTj2F
	rzh8Lzesyeb559Kfe4+lM0TiauzbIUWpcpY3v0jcx925RQ8GMqqTpEwYBGOSLNvCG38f+uorBWSXe
	lIg/yk1fsC2jbNbvIWt+5kY9/srmwIrE94TmY77G57NuSrbuxU+XOF0RIXPxc7+3UVL62db6ldJN8
	3JjJmicEmlmKNbGi+5GDABHED9Ac25HtPoNin0SYqwSZjjtpkzdmXZ7MbY90B/9c5Rok6fMNIBTsd
	9DLOlB4pfM3+/ViooUrIRGsgvjXoZhlo56y3SVJ3BWwz1y8IgtmjJGIdVHOK1MSvp4CppbPIG4Vlq
	2GJndF2l4zLSgYh5ie6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxU-0000000GR5H-3VJi;
	Mon, 02 Nov 2026 12:16:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxM-0000000GQlh-39Vn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:16:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so14974525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621767; x=1794226567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoSygA+rSUd5kKs81oMTEOx8OUAzT9ufCoQu9dV/md0=;
        b=uu/OXzPc7y/oDVeuhHDaQLdsvB13LCuJde1wB2wHx5Dv5y0jNerFs5HU/SazigvpTU
         DrjawAz1lGHWWsVQys84TPigdYD3qb1eJ90tM5Lp2boEGw1ZGwI0q7MLO2UyiDuYbR2G
         oqWpgYVP+wWVcP4e/+0cDGRQhQ0ANtBI983anH19e6222LzHy3PzwMo7Pg/8xMfNjIxd
         vdzX2rzG3/pemLV0DxWtk6k7PmQCZZd6IyxOZNv0huVP+bRM0eFBaCH2WN05w/z9a3rZ
         sRIDGPXXF0l74S/2NlW8QF5JFUCnfTsF/x/iwFO6TW+sQIwF1Jdu/Gg1V/MIfVKZI2bj
         cseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621767; x=1794226567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoSygA+rSUd5kKs81oMTEOx8OUAzT9ufCoQu9dV/md0=;
        b=Qr0cZG57CFYiRuO5FTlZg0zPu4kTBfaPsT2oyCRYgzDIDRq/fhVpESvf39pXVw0wUc
         gPn9GpR11NR7F1fpblkUkWwASCpRw11reZIA0yH17tIPWtxDq7JvmSj1mtx3zhjfbg0o
         TVq7Q18Jrcm58zF2amwgSuM5HL25s/AwlirrT4S99Ss0H5DbrIgoGHm7TmOVA+Vk8e9M
         du+qvs+oJtUaSGUzxIBW3CGzxONyPvZiech8Tsnfq68YpU5IguVSmMnroeUttvsiaG7W
         ir6bV6rfGS4TOS3qwGtdPVgpzMRwz1S/HMA7oiHl2mjA+e/ziF0Rcpm606idX4KLKUyn
         FbtA==
X-Forwarded-Encrypted: i=1; AKwUvBzjfs8uRT4ZETsVyY4EIteoDMVTvNYTp2RhDdXAnl14EYZInpxyf7cWoT2j5CJzPVL3X3JdrbzWdtCgVA4zPO35@lists.infradead.org
X-Gm-Message-State: AFq9FYIG1VWspGOeg4BGTMyvwfyMew0dkunBte2OH8AjuJxSpd3JZrJb
	lK0sBEBlmU9W4d+ktq9iEQr84jzOLRRTduQazKzLjg/wGiD9YAbe/q1qCBd6JpHXs14=
X-Gm-Gg: AYBFou0XpQbJYkIwtgqrQUzJD2Wd74QFvPzRnbxEnzjvATUAi8coNvax9zLycLsCOa7
	GVOB/+BxgY1o+TYQnyAC83YKiveuvrdo722YpgJt16QUXnayGeQG/gVbH+CaM7ANye6cB/kl4j/
	hjLuxqJSXM3JZKa104CT2K1J2LoP3ul7HHcWAQs36znR4nHhLRwdDJ4qWXgwNkB+trDyfuHsFLS
	Yew9zPaGphrAeUL0rCvPawEMdvLRHZDyErF4bN0cLbDBntRvOvzFn4Kt/PlM0QCN4cLyv9CfkzQ
	v6KkSOPHiwU3opx6Jfcrko2pw4+7+hzgtSHi2gs/RuwjRwdT5MQk5W1fx6ZFR1cStFomU9pwToi
	dP0Nb+r3EqkjHumZCnNmT90Os1eELD7ydDA4yR57kjX/AnNEo6v8iTqEl0s9Z3Or7slo2SF3mP4
	2osXrNZzCrHjLBbuXOdZe/R1wkCkuu1ual0tQg+3bDgpcbZPDkLJvmKDctSqgURcQ/eY81/NIrH
	PKsHKKOQwfZiiMpZB3N07Kl+SxPVVrm3flmm8/kXWLUyOcuxlCreYCeTgcGxjzPuQRkAJ9f28RH
	D26AA5EbEXLWaMo5/c6yDFng8TD31GD0doi/0ihyPm1cJTR4o+2NWg==
X-Received: by 2002:a05:600c:34cf:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4ac18d68ba0mr204596495e9.28.1793621766831;
        Mon, 02 Nov 2026 04:16:06 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:06 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:32 +0000
Subject: [PATCH v3 18/18] perf test: cs-etm: Test multiple per-thread
 threads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-18-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_041608_817267_883323DF 
X-CRM114-Status: GOOD (  16.87  )
X-Spam-Score: -2.1 (--)
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

Launch something that has multiple child threads, attach to it and
make sure that all child threads are present in the samples

This will only work with 1:1 sinks/sources, and looking for TRBE is an
easy way to guarantee this. In theory this could also work for ETR
sinks, but we'd have to attempt to record and skip if that fails, which
would make the test silently skip if the record command started failing
on TRBE too.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../perf/tests/shell/coresight/per-thread-multi.sh | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread-multi.sh b/tools/perf/tests/shell/coresight/per-thread-multi.sh
new file mode 100755
index 000000000000..c6bf1ff2e53d
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread-multi.sh
@@ -0,0 +1,76 @@
+#!/bin/bash -e
+# CoreSight per-thread multiple threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if ! tmpdir=$(mktemp -d /tmp/perf-cs-per-thread-multi-test.XXXXXX); then
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
+# Multiple --per-thread events are only supported with 1:1 sinks/sources
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping"
+	exit 2
+fi
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


