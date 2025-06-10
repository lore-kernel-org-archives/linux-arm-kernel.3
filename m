Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45365C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7CmLrHqqPXpvmufEPDvidSDPu00O49a9HnXN+BcMrM=; b=E3Hk+wycgtYQW9Ql7tVEvKIrry
	zSpUtFUb1y0PqOKZE/SYIaP0Ez/D4X7v3nXYGUpczBAUoKykuvzNE1XhYQEr3EXaHRD67eoT2+4Xp
	M6dSf4N7gJtQcF8J8OgAmYEX8QCQ7MPj494DuteYk8wpq7D9tdTwAcVMc0DFiXZTLmeIgrXRlpKEU
	7SKCSY4d8qst5WyOOyY9Pp5XtjF01wwbAd7LQ3G3TR446WfAXyS7hbZfIBbTh9WzBSLRAC8uqkjfl
	9quLWhcL5N3vnraR3OM9cEOFfPuSeBEDxyyPlT5zRMVXWeVRvlBNKkMCBUyEItoU6+X+COOxxrxLl
	aAwIelXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0Nu-00000007Bv7-1VfW;
	Tue, 10 Jun 2025 14:55:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyJG-00000006oK4-44Zo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B34D25C4B7B;
	Tue, 10 Jun 2025 12:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCB9C4CEED;
	Tue, 10 Jun 2025 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749559354;
	bh=J6AFLpxqvQUWE4ch4VBYYdyyIA1JHulBUl77i0XMQXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NRkuzvM1VuWrjni1jIHamlCP5Bf1frhkd/OQ6upItw68wDuIDQ1w3JYAKfbPY1Sel
	 H5fw+qaJ6BDT3n2lXXAAxygtCxT6mJBewqs0LfJhbg0liyACN1ArVO1sqhIUoP4srk
	 Sr9bAd64TUSiT441BkLsLPAQbKzvz8GVl8ATS2d9ZiV0PVC6bX4ddtl8GQ7/OIwuNL
	 VJdq0ggAuB9KpbiTPog1ER1NI4nHonjdr2vkoViqzSWM2f0qzyRE2fOJRwGWGtlCip
	 nNuxSAZZ1A5LNrfl9qVcDSlHNWjc4ax4O2s2vdzysJDPhGZanrVgCL2x49ZOre1E6z
	 K5uRdO1yCKOfA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Jun 2025 13:29:45 +0100
Subject: [PATCH v2 2/4] tools/nolibc: Provide vfork()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-arm64-gcs-vfork-exit-v2-2-929443dfcf82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=broonie@kernel.org;
 h=from:subject:message-id; bh=J6AFLpxqvQUWE4ch4VBYYdyyIA1JHulBUl77i0XMQXw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoSCgvukmbaMjh17UgVr99O7M6G30oiXXdn4BKoDV/
 rkfEdzyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEgoLwAKCRAk1otyXVSH0KMuB/
 4wSoNjdhT70WakS3tv5X9iBatU6hPJ1jqe4SqsQejll0GFhY4EP6j92MKruox3yVgGp1es9BfWiK7k
 pHdfUp4iCpcVTo1xaJBB1kS47mnEoMvOYLFccmH9Ka8i+j2G+FpSqtaD/xhQL34NNbtCk84Js59oAY
 cF6v4jl1b6CYWsDFpwxBYvZ3Mv4rVE9ZOfGch/2tA/dnmeIopWbEBZeBciROMX312SXGh0+3A1CCsU
 2unwKDDBDqYbC62Cj+arSFXSG9p4cN3HD596UwoRvcOk8ocu/PHCgN3/5trKu3VQfR5t8IigKQc6up
 RP53ygLYtS+Kxmxi1rrN9y5tMeVTap
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_054235_054900_C7B5E941 
X-CRM114-Status: GOOD (  11.53  )
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

To allow testing of vfork() support in the arm64 basic-gcs test provide an
implementation for nolibc, using the vfork() syscall if one is available
and otherwise clone3(). We implement in terms of clone3() since the order
of the arguments for clone() varies between architectures.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/include/nolibc/sys.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index aabac97a7fb0..5932ae8828a1 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -22,6 +22,7 @@
 #include <linux/time.h>
 #include <linux/auxvec.h>
 #include <linux/fcntl.h> /* for O_* and AT_* */
+#include <linux/sched.h> /* for clone_args */
 #include <linux/stat.h>  /* for statx() */
 
 #include "errno.h"
@@ -340,6 +341,32 @@ pid_t fork(void)
 	return __sysret(sys_fork());
 }
 
+static __attribute__((unused))
+pid_t sys_vfork(void)
+{
+#if defined(__NR_vfork)
+	return my_syscall0(__NR_vfork);
+#elif defined(__NR_clone3)
+	/*
+	 * clone() could be used but has different argument orders per
+	 * architecture.
+	 */
+	struct clone_args args = {
+		.flags		= CLONE_VM | CLONE_VFORK,
+		.exit_signal	= SIGCHLD,
+	};
+
+	return my_syscall2(__NR_clone3, &args, sizeof(args));
+#else
+	return __nolibc_enosys(__func__);
+#endif
+}
+
+static __attribute__((unused))
+pid_t vfork(void)
+{
+	return __sysret(sys_vfork());
+}
 
 /*
  * int fsync(int fd);

-- 
2.39.5


