Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8D6082BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b2jjGjNH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hM1ieG+M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9o8d4hiTOOwTkRtTLTXLCRK3aNU7pqZJPZXu3lxBqEE=; b=b2jjGjNHk5ZK4K
	zfAHUn4HA2NkUss5cUW8PBtgwZ+Jgs+o+BX9rnhZrSCm/4reZNcGi4D/7JJ6jS3OxpzGLNKS+lywH
	CAFimJcoZbqY+8BKrJXn3/9zTYvrd7R/KdYotf+/t66gR7jI94htGEHGTCdPOybl2SX0yLe33VQAI
	D3NGfV/E8wJic2lTSAokpANJSLFNDUsWs5kkARN2fXvYJ2Y3uHz4xxsC/2CtFRyLZzyDfCXBlv2vu
	NlLGVdUsnZzZRzQxJw/gaVKPd2MzJx3SW6TkSnZdcdMlLvhqMqHfE0zWNGpUA6eQHLC9cRpeo9U+B
	e3gXvAgXcMoP/QRwSykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyES-00000009EK6-0IsQ;
	Thu, 05 Nov 2026 14:14:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEO-00000009EHB-3fvB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F15C43D88;
	Thu,  5 Nov 2026 14:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6478D1F000C1;
	Thu,  5 Nov 2026 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888060;
	bh=9o8d4hiTOOwTkRtTLTXLCRK3aNU7pqZJPZXu3lxBqEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hM1ieG+MaT4kQJDDkG1dyTZEVITmNA/9Qsa3w+/Ut2GFnkARU+uCOeeWh7hcUYJL4
	 xsA2APTlFzptj+sYVrHVZSSQJaRK/Qaf45Nd4DcrRUdqMA3woTGGBRTgvUqQNZ4BWs
	 S4t0W1S0ihlXvOt9kRQVUPpgrQdktpGb8C/lasd+0e8qllR+yEJnjSbdfb5Py9zlax
	 I/0Zu4otbvdsjev2x8fBtSf18yM6QtLAyrsXwLUnh5wM58hB3+btXF0FJk8LlHXr87
	 LHw3yBw4fSbslP1viKIp06m3pgLBd4Il9nCFO59HW/r462xTwJtId2eIa5E3Jco1w0
	 y1I/2v8ujbhAQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:19 +0000
Subject: [PATCH v2 06/11] kselftest/arm64: Factor startup code out of
 fp-stress load programs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-6-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11975; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q3b1eGQdxDEBjSpi5TVW+MGzgEyJNUbj5FC2Ius8GWg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Gt0/D4Zxnrd/rq9hYtY18t+I5W3Mwsv7tgVUnJSs
 Vnt4/FHHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIqxJGhs8Hotxqvm/8/2jJ
 6denqvsvKJle/Nx/4qfMnb3KSwQ6o9QZ/ll9aqx95FlqwOiz6XEaT22qrklu34RL9zbwvj8XtSl
 OjgUA
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

The fp-stress load programs all start up with some startup code which
installs signal handlers and fetches and reports the current PID into
x20. In order to facilitate running as KVM guests and reduce duplication
factor this code out into a asm-utils-linux.S, making the per-test entry
point main() similarly to more normal environments. As the
irritator_handler varies per test they are left in place.

Since the PID is now reported before main() runs it is printed before
rather than after the vector length for those programs that report one,
fp-stress does not parse the output so this has no impact.

Since asm-utils is also used by fp-pidbench that also gets converted to
the new _start implementation, this will install some signal handlers
that were not previously there, enable GCS and report a PID which was
not previously reported but should otherwise have no impact. Since it
does not need an irritator none is provided and a weak definition left
in asm-utils-linux.S, sending signals to the test while it is running
would disrupt it anyway.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 87 ++++++++++++++++++++++
 tools/testing/selftests/arm64/fp/fp-pidbench.S     |  6 +-
 tools/testing/selftests/arm64/fp/fpsimd-test.S     | 76 +------------------
 tools/testing/selftests/arm64/fp/sve-test.S        | 76 +------------------
 tools/testing/selftests/arm64/fp/za-test.S         | 75 +------------------
 tools/testing/selftests/arm64/fp/zt-test.S         | 75 +------------------
 6 files changed, 106 insertions(+), 289 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
index 9cd31dc47709..9519be4d8f1e 100644
--- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
+++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
@@ -92,3 +92,90 @@ function exit_error
 	svc	#0
 endfunction
 .globl	exit_error
+
+// Install a signal handler
+//
+// w0: signal number
+// x1: sa_action
+// w2: sa_flags
+// Clobbers x0-x6,x8
+function setsignal
+	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
+
+	mov	w4, w0
+	mov	x5, x1
+	mov	w6, w2
+
+	add	x0, sp, #16
+	mov	x1, #sa_sz
+	bl	memclr
+
+	mov	w0, w4
+	add	x1, sp, #16
+	str	w6, [x1, #sa_flags]
+	str	x5, [x1, #sa_handler]
+	mov	x2, #0
+	mov	x3, #sa_mask_sz
+	mov	x8, #__NR_rt_sigaction
+	svc	#0
+
+	cbz	w0, 1f
+
+	puts	"sigaction failure\n"
+	b	exit_error
+
+1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
+	ret
+endfunction
+.globl	setsignal
+
+// Programs which want to be interrupted by SIGUSR1 provide an
+// irritator_handler(), for those that don't the signal is left alone.
+.weak	irritator_handler
+
+// Main program entry point.  Install the signal handlers shared by the
+// programs, zeroing the signal count in x23 that the handlers maintain,
+// read and report the PID the programs use for uniqueness in x20, then
+// run the program specific main().
+.globl _start
+function _start
+	enable_gcs
+
+	mov	x23, #0		// signal count
+
+	mov	w0, #SIGINT
+	adr	x1, terminate_handler
+	mov	w2, #SA_SIGINFO
+	bl	setsignal
+
+	mov	w0, #SIGTERM
+	adr	x1, terminate_handler
+	mov	w2, #SA_SIGINFO
+	bl	setsignal
+
+	// Load as a literal, adr can't reference the symbol when the
+	// program provides no handler and it resolves to 0
+	ldr	x1, =irritator_handler
+	cbz	x1, 1f
+	mov	w0, #SIGUSR1
+	mov	w2, #SA_SIGINFO
+	orr	w2, w2, #SA_NODEFER
+	bl	setsignal
+
+1:	mov	w0, #SIGUSR2
+	adr	x1, tickle_handler
+	mov	w2, #SA_SIGINFO
+	orr	w2, w2, #SA_NODEFER
+	bl	setsignal
+
+	// Obtain our PID, to ensure test pattern uniqueness between processes
+	mov	x8, #__NR_getpid
+	svc	#0
+	mov	x20, x0
+
+	puts	"PID:\t"
+	mov	x0, x20
+	bl	putdecn
+
+	b	main
+endfunction
diff --git a/tools/testing/selftests/arm64/fp/fp-pidbench.S b/tools/testing/selftests/arm64/fp/fp-pidbench.S
index 881dfa3b342e..80f45560290d 100644
--- a/tools/testing/selftests/arm64/fp/fp-pidbench.S
+++ b/tools/testing/selftests/arm64/fp/fp-pidbench.S
@@ -28,9 +28,9 @@
 	puts	"\n"
 .endm
 
-// Main program entry point
-.globl _start
-function _start
+// Program specific main function
+.globl main
+function main
 	puts	"Iterations per test: "
 	mov	x20, #10000
 	lsl	x20, x20, #12
diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index fcbb3a872490..df040283d076 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -148,69 +148,11 @@ function irritator_handler
 
 	ret
 endfunction
+.globl	irritator_handler
 
-// w0: signal number
-// x1: sa_action
-// w2: sa_flags
-// Clobbers x0-x6,x8
-function setsignal
-	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
-
-	mov	w4, w0
-	mov	x5, x1
-	mov	w6, w2
-
-	add	x0, sp, #16
-	mov	x1, #sa_sz
-	bl	memclr
-
-	mov	w0, w4
-	add	x1, sp, #16
-	str	w6, [x1, #sa_flags]
-	str	x5, [x1, #sa_handler]
-	mov	x2, #0
-	mov	x3, #sa_mask_sz
-	mov	x8, #__NR_rt_sigaction
-	svc	#0
-
-	cbz	w0, 1f
-
-	puts	"sigaction failure\n"
-	b	exit_error
-
-1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
-	ret
-endfunction
-
-// Main program entry point
-.globl _start
-function _start
-	enable_gcs
-
-	mov	x23, #0		// signal count
-
-	mov	w0, #SIGINT
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGTERM
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGUSR1
-	adr	x1, irritator_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
-	mov	w0, #SIGUSR2
-	adr	x1, tickle_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
+// Program specific main function
+.globl main
+function main
 	// Sanity-check and report the vector length
 
 	mov	x19, #128
@@ -231,16 +173,6 @@ function _start
 	bl	putdec
 	puts	" bits\n"
 
-	// Obtain our PID, to ensure test pattern uniqueness between processes
-
-	mov	x8, #__NR_getpid
-	svc	#0
-	mov	x20, x0
-
-	puts	"PID:\t"
-	mov	x0, x20
-	bl	putdecn
-
 	mov	x22, #0		// generation number, increments per iteration
 .Ltest_loop:
 
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index d2ed2a44bdb5..a1925761ae39 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -316,69 +316,11 @@ function irritator_handler
 
 	ret
 endfunction
+.globl	irritator_handler
 
-// w0: signal number
-// x1: sa_action
-// w2: sa_flags
-// Clobbers x0-x6,x8
-function setsignal
-	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
-
-	mov	w4, w0
-	mov	x5, x1
-	mov	w6, w2
-
-	add	x0, sp, #16
-	mov	x1, #sa_sz
-	bl	memclr
-
-	mov	w0, w4
-	add	x1, sp, #16
-	str	w6, [x1, #sa_flags]
-	str	x5, [x1, #sa_handler]
-	mov	x2, #0
-	mov	x3, #sa_mask_sz
-	mov	x8, #__NR_rt_sigaction
-	svc	#0
-
-	cbz	w0, 1f
-
-	puts	"sigaction failure\n"
-	b	exit_error
-
-1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
-	ret
-endfunction
-
-// Main program entry point
-.globl _start
-function _start
-	enable_gcs
-
-	mov	x23, #0		// Irritation signal count
-
-	mov	w0, #SIGINT
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGTERM
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGUSR1
-	adr	x1, irritator_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
-	mov	w0, #SIGUSR2
-	adr	x1, tickle_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
+// Program specific main function
+.globl main
+function main
 #ifdef SSVE
 	puts	"Streaming mode "
 	smstart_sm
@@ -404,16 +346,6 @@ function _start
 	bl	putdec
 	puts	" bits\n"
 
-	// Obtain our PID, to ensure test pattern uniqueness between processes
-
-	mov	x8, #__NR_getpid
-	svc	#0
-	mov	x20, x0
-
-	puts	"PID:\t"
-	mov	x0, x20
-	bl	putdecn
-
 #ifdef SSVE
 	smstart_sm		// syscalls will have exited streaming mode
 #endif
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index e1ba559b66e9..3fb9ac5c8f8b 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -161,69 +161,11 @@ function irritator_handler
 
 	ret
 endfunction
+.globl	irritator_handler
 
-// w0: signal number
-// x1: sa_action
-// w2: sa_flags
-// Clobbers x0-x6,x8
-function setsignal
-	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
-
-	mov	w4, w0
-	mov	x5, x1
-	mov	w6, w2
-
-	add	x0, sp, #16
-	mov	x1, #sa_sz
-	bl	memclr
-
-	mov	w0, w4
-	add	x1, sp, #16
-	str	w6, [x1, #sa_flags]
-	str	x5, [x1, #sa_handler]
-	mov	x2, #0
-	mov	x3, #sa_mask_sz
-	mov	x8, #__NR_rt_sigaction
-	svc	#0
-
-	cbz	w0, 1f
-
-	puts	"sigaction failure\n"
-	b	exit_error
-
-1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
-	ret
-endfunction
-
-// Main program entry point
-.globl _start
-function _start
-	enable_gcs
-
-	mov	x23, #0		// signal count
-
-	mov	w0, #SIGINT
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGTERM
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGUSR1
-	adr	x1, irritator_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
-	mov	w0, #SIGUSR2
-	adr	x1, tickle_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
+// Program specific main function
+.globl main
+function main
 	puts	"Streaming mode "
 	smstart_za
 
@@ -247,15 +189,6 @@ function _start
 	bl	putdec
 	puts	" bits\n"
 
-	// Obtain our PID, to ensure test pattern uniqueness between processes
-	mov	x8, #__NR_getpid
-	svc	#0
-	mov	x20, x0
-
-	puts	"PID:\t"
-	mov	x0, x20
-	bl	putdecn
-
 	mov	x22, #0		// generation number, increments per iteration
 .Ltest_loop:
 	rdsvl	0, 8
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index 7fbd96face01..39af1c96a4e5 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -130,80 +130,13 @@ function irritator_handler
 
 	ret
 endfunction
+.globl	irritator_handler
 
-// w0: signal number
-// x1: sa_action
-// w2: sa_flags
-// Clobbers x0-x6,x8
-function setsignal
-	str	x30, [sp, #-((sa_sz + 15) / 16 * 16 + 16)]!
-
-	mov	w4, w0
-	mov	x5, x1
-	mov	w6, w2
-
-	add	x0, sp, #16
-	mov	x1, #sa_sz
-	bl	memclr
-
-	mov	w0, w4
-	add	x1, sp, #16
-	str	w6, [x1, #sa_flags]
-	str	x5, [x1, #sa_handler]
-	mov	x2, #0
-	mov	x3, #sa_mask_sz
-	mov	x8, #__NR_rt_sigaction
-	svc	#0
-
-	cbz	w0, 1f
-
-	puts	"sigaction failure\n"
-	b	exit_error
-
-1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
-	ret
-endfunction
-
-// Main program entry point
-.globl _start
-function _start
-	enable_gcs
-
-	mov	x23, #0		// signal count
-
-	mov	w0, #SIGINT
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGTERM
-	adr	x1, terminate_handler
-	mov	w2, #SA_SIGINFO
-	bl	setsignal
-
-	mov	w0, #SIGUSR1
-	adr	x1, irritator_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
-	mov	w0, #SIGUSR2
-	adr	x1, tickle_handler
-	mov	w2, #SA_SIGINFO
-	orr	w2, w2, #SA_NODEFER
-	bl	setsignal
-
+// Program specific main function
+.globl main
+function main
 	smstart_za
 
-	// Obtain our PID, to ensure test pattern uniqueness between processes
-	mov	x8, #__NR_getpid
-	svc	#0
-	mov	x20, x0
-
-	puts	"PID:\t"
-	mov	x0, x20
-	bl	putdecn
-
 	mov	x22, #0		// generation number, increments per iteration
 .Ltest_loop:
 	mov	x0, x20

-- 
2.47.3


