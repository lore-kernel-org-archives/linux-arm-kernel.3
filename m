Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F238BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxI+FpOAmxzg2hKYXBYiDpr6L2PYG+09QYQFHVt1TSo=; b=0HewXicpfMGEsp+kp1Ai83ajuG
	tvVbuoUGkpvArMGKHHcAhjVWadGOk5VA8r/33oU2/dClX/53jqFmmhaKW99B4hzTcjQkul/zgkaMW
	ma/lae1xYEaXnOANOkTAVsdPNlaElADAw0JovytUtWqBHOzqS7kzF1irzhMNjnlZ56VJt+cFHH3Az
	eZBBGpRl3chweDSxDbRs/s/CRykiTpeR5w97jned5Bv+Hp6cDkGQuuI7ULb3nEIypj6CRKjN36Fnh
	1uGJvpHat5YN/Son4xjFjT2vLxq/J8badyBA7CWfaSZtQ/Xghp3DQbwnWwpvhbtOWF67UjK4mZ5/4
	FwKAfk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rzg-0000000Cl92-2tY8;
	Tue, 01 Sep 2026 17:09:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rzf-0000000Cl7x-3Ry0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:09:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91DBE43874;
	Tue,  1 Sep 2026 17:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652361F00ADB;
	Tue,  1 Sep 2026 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282595;
	bh=NxI+FpOAmxzg2hKYXBYiDpr6L2PYG+09QYQFHVt1TSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=l4yB8LX+vDTiOKEzrwwpXiZhiM0zUvRfh264ziRNaC3LdH1YAteSETLqdUZOpRVSZ
	 g35FbqIEWxDEVYqILqegQuTaI333IF6RoarCa36St9RFDtGc1rNDv4hEDJz10qT/uG
	 IlpM7TlWUulrl2khmXML0UhGzCG2usU0Kk2ZwAhNZ72f8gpDmUly1IDaCZd8G1yDPs
	 344QS4ozGUuPUpSrV2cbPbiGOwBrnphwzEg3y8GNSW9LbYkywJKRoyNxMbum8fK3YJ
	 MkbgShzNjwj2LwK2VTxVp9STjyEygsj/xl6F5EXbUrKso0l/9eNRPDBI4zqRnueq/c
	 8fwAm/V4RMLrQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:47 +0100
Subject: [PATCH 07/11] kselftest/arm64: Remove the sched_yield()s from the
 fp-stress loads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-7-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3902; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GdbDqMwhKS4dvNXEnU5ojuDWOVHjqy8HghJqycB6KsI=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqlwbKNftVcanUlhQIMWx2Mid/cKISxY4XA0ZWE
 mmqno9pEWuJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGygAKCRAk1otyXVSH
 0FB4B/jUlFlmRbsCnYtLKyHr7MX8IiDWp2IBn0FWw6fqMdglnCaYOIx0pio8sUkLkjFfZiDxpQL
 7VQAYtpjNCcoqCumDbnR1oziUI6A/7VVAnX1tZNj+u0TaM7mXnhy344kTcnVZXIKYEGuW3zBZkR
 t7W1m/kRzX7LwwRzZbpzCGKXc6pXAoD5B8xb8wHanq14mTu/oBpT1ntkmHbQfmtUeJ21xA+/GEp
 c94XVenkGXvMN2VjK2vdfi22rSsJv6GBze7LY9qsrRLyvzIgAgqfIW0AYpotGSz3wM99hXn3bb8
 DaDEPKyY5n9Ej7KadB0F9OShtwGRC37O7jXdlExyuz5oI7M=
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

The fp-stress load programs call sched_yield() on each iteration of
their test loops in order to encourage preemption, except for sve-test
where the call is commented out since the SVE state is destroyed by
system calls. This is most likely counterproductive since we are more
likely to notice corruption if preemption happens while setting or
reading the register state, and since fp-stress starts multiple test
programs per CPU we should have no trouble observing preemption anyway.

Remove these calls, including the commented out one in sve-test, both
due to this and in order to prepare for running as KVM guests.

We also remove the inclusions of unistd.h since we no longer need it in
any of the programs. za-test had an unreferenced local label in the
middle of the sched_yield(), remove that too.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fpsimd-test.S | 5 -----
 tools/testing/selftests/arm64/fp/sve-test.S    | 5 -----
 tools/testing/selftests/arm64/fp/za-test.S     | 5 -----
 tools/testing/selftests/arm64/fp/zt-test.S     | 4 ----
 4 files changed, 19 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index df040283d076..5e19799f1b2e 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -10,7 +10,6 @@
 // (leave it running for as long as you want...)
 // kill $pids
 
-#include <asm/unistd.h>
 #include "assembler.h"
 #include "asm-offsets.h"
 
@@ -185,10 +184,6 @@ function main
 	cmp	x21, #NVR
 	b.lo	0b
 
-// Can't do this when SVE state is volatile across SVC:
-	mov	x8, #__NR_sched_yield	// Encourage preemption
-	svc	#0
-
 	mov	x21, #0
 0:	mov	x0, x21
 	bl	check_vreg
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index c7d9514f964e..fdb295bde45c 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -10,7 +10,6 @@
 // (leave it running for as long as you want...)
 // kill $pids
 
-#include <asm/unistd.h>
 #include "assembler.h"
 #include "asm-offsets.h"
 #include "sme-inst.h"
@@ -378,10 +377,6 @@ function main
 	cmp	x21, #NZR + NPR
 	b.lo	0b
 
-// Can't do this when SVE state is volatile across SVC:
-//	mov	x8, #__NR_sched_yield	// Encourage preemption
-//	svc	#0
-
 #ifdef SSVE
 	mrs	x0, S3_3_C4_C2_2	// SVCR should have ZA=0,SM=1
 	and	x1, x0, #3
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index a0165a81a937..8d449e114301 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -10,7 +10,6 @@
 // (leave it running for as long as you want...)
 // kill $pids
 
-#include <asm/unistd.h>
 #include "assembler.h"
 #include "asm-offsets.h"
 #include "sme-inst.h"
@@ -203,10 +202,6 @@ function main
 	subs	x21, x21, #1
 	b.ne	0b
 
-	mov	x8, #__NR_sched_yield	// encourage preemption
-1:
-	svc	#0
-
 	mrs	x0, S3_3_C4_C2_2	// SVCR should have ZA=1,SM=0
 	and	x1, x0, #3
 	cmp	x1, #2
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index 1c7db1298fb1..2333e72760a5 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -6,7 +6,6 @@
 // Repeatedly writes unique test patterns into ZT0
 // and reads them back to verify integrity.
 
-#include <asm/unistd.h>
 #include "assembler.h"
 #include "asm-offsets.h"
 #include "sme-inst.h"
@@ -143,9 +142,6 @@ function main
 	mov	x1, x22
 	bl	setup_zt
 
-	mov	x8, #__NR_sched_yield	// Encourage preemption
-	svc	#0
-
 	mrs	x0, S3_3_C4_C2_2	// SVCR should have ZA=1,SM=0
 	and	x1, x0, #3
 	cmp	x1, #2

-- 
2.47.3


