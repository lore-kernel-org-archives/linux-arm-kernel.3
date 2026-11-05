Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF27606D801
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D+oGjx/a;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdVRU0Ws
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=THbpDPbbYpeEzEvt4/1B8C87Int4ybsMYNsa0r/4B/U=; b=D+oGjx/amw1qUV
	mamHbPBFlYXRMLPTy9nlEyDEJb35BNaG/QVM76rC58FXvGJLwbGHTzqkRpwngNUu5eboeFD3JZQPj
	HtSy9K05WRz7KgFvi5lipQpKzz/BYHTQtGCgbm7gLksB+0wTlsR6JcZCqEW61TQlcbup+lzLOqF+E
	F+58vjuLAYdh82VPQFnxiRNyrLnMLepGfyvRkptjxdft02lZxAVZWQc/iwYG9mH3UYw4yVV9lVg/k
	UjE5UChIbdxp3LSrRvnhBLVA+JnEAzQhdlikJZuXt3zcaPycod8Sl/uJAMhJuIGEeRu5P4xvW3OVs
	Xb48+WkEry42g9NdMrYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEI-00000009EAx-0vkd;
	Thu, 05 Nov 2026 14:14:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEE-00000009E9I-3B1n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8398342CBF;
	Thu,  5 Nov 2026 14:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B9F1F00919;
	Thu,  5 Nov 2026 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888050;
	bh=THbpDPbbYpeEzEvt4/1B8C87Int4ybsMYNsa0r/4B/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IdVRU0WsuEAfDP0wtB10DA0it6GhL6NovU93t5zGyhOPddhtcprZw628+RZiX3F3/
	 VMsJQp4S2VVJfuuiH/gK5s6UCq4I0+/HLdYgq7o8JAKQa7Ku0tAO64BMAtKPShPB5z
	 y6PCszGlEgA/6eanwR+8Bg8jLf8vW9NAXvg6xpeZhcnN+DMzVbB7TnGuW8tPbV1w4C
	 IFQg+nfg61C4XohNzYP9rJn/k6GN5XVTS/GlCx993XhvKm+PSNn0H281oq/SbgeXTG
	 82mTGAD1NlbSROTV1ltjMN1/HzjvXqP4jS+9Sdzue3iCKrH0xrDWWS9xKKjun5QUxR
	 pcWie2djpCmXg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:15 +0000
Subject: [PATCH v2 02/11] kselftest/arm64: Factor shared signal handlers
 out of fp-stress loads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-2-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6061; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UBKnFOIQAcrAazCRamLNIRRtMttXvJYS8Eu5Nk5XQEw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9GvkHFrlFL43onnp7jmK2+bd1Hlhtnel48zDaTkPb
 oiKbDm8oaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATeTufkeEwu2qH8E6Fu6wP
 l4a9mTH52pq/mxa3MXm2iT+onzFFlOkYI8ND0a/Tr0uo9SdPPO3yvUzCvrrHMl+q7XDMrZMMr9w
 Oq/MBAA==
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

The assembly programs run by fp-stress all have identical signal
handlers for cleanly exiting the program and simply count signal
deliveries, consolidate them into a single copy in asm-utils-linux.S.

No functional change.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 43 ++++++++++++++++++++++
 tools/testing/selftests/arm64/fp/fpsimd-test.S     | 28 --------------
 tools/testing/selftests/arm64/fp/sve-test.S        | 28 --------------
 tools/testing/selftests/arm64/fp/za-test.S         | 28 --------------
 tools/testing/selftests/arm64/fp/zt-test.S         | 28 --------------
 5 files changed, 43 insertions(+), 112 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
index e6c22b41dc5e..3effeb1fbf50 100644
--- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
+++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
@@ -6,6 +6,7 @@
 
 #include <asm/unistd.h>
 #include "assembler.h"
+#include "asm-offsets.h"
 
 // Print a single character x0 to stdout
 // Clobbers x0-x2,x8
@@ -41,3 +42,45 @@ function puts
 	ret
 endfunction
 .globl	puts
+
+// Signal handler which reports a clean exit and terminates the program.
+// The tests keep their iteration count in x22 and their signal count in
+// x23, report those from the interrupted context.
+//
+// w0: signal number
+// x2: ucontext
+function terminate_handler
+	mov	w21, w0
+	mov	x20, x2
+
+	puts	"Terminated by signal "
+	mov	w0, w21
+	bl	putdec
+	puts	", no error, iterations="
+	ldr	x0, [x20, #ucontext_regs + 8 * 22]
+	bl	putdec
+	puts	", signals="
+	ldr	x0, [x20, #ucontext_regs + 8 * 23]
+	bl	putdecn
+
+	mov	x0, #0
+	mov	x8, #__NR_exit
+	svc	#0
+endfunction
+.globl	terminate_handler
+
+// Signal handler which only records that the program was interrupted.
+// The tests keep their signal count in x23, update that in the
+// interrupted context.
+//
+// w0: signal number
+// x2: ucontext
+function tickle_handler
+	// Increment the signal count (x23):
+	ldr	x0, [x2, #ucontext_regs + 8 * 23]
+	add	x0, x0, #1
+	str	x0, [x2, #ucontext_regs + 8 * 23]
+
+	ret
+endfunction
+.globl	tickle_handler
diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index f89d67894c2e..9db7b5419397 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -149,34 +149,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 7ef7835389e7..2aadb5c3c0f3 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -317,34 +317,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 9c33e13e9dc4..84e63e510f23 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -162,34 +162,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index a8df05771670..afcadb5aff23 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -131,34 +131,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags

-- 
2.47.3


