Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE11C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2n5GPoM+S1Y9eG2a1vR2ESEhyb13gnb5FcF3ixDPxs4=; b=awBfJV4arYSagCkyX8v3wFyO8q
	G4UkbudDrih+Xbx2X5z7WI2AZNetqc6KagXbxRdfs4j+1k9tFazO4j5J2ABLuweE1ewSy5IsgONkU
	UuUc+P6xGMFynVo3BsLo4LbHjtIcLRyKBeUA7GMNyCC5IOa5m59g0dvpHbuod6suONhxN5E+RcGTO
	aEeQF35RqcGmTI64R+XZGIjC9LySPEyK1geO2U/+rWoBjL2mmNsTumwWj16SDBz0qQ3EKpRqDhiEs
	s2403q9pJ9ElwTvUQN1xpQg8O1lnQ2QZ48zcI61SaEIVXPlsglg3F55eMlXJUpmvvXk+Mrf2Edg2G
	g7IDlQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1i-0000000CWZX-1Wfy;
	Thu, 03 Jul 2025 20:59:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMRx-0000000Bw9F-30U6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:06:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BFFC61446;
	Thu,  3 Jul 2025 16:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2497C4CEEE;
	Thu,  3 Jul 2025 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558772;
	bh=GxdG/hxlVXdujOXju8isvSn0cSnu8pfZPpii65s9OeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jZvLlvK4KtyF36UH0E1bZawCzUi8Kid1J3IPwZe3EV78RaxMJzahhqUyj+oUYffuL
	 YZQ1j/8GwbbDkc9kvjggLLsgteMKKbsAm0TAF8fa5H7UIWoaFFaZx7Xv7Nq69dYpp4
	 dWlS1ernWtbW8HigeLXYBKNTf8EccSbH+VO27hD2zm3k5lBe1ojTmYikmd1IDRirbO
	 saKBlkqRZfeMHpewSLxTKu3CrRzZaawr+lRPXyUSQVP7sj2ydkkGJZz23lv2TAPzF3
	 vjlKAEq5ohnsUcfXgos2/PqZPJvpY/FexOGY0yCx0BWwm8a+kBbTkNiquQZgtVYJEk
	 LSjFpNEJiXZUQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 03 Jul 2025 17:00:16 +0100
Subject: [PATCH v3 2/4] tools/nolibc: Provide vfork()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-arm64-gcs-vfork-exit-v3-2-1e9a9d2ddbbe@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GxdG/hxlVXdujOXju8isvSn0cSnu8pfZPpii65s9OeY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoZqpolC4QV+kVaH7lmRS7MVzRQG/lpBJvGQc3J
 i7h+RBSX8+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaGaqaAAKCRAk1otyXVSH
 0FrpB/9I3DAFv0+6RCslFfJA0deSaq6YBHh3AdbS42ZTfrykVfsGWq8ZpCb4ADUlEo8SDuYh0QV
 VWBJm88L7lT+dM/UD+uzXJ7WOZ15vGoYwe45Nb4MkJehqBNiau+VsCzZC43GKA48hmIRSfzGAmP
 wp4sYbvL7FQJcOm3pxsU+lQOto3b76hL0g4erR3nuyKsGcLu1lpIFuRUxO//RhMakGGCwGPq4bi
 4zg0LaTrDM8U46xqkIZdqy+IxfIVBqTAFetz7mjfwRzU41h1KWxAHPlKbG55nenb/BhBwiRbbPe
 KR14YnK3PQxkuokqahgRZpfvj4+iQxh8OLCnFtNjYK0aKixZ
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

To allow testing of vfork() support in the arm64 basic-gcs test provide an
implementation for nolibc, using the vfork() syscall if one is available
and otherwise clone3(). We implement in terms of clone3() since the order
of the arguments for clone() varies between architectures.

As for fork() SPARC returns the parent PID rather than 0 in the child
for vfork() so needs custom handling.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/include/nolibc/arch-sparc.h | 16 ++++++++++++++++
 tools/include/nolibc/sys.h        | 29 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/tools/include/nolibc/arch-sparc.h b/tools/include/nolibc/arch-sparc.h
index 1435172f3dfe..ca420d843e25 100644
--- a/tools/include/nolibc/arch-sparc.h
+++ b/tools/include/nolibc/arch-sparc.h
@@ -188,4 +188,20 @@ pid_t sys_fork(void)
 }
 #define sys_fork sys_fork
 
+static __attribute__((unused))
+pid_t sys_vfork(void)
+{
+	pid_t parent, ret;
+
+	parent = getpid();
+	ret = my_syscall0(__NR_vfork);
+
+	/* The syscall returns the parent pid in the child instead of 0 */
+	if (ret == parent)
+		return 0;
+	else
+		return ret;
+}
+#define sys_vfork sys_vfork
+
 #endif /* _NOLIBC_ARCH_SPARC_H */
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index aabac97a7fb0..295e71d34aba 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -22,6 +22,7 @@
 #include <linux/time.h>
 #include <linux/auxvec.h>
 #include <linux/fcntl.h> /* for O_* and AT_* */
+#include <linux/sched.h> /* for clone_args */
 #include <linux/stat.h>  /* for statx() */
 
 #include "errno.h"
@@ -340,6 +341,34 @@ pid_t fork(void)
 	return __sysret(sys_fork());
 }
 
+#ifndef sys_vfork
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
+#endif
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


