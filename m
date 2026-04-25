Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AA8FF8863
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=; b=WHXEO6Rn3ALhyDybFNaWAzkwbs
	uy2pQjH03LbdcYsDwX0ywKsmnFPy2wkjYnFdyfR1FM8EvtqKrDINmCxujZe0awfkepnjsiSg3ZVYw
	80nSOXkm19bJbX9Tkk2H6ewc9L5O4QHGeJ53Dh5wkNaPCz7snVj2n21cgd0m/hP0fPfjQz4r2xQ+u
	I8U2g4c+q8QY0xXeNyA1D0PX9vnWOYyIn434QqROBE0Gr0eu0JEhOPwyL1WDf110Rf6K7vlk2Nht1
	Gfwkut6PSyG9ffxbZtMdISDXEd6aMxyvLq6lUak3QIUpX1ZQrMqqEK3TvAbpgNoVxlazT/hcZlWm0
	SOWOZV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqV-0000000Ez6v-2yAR;
	Sat, 25 Apr 2026 22:51:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqE-0000000Eymk-00PE
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=; b=PviNFtdJqSOPwrtqZ9VIjjR5Qp
	oB/KDdlx+/WXw/xeefZ1qLhveQIqjIi9gNlEzkzcTfeuaB8U2kqm1Gcxx6hyPn3FWDHF0Cdy80lob
	LwfImQE0SNaFlESHKPMJC0XKTdTn3HA91XlM5LgO8XsVSCD7QK/H+56qkoortI7KxulcQGwh5yDo7
	BtC1HM159iq+xF1rcCT2/JKthSNg/T7rhST+OiUxz0E18Z/IVswallNzPgLuI5KmlrJbvgRbWjvrQ
	wq9b8bZrLmDUew/sBvLsFnGqyWn1yZMJdsXJ2ekpILjvqOvm1rGeNlIBxyi4qOdDuRMn18kNG7xLT
	SD5iUIfw==;
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlq9-0000000GMZo-1NoY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:51:12 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c726f4019so11833814c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157467; x=1777762267; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=;
        b=BqqGj/Fs7kItVQeOjvgglHwtEERJpiYkS6G9GE34OzUI9Fr57wh2J0SjBxj+Z+SaI2
         DvpJPRcGZ+V5UypgDNX/IAEA8cBSsi9Jz6rVfPxSyNHLgmKLaWAxeMPLJl8PVEYf1ocA
         3Abf8UVrfG+7OAEqAmjZrkkD+fBSLsE7WroCn17NGSBCXqAjfKdGRaP3lf322koIwjfA
         ppfDPRHBb3A/UKNePYPVAFrRq0owP5ybFJ8Ar6ehpTACGqv2INrF7VMZhTKyqXmHTIvd
         84aRCPUtSpIr0KjCJlAmUOcNVUWEfKqF1CN9YsjWjldf9D+6ZbHI5RuODTmRr2teiWsx
         j2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157467; x=1777762267;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=;
        b=O/YSztaH7UkxUznYzlKOQGnIoIQ97DuNNPaVeQ9FUp5i+ZKLufnNgJASYsAaC2yXEU
         GbkJbAkhLeUvrga+dDE/R1JQDqss1s2Qe5Bfg6DfSUo5RhvOaQ/Ax28G1tKSu5oxgXUR
         kf2fAr8Q6dUxgGgWPRjxq3b13SkWJG3yoMoRC4R75lwGDZgIqtlcGHcwmBifGQzUomMc
         D+mgJYygoZuVSPRqLIQ/ymuDsLqbX74Rzko7FlFiG0yX7jl1qqbSWs7ttPWsVp7ZpadV
         hD6oie90jRGY5Dzmbdrz6km7FD6WGaAwgc+2TVJcoVKGFSXruBi2iq1QbQ0PDGusiklF
         tUAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/s0x4n8YHk0IEwJ0UuYg+GqyexLYOpMw8T+KjuPtdEHn+0Bpncpbfqgd3Jc15LNS0tnmjZRekCkNLBbByWCs/4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2fofndWb/j6IMXitcQj8R7TKpYDjpMHvw28L8IIhKKC3vB/lo
	kSLEIj0fXBJhob8wy7QibkUMsrYB3byQvh67p6t+XJpiiYrHAR/3Ja2rHEQBHZm4q7tl5iI96Rq
	eF2C5H5s8dw==
X-Received: from dlbqq11.prod.google.com ([2002:a05:7022:ed0b:b0:12a:7182:6cb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4395:b0:128:d24a:a5ba
 with SMTP id a92af1059eb24-12c73f90c45mr19012420c88.20.1777157466999; Sat, 25
 Apr 2026 15:51:06 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:18 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-27-irogers@google.com>
Subject: [PATCH v7 26/59] perf mem-phys-addr: Port mem-phys-addr to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_235109_591096_10B7318E 
X-CRM114-Status: GOOD (  13.55  )
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


