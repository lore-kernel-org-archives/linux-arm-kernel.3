Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4427FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=; b=iGI9UEqaxSu2pNWDHaeuOKM87v
	DY++SZwB7AjdF1ovO65b7fWcOA08pZTmxc3EyuZPRYLEwg/J9sXGbXUnAbpq+WTsgGm04rSjQc7so
	w9M5lGCcpoI7+2la1QwEUQvi6iWO4SQtw4SpSoo8Md5Zvxj5y0oC2PBC90q7Ikxd+BSHxBDxcpZTg
	DQeqeQnAPUOKy+aAM5b5emQBWRLnJmjQBoAuJXyPxn5mdqB403NyNQQa7VEZwPfixaKh8F4Rxd13D
	CvKqV7Mf8o3yNcr7FPZPsaleNWWS8LW0jlHIO8WOQwQ5zs7rYiQkIGvwaMGaytASjlr2n4dXKX7Wx
	PfyRu6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGll6-0000000EwjJ-0z0x;
	Sat, 25 Apr 2026 22:45:56 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlkd-0000000EwMO-2ySi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:45:31 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c66fdd4aeso13652020c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157126; x=1777761926; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=;
        b=NtvAzLLEFeSr4u7nGZS0cIO76fFZwU1dRCrW7zanfy+Bc8aLF6oTLaKL030lSy9q5J
         AqgiAYVxUS3S4QTPagADurTx2rWefwA4tUS7bkDayRe2nGPidCgZmAV4X9YEpheGbvOF
         ncUYLq0jPu6BnIT1et0wXRDVeizHxMuHftq6OJbvTapHdZKIwCRMAQ5vKtjMGOOvKlEY
         wPkL4bWsooMeLqYVBUqBjoujoy9/HQbGOOtnmKD659l8yoJzD2m3FGaHxmfwxC1mK5HK
         7raEzkgwNpMaYSEnaw92WjGS4d4fz+1CKo2YIZ5+8zYxUfQcpCE5twB+JeCnyvdUalZe
         s8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157126; x=1777761926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=;
        b=F/2D3qfJSxX+w0wtfrAl95fj79q1GQfC0hPMPONvs7a27VT5E8Y4mjKCxTSbvw7KW3
         Icgpu8uTF17eykdVPGgGMZgsdt/IvKCXQLrA3Ptx0+0ZHL0b89Mj9/sjb5AvwIsi+nv5
         DYamdVVMaJ0jCPbj3f+5unrILPCK6z1pUgwRoBUlvPbfv0mptSpiN6yByAXr6wc11Oh8
         wzUlGHi4/FrHlzcx+UQzYJeb4gucDVnM5MuElPhpZyC/lQFoQ51iLJ22djk19lWgFuPP
         dDf4C39tKRILN4Qmwz3TbvIzXAWlaAkhQuhiobb76gJYRHGQxXes9GwDwaRFjF4wdBuf
         qKRQ==
X-Forwarded-Encrypted: i=1; AFNElJ88dprqUCGElKFzFPSy91DZBP3XwGjZEGSSwMSMzI+LeQQiBgiwczyMJ5kWRIFy4RhMgxnHLE+cPfWBjYTjbm+I@lists.infradead.org
X-Gm-Message-State: AOJu0YwWaa6m7HTbJh/bdfBq6pMcf0LVoqLTmcYMl9fJYhQkQyNWH1bC
	hSuGyYbKhth7J2lwUC3TRixi2TvHwdLFQi8qodJN5U97UFvv4SLAe+goUEORSO3OqAyRp0onVQd
	ieq8zdFGgzw==
X-Received: from dlam10.prod.google.com ([2002:a05:701b:208a:b0:12c:912f:7d3f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:383:b0:128:d4db:447a
 with SMTP id a92af1059eb24-12c73fa73e6mr20056887c88.29.1777157125536; Sat, 25
 Apr 2026 15:45:25 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:44:56 -0700
In-Reply-To: <20260425224503.170337-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224503.170337-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224503.170337-10-irogers@google.com>
Subject: [PATCH v7 52/59] perf test: Migrate Intel PT virtual LBR test to use
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
X-CRM114-CacheID: sfid-20260425_154527_791323_F7E2FC94 
X-CRM114-Status: GOOD (  14.97  )
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
v7:
- Fixed permanent iterator exhaustion on brstack by converting it
  to a list.
---
 .../perf/tests/shell/lib/perf_brstack_max.py  | 43 +++++++++++++++++++
 tools/perf/tests/shell/test_intel_pt.sh       | 35 +++++----------
 2 files changed, 53 insertions(+), 25 deletions(-)
 create mode 100644 tools/perf/tests/shell/lib/perf_brstack_max.py

diff --git a/tools/perf/tests/shell/lib/perf_brstack_max.py b/tools/perf/tests/shell/lib/perf_brstack_max.py
new file mode 100644
index 000000000000..bd1cdb463f28
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
+                n = len(list(brstack))
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


