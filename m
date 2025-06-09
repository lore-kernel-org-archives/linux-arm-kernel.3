Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F704C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/+YYw1QdOimztbDP99h5SYK6hgB/25bwj9hjarStIY=; b=drk4S3bweLBmWexXVOaQjiJcbb
	egN1FVeDjGYm2vT8IpEeVqZgvYxdvAtxJgHYLma6vt/W4rZDVtzlLfgFs/Hl38dcw94crLdI2omw6
	+DLckAdUzwSx4Y/O/zL2jHZeZWED6kJg/eyaDY+FONMJ1T0IfZw8rw1nK5XUQjdoFmsz49IdNxvUe
	fkf7JmNC2D1MDs/pYHyImQbKXjncDM6u4J3Bg9JwADNKUJeJyEzf2xJv3fd7CbUAJXqgJWNnB3FlD
	rzfr6xP9EG0LI5ZDNUZZy57gBDXrctXnrV26JMAOrhJlyg8/wE47EpDcDBYlmEDo7gq+/5GtYf/HE
	biwNSPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOee7-00000004YP6-3g3t;
	Mon, 09 Jun 2025 15:42:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOe7l-00000004TIU-1SjU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:09:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F377F5C4B9A;
	Mon,  9 Jun 2025 15:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C9CC4CEF4;
	Mon,  9 Jun 2025 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481760;
	bh=MPMWLRYngQawDoNsJTy1uY6kJqIuvjy1h24Z2RiXIbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ft5tJkvPS7ukE+Wcfnc0F38KrMNjffgd5Qm9gI3sgzkDVHCxFh6DCz7Ga54EHQwoz
	 Jq5c04j0aL2AOiosx9J/WHiXRefixsZEMOHluFHF0D4g4/X8jXjOeF/3MT9duf68tC
	 m40fBHYcqBbEmEHYvkIZQaNOMeQgm9qssjPvDRSjGQNXOZsxgDrkrCxV+LmG3v5YCA
	 HwQOqrzKEt2KZ/ovnbEhk1hyscJtpP/X6Dtw31IFJJWjjaMdXxDTiScP+SNMd+ZvyS
	 YDTx4dY+pSaVo8HuG+V2aIVAgljdKPrAana6pmHrPGofyaYPe/eCch+bSCMiKmqMA7
	 oIaKNeCVTv7pA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Jun 2025 16:08:57 +0100
Subject: [PATCH 2/2] kselftest/arm64: Add a test for vfork() with GCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-arm64-gcs-vfork-exit-v1-2-baad0f085747@kernel.org>
References: <20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org>
In-Reply-To: <20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org>
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
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoRvkXzSIfbjfkDSimtO0hgNVcbiQZs4A9etnx1xMt
 NTS6qGiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEb5FwAKCRAk1otyXVSH0LlSB/
 9TE6cSOmAwL1AOXdwzxS8NcDtUYZG3sWrHWfZUUR0N7N0Iwt0O3aeoKcd+aUr418H5bKCK4uZnr2mT
 he5r6p2UYir94VIL9Ojp5Rru/opwSRI14o2teiDcwQdeNSr3hvdJb9Exy1S792ZZFSndmWE9mGqYfp
 8Y9wL1Tf7jZaTd+HPT0+1lcgFlCI+mZCF0VuG/tyzaet5htmkYwsEXKivnZDMEqHV6e0c8dwwY2vv3
 A/q4ZIaFz1oPoUZW58eDri97UwlVMjTpHXuWLHLTT0des1JtvyEYthytRbhf8ZX7+CIu9phGaewAek
 zV60WycSnUAXA2avQoTXfAtaqOjjW0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_080921_486979_D33DFDF3 
X-CRM114-Status: GOOD (  17.52  )
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


