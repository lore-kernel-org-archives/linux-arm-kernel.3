Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12984CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3g8oYGX40AYmYUcZW6C/ZgPekT1b6dbjU/kRUtBhZTY=; b=TuVdKc5QbQH9W5J9Noq50rPpl8
	XBoIJfCGyUSv97THQI+yc4/PRshcOD/WUYl2FX8TkMTZLRx0uYSuFDQO2xfuUGE9lWWZYEg24o1bG
	nTzENLuihfSDQeqm1sz0KHl+IGN+Skx+UhEkpr9Fznxg0jPbvMApvzWcGi4+qwgh6ohVX0nSBFhv+
	6Yc6tubMUnEZDTvdEnrcfuTFUhsJjA1OQzw3JzvFgQiIKSCBJDNUx7ZUVjsC19kKiwlaymEJ31Tmq
	VpJcZkW/Q5rzjWq6ZfRy+c4xv8ye3abHh8ioZkigH3Oijr/+TwnuKPgd9VU0qSb/VMVccBI2/s0cN
	SU6YOxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultIL-0000000BfR6-2rZq;
	Tue, 12 Aug 2025 18:00:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulqCz-0000000B5h3-1jOc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 14:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D76565C6818;
	Tue, 12 Aug 2025 14:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FE7C4CEF0;
	Tue, 12 Aug 2025 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755009756;
	bh=ETLjRp9vig5Efxzz4KkC1MHH3nZ8dtIu3vn/zI9XXgM=;
	h=From:Date:Subject:To:Cc:From;
	b=jz6GdDjDIlbP1PK8+LRHxmZfpY/1xLYqiQao3PRoxLTVrAuv/4Fi4T3rY3dwwwC3e
	 bu7gCPbM1PAmFnDy43whWI2TLaAZQuewqNJ8s5ukLsP8zE05korj/QLDzNHyLmT7cA
	 Fm6yeivWzYL2NPHhXYH+hRA1mOknv1ravCjbnbh0MXChcCrTpuDHDrD3ciH/wiC1Ql
	 VgV0lygTnnklTdFS/5n0NdgPqM29QL7OUti4jo9ZuHc0TH80zBTbrrVAhKj+FwI8WW
	 NCvrdvKmQErzHCPny6zjICs5EdDtHn9x6lLd4/3Mjg76stO4bPCKs4+GxmqssC1rVg
	 2U2Mv+467B3Gw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 12 Aug 2025 15:37:00 +0100
Subject: [PATCH] kselftest/arm64: Log error codes in sve-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-arm64-fp-ptrace-perror-v1-1-7ce62d33709d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAItRm2gC/x3MPQqAMAxA4atIZgO1/nsVcag11QxqSUUE6d0tj
 t/w3guBhCnAkL0gdHPg80go8gzsZo6VkJdk0ErXqlMdGtmbCp1Hf4mxhJ5ETkFdqHluXV/a1kK
 KvZDj5x+PU4wf3GhpF2gAAAA=
X-Change-ID: 20250808-arm64-fp-ptrace-perror-210bb7f93c7c
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2712; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ETLjRp9vig5Efxzz4KkC1MHH3nZ8dtIu3vn/zI9XXgM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBom1LaJ2upA/Uof7Z6d84nh9kx7p1YYlXKHscrv
 iC4NrTG1FeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaJtS2gAKCRAk1otyXVSH
 0APcB/wIoS/byN8bBx9jFgGH5oBOuTnhPMPMHSeiHSWXMPQQcczrKVeakRJrDvPo3wqLFzaxvOn
 XQOWArDyXhF4vwGp17dxTpTnMIao1freeft1YX2LDL8zMbeAglOKoS9m3yVzzXVPyKfOzXiWkyI
 QPBVBezeoA8aKggBXa++YTxbGLHJOzEI97NhMBcLI92sNf22w4z1kYcZNPXqNXc4VrdlBXJXmet
 yU5BvhSbzY05tJC5f4fNfzcJPEt+OAQjZT3V60dZe98Vjg7mkSypYaGBmpIbEJG7TtsnyzdnVPM
 acLN9g1xsRaV0X1t33dq68eu/hM4oG90ptxIKIsM8hBGvbu7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_074237_537108_48B525A9 
X-CRM114-Status: GOOD (  12.47  )
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

Use ksft_perror() to report error codes from failing ptrace operations to
make it easier to interpret logs when things go wrong.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index b22303778fb0..4cba3bcff660 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -95,19 +95,27 @@ static int do_child(void)
 static int get_fpsimd(pid_t pid, struct user_fpsimd_state *fpsimd)
 {
 	struct iovec iov;
+	int ret;
 
 	iov.iov_base = fpsimd;
 	iov.iov_len = sizeof(*fpsimd);
-	return ptrace(PTRACE_GETREGSET, pid, NT_PRFPREG, &iov);
+	ret = ptrace(PTRACE_GETREGSET, pid, NT_PRFPREG, &iov);
+	if (ret == -1)
+		ksft_perror("ptrace(PTRACE_GETREGSET)");
+	return ret;
 }
 
 static int set_fpsimd(pid_t pid, struct user_fpsimd_state *fpsimd)
 {
 	struct iovec iov;
+	int ret;
 
 	iov.iov_base = fpsimd;
 	iov.iov_len = sizeof(*fpsimd);
-	return ptrace(PTRACE_SETREGSET, pid, NT_PRFPREG, &iov);
+	ret = ptrace(PTRACE_SETREGSET, pid, NT_PRFPREG, &iov);
+	if (ret == -1)
+		ksft_perror("ptrace(PTRACE_SETREGSET)");
+	return ret;
 }
 
 static struct user_sve_header *get_sve(pid_t pid, const struct vec_type *type,
@@ -117,6 +125,7 @@ static struct user_sve_header *get_sve(pid_t pid, const struct vec_type *type,
 	void *p;
 	size_t sz = sizeof *sve;
 	struct iovec iov;
+	int ret;
 
 	while (1) {
 		if (*size < sz) {
@@ -132,8 +141,11 @@ static struct user_sve_header *get_sve(pid_t pid, const struct vec_type *type,
 
 		iov.iov_base = *buf;
 		iov.iov_len = sz;
-		if (ptrace(PTRACE_GETREGSET, pid, type->regset, &iov))
+		ret = ptrace(PTRACE_GETREGSET, pid, type->regset, &iov);
+		if (ret) {
+			ksft_perror("ptrace(PTRACE_GETREGSET)");
 			goto error;
+		}
 
 		sve = *buf;
 		if (sve->size <= sz)
@@ -152,10 +164,14 @@ static int set_sve(pid_t pid, const struct vec_type *type,
 		   const struct user_sve_header *sve)
 {
 	struct iovec iov;
+	int ret;
 
 	iov.iov_base = (void *)sve;
 	iov.iov_len = sve->size;
-	return ptrace(PTRACE_SETREGSET, pid, type->regset, &iov);
+	ret = ptrace(PTRACE_SETREGSET, pid, type->regset, &iov);
+	if (ret == -1)
+		ksft_perror("ptrace(PTRACE_SETREGSET)");
+	return ret;
 }
 
 /* Validate setting and getting the inherit flag */

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250808-arm64-fp-ptrace-perror-210bb7f93c7c

Best regards,
--  
Mark Brown <broonie@kernel.org>


