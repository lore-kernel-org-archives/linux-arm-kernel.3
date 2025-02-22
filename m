Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C95C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 01:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9ETAjvvalTxJAz5WZGNMYcUgNTOmlxvFzAQwoX+eOc=; b=WLWVSBETEoo4/JYqAOO1sBvz+t
	eqTXmB7ZYvZr+TW5Lm/ca9/43h+ZcLq0+F3xOXM894wHdzjyZ1zwvW+/ymBxbzHYTQ/73+0NyQKVQ
	pksKgMlikeCplOGXm7ONCzahQGxlPyF6lQPx7VHtijgKpRlJCkKBaSD4pBl+Fj64yWx+C4ItL297b
	CFVVJ1xEMCqSOVuQky28RlkqHfC+EERVXHVp78HtXgDYijjMEKOT4itSOlbszJumAFso9Gbo2xGHo
	H79CeMjGjBOkSxfRfFcNEI4w+ppZUK3bt0++6mXooIlnhTITM3Ei/p2CtHH/EJy33MQ/xiLHuyWHC
	X5Cis/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tldwK-00000007GPm-2jfK;
	Sat, 22 Feb 2025 01:04:20 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlds2-00000007Fyh-1e2P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 00:59:55 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fc4fc93262so5887668a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 16:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740185991; x=1740790791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9ETAjvvalTxJAz5WZGNMYcUgNTOmlxvFzAQwoX+eOc=;
        b=vCSAO3gUq1QOp0/HlGElDxa04uWo/MnXIQ1rqVOnS4fVtMkK3aqKbkPw6GIXJ+/DNJ
         ywuNv/gRx6DA0OArhxg+FbY0cacSe6D70vHeRjRmbinGLsJomZvtwnfFBpDUpwzDky+E
         XXrLUwKe8MWwlmpIEh2eyRmJDTO/5ZqFVXsKQKffVXo8zYcJ9i66xX4wUlkkkCXEgUbh
         kFacuU+dnH5U+WCK3W7i3y9/6yLreVmCWSYnV3Iz+bmVzOlGVysgV+jDytAu5J0Ch/a4
         6cLl2nB7R9BhceCQktIXEI1RoKD4Aezw/RVntTXBSLcZhq4FsnOsy7fxatbc4N0v9Btv
         BiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740185991; x=1740790791;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S9ETAjvvalTxJAz5WZGNMYcUgNTOmlxvFzAQwoX+eOc=;
        b=xPgsF42bgn3WM40jr3P0GkcR96AjcvvIwx6FbPWxf03YRGL29UMj/BNALoDMSOTWT3
         ighvJenMqG4iDbc3d33sDjpC623MTLjnqJWBGaHZ6qN5Q6hb+n2p4WRDDexfCVeovsU3
         FcrOy79AAoa+UmXCOwahI6rzjc7onnxQmSchVzi7nOSIfWM/TZg5r1fpn1OPq/BZLsX7
         7kBAhkQtjbph41I9ousBCVsNh74G70ovKQs4ViAPcjJNhvHjfJ30qpxzHvkkpHJmGRVd
         qTZ+va8loOmP5lHkWZQhSteFRErZ3mWhDMw/EQGJ7ynOPi8TEW1LEw7/SJglVjDkkZj9
         Y6ew==
X-Forwarded-Encrypted: i=1; AJvYcCWDEtONSdbEh8g5FsdPQFosW2mnqR4X3MvqProLCQ0YEtytQF2JvGFtyJPU/ptNuBod10/Z7unpdmanNfQrgkkW@lists.infradead.org
X-Gm-Message-State: AOJu0YzGU7C2CWoPK1A9/MqYNSU0Dt7gO1rRjSf6gn9dRBoPUvyJae8Q
	0Nx8dRMPIRJIBwWP9NmxRs7lQzslP2yhCOHBLGajF9+m1/p7FHh6aymYaOBXdl2bdToPmu/2TPT
	lePVRKw==
X-Google-Smtp-Source: AGHT+IHCI1eCveOzHRO9wymEe+6WfTHE/ANfyN9OtDD+61Q0zEDS7M7t5/7XLTAP4RotsZhFw+AuUixUqPQf
X-Received: from pjg5.prod.google.com ([2002:a17:90b:3f45:b0:2ef:d136:17fc])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:41:b0:2fa:228d:5b03
 with SMTP id 98e67ed59e1d1-2fce78abcd9mr8111088a91.19.1740185991168; Fri, 21
 Feb 2025 16:59:51 -0800 (PST)
Date: Fri, 21 Feb 2025 16:59:30 -0800
In-Reply-To: <20250222005943.3348627-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250222005943.3348627-1-vipinsh@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250222005943.3348627-3-vipinsh@google.com>
Subject: [PATCH 2/2] KVM: selftests: Create KVM selftest runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_165954_427548_87059B6A 
X-CRM114-Status: GOOD (  20.26  )
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

Create KVM selftest runner to run selftests and provide various options
for execution.

Provide following features in the runner:
1. --timeout/-t: Max time each test should finish in before killing it.
2. --jobs/-j: Run these many tests in parallel.
3. --tests: Provide space separated path of tests to execute.
4. --test_dirs: Directories to search for test files and run them.
5. --output/-o: Create the folder with given name and dump output of
   each test in a hierarchical way.
6. Add summary at the end.

Runner needs testcase files which are provided in the previous patch.
Following are the examples to start the runner (cwd is
tools/testing/selftests/kvm)

- Basic run:
  python3 runner --test_dirs testcases

- Run specific test
  python3 runner --tests ./testcases/dirty_log_perf_test/default.test

- Run tests parallel
  python3 runner --test_dirs testcases -j 10

- Run 5 tests parallely at a time, with the timeout of 10 seconds and
  dump output in "result" directory
  python3 runner --test_dirs testcases -j 5 -t 10 --output result

Sample output from the above command:

python3_binary runner --test_dirs testcases -j 5 -t 10 --output result

2025-02-21 16:45:46,774 | 16809 |     INFO | [Passed] testcases/guest_print=
_test/default.test
2025-02-21 16:45:47,040 | 16809 |     INFO | [Passed] testcases/kvm_create_=
max_vcpus/default.test
2025-02-21 16:45:49,244 | 16809 |     INFO | [Passed] testcases/dirty_log_p=
erf_test/default.test
...
2025-02-21 16:46:07,225 | 16809 |     INFO | [Passed] testcases/x86_64/pmu_=
event_filter_test/default.test
2025-02-21 16:46:08,020 | 16809 |     INFO | [Passed] testcases/x86_64/vmx_=
preemption_timer_test/default.test
2025-02-21 16:46:09,734 | 16809 |     INFO | [Timed out] testcases/x86_64/p=
mu_counters_test/default.test
2025-02-21 16:46:10,202 | 16809 |     INFO | [Passed] testcases/hardware_di=
sable_test/default.test
2025-02-21 16:46:10,203 | 16809 |     INFO | Tests ran: 85 tests
2025-02-21 16:46:10,204 | 16809 |     INFO | Passed: 61
2025-02-21 16:46:10,204 | 16809 |     INFO | Failed: 4
2025-02-21 16:46:10,204 | 16809 |     INFO | Skipped: 17
2025-02-21 16:46:10,204 | 16809 |     INFO | Timed out: 3
2025-02-21 16:46:10,204 | 16809 |     INFO | No run: 0

Output dumped in result directory

$ tree result/
result/
=E2=94=9C=E2=94=80=E2=94=80 log
=E2=94=94=E2=94=80=E2=94=80 testcases
    =E2=94=9C=E2=94=80=E2=94=80 access_tracking_perf_test
    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 default.test
    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 stderr
    =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 stdout
    =E2=94=9C=E2=94=80=E2=94=80 coalesced_io_test
    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 default.test
    =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 stderr
    =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 stdout
...

results/log file will have the status of each test like the one printed
on console. Each stderr and stdout will have data based on the
execution.

Runner is implemented in python and needs at least 3.6 version.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/.gitignore        |  1 +
 .../testing/selftests/kvm/runner/__main__.py  | 96 +++++++++++++++++++
 tools/testing/selftests/kvm/runner/command.py | 42 ++++++++
 .../testing/selftests/kvm/runner/selftest.py  | 49 ++++++++++
 .../selftests/kvm/runner/test_runner.py       | 40 ++++++++
 5 files changed, 228 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/runner/__main__.py
 create mode 100644 tools/testing/selftests/kvm/runner/command.py
 create mode 100644 tools/testing/selftests/kvm/runner/selftest.py
 create mode 100644 tools/testing/selftests/kvm/runner/test_runner.py

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftes=
ts/kvm/.gitignore
index 550b7c2b4a0c..a23fd4b2cb5f 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -11,3 +11,4 @@
 !Makefile
 !Makefile.kvm
 !*.test
+!*.py
diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing=
/selftests/kvm/runner/__main__.py
new file mode 100644
index 000000000000..008d862757f2
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0
+import pathlib
+import argparse
+import platform
+import logging
+import os
+import enum
+import test_runner
+
+
+def cli():
+    parser =3D argparse.ArgumentParser(
+        prog=3D"KVM Selftests Runner",
+        description=3D"Run KVM selftests with different configurations",
+        formatter_class=3Dargparse.RawTextHelpFormatter
+    )
+
+    parser.add_argument("--tests",
+                        nargs=3D"*",
+                        default=3D[],
+                        help=3D"Test cases to run. Provide the space separ=
ated test case file paths")
+
+    parser.add_argument("--test_dirs",
+                        nargs=3D"*",
+                        default=3D[],
+                        help=3D"Run tests in the given directory and all i=
ts sub directories. Provide the space separated paths to add multiple direc=
tories.")
+
+    parser.add_argument("-j",
+                        "--jobs",
+                        default=3D1,
+                        type=3Dint,
+                        help=3D"Number of parallel test runners to start")
+
+    parser.add_argument("-t",
+                        "--timeout",
+                        default=3D120,
+                        type=3Dint,
+                        help=3D"How long to wait for a single test to fini=
sh before killing it")
+
+    parser.add_argument("-o",
+                        "--output",
+                        nargs=3D'?',
+                        help=3D"Output directory for test results.")
+
+    return parser.parse_args()
+
+
+def setup_logging(args):
+    output =3D args.output
+    if output =3D=3D None:
+        logging.basicConfig(level=3Dlogging.INFO,
+                            format=3D"%(asctime)s | %(process)d | %(leveln=
ame)8s | %(message)s")
+    else:
+        logging_file =3D os.path.join(output, "log")
+        pathlib.Path(output).mkdir(parents=3DTrue, exist_ok=3DTrue)
+        logging.basicConfig(level=3Dlogging.INFO,
+                            format=3D"%(asctime)s | %(process)d | %(leveln=
ame)8s | %(message)s",
+                            handlers=3D[
+                                logging.FileHandler(logging_file, mode=3D'=
w'),
+                                logging.StreamHandler()
+                            ])
+
+
+def fetch_tests_from_dirs(scan_dirs, exclude_dirs):
+    test_files =3D []
+    for scan_dir in scan_dirs:
+        for root, dirs, files in os.walk(scan_dir):
+            dirs[:] =3D [dir for dir in dirs if dir not in exclude_dirs]
+            for file in files:
+                test_files.append(os.path.join(root, file))
+    return test_files
+
+
+def fetch_test_files(args):
+    exclude_dirs =3D ["aarch64", "x86_64", "riscv", "s390x"]
+    # Don't exclude tests of the current platform
+    exclude_dirs.remove(platform.machine())
+
+    test_files =3D args.tests
+    test_files.extend(fetch_tests_from_dirs(args.test_dirs, exclude_dirs))
+    # Remove duplicates
+    test_files =3D list(dict.fromkeys(test_files))
+    return test_files
+
+
+def main():
+    args =3D cli()
+    setup_logging(args)
+    test_files =3D fetch_test_files(args)
+    tr =3D test_runner.TestRunner(
+        test_files, args.output, args.timeout, args.jobs)
+    tr.start()
+
+
+if __name__ =3D=3D "__main__":
+    main()
diff --git a/tools/testing/selftests/kvm/runner/command.py b/tools/testing/=
selftests/kvm/runner/command.py
new file mode 100644
index 000000000000..a58f16fe4542
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/command.py
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+import contextlib
+import subprocess
+import os
+import pathlib
+
+
+class Command:
+    """Executes a command
+
+    Just execute a command. Dump output to the directory if provided.
+
+    Returns the exit code of the command.
+    """
+
+    def __init__(self, command, timeout=3DNone, output_dir=3DNone):
+        self.command =3D command
+        self.timeout =3D timeout
+        self.output_dir =3D output_dir
+
+    def __run(self, output=3DNone, error=3DNone):
+        proc =3D subprocess.run(self.command, stdout=3Doutput,
+                              stderr=3Derror, universal_newlines=3DTrue,
+                              shell=3DTrue, timeout=3Dself.timeout)
+        return proc.returncode
+
+    def run(self):
+        if self.output_dir is not None:
+            pathlib.Path(self.output_dir).mkdir(parents=3DTrue, exist_ok=
=3DTrue)
+
+        output =3D None
+        error =3D None
+        with contextlib.ExitStack() as stack:
+            if self.output_dir is not None:
+                output_path =3D os.path.join(self.output_dir, "stdout")
+                output =3D stack.enter_context(
+                    open(output_path, encoding=3D"utf-8", mode=3D"w"))
+
+                error_path =3D os.path.join(self.output_dir, "stderr")
+                error =3D stack.enter_context(
+                    open(error_path, encoding=3D"utf-8", mode=3D"w"))
+            return self.__run(output, error)
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing=
/selftests/kvm/runner/selftest.py
new file mode 100644
index 000000000000..cdf5d1085c08
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0
+import subprocess
+import command
+import pathlib
+import enum
+import os
+import logging
+
+
+class SelftestStatus(str, enum.Enum):
+    PASSED =3D "Passed"
+    FAILED =3D "Failed"
+    SKIPPED =3D "Skipped"
+    TIMED_OUT =3D "Timed out"
+    NO_RUN =3D "No run"
+
+    def __str__(self):
+        return str.__str__(self)
+
+
+class Selftest:
+    """A single test.
+
+    A test which can be run on its own.
+    """
+
+    def __init__(self, test_path, output_dir=3DNone, timeout=3DNone,):
+        test_command =3D pathlib.Path(test_path).read_text().strip()
+        if not test_command:
+            raise ValueError("Empty test command in " + test_path)
+
+        if output_dir is not None:
+            output_dir =3D os.path.join(output_dir, test_path)
+        self.test_path =3D test_path
+        self.command =3D command.Command(test_command, timeout, output_dir=
)
+        self.status =3D SelftestStatus.NO_RUN
+
+    def run(self):
+        try:
+            ret =3D self.command.run()
+            if ret =3D=3D 0:
+                self.status =3D SelftestStatus.PASSED
+            elif ret =3D=3D 4:
+                self.status =3D SelftestStatus.SKIPPED
+            else:
+                self.status =3D SelftestStatus.FAILED
+        except subprocess.TimeoutExpired as e:
+            # logging.error(type(e).__name__ + str(e))
+            self.status =3D SelftestStatus.TIMED_OUT
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/test=
ing/selftests/kvm/runner/test_runner.py
new file mode 100644
index 000000000000..b9d34c20bf88
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0
+import queue
+import concurrent.futures
+import logging
+import time
+import selftest
+
+
+class TestRunner:
+    def __init__(self, test_files, output_dir, timeout, parallelism):
+        self.parallelism =3D parallelism
+        self.tests =3D []
+
+        for test_file in test_files:
+            self.tests.append(selftest.Selftest(
+                test_file, output_dir, timeout))
+
+    def _run(self, test):
+        test.run()
+        return test
+
+    def start(self):
+
+        status =3D {x: 0 for x in selftest.SelftestStatus}
+        count =3D 0
+        with concurrent.futures.ProcessPoolExecutor(max_workers=3Dself.par=
allelism) as executor:
+            all_futures =3D []
+            for test in self.tests:
+                future =3D executor.submit(self._run, test)
+                all_futures.append(future)
+
+            for future in concurrent.futures.as_completed(all_futures):
+                test =3D future.result()
+                logging.info(f"[{test.status}] {test.test_path}")
+                status[test.status] +=3D 1
+                count +=3D 1
+
+        logging.info(f"Tests ran: {count} tests")
+        for result, count in status.items():
+            logging.info(f"{result}: {count}")
--=20
2.48.1.601.g30ceb7b040-goog


