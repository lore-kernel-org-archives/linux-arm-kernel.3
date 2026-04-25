Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36062FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=; b=OKNKrtMekFovaqd80SbGT3SiiO
	ayQEilFEzwXSfGeAyn3tF9QdcYvpoyecTYVG33UdfZrSZPKBN9ml9zcbDiwxN1h2phM0NKVs+cQGH
	zJXMY/EOpqf9iILPmE2AoBHa+3GW/DJHTB3DIXnJwjZf4o9nYLUJL4x7cNQji9CJ9u1Hr7QIF3w8w
	G+e/3E2SKPnr5/1M798ZKlgi5EY3Pzu8QEqOxoDxtId6LE+/4aKdWs+sm4hoO/pn9vejg8y03LEoZ
	2TTCSr/QkVoVqpdFgfTB/0Nmqd5q87Ie31mDL6zRhdce9dKDpQToPUkVXwuyIfcH+J843bxivxep9
	7nmInE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlsG-0000000F170-1lki;
	Sat, 25 Apr 2026 22:53:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlr9-0000000Ezpn-02Lq
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=; b=Hj8JiTrTGftEFJ9+XPWwvPcSMj
	G4SseopY70ILDXsWkx6nrTauFBWO4m/6QU67TJao9nov5AuDFjHN+tQe4IrJxUG0UTex9RO15lxDq
	/mf/zxf3N504jf9+EWpfaIKks2TdgoZQlvTGAuJlxbhfzNDZg72F6kKSXsmeUS8ZB5m8CRPOan8OW
	3c3YC1arITrmfa7NI2FTCadklTBedLlKE3K3MzR4kq85orLI82zeWuwy/7maBhxr9C1dgPi0xUDGs
	NPOQhaDfkeLj1qq2+80ndKRoKCzuHtsQEWplNWjuXVD3QX2yNMiPwjAGm25AmuInSeZMBLlMrhBhM
	Xm04PSGw==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlr3-0000000GMza-0kr4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:52:09 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so11440204eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157522; x=1777762322; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=;
        b=eIZWkNbt2PIaieI7kHP6ZA0+fhbVlMpHdrTQxqEYXATcD/arDWTmkedf0bO9j7b3AC
         1/PH5LA4sJ0xRyTFSgKolAtwIQeYZ20HXHa4mLnv0tMkkH39uNaxkPnIzYSF7wHXZrP/
         LwgeW7ZBJw+zix9VCyRKjn4y+6NcbtVeBwwLadkDj2Dke3jaRN6fgJsqY3/zlJvM6r6A
         uyul5VbSViEIkJ/8BYBlVBIKWw2zorGHRd/blhFIC9BGIkPyH/D50YOpMImAAUiCeD/3
         0Qv+KpnmhGet45T1M/8dWr3v6yIbpspTsgNIjqmbnJFMSzTbA6IlZPR0dMRQk550dPoa
         DiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157522; x=1777762322;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a4cIRIqFZJ5y1BubPplg9oWe019B443zoI45B5rxaHA=;
        b=A6e1ltZhNduT24uLXclI/x8ZDl2yGk+RlKE55OB6q6JtEDOyxenjUYnXCxOK77CAcs
         POI8pN3wUdhkUfu8fEodq4zSf3IjpPAQwU3NYzhywjlvvkn5xbK1DCtIhIzyGWyN0u7k
         DU/8C4wSSK5zycSs+G6Uv1bo9SRdhOy3nidAbJOjRgAQmvGF1Bf43ZYh81fk2VSvKP1B
         UFGTFjoitgsrH0ni9hLv7wE9a4qzK13vBS4P0BwP8An+cC41grwS4TyRV68nGMYowtC/
         n8UoOtyOfAbL5tqhV9YX/9SwglFfb8ZYzUbUzuU+wqRBpC+Lq+XQD/B5/xQ/zxEqZppz
         mJdg==
X-Forwarded-Encrypted: i=1; AFNElJ82dvfynq2Z6+h5ZIrvk5hxUj/xWG23fi16mhfBd52kyTIpZ+Ie/8yE26nn8oC+NykRm8egX+gaRbGYFlgZEO1n@lists.infradead.org
X-Gm-Message-State: AOJu0YwWKHO/NNQIku/qNn4Ko50sgCGMHrxrwuUxzxfc8JQhmP2pK7Ry
	M54LnpDe79JU3+5p7KK2I7yFBm6wGFVUxLCZrb50yJc3p1qVHrTn5gvDhJuheH1ebFl+98bAXDW
	Pfkev9q9RdA==
X-Received: from dyaw25-n1.prod.google.com ([2002:a05:693c:4159:10b0:2df:5e19:9e69])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:5784:b0:2dd:c066:c02
 with SMTP id 5a478bee46e88-2e47a10653dmr20021430eec.22.1777157521693; Sat, 25
 Apr 2026 15:52:01 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:44 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-53-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_235205_300305_6F6946E2 
X-CRM114-Status: GOOD (  14.92  )
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


