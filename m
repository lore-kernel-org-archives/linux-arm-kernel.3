Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8494C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 12:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7pZbocGTMgY94paPsqEdYZfVZVkCswiG2GfnqKlVzrM=; b=vDDv4iQRltTnOxaPd8OtHU0u11
	CdwduziJWBkJhFiIubZuViWoKlnzXJtADr/vJe+LKTBQ5SFglDD6RPDN4I9YZfSE0kVjtgTbjEDh+
	EoRD3SYCIII8cS3F3SkZCt4OKZbsZ5Gy+z9M6YjB9gpOzVt27HAuY8C/OrEuypEN4wMoZSpimLZSW
	rvC2zWxlLSe5spMp73TWoo3bMNSHeVRWsFG8ozwWn3W3tXcs7jiQSLOU4uQylbt4xd87w4hB75pA1
	1Ml01CemZeJ4f8mLZgqm6Trc6BhdfHl1UBjfS9a6tWQwp39Vm3r50vnCmM9f4FvcQXbEkwSp/yjcN
	HlsXarrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh58x-0000000FWaY-0WZO;
	Sat, 17 Jan 2026 12:11:03 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh58u-0000000FWa9-0dzK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 12:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768651856;
	bh=xV++OX5BruJPiGUB+6BtsUIpwLf98Tp7WflSyeVyANw=;
	h=From:Date:Subject:To:Cc:From;
	b=AC8x14DEnUIOTHuVlIaPow5UJBc7qm85ukk3aR536MgBtgFdb18tS7k/KwW+4jjIs
	 NuMM1uPIxz8O52L44JEC1Fl7wofWQsfblw2WUu5jIMdEfhLdoDYN3daRxdJvuUJzp4
	 4+MTSPzoRu3D3aDRTdduejnG5+Pvlw0hw6fFfehk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 17 Jan 2026 13:10:51 +0100
Subject: [PATCH] kselftest/arm64: Use syscall() macro over nolibc
 my_syscall()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260117-nolibc-mysyscall-arm64-v1-1-f70266a3db15@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrDIBBA0auEWWcgWlHoVUoXE520A8YUB0KC5
 O6VLN/i/wbKVVjhOTSovIvKVjrMOED8UvkwSuoGO1k/GROwbFnmiOupp0bKGamu3qFjitY90hw
 SQY9/lRc57vHrfV1/RnlZI2gAAAA=
X-Change-ID: 20260117-nolibc-mysyscall-arm64-4eac243db7da
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768651855; l=5998;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=xV++OX5BruJPiGUB+6BtsUIpwLf98Tp7WflSyeVyANw=;
 b=92OTViQiCo/kZDfONPWVG9BjDJR6sqNznXHJze+SrWLwBb76kdsRzaRZc1xd4FxCvACQ8BtTE
 zPOxwnTPOcCD03KruZdxU5rBlura12YKcni+DCKnZIrqQVnztqQIbGb
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_041100_373072_80887414 
X-CRM114-Status: GOOD (  13.68  )
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

The my_syscall*() macros are internal implementation details of nolibc.
Nolibc also provides the regular syscall(2), which is also a macro
and directly expands to the correct my_syscall().

Use syscall() instead.

As a side-effect this fixes some return value checks, as my_syscall()
returns the raw value as set by the kernel and does not set errno.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Compile-tested only.
For the arm64 tree.

I want to rename those macros at some point.
---
 tools/testing/selftests/arm64/abi/tpidr2.c    |  3 +-
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 40 +++++++++++----------------
 2 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/tpidr2.c b/tools/testing/selftests/arm64/abi/tpidr2.c
index 1703543fb7c7..ce4550fb7224 100644
--- a/tools/testing/selftests/arm64/abi/tpidr2.c
+++ b/tools/testing/selftests/arm64/abi/tpidr2.c
@@ -128,8 +128,7 @@ static int sys_clone(unsigned long clone_flags, unsigned long newsp,
 		     int *parent_tidptr, unsigned long tls,
 		     int *child_tidptr)
 {
-	return my_syscall5(__NR_clone, clone_flags, newsp, parent_tidptr, tls,
-			   child_tidptr);
+	return syscall(__NR_clone, clone_flags, newsp, parent_tidptr, tls, child_tidptr);
 }
 
 #define __STACK_SIZE (8 * 1024 * 1024)
diff --git a/tools/testing/selftests/arm64/gcs/basic-gcs.c b/tools/testing/selftests/arm64/gcs/basic-gcs.c
index 250977abc398..ae4cce6afe2b 100644
--- a/tools/testing/selftests/arm64/gcs/basic-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/basic-gcs.c
@@ -22,7 +22,7 @@ static size_t page_size = 65536;
 static  __attribute__((noinline)) void valid_gcs_function(void)
 {
 	/* Do something the compiler can't optimise out */
-	my_syscall1(__NR_prctl, PR_SVE_GET_VL);
+	syscall(__NR_prctl, PR_SVE_GET_VL);
 }
 
 static inline int gcs_set_status(unsigned long mode)
@@ -36,12 +36,10 @@ static inline int gcs_set_status(unsigned long mode)
 	 * other 3 values passed in registers to the syscall are zero
 	 * since the kernel validates them.
 	 */
-	ret = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, mode,
-			  0, 0, 0);
+	ret = syscall(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, mode, 0, 0, 0);
 
 	if (ret == 0) {
-		ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
-				  &new_mode, 0, 0, 0);
+		ret = syscall(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &new_mode, 0, 0, 0);
 		if (ret == 0) {
 			if (new_mode != mode) {
 				ksft_print_msg("Mode set to %lx not %lx\n",
@@ -49,7 +47,7 @@ static inline int gcs_set_status(unsigned long mode)
 				ret = -EINVAL;
 			}
 		} else {
-			ksft_print_msg("Failed to validate mode: %d\n", ret);
+			ksft_print_msg("Failed to validate mode: %d\n", errno);
 		}
 
 		if (enabling != chkfeat_gcs()) {
@@ -69,10 +67,9 @@ static bool read_status(void)
 	unsigned long state;
 	int ret;
 
-	ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
-			  &state, 0, 0, 0);
+	ret = syscall(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &state, 0, 0, 0);
 	if (ret != 0) {
-		ksft_print_msg("Failed to read state: %d\n", ret);
+		ksft_print_msg("Failed to read state: %d\n", errno);
 		return false;
 	}
 
@@ -188,9 +185,8 @@ static bool map_guarded_stack(void)
 	int elem;
 	bool pass = true;
 
-	buf = (void *)my_syscall3(__NR_map_shadow_stack, 0, page_size,
-				  SHADOW_STACK_SET_MARKER |
-				  SHADOW_STACK_SET_TOKEN);
+	buf = (void *)syscall(__NR_map_shadow_stack, 0, page_size,
+			      SHADOW_STACK_SET_MARKER | SHADOW_STACK_SET_TOKEN);
 	if (buf == MAP_FAILED) {
 		ksft_print_msg("Failed to map %lu byte GCS: %d\n",
 			       page_size, errno);
@@ -257,8 +253,7 @@ static bool test_fork(void)
 		valid_gcs_function();
 		get_gcspr();
 
-		ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
-				  &child_mode, 0, 0, 0);
+		ret = syscall(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &child_mode, 0, 0, 0);
 		if (ret == 0 && !(child_mode & PR_SHADOW_STACK_ENABLE)) {
 			ksft_print_msg("GCS not enabled in child\n");
 			ret = -EINVAL;
@@ -321,8 +316,7 @@ static bool test_vfork(void)
 		valid_gcs_function();
 		get_gcspr();
 
-		ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
-				  &child_mode, 0, 0, 0);
+		ret = syscall(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &child_mode, 0, 0, 0);
 		if (ret == 0 && !(child_mode & PR_SHADOW_STACK_ENABLE)) {
 			ksft_print_msg("GCS not enabled in child\n");
 			ret = EXIT_FAILURE;
@@ -390,17 +384,15 @@ int main(void)
 	if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
 		ksft_exit_skip("SKIP GCS not supported\n");
 
-	ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
-			  &gcs_mode, 0, 0, 0);
+	ret = syscall(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &gcs_mode, 0, 0, 0);
 	if (ret != 0)
-		ksft_exit_fail_msg("Failed to read GCS state: %d\n", ret);
+		ksft_exit_fail_msg("Failed to read GCS state: %d\n", errno);
 
 	if (!(gcs_mode & PR_SHADOW_STACK_ENABLE)) {
 		gcs_mode = PR_SHADOW_STACK_ENABLE;
-		ret = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
-				  gcs_mode, 0, 0, 0);
+		ret = syscall(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, gcs_mode, 0, 0, 0);
 		if (ret != 0)
-			ksft_exit_fail_msg("Failed to enable GCS: %d\n", ret);
+			ksft_exit_fail_msg("Failed to enable GCS: %d\n", errno);
 	}
 
 	ksft_set_plan(ARRAY_SIZE(tests));
@@ -410,9 +402,9 @@ int main(void)
 	}
 
 	/* One last test: disable GCS, we can do this one time */
-	ret = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, 0, 0, 0, 0);
+	ret = syscall(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, 0, 0, 0, 0);
 	if (ret != 0)
-		ksft_print_msg("Failed to disable GCS: %d\n", ret);
+		ksft_print_msg("Failed to disable GCS: %d\n", errno);
 
 	ksft_finished();
 

---
base-commit: db81cecbeb215e764413dfc25489c30220f7241c
change-id: 20260117-nolibc-mysyscall-arm64-4eac243db7da

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


