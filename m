Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC92E606D815
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Iu2ZO9+s;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrjHL5HO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C510kth/CBVLazESEsxRzArI7oc7963TMqt8w5w865M=; b=Iu2ZO9+sOSt6/P
	GIRLKE9borcX10qyTJh34gi+Sm8TSL5+qiE9SpHwqxi7lYc6YoUDwr5lnlPRdpsCWmZzRxApzLqvz
	90G0ym8I7lD7Jt33EidWo+D36pez4SsThLK/GpdCbMqVUQsy+90WfDbApgFLa0TP38FSw/EAD+y2E
	Vfb8fz3j4ObrnfvIV8jILnb7Irq+WE7Flc7WTzkIsEQaRm5dWcxosPI5vQy8DdAaqQofSNzI+t79I
	DdgIUIwgb1NCZXBbsrjXq/ir3uVScKleTdEIpQLSFdaKJTrAX9Zpa5qtkX356hIPK2x0ujOLc+nJT
	C+16LXrQPqAABwrq3FBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEN-00000009EFQ-2oW0;
	Thu, 05 Nov 2026 14:14:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEK-00000009ECY-24pD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BCABC60DB7;
	Thu,  5 Nov 2026 14:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C26A1F0093A;
	Thu,  5 Nov 2026 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888055;
	bh=C510kth/CBVLazESEsxRzArI7oc7963TMqt8w5w865M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QrjHL5HOEl8CuY4h06Ec+V9T8RSJ+k2veQODDwns+l/8GaLiL6v+3Ql4DoRs9CTUK
	 RoftER9gCuyP2jVmoHJNSHmEUaiYWnqN2E31ltT/H++Cn3fe274uC04aayDfIbG8GC
	 PctJExkivVs+QNCU/ar+sF9DaObMl0dW7LLyFB8ds3ge4Ll9PEgbgtouGRon2oXJUs
	 pOla/EqdGAV0whiF9JknaOUXU6UXgNH20wdDan+fEFfOpfTMrQsncdbE087j/rjFGB
	 MDxUBfdF+6nGTYMs8YfPO7AAgawmlJVhleOXi7z/mMBRS+6xSDSaA3YSkST2teHkdh
	 DbmflQRohHJvg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:17 +0000
Subject: [PATCH v2 04/11] kselftest/arm64: Use exit_error() rather than
 SIGABRT in fp-stress
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-4-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3938; i=broonie@kernel.org;
 h=from:subject:message-id; bh=J/tK2tkelFUN0/4GFmBHelNZo1hOb68bre/CQsIpqVY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Gsw1/v77MvbfvOc0rKNR3xvyef5JTp+vXKe592/o
 MjX77V1O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRGeUM/0s1TPxOPPHMPFb5
 Om2L8XHlt8+FVFM9dqRMVH0fxGXqeImR4a75gQMuQQvyGl1C10twq9zyPhXsUPKwWIV7quIem5Q
 +HgA=
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

The fp-stress test loads all deliver a SIGABRT to the process group to
report some errors they detect. There is no particular reason to use
this mechanism over exiting with an error code, the fp-stress harness does
not want this.  In order to facilitate running as KVM guests replace
this with use of the exit_error() function we added.

This also avoids loss of diagnostics due to the entire process group
getting killed if any of these cases trigger.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fpsimd-test.S | 10 ++--------
 tools/testing/selftests/arm64/fp/sve-test.S    | 10 ++--------
 tools/testing/selftests/arm64/fp/za-test.S     | 10 ++--------
 tools/testing/selftests/arm64/fp/zt-test.S     |  8 +-------
 4 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index 5ee8ef51ea4e..fcbb3a872490 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -176,7 +176,7 @@ function setsignal
 	cbz	w0, 1f
 
 	puts	"sigaction failure\n"
-	b	.Labort
+	b	exit_error
 
 1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
 	ret
@@ -224,7 +224,7 @@ function _start
 1:	puts	"Bad vector length: "
 	mov	x0, x19
 	bl	putdecn
-	b	.Labort
+	b	exit_error
 
 2:	puts	"Vector length:\t"
 	mov	x0, x19
@@ -266,12 +266,6 @@ function _start
 
 	add	x22, x22, #1
 	b	.Ltest_loop
-
-.Labort:
-	mov	x0, #0
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
 endfunction
 
 function barf
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 3447fe0e5554..26efdbdd88f9 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -344,7 +344,7 @@ function setsignal
 	cbz	w0, 1f
 
 	puts	"sigaction failure\n"
-	b	.Labort
+	b	exit_error
 
 1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
 	ret
@@ -397,7 +397,7 @@ function _start
 1:	puts	"Bad vector length: "
 	mov	x0, x19
 	bl	putdecn
-	b	.Labort
+	b	exit_error
 
 2:	puts	"Vector length:\t"
 	mov	x0, x19
@@ -474,12 +474,6 @@ function _start
 
 	add	x22, x22, #1
 	b	.Ltest_loop
-
-.Labort:
-	mov	x0, #0
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
 endfunction
 
 function barf
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 33dc4ce8bfa1..7208bb2db9f1 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -189,7 +189,7 @@ function setsignal
 	cbz	w0, 1f
 
 	puts	"sigaction failure\n"
-	b	.Labort
+	b	exit_error
 
 1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
 	ret
@@ -240,7 +240,7 @@ function _start
 1:	puts	"bad vector length: "
 	mov	x0, x19
 	bl	putdecn
-	b	.Labort
+	b	exit_error
 
 2:	puts	"vector length:\t"
 	mov	x0, x19
@@ -288,12 +288,6 @@ function _start
 
 	add	x22, x22, #1	// Everything still working
 	b	.Ltest_loop
-
-.Labort:
-	mov	x0, #0
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
 endfunction
 
 function barf
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index c67242c2d5ab..c6cfbdeb2f0c 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -158,7 +158,7 @@ function setsignal
 	cbz	w0, 1f
 
 	puts	"sigaction failure\n"
-	b	.Labort
+	b	exit_error
 
 1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
 	ret
@@ -222,12 +222,6 @@ function _start
 
 	add	x22, x22, #1	// Everything still working
 	b	.Ltest_loop
-
-.Labort:
-	mov	x0, #0
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
 endfunction
 
 function barf

-- 
2.47.3


