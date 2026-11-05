Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA20606D835
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cdlPFV0L;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAnSSEDd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/dUPChM36fEOq5RatfFduVj/PCS4a3EA+BbbiPd9JRk=; b=cdlPFV0LyiiJ8e
	vOOkWN3RCkPliRWZDqSm3Hp8WeM/3cb2D0lF76QL9pvMJAS25QwT5beHZs9QaKQSI2xFn9o7ZOxIP
	XbghIiT/1kdJPPMXlDbTeK+QMtz5xgh29JOTR0YkOgf0X84N2hGdW75AZnRaV5TKT5jMuCVMarBur
	Mu5kMjeBwitVwX11fNJRUYVEoTChRU49EGWQl2Z+9Heu+ucXIjzJsswccq9GVWLslNC2LsFbkdHC3
	SEvM9my5LHfe0hm+sDEjFe4MyRBtqXt0Y3GgtgBu4a9xEhgPrac1S4dbnmtgpycDq0snmctVrTiP0
	lb4zaSMWXHErtu1ECGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEU-00000009EOM-2ohF;
	Thu, 05 Nov 2026 14:14:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyER-00000009EJZ-3fvW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 572F7609F8;
	Thu,  5 Nov 2026 14:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD711F00A20;
	Thu,  5 Nov 2026 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888063;
	bh=/dUPChM36fEOq5RatfFduVj/PCS4a3EA+BbbiPd9JRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RAnSSEDdt2rc9JuQ7xyi9axOsqVZQhg0C53O8wTP9NwhkHBYC3Mwp+t0CwY/egp+s
	 6vovMZOgkdwRjIBO0QntDn9p3oyUd2OIFaB+aPJIztX9asdscuVmLdawPSSLPzssmq
	 v/w57FIW9FPyqej7k7TFC+SdX3tutHSgo5gonzrlElF5hLKK6xYCSl6y3tES3JQWFp
	 AQOIoRMpbMn+JZ9okv2eBFrABKK8CQiDgBI0nuEQVCWQbXPb7QeQ9ygRCP1nUO8UO9
	 rdiYFTeyhaTpIE/O9Z+SwCSAXB03Y9jdPKm/g5DiZfaNbODRQj7YjOVN67XEkZ1qFA
	 eP+LOMsVySHbg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:20 +0000
Subject: [PATCH v2 07/11] kselftest/arm64: Remove the sched_yield()s from
 the fp-stress loads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-7-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3955; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5x8N4bXqqqnWonSWnXppjGE2ctQ+hVuF3ZdQ+mOZ/5A=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9GuYrWHal5F8L/l5hZfX5meXT226abfO1uFG3s5uV
 QMm7W8FHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIRy/DXwknX8e9W77rmJit
 Yb5npbYsly+d7YPInZlSPWGc96ryRRn+8P1a+vd8+O+QoOJshqbP2t3LT97R3yJ5ZIHjhxv7mw1
 3swAA
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

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
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
index a1925761ae39..113411055afa 100644
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
index 3fb9ac5c8f8b..3036b165e81c 100644
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
index 39af1c96a4e5..ae851c139d28 100644
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


