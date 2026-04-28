Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E78DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=; b=dPhNCzoZwgIGnXCeoUz7LvbXEB
	OrzUgXCQ4Ba/gglsp8OGuT30FCqE8uaFCCzfkvEzZ7KNVy46mZnRGvo4QONr0A21kraMf+hClT2Ne
	ovjt2JEduFX6X2zra6sKSSTAdA5uAybvlOfSYw0XlfOYJVKebAGQOqf31CAOJw8HTgAIOEkgo0H/6
	fKx+lIUeod8RjAQg3nqsQyhtOX7Jq2BBeK02iScAgqdXHHGdceBEmQmGPK9+DmnF6I8pbetCtvdR7
	kUJz6sJOIhzEja1V9nHMIGgEj/MKo8WEtfc+kf4oYjdmUIpk+3i4O7YCIZ8oX5M8nn7DxIylXJH+J
	xFUUhqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcmo-00000000k9U-1MWv;
	Tue, 28 Apr 2026 07:23:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckq-00000000i8e-3pOQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 07:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=; b=Pde4HfdWO2ZZ8K9s5yCkz8dG7p
	rn5qayAEmKre6f56PZ4Jf6Ngi/d5tUgd20Lz1QYE2W2pT+tyUo4wsr2URJDuzzUEfdzkNExChzSVj
	sCm5I2nzu4aN2D5vbh+XGPOM3atzgs6AsgJXx2wSdNWWGb02YhP79I916eumS5ph3/TgFgG9m/RZ1
	B/TZSkimvtQygDSNKiSYpuSVKcEBx9e+7vGc406/dF+6FPO3zHSQjzYzrKhxMPCfMIU7RzBEBtf/R
	z2eSk2wA14R9jAnkVSBrdxT29qaNTRqkwyqqtzAeYMTa06UXae7jkjSnbMfwytu1/seSq2LGN7EqD
	NXr603bA==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHckk-00000002DsQ-2NC0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:21:10 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so17679408eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360863; x=1777965663; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=;
        b=c062Dx5P/dYOJznxZZDhK2alzaBI0F3MxqunvFOZtA7I/VKWdKw8WTlTbeVJVtAyo1
         qCSqKQiIkBiLOMKO19rUu8oiw8u3R/Gc5+sJ4wazN26nA9LHXr8ljhp44wHU5nyfqOJp
         IXLn1qrzwu/PDhtzgmcdoTzFDA8ArVj4/Mg1rYZwSLJhU5GxoXsxF+uDQd67FHlnx3Sb
         whVVh4L1K/0tUegEP5wK9zRrQtYGL4a7gXdHlQo4G5v5ibTyP89N8nyStnh0u8iOL6Kn
         yaXu7zb65AdPHlRKlLvL08TKrptB7UOZiCchgrFUiltxFa0jssh245U4NuCRVBqSIgAh
         JZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360863; x=1777965663;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=;
        b=Ml11c4lv8shby/9yLCc9CpORVxKvOIQDQnCKep0B6RBzR5puPb0/jYmoaFXl+5Bh/s
         Ht88SwsvgMqtkSsZTVjPbadunPkpE7dxk64v0g0lKLDoYwQMbvjxy6tkazQnlA/vHzwA
         TwTWiYAH4iInGPRytBGJnS6qZGzfd0iUKIjGi9OBfHtPX94wQvpcpt499zqWe5jWtrKP
         oBCYbFEXZLtOAw5zkpKMPwQldXso5O78OPMKiCeK9LWb+pzvZfF5VoqRWQ5uW66HlPHs
         c5CX5pB0Uxj7/IA9aaEAtKeGoP4c+P6A7dOJYU4yuH4f/eGrPfzXjUyKiZqgYRLMWLRN
         DmxA==
X-Forwarded-Encrypted: i=1; AFNElJ+cMO0IWBVQtAoEZjO8jqk8yZM8R9a0+tyNiltOpYnbJ8PT/RR0+nYRpOHjQ54m7Tohm3rAm5bn43WtLtPwW9W4@lists.infradead.org
X-Gm-Message-State: AOJu0YwZpRHuM7NapCv0BB92xOLH7ZYbSOkNQxsP2DPv6ng90xkOOaPt
	9h2ZMvbhtW+IrLBfTq7pgO8oizOne49apz77NAvJYCkSgSy/BquYxZDuL3MRBJgTfa5xvTcrjHk
	MLqrCEL0lgw==
X-Received: from dycnh13.prod.google.com ([2002:a05:7300:ce8d:b0:2dd:3fe1:f5b2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2b06:b0:2ea:ed70:3ea8
 with SMTP id 5a478bee46e88-2ed0a2680a3mr1095594eec.29.1777360862799; Tue, 28
 Apr 2026 00:21:02 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:57 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-53-irogers@google.com>
Subject: [PATCH v8 52/58] perf test: Migrate Intel PT virtual LBR test to use
 Python API
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_082106_811683_8E6E5C2D 
X-CRM114-Status: GOOD (  15.76  )
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


