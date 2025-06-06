Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A38FC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 00:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odBjuILvJ2GdKU4pLjfdkzpf7BXKuFiwJq3tj2s6sYU=; b=iNsnol+Qeiwhx9T4XdV5NO0MpG
	43mfypQ2gac3HASqew9NKamkbiRl99hOKpeTksqVZg7NHBEsOVSWWKpUUSg3NK3vYbWLwU71qBn7D
	I0sHDRbwZJKZF0fikl4LuSespN4pX8GflTX8xed7JSfaeUufdwgox0eTnvDQLs++wF20Ldm4vDgrG
	cETOUxgUq19fd8+WzHxFwE+hvAwVNhcz3awzeqARQF6K/hUmgeGyd+edoRZiXSELwkS+ulsD0XZiK
	PchF+sDmesndNe6p8+KqcKQF9znD4JJ9omDlcE2HMutppnP+wwgNtLpIcgJhQinLEhCqufVzsObz4
	naiyUV6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNh7u-00000001AFk-1hLk;
	Sat, 07 Jun 2025 00:09:34 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvQ-00000001978-1oLw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:41 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7425efba1a3so2231942b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 16:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254199; x=1749858999; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=odBjuILvJ2GdKU4pLjfdkzpf7BXKuFiwJq3tj2s6sYU=;
        b=G9s0j0KTaPc6dgrzusMQNUjb7QRejds2Q3Ou26emmb3FnKHmqqqNv6rdAxY58CHqCy
         L6UN14h5+218BI3jdij4FnlfZUDQ2UjP2HNKmEvU3UsuZ6A3ZewHPbxrCZydM2wYmBJo
         LYr22JCibxbsHpR1y9ZfksrFteSmNE+vWBDTWGvRvFnMBB1snc6NyXOgMVv+VY7GAjXk
         +KOUbDyWwKIb6jvLWczlNGDGx19T4AyuTMX6ePr78TBPoEPV/RIXW7siryk9QDqtSGxs
         Fu4+B/NIVoLl/lxFrGKZYJTS/YfbJEDa/wy3eivY0Hq70BRKrbUrlwj23hO2T7cBxKmB
         SoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254199; x=1749858999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odBjuILvJ2GdKU4pLjfdkzpf7BXKuFiwJq3tj2s6sYU=;
        b=r4CL3MUCk6dIBZtVlF1YTrRArJNCusWjBhruTrHLtJXZNaarB8dQ8LhXNSHYhJS/DX
         W5Ei5ROclJDuYYDDHIxaaZlcRQZAEKycDRLgp8nKNOrAUgQ2apecAtk2SG47tWnRJyPx
         TJHy2O0Dec+hKKZZvNpQ0qVgF9SvUnG5AMekBBpWBiYEW0XMz1H4v2HqSUwbWoAkBeu0
         rSURQFSkS/5AvaZjAN3uxd5Qg6BJmHUGezih/pvGWwVU/Y3g7g8MnU73mkunyaJbbyLC
         Lw4hiudPJlMehn3PJkTkV4ymJ20yMWMN5w8Xk/1hkWPL6CbTtj6mFdEt6gKnCA3Ph+ri
         x0qA==
X-Forwarded-Encrypted: i=1; AJvYcCVqabdqE3QiIqJU1UeMjNJmnIvR6/yOjoHyHqu0IvUGqEkelHHIL15sPoSQumryp6dhRxZDczyWi3pD7GcoGLav@lists.infradead.org
X-Gm-Message-State: AOJu0YxheePGlOZcRd/O5bQzHFeUNOas/P15A746agfmERQ7+aYSmJCf
	PlqH1TLVl658XAl1E2upmi9X23Iv3OZJ7wgkwnmGRN6Zeq/t9DZtyahUay2pPhWLZABL92WE45X
	X00ZlRseANQ==
X-Google-Smtp-Source: AGHT+IGnW9KI2of5eZ8NHRy+qdCq1b5yQNAN8DIiVg4G8sw5Oy+cQExkg27C/Z3d87sRoL1HT8Zeqsd2ie1W
X-Received: from pfbca27.prod.google.com ([2002:a05:6a00:419b:b0:746:1bf8:e16])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:94a0:b0:746:2217:5863
 with SMTP id d2e1a72fcca58-74839af6c88mr624028b3a.6.1749254199608; Fri, 06
 Jun 2025 16:56:39 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:09 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-6-vipinsh@google.com>
Subject: [PATCH v2 05/15] KVM: selftests: Run tests concurrently in KVM
 selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165640_486337_AE8CB02A 
X-CRM114-Status: GOOD (  12.92  )
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

Add a command line argument, --jobs, to specify how many tests can
execute concurrently. Set default to 1.

Example:
  python3 runner --test-dirs tests -j 10

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  |  6 ++++
 .../selftests/kvm/runner/test_runner.py       | 28 +++++++++++++------
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 54bdc248b13f..48d7ce00a097 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -53,6 +53,12 @@ def cli():
                         default=False,
                         help="Appends timestamp to the output directory.")
 
+    parser.add_argument("-j",
+                        "--jobs",
+                        default=1,
+                        type=int,
+                        help="Maximum number of tests that can be run concurrently. (Default: 1)")
+
     return parser.parse_args()
 
 
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 0501d77a9912..0a6e5e0ca0f5 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -4,6 +4,8 @@
 # Author: vipinsh@google.com (Vipin Sharma)
 
 import logging
+import concurrent.futures
+
 from selftest import Selftest
 from selftest import SelftestStatus
 
@@ -14,11 +16,16 @@ class TestRunner:
     def __init__(self, test_files, args):
         self.tests = []
         self.output_dir = args.output
+        self.jobs = args.jobs
 
         for test_file in test_files:
             self.tests.append(Selftest(test_file, args.executable,
                                        args.timeout, args.output))
 
+    def _run_test(self, test):
+        test.run()
+        return test
+
     def _log_result(self, test_result):
         logger.log(test_result.status,
                    f"[{test_result.status}] {test_result.test_path}")
@@ -33,12 +40,17 @@ class TestRunner:
     def start(self):
         ret = 0
 
-        for test in self.tests:
-            test.run()
-            self._log_result(test)
-
-            if (test.status not in [SelftestStatus.PASSED,
-                                    SelftestStatus.NO_RUN,
-                                    SelftestStatus.SKIPPED]):
-                ret = 1
+        with concurrent.futures.ProcessPoolExecutor(max_workers=self.jobs) as executor:
+            all_futures = []
+            for test in self.tests:
+                future = executor.submit(self._run_test, test)
+                all_futures.append(future)
+
+            for future in concurrent.futures.as_completed(all_futures):
+                test_result = future.result()
+                self._log_result(test_result)
+                if (test_result.status not in [SelftestStatus.PASSED,
+                                               SelftestStatus.NO_RUN,
+                                               SelftestStatus.SKIPPED]):
+                    ret = 1
         return ret
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


