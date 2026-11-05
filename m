Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E73606EE91
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HskmFvzs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTH+wFxC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Zl4zcjQaew3f7yJ/IqqdyTpPy7p13iqyV5dL8PG0RfM=; b=HskmFvzshnYBjd
	8DvtBygsxFGabuiVNkxkpjSVkMzws2Lr5+c6FkFvKQehBhDYDfghJyHbhC36XsGI5lcnmOBKQoe+/
	fwy1eDq21oLcfViiqILIktWuZZXjB0rwVCFYi31NAMrTsKYACJ5zNcFMb5V3gJpyxs+ZWG1Wcxl3x
	AOirz/TYt9D4QIJrVE+Gg073hnmz2oq3xFU/dweoXnhbPHSTIrPwNxOQM74hg26mdYtT4u8kNJZaL
	p0j8oGcl5z7JOKy3i4nbtf0hGOVXLzz1nl00pGHzQK3MYuw45mQm7waDh2NNI4cWlCYA64IXj7Jnn
	705PquYExGzvtuo1eHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEK-00000009ECt-263o;
	Thu, 05 Nov 2026 14:14:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEH-00000009EAQ-1FnW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12DAF43D88;
	Thu,  5 Nov 2026 14:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEBC1F000C1;
	Thu,  5 Nov 2026 14:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888053;
	bh=Zl4zcjQaew3f7yJ/IqqdyTpPy7p13iqyV5dL8PG0RfM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DTH+wFxCisQmpU/QtATllxNBGmKPOrn9tDyRxMqJk7wjubdFS/4s1zpu1ls448R6F
	 0L/XMPCKv8/UniiyrXXNACbTMdEtRtzKPf3Af2dILd96cFZUV2Tk6NUjBPHGwiAhR/
	 ayHHR8DFLcW6eu3FwGDWf8DhPa41siQeb8ao/Czus1gSe2oaYX+Z3TIvo2hRNS3+hy
	 pTlhh0HlNqsBLjH979xuaOFtxLbpMCAOZdLlLFJ/KJWATawBJxYPXrS2HaXD32KCju
	 eOpHWfUERcWilDQjxS8ZBZempixDjGUQksXyg9MH1I3mzQY+OepXtnXIqgQ4RC35II
	 CWG17TTmOtlXA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:16 +0000
Subject: [PATCH v2 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-3-81a5172468f0@kernel.org>
References: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
In-Reply-To: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qjxu/5RIE28bIxXQDoZnPILxTHbpIszFwwnTqg6oCfI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Guoc/VGnGX+uWjBqpvzlG/VCb36k2akrPiba9e/4
 BUKJzpNOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRSFeG/wE83M82/Nc8EsHq
 6HUkO/Nsw7w98lp/4lUelVwvq/vSE8nI8PBvNNuWWYtv3Oe9eNqtavHihrvysa1fpc66b/7LFjO
 RkwUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When they detect corruption the fp-stress test loads print load specific
diagnostics and exits with a failure status.  In preparation for
building versions intended to run as simple bare metal KVM guests factor
the exits into asm-utils-linux.S.

In the process we fix the call to the exit syscall in many of the
locations to pass an initialised value as the exit code in x0, rather
than setting x1 and letting whatever random value happened to already be
in x0 be the exit code.  This happened to work in context since
fp-stress only checks for non-zero values and we always print a
diagnostic before exiting, the return value of the write syscall doing
the print would be either a non-zero length or a negative errno leaving
the low 8 bits non-zero and in all cases nothing resets x0 before we exit.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
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


