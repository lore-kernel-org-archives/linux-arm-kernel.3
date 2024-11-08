Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1677CD5C0C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8+5dM3A0kDTK7koR9/OFsfeZtBkrMeftoP9Nt23vPI=; b=d8r0DEsArgdsqA7a7aCil+Oo02
	gn35HI46GzXn7YH/8exMfCxVQxx/ZRCnZEYrHZp15eK2HqzMDMA2oA5eeg7hJcqEvGftWOYRmDnn/
	WVL9/muU9utO2oPi45MW2PHRO0/PpBEU6HcncTu5zzNXHF77QxuHPk1/9ZidtdztQl1w4xrqX1C0M
	+nyIT6UtZGHMCV2LZW8XLReSkBrhtAXS6O5JgzeKfZt9ctL95N7qR/ormMCJCDTwMMvIGOLyrOCMF
	eyptQfEt8oFqpYvUr+3+8AGY6njcTujxcKEI44Vd9zjH7Eo087AVBlN5XJlsQIIZEXapNIXeW6Dom
	GSPLCKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PQB-0000000AlR6-0XzX;
	Fri, 08 Nov 2024 13:53:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PMd-0000000AkNN-0yUw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E880A41D9B;
	Fri,  8 Nov 2024 13:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CBAEC4CED4;
	Fri,  8 Nov 2024 13:49:24 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/4] kselftest/arm64: Fix printf() compiler warnings in the arm64 fp tests
Date: Fri,  8 Nov 2024 13:49:17 +0000
Message-Id: <20241108134920.1233992-2-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108134920.1233992-1-catalin.marinas@arm.com>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054927_424053_C491A91C 
X-CRM114-Status: GOOD (  10.70  )
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

Lots of incorrect length modifiers, missing arguments or conversion
specifiers. Fix them.

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 16 +++++++++-------
 tools/testing/selftests/arm64/fp/za-ptrace.c  |  8 +++++---
 tools/testing/selftests/arm64/fp/zt-ptrace.c  |  8 +++++---
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index 6d61992fe8a0..577b6e05e860 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -82,10 +82,12 @@ static void fill_buf(char *buf, size_t size)
 static int do_child(void)
 {
 	if (ptrace(PTRACE_TRACEME, -1, NULL, NULL))
-		ksft_exit_fail_msg("PTRACE_TRACEME", strerror(errno));
+		ksft_exit_fail_msg("ptrace(PTRACE_TRACEME) failed: %s (%d)\n",
+				   strerror(errno), errno);
 
 	if (raise(SIGSTOP))
-		ksft_exit_fail_msg("raise(SIGSTOP)", strerror(errno));
+		ksft_exit_fail_msg("raise(SIGSTOP) failed: %s (%d)\n",
+				   strerror(errno), errno);
 
 	return EXIT_SUCCESS;
 }
@@ -340,7 +342,7 @@ static void ptrace_set_sve_get_sve_data(pid_t child,
 	data_size = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
 	write_buf = malloc(data_size);
 	if (!write_buf) {
-		ksft_test_result_fail("Error allocating %d byte buffer for %s VL %u\n",
+		ksft_test_result_fail("Error allocating %ld byte buffer for %s VL %u\n",
 				      data_size, type->name, vl);
 		return;
 	}
@@ -441,7 +443,7 @@ static void ptrace_set_sve_get_fpsimd_data(pid_t child,
 	data_size = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
 	write_buf = malloc(data_size);
 	if (!write_buf) {
-		ksft_test_result_fail("Error allocating %d byte buffer for %s VL %u\n",
+		ksft_test_result_fail("Error allocating %ld byte buffer for %s VL %u\n",
 				      data_size, type->name, vl);
 		return;
 	}
@@ -545,7 +547,7 @@ static void ptrace_set_fpsimd_get_sve_data(pid_t child,
 	read_sve = read_buf;
 
 	if (read_sve->vl != vl) {
-		ksft_test_result_fail("Child VL != expected VL %d\n",
+		ksft_test_result_fail("Child VL != expected VL: %u != %u\n",
 				      read_sve->vl, vl);
 		goto out;
 	}
@@ -555,7 +557,7 @@ static void ptrace_set_fpsimd_get_sve_data(pid_t child,
 	case SVE_PT_REGS_FPSIMD:
 		expected_size = SVE_PT_FPSIMD_SIZE(vq, SVE_PT_REGS_FPSIMD);
 		if (read_sve_size < expected_size) {
-			ksft_test_result_fail("Read %d bytes, expected %d\n",
+			ksft_test_result_fail("Read %ld bytes, expected %ld\n",
 					      read_sve_size, expected_size);
 			goto out;
 		}
@@ -571,7 +573,7 @@ static void ptrace_set_fpsimd_get_sve_data(pid_t child,
 	case SVE_PT_REGS_SVE:
 		expected_size = SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
 		if (read_sve_size < expected_size) {
-			ksft_test_result_fail("Read %d bytes, expected %d\n",
+			ksft_test_result_fail("Read %ld bytes, expected %ld\n",
 					      read_sve_size, expected_size);
 			goto out;
 		}
diff --git a/tools/testing/selftests/arm64/fp/za-ptrace.c b/tools/testing/selftests/arm64/fp/za-ptrace.c
index ac27d87396fc..08c777f87ea2 100644
--- a/tools/testing/selftests/arm64/fp/za-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/za-ptrace.c
@@ -48,10 +48,12 @@ static void fill_buf(char *buf, size_t size)
 static int do_child(void)
 {
 	if (ptrace(PTRACE_TRACEME, -1, NULL, NULL))
-		ksft_exit_fail_msg("PTRACE_TRACEME", strerror(errno));
+		ksft_exit_fail_msg("ptrace(PTRACE_TRACEME) failed: %s (%d)",
+				   strerror(errno), errno);
 
 	if (raise(SIGSTOP))
-		ksft_exit_fail_msg("raise(SIGSTOP)", strerror(errno));
+		ksft_exit_fail_msg("raise(SIGSTOP) failed: %s (%d)\n",
+				   strerror(errno), errno);
 
 	return EXIT_SUCCESS;
 }
@@ -201,7 +203,7 @@ static void ptrace_set_get_data(pid_t child, unsigned int vl)
 	data_size = ZA_PT_SIZE(vq);
 	write_buf = malloc(data_size);
 	if (!write_buf) {
-		ksft_test_result_fail("Error allocating %d byte buffer for VL %u\n",
+		ksft_test_result_fail("Error allocating %ld byte buffer for VL %u\n",
 				      data_size, vl);
 		return;
 	}
diff --git a/tools/testing/selftests/arm64/fp/zt-ptrace.c b/tools/testing/selftests/arm64/fp/zt-ptrace.c
index 996d9614a131..584b8d59b7ea 100644
--- a/tools/testing/selftests/arm64/fp/zt-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/zt-ptrace.c
@@ -43,10 +43,12 @@ static void fill_buf(char *buf, size_t size)
 static int do_child(void)
 {
 	if (ptrace(PTRACE_TRACEME, -1, NULL, NULL))
-		ksft_exit_fail_msg("PTRACE_TRACEME", strerror(errno));
+		ksft_exit_fail_msg("ptrace(PTRACE_TRACEME) failed: %s (%d)\n",
+				   strerror(errno), errno);
 
 	if (raise(SIGSTOP))
-		ksft_exit_fail_msg("raise(SIGSTOP)", strerror(errno));
+		ksft_exit_fail_msg("raise(SIGSTOP) failed: %s (%d)\n",
+				   strerror(errno), errno);
 
 	return EXIT_SUCCESS;
 }
@@ -231,7 +233,7 @@ static void ptrace_enable_za_via_zt(pid_t child)
 		/* Should have register data */
 		if (za_out->size < ZA_PT_SIZE(vq)) {
 			ksft_print_msg("ZA data less than expected: %u < %u\n",
-				       za_out->size, ZA_PT_SIZE(vq));
+				       za_out->size, (unsigned int)ZA_PT_SIZE(vq));
 			fail = true;
 			vq = 0;
 		}

