Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F6DFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBEf1HaysC/cBOoYLsmf2YO5C7JIY0UsCgKYW3rfZDg=; b=Gq28eHDSySSqHbHpIjv0mLjS0T
	EWhmjpMEUePVVb0pml5AZ9pEn2mYaTgdljNn7/36W/rEq/ViFAipE8ugKYFjC4Fy4UCcBkh5VQ54E
	RlBh34kn+/HIBLNfVslZB44sjEoFYpfgj8MgK3SRXI0cx0JuJy9FQc+twHqz+Hc4rm6SCuAFkGehm
	mK/3HjZKJ1kbLnpA+GPYXeu486We1gW9VyBoDjeHhNz9JHrmO1C8V8zrES9vZCpY4uRQkZmIYqEp2
	6hgPH0t8flEsdzrTnrwbhGCw54o0K+G87WbJvQqv74N4D/iRO8mAtijuFrXF8M9S76nivnZSQPTGf
	gVIrKWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBa-0000000EfMC-18Rg;
	Sat, 25 Apr 2026 17:52:58 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9U-0000000Eds6-0vN1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:50:56 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c35f2c09dso11210522c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139446; x=1777744246; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qBEf1HaysC/cBOoYLsmf2YO5C7JIY0UsCgKYW3rfZDg=;
        b=MpeUohapEIYcTkdNaLsggE2A2ITtgV6r5GzVDEGmxstKtXZl6iNStzpzyB1xbYiQdu
         7Yaib0FAcYYPGEexE1jVLyVcRzX8Dcye1wtzunvClbaakXh90qngNOFJu+tlPkirxuC3
         l9UbCpYP1+EgIGzLqV381Hzam2womGTYYPSZ31eFZlf7npgZViCfJVCaXkqLJ4roDJol
         lA71iQhXRa4uWXqf6FV+yweQJGwKc0dCM83SvMn/8eF4S1SmDVxnLfCB5xUfU4t8WGZf
         34dhD/hvmvDyIc6OCDnALTsmLuHtMVGJwUEgGGDv3ut9SNhdFDoZpKD9NKUFR5h43Hpg
         wLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139446; x=1777744246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBEf1HaysC/cBOoYLsmf2YO5C7JIY0UsCgKYW3rfZDg=;
        b=PHjx+s5BOYFtjWOE9enVWf5jf0oUc54PKgSgfPYSjzwMdldd2E+kHOSWNLlY/p5dRa
         6iRVj4rSs1sWRpvFwcxxUezurjmZ0u985BW7XF5eOVtlZ2OVYDN4bUl8f0il0LKmdDBW
         XoOygDEmmkTnoMPEgfUVfVj338MT9voThaoTFCoRo6b71v2iFVgmL0tGw2PTnGNF60RA
         l82nGijpONoY4GnsLx7vvhjEy8RMemAowXVshYYkH/RdCADDII5j8vZl53mwIM/63FSD
         3vh+X4beYzuZyffykPbhxGuhBWNgvuptS3Q86jYmg5Au2z/Rz8Hmjb934LZGdndGluT8
         FHOw==
X-Forwarded-Encrypted: i=1; AFNElJ+d1R/E5E3aF9WfPYACU+HFSPWzfyP5S6RAoqZLtLM1sp9Iiqi3OIC5UxOHdocjA3OlFiQKEv8EpFLQxX68zvcY@lists.infradead.org
X-Gm-Message-State: AOJu0YzSZFJjQvR2mY1UgGOU4jJ1QjyMw+QgyPT7aa9zTeiZ2/sl2bsH
	RDKBZ6hLGblF0DyS33PvwyuRJ8hM/PDibZNKghME9EJNHlmFn5sAOkP2MJMD9l6JqxYg00CYnI/
	vuv8F+Ya4BA==
X-Received: from dldz5-n2.prod.google.com ([2002:a05:701b:4185:20b0:128:ed1b:481d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:fe04:b0:12d:b175:2573
 with SMTP id a92af1059eb24-12db17526edmr11537724c88.7.1777139445523; Sat, 25
 Apr 2026 10:50:45 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:50 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-53-irogers@google.com>
Subject: [PATCH v6 52/59] perf test: Migrate Intel PT virtual LBR test to use
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
X-CRM114-CacheID: sfid-20260425_105048_425204_059F7D93 
X-CRM114-Status: GOOD (  14.53  )
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


