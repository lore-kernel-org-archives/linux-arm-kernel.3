Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFE7FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efNil+PNmmmvTcZKEec15sBNEnsydHEhEYd+ZnlvuZ8=; b=q+tSFiNv5stmF4ny+8ba7awj0a
	GZ6a+zBU2HEYJUHP7gVu4GEiwECWSorQW5bi1TrinwEIt+1OwDs8fzaYXvEdL8sBicIscfEk9/CkS
	/kJZ2FWokru0qxKcnunXudtoW6GNl9DqfbIyLDJnlx4Qs730r8IPlW1NcLMOr7odp859EJUlRGOg/
	wK0gG6GTP2twggEc+9nNMVXO5NmrSO3CP1LkUHCYi0EbpH73gwGKenSBTne1ktWcowPLNh+FwdV8A
	pGlWSPCeDJBPsABQwA+fLy8fd0ALhn86bo1/Tu3zHbo0XAVdH4RVc2HH496qlCVM4JGlxYbYL9mVv
	5CLOATvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcko-00000000i7O-46FM;
	Tue, 28 Apr 2026 07:21:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHck9-00000000hNk-3MgY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 07:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=efNil+PNmmmvTcZKEec15sBNEnsydHEhEYd+ZnlvuZ8=; b=OxViyI/NNtmyvBLDUI+2qymEhl
	SL7PDiO4xK3fNPYyL/mJiFpTyZELV7wXzTuNeXfbjsKyDh7eQGB0iHvPfaXn5Y/IQDuVFwN4OFxY4
	nc0a5HuX0OEMN0OpVyWyVlYKzAAhd33mU1yEoxLNp5Uirg+k94f0Jma8c0bgD3GqJBVu+Yz7i7nyk
	/5mzV8dYBbTJ0TEGs0QLO2U9rjR/C7Opqj//dkpD8ywlmdaPdZBF3dv0qnuUI5EB/UQ4sgHcaVqUj
	WjDcmE+4GJhjKdwPT69DGJGYG83fPRWXL3JWoPeJK3jUTYHTK/0nozaN+3D03Nl/GgeRjTnf2Nb59
	SoDtMReg==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHck2-00000002DXH-1SVP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:27 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so17675758eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360819; x=1777965619; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=efNil+PNmmmvTcZKEec15sBNEnsydHEhEYd+ZnlvuZ8=;
        b=niitsa6P4FesmCpLQPtTN55m5pXH3wNVz7RiAuRD/44khCrsPYaj8RDNNxQORBeTpT
         N8V8iHWt22hNxOpYOLHCh4kdh22ppLFNKtTJlumXQsz9J00eWmUMRgbEmwmRVM6sY1b6
         MGNQWjrc9v3VCyNQE9hwO1RrfLAXG2/sQ8W4dH2iHMGhW7K8bgArHliVRFK7HM4PgKYp
         Gq6yZAIRO88c0YXInWl96HSQUZ04uqQquD+Gp4zWBF8NTKtq6XGoNib10MBFiw7OQM8N
         9NES+l/62pv3vVfblZ881zyDOsXxECiKbUUmPTLmBaLNgnb+meju2zoVaTd71FYa3z5W
         Zp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360819; x=1777965619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efNil+PNmmmvTcZKEec15sBNEnsydHEhEYd+ZnlvuZ8=;
        b=jMQePrXwzrJksncMd70TzfW5d0OHXJtMvPOFrUolY/dkPKQ47CLM9ZVur+s/vgjSCv
         DNGAIqehwlqstIKgeiHipYl+Kh3MwVDzKKInKc86ZTHlcsW10V+ruxEC1vO4mZPl7bRq
         6cZLmGuJ/WTXUnk9yLD7P947hYQJikmMslUkquC9OzHxgKKpmX0ynp8K3y8BSVy8z5hi
         jYw68H1HZa8TKn33v00/YiiNUW817p1nQFUUlSztz3rpTLeYnmm0oVO+RAtwjMllPdEy
         +w3G/BgtB6Wi4uyI7V72vFHbn7eKl1EfS/qHYWrrIfxNZoHLf3vPJHBG7Rvs03QMCCxY
         DfVA==
X-Forwarded-Encrypted: i=1; AFNElJ+5WJLjZhD18fjeaVA0hiAub28xn2m086EsxAh2229uYcE17mni/Rn9bjVEM1S3reSWuXdlYPuUhA3Mxw4hgYZT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdpiax3viUZULYciFohRveYqlduUylx7PFEqsacMp9rvXU+Zp/
	SOAbYzPI7zlwLM584rj0L4VoVfsrB4syRc4e2dQCwI82DF7yua3Qcwg40GHcjYOWIgjcQ2tfQhI
	AZViCdjgQow==
X-Received: from dlae19.prod.google.com ([2002:a05:701b:2313:b0:12d:d209:b996])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6091:b0:12c:3d3c:ac08
 with SMTP id a92af1059eb24-12ddd961c79mr816350c88.4.1777360818841; Tue, 28
 Apr 2026 00:20:18 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:35 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-31-irogers@google.com>
Subject: [PATCH v8 30/58] perf flamegraph: Port flamegraph to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_082022_558347_79DA548A 
X-CRM114-Status: GOOD (  20.12  )
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

Add a port of the flamegraph script that uses the perf python module
directly. This approach improves performance by avoiding intermediate
dictionaries for event fields.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v5:
1. Fix Event Filtering: Corrected event filtering check to search for a
   substring match within the parsed event string, preventing all events
   from being dropped due to the `evsel(...)` wrapper.

v6:
- Fixed terminal injection risk by not printing unverified content in
  prompt.
---
 tools/perf/python/flamegraph.py | 250 ++++++++++++++++++++++++++++++++
 1 file changed, 250 insertions(+)
 create mode 100755 tools/perf/python/flamegraph.py

diff --git a/tools/perf/python/flamegraph.py b/tools/perf/python/flamegraph.py
new file mode 100755
index 000000000000..b0eb5844b772
--- /dev/null
+++ b/tools/perf/python/flamegraph.py
@@ -0,0 +1,250 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+flamegraph.py - create flame graphs from perf samples using perf python module
+"""
+
+import argparse
+import hashlib
+import json
+import os
+import subprocess
+import sys
+import urllib.request
+from typing import Dict, Optional, Union
+import perf
+
+MINIMAL_HTML = """<head>
+  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/d3-flame-graph@4.1.3/dist/d3-flamegraph.css">
+</head>
+<body>
+  <div id="chart"></div>
+  <script type="text/javascript" src="https://d3js.org/d3.v7.js"></script>
+  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/d3-flame-graph@4.1.3/dist/d3-flamegraph.min.js"></script>
+  <script type="text/javascript">
+  const stacks = [/** @flamegraph_json **/];
+  // Note, options is unused.
+  const options = [/** @options_json **/];
+
+  var chart = flamegraph();
+  d3.select("#chart")
+        .datum(stacks[0])
+        .call(chart);
+  </script>
+</body>
+"""
+
+class Node:
+    """A node in the flame graph tree."""
+    def __init__(self, name: str, libtype: str):
+        self.name = name
+        self.libtype = libtype
+        self.value: int = 0
+        self.children: dict[str, Node] = {}
+
+    def to_json(self) -> Dict[str, Union[str, int, list[Dict]]]:
+        """Convert the node to a JSON-serializable dictionary."""
+        return {
+            "n": self.name,
+            "l": self.libtype,
+            "v": self.value,
+            "c": [x.to_json() for x in self.children.values()]
+        }
+
+
+class FlameGraphCLI:
+    """Command-line interface for generating flame graphs."""
+    def __init__(self, args):
+        self.args = args
+        self.stack = Node("all", "root")
+        self.session = None
+
+    @staticmethod
+    def get_libtype_from_dso(dso: Optional[str]) -> str:
+        """Determine the library type from the DSO name."""
+        if dso and (dso == "[kernel.kallsyms]" or dso.endswith("/vmlinux") or dso == "[kernel]"):
+            return "kernel"
+        return ""
+
+    @staticmethod
+    def find_or_create_node(node: Node, name: str, libtype: str) -> Node:
+        """Find a child node with the given name or create a new one."""
+        if name in node.children:
+            return node.children[name]
+        child = Node(name, libtype)
+        node.children[name] = child
+        return child
+
+    def process_event(self, sample) -> None:
+        """Process a single perf sample event."""
+        if self.args.event_name and self.args.event_name not in str(sample.evsel):
+            return
+
+        pid = sample.sample_pid
+        dso_type = ""
+        try:
+            thread = self.session.find_thread(sample.sample_tid)
+            comm = thread.comm()
+        except Exception:
+            comm = "[unknown]"
+
+        if pid == 0:
+            comm = "swapper"
+            dso_type = "kernel"
+        else:
+            comm = f"{comm} ({pid})"
+
+        node = self.find_or_create_node(self.stack, comm, dso_type)
+
+        callchain = sample.callchain
+        if callchain:
+            # We want to traverse from root to leaf.
+            # perf callchain iterator gives leaf to root.
+            # We collect them and reverse.
+            frames = list(callchain)
+            for entry in reversed(frames):
+                name = entry.symbol or "[unknown]"
+                libtype = self.get_libtype_from_dso(entry.dso)
+                node = self.find_or_create_node(node, name, libtype)
+        else:
+            # Fallback if no callchain
+            name = getattr(sample, "symbol", "[unknown]")
+            libtype = self.get_libtype_from_dso(getattr(sample, "dso", "[unknown]"))
+            node = self.find_or_create_node(node, name, libtype)
+
+        node.value += 1
+
+    def get_report_header(self) -> str:
+        """Get the header from the perf report."""
+        try:
+            input_file = self.args.input or "perf.data"
+            output = subprocess.check_output(["perf", "report", "--header-only", "-i", input_file])
+            result = output.decode("utf-8")
+            if self.args.event_name:
+                result += "\nFocused event: " + self.args.event_name
+            return result
+        except Exception:
+            return ""
+
+    def run(self) -> None:
+        """Run the flame graph generation."""
+        input_file = self.args.input or "perf.data"
+        if not os.path.exists(input_file):
+            print(f"Error: {input_file} not found. (try 'perf record' first)", file=sys.stderr)
+            sys.exit(1)
+
+        try:
+            self.session = perf.session(perf.data(input_file),
+                                        sample=self.process_event)
+        except Exception as e:
+            print(f"Error opening session: {e}", file=sys.stderr)
+            sys.exit(1)
+
+        self.session.process_events()
+
+        stacks_json = json.dumps(self.stack, default=lambda x: x.to_json())
+        # Escape HTML special characters to prevent XSS
+        stacks_json = stacks_json.replace("<", "\\u003c") \
+            .replace(">", "\\u003e").replace("&", "\\u0026")
+
+        if self.args.format == "html":
+            report_header = self.get_report_header()
+            options = {
+                "colorscheme": self.args.colorscheme,
+                "context": report_header
+            }
+            options_json = json.dumps(options)
+            options_json = options_json.replace("<", "\\u003c") \
+                .replace(">", "\\u003e").replace("&", "\\u0026")
+
+            template = self.args.template
+            template_md5sum = None
+            output_str = None
+
+            if not os.path.isfile(template):
+                if template.startswith("http://") or template.startswith("https://"):
+                    if not self.args.allow_download:
+                        print("Warning: Downloading templates is disabled. "
+                              "Use --allow-download.", file=sys.stderr)
+                        template = None
+                else:
+                    print(f"Warning: Template file '{template}' not found.", file=sys.stderr)
+                    if self.args.allow_download:
+                        print("Using default CDN template.", file=sys.stderr)
+                        template = (
+                            "https://cdn.jsdelivr.net/npm/d3-flame-graph@4.1.3/dist/templates/"
+                            "d3-flamegraph-base.html"
+                        )
+                        template_md5sum = "143e0d06ba69b8370b9848dcd6ae3f36"
+                    else:
+                        template = None
+
+            use_minimal = False
+            try:
+                if not template:
+                    use_minimal = True
+                elif template.startswith("http"):
+                    with urllib.request.urlopen(template) as url_template:
+                        output_str = "".join([l.decode("utf-8") for l in url_template.readlines()])
+                else:
+                    with open(template, "r", encoding="utf-8") as f:
+                        output_str = f.read()
+            except Exception as err:
+                print(f"Error reading template {template}: {err}\n", file=sys.stderr)
+                use_minimal = True
+
+            if use_minimal:
+                print("Using internal minimal HTML that refers to d3's web site. JavaScript " +
+                      "loaded this way from a local file may be blocked unless your " +
+                      "browser has relaxed permissions. Run with '--allow-download' to fetch" +
+                      "the full D3 HTML template.", file=sys.stderr)
+                output_str = MINIMAL_HTML
+
+            elif template_md5sum:
+                assert output_str is not None
+                download_md5sum = hashlib.md5(output_str.encode("utf-8")).hexdigest()
+                if download_md5sum != template_md5sum:
+                    s = None
+                    while s not in ["y", "n"]:
+                        s = input(f"""Unexpected template md5sum.
+{download_md5sum} != {template_md5sum}, for:
+{template}
+continue?[yn] """).lower()
+                    if s == "n":
+                        sys.exit(1)
+
+            assert output_str is not None
+            output_str = output_str.replace("/** @options_json **/", options_json)
+            output_str = output_str.replace("/** @flamegraph_json **/", stacks_json)
+            output_fn = self.args.output or "flamegraph.html"
+        else:
+            output_str = stacks_json
+            output_fn = self.args.output or "stacks.json"
+
+        if output_fn == "-":
+            sys.stdout.write(output_str)
+        else:
+            print(f"dumping data to {output_fn}")
+            with open(output_fn, "w", encoding="utf-8") as out:
+                out.write(output_str)
+
+
+if __name__ == "__main__":
+    parser = argparse.ArgumentParser(description="Create flame graphs using perf python module.")
+    parser.add_argument("-f", "--format", default="html", choices=["json", "html"],
+                        help="output file format")
+    parser.add_argument("-o", "--output", help="output file name")
+    parser.add_argument("--template",
+                        default="/usr/share/d3-flame-graph/d3-flamegraph-base.html",
+                        help="path to flame graph HTML template")
+    parser.add_argument("--colorscheme", default="blue-green",
+                        help="flame graph color scheme", choices=["blue-green", "orange"])
+    parser.add_argument("-i", "--input", help="input perf.data file")
+    parser.add_argument("--allow-download", default=False, action="store_true",
+                        help="allow unprompted downloading of HTML template")
+    parser.add_argument("-e", "--event", default="", dest="event_name", type=str,
+                        help="specify the event to generate flamegraph for")
+
+    cli_args = parser.parse_args()
+    cli = FlameGraphCLI(cli_args)
+    cli.run()
-- 
2.54.0.545.g6539524ca2-goog


