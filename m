Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27873606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UpMfALPx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bWQ1VH/f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UUr2L0xZXuVjXC0opxsWwmpYI8eWn5RdN8+EU6TaHG8=; b=UpMfALPxjf0cUE
	VqE/nKxeutCkLBZM3B9GTI7uFnflUy6o90BgDDZ5Nds5JUWLLVJYFRibNnpboJ3TFh7ge0gsycXbG
	j1bIx2SEpOW6FGeDILglI1sMMXPEiKT2jVTsSXjOX/B0R/Zsw31iSJLWgmPtyAEDKhRW9NiAE/4fY
	GByyP5vpadsBNUz7Fo2s8fH2c3OoDJUablC/RodPNcApHZxBa44NcKIy51ywxgZAuZliCcxd5PTz2
	b/tBgeCgheVgSbGtCDEODFcANKURvHceH2z77of88MIaI3yx5h5S6PXW0DBWu7t49+Y6c3PpaIEFc
	rARQvVYtNa19N4058rog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEi-00000009Efv-0JQT;
	Thu, 05 Nov 2026 14:14:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyEZ-00000009EVf-22dx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:14:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC16360A97;
	Thu,  5 Nov 2026 14:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE961F00A2A;
	Thu,  5 Nov 2026 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888070;
	bh=UUr2L0xZXuVjXC0opxsWwmpYI8eWn5RdN8+EU6TaHG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bWQ1VH/fZ0ys/xQSByUc/nnlX5qnS4Lak9ARwR9szLBLFBMZTIL0hcty8eWwrodL9
	 zpXWe0LDZ4F+S850sMnlzWhOTWSN7EhgsNm20G3UANsXVLXlALfZfJFeFY20Jts1xq
	 akvDecTtSlbJSje6yaMgDd+algzfQUg6iFnZMoIlX0vsOrfZB+/h0T8D29nGOlWiMA
	 kHvVY7XBAJoHUvpl2h253LTuQOotHdQKUde6VyZqdbZWVuf2XVC5G3lioxQ6/KQKEV
	 BjPaD3dWpfNZDBjrBJr9WG9wwWIcIo849Mg9iwdwfMqLbQY0W7IF45h6Lk9XICre8w
	 +dvuHZDzLgYgg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:23 +0000
Subject: [PATCH v2 10/11] kselftest/arm64: Use execv() to start fp-stress
 test loads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-10-81a5172468f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3995; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OD+Ba64C7inB0cl5Iu32U66JVXkD8/nZCh6jkxPgkhI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9Gs+KjG1WNFTudJ4ewPr8bTelFXeJx+k2k1xObR29
 l9B4W8XO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARTU1Ghr0N1/crdgSypkze
 nq7KbH21csYGq/CzYroamg87uo7sa2ZkuPLJ7rPTUQP+s9rsB2wf7OT4PeWioresm1lgxN/Yqaf
 l2QA=
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

In preparation for adding KVM test loads which will take command line
arguments switch to using execv() instead of execl() to start the test
load programs.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index 65e01aba96ff..e96fe1ac1ad1 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -60,7 +60,7 @@ static int num_processors(void)
 	return nproc;
 }
 
-static void child_start(struct child_data *child, const char *program)
+static void child_start(struct child_data *child, char *const prog_args[])
 {
 	int ret, pipefd[2], i;
 	struct epoll_event ev;
@@ -116,9 +116,9 @@ static void child_start(struct child_data *child, const char *program)
 			printf("%d bytes of data on startup pipe\n", ret);
 		close(3);
 
-		ret = execl(program, program, NULL);
-		printf("execl(%s) failed: %d (%s)\n",
-		       program, errno, strerror(errno));
+		ret = execv(prog_args[0], prog_args);
+		printf("execv(%s) failed: %d (%s)\n",
+		       prog_args[0], errno, strerror(errno));
 
 		exit(EXIT_FAILURE);
 	} else {
@@ -310,32 +310,35 @@ static void handle_exit_signal(int sig, siginfo_t *info, void *context)
 
 static void start_fpsimd(struct child_data *child, int cpu, int copy)
 {
+	char *args[] = { "./fpsimd-test", NULL };
 	int ret;
 
 	ret = asprintf(&child->name, "FPSIMD-%d-%d", cpu, copy);
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./fpsimd-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_kernel(struct child_data *child, int cpu, int copy)
 {
+	char *args[] = { "./kernel-test", NULL };
 	int ret;
 
 	ret = asprintf(&child->name, "KERNEL-%d-%d", cpu, copy);
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./kernel-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_sve(struct child_data *child, int vl, int cpu)
 {
+	char *args[] = { "./sve-test", NULL };
 	int ret;
 
 	ret = prctl(PR_SVE_SET_VL, vl | PR_SVE_VL_INHERIT);
@@ -346,13 +349,14 @@ static void start_sve(struct child_data *child, int vl, int cpu)
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./sve-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_ssve(struct child_data *child, int vl, int cpu)
 {
+	char *args[] = { "./ssve-test", NULL };
 	int ret;
 
 	ret = asprintf(&child->name, "SSVE-VL-%d-%d", vl, cpu);
@@ -363,13 +367,14 @@ static void start_ssve(struct child_data *child, int vl, int cpu)
 	if (ret < 0)
 		ksft_exit_fail_msg("Failed to set SME VL %d\n", ret);
 
-	child_start(child, "./ssve-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_za(struct child_data *child, int vl, int cpu)
 {
+	char *args[] = { "./za-test", NULL };
 	int ret;
 
 	ret = prctl(PR_SME_SET_VL, vl | PR_SVE_VL_INHERIT);
@@ -380,20 +385,21 @@ static void start_za(struct child_data *child, int vl, int cpu)
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./za-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }
 
 static void start_zt(struct child_data *child, int cpu)
 {
+	char *args[] = { "./zt-test", NULL };
 	int ret;
 
 	ret = asprintf(&child->name, "ZT-%d", cpu);
 	if (ret == -1)
 		ksft_exit_fail_msg("asprintf() failed\n");
 
-	child_start(child, "./zt-test");
+	child_start(child, args);
 
 	ksft_print_msg("Started %s\n", child->name);
 }

-- 
2.47.3


