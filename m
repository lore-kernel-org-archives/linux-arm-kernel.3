Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4102BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 00:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eryy+YJT09TinpK7TLn0VFQh3NTz7wAuAJ/KxptN2XM=; b=OnUJIQEE5n1vU3ZA8YjU2Q8DzS
	C+Ir9A1PGU7oojb2n+KRTfqFsBTh6EV1VV8Cx45SHyQZGPPEOW5r5HHMcaFEAtrKvs4GkSrC1lWAD
	n2aFmpBaSs5jiLe1q/HthtZZNgPAqw1yYPeusbGvzJk+QQZ7SWBFoymivov2Gf3h9QsNuZATvOrRI
	pU9lD4krv5jaozr7La3YRUmO1vjw4svO9EuYG3pNBTdbm0VMToQyBRJMwa4/fjNy4oXvz4Wl8tF1G
	7hC1KpBVtgA8anUj2rUVfdvvZkE3HIjevKwyJAWi7dsjYXlB7KMJOEUlpQ4nCcKcxKBgAf6h7cPwS
	rzxZkQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhEE-00000001Ap4-2p91;
	Sat, 07 Jun 2025 00:16:06 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvV-000000019A9-1X0O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:46 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2356ce55d33so32101695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 16:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254204; x=1749859004; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eryy+YJT09TinpK7TLn0VFQh3NTz7wAuAJ/KxptN2XM=;
        b=IimnKq0eIY7UDfoGn/OtU5jxDzfZugFGVLfLuttqofWsf7Un6SA04Rd7d7TfZHf3uH
         d5DErreFG+WCyVEls50KjrJG4glf5TPRdL1I5vD1keVFacT414KIGVHwh6GdjiOyGpjX
         /Buon2LzAg1GI4288hsZqxVw5WkqcF1QKW4rUDqmJAfYLV2ybpHWlKwLkwJ9r4f8YNq8
         3m0PjDEjvrlh7NcDRN2ugVC3+MUpKcVF3sF8IA3E/ef33VyrofkSd7dIqASpzjIFRsJt
         Pm18WqYIyWPD1GF3dO1apLEW4uChCeN8v00QO33z6PEAEQfviHFsFxmU/GMQJidpKIUx
         WCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254204; x=1749859004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eryy+YJT09TinpK7TLn0VFQh3NTz7wAuAJ/KxptN2XM=;
        b=cP5gXKR+RqW6p1qJcJgv71GF5VYuxzD3TXgI5rSwUWCsO1X+scJPsYnC8TvXwLF6fe
         aYQfaRC262MfYS/WfbbXCPXeC8PlQsq5Us0LMbf2EUC7dUMaBLqHmLTItgZ3+h3JT5S5
         bleR0jkI0QMOQWaHTqPxC902SBbg0sSkZO9dl3Ptk87IG4AOWWzQzyZs8+kB9YW0r2Pp
         5VvfLx7hN96Fw87iotEiB+AsFYdQz+jF3xIRreV5OTmbZM8zfGEmMpdP6BQonX5XijGu
         Q+GgiMlPcKW3eRZ2f/wU95aDZbwc7dPlUQr3B11wH9UGFXHJt4KaCTGMyzX1uM19fqDp
         g4zg==
X-Forwarded-Encrypted: i=1; AJvYcCX4IcXJAE23YgjLuzM546u0OtCc3JbIajOSZ5WKK1Du0PPGIkCSiKV+JGtylJygAOV47I/WGgntABDvCEdJN5EB@lists.infradead.org
X-Gm-Message-State: AOJu0YzVm8KjI8QQQ3Pfli/1gsWd8hOqNJPYzMUq4xaz3E/Uii9T7Dj+
	LZkWV36LMBWN6NxJA7mAK9i7m2qlaC8OC2rUe43lj1sw37rUqPORTKcLBhd5GnAo3LKRRrdLT0+
	KAy+ODneUVw==
X-Google-Smtp-Source: AGHT+IHoWyMkTDRUV9FORNhwP9EK3SZsd3ZxOrapFYSdtobGvViIWq2t5Q6eVMf+UJBQjw9Zhem7ol5n6al1
X-Received: from pgww16.prod.google.com ([2002:a05:6a02:2c90:b0:b2c:3dd5:8139])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc86:b0:235:e9fe:83c0
 with SMTP id d9443c01a7336-23601d18723mr75766385ad.27.1749254204307; Fri, 06
 Jun 2025 16:56:44 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:12 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-9-vipinsh@google.com>
Subject: [PATCH v2 08/15] KVM: selftests: Print sticky KVM Selftests Runner
 status at bottom
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165645_408815_94CDD11F 
X-CRM114-Status: GOOD (  10.67  )
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

Print current state of the KVM Selftest Runner during its execution.
Show it as the bottom most line, make it sticky and colored. Provide
the following information:
- Total number of tests selected for run.
- How many have executed.
- Total for each end state.

Example:

Total: 3/3 Passed: 1 Failed: 1 Skipped: 0 Timed Out: 0 No Run: 1

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/kvm/runner/test_runner.py        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 8f2372834104..e0da30d216a2 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -15,6 +15,7 @@ logger = logging.getLogger("runner")
 class TestRunner:
     def __init__(self, test_files, args):
         self.tests = []
+        self.status = {x: 0 for x in SelftestStatus}
         self.output_dir = args.output
         self.jobs = args.jobs
         self.print_status = args.print_status
@@ -34,7 +35,17 @@ class TestRunner:
         test.run()
         return test
 
+    def _sticky_update(self):
+        print(f"\r\033[1mTotal: {self.tests_ran}/{len(self.tests)}" \
+                f"\033[32;1m Passed: {self.status[SelftestStatus.PASSED]}" \
+                f"\033[31;1m Failed: {self.status[SelftestStatus.FAILED]}" \
+                f"\033[33;1m Skipped: {self.status[SelftestStatus.SKIPPED]}"\
+                f"\033[91;1m Timed Out: {self.status[SelftestStatus.TIMED_OUT]}"\
+                f"\033[34;1m No Run: {self.status[SelftestStatus.NO_RUN]}\033[0m", end="\r")
+
     def _log_result(self, test_result):
+        # Clear the status line
+        print("\033[2K", end="\r")
         logger.log(test_result.status,
                    f"[{test_result.status}] {test_result.test_path}")
         if (self.output_dir is None and self.print_status is False
@@ -46,8 +57,13 @@ class TestRunner:
             logger.info(test_result.stderr)
             logger.info("************** STDERR END **************")
 
+        self.status[test_result.status] += 1
+        # Sticky bottom line
+        self._sticky_update()
+
     def start(self):
         ret = 0
+        self.tests_ran = 0
 
         with concurrent.futures.ProcessPoolExecutor(max_workers=self.jobs) as executor:
             all_futures = []
@@ -57,9 +73,11 @@ class TestRunner:
 
             for future in concurrent.futures.as_completed(all_futures):
                 test_result = future.result()
+                self.tests_ran += 1
                 self._log_result(test_result)
                 if (test_result.status not in [SelftestStatus.PASSED,
                                                SelftestStatus.NO_RUN,
                                                SelftestStatus.SKIPPED]):
                     ret = 1
+        print("\n")
         return ret
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


