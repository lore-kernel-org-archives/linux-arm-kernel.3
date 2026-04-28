Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C31FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=; b=uROfpN7FnOZtFZS/fcFxXnxbGq
	ibAYYfPrNV9yaR/1Nl3K7T2M7y/XAvQO+YPPNfAA0Gvtjrl0nqq7IHYbMfcNwofR5MNTLYW3ILHg6
	J0cBgbHT+bFwEbeytF1tWkjdSBtIXucR0LCiY0cMUg7yGvQv75/yPEXOx3VTLBnksCJkYde1pV/ft
	48kEKLHjuLTuTvKCFINeF26rUlwv2YSX5mH2Qw+BMKTmkRYM+kA+eyRPiVwfQjQwW7gh7fMjGohFx
	rrTCFAa/eN9x34jx119md5473kUOpBH8VUqrwWiAqMkYbmT/oFjffUfvhviwHBfOwLEoWCuUcNbTE
	Tb3OlMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcki-00000000hyo-0Tu4;
	Tue, 28 Apr 2026 07:21:04 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjr-00000000h2p-1cdY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:20:12 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2da19227bc1so27363589eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360810; x=1777965610; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=;
        b=b+Wq1aR5m89uMb3k6iNyVa/ydwOCVRlFFowA9aNouZA6vSOe5YBGbazFndOd4PPya5
         Op2Xv+tX3UL5tmkzy3k5uw4kM4TuV+RQbQX96cUfHvKi3PhaxGIjIsxE93drqxGOFmCR
         WBsLsaluola9z7C0/+XEOGdI9tijGpXi5OqgIhPPu8ixc2QUCYhmEcEEIsD3Gb8qhmf+
         q5feQhT59TtaUom7aE31NDGxA+mpkBe26PKCc+3LMVgPxv8co0723M0nW6Dts4sDz9iy
         4Xl43kVb5hoT6QElj+oqJSIdcuKVU8O4bQ9nlthrAcZsFUEl1t17Sr/MG1UjIrp3xJpQ
         tz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360810; x=1777965610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=;
        b=fVgt8gN/y6Nri8xAX0b5sHH+F6BsJgip2zxvchJCwAzUv3MgVTedxHsNhq62dufR9p
         6ulpUPeHA3ZoQFMmeIpHqI1YxZAUU19R8Q6jaFSUIw1jJ5he+aEp+hnH+gV7ja49gOlj
         WFyggIvBz+cuTQVwPBvPcW7UfkOZ/uWeDOEp3TPMYf0/TShtH+T7b1+r3GUSyVUJ0Rdh
         Y//9z6RMzr2DNykQAkf67mpbhBOwBlyvlaz2xOSmjcJFWWFLkZDvqEnDJGp4o+DNA5vi
         ebeFvruGa6DB1BrEn8Nxc03aW8ij2tlSFbT9d0/qNW2wTen+tW3ZBJqihiCqD2BvEiMb
         JO6g==
X-Forwarded-Encrypted: i=1; AFNElJ8AOz+Hkh31A02v3EVSL++YYUGinHsW4UJi8PlwonTbmpUMpjovQ+07Ib0gRUS3kOq03LCXMN+tAELnPir06xzF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9vchElrK7GfWPMr7zJWz3l+IpbHNM7pAYNJ1hVG3SKuGR86yo
	yHK4Jph3pp52fT+1z7KEL+nHnEaYMzJ+ozOO9z/0v6t0n55a5s2Cuab1VLId14j1I88xHJnFaBL
	vHU+l7sksIQ==
X-Received: from dybss20.prod.google.com ([2002:a05:7301:7214:b0:2e5:ce71:32c4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:578e:b0:2e5:8123:c7f3
 with SMTP id 5a478bee46e88-2ed0a185810mr1008644eec.28.1777360810143; Tue, 28
 Apr 2026 00:20:10 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:31 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-27-irogers@google.com>
Subject: [PATCH v8 26/58] perf mem-phys-addr: Port mem-phys-addr to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002011_465189_4CF93988 
X-CRM114-Status: GOOD (  14.65  )
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

Give an example of using the perf python session API to load a
perf.data file and perform the behavior of
tools/perf/scripts/python/mem-phys-addr.py.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2: Added command line '-i' option and cleaned up pylint issues.
---
 tools/perf/python/mem-phys-addr.py | 117 +++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100755 tools/perf/python/mem-phys-addr.py

diff --git a/tools/perf/python/mem-phys-addr.py b/tools/perf/python/mem-phys-addr.py
new file mode 100755
index 000000000000..ba874d7a2011
--- /dev/null
+++ b/tools/perf/python/mem-phys-addr.py
@@ -0,0 +1,117 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""mem-phys-addr.py: Resolve physical address samples"""
+import argparse
+import bisect
+import collections
+from dataclasses import dataclass
+import re
+from typing import (Dict, Optional)
+
+import perf
+
+@dataclass(frozen=True)
+class IomemEntry:
+    """Read from a line in /proc/iomem"""
+    begin: int
+    end: int
+    indent: int
+    label: str
+
+# Physical memory layout from /proc/iomem. Key is the indent and then
+# a list of ranges.
+iomem: Dict[int, list[IomemEntry]] = collections.defaultdict(list)
+# Child nodes from the iomem parent.
+children: Dict[IomemEntry, set[IomemEntry]] = collections.defaultdict(set)
+# Maximum indent seen before an entry in the iomem file.
+max_indent: int = 0
+# Count for each range of memory.
+load_mem_type_cnt: Dict[IomemEntry, int] = collections.Counter()
+# Perf event name set from the first sample in the data.
+event_name: Optional[str] = None
+
+def parse_iomem(iomem_path: str):
+    """Populate iomem from iomem file"""
+    global max_indent
+    with open(iomem_path, 'r', encoding='ascii') as f:
+        for line in f:
+            indent = 0
+            while line[indent] == ' ':
+                indent += 1
+            max_indent = max(max_indent, indent)
+            m = re.split('-|:', line, maxsplit=2)
+            begin = int(m[0], 16)
+            end = int(m[1], 16)
+            label = m[2].strip()
+            entry = IomemEntry(begin, end, indent, label)
+            # Before adding entry, search for a parent node using its begin.
+            if indent > 0:
+                parent = find_memory_type(begin)
+                assert parent, f"Given indent expected a parent for {label}"
+                children[parent].add(entry)
+            iomem[indent].append(entry)
+
+def find_memory_type(phys_addr) -> Optional[IomemEntry]:
+    """Search iomem for the range containing phys_addr with the maximum indent"""
+    for i in range(max_indent, -1, -1):
+        if i not in iomem:
+            continue
+        position = bisect.bisect_right(iomem[i], phys_addr,
+                                       key=lambda entry: entry.begin)
+        if position is None:
+            continue
+        iomem_entry = iomem[i][position-1]
+        if  iomem_entry.begin <= phys_addr <= iomem_entry.end:
+            return iomem_entry
+    print(f"Didn't find {phys_addr}")
+    return None
+
+def print_memory_type():
+    """Print the resolved memory types and their counts."""
+    print(f"Event: {event_name}")
+    print(f"{'Memory type':<40}  {'count':>10}  {'percentage':>10}")
+    print(f"{'-' * 40:<40}  {'-' * 10:>10}  {'-' * 10:>10}")
+    total = sum(load_mem_type_cnt.values())
+    # Add count from children into the parent.
+    for i in range(max_indent, -1, -1):
+        if i not in iomem:
+            continue
+        for entry in iomem[i]:
+            for child in children[entry]:
+                if load_mem_type_cnt[child] > 0:
+                    load_mem_type_cnt[entry] += load_mem_type_cnt[child]
+
+    def print_entries(entries):
+        """Print counts from parents down to their children"""
+        for entry in sorted(entries,
+                            key = lambda entry: load_mem_type_cnt[entry],
+                            reverse = True):
+            count = load_mem_type_cnt[entry]
+            if count > 0:
+                mem_type = ' ' * entry.indent + f"{entry.begin:x}-{entry.end:x} : {entry.label}"
+                percent = 100 * count / total
+                print(f"{mem_type:<40}  {count:>10}  {percent:>10.1f}")
+                print_entries(children[entry])
+
+    print_entries(iomem[0])
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(description="Resolve physical address samples")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    ap.add_argument("--iomem", default="/proc/iomem", help="Path to iomem file")
+    args = ap.parse_args()
+
+    def process_event(sample):
+        """Process a single sample event."""
+        phys_addr  = sample.sample_phys_addr
+        entry = find_memory_type(phys_addr)
+        if entry:
+            load_mem_type_cnt[entry] += 1
+
+            global event_name
+            if event_name is None:
+                event_name  = str(sample.evsel)
+
+    parse_iomem(args.iomem)
+    perf.session(perf.data(args.input), sample=process_event).process_events()
+    print_memory_type()
-- 
2.54.0.545.g6539524ca2-goog


