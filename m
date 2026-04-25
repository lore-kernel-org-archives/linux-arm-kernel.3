Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71496FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6/DbS8+a0Bbu++hm0mIANNgnhHVu7X5dNuwNyZ3JIg=; b=XwdBAuCswiXBE5Q7PbAlC3jrJK
	58aV0xFV273BYe68/qHIhV38ZIpw5yiWVtfabzCHptf2FQ0AJHnlxFqJPwTFHaHY6NmEF5tKO1try
	38xFwm7Q1WK65DcN2AuVqfA4gcJ7omF9xTNBgsOD1zmFfQGg82/rIEsD4nVGksHp5NT8wwClPNeIW
	bwhcJUX1iz8Snw4PoLfCXnaGt10IzwTxcAjjtork2WNv+0Znz1w9Cqo+Id9i5W97EVY315qmZdaGF
	q9f3gGQiRieJHBVEvoJbHwykinlpU6SsVCauDIrAmu1VQSldyX9CGqDKqiQj91OAqMtqDahMxYXFS
	R1H37iHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGljR-0000000EvIJ-30FW;
	Sat, 25 Apr 2026 22:44:13 +0000
Received: from mail-dl1-f73.google.com ([74.125.82.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGli8-0000000Eu0l-3HRd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:43:10 +0000
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12c8ccc7593so10491480c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156971; x=1777761771; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6/DbS8+a0Bbu++hm0mIANNgnhHVu7X5dNuwNyZ3JIg=;
        b=SnGMntjCOwwks6Kc9RFHPLhAWYxsXICI+YOkkRp1+/QP6rNo5hpJZ1LdCGaGH5XXRa
         CPmRzFS1HgMVW0KicSyglXmc5J4JdhnNP+/sYmzs0LWi4sfplqrBUu4vDid8O45KSZqC
         u29Spp5K7DR5hyZWiTNrjihae606iW8jgLlBmVgvxTXMZqiksygxx/Cbjh/+dnbDwybV
         uc5B9mYv/pg2+7VHX259TRlYAAwdNU6ZygZXHA9OWS4Hxsuky2cuNQlXe5WsG4lSjuYc
         OkBQQuEK3KPWS3adiyDmnXrOFK6+IWZNEIclqAX/n6TT7ymoDIxa3gSw3ihGHy/7Bv55
         /iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156971; x=1777761771;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6/DbS8+a0Bbu++hm0mIANNgnhHVu7X5dNuwNyZ3JIg=;
        b=aFrkIc3CLsud+fAwKV1EsV5/TmlojAlJQ1XDlSmNPSzLderWJLz9BkFiq6UtmZhJGn
         jvvZLkZcws3skRfH4ApDvrQjmPWUyHRdrUqf9AgD+3oSfMOC+8XxCKNwtRwdjkIhhxIL
         dqpanbhrCxrDno9z88TVV31aU/kFY+d4O8gAGYF8IbFhknAL9rVQSLISq+qacLAf0H/8
         DE25KqQYfTwrKXMQRDKntzQhQYX55hHR4Tx4cqZCNF9PwPo01H5fXshd8odK3NgO0GDP
         hmbRP/BK+izGJ4+NBbbHeiqbGPMgou1DhwydrOS2LqHcnQvgEPyXZEVpkFeZ7Y+axmrO
         BzgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yDWySdl50lyN7+HugVQrEfbzAtQm2Y5bjmFSsWjJ0Ks8OT8kS94zh0bPg0Rnb+Gek3Cvzr2Mp3L2FJkORkGvr@lists.infradead.org
X-Gm-Message-State: AOJu0YwJKWoze4bUaIDMXo47dCtaP+q8W9jQX6M3ZPr7kVlTjRSotlZe
	2uzjTy2iNqRFr7ABEa0scn7qEtRlclLjI4vcmxmQNmmsXC4FJkV+FDexz29R55/NO3eavUq2Yyr
	mrZ5fue736g==
X-Received: from dlbts2-n2.prod.google.com ([2002:a05:7022:b042:20b0:128:cfd6:a3c6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6895:b0:12c:8e7f:1b30
 with SMTP id a92af1059eb24-12c8e7f1ca8mr13390417c88.2.1777156970724; Sat, 25
 Apr 2026 15:42:50 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:41:04 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-40-irogers@google.com>
Subject: [PATCH v7 39/59] perf intel-pt-events: Port intel-pt-events/libxed to
 use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154253_082080_96D1E1F5 
X-CRM114-Status: GOOD (  17.58  )
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

Ported from tools/perf/scripts/python/.
- Refactored intel-pt-events.py to use a class structure to eliminate
  global state and improve maintainability.
- Removed Python 2 compatibility checks.
- Renamed methods in libxed.py to snake_case (Instruction ->
  instruction, SetMode -> set_mode, DisassembleOne -> disassemble_one)
  to comply with pylint.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2:

1. Robustness in print_cbr : Added checks to ensure raw_buf is at
   least 12 bytes long and that the frequency divisor is not zero,
   avoiding struct.error and ZeroDivisionError .

2. Robustness in print_evt : Added buffer length checks in the loop to
   prevent struct.error if event data count exceeds available buffer.

3. Buffer Handling in disassem : Used
   ctypes.create_string_buffer(insn, 64) to properly initialize the
   buffer with raw bytes, preventing truncation on \x00 bytes.

4. Corrected Field Names: Reverted short names to sample_ip ,
   sample_time , and sample_cpu across multiple methods.

5. Comm Resolution: Used session.process(sample.sample_pid).comm() to
   get the thread name, rather than failing back to "Unknown" .

6. Event Name Cleanup: Stripped  evsel(  and  )  from event names.

7. Fixed Broken Pipe Handling: Prevented sys.stdout from being closed
   before exiting in the handler.

8. Eliminated Hardcoded Offset in libxed.py : Added
   xed_decoded_inst_get_length from the official LibXED API rather
   than relying on the hardcoded byte offset 166 .
---
 tools/perf/python/intel-pt-events.py | 435 +++++++++++++++++++++++++++
 tools/perf/python/libxed.py          | 122 ++++++++
 2 files changed, 557 insertions(+)
 create mode 100755 tools/perf/python/intel-pt-events.py
 create mode 100755 tools/perf/python/libxed.py

diff --git a/tools/perf/python/intel-pt-events.py b/tools/perf/python/intel-pt-events.py
new file mode 100755
index 000000000000..19a0faec8f5f
--- /dev/null
+++ b/tools/perf/python/intel-pt-events.py
@@ -0,0 +1,435 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Print Intel PT Events including Power Events and PTWRITE.
+Ported from tools/perf/scripts/python/intel-pt-events.py
+"""
+
+import argparse
+import contextlib
+from ctypes import addressof, create_string_buffer
+import io
+import os
+import struct
+import sys
+from typing import Any, Optional
+import perf
+
+# Try to import LibXED from legacy directory if available in PYTHONPATH
+try:
+    from libxed import LibXED  # type: ignore
+except ImportError:
+    LibXED = None  # type: ignore
+
+
+class IntelPTAnalyzer:
+    """Analyzes Intel PT events and prints details."""
+
+    def __init__(self, cfg: argparse.Namespace):
+        self.args = cfg
+        self.session: Optional[perf.session] = None
+        self.insn = False
+        self.src = False
+        self.source_file_name: Optional[str] = None
+        self.line_number: int = 0
+        self.dso: Optional[str] = None
+        self.stash_dict: dict[int, list[str]] = {}
+        self.output: Any = None
+        self.output_pos: int = 0
+        self.cpu: int = -1
+        self.time: int = 0
+        self.switch_str: dict[int, str] = {}
+
+        if cfg.insn_trace:
+            print("Intel PT Instruction Trace")
+            self.insn = True
+        elif cfg.src_trace:
+            print("Intel PT Source Trace")
+            self.insn = True
+            self.src = True
+        else:
+            print("Intel PT Branch Trace, Power Events, Event Trace and PTWRITE")
+
+        self.disassembler: Any = None
+        if self.insn and LibXED is not None:
+            try:
+                self.disassembler = LibXED()
+            except Exception as e:
+                print(f"Failed to initialize LibXED: {e}")
+                self.disassembler = None
+
+    def print_ptwrite(self, raw_buf: bytes) -> None:
+        """Print PTWRITE data."""
+        data = struct.unpack_from("<IQ", raw_buf)
+        flags = data[0]
+        payload = data[1]
+        exact_ip = flags & 1
+        try:
+            s = payload.to_bytes(8, "little").decode("ascii").rstrip("\x00")
+            if not s.isprintable():
+                s = ""
+        except (UnicodeDecodeError, ValueError):
+            s = ""
+        print(f"IP: {exact_ip} payload: {payload:#x} {s}", end=' ')
+
+    def print_cbr(self, raw_buf: bytes) -> None:
+        """Print CBR data."""
+        if len(raw_buf) < 12:
+            return
+        data = struct.unpack_from("<BBBBII", raw_buf)
+        cbr = data[0]
+        f = (data[4] + 500) // 1000
+        if data[2] == 0:
+            return
+        p = ((cbr * 1000 // data[2]) + 5) // 10
+        print(f"{cbr:3u}  freq: {f:4u} MHz  ({p:3u}%)", end=' ')
+
+    def print_mwait(self, raw_buf: bytes) -> None:
+        """Print MWAIT data."""
+        data = struct.unpack_from("<IQ", raw_buf)
+        payload = data[1]
+        hints = payload & 0xff
+        extensions = (payload >> 32) & 0x3
+        print(f"hints: {hints:#x} extensions: {extensions:#x}", end=' ')
+
+    def print_pwre(self, raw_buf: bytes) -> None:
+        """Print PWRE data."""
+        data = struct.unpack_from("<IQ", raw_buf)
+        payload = data[1]
+        hw = (payload >> 7) & 1
+        cstate = (payload >> 12) & 0xf
+        subcstate = (payload >> 8) & 0xf
+        print(f"hw: {hw} cstate: {cstate} sub-cstate: {subcstate}", end=' ')
+
+    def print_exstop(self, raw_buf: bytes) -> None:
+        """Print EXSTOP data."""
+        data = struct.unpack_from("<I", raw_buf)
+        flags = data[0]
+        exact_ip = flags & 1
+        print(f"IP: {exact_ip}", end=' ')
+
+    def print_pwrx(self, raw_buf: bytes) -> None:
+        """Print PWRX data."""
+        data = struct.unpack_from("<IQ", raw_buf)
+        payload = data[1]
+        deepest_cstate = payload & 0xf
+        last_cstate = (payload >> 4) & 0xf
+        wake_reason = (payload >> 8) & 0xf
+        print(f"deepest cstate: {deepest_cstate} last cstate: {last_cstate} "
+              f"wake reason: {wake_reason:#x}", end=' ')
+
+    def print_psb(self, raw_buf: bytes) -> None:
+        """Print PSB data."""
+        data = struct.unpack_from("<IQ", raw_buf)
+        offset = data[1]
+        print(f"offset: {offset:#x}", end=' ')
+
+    def print_evt(self, raw_buf: bytes) -> None:
+        """Print EVT data."""
+        glb_cfe = ["", "INTR", "IRET", "SMI", "RSM", "SIPI", "INIT", "VMENTRY", "VMEXIT",
+                   "VMEXIT_INTR", "SHUTDOWN", "", "UINT", "UIRET"] + [""] * 18
+        glb_evd = ["", "PFA", "VMXQ", "VMXR"] + [""] * 60
+
+        data = struct.unpack_from("<BBH", raw_buf)
+        typ = data[0] & 0x1f
+        ip_flag = (data[0] & 0x80) >> 7
+        vector = data[1]
+        evd_cnt = data[2]
+        s = glb_cfe[typ]
+        if s:
+            print(f" cfe: {s} IP: {ip_flag} vector: {vector}", end=' ')
+        else:
+            print(f" cfe: {typ} IP: {ip_flag} vector: {vector}", end=' ')
+        pos = 4
+        for _ in range(evd_cnt):
+            if len(raw_buf) < pos + 16:
+                break
+            data = struct.unpack_from("<QQ", raw_buf, pos)
+            et = data[0] & 0x3f
+            s = glb_evd[et]
+            if s:
+                print(f"{s}: {data[1]:#x}", end=' ')
+            else:
+                print(f"EVD_{et}: {data[1]:#x}", end=' ')
+            pos += 16
+
+    def print_iflag(self, raw_buf: bytes) -> None:
+        """Print IFLAG data."""
+        data = struct.unpack_from("<IQ", raw_buf)
+        iflag = data[0] & 1
+        old_iflag = iflag ^ 1
+        via_branch = data[0] & 2
+        s = "via" if via_branch else "non"
+        print(f"IFLAG: {old_iflag}->{iflag} {s} branch", end=' ')
+
+    def common_start_str(self, comm: str, sample: perf.sample_event) -> str:
+        """Return common start string for display."""
+        ts = sample.sample_time
+        cpu = sample.sample_cpu
+        pid = sample.sample_pid
+        tid = sample.tid
+        machine_pid = getattr(sample, "machine_pid", 0)
+        if machine_pid:
+            vcpu = getattr(sample, "vcpu", -1)
+            return (f"VM:{machine_pid:5d} VCPU:{vcpu:03d} {comm:>16s} {pid:5u}/{tid:<5u} "
+                    f"[{cpu:03u}] {ts // 1000000000:9u}.{ts % 1000000000:09u}  ")
+        return (f"{comm:>16s} {pid:5u}/{tid:<5u} [{cpu:03u}] "
+                f"{ts // 1000000000:9u}.{ts % 1000000000:09u}  ")
+
+    def print_common_start(self, comm: str, sample: perf.sample_event, name: str) -> None:
+        """Print common start info."""
+        flags_disp = getattr(sample, "flags_disp", "")
+        print(self.common_start_str(comm, sample) + f"{name:>8s}  {flags_disp:>21s}", end=' ')
+
+    def print_instructions_start(self, comm: str, sample: perf.sample_event) -> None:
+        """Print instructions start info."""
+        flags = getattr(sample, "flags_disp", "")
+        if "x" in flags:
+            print(self.common_start_str(comm, sample) + "x", end=' ')
+        else:
+            print(self.common_start_str(comm, sample), end='  ')
+
+    def disassem(self, insn: bytes, ip: int) -> tuple[int, str]:
+        """Disassemble instruction using LibXED."""
+        inst = self.disassembler.instruction()
+        self.disassembler.set_mode(inst, 0)  # Assume 64-bit
+        buf = create_string_buffer(insn, 64)
+        return self.disassembler.disassemble_one(inst, addressof(buf), len(insn), ip)
+
+    def print_common_ip(self, sample: perf.sample_event, symbol: str, dso: str) -> None:
+        """Print IP and symbol info."""
+        ip = sample.sample_ip
+        offs = f"+{sample.symoff:#x}" if hasattr(sample, "symoff") else ""
+        cyc_cnt = getattr(sample, "cyc_cnt", 0)
+        if cyc_cnt:
+            insn_cnt = getattr(sample, "insn_cnt", 0)
+            ipc_str = f"  IPC: {insn_cnt / cyc_cnt:#.2f} ({insn_cnt}/{cyc_cnt})"
+        else:
+            ipc_str = ""
+
+        if self.insn and self.disassembler is not None:
+            try:
+                insn = sample.insn()
+            except AttributeError:
+                insn = None
+            if insn:
+                cnt, text = self.disassem(insn, ip)
+                byte_str = (f"{ip:x}").rjust(16)
+                for k in range(cnt):
+                    byte_str += f" {insn[k]:02x}"
+                print(f"{byte_str:-40s}  {text:-30s}", end=' ')
+            print(f"{symbol}{offs} ({dso})", end=' ')
+        else:
+            print(f"{ip:16x} {symbol}{offs} ({dso})", end=' ')
+
+        addr_correlates_sym = getattr(sample, "addr_correlates_sym", False)
+        if addr_correlates_sym:
+            addr = sample.addr
+            addr_dso = getattr(sample, "addr_dso", "[unknown]")
+            addr_symbol = getattr(sample, "addr_symbol", "[unknown]")
+            addr_offs = f"+{sample.addr_symoff:#x}" if hasattr(sample, "addr_symoff") else ""
+            print(f"=> {addr:x} {addr_symbol}{addr_offs} ({addr_dso}){ipc_str}")
+        else:
+            print(ipc_str)
+
+    def print_srccode(self, comm: str, sample: perf.sample_event,
+                      symbol: str, dso: str, with_insn: bool) -> None:
+        """Print source code info."""
+        ip = sample.sample_ip
+        if symbol == "[unknown]":
+            start_str = self.common_start_str(comm, sample) + (f"{ip:x}").rjust(16).ljust(40)
+        else:
+            offs = f"+{sample.symoff:#x}" if hasattr(sample, "symoff") else ""
+            start_str = self.common_start_str(comm, sample) + (symbol + offs).ljust(40)
+
+        if with_insn and self.insn and self.disassembler is not None:
+            try:
+                insn = sample.insn()
+            except AttributeError:
+                insn = None
+            if insn:
+                _, text = self.disassem(insn, ip)
+                start_str += text.ljust(30)
+
+        try:
+            source_file_name, line_number, source_line = sample.srccode()
+        except (AttributeError, ValueError):
+            source_file_name, line_number, source_line = None, 0, None
+
+        if source_file_name:
+            if self.line_number == line_number and self.source_file_name == source_file_name:
+                src_str = ""
+            else:
+                if len(source_file_name) > 40:
+                    src_file = ("..." + source_file_name[-37:]) + " "
+                else:
+                    src_file = source_file_name.ljust(41)
+                if source_line is None:
+                    src_str = src_file + str(line_number).rjust(4) + " <source not found>"
+                else:
+                    src_str = src_file + str(line_number).rjust(4) + " " + source_line
+            self.dso = None
+        elif dso == self.dso:
+            src_str = ""
+        else:
+            src_str = dso
+            self.dso = dso
+
+        self.line_number = line_number
+        self.source_file_name = source_file_name
+        print(start_str, src_str)
+
+    def do_process_event(self, sample: perf.sample_event) -> None:
+        """Process event and print info."""
+        comm = "Unknown"
+        if hasattr(self, 'session') and self.session:
+            try:
+                comm = self.session.find_thread(sample.sample_pid).comm()
+            except Exception:
+                pass
+        name = getattr(sample.evsel, 'name', str(sample.evsel))
+        if name.startswith("evsel("):
+            name = name[6:-1]
+        dso = getattr(sample, "dso", "[unknown]")
+        symbol = getattr(sample, "symbol", "[unknown]")
+
+        cpu = sample.sample_cpu
+        if cpu in self.switch_str:
+            print(self.switch_str[cpu])
+            del self.switch_str[cpu]
+
+        try:
+            raw_buf = sample.raw_buf
+        except AttributeError:
+            raw_buf = b""
+
+        if name.startswith("instructions"):
+            if self.src:
+                self.print_srccode(comm, sample, symbol, dso, True)
+            else:
+                self.print_instructions_start(comm, sample)
+                self.print_common_ip(sample, symbol, dso)
+        elif name.startswith("branches"):
+            if self.src:
+                self.print_srccode(comm, sample, symbol, dso, False)
+            else:
+                self.print_common_start(comm, sample, name)
+                self.print_common_ip(sample, symbol, dso)
+        elif name == "ptwrite":
+            self.print_common_start(comm, sample, name)
+            self.print_ptwrite(raw_buf)
+            self.print_common_ip(sample, symbol, dso)
+        elif name == "cbr":
+            self.print_common_start(comm, sample, name)
+            self.print_cbr(raw_buf)
+            self.print_common_ip(sample, symbol, dso)
+        elif name == "mwait":
+            self.print_common_start(comm, sample, name)
+            self.print_mwait(raw_buf)
+            self.print_common_ip(sample, symbol, dso)
+        elif name == "pwre":
+            self.print_common_start(comm, sample, name)
+            self.print_pwre(raw_buf)
+            self.print_common_ip(sample, symbol, dso)
+        elif name == "exstop":
+            self.print_common_start(comm, sample, name)
+            self.print_exstop(raw_buf)
+            self.print_common_ip(sample, symbol, dso)
+        elif name == "pwrx":
+            self.print_common_start(comm, sample, name)
+            self.print_pwrx(raw_buf)
+            self.print_common_ip(sample, symbol, dso)
+        elif name == "psb":
+            self.print_common_start(comm, sample, name)
+            self.print_psb(raw_buf)
+            self.print_common_ip(sample, symbol, dso)
+        elif name == "evt":
+            self.print_common_start(comm, sample, name)
+            self.print_evt(raw_buf)
+            self.print_common_ip(sample, symbol, dso)
+        elif name == "iflag":
+            self.print_common_start(comm, sample, name)
+            self.print_iflag(raw_buf)
+            self.print_common_ip(sample, symbol, dso)
+        else:
+            self.print_common_start(comm, sample, name)
+            self.print_common_ip(sample, symbol, dso)
+
+    def interleave_events(self, sample: perf.sample_event) -> None:
+        """Interleave output to avoid garbled lines from different CPUs."""
+        self.cpu = sample.sample_cpu
+        ts = sample.sample_time
+
+        if self.time != ts:
+            self.time = ts
+            self.flush_stashed_output()
+
+        self.output_pos = 0
+        with contextlib.redirect_stdout(io.StringIO()) as self.output:
+            self.do_process_event(sample)
+
+        self.stash_output()
+
+    def stash_output(self) -> None:
+        """Stash output for later flushing."""
+        output_str = self.output.getvalue()[self.output_pos:]
+        n = len(output_str)
+        if n:
+            self.output_pos += n
+            if self.cpu not in self.stash_dict:
+                self.stash_dict[self.cpu] = []
+            self.stash_dict[self.cpu].append(output_str)
+            if len(self.stash_dict[self.cpu]) > 1000:
+                self.flush_stashed_output()
+
+    def flush_stashed_output(self) -> None:
+        """Flush stashed output."""
+        while self.stash_dict:
+            cpus = list(self.stash_dict.keys())
+            for cpu in cpus:
+                items = self.stash_dict[cpu]
+                countdown = self.args.interleave
+                while len(items) and countdown:
+                    sys.stdout.write(items[0])
+                    del items[0]
+                    countdown -= 1
+                if not items:
+                    del self.stash_dict[cpu]
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Wrapper to handle interleaving and exceptions."""
+        try:
+            if self.args.interleave:
+                self.interleave_events(sample)
+            else:
+                self.do_process_event(sample)
+        except BrokenPipeError:
+            # Stop python printing broken pipe errors and traceback
+            sys.stdout = open(os.devnull, 'w', encoding='utf-8')
+            sys.exit(1)
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser()
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    ap.add_argument("--insn-trace", action='store_true')
+    ap.add_argument("--src-trace", action='store_true')
+    ap.add_argument("--all-switch-events", action='store_true')
+    ap.add_argument("--interleave", type=int, nargs='?', const=4, default=0)
+    args = ap.parse_args()
+
+    analyzer = IntelPTAnalyzer(args)
+
+    try:
+        session = perf.session(perf.data(args.input), sample=analyzer.process_event)
+        analyzer.session = session
+        session.process_events()
+        if args.interleave:
+            analyzer.flush_stashed_output()
+        print("End")
+    except KeyboardInterrupt:
+        if args.interleave:
+            analyzer.flush_stashed_output()
+        print("End")
+    except Exception as e:
+        print(f"Error processing events: {e}")
diff --git a/tools/perf/python/libxed.py b/tools/perf/python/libxed.py
new file mode 100755
index 000000000000..0e622e6959c2
--- /dev/null
+++ b/tools/perf/python/libxed.py
@@ -0,0 +1,122 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Python wrapper for libxed.so
+Ported from tools/perf/scripts/python/libxed.py
+"""
+
+from ctypes import CDLL, Structure, create_string_buffer, addressof, sizeof, \
+                   c_void_p, c_byte, c_int, c_uint, c_ulonglong
+
+# To use Intel XED, libxed.so must be present. To build and install
+# libxed.so:
+#            git clone https://github.com/intelxed/mbuild.git mbuild
+#            git clone https://github.com/intelxed/xed
+#            cd xed
+#            ./mfile.py --share
+#            sudo ./mfile.py --prefix=/usr/local install
+#            sudo ldconfig
+#
+
+
+class XedStateT(Structure):
+    """xed_state_t structure."""
+    _fields_ = [
+        ("mode", c_int),
+        ("width", c_int)
+    ]
+
+
+class XEDInstruction():
+    """Represents a decoded instruction."""
+
+    def __init__(self, libxed):
+        # Current xed_decoded_inst_t structure is 192 bytes. Use 512 to allow for future expansion
+        xedd_t = c_byte * 512
+        self.xedd = xedd_t()
+        self.xedp = addressof(self.xedd)
+        libxed.xed_decoded_inst_zero(self.xedp)
+        self.state = XedStateT()
+        self.statep = addressof(self.state)
+        # Buffer for disassembled instruction text
+        self.buffer = create_string_buffer(256)
+        self.bufferp = addressof(self.buffer)
+
+
+class LibXED():
+    """Wrapper for libxed.so."""
+
+    def __init__(self):
+        try:
+            self.libxed = CDLL("libxed.so")
+        except OSError:
+            self.libxed = None
+        if not self.libxed:
+            try:
+                self.libxed = CDLL("/usr/local/lib/libxed.so")
+            except OSError:
+                self.libxed = None
+
+        if not self.libxed:
+            raise ImportError("libxed.so not found. Please install Intel XED.")
+
+        self.xed_tables_init = self.libxed.xed_tables_init
+        self.xed_tables_init.restype = None
+        self.xed_tables_init.argtypes = []
+
+        self.xed_decoded_inst_zero = self.libxed.xed_decoded_inst_zero
+        self.xed_decoded_inst_zero.restype = None
+        self.xed_decoded_inst_zero.argtypes = [c_void_p]
+
+        self.xed_operand_values_set_mode = self.libxed.xed_operand_values_set_mode
+        self.xed_operand_values_set_mode.restype = None
+        self.xed_operand_values_set_mode.argtypes = [c_void_p, c_void_p]
+
+        self.xed_decoded_inst_zero_keep_mode = self.libxed.xed_decoded_inst_zero_keep_mode
+        self.xed_decoded_inst_zero_keep_mode.restype = None
+        self.xed_decoded_inst_zero_keep_mode.argtypes = [c_void_p]
+
+        self.xed_decode = self.libxed.xed_decode
+        self.xed_decode.restype = c_int
+        self.xed_decode.argtypes = [c_void_p, c_void_p, c_uint]
+
+        self.xed_format_context = self.libxed.xed_format_context
+        self.xed_format_context.restype = c_uint
+        self.xed_format_context.argtypes = [
+            c_int, c_void_p, c_void_p, c_int, c_ulonglong, c_void_p, c_void_p
+        ]
+
+        self.xed_decoded_inst_get_length = self.libxed.xed_decoded_inst_get_length
+        self.xed_decoded_inst_get_length.restype = c_uint
+        self.xed_decoded_inst_get_length.argtypes = [c_void_p]
+
+        self.xed_tables_init()
+
+    def instruction(self):
+        """Create a new XEDInstruction."""
+        return XEDInstruction(self)
+
+    def set_mode(self, inst, mode):
+        """Set 32-bit or 64-bit mode."""
+        if mode:
+            inst.state.mode = 4  # 32-bit
+            inst.state.width = 4  # 4 bytes
+        else:
+            inst.state.mode = 1  # 64-bit
+            inst.state.width = 8  # 8 bytes
+        self.xed_operand_values_set_mode(inst.xedp, inst.statep)
+
+    def disassemble_one(self, inst, bytes_ptr, bytes_cnt, ip):
+        """Disassemble one instruction."""
+        self.xed_decoded_inst_zero_keep_mode(inst.xedp)
+        err = self.xed_decode(inst.xedp, bytes_ptr, bytes_cnt)
+        if err:
+            return 0, ""
+        # Use AT&T mode (2), alternative is Intel (3)
+        ok = self.xed_format_context(2, inst.xedp, inst.bufferp, sizeof(inst.buffer), ip, 0, 0)
+        if not ok:
+            return 0, ""
+
+        result = inst.buffer.value.decode('utf-8')
+        # Return instruction length and the disassembled instruction text
+        return self.xed_decoded_inst_get_length(inst.xedp), result
-- 
2.54.0.545.g6539524ca2-goog


