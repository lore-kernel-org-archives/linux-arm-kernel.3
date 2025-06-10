Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEA8C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/+YYw1QdOimztbDP99h5SYK6hgB/25bwj9hjarStIY=; b=jTsLOS53djF4Na/sIOHrGx47WU
	WxDPas5JfMSvNP7yttjnv6YjLpP2wm0h3F1pg04pTkg6rzBK0VmrXX40HMQ9ZnVoMlQUoKsSo7MoW
	nENUbZ9Fwz9wnCA4Gtbw66c5ncU1YXvmQkYdd2ng+rLsPC7nKq6MJSy3Ztov4PtyAOiNBPHnXFTSG
	5G9IFpZUMgx8AVFKImfISomT34uIscU7uUoCVcm2NTivjDzH9dyl6ehjU02YzbT5QmQb0ISRRuCcF
	NYlW2+DIDiDaeT0/XZ1SSpHApQ85m5GF4xUuSgnmyFYPr3m/bpl1HJIc3yxScTYC7HtvsVAQjJj98
	SBa8Mamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0Q3-00000007CO3-0ar0;
	Tue, 10 Jun 2025 14:57:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyJJ-00000006oKq-0ovr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBC244A167;
	Tue, 10 Jun 2025 12:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A36C4CEF1;
	Tue, 10 Jun 2025 12:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749559356;
	bh=MPMWLRYngQawDoNsJTy1uY6kJqIuvjy1h24Z2RiXIbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=glBwew/xFmsZblnYcnNsAy1jYkxzM4R88S3WM282+ssBywad88KAcynoLh4nQ3jWW
	 sjFOzZ05tqVqeFn8u6wcWhzO75akYaC5rCA8skeJtwkpCUDEDJLDjVvujYHly8BhNN
	 JYlp6/sXfqObip4YtoTd/QX5sKb/iibdGgwxxJm3IbN344byyjdTDQ4diY6OD6R2Fx
	 03+RphiaJD2bJ6NxKIyUuKeTTSNmnHjysgOvsnI9gIeaTu7T+gAhjxdOXx0QdvZ/Fj
	 FFoAlFN8xy/hbtb0NlasKEkB2Xqb+65Albdyk97TCPtgHzbS9Pu/phLjGvwhmlmXVr
	 +naFK3qzQjxcw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Jun 2025 13:29:46 +0100
Subject: [PATCH v2 3/4] kselftest/arm64: Add a test for vfork() with GCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-arm64-gcs-vfork-exit-v2-3-929443dfcf82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2389; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MPMWLRYngQawDoNsJTy1uY6kJqIuvjy1h24Z2RiXIbc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoSCgwon8lvvXCpJn3/Mg5a+oD+zXp/XHAV9+svyua
 26OqNAmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEgoMAAKCRAk1otyXVSH0HZfB/
 45rn40YaQ0Kbg0ebFttFNnd4Er7dRx9zeFK/ZIcExaR3lUaClGkfta2V5Ols4VL47KPVN6YDU2emP6
 IPoSEUafk4vAFOmeWh4So43TxcJfML7IQ7avt5LHWdMRogKtZsW+6E43qFehbP1byBaQQvRdZwhi43
 s9gBHgi7AVqVpIk8UiFI71ONqtS57iVqTJzL7kEEjfvUR7Z6EpUgj6f1Wpu3nrn4fp6rwRF7Ja87d1
 3xwnFBFUXbA0WMTg96jZ6qUJ0bNDSf3FtkrpG9fl4HCXGIDcqEHeiWLPcJKWHlibyXw43YPACsInRY
 pUE7H+a3NHL9W//mX98HZ3a7H1KsXe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_054237_266398_D3DBAE82 
X-CRM114-Status: GOOD (  17.59  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 63 +++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tools/testing/selftests/arm64/gcs/basic-gcs.c b/tools/testing/selftests/arm64/gcs/basic-gcs.c
index 3fb9742342a3..96ea51cf7163 100644
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
+		/* In child, make sure we can call a function, read
+		 * the GCS pointer and status and then exit */
+		valid_gcs_function();
+		get_gcspr();
+
+		ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
+				  &child_mode, 0, 0, 0);
+		if (ret == 0 && !(child_mode & PR_SHADOW_STACK_ENABLE)) {
+			ksft_print_msg("GCS not enabled in child\n");
+			ret = -EINVAL;
+		}
+
+		exit(ret);
+	}
+
+	/*
+	 * In parent, check we can still do function calls then block
+	 * for the child.
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
+	} else {
+		if (WEXITSTATUS(status)) {
+			ksft_print_msg("Child exited with status %d\n",
+				       WEXITSTATUS(status));
+			pass = false;
+		}
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


