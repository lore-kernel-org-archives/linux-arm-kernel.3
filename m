Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E12C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xPD/724Mzj6/cTLTKyYHK6fDZVywVJCjXBWuB9RfxI=; b=QML+CWHECWmn6ZvPMAgQuotZwa
	2Rge6gN6bD+lzekI9/EGiwlW6zi02iyg7AUtG7myOqTTrK06o3KundgohI3gWxfiUEe7cgKGDtSsG
	Nb0O44G4YU952TB/fu9Np8bt9a6SI8qpqgh0V4WJp/KWnmvf6pATXRcfG8sJtv2bXYIl1NJ3Qo9fm
	w8D26vDHxK9SEPyM2k9eeapNbwmIl6iMpcBg9iwT7ZP0CEHOiDLhi37QES9vpCrxFnQfhukBDA9Jv
	F9ESGLc0AzLzJAtYd8pcp0LUXwq3XzlcfKOjt7v0Cc8BFRcHDcjwdBXHDgl6w9KBP7pqxB8krlhTF
	lIr629tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RzZ-0000000Cl2s-2gn6;
	Tue, 01 Sep 2026 17:09:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RzY-0000000Cl28-1dK0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:09:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16EB64387A;
	Tue,  1 Sep 2026 17:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44931F000E9;
	Tue,  1 Sep 2026 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282588;
	bh=9xPD/724Mzj6/cTLTKyYHK6fDZVywVJCjXBWuB9RfxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q+PG/KP5Pss+s8uN4aaomcoQyQpjWFzFcdwBSWka/ekfc6gl01Yl4Zd4X73QeIkm6
	 EzuHqQyMKzm6nUh+u9DpfnQZMRLFRrJJpsqlN1yMPqN/+WUittI5Z9OsYzQ1CdaEuw
	 AdS1X8J9Y9O6vzlGnNa73DAkcHRBk8E5QNiUb0ASF32sWdTC3dfex08gMAnJjwqAm3
	 ymOU5Iwg2rJ1ohAdta9FpQv4kCIpehE4XO+BmV+Kx1V1W6bWwexgmx5IuNhwwlVGD0
	 cppB1gU2DCR6t7FFjSMYeJXnJ+tVVBfI6MWS3RzQglqispN2Af/s5TmBfXFv5P1t2W
	 RA+ZgDn8OlOlw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:44 +0100
Subject: [PATCH 04/11] kselftest/arm64: Use exit_error() rather than
 SIGABRT in fp-stress
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-4-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3760; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FXUiqfWAxLn/rDMJ8bXvf0uXEP+dmfnB7tIwO5Ir/ek=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbHeVsYcbve7l+7wqdI6RQc91yq/6IcwfQcS
 eSWseNyoZiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGxwAKCRAk1otyXVSH
 0Bg+B/0R6Wq1KDKm5O+KFzeu3nmryrSKKA1NlfpMPg1wFMpjn5bR3DgNNpI3zndXgqg+S+Jz9ou
 /3xMqeNDCnpqiHNeLbVuaKm7EaKTkjoI3ZxW1hEF7g06EtzpB4/I4FKnjs688k8vtsRQ20kpchM
 i0NXDz7PxOGt+uCjkj19Av0KPw3xe3F62nlOXcTAjb77IJIvGswSOlSL6rn2trzssU91XWcs2M7
 om+jjrlrrZG8chv+87sCJipdhweiecG1h+Q7shspQ/Mu57ktQGdvojpzc9MybSRBKk23i9AKnu/
 HaTndkgQ63pe5M+LmS2Nc0ErPx2DPadCfOuefqsq8uuu6yxP
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

The fp-stress test loads all deliver a SIGABRT to the process group to
report some errors they detect. There is no particular reason to use
this mechanism over exiting with an error code, the fp-stress harness does
not care. In order to facilitate running as KVM guests replace this with
use of the exit_error() function we added.

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


