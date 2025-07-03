Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4557CC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhdP3/FQHSjrxWTqzuu19PBxD9WUK22oYYs22W3Au0g=; b=mvgEODHmjoBaPkfh0+EGtFbCcW
	14zgPyj59DnbuvjG0qqtbS1LZDf7Tsi/vC7qs1Q/rUG9MvnPUCYAnZKuJhiFuC8BPBeiZgdYTlOd0
	eGSMwbS0mGyL30GeCJxur+Plm+JESlfuBq5tXqJre5zqPuw6L0mTCyale5ky/gPRIRwBvUPbB6l5w
	L3Ysyz6bq/Ydom/0Q1OiqdxBPHt4gYAoPLiaRZXl+PEifMYwY/S8t7BSprPISSSna7/gxJDXyu/94
	fYAl2R4uZmY9JZ2rLNJ62+p1WUO0/NNGMj9DVv30VafY0Od4wG8etTxqRRoJ0QNtnWzj6uHo0WUwW
	y3Cwi7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1n-0000000CWfN-1rdr;
	Thu, 03 Jul 2025 20:59:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMRz-0000000BwAw-2ahv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:06:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 584A34657A;
	Thu,  3 Jul 2025 16:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B52C4CEE3;
	Thu,  3 Jul 2025 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558775;
	bh=JqVBI6zD71hSTx5yFb78+uxctGMkoxR2pJgkc2W8UzQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AkPCTteMy81OpE3Mi26WPe1/iz9nJQ48IWOz3etCp8VLyWjeJcPoJeFuwa/7M5SgQ
	 FsehYh6aWSwv3z5RMRCAJ0IdSR4g2w23B0PW0xhkrehHTEK6D/oYSj66r/2KmK8u0o
	 5hd0pjGe3ubSEzs8Iiz976lEXahx1fU+/dGADjjh253rYgbCFIz95VIKUV5rkBlpKu
	 RXrZD9B3F2kgjPH2waWt5YLV1AZv07/eWX7GpqMMxmRTDaVbepFiBBEjMHPQpslCzj
	 lu9aEbULrwFMKD/lU30BUovod8bq7WVba9kgK3j3y1cErcQwFYUyJugVSHrRB30jgi
	 92RWrld9xZbpA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 03 Jul 2025 17:00:17 +0100
Subject: [PATCH v3 3/4] kselftest/arm64: Add a test for vfork() with GCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-arm64-gcs-vfork-exit-v3-3-1e9a9d2ddbbe@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JqVBI6zD71hSTx5yFb78+uxctGMkoxR2pJgkc2W8UzQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoZqpoRTfqCavfvOeI6HiW0fO9+7QniM8meqnva
 KfwmnOt5gKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaGaqaAAKCRAk1otyXVSH
 0BjAB/4x6C2kGb8P+uyoBFDtAItZkZ+dJBICIFrZzPMjdrZr4zbvUc5btpxrBDbB9ZtDFwSKXUG
 TsU8WJwomcs7GYmNStpckecKrA56vDlSJxQFETIBkONQGgCb+JTKMWo1fW9CKZG4Q7Nc9zI1opC
 ZeYK72T8ZQPxyECGphNjLo5PSnwoJ2kC2MuHNKoSZ4QCdGQ9WXL9KngRKaRWg5iqzZDhKHLZNrL
 F+rZIkIfpViRFvnW98R24jkrIckOfM518Ni0A53po5NSWNRk/Huqkgw2wHxN4gIJHKU1gqFIrGs
 CGYxvbME5UfD4P6v+2i7jOmpeSoIIdW70acTy31OJpwpPDSz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_090615_734490_EBB996C3 
X-CRM114-Status: GOOD (  17.35  )
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

Ensure that we've got at least some coverage of the special cases around
vfork() by adding a test case in basic-gcs doing the same thing as the
plain fork() one - vfork(), do a few checks and then return to the parent.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 63 +++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tools/testing/selftests/arm64/gcs/basic-gcs.c b/tools/testing/selftests/arm64/gcs/basic-gcs.c
index 3fb9742342a3..54f9c888249d 100644
--- a/tools/testing/selftests/arm64/gcs/basic-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/basic-gcs.c
@@ -298,6 +298,68 @@ static bool test_fork(void)
 	return pass;
 }
 
+/* A vfork()ed process can run and exit */
+static bool test_vfork(void)
+{
+	unsigned long child_mode;
+	int ret, status;
+	pid_t pid;
+	bool pass = true;
+
+	pid = vfork();
+	if (pid == -1) {
+		ksft_print_msg("vfork() failed: %d\n", errno);
+		pass = false;
+		goto out;
+	}
+	if (pid == 0) {
+		/*
+		 * In child, make sure we can call a function, read
+		 * the GCS pointer and status and then exit.
+		 */
+		valid_gcs_function();
+		get_gcspr();
+
+		ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
+				  &child_mode, 0, 0, 0);
+		if (ret == 0 && !(child_mode & PR_SHADOW_STACK_ENABLE)) {
+			ksft_print_msg("GCS not enabled in child\n");
+			ret = EXIT_FAILURE;
+		}
+
+		_exit(ret);
+	}
+
+	/*
+	 * In parent, check we can still do function calls then check
+	 * on the child.
+	 */
+	valid_gcs_function();
+
+	ksft_print_msg("Waiting for child %d\n", pid);
+
+	ret = waitpid(pid, &status, 0);
+	if (ret == -1) {
+		ksft_print_msg("Failed to wait for child: %d\n",
+			       errno);
+		return false;
+	}
+
+	if (!WIFEXITED(status)) {
+		ksft_print_msg("Child exited due to signal %d\n",
+			       WTERMSIG(status));
+		pass = false;
+	} else if (WEXITSTATUS(status)) {
+		ksft_print_msg("Child exited with status %d\n",
+			       WEXITSTATUS(status));
+		pass = false;
+	}
+
+out:
+
+	return pass;
+}
+
 typedef bool (*gcs_test)(void);
 
 static struct {
@@ -314,6 +376,7 @@ static struct {
 	{ "enable_invalid", enable_invalid, true },
 	{ "map_guarded_stack", map_guarded_stack },
 	{ "fork", test_fork },
+	{ "vfork", test_vfork },
 };
 
 int main(void)

-- 
2.39.5


