Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9710CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OVefYZJ+mYpd1O/90gopDK/aqX6I8fRe0Mappd85fo=; b=a6+z/8wW8W6rweS/t4ARiIxwgv
	ib30ffaQZ6Ge5IZTvfiYn+LfcJEXsg9zL63z1IZDAUIkPeHU3H1RXKuG9Stjb5FFZzp0I6GES2vve
	UUQC2asoCDQrmU0DGhCjWsWMLC1HwkDlGF6+6dyDPEg4yXZ1gq6semKg9b8GEdRyd3wbNfpXXyPMM
	SzvjAYbD20WXO8zNIFsCwIJlRnq4iv8HNUO7s9LZ+jHlaeFJi0CMm9JxJqGecfc3Rk4uP99W78Ve4
	wsuapx8de+B2bLCqqlmY0Mqk4m+Ti+Rn8a7TnN6gsIfRkzpRCh7kb0Gy4Rgot4AgqiZseIF8GeNcS
	VEiUcc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0K4B-00000007Wdv-0FME;
	Sun, 21 Sep 2025 13:25:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0K48-00000007Wcc-1TJI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 13:25:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A29644DC3;
	Sun, 21 Sep 2025 13:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029B7C4CEF0;
	Sun, 21 Sep 2025 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758461119;
	bh=FE4Staxl9+mwSZcKwcO0fto6nTUyhBcjpM/AKe7NNY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yc89g9/F/laADXDu6ZyJb9kVjEtwNioPYXSRgxQXgZdPXrB4bbnYsLysHu5P/TAnp
	 Kf1WdAGYFzTWs0JoLAxWrOL3griTN3JXT5sk/SK8n8Diuuwwkp/YTiogBod9aAwlDQ
	 sjZ0NLixO9nACX4MxgOLjbNxFSYOvT44EE8ZfHoS08+T3BYCnHvX2dD1qqR1hqQ826
	 7cqHkPMvmeJfMfgmT1gcUmWixe85nSmgHE043GkTbJkbTVJk2i1x2rAN8RBUfmc2cq
	 KWj1yheucpElKXGmqcA6i1NDumLxYwZXXYC7wPD/PHUL6dAYd2ESPV4dgMVCa2YZ1y
	 0eALsiHzHkV5Q==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 21 Sep 2025 14:21:36 +0100
Subject: [PATCH RFC 2/3] kselftest/arm64: Validate
 PR_SHADOW_STACK_EXIT_TOKEN in basic-gcs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-arm64-gcs-exit-token-v1-2-45cf64e648d5@kernel.org>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
In-Reply-To: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 Carlos O'Donell <codonell@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
 Szabolcs Nagy <nsz@port70.net>, Rich Felker <dalias@libc.org>, 
 libc-alpha@sourceware.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=4482; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FE4Staxl9+mwSZcKwcO0fto6nTUyhBcjpM/AKe7NNY8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoz/y0qv/Jyaej/JiKd4zy1N2rJ1bK2njRN45w9
 EPbCK0jLlWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaM/8tAAKCRAk1otyXVSH
 0KuRB/0bDm/ebdy8GZSxWh/fi1nPlICB1XII9YWAt+iA7wyVCD0CLW5vjcJPBAlk/BPRamycpdx
 1/QlWc2HK7SLE/sM87DFGj3EEJneinoMRX3J3IdlgyopEbv1JBrkDyhm1P3Rwo9vk7ZGcwG3+sb
 OMVM7iTx1aNXZe4/ODOfo4LJb4fV73L4LAblIqhiO/3BljLKG67blpfF1SzkSfLqGz1ZlG0r1f7
 CImcAMlZMzIXqCs1ADT/DegqlmLkWNGspPxK8hfy+F7rOJ3HCf5fl2ae97V/pxX7nmXkvTadfWO
 oyJ01dPgAhj2tIKe3nFNVx8Lrr71bNo3wDIqKekFGTMPEOZc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_062520_439585_B9B4BB43 
X-CRM114-Status: GOOD (  17.40  )
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

Add a simple test which validates that exit tokens can be written to the
GCS of exiting threads, in basic-gcs since this functionality is expected
to be used by libcs.

We should add further tests which validate the option being absent.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 121 ++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tools/testing/selftests/arm64/gcs/basic-gcs.c b/tools/testing/selftests/arm64/gcs/basic-gcs.c
index 54f9c888249d..5515a5425186 100644
--- a/tools/testing/selftests/arm64/gcs/basic-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/basic-gcs.c
@@ -360,6 +360,126 @@ static bool test_vfork(void)
 	return pass;
 }
 
+/* We can reuse a shadow stack with an exit token */
+static bool test_exit_token(void)
+{
+	struct clone_args clone_args;
+	int ret, status;
+	static bool pass = true; /* These will be used in the thread */
+	static uint64_t expected_cap;
+	static int elem;
+	static uint64_t *buf;
+
+	/* Ensure we've got exit tokens enabled here */
+	ret = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+			  PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_EXIT_TOKEN,
+			  0, 0, 0);
+	if (ret != 0)
+		ksft_exit_fail_msg("Failed to enable exit token: %d\n", ret);
+
+	buf = (void *)my_syscall3(__NR_map_shadow_stack, 0, page_size,
+				  SHADOW_STACK_SET_TOKEN);
+	if (buf == MAP_FAILED) {
+		ksft_print_msg("Failed to map %lu byte GCS: %d\n",
+			       page_size, errno);
+		return false;
+	}
+	ksft_print_msg("Mapped GCS at %p-%p\n", buf,
+		       (void *)((uint64_t)buf + page_size));
+
+	/* We should have a cap token */
+	elem = (page_size / sizeof(uint64_t)) - 1;
+	expected_cap = ((uint64_t)buf + page_size - 8);
+	expected_cap &= GCS_CAP_ADDR_MASK;
+	expected_cap |= GCS_CAP_VALID_TOKEN;
+	if (buf[elem] != expected_cap) {
+		ksft_print_msg("Cap entry is 0x%llx not 0x%llx\n",
+			       buf[elem], expected_cap);
+		pass = false;
+	}
+	ksft_print_msg("cap token is 0x%llx\n", buf[elem]);
+
+	memset(&clone_args, 0, sizeof(clone_args));
+	clone_args.exit_signal = SIGCHLD;
+	clone_args.flags = CLONE_VM;
+	clone_args.shstk_token = (uint64_t)&(buf[elem]);
+	clone_args.stack = (uint64_t)malloc(page_size);
+	clone_args.stack_size = page_size;
+
+	if (!clone_args.stack) {
+		ksft_print_msg("Failed to allocate stack\n");
+		pass = false;
+	}
+
+	/* Don't try to clone if we're failing, we might hang */
+	if (!pass)
+		goto out;
+
+	/* There is no wrapper for clone3() in nolibc (or glibc) */
+	ret = my_syscall2(__NR_clone3, &clone_args, sizeof(clone_args));
+	if (ret == -1) {
+		ksft_print_msg("clone3() failed: %d\n", errno);
+		pass = false;
+		goto out;
+	}
+
+	if (ret == 0) {
+		/* In the child, make sure the token is gone */
+		if (buf[elem]) {
+			ksft_print_msg("GCS token was not consumed: %llx\n",
+				       buf[elem]);
+			pass = false;
+		}
+
+		/* Make sure we're using the right stack */
+		if ((uint64_t)get_gcspr() != (uint64_t)&buf[elem + 1]) {
+			ksft_print_msg("Child GCSPR_EL0 is %llx not %llx\n",
+				       (uint64_t)get_gcspr(),
+				       (uint64_t)&buf[elem + 1]);
+			pass = false;
+		}
+
+		/* We want to exit with *exactly* the same GCS pointer */
+		my_syscall1(__NR_exit, 0);
+	}
+
+	ksft_print_msg("Waiting for child %d\n", ret);
+
+	ret = waitpid(ret, &status, 0);
+	if (ret == -1) {
+		ksft_print_msg("Failed to wait for child: %d\n",
+			       errno);
+		pass = false;
+		goto out;
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
+	/* The token should have been restored */
+	if (buf[elem] == expected_cap) {
+		ksft_print_msg("Cap entry restored\n");
+	} else {
+		ksft_print_msg("Cap entry is 0x%llx not 0x%llx\n",
+			       buf[elem], expected_cap);
+		pass = false;
+	}
+
+out:
+	free((void*)clone_args.stack);
+	munmap(buf, page_size);
+	return pass;
+}
+
 typedef bool (*gcs_test)(void);
 
 static struct {
@@ -377,6 +497,7 @@ static struct {
 	{ "map_guarded_stack", map_guarded_stack },
 	{ "fork", test_fork },
 	{ "vfork", test_vfork },
+	{ "exit_token", test_exit_token },
 };
 
 int main(void)

-- 
2.47.2


