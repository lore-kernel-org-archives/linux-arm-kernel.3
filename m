Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A86C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCKgmnJbp7mmf0EumlB0lo4QQt9rPy5YuLxw+XknrhY=; b=NlShuUWyP3A11hdGOSWMOoA6qu
	jJwSMx4v4OgsWj7GieM2Z14Wwrouw8NOBzD+T3n+j8CSMa92mxGqWRDUwvEAfbHuTF3hxvXnupYFB
	2ACQ4uwR+OxS4RbJb8VDty+P5B7xBYmGCc1HFYOlMRTla2ybDEamkJQHn43AtcxPUvTmkRskAk4d2
	9EnTab3JsHajT/n/Cmty1ObhlnOLk5YIRvEy0b0UJp3cpMDLt834fXtRN/s7tzHR1ytLK+s8LTuzp
	xhxkgcIoX4PwcL7eb6mGg3ikf9ZWNgNYHuNDq+YGFeIWBEY2u/DXKD32V2rZ+2W32pg2whxFb57yR
	2Lqc27oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtD-0000000CxdL-3k6V;
	Fri, 21 Aug 2026 09:50:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsf-0000000Cx62-0IgI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so7708375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305783; x=1787910583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCKgmnJbp7mmf0EumlB0lo4QQt9rPy5YuLxw+XknrhY=;
        b=bC8WW5HyE2TguyXZ1S0ruvPNU0HQLi69pTxQj1JvY8nDmjQaYQi5SAEpQPKq4vd45f
         sDV99zTIU6h3DHh+/45X8OeIUunu3772PN6z8LDvYj+4lbQ+Djdqsy04VBuX5Q4/d6vY
         /8YA0vkmilOFvWguX8LZd2dU/IlLKul48Wjjnd4zWadtybFvhQXz3RSbDGKXyrJ9fkoY
         Nrwbr8+25m/5xQbn4F6Rgwp2T01vbLdPUn75Bra+stVJVkeDl1Gi9p018mwp6NpsjJHO
         eH4uPDOK5SVm+nL3WdcLKici8SICmxAmS5inE7fKaktXZO9RXEbqRt7URv9/Jd1yclUx
         fBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305783; x=1787910583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCKgmnJbp7mmf0EumlB0lo4QQt9rPy5YuLxw+XknrhY=;
        b=k/ei8/y+Nh98STHHrkuhp0tzjMRIQlEuP/8J7RJ2c1TQ/Fd48bXpIYSO/GN4lYQMBc
         rZrwSbq0e/xU+q//QDJILhsGnFBbMvuN5nad3Xb6wz9k8xl9vXGdOF5qvzI0HEmi88zF
         xvzSQYHwElLE8D0R5kQ1KUyBH88OYNBXTC4/tVaejwv66UtkBy4lMVQ6kiQKrPHKgFwc
         D11X2xmE9NpK902ZvsVgBMwypNkDZ68a+euaVoKaBs/JMU2jqNrvuEyKtAAQjeuwMKwT
         zeeJX3GdN0UKMHjf2vJu7+C0xW2jJRLda1U6aIyfWqx5wMR6IdgMgt/KV6jpWPXVPwUs
         AXDA==
X-Forwarded-Encrypted: i=1; AHgh+RplMGbyO9a58XXX0BemOtmCNoIord2njlMAN8KJzvfW/KzltddkWnWFp3XQsnRz/4Kcx/VA4ZOvxb/9gSNHok2u@lists.infradead.org
X-Gm-Message-State: AOJu0YywxPpF6FIY41Rx82eyq/clyr0khli4NDHnTno/Vk4DL2R4D+lZ
	8nL5BGLwvrn+Tom6+bhFfDhI+AOEEhPk45bVDr1QqqVE7WYFJolxW5GSla2xb8cCGI4=
X-Gm-Gg: AR+sD13BA0zH2UC1IO1oE/lgoyWe+nFKS9qQkkzJbPeesHIz6u1C15u0hK79hZ+GVDH
	zHQHC268hpTstkTN4bdftOggwa35yW9Q3NAhLp2pNsLeBcUe4xkmxMWfQ/QxcqHZ5tUu/21X2Pn
	br2wCaE4czNqqWcJ3HOsX9XV3UNUdgzDzIaNZbkj3zZgfP4KK+7KhHTslkfEP8/Q3rhCZp1mcuq
	nGsqGRk+nc38qgw/V6pywApMK71tzI6v1MmndvWaYNE8/BwG0i5EkqE5jBug3gJMmIYy/yNj6At
	BV/YDf2yRvzM7piv7ql7iVGZQnPvhOl7Dd3kF2fcggZPw5wqyLD7KwNIDY2AHGajDQ1CjjP+S+D
	PpKz5JK/Vp3D7WWmnTFxufiruyG4H6msCw4s3yDr806y4/B5tVx9494KiV/scxRu+WuBMBzf9nz
	JBkHNMZamCqnrujgH/K9hS7om9tt4TK54fUToDkiDRVH4ACLD3BqWmo6f0P1slmAzU
X-Received: by 2002:a05:600c:a088:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-499b83572bbmr76994215e9.11.1787305783413;
        Fri, 21 Aug 2026 02:49:43 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:11 +0100
Subject: [PATCH v2 13/14] perf test: Add test for per-thread mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-13-00c4fd0701b4@linaro.org>
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
X-CRM114-CacheID: sfid-20260821_024945_196152_CA0A4144 
X-CRM114-Status: GOOD (  15.52  )
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

Test that per-thread mode works when the process migrates across CPUs
and that the decode happens in the correct order.

A TODO is left in for when support for decoding in order with Perf
records is added.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/per-thread.sh | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread.sh b/tools/perf/tests/shell/coresight/per-thread.sh
new file mode 100755
index 000000000000..77d1ed3405a9
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread.sh
@@ -0,0 +1,48 @@
+#!/bin/bash -e
+# CoreSight per-thread CPU attribution (exclusive)
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
+	rm -rf "$tmpdir"
+	trap - EXIT TERM INT
+}
+
+trap cleanup_files EXIT
+trap 'cleanup_files; exit 1' TERM INT
+
+echo "Recording..."
+perf record -o "$tmpdir/data" -e cs_etm//u --per-thread -- \
+	taskset --cpu-list 0 taskset --cpu-list 1 taskset --cpu-list 2 true > /dev/null 2>&1
+
+echo "Decoding..."
+perf script -i "$tmpdir/data" --itrace=b -F comm,cpu 2> /dev/null | \
+	grep -Eo '(taskset|true).*(\[[0-9]+\])' | \
+	uniq | tail -n 3 > "$tmpdir/script" 2>/dev/null
+
+# Check that the decode says it ran on CPU 0, 1, 2, in that order. TODO: The
+# correct result should be "taskset [0,1,2], true 2" but we don't decode trace
+# in order of the Perf events yet, so everything is associated with the last
+# exec.
+cat > "$tmpdir/expected" << EOF
+true [000]
+true [001]
+true [002]
+EOF
+
+if ! diff -q "$tmpdir/script" "$tmpdir/expected"; then
+	echo "FAIL: per-thread output doesn't match expected:"
+	cat "$tmpdir/script"
+	exit 1
+fi
+
+exit 0

-- 
2.43.0


