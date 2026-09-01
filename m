Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C7EC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cdp+bm1mdsMMRA3P0qz+QQPcUs8yHc+X7Osf02oZ5Qw=; b=vX3e7qLyelnYpZhbDMONwPJ2e/
	BHjm1TZ5UQMmOx+RXcPFVbUla8n1Hghmv/JRENnzcNexa24AZl9pSGRHqeDqtDTzmebDgdyzXwxi0
	hGY2fMK5vdhv3XOU2j4NpI5CKrsX0XUiUM4LnKVoGwH+UGohJgzhlIbmCwEMHEKWj9QN8+hSzc0t7
	HVg8mPYWmww+sM0+8wE228vxG9tfB1UzDh7NQX+kGBDR+fhWMbnr4FcarERI37/KSlF52WTe9z1ty
	TF9IQPa/Sc8H3ytxdZ9fA0J1HhUl5ZYK/y5OY8DKvs9JRCSY+vF8/Zy7t9lq2xNz9KUtVmXy/shNc
	jLwT069w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RzW-0000000Cl1D-2HJM;
	Tue, 01 Sep 2026 17:09:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RzW-0000000Cl0j-0eQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:09:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9453F407B3;
	Tue,  1 Sep 2026 17:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690991F00A3A;
	Tue,  1 Sep 2026 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282585;
	bh=Cdp+bm1mdsMMRA3P0qz+QQPcUs8yHc+X7Osf02oZ5Qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Pd0feej7bCnza9zZEMqhBC3w90bucu6KzIr8hEX72OUdzVI2njA1yZUHto8h4UoNW
	 hzxqY1CQbw95fcDAdFnnL3NU/zW2TzbmIAlSjBP9nzWBa2Y42gaBM9hpdcpf+lqGjq
	 D2Gqr1VJwQXnBginPxBtGtWaSWBle22suBt7fm4uw7HmKhDxVQY4e1doB94vKLRxIn
	 25ZJFQHrto7M385QfVgM0vhjQhqkO2ybDhvDMDMD7m0NydABtBL1wis3HgX6hXQILF
	 qblwee1CnSoNP7hkQgywrhFiJN5nhI1DsytnLKsxFYjG33kfKbA4L9A5vvn0iX/nJG
	 v7gPW24XV8h2Q==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:43 +0100
Subject: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AQJq+CKXY/YCxbx3S1Crh5Cc+9JzITkjPfuPVDoNhoc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbHHFWOQ5yPW6+rAaHtNdLqXYsj8Uz/tFY2L
 tVS1NUTbBGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGxwAKCRAk1otyXVSH
 0ChRB/90PovUmXRmKPEgEabP3rDR1mrNE5tvMok5jLUuu1q2XpGtIlbJ+1nzLn2N5Gscr8HjBF/
 0e6As3B3kXkYRFRJQLyve9kKIvYZdv1TcAEzIesDQ7k7clTLABOXlONt8wI2/tUmXcSVWdFjdaO
 fHn6B3KW5AJTesIUBTWKLCC7NTtiP/n1Jv06VfF0hu1OwltkNO3W3djK9zw0L16mEkuCCkK/UuP
 ktqi6uPBEeqbomvIJhUQl2k5BoXgoubdKqKu5S2CnwvQlbziPAoGhwCDahAlLM2I2zPO0kaOCG2
 s78pRkwGy6qx+RKt5PAh9MulmcWzVNHMFCUzTOCca6Oe0AQ0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

When they detect corruption the fp-stress test loads print load specific
diagnostics and exits with a failure status.  In preparation for
building versions intended to run as KVM guests factor the exits into
asm-utils-linux.S.

No functional change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 8 ++++++++
 tools/testing/selftests/arm64/fp/fpsimd-test.S     | 4 +---
 tools/testing/selftests/arm64/fp/sve-test.S        | 8 ++------
 tools/testing/selftests/arm64/fp/za-test.S         | 8 ++------
 tools/testing/selftests/arm64/fp/zt-test.S         | 4 +---
 5 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
index 3effeb1fbf50..9cd31dc47709 100644
--- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
+++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
@@ -84,3 +84,11 @@ function tickle_handler
 	ret
 endfunction
 .globl	tickle_handler
+
+// Terminate the program, reporting failure.  Does not return.
+function exit_error
+	mov	x0, #1
+	mov	x8, #__NR_exit
+	svc	#0
+endfunction
+.globl	exit_error
diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index 9db7b5419397..5ee8ef51ea4e 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -298,7 +298,5 @@ function barf
 	bl	dumphex
 	puts	"]\n"
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 2aadb5c3c0f3..3447fe0e5554 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -543,9 +543,7 @@ function vl_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
 
 function svcr_barf
@@ -555,7 +553,5 @@ function svcr_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 84e63e510f23..33dc4ce8bfa1 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -354,9 +354,7 @@ function vl_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
 
 function svcr_barf
@@ -366,7 +364,5 @@ function svcr_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index afcadb5aff23..c67242c2d5ab 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -284,7 +284,5 @@ function svcr_barf
 	mov	x0, x10
 	bl	putdecn
 
-	mov	x8, #__NR_exit
-	mov	x1, #1
-	svc	#0
+	b	exit_error
 endfunction

-- 
2.47.3


