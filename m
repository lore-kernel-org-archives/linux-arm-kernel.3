Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FBCC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 00:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8z4WvBicEoN9caj+LocUILTDszd9KNhP2i6ClnV4SYQ=; b=qhm3C3+LI7P6tVL7n+qpipvj3t
	Tb8VfrSZXmngVP6vNz0haq5RcWXFtjaqZORTk5tHJVRJSznYkACoti//2JMUuIMNMKRXbv36urJwG
	e/ugR48qi9uMwNiH1rIfMukq3mOpj//U4qZzgySekNi1x1dqvkaZuv5RBFFqBPXs9tDF1Po7R+bBP
	cE94SoIEx3DNeV4vjJldLhpW6Kxm8KJYKuu9o7mjX8ArT/hfzcj3ajoa0EHIFVdpQ/o4QVxMkZByl
	8DohF2LcFoHe+S6U5tIpKufZxTzmwhxgXO0Pxe9h5VnMzqc0At8d7uvcLBs33etDWzNpjUOJN08oJ
	61oeSmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhC6-00000001Adj-40EP;
	Sat, 07 Jun 2025 00:13:54 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvU-0000000198y-0aBL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:45 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7377139d8b1so2154631b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 16:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254203; x=1749859003; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8z4WvBicEoN9caj+LocUILTDszd9KNhP2i6ClnV4SYQ=;
        b=M8AGE5tGL7XSVl08kSvUi/9ilS+69qLBWwnfk8MQr06vP/gFQxzOTe7hfP2VGDtRG7
         BfP3QfIBkVZkHLu7ptvKaDNUPhKAO/PMwM6ffZqQ9/nbgmsq7JAwClQfpdxmcmQna0uo
         56WIaE4+hUbLtT+5U8XLjtRgG/zudn2QBH8JC5373CieAm6Bshk5AND/7m4v4zbQaXzj
         FvA7x/NwigrttYSMwZO+hZsu0CiSDwkyjD5AWnGsx+b6nzYy78tVZoyfujzPQuvubROP
         NnUFZ8xoWNdSNTaYd2sF4PmUnoWYNJnILLhL3X3sMIUP0x0IBRNbfbdCRQVooSQWrsVd
         rNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254203; x=1749859003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8z4WvBicEoN9caj+LocUILTDszd9KNhP2i6ClnV4SYQ=;
        b=S7xn8f12V8U9uuG9h3kLbmrtXCaScV3cotki3TODvQh+cSnZ4h7wYjJfGovd3YAp8R
         N1kJzUiSZEMcuiSB/QYB9taKNrrYljlBUf/It9295s590XeO4RnpQi5j6lYnmnyc567X
         oXsH6bNBoGEbdsFSxeNLUWSIXHw+TxS1Ecxjho4G/UTH89WT7DYJ+gqFIfenRTQ5Shnl
         ENSkefIIedq3jbEbSt3Xp7zrn4kI78oF8JIGowlz/RI+aZmJ6Zkx78eW+4bpTIylz1L4
         LQhgQ3yselFRFbotvSp2YgcW0DZbiweFXtV/+2B5dzsnnHMPIj68GkWE1+TZrk4EfQb8
         iEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt35owWxX2Sf+rv8yKtrGUtWcLwDuX9tReupV/N80F+itRfb+nlxTZmhZccGN3qEqJ3wmftQ9xYYiupvCdzF3n@lists.infradead.org
X-Gm-Message-State: AOJu0YwuJcoU953eMuR4zvBvkrWFBGMTJjFWFxuDp4S+4qPzVMOa562z
	C2IujW3RVr8agpIruXo9MRIQs1g4HpuxHJwCXYZroV+hZ5u0n6dcbcyB9ZgyWZKGFREvUYSUL9y
	gK0x3OfwJ4g==
X-Google-Smtp-Source: AGHT+IHcrbHn9p0w2bYAvuft/4cgpIgfj6gM1mOsYQAwopTnS4Dm3TWFUPJLijBX/4q2FB3OKh1WxAvHIbCa
X-Received: from pfbdh10.prod.google.com ([2002:a05:6a00:478a:b0:747:aac7:7c2])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b4d:b0:748:3822:e8e0
 with SMTP id d2e1a72fcca58-7483822ef98mr1370463b3a.13.1749254202756; Fri, 06
 Jun 2025 16:56:42 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:11 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-8-vipinsh@google.com>
Subject: [PATCH v2 07/15] KVM: selftests: Add various print flags to KVM
 Selftest Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165644_172371_902961A0 
X-CRM114-Status: GOOD (  12.74  )
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

Add various print flags to selectively print outputs on terminal based
on test execution status (passed, failed, timed out, skipped, no run).

Provide further options to print only particular execution status, like
print only status of failed tests.

Example: To print status, stdout and stderr for failed tests and only
print status of passed test:

   python3 runner --test-dirs tests  --print-failed \
   --print-passed-status

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  | 114 ++++++++++++++++++
 .../selftests/kvm/runner/test_runner.py       |  10 +-
 2 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 3f11a20e76a9..4406d8e4847a 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -64,9 +64,115 @@ def cli():
                         default=False,
                         help="Print only test's status and avoid printing stdout and stderr of the tests")
 
+    parser.add_argument("--print-passed",
+                        action="store_true",
+                        default=False,
+                        help="Print passed test's stdout, stderr and status."
+                        )
+
+    parser.add_argument("--print-passed-status",
+                        action="store_true",
+                        default=False,
+                        help="Print only passed test's status."
+                        )
+
+    parser.add_argument("--print-failed",
+                        action="store_true",
+                        default=False,
+                        help="Print failed test's stdout, stderr and status."
+                        )
+
+    parser.add_argument("--print-failed-status",
+                        action="store_true",
+                        default=False,
+                        help="Print only failed test's status."
+                        )
+
+    parser.add_argument("--print-skipped",
+                        action="store_true",
+                        default=False,
+                        help="Print skipped test's stdout, stderr and status."
+                        )
+
+    parser.add_argument("--print-skipped-status",
+                        action="store_true",
+                        default=False,
+                        help="Print only skipped test's status."
+                        )
+
+    parser.add_argument("--print-timed-out",
+                        action="store_true",
+                        default=False,
+                        help="Print timed out test's stdout, stderr and status."
+                        )
+
+    parser.add_argument("--print-timed-out-status",
+                        action="store_true",
+                        default=False,
+                        help="Print only timed out test's status."
+                        )
+
+    parser.add_argument("--print-no-runs",
+                        action="store_true",
+                        default=False,
+                        help="Print stdout, stderr and status for tests which didn't run."
+                        )
+
+    parser.add_argument("--print-no-runs-status",
+                        action="store_true",
+                        default=False,
+                        help="Print only tests which didn't run."
+                        )
+
     return parser.parse_args()
 
 
+def level_filters(args):
+    # Levels added here will be printed by logger.
+    levels = set()
+
+    if args.print_passed or args.print_passed_status or args.print_status:
+        levels.add(SelftestStatus.PASSED)
+
+    if args.print_failed or args.print_failed_status or args.print_status:
+        levels.add(SelftestStatus.FAILED)
+
+    if args.print_skipped or args.print_skipped_status or args.print_status:
+        levels.add(SelftestStatus.SKIPPED)
+
+    if args.print_timed_out or args.print_timed_out_status or args.print_status:
+        levels.add(SelftestStatus.TIMED_OUT)
+
+    if args.print_no_runs or args.print_no_runs_status or args.print_status:
+        levels.add(SelftestStatus.NO_RUN)
+
+    # Nothing set explicitly, enable all.
+    if not levels:
+        args.print_passed = True
+        levels.add(SelftestStatus.PASSED)
+
+        args.print_failed = True
+        levels.add(SelftestStatus.FAILED)
+
+        args.print_skipped = True
+        levels.add(SelftestStatus.SKIPPED)
+
+        args.print_timed_out = True
+        levels.add(SelftestStatus.TIMED_OUT)
+
+        args.print_no_runs = True
+        levels.add(SelftestStatus.NO_RUN)
+
+    levels.add(logging.NOTSET)
+    levels.add(logging.DEBUG)
+    levels.add(logging.INFO)
+    levels.add(logging.WARN)
+    levels.add(logging.ERROR)
+    levels.add(logging.CRITICAL)
+
+    return levels
+
+
 def setup_logging(args):
     class TerminalColorFormatter(logging.Formatter):
         reset = "\033[0m"
@@ -91,6 +197,13 @@ def setup_logging(args):
             return (self.COLORS.get(record.levelno, "") +
                     super().format(record) + self.reset)
 
+    class LevelFilter:
+        def __init__(self, levels):
+            self.levels = levels
+
+        def filter(self, record):
+            return record.levelno in self.levels
+
     logger = logging.getLogger("runner")
     logger.setLevel(logging.INFO)
 
@@ -102,6 +215,7 @@ def setup_logging(args):
     ch = logging.StreamHandler()
     ch_formatter = TerminalColorFormatter(**formatter_args)
     ch.setFormatter(ch_formatter)
+    ch.addFilter(LevelFilter(level_filters(args)))
     logger.addHandler(ch)
 
     if args.output != None:
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 474408fcab51..8f2372834104 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -18,6 +18,13 @@ class TestRunner:
         self.output_dir = args.output
         self.jobs = args.jobs
         self.print_status = args.print_status
+        self.print_stds = {
+            SelftestStatus.PASSED: args.print_passed,
+            SelftestStatus.FAILED: args.print_failed,
+            SelftestStatus.SKIPPED: args.print_skipped,
+            SelftestStatus.TIMED_OUT: args.print_timed_out,
+            SelftestStatus.NO_RUN: args.print_no_runs
+        }
 
         for test_file in test_files:
             self.tests.append(Selftest(test_file, args.executable,
@@ -30,7 +37,8 @@ class TestRunner:
     def _log_result(self, test_result):
         logger.log(test_result.status,
                    f"[{test_result.status}] {test_result.test_path}")
-        if (self.output_dir is None and self.print_status is False):
+        if (self.output_dir is None and self.print_status is False
+                and self.print_stds.get(test_result.status, True)):
             logger.info("************** STDOUT BEGIN **************")
             logger.info(test_result.stdout)
             logger.info("************** STDOUT END **************")
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


