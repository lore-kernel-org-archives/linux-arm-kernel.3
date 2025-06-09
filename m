Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28935C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZy1LBUE7cMKSLHVyRKucFVQY7ySRoMHlL6KSdeLZxM=; b=Rd+cjwjVcQfkekVg2Ym8RTy21p
	rdUgx/KqgyHAzAOpxkmm9rxhPj4lEq2L7vBJr0iWUZw2m8DcH1p16qgiZJ4tnSl/QjH0OS2hrn/Y/
	dkHTfxDAEqoQcUMXG0pqQEHkaEM22X0XWPlCaydas1Ne1uovWsqSippt5AVJLP5JOnPBMMEqiH1MK
	knyo+ixplZgeaRSYcUrPJgnh8Ch25eTpiK+tlqyGAaSqHgxFuSz1SD/twBL3O2jxdU2aSjTwafwTK
	2F7x8ZTHthlalHfu/rjMn4JXAggvOY+G/izdkU4BRxq/U7rn996WAAlM3fLrnpxZUJVT/3/49HJju
	Qaya45+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOec0-00000004Y2l-0j8O;
	Mon, 09 Jun 2025 15:40:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOe7i-00000004THg-021B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:09:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FF80615F2;
	Mon,  9 Jun 2025 15:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210EBC4CEF2;
	Mon,  9 Jun 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481757;
	bh=TY+j0nASxQk+1sb6wh0CAFNql3zjYmvVHlihYQ3nANk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WEEGMSxcriWMZdMRX5sY7W2SeZDEV4HOLUSLaaX3nbYMuzRkO/6+33lJQ7wrlXsUg
	 4DkqFFDJqvJAUZ9IUzHOCvdz5M7ye/ESMEgDweR7rRjgTomIxhYW4yZ0tw3yGtvUUi
	 o45ESOPAGmG/bvvsX4B32oSD35I0NEjbqFzdVf2KpKg1B+40xys+lEAasqIqPksdIG
	 +uw9vPqa4KEQSL6KQhi8NpqF+WFd3vdNeKHsQAZiaQ6WqSw99COnrWO1ZzlW0kwJY3
	 Gli2kpn5BZJqN27ht4bC+Vko/AvkOjLbOv+G6YHZpvcelYOaI5Ebl20OVEb3QeapdH
	 qtaG8S/qik7dA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Jun 2025 16:08:56 +0100
Subject: [PATCH 1/2] tools/nolibc: Provide vfork()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-arm64-gcs-vfork-exit-v1-1-baad0f085747@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TY+j0nASxQk+1sb6wh0CAFNql3zjYmvVHlihYQ3nANk=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhgy3n+KPmcPYt7v1C98WrBN3+bhY6wKbyJ2e4BxeIVHBOT79
 bbc7GY1ZGBi5GGTFFFnWPstYlR4usXX+o/mvYAaxMoFMYeDiFICJNLtyMDRXe065871XPmcPl9cpdc
 fE54Z9P9MfNNqZbm0/sUDmlYie6s94/ayF8brtBqzH+52WRnvsruyTKbnb7T+t58g9C9PeZI7+CbN+
 lB3YFtl47tElRc6XJh/v/1wVtXDd+k+Vds5XFn1IymLtdNyiuq3T8McpjX2XlJlubll0q3rR6xX6m6
 9NnenAsTvvlX2z9FmjiG+btW32iLzpni1T2yg3J9Fv8mrXr26tC15PNb3bP8VtT91b79y7LVGhvyeu
 qC1J16njVHz9mn+ioifrDe0nmr9bQ/niXm6+7BsazX7/irqudnW+vmu8S2KIIc8iPQsH6XPJ5YZRnp
 nWZzKXqC+Z9c5L80vAqxmuzW7ZAA==
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/include/nolibc/sys.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 9556c69a6ae1..e056da010f64 100644
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
+#ifdef __NR_vfork
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


