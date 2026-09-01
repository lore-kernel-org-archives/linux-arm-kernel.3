Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBD5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIoWTUlvXX13Appnh+taaKXv0sle6+B+jUGuGwjmcYU=; b=0ABzkEKVcmWMYx+XgNP7c+i+EN
	aWQ3Yjlohg6bbJRUWXjgbo2XpQLWoaLFYjk+FmEVzbv4mHIC4+uL+IpjWg8834ZYXiOk2dTK0HhO8
	k+IUGsY4HBwES64fJipA/12TkgGogYVLkPkHuCxpJkOx1u4CNmXcWitXhEXcUwp+3z5FuK5RBhXK4
	iT+4uv0tiI91qjeltpbjC9r4VTrsfto2MpqPZ+/whNvgOmu6QTMjkVYnt9pr/2D6izHJXsDq74I3b
	Huu8RND7YRifh9X5uOissjXHfoI9ufi6AWxNLUrnzerh+iz1wDc/ZN8lhvGugUOc5UgFaiaKSMAGg
	Ij12xBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rzc-0000000Cl55-3Ys9;
	Tue, 01 Sep 2026 17:09:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rzb-0000000Cl3w-1L1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:09:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0361602C2;
	Tue,  1 Sep 2026 17:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692BE1F00A3A;
	Tue,  1 Sep 2026 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282590;
	bh=IIoWTUlvXX13Appnh+taaKXv0sle6+B+jUGuGwjmcYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=abaNRV004TpvAQQP7LZEvPQGAs4yksHJQQ/KT6RR4k+deK/NPHpKXJwKmKwa+eURu
	 XJsOh6v7k+ZETIqRlc2R6X2jN/YFQfjaqcMBz2R14sNyp7SLoki2K5tbhsQciVRw/c
	 lFvtk7jV0xjGV56U8XgwZZWSovbPxtjdmMzwqgOCmHWCY+9Vdyw27BPXe4SshI1t1N
	 rfIZom5sn6kNBcA8Na4+5mSiYX7KdOD/hVd6/Ciq1KkDQ1VOxZ+tqdv3nOTvKK4Wk6
	 LLC8Ah67V1PcSgKCeWIsiFIQ+44cGxVXrpbZZCJTgjH4tFmogxsSxEGVUSAiX0SYuK
	 PbiQ973CQDj5g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:45 +0100
Subject: [PATCH 05/11] kselftest/arm64: Exit with an error code on data
 mismatches in fp-stress
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-5-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2794; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yDqcvWjmApZFYi3sYMgKyJQuc1WrRv18LtEuTPnRUWI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbIHH7Ri4sFF3IW6/0tYNw/ZUaW+ah8bbzQL
 aN/igojoZyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGyAAKCRAk1otyXVSH
 0MXeB/sFbb8V+tj0pCZ5OSMtZxsUjQT6dJfd86NDA8ZTYwKfbO5pvXjEFM0kSO4x5TbJ3gdnxQN
 k5WPUq1WZMmJ8qYqw8XCgK/qju9o7V61Ewk8zzEylV7LFC7KTI+720fpe7spBtzTOENkOnqxLSi
 u1uUQ5SquRyQWdS6WgmuogF1iwLFiHjjC4Zefky+OD4bQtf1EYe+pVDbR8THTNv4h0+KGxHVFYj
 98V988a4EJ273T9tKm+FTYgQJw9SKiILQ00/Jt9rj9mJyOnlwDxjYPVipf5RyWAcpkf9JgSGG/V
 SFC0XDJE90W0Mv7RElwZ2Si04UY8gpwQi1m+oVP9OGml8o1P
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

Several of the fp-stress test loads have blocks at the end of their barf
functions with a range of commented out options for how to exit the program
after logging an error. Comments indicate that these were intended to
interact with some long gone debugging code in the kernel. At the minute
the option selected by all the programs is to delivera SIGABRT to
themselves but there is no need to do this over a normal exit with a non
zero status. In order to facilitate running as a KVM guest replace these
repeated blocks with calls to exit_error(), this will integrate just as
well with the fp-stress harness.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-test.S | 14 +-------------
 tools/testing/selftests/arm64/fp/za-test.S  | 14 +-------------
 tools/testing/selftests/arm64/fp/zt-test.S  | 14 +-------------
 3 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 26efdbdd88f9..88c3220caf7c 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -515,19 +515,7 @@ function barf
 	bl	putdecn
 #endif
 
-	mov	x8, #__NR_getpid
-	svc	#0
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// ^ end of hack
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
-//	mov	x8, #__NR_exit
-//	mov	x1, #1
-//	svc	#0
+	b	exit_error
 endfunction
 
 function vl_barf
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 7208bb2db9f1..4a5b4b37d475 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -326,19 +326,7 @@ function barf
 	mov	x0, x13
 	bl	putdecn
 
-	mov	x8, #__NR_getpid
-	svc	#0
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// ^ end of hack
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
-//	mov	x8, #__NR_exit
-//	mov	x1, #1
-//	svc	#0
+	b	exit_error
 endfunction
 
 function vl_barf
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index c6cfbdeb2f0c..82a76bb2307a 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -256,19 +256,7 @@ function barf
 	mov	x0, x13
 	bl	putdecn
 
-	mov	x8, #__NR_getpid
-	svc	#0
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// ^ end of hack
-	mov	x1, #SIGABRT
-	mov	x8, #__NR_kill
-	svc	#0
-//	mov	x8, #__NR_exit
-//	mov	x1, #1
-//	svc	#0
+	b	exit_error
 endfunction
 
 function svcr_barf

-- 
2.47.3


