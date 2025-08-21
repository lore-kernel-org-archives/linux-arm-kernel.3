Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B21CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1B6hP4qfkfYJqryxjHc/g747FJc9fRjrqjne99TWr8=; b=CKPluJhtj+hTgRXHgHQ7aW0S0Q
	2tHBebGcMbiB+WtMIgKFNUXRCTGUbK7GBu8BwBr1e5UzUE9F7PStAqr3ddXs/k7/97n3AInMls1PE
	r1vpv5M1QTzl0L0J3BZn6it8vKeD2V29l0bfIQSHkQmVvMVEG1L8YRYmK4xQf/R99JSUAW+lFFab3
	MQQ14ozDoXESlGHJVNBs4rEud7QDvI98gdIrQvKzM70Z4I6wfqVBzZBBM87WIOoO//H63ZuJzfP3v
	Yp9kNvxxHzi2whJ4IKlwbOfjg2FgnQdiUdhMc//+vq4z6e73Cjagf+OH3pfkULY/2yqEhCUcl2o4e
	QIr6vPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDul-00000000mr7-3LnQ;
	Thu, 21 Aug 2025 22:37:47 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7P3-0000000HQis-2pmq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755790835;
	bh=cRhDVTvfEJS8mHqyTcbC6i1+gbWq4cwR+iPLEEiWZ2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ji1Aj9Pa0KE62K23ADxtytlcMcvBm+5O2ouql4SWsL89MwWb4kYwh7AEW/+UVbqPD
	 Q+8kMooDZla8qO3e0gpR4gCvBbT1xdqiX0ZrvEw7G9e0rpqT+b8ZlEfIrXZvwPbOFz
	 QL/X8eTk33RbiTap9blAGyB2ToaDnk8+WDZ1NoNc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 Aug 2025 17:40:33 +0200
Subject: [PATCH 2/7] tools/nolibc: remove __nolibc_enosys() fallback from
 *at() functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-nolibc-enosys-v1-2-4b63f2caaa89@weissschuh.net>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
In-Reply-To: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755790835; l=3478;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=cRhDVTvfEJS8mHqyTcbC6i1+gbWq4cwR+iPLEEiWZ2Y=;
 b=kg0N2hbwZuFGUCxNsEe83kmS1G/QpIW6Z9QwM10aCuWItg7whQvOvP4R04xEL+woy3GaMyT2I
 320/IAtY4YxC2r0SeXKjaQ1xryDceFFE7HUX3FVZRoYhqIDp4cI9+5B
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084037_893760_13194FAB 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

All architectures have had one of the real functions available since
Linux 2.6.12. The additional fallback to __nolibc_enosys() is superfluous.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/sys.h | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 4e5389edda03a61e76ad0377213e8ef0a621d300..2b9c3bf697e74e80016606814fe21929512ca007 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -142,10 +142,8 @@ int sys_chmod(const char *path, mode_t mode)
 {
 #if defined(__NR_fchmodat)
 	return my_syscall4(__NR_fchmodat, AT_FDCWD, path, mode, 0);
-#elif defined(__NR_chmod)
-	return my_syscall2(__NR_chmod, path, mode);
 #else
-	return __nolibc_enosys(__func__, path, mode);
+	return my_syscall2(__NR_chmod, path, mode);
 #endif
 }
 
@@ -165,10 +163,8 @@ int sys_chown(const char *path, uid_t owner, gid_t group)
 {
 #if defined(__NR_fchownat)
 	return my_syscall5(__NR_fchownat, AT_FDCWD, path, owner, group, 0);
-#elif defined(__NR_chown)
-	return my_syscall3(__NR_chown, path, owner, group);
 #else
-	return __nolibc_enosys(__func__, path, owner, group);
+	return my_syscall3(__NR_chown, path, owner, group);
 #endif
 }
 
@@ -569,10 +565,8 @@ int sys_link(const char *old, const char *new)
 {
 #if defined(__NR_linkat)
 	return my_syscall5(__NR_linkat, AT_FDCWD, old, AT_FDCWD, new, 0);
-#elif defined(__NR_link)
-	return my_syscall2(__NR_link, old, new);
 #else
-	return __nolibc_enosys(__func__, old, new);
+	return my_syscall2(__NR_link, old, new);
 #endif
 }
 
@@ -640,10 +634,8 @@ int sys_mkdir(const char *path, mode_t mode)
 {
 #if defined(__NR_mkdirat)
 	return my_syscall3(__NR_mkdirat, AT_FDCWD, path, mode);
-#elif defined(__NR_mkdir)
-	return my_syscall2(__NR_mkdir, path, mode);
 #else
-	return __nolibc_enosys(__func__, path, mode);
+	return my_syscall2(__NR_mkdir, path, mode);
 #endif
 }
 
@@ -662,10 +654,8 @@ int sys_rmdir(const char *path)
 {
 #if defined(__NR_rmdir)
 	return my_syscall1(__NR_rmdir, path);
-#elif defined(__NR_unlinkat)
-	return my_syscall3(__NR_unlinkat, AT_FDCWD, path, AT_REMOVEDIR);
 #else
-	return __nolibc_enosys(__func__, path);
+	return my_syscall3(__NR_unlinkat, AT_FDCWD, path, AT_REMOVEDIR);
 #endif
 }
 
@@ -685,10 +675,8 @@ long sys_mknod(const char *path, mode_t mode, dev_t dev)
 {
 #if defined(__NR_mknodat)
 	return my_syscall4(__NR_mknodat, AT_FDCWD, path, mode, dev);
-#elif defined(__NR_mknod)
-	return my_syscall3(__NR_mknod, path, mode, dev);
 #else
-	return __nolibc_enosys(__func__, path, mode, dev);
+	return my_syscall3(__NR_mknod, path, mode, dev);
 #endif
 }
 
@@ -872,10 +860,8 @@ int sys_symlink(const char *old, const char *new)
 {
 #if defined(__NR_symlinkat)
 	return my_syscall3(__NR_symlinkat, old, AT_FDCWD, new);
-#elif defined(__NR_symlink)
-	return my_syscall2(__NR_symlink, old, new);
 #else
-	return __nolibc_enosys(__func__, old, new);
+	return my_syscall2(__NR_symlink, old, new);
 #endif
 }
 
@@ -929,10 +915,8 @@ int sys_unlink(const char *path)
 {
 #if defined(__NR_unlinkat)
 	return my_syscall3(__NR_unlinkat, AT_FDCWD, path, 0);
-#elif defined(__NR_unlink)
-	return my_syscall1(__NR_unlink, path);
 #else
-	return __nolibc_enosys(__func__, path);
+	return my_syscall1(__NR_unlink, path);
 #endif
 }
 

-- 
2.50.1


