Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A593EFED3F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBEf1HaysC/cBOoYLsmf2YO5C7JIY0UsCgKYW3rfZDg=; b=ABFOvZwkLX5uM5KxiwInahBzBM
	D0N9TX9lVI1IPpRbKWoq0KQTg98Hk3/H0JBHgorBWNnkCmRp0B9WzGFFmaAZBism1KBJpbwcnsbi0
	9T0utllfNzZCGbfNeb45uUtNBC0uNQIqBJWLO8M1GrYmGq7UHhc+Lbk8amjMih/0pw2AYGUXo2gDk
	nrmwTxgzdeM+/iNPneSo1vMzjDytL92vbFGMNOBvYL1ObONk25e1bzcQGJJVJQ/nD21VF54Whe1hD
	3pyY+CwYEi67QqbyIjYrD0FAY2xDRjCgLJHfe1CATSPUh9oC0H64KASNcSCGxAQUX7244OV/sn8Xc
	Uj121C8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJjv-0000000DWFi-2eQf;
	Fri, 24 Apr 2026 16:50:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJio-0000000DV2h-4BNN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Apr 2026 16:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qBEf1HaysC/cBOoYLsmf2YO5C7JIY0UsCgKYW3rfZDg=; b=DlLkr2KwG8jxUPvMANLIMnWSFj
	2SxsxrAJcr5L1nSIm/aXbmJ5uhrmjBbdM/PkBYxWzzNeq7In8ugvWeQTn6/sgzDTCgk8k0ivn79Tq
	RNd41++8Catfst5uqBTTgBqj9sU6mne8nQHlWAeko6gB8pEqMmfEmlMZbSm3HwFyEPOwEw+Us6i30
	5sjYIP/LT3eLqys9hep6ni6XGjLTykGVr/fPIJXEg9di26PX5II7Cojj01WtVHz+kqfjsLqddfcQi
	zDT5b8BkOFmyKVlrJ3Kwrid1464Jjj6geUHcz/31QBF4+b/5/CLjKDBJgD+Hk6JmeFGTds2SlG3bu
	o71W1mNg==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJik-0000000F9eH-0Qx6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:49:39 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso10403961eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049375; x=1777654175; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qBEf1HaysC/cBOoYLsmf2YO5C7JIY0UsCgKYW3rfZDg=;
        b=ADJqXfDU7/xZ5xMboe+IcKz6A1vvJY1h0k2mY+jKVPnEwXbbSx7Ca7fAN0pm3yV663
         oZJpydiiw80jUHpwMqher+ZbX9G0QR+oxA6s1e4IuICU2oWto5ciFe1gVZJ8PlMdFuCL
         hcvxVG7112v2s1QZ/82sxIa1gRp6CkW8kULBLFhMEfvxmbn2C8CuT3AqHO3x6+dNpZRM
         e27ZC1c6xFkQRTdQew1Dp0Ix70Ez8X0HPExm7hdoijx5Keo4I1oaDcmZRKTUFmVm977T
         QDb2SHeBzjl60k9gIDxFOsa2dP4ARPc8tifqC353tk9zwg8L+EIleI0wPDR7LsQTgudy
         jKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049375; x=1777654175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBEf1HaysC/cBOoYLsmf2YO5C7JIY0UsCgKYW3rfZDg=;
        b=gp+XfP8rpWq7Hemcw99TRGxy46c6YZNriSZYZetcoyojvaGxUUrye938xs2f19ccO8
         FP6pF1glxUnzWPae5igpsjxJqsrKwd10OnWNpzjXbBvnh00Tv9naU61hsoRxFLEEFOwH
         oQJeiyGAGF0X+c4tv/cdPuqKJsW8Z8OV4jgDxuAM6OLFttRDFGcspuCGONRgsqofL0Vk
         UBcudvc1HbFt397rAd9a2nuLju5esWphEUL6OVonZpIdQrVr28vScIz329ae2KcMXFYG
         4oDmH2edK4DGkqdqXUo3WOyhVXnIofIR1FwXkvE15mdpHOJR+VmN9NjMggPBE6eXdGQP
         sv2g==
X-Forwarded-Encrypted: i=1; AFNElJ/pUl7FubVUKZ+mDJ3WHGeB51gO7obsmbWGp/my/qvYshKmAFC0fviKx5GiJLRC0wBbs36tWgsM4NNExtHV7u9o@lists.infradead.org
X-Gm-Message-State: AOJu0YwRSpYYzV66Qhpda99XcmsXFIYSWU+rHPRmlZa2U5hn9lcO6Lba
	jO/wPTkbYiUTBl6SAx/ZLQ9/3DSnqpUuzj7MID8xyHEZon3oa9orRzdm+OPDYmjGLCnk4WnH6OG
	1gRiy1gLvRw==
X-Received: from dlbts2-n1.prod.google.com ([2002:a05:7022:b042:10b0:12b:fe5e:215])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6884:b0:128:d23d:81a7
 with SMTP id a92af1059eb24-12c73f64315mr17189403c88.6.1777049374784; Fri, 24
 Apr 2026 09:49:34 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:47:14 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-53-irogers@google.com>
Subject: [PATCH v5 52/58] perf test: Migrate Intel PT virtual LBR test to use
 Python API
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_174938_177326_0DC5CA27 
X-CRM114-Status: GOOD (  14.39  )
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

The Intel PT virtual LBR test used an ad-hoc Python script written on
the fly to parse branch stacks. This change migrates it to use the
newly added `brstack` iterator API in the `perf` Python module.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../perf/tests/shell/lib/perf_brstack_max.py  | 43 +++++++++++++++++++
 tools/perf/tests/shell/test_intel_pt.sh       | 35 +++++----------
 2 files changed, 53 insertions(+), 25 deletions(-)
 create mode 100644 tools/perf/tests/shell/lib/perf_brstack_max.py

diff --git a/tools/perf/tests/shell/lib/perf_brstack_max.py b/tools/perf/tests/shell/lib/perf_brstack_max.py
new file mode 100644
index 000000000000..c826e14160d6
--- /dev/null
+++ b/tools/perf/tests/shell/lib/perf_brstack_max.py
@@ -0,0 +1,43 @@
+#!/usr/bin/python
+# SPDX-License-Identifier: GPL-2.0
+# Determine the maximum size of branch stacks in a perf.data file.
+
+import argparse
+import sys
+
+import os
+
+script_dir = os.path.dirname(os.path.abspath(__file__))
+python_dir = os.path.abspath(os.path.join(script_dir, "../../../python"))
+sys.path.insert(0, python_dir)
+
+import perf
+
+def main():
+    ap = argparse.ArgumentParser()
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    args = ap.parse_args()
+
+    bmax = 0
+
+    def process_event(sample):
+        nonlocal bmax
+        try:
+            brstack = sample.brstack
+            if brstack:
+                n = sum(1 for _ in brstack)
+                if n > bmax:
+                    bmax = n
+        except AttributeError:
+            pass
+
+    try:
+        session = perf.session(perf.data(args.input), sample=process_event)
+        session.process_events()
+        print("max brstack", bmax)
+    except Exception as e:
+        print(f"Error processing events: {e}", file=sys.stderr)
+        sys.exit(1)
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/perf/tests/shell/test_intel_pt.sh b/tools/perf/tests/shell/test_intel_pt.sh
index 8ee761f03c38..d711ecdf5be0 100755
--- a/tools/perf/tests/shell/test_intel_pt.sh
+++ b/tools/perf/tests/shell/test_intel_pt.sh
@@ -24,7 +24,6 @@ errfile="${temp_dir}/test-err.txt"
 workload="${temp_dir}/workload"
 awkscript="${temp_dir}/awkscript"
 jitdump_workload="${temp_dir}/jitdump_workload"
-maxbrstack="${temp_dir}/maxbrstack.py"
 
 cleanup()
 {
@@ -539,34 +538,20 @@ test_kernel_trace()
 test_virtual_lbr()
 {
 	echo "--- Test virtual LBR ---"
-	# Check if python script is supported
-	libpython=$(perf version --build-options | grep python | grep -cv OFF)
-	if [ "${libpython}" != "1" ] ; then
-		echo "SKIP: python scripting is not supported"
+	# shellcheck source=lib/setup_python.sh
+	. "$(dirname "$0")"/lib/setup_python.sh
+
+	if [ -z "$PYTHON" ] ; then
+		echo "SKIP: Python not found"
 		return 2
 	fi
 
-	# Python script to determine the maximum size of branch stacks
-	cat << "_end_of_file_" > "${maxbrstack}"
-from __future__ import print_function
-
-bmax = 0
-
-def process_event(param_dict):
-	if "brstack" in param_dict:
-		brstack = param_dict["brstack"]
-		n = len(brstack)
-		global bmax
-		if n > bmax:
-			bmax = n
-
-def trace_end():
-	print("max brstack", bmax)
-_end_of_file_
-
 	# Check if virtual lbr is working
-	perf_record_no_bpf -o "${perfdatafile}" --aux-sample -e '{intel_pt//,cycles}:u' uname
-	times_val=$(perf script -i "${perfdatafile}" --itrace=L -s "${maxbrstack}" 2>/dev/null | grep "max brstack " | cut -d " " -f 3)
+	perf_record_no_bpf -o "${tmpfile}" --aux-sample -e '{intel_pt//,cycles}:u' perf test -w brstack
+	perf inject --itrace=L -i "${tmpfile}" -o "${perfdatafile}"
+	output=$($PYTHON "$(dirname "$0")"/lib/perf_brstack_max.py -i "${perfdatafile}")
+	echo "Debug: perf_brstack_max.py output: $output"
+	times_val=$(echo "$output" | grep "max brstack " | cut -d " " -f 3)
 	case "${times_val}" in
 		[0-9]*)	;;
 		*)	times_val=0;;
-- 
2.54.0.545.g6539524ca2-goog


