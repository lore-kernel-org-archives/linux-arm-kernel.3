Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C377C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0h1PukO+UHeQFLXtNBQr0NfD52qecvWe2RZsBueRTTE=; b=pWkztJnVqWSkE1qYDAIg4P44go
	VrW0NG386oIdttzlH0wCeNmlme4hk6qNOJcI8pBMibkfoJhli+g9effH8WnQPPEQ5p8pW7pTNOqfi
	NI+e/q/rUMZ+5NdfZBU8wqsl6cX5jRO6y2GXYpEZnDi0XwP/Ko8HWMZSHo+z2tykJa1I8mqj44+zQ
	bmRdS7iCfMaJBFtxBCYRT/1CkTuHlbRNhXms2NDDTj8O1FOeMovZKREUDqYacrwC/bHwdnl2sDFFC
	cZ7Ah0omeBN2cEPLfh43i7DF/VjW+2NWR09Bsf+vuvdDyiVvQu32uman0HzymrcCSIyLxKHjkltvP
	5MN5Tnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0SA-00000007Chb-3VsL;
	Tue, 10 Jun 2025 14:59:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyJL-00000006oLA-1uN6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36B534A68C;
	Tue, 10 Jun 2025 12:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A25C4CEED;
	Tue, 10 Jun 2025 12:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749559359;
	bh=k95pgC8uYho6a+kXi0z4LRYhCqPs5d/JUrw8wGO3J2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fsiOLuLeWL0Xc10yYKUqloJZrMK1OEjyoEhpFU4o9QzSidpZAra4hPBB5dBZHhTiD
	 818/zMhWNXIzcABdmDfAocm2GV76ezuqm30eFM7DmhXckY6byX65N+1evCEqymg+sW
	 lu64hmcgqbkzIE7rhtT7qZTWyjAwtjLRchWyEogktA94XotyEb/R6YAmBGf0oK1qxC
	 ggKRces2B3P1Fe7CTZhEIYRWZJUB2IqqtcUQ3DNcis/3t1tYzAeGSeH0wmlTvCmp3H
	 ETpHkoqFe1JHz+R8IbIQwYSyRGaTeA4EkNLGDYRwJOwuZ+lPfqUgtAB+VRg9oVSicx
	 r/N3xxxb68ZnQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Jun 2025 13:29:47 +0100
Subject: [PATCH v2 4/4] selftests/nolibc: Add coverage of vfork()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-arm64-gcs-vfork-exit-v2-4-929443dfcf82@kernel.org>
References: <20250610-arm64-gcs-vfork-exit-v2-0-929443dfcf82@kernel.org>
In-Reply-To: <20250610-arm64-gcs-vfork-exit-v2-0-929443dfcf82@kernel.org>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Christian Brauner <brauner@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2649; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k95pgC8uYho6a+kXi0z4LRYhCqPs5d/JUrw8wGO3J2U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoSCgxDdwtoQD5Ra5mGt8UN9d0cGbAAOvD/dkn3A8W
 VjR+qxGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEgoMQAKCRAk1otyXVSH0KAyB/
 wNxl/FZnzIgWNyszdC7wdp+VFWDFsz2+WxB5+A7fijMn1rBBYPdS9gFZ7FyJq76U9gJMF/OX53Dv+n
 0w5hk73UhIcowtY/r4Am4WrncCAQFz5TPbLI9JJBN/+O9AiSaY38wRZYEii2mKgpkOK9QQctIGh/ck
 KPDJsyo0hWQlC9gEx1qSWwa+sRGQNFPJFIUJm3mSxPdN1/ba/yacvFEa/2iHekpWMmE28bsA+eqcfz
 tvacCJX3aLeHlKjchkXnsBgVlr2chtd1Mtu67XWWLIBGhtJIfoK1eTpRPt3dFHovRdUufo6bAc+J88
 9nG2A0178MlZI1YF5zXGIYbnGlfd8b
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_054239_535976_20B123E7 
X-CRM114-Status: GOOD (  10.59  )
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


