Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF9A606D816
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UqrMu6P5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5E4noKP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ByEnk8nMNqCzJm/evBrs6o2hhpCWKZBrJlQlHPA57Lk=; b=UqrMu6P5sKqfvo
	GOhszfiu2kP7hwcIx6VRWKHdJgqNJKBcrkyXfnA0VkOah5IS0Rds8AsuLIfQubMJ6o2fCeszll7L+
	gRxfO4s6iXTBPclMIvtfuHJJjbZc3D5f5oARXYX5AfDSVABnW0w85llh8YQljfZl+0TN52n7rONlm
	RW0u0QpRLJab4K0fwWWfwOxiDqMQV+kl6aIL1yrx3tjBKbxOyHkhA8jvNIUjW1s57nYotUkyqXsy8
	1PSZPtQ/RY0B4sF31U54tqh/wmXrStyXCRwNGN1LxRsHSZ043ycDpekXYidRT8j76i/S0/mUufw+I
	ydr9ZA9pC4mNjjeiPk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEN-00000009EFg-3Hx0;
	Thu, 05 Nov 2026 14:14:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEM-00000009EEY-1PfY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B939400D8;
	Thu,  5 Nov 2026 14:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A3F1F00A17;
	Thu,  5 Nov 2026 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888058;
	bh=ByEnk8nMNqCzJm/evBrs6o2hhpCWKZBrJlQlHPA57Lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C5E4noKPcRZSOyvH4/JDe/ZnnXu17CxbYA9IRo9mXLZF4GjRFQk1Oc0epNj0GnbXt
	 Njl6MG0QMvFaSvwrNFLYlLUChl3uJA5iw4Q/whgFcTbEIUMS0GNubk29jCTTdtdu3R
	 eToTbE7U1QDyCA2CJUiLUAeNNeSzBLc8aiQL9gYw5T++glX9znxyPZYuXz70prjlRp
	 RCJ2oToor6oW0WCd3oviGcAe2xugawp6mWKL4lcUjo8rfyQ11XDITEzyPE+WYqLCc9
	 Al2Awsw/7P2gusu0XcqM1eR7HQetFws/a1jv1yNpHTHt22vmJ/t8V8HEH+hk675JNc
	 5d8jGKV+GNo8A==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:18 +0000
Subject: [PATCH v2 05/11] kselftest/arm64: Exit with an error code on data
 mismatches in fp-stress
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-5-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3633; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B/wiVzqMsKKQjQD0tXgLQZUYsmzwz0h2eEJ53nNGjEo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9GtE3H12pFba2CvlZFk9Y/IpSZUJBolFdVv/z/lYF
 14wQY+zo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABN5p87I0HBtk2DcD+7FIgd9
 s3p8rFU45BfynrQ4yfx0jYXkt6zUhQy/2cT3Xdu/Z46ZCAebtPiltl7FI7eU5s94du5trV2+g2k
 XEwA=
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

Several of the fp-stress test loads have blocks at the end of their barf
functions with a range of commented out options for how to exit the program
after logging an error. Comments indicate that these were intended to
interact with some long gone debugging code in the kernel. At the minute
the option selected by all the programs is to deliver a SIGABRT to
themselves but there is no need to do this over a normal exit with a non
zero status. In order to facilitate running as a simple bare metal KVM
guest replace these repeated blocks with calls to exit_error(), this
will integrate just as well with the fp-stress harness.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-test.S | 19 +------------------
 tools/testing/selftests/arm64/fp/za-test.S  | 20 +-------------------
 tools/testing/selftests/arm64/fp/zt-test.S  | 20 +-------------------
 3 files changed, 3 insertions(+), 56 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 26efdbdd88f9..d2ed2a44bdb5 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -477,11 +477,6 @@ function _start
 endfunction
 
 function barf
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// end hack
 	mov	x10, x0	// expected data
 	mov	x11, x1	// actual data
 	mov	x12, x2	// data size
@@ -515,19 +510,7 @@ function barf
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
index 7208bb2db9f1..e1ba559b66e9 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -291,12 +291,6 @@ function _start
 endfunction
 
 function barf
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// end hack
-
 	mrs	x13, S3_3_C4_C2_2
 
 	smstop
@@ -326,19 +320,7 @@ function barf
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
index c6cfbdeb2f0c..7fbd96face01 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -225,12 +225,6 @@ function _start
 endfunction
 
 function barf
-// fpsimd.c acitivty log dump hack
-//	ldr	w0, =0xdeadc0de
-//	mov	w8, #__NR_exit
-//	svc	#0
-// end hack
-
 	mrs	x13, S3_3_C4_C2_2
 	smstop
 	mov	x10, x0	// expected data
@@ -256,19 +250,7 @@ function barf
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


