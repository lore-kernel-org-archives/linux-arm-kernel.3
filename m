Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ACCFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=; b=eZvuJkAebE2GOSjJeAq9bsiUPE
	Jl9+bxnJ0GCr7isoR45fkXr9CkBYf7pnv2ej6ugrKS6np6z7rRyvHzvd3jChtlubpM1o6sLERn2Ff
	Jb061F6L6iaseIbnULq/fEe0V1EbB5muHSI+6/Rgo+Lu3MSic2PD0CdRSmKeJtsZ2tCy7cTOXRI90
	ddAYxFiGNDuxse60Q8enuyha5Wt8109ynyoZ5xDUizBS1MqQm3KvQAfg2xEk9uxkxjQVsmmSQjUun
	5e2i0su5ZFamXjbhy0H3bqG4TdnZhVxVq01n0qBRBh9ceo/Jyau57THYDu4Lbzup4zbsFQkxUi7us
	6yc2MNgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh98-0000000EdTy-3r5s;
	Sat, 25 Apr 2026 17:50:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8f-0000000EcwM-49AI
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 17:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=; b=nxhWVrjgjerL4XKyHrg7HDdGox
	KLClFz8f6qVYQRglZtGWOl2aMe1rnpelZ/ClPdX3EMVoTxG6voaABALkJ6YHsC6p0kmJGPIgg0ozw
	eEvKEWpIiD6DK82Jn0WuDPA9hTyDJBf7xzttoRLAsbFeeoTaCCUmhpdH2hWMCd24InUNkARDBFVjb
	HG9d+jqNMUFUDg+x317i+E0v14VSohyi1OCi3HVWTmdZ0YrNbx0vVjeVeJ3cnFqiWTCfufCyxDRJx
	sV+j/0tE04BQqDmcGySiOeYefVcx9fNx29b9rxlaqH2868uSzi8bLaNnVNIxDqqHfPUNwI4Duljqy
	WaGQAj4w==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8c-0000000G8U7-3Aq5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:56 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so8702081eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139393; x=1777744193; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=;
        b=hlXdH/eY7KmX7PwnG0ufcr9w49+UlcewMRBiWyrEf2ODrI40SK4KafRBmJk+a765pH
         ouyzdA1Jmgd1DywBtoXQ/WQRQMHzWMlKvodmTlskIy6XdEab0Dwts109wJQrb8SlA2Wj
         VU/yAsrfLOmicPkqHr7FvEOYL5tKENhmLropaZAtd4kG9eH84YBQfWp+2bebz7nZ+0Y5
         ak9X2yW9UQLpZ+32MNJjPyUo/aN52Guoyf5Vic7q0MP88EWP+1ZYBLVwFYCPumEAxUfu
         NhAuYPw+yidmpDhBtkJ5W2u7peh1hqUUH4ZmXwP4OpNqT7wydPXXprfJEnCfz9HbDCJ6
         hviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139393; x=1777744193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLDLlf+sgEgN/cBLQvW28zSQKGyhqbeTTGXjAT4IZ18=;
        b=ScZwFtEPJ/jMVr3NHEua1I/4NB0HX8o/8+D9A4FpU/Gru2x4zKbrT/SnNH1YN89tAK
         cmlAg81gcF/hijBFOCoktLSL3BRN8wo8GeebUxHcYP0C7gfK/L1PWTFFrRXTiPNtEpFz
         SZaNYjMa2GOr47cxrfNsxrSeNNoHYOb+WdqgWqDmiynEjYSnu/oYlLWgw9SJ7lW32CgN
         0H66NWyu9YjODpULuZJH+5aC5yusbSGMWGBWUbCBmnakw/3G0b3iX6ofvhFCNsmdhPTe
         ycF41dJgRYr2SY2RrtQd3WLSo6Nwhk1I89bohPo+BQKn0SWe8vyQcdNkpl1ruD61hYfG
         di6w==
X-Forwarded-Encrypted: i=1; AFNElJ+jT/RTi2BCittuKPtFNU7Sh/35kEaCNxILIxo6ojAJ7HlsuxpR5oCdRNRdPtfieIP8EuQezD1o7k+oAf4ffflh@lists.infradead.org
X-Gm-Message-State: AOJu0YxoNyp9eLYe4IGSJFOeKOy7V1jYbz5JNit7SG6ZpUVr5gNFDRp4
	D1tAie+TVH1APImfagaoSa3xDl0t9eXIOhaLcBaFyQ08MI2dyDrgIE52NNXluzUdtOCYWnbjVI6
	a6aCMLMvpzA==
X-Received: from dyji40.prod.google.com ([2002:a05:7300:7a28:b0:2d8:dd18:baee])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:72d1:b0:2d2:d7b7:5c61
 with SMTP id 5a478bee46e88-2e477c9bd68mr20346170eec.14.1777139392399; Sat, 25
 Apr 2026 10:49:52 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:24 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-27-irogers@google.com>
Subject: [PATCH v6 26/59] perf mem-phys-addr: Port mem-phys-addr to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_184954_933272_F1B3EB75 
X-CRM114-Status: GOOD (  13.66  )
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


