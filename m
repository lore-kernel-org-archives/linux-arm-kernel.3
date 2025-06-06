Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98EFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 00:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+5Bd7zkjIDO1H+lfyodM1++vUZ5mljRsfn//VOCKL0=; b=QlLldBx76HsbKxyE+El6SIZRLT
	55QCdghL4cy4Wa93a2pWc/19VN/GSz6TakYmi2Z2rmO3YHlZ1jE8f3RkIH0gOI3FqWBm8dz8m02Qz
	uiDZWPlh5dYkd6qGPwEs3eG4pqV2DXrNTWgIR6WJiCjxniDft7M/y12lWcbvAnvFv1y0HFRFx1q9J
	ZhU1JrPKgsuF++abpisi+qHFeQPHKJxjy9AaYaelSgX1I1W//MLJ23gb52UwYmXvWsCDMkSaOp+LZ
	EvUPKoDWKjW0ZjsTnl7uICw6vco/Gv8OSm/vXJncp4KdzGMqZlKk06VJPjl6y6liRqm/M74ARMsPo
	7kr9E/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNh5p-00000001A8w-32iK;
	Sat, 07 Jun 2025 00:07:25 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvP-0000000196Q-1pbo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:40 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2355651d204so24664315ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 16:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254198; x=1749858998; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+5Bd7zkjIDO1H+lfyodM1++vUZ5mljRsfn//VOCKL0=;
        b=fQiNdKk/XP0pES/nvW6DemDDIAekx+QOCKKWoz2yn43bh96qIt7bZvOawzXuZoFpvU
         gnh+ZQE2n9+fFH8KY+vH9qguT7iTJHB3ypOfrIj15aWisD5EuBrSr999Bji1J+AiuuSl
         7BzGQqhD53ZpNFYGY8fQCfhMrNOQj3yjj9Ost5gFrA8GGwu3y9cSnf14ZYmvXTdf3cyW
         0F61P9MwCmJrIhx1ec41J5AsRW7XgNXR8FzYefpoRLEFS/m/xPkKqjgQXgjoZJoP9Q2N
         alVvHeoCgz7JAYNG72vzlZbWbb70pe01g0aov79faKotMkUzbeMjteL3Iy7QG2IQFZwc
         zK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254198; x=1749858998;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+5Bd7zkjIDO1H+lfyodM1++vUZ5mljRsfn//VOCKL0=;
        b=V3BqX1gMBZYPuhnkjjtkFdSHhhGZwVWiOwgFVh5FlJ7XAMDpUQ3VWUOFXxKebqxKYA
         dmkcBJO0S1ngXk3Ex7axyx8st5SqAhNtRdQ1TD3N+BV6pOn0qQFLOtUMhWey/9UhYE/C
         q9vph3c7XG5VYWIZwHLN19mTtA6L3KgQyAGWrZ5VXuPKpmsMOG3cxNNMGuinjRZ6XNmp
         zTNQ6fWJyRnyIlB1y2SmPaD6YOJgXE2XWzrdMLfxYWkVSo3neE63vmPyQWFnv3tkml4q
         YTr9FsIs/1wwpx7n3ieq5pGuCeosqnte73oLgH9Yi444LtqFPN8U29zBhhZ/kDDqpFW6
         fUfA==
X-Forwarded-Encrypted: i=1; AJvYcCWYvOERpUAW/476HQa8RhPe8G1RGpSuoOf4hGFLdNkBml9fBoHZ0yoJE3eKH6DVLlE/XZtLRARc5WVE8soEnxcX@lists.infradead.org
X-Gm-Message-State: AOJu0YzsvsUGnxNsnrcfh2PSlY2N448roxizq2T28TjmXlC3J8nJ35Eo
	THVNuOdL2pg4nDRnnYEs3YFCChOfLtNSomoORJYJm6XKnGQEh5TeRnaRiGnbRa/JTLHZ8mqnH0X
	EDBhcAJpWjQ==
X-Google-Smtp-Source: AGHT+IHU/sU0ESGBwoHFbRLLuKr1fUnbJgHvmdDkRH8dhCDT6jHEHhlFqQcWVOeHKmjkrwzUfyxEHDaa/fs2
X-Received: from pjbsb7.prod.google.com ([2002:a17:90b:50c7:b0:312:391e:a230])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54c:b0:234:9066:c857
 with SMTP id d9443c01a7336-23601e50d77mr66571995ad.21.1749254198048; Fri, 06
 Jun 2025 16:56:38 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:08 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-5-vipinsh@google.com>
Subject: [PATCH v2 04/15] KVM: selftests: Add option to save selftest runner
 output to a directory
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165639_477473_C3D4A092 
X-CRM114-Status: GOOD (  13.44  )
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

Add a command line flag, --output/-o, to selftest runner which enables to
save individual tests output (stdout & stderr) stream to a directory in
a hierarchical way. Create folder hierarchy same as tests hieararcy
given by --test-files and --test-dirs.

Also, add a command line flag, --append-output-time, which will append
timestamp (format YYYY.M.DD.HH.MM.SS) to the directory name given in
--output flag.

Example:
  python3 runner --test-dirs test -o test_result --append_output_time

This will create test_result.2025.06.06.08.45.57 directory.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  | 30 ++++++++++++++++--
 tools/testing/selftests/kvm/runner/command.py | 31 +++++++++++++++++--
 .../testing/selftests/kvm/runner/selftest.py  |  8 +++--
 .../selftests/kvm/runner/test_runner.py       | 17 +++++-----
 4 files changed, 72 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index f7f679be0e03..54bdc248b13f 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -7,6 +7,8 @@ import argparse
 import logging
 import os
 import sys
+import datetime
+import pathlib
 
 from test_runner import TestRunner
 from selftest import SelftestStatus
@@ -41,6 +43,16 @@ def cli():
                         type=int,
                         help="Timeout, in seconds, before runner kills the running test. (Default: 120 seconds)")
 
+    parser.add_argument("-o",
+                        "--output",
+                        nargs='?',
+                        help="Dumps test runner output which includes each test execution result, their stdouts and stderrs hierarchically in the given directory.")
+
+    parser.add_argument("--append-output-time",
+                        action="store_true",
+                        default=False,
+                        help="Appends timestamp to the output directory.")
+
     return parser.parse_args()
 
 
@@ -71,12 +83,26 @@ def setup_logging(args):
     logger = logging.getLogger("runner")
     logger.setLevel(logging.INFO)
 
+    formatter_args = {
+        "fmt": "%(asctime)s | %(message)s",
+        "datefmt": "%H:%M:%S"
+    }
+
     ch = logging.StreamHandler()
-    ch_formatter = TerminalColorFormatter(fmt="%(asctime)s | %(message)s",
-                                          datefmt="%H:%M:%S")
+    ch_formatter = TerminalColorFormatter(**formatter_args)
     ch.setFormatter(ch_formatter)
     logger.addHandler(ch)
 
+    if args.output != None:
+        if (args.append_output_time):
+            args.output += datetime.datetime.now().strftime(".%Y.%m.%d.%H.%M.%S")
+        pathlib.Path(args.output).mkdir(parents=True, exist_ok=True)
+        logging_file = os.path.join(args.output, "log")
+        fh = logging.FileHandler(logging_file)
+        fh_formatter = logging.Formatter(**formatter_args)
+        fh.setFormatter(fh_formatter)
+        logger.addHandler(fh)
+
 
 def fetch_tests_from_dirs(scan_dirs):
     test_files = []
diff --git a/tools/testing/selftests/kvm/runner/command.py b/tools/testing/selftests/kvm/runner/command.py
index 44c8e0875779..6f6b1811b490 100644
--- a/tools/testing/selftests/kvm/runner/command.py
+++ b/tools/testing/selftests/kvm/runner/command.py
@@ -4,6 +4,9 @@
 # Author: vipinsh@google.com (Vipin Sharma)
 
 import subprocess
+import pathlib
+import contextlib
+import os
 
 
 class Command:
@@ -12,17 +15,39 @@ class Command:
     Returns the exit code, std output and std error of the command.
     """
 
-    def __init__(self, command, timeout):
+    def __init__(self, command, timeout, output_dir):
         self.command = command
         self.timeout = timeout
+        self.output_dir = output_dir
 
-    def run(self):
+    def _run(self, output=None, error=None):
         run_args = {
             "universal_newlines": True,
             "shell": True,
-            "capture_output": True,
             "timeout": self.timeout,
         }
 
+        if output is None and error is None:
+            run_args.update({"capture_output": True})
+        else:
+            run_args.update({"stdout": output, "stderr": error})
+
         proc = subprocess.run(self.command, **run_args)
         return proc.returncode, proc.stdout, proc.stderr
+
+    def run(self):
+        if self.output_dir is not None:
+            pathlib.Path(self.output_dir).mkdir(parents=True, exist_ok=True)
+
+        output = None
+        error = None
+        with contextlib.ExitStack() as stack:
+            if self.output_dir is not None:
+                output_path = os.path.join(self.output_dir, "stdout")
+                output = stack.enter_context(
+                    open(output_path, encoding="utf-8", mode="w"))
+
+                error_path = os.path.join(self.output_dir, "stderr")
+                error = stack.enter_context(
+                    open(error_path, encoding="utf-8", mode="w"))
+            return self._run(output, error)
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
index 4c72108c47de..664958c693e5 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -32,7 +32,7 @@ class Selftest:
     Extract the test execution command from test file and executes it.
     """
 
-    def __init__(self, test_path, executable_dir, timeout):
+    def __init__(self, test_path, executable_dir, timeout, output_dir):
         test_command = pathlib.Path(test_path).read_text().strip()
         if not test_command:
             raise ValueError("Empty test command in " + test_path)
@@ -40,7 +40,11 @@ class Selftest:
         test_command = os.path.join(executable_dir, test_command)
         self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
         self.test_path = test_path
-        self.command = command.Command(test_command, timeout)
+
+        if output_dir is not None:
+            output_dir = os.path.join(output_dir, test_path.lstrip("/"))
+        self.command = command.Command(test_command, timeout, output_dir)
+
         self.status = SelftestStatus.NO_RUN
         self.stdout = ""
         self.stderr = ""
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 1409e1cfe7d5..0501d77a9912 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -13,19 +13,22 @@ logger = logging.getLogger("runner")
 class TestRunner:
     def __init__(self, test_files, args):
         self.tests = []
+        self.output_dir = args.output
 
         for test_file in test_files:
-            self.tests.append(Selftest(test_file, args.executable, args.timeout))
+            self.tests.append(Selftest(test_file, args.executable,
+                                       args.timeout, args.output))
 
     def _log_result(self, test_result):
         logger.log(test_result.status,
                    f"[{test_result.status}] {test_result.test_path}")
-        logger.info("************** STDOUT BEGIN **************")
-        logger.info(test_result.stdout)
-        logger.info("************** STDOUT END **************")
-        logger.info("************** STDERR BEGIN **************")
-        logger.info(test_result.stderr)
-        logger.info("************** STDERR END **************")
+        if (self.output_dir is None):
+            logger.info("************** STDOUT BEGIN **************")
+            logger.info(test_result.stdout)
+            logger.info("************** STDOUT END **************")
+            logger.info("************** STDERR BEGIN **************")
+            logger.info(test_result.stderr)
+            logger.info("************** STDERR END **************")
 
     def start(self):
         ret = 0
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


