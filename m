Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA11C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0h1PukO+UHeQFLXtNBQr0NfD52qecvWe2RZsBueRTTE=; b=xUwfDyoM6jARBOuXbAOi9u73xA
	0mBNZyaX2FpGmLIDbY5LPfWuUmm1QONxYm6ydA9Y847vS7oVMEm2tb3qj8MdeC+1f9PirucK03w0V
	ku8usFbQmpydTUbSaibUu3zMEjd4e4pIfgWpPnVuw1/VDftvk/kFCdE+s7yTt/WNcs+sWoqptzJ9X
	mw+gSaR9SJZo0OgiTxoRK+v0AgFqKAFFA38jyctIypsMvah1q3T/vUOyUF920od7x8XnUDTxM0O7N
	E42MENSsg3I0ddW2V2SWyoRtVm9HSih7qo1BEFeCxgnOSNNf6jN1d5Nb5VWQrkhe1y9jdWCe7OfOt
	sX1KIAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1o-0000000CWhn-2Beq;
	Thu, 03 Jul 2025 20:59:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMS2-0000000BwCZ-2ydd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:06:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29B0061446;
	Thu,  3 Jul 2025 16:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1670C4CEEE;
	Thu,  3 Jul 2025 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558777;
	bh=k95pgC8uYho6a+kXi0z4LRYhCqPs5d/JUrw8wGO3J2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sZlNlyTttCKjCKDEo8ZvK65gLEsZunjGIXsP5gHiBfqrFJbIFhcXTs6X3P5LOtxPm
	 VgDQNJD4JdNzbPL5OWGyWLWFHmAiHV21mBI5VjqiTGkAUqk9sY/78KWKK+ONvC+onB
	 k5QMMuBXcSqpvs5xjg+qLQJz3mhhev98wO6GUX1ueaxXDNmPorRoJxboxe9rDVIRqG
	 gnNoiMcD42iPK6tG+fBR78lcSX/alafSN/bFlvYAgpUaMrn5Uflmo+Q5KEeLyivCe5
	 7pybOZVPCUmJcKKYOkEoucLTz2QQ86DBvfgZENH/0EJzTUBUMTP/tyQIeNF6ThXJVf
	 AysWdl4zV3alQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 03 Jul 2025 17:00:18 +0100
Subject: [PATCH v3 4/4] selftests/nolibc: Add coverage of vfork()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-arm64-gcs-vfork-exit-v3-4-1e9a9d2ddbbe@kernel.org>
References: <20250703-arm64-gcs-vfork-exit-v3-0-1e9a9d2ddbbe@kernel.org>
In-Reply-To: <20250703-arm64-gcs-vfork-exit-v3-0-1e9a9d2ddbbe@kernel.org>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Christian Brauner <brauner@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2649; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k95pgC8uYho6a+kXi0z4LRYhCqPs5d/JUrw8wGO3J2U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoZqpp3i92RBIH/xgX25THZxzWR1YIDTNkbJkXN
 aX0+ZotRh2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaGaqaQAKCRAk1otyXVSH
 0EP3B/9g2ihNKWqWkt4iW9QbyCgKDPCPqf+nZBPeEOOS7APQmwzTyQnuCfYmcEBB1fqKDN8wgss
 gBxNEKi9+ZtR4twbwAqnOr4+44Tq1oU1/hyBKt/6gFP0NkojKMOuKDVt1Z9b9Ac8qjGW/Z+zqcT
 tnnAFa5iY2+8MSMd8cO04Jc9FYZ8IeF+oKwfXfHL/1e6gpvSKS7cY7pcgil6Fiqx4TdYahvBdmq
 S2t4AeIyE5WcHgJdxol0nkzHlXry4UMz0tYsWsdlnkrzwovKBSTGtbkAqBjRrqoYTKuvoMvdz8t
 LKTVIDb5ETcI1KEUqCcSbZBVeXpDSJeYAS80FxSbHyKQAoxN
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

Generalise the existing fork() test to also cover the newly added vfork()
implementation.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index dbe13000fb1a..d682434c6442 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -877,7 +877,12 @@ int test_file_stream(void)
 	return 0;
 }
 
-int test_fork(void)
+enum fork_type {
+	FORK_STANDARD,
+	FORK_VFORK,
+};
+
+int test_fork(enum fork_type type)
 {
 	int status;
 	pid_t pid;
@@ -886,14 +891,23 @@ int test_fork(void)
 	fflush(stdout);
 	fflush(stderr);
 
-	pid = fork();
+	switch (type) {
+	case FORK_STANDARD:
+		pid = fork();
+		break;
+	case FORK_VFORK:
+		pid = vfork();
+		break;
+	default:
+		return 1;
+	}
 
 	switch (pid) {
 	case -1:
 		return 1;
 
 	case 0:
-		exit(123);
+		_exit(123);
 
 	default:
 		pid = waitpid(pid, &status, 0);
@@ -1330,7 +1344,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(dup3_m1);           tmp = dup3(-1, 100, 0); EXPECT_SYSER(1, tmp, -1, EBADF); if (tmp != -1) close(tmp); break;
 		CASE_TEST(execve_root);       EXPECT_SYSER(1, execve("/", (char*[]){ [0] = "/", [1] = NULL }, NULL), -1, EACCES); break;
 		CASE_TEST(file_stream);       EXPECT_SYSZR(1, test_file_stream()); break;
-		CASE_TEST(fork);              EXPECT_SYSZR(1, test_fork()); break;
+		CASE_TEST(fork);              EXPECT_SYSZR(1, test_fork(FORK_STANDARD)); break;
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
 		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
 		CASE_TEST(directories);       EXPECT_SYSZR(proc, test_dirent()); break;
@@ -1374,6 +1388,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(uname_fault);       EXPECT_SYSER(1, uname(NULL), -1, EFAULT); break;
 		CASE_TEST(unlink_root);       EXPECT_SYSER(1, unlink("/"), -1, EISDIR); break;
 		CASE_TEST(unlink_blah);       EXPECT_SYSER(1, unlink("/proc/self/blah"), -1, ENOENT); break;
+		CASE_TEST(vfork);             EXPECT_SYSZR(1, test_fork(FORK_VFORK)); break;
 		CASE_TEST(wait_child);        EXPECT_SYSER(1, wait(&tmp), -1, ECHILD); break;
 		CASE_TEST(waitpid_min);       EXPECT_SYSER(1, waitpid(INT_MIN, &tmp, WNOHANG), -1, ESRCH); break;
 		CASE_TEST(waitpid_child);     EXPECT_SYSER(1, waitpid(getpid(), &tmp, WNOHANG), -1, ECHILD); break;

-- 
2.39.5


