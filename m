Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB16C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCKgmnJbp7mmf0EumlB0lo4QQt9rPy5YuLxw+XknrhY=; b=kNwL0mxUs+DlcRmRe0cdYN8NPL
	k8onPk/WxYcsc67m7/UbgmgPMCwxt9rRNY1qxkvX/9BOSJX+pO0xiL4ssqF7W+mlfVIhkltVxwxh7
	6y3sZ2Qz5sXWmkldMu28uhSgShC08PooCup7WghTjtvYg7npGHjErOIav5AS5iqxxTlf4mouYIpEh
	t+Uq19J4Tb8qyW5nSskAC+ljv0otoqdKKuwLbOREjh9Zb+iXg0s5a0MA9fHN8pA3IdELCGt4MVRNh
	DmUcYRaw67xQ6/21ineSg+/r8l8FKw9CA2vOQhDlkBgo7K+W3UlTFHQZM0D1vSisX+//3QoWdhZaQ
	+ilsz8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRq-0000000EKbv-1nVv;
	Tue, 11 Aug 2026 15:31:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRb-0000000EKMt-2Oya
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:31:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49800c6a846so30989935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462270; x=1787067070; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCKgmnJbp7mmf0EumlB0lo4QQt9rPy5YuLxw+XknrhY=;
        b=eI318EP2UZsxvxdLSeJdr+mkFof1cfe5bzcC0DQ0EOog/cpLox92Qf4DJeUfKTI78c
         SAg6y3kv77LMJDwKxRmx6mdLIGzslmrKZqhkYLdU2MWAdGMMMV7SnOJ+PgxNALfLBx99
         2q2Mp/JXGYJg3kP3fpI/vGaGlhwq/XvqhJf+5QNVMzmyLJ/6x7dPPXJz0Hv4dI2tAvAH
         RvZ5kCczaF0kQ+xqxq8J8Qn9GJstHLkK+J0wBLK3pO+vnP49kbfHtAAg80aLrnLcKsK5
         OHNzXK1L4A+P6LXWaGaeqb4p7tf1EYbif97avQ0xQWQqSJT5YbfMTuQeaf29MHTAj8WB
         Ix3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462270; x=1787067070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCKgmnJbp7mmf0EumlB0lo4QQt9rPy5YuLxw+XknrhY=;
        b=IeypsvxLaKKICU74Wtd5QImYYGT9YQdqGSD9Ec9LQHjCxhfV3Ps/GVy68ZzJg2KjOH
         kjG6m1cs6J0EAsioEoZEonkx3K6lm1ZQBVw2j5q8DflDzE7aYAc73pORx12nwIDEVrl6
         Qxi9TV3uSjFtlASq7w9YOlU/1r+4QAn1YfY01UuH53LovKLt76JU1QVcDbAjy4usjgOp
         YUMNXKobCloee75spLem8s5EPvSj3pSLEYZHaZy1KngAI8kDUqkb/TWwc8LmVjK9Fg4P
         2sSVAY9rPz5Caq/gfiKItLcq/KCC2WVPKcbS9ANnhIGv+Z0MM6SxmPNCI7DmuBFWkuKy
         K+YQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJ/GkxAx+7nFuJoSbeJtqmB57uIQYcaMd1PRqHzU4Ipf+0pCfb2Ho0MOg18hfX3X0NfWLPKgRA1Pumt14ZDrgR@lists.infradead.org
X-Gm-Message-State: AOJu0YzHnZNBFVrxcKY43Hu17j7CY9KtBrNnZ/5gs2OjIYkWqfKzjHoh
	rDs07a4C0MjRr+NHN0jTOyQnC+0PD6+ULxCBsjowMW4xZr9RG8xMrCx8r+wzDjTgSfs=
X-Gm-Gg: AR+sD10IZs6mhbbMdbjxkd6IhO7Vdg8EQOcWtSELA0p2TqHu+zMJIh+G92UgZnYQG3u
	tfk1ftx3n0OGNvVx8dAw2q4KCDNXz4gCoH9ADvAbxVoTG7X38cg2KNShyss+gqzSNT16/A8mL8n
	I7TCBvVSjVd4avvXsQN1wHWuZ1BCngYlJsbF+cioe1s7y9XneAcoPO3iyzZc8vzyPxuib7aN8OY
	/sNLcAZhVwfdo9Q3I0Dml+Li64XY9mCwtd+6VY5O3iuvb+PF0uC6u7lUztu3uqzYVCSAXtAW2Yc
	sMqrybPsYWcrkDtjFKPjz7fZS0tEmbvF0szMOAgtKcMzPh+VECPOlS641H/IaeHQNXL+bhl3+Mp
	AhLF9fJF2zBMy+xFgEWr4ycNNEamnfGHZl4y0goc1GTHCcpaHesyJ4QqHrcQRefiBae3kW+BkJW
	c50RfOxkDekdC1tarA/MDfxnHHw5sWoV0I+rdHbQ8jy/RA0pZJRxLaC4AKbp/wv6RG
X-Received: by 2002:a05:600c:c162:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-4997845f3e7mr63045865e9.9.1786462269793;
        Tue, 11 Aug 2026 08:31:09 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:31:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:16 +0100
Subject: [PATCH 13/14] perf test: Add test for per-thread mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-13-90565318f5f8@linaro.org>
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
X-CRM114-CacheID: sfid-20260811_083111_640732_FAC83E6D 
X-CRM114-Status: GOOD (  15.46  )
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


