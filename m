Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CBDC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 00:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGljYTvaXC7QnacTzvG5Nj4iX8W+IqA3xJgvnGBwRTM=; b=w1NXXrix37T2UKBUcZA96HPjLm
	FFTuxqkBZZ1zEJsIfM03f2zwokUifBf9FE4LcgXOQ6fLewdvluXwj8/xfBu6v5pbtq45VoKeDc1d4
	93q2iZP49Ik3lWRvKX8/1+oyZXmZtnIjprS0b5g2qcSVfJ34WiRdKabz36sMcoJvOVhS27vEu+OZ2
	E3Y0hMAXf2t4q0n4pJ+9mGFaPAI5Mqq3//Dj/ysKNJqHtGNo+egAeZtu1WzV/VOOtFnAngal8g5z3
	iS853d90OUnDiP/j/W8Kxcd85U6NgEYc71R0rflTQ4jpIJNFZOdf6zuSOtkaCbxj5Og8WJrkLSB4Y
	QPHP1nog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNh3j-000000019yz-0eqb;
	Sat, 07 Jun 2025 00:05:15 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvN-0000000195k-1GFN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:38 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b2f4c436301so1695762a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 16:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254196; x=1749858996; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGljYTvaXC7QnacTzvG5Nj4iX8W+IqA3xJgvnGBwRTM=;
        b=NkW+EfpTejGIvabNcLHXqquvxurHcmB3nJ4xvUTOrP4hqlkih2uy0naoBqJIvtgfTz
         9vEqJgQKs1yKnPGOB57q+ArHW8NrpVp2ZsuTfsTHtsBsSChgRHGmb90xnaqiLoeHaVWs
         truCDAtdGBMojU5H14IBa26ppV9pzQ68Ip3z6+UbUzZTGqnJgwoghOyL4uwSw01iA7qx
         XLDhug+WnVH0B4qLNliS/XNiAonBHLRfmz/reyr1Cdfd5tFhpGB3k2ii8EhPznOl/3L+
         ZfiosjcJcx8lfMppfnSQp/8zpyARj7lnatsG+9vhN/t6CbBtU3PXwjU6Wd6NTCBZuuiR
         EXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254196; x=1749858996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGljYTvaXC7QnacTzvG5Nj4iX8W+IqA3xJgvnGBwRTM=;
        b=jWOp2/Cykhz4dJwsYpp59t9at1VDgilVDu4mS7EZSSogyg7tsSqF/051/2qgEgTdrp
         LszA6J30KGVq0QW1TQh/I1pPj3DGS8lbhs6Iv1+lZAwPdCdS8SnKWCG/2Em8A8vmB2MD
         f3ptiAAEPANpk4zYpUIbC1P7N0VnsgFOrzjRGKKypxmx8gtTsurHYXClDnMOeQPfdesS
         rNYeQl0s1wFBYKZ3HEofOVShkN6Fc+SfbGP4I4ZEqhewOOwONE7wzxox9CkMW8oTWLT0
         QfvaQLVmikMvR6MoGVTbtRlqnAr9gU28YLhpRo92Ig5RFjPSkodzN2O+9u0v6J9v4ZBr
         CdTw==
X-Forwarded-Encrypted: i=1; AJvYcCVV67RrfIIiyxmg9PMktIp/gHkvU2d89lsntbsvzj/OMD055NRl9bAbsRvkl3tH1eTuYnILD9ncgDiAebG4udGy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/8xxDl9ceD+nYXb0FV5Yx2GxLK30HyF5yFIL5FT6nAnYhDnNV
	wvOf0o15M83BvO3p52VdoqMmrAn8ywklnRPdScmCau9iEsSTj2FLrnQ4yqmMSKEt+1fuc4umRK+
	oPX8MsEbjhQ==
X-Google-Smtp-Source: AGHT+IEf6/EQQaFCn2+ilqOXhsd43GYZymP8LG9LnvyyGFrCPkId69cOH/yRMcziE3S42F6gZpobhUsXtO4j
X-Received: from pfhx2.prod.google.com ([2002:a05:6a00:1882:b0:747:abae:78e8])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3942:b0:215:e44c:831f
 with SMTP id adf61e73a8af0-21ee2559924mr7260991637.4.1749254196463; Fri, 06
 Jun 2025 16:56:36 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:07 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-4-vipinsh@google.com>
Subject: [PATCH v2 03/15] KVM: selftests: Add timeout option in selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165637_339512_95348023 
X-CRM114-Status: GOOD (  16.07  )
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

Add a command line argument in KVM selftest runner to limit amount of
time (seconds) given to a test for execution. Kill the test if it exceeds the
given value. Define a new SelftestStatus.TIMED_OUT to denote a selftest
final result. Add terminal color for status messages of timed out tests.

Set the default value of 120 seconds for all tests.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  | 10 +++++++-
 tools/testing/selftests/kvm/runner/command.py |  4 +++-
 .../testing/selftests/kvm/runner/selftest.py  | 23 +++++++++++--------
 .../selftests/kvm/runner/test_runner.py       |  2 +-
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 599300831504..f7f679be0e03 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -35,6 +35,12 @@ def cli():
                         default=".",
                         help="Finds the test executables in the given directory. Default is the current directory.")
 
+    parser.add_argument("-t",
+                        "--timeout",
+                        default=120,
+                        type=int,
+                        help="Timeout, in seconds, before runner kills the running test. (Default: 120 seconds)")
+
     return parser.parse_args()
 
 
@@ -42,6 +48,7 @@ def setup_logging(args):
     class TerminalColorFormatter(logging.Formatter):
         reset = "\033[0m"
         red_bold = "\033[31;1m"
+        red = "\033[31;1m"
         green = "\033[32m"
         yellow = "\033[33m"
         blue = "\033[34m"
@@ -50,7 +57,8 @@ def setup_logging(args):
             SelftestStatus.PASSED: green,
             SelftestStatus.NO_RUN: blue,
             SelftestStatus.SKIPPED: yellow,
-            SelftestStatus.FAILED: red_bold
+            SelftestStatus.FAILED: red_bold,
+            SelftestStatus.TIMED_OUT: red
         }
 
         def __init__(self, fmt=None, datefmt=None):
diff --git a/tools/testing/selftests/kvm/runner/command.py b/tools/testing/selftests/kvm/runner/command.py
index a63ff53a92b3..44c8e0875779 100644
--- a/tools/testing/selftests/kvm/runner/command.py
+++ b/tools/testing/selftests/kvm/runner/command.py
@@ -12,14 +12,16 @@ class Command:
     Returns the exit code, std output and std error of the command.
     """
 
-    def __init__(self, command):
+    def __init__(self, command, timeout):
         self.command = command
+        self.timeout = timeout
 
     def run(self):
         run_args = {
             "universal_newlines": True,
             "shell": True,
             "capture_output": True,
+            "timeout": self.timeout,
         }
 
         proc = subprocess.run(self.command, **run_args)
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
index a0b06f150087..4c72108c47de 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -7,6 +7,7 @@ import command
 import pathlib
 import enum
 import os
+import subprocess
 
 
 class SelftestStatus(enum.IntEnum):
@@ -18,6 +19,7 @@ class SelftestStatus(enum.IntEnum):
     NO_RUN = 22
     SKIPPED = 23
     FAILED = 24
+    TIMED_OUT = 25
 
     def __str__(self):
         return str.__str__(self.name)
@@ -30,7 +32,7 @@ class Selftest:
     Extract the test execution command from test file and executes it.
     """
 
-    def __init__(self, test_path, executable_dir):
+    def __init__(self, test_path, executable_dir, timeout):
         test_command = pathlib.Path(test_path).read_text().strip()
         if not test_command:
             raise ValueError("Empty test command in " + test_path)
@@ -38,7 +40,7 @@ class Selftest:
         test_command = os.path.join(executable_dir, test_command)
         self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
         self.test_path = test_path
-        self.command = command.Command(test_command)
+        self.command = command.Command(test_command, timeout)
         self.status = SelftestStatus.NO_RUN
         self.stdout = ""
         self.stderr = ""
@@ -48,10 +50,13 @@ class Selftest:
             self.stderr = "File doesn't exists."
             return
 
-        ret, self.stdout, self.stderr = self.command.run()
-        if ret == 0:
-            self.status = SelftestStatus.PASSED
-        elif ret == 4:
-            self.status = SelftestStatus.SKIPPED
-        else:
-            self.status = SelftestStatus.FAILED
+        try:
+            ret, self.stdout, self.stderr = self.command.run()
+            if ret == 0:
+                self.status = SelftestStatus.PASSED
+            elif ret == 4:
+                self.status = SelftestStatus.SKIPPED
+            else:
+                self.status = SelftestStatus.FAILED
+        except subprocess.TimeoutExpired as e:
+            self.status = SelftestStatus.TIMED_OUT
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 104f0b4c2e4e..1409e1cfe7d5 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -15,7 +15,7 @@ class TestRunner:
         self.tests = []
 
         for test_file in test_files:
-            self.tests.append(Selftest(test_file, args.executable))
+            self.tests.append(Selftest(test_file, args.executable, args.timeout))
 
     def _log_result(self, test_result):
         logger.log(test_result.status,
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


