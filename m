Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F66DC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRPNjfhrbsMUZndx2hp8tCgYSPOkDHttNgx1fK1PnE0=; b=20pj4lDOtg+b8oGNBYFNL5clWF
	MNZXLwiqRs34J2KdMbJdzTT2iKNeST2iKf6ijQ4bQCQ/VfdMiGrk/l8feD4tsKMARrDy+CH8gq2dG
	7qPuPxqR6I5TOIaDbTiRLcYvwlbTJMvihVih22Tr/pVwL0HXnWGYaKZtQ/MK1pJnUWrxqxfHGcpcK
	hwwGzuCv3qjBFW+Ql30VZvrqUQqvkXWfIwvbAWk64Ycr/8Zn0oYJjFBu8/AMn/1cQcTWGwlk2MQ3I
	ZN6tzjaJSIni9sCQlHlf0VOeRD/4FmPZ+02tiTR8gWKiNHAqkDv124hiGeL1DJl6bgy4OQYTzLG/W
	GPqYT3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR1h-0000000CWXu-02Zk;
	Thu, 03 Jul 2025 20:59:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMRv-0000000Bw8a-04WQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:06:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75ABD61151;
	Thu,  3 Jul 2025 16:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71082C4CEED;
	Thu,  3 Jul 2025 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558770;
	bh=6UL7PmSArRGjWy99kORj1lgNcSgJ/MyAd1s1wJFb20E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hZp9j/elDbkVRa1hPIlp8wyavHB5T58I9Eldyon7jhZQ3iyMpuq8SfOQxWXXKODb1
	 Qm72oenFg5EWLt4vjdB6Y5sk9XjJxbsmk+sLNgNCspis2cFXDNmQQvPp66tiXNVIp9
	 Sf1r8H/HXrCg2+qv9JBpSEi+WlUtWk+e3RfJT+/845Fw6+IXxRfGwSp59mObhHCaf5
	 4TzEGl/QgLykvyptFrM4+sXRVZnDLtp5Jli7ZRM28q3tmgnm+Pd17dYEpo8wkao3mW
	 fjUGNM9L4HEr+QyD+LkVH+cOwyF48II/7bu3Wh0ZvwziCe0o2PpPk1RggWz53xWaFH
	 5T2nFhEzuNiNg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 03 Jul 2025 17:00:15 +0100
Subject: [PATCH v3 1/4] tools/nolibc: Replace ifdef with if defined() in
 sys.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-arm64-gcs-vfork-exit-v3-1-1e9a9d2ddbbe@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5318; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6UL7PmSArRGjWy99kORj1lgNcSgJ/MyAd1s1wJFb20E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoZqpn4RKP1oQrJeLjT5BiI+auQ1fej5ipZov3Q
 Hav2GLNCg+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaGaqZwAKCRAk1otyXVSH
 0FKGB/wPv6hjzFqQvNiZk2ovk/THH6J+r+dQotin/1l82zGkMi1bzO+UubpLmzr6YTiImt45TqQ
 wjNZPSlJhmhgKFedGOo5xFuE2nhDA1UfnpBKa4aKxTKwVUmh/xdgP2PlHI4q7p7cFJsad0gyYt0
 +aizzgFEHtJ0QZvUotoFAAqsXw10cnIH6R+CrR4QYXronAsYuSgmpHei+tZv4ahF8LhiT8/yf3k
 VVvoNRiOUaOXSNx5NigHi9j87u/LdoKdIK4oVBKkzjNJjTjqWE71AYNS05AeY2+zZg2/iyBPESE
 w8qF2rtGCPySZvWkczZ9pScrTkak1Uzes3NCCyQA+aSwMX/y
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

Thomas has requested that if defined() be used in place of ifdef but
currently ifdef is used consistently in sys.h. Update all the instances of
ifdef to if defined().

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/include/nolibc/sys.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 9556c69a6ae1..aabac97a7fb0 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -139,7 +139,7 @@ int chdir(const char *path)
 static __attribute__((unused))
 int sys_chmod(const char *path, mode_t mode)
 {
-#ifdef __NR_fchmodat
+#if defined(__NR_fchmodat)
 	return my_syscall4(__NR_fchmodat, AT_FDCWD, path, mode, 0);
 #elif defined(__NR_chmod)
 	return my_syscall2(__NR_chmod, path, mode);
@@ -162,7 +162,7 @@ int chmod(const char *path, mode_t mode)
 static __attribute__((unused))
 int sys_chown(const char *path, uid_t owner, gid_t group)
 {
-#ifdef __NR_fchownat
+#if defined(__NR_fchownat)
 	return my_syscall5(__NR_fchownat, AT_FDCWD, path, owner, group, 0);
 #elif defined(__NR_chown)
 	return my_syscall3(__NR_chown, path, owner, group);
@@ -236,7 +236,7 @@ int dup(int fd)
 static __attribute__((unused))
 int sys_dup2(int old, int new)
 {
-#ifdef __NR_dup3
+#if defined(__NR_dup3)
 	return my_syscall3(__NR_dup3, old, new, 0);
 #elif defined(__NR_dup2)
 	return my_syscall2(__NR_dup2, old, new);
@@ -256,7 +256,7 @@ int dup2(int old, int new)
  * int dup3(int old, int new, int flags);
  */
 
-#ifdef __NR_dup3
+#if defined(__NR_dup3)
 static __attribute__((unused))
 int sys_dup3(int old, int new, int flags)
 {
@@ -320,7 +320,7 @@ void exit(int status)
 static __attribute__((unused))
 pid_t sys_fork(void)
 {
-#ifdef __NR_clone
+#if defined(__NR_clone)
 	/* note: some archs only have clone() and not fork(). Different archs
 	 * have a different API, but most archs have the flags on first arg and
 	 * will not use the rest with no other flag.
@@ -382,7 +382,7 @@ int getdents64(int fd, struct linux_dirent64 *dirp, int count)
 static __attribute__((unused))
 uid_t sys_geteuid(void)
 {
-#ifdef __NR_geteuid32
+#if defined(__NR_geteuid32)
 	return my_syscall0(__NR_geteuid32);
 #else
 	return my_syscall0(__NR_geteuid);
@@ -500,7 +500,7 @@ int getpagesize(void)
 static __attribute__((unused))
 uid_t sys_getuid(void)
 {
-#ifdef __NR_getuid32
+#if defined(__NR_getuid32)
 	return my_syscall0(__NR_getuid32);
 #else
 	return my_syscall0(__NR_getuid);
@@ -538,7 +538,7 @@ int kill(pid_t pid, int signal)
 static __attribute__((unused))
 int sys_link(const char *old, const char *new)
 {
-#ifdef __NR_linkat
+#if defined(__NR_linkat)
 	return my_syscall5(__NR_linkat, AT_FDCWD, old, AT_FDCWD, new, 0);
 #elif defined(__NR_link)
 	return my_syscall2(__NR_link, old, new);
@@ -561,7 +561,7 @@ int link(const char *old, const char *new)
 static __attribute__((unused))
 off_t sys_lseek(int fd, off_t offset, int whence)
 {
-#ifdef __NR_lseek
+#if defined(__NR_lseek)
 	return my_syscall3(__NR_lseek, fd, offset, whence);
 #else
 	return __nolibc_enosys(__func__, fd, offset, whence);
@@ -572,7 +572,7 @@ static __attribute__((unused))
 int sys_llseek(int fd, unsigned long offset_high, unsigned long offset_low,
 	       __kernel_loff_t *result, int whence)
 {
-#ifdef __NR_llseek
+#if defined(__NR_llseek)
 	return my_syscall5(__NR_llseek, fd, offset_high, offset_low, result, whence);
 #else
 	return __nolibc_enosys(__func__, fd, offset_high, offset_low, result, whence);
@@ -609,7 +609,7 @@ off_t lseek(int fd, off_t offset, int whence)
 static __attribute__((unused))
 int sys_mkdir(const char *path, mode_t mode)
 {
-#ifdef __NR_mkdirat
+#if defined(__NR_mkdirat)
 	return my_syscall3(__NR_mkdirat, AT_FDCWD, path, mode);
 #elif defined(__NR_mkdir)
 	return my_syscall2(__NR_mkdir, path, mode);
@@ -631,7 +631,7 @@ int mkdir(const char *path, mode_t mode)
 static __attribute__((unused))
 int sys_rmdir(const char *path)
 {
-#ifdef __NR_rmdir
+#if defined(__NR_rmdir)
 	return my_syscall1(__NR_rmdir, path);
 #elif defined(__NR_unlinkat)
 	return my_syscall3(__NR_unlinkat, AT_FDCWD, path, AT_REMOVEDIR);
@@ -654,7 +654,7 @@ int rmdir(const char *path)
 static __attribute__((unused))
 long sys_mknod(const char *path, mode_t mode, dev_t dev)
 {
-#ifdef __NR_mknodat
+#if defined(__NR_mknodat)
 	return my_syscall4(__NR_mknodat, AT_FDCWD, path, mode, dev);
 #elif defined(__NR_mknod)
 	return my_syscall3(__NR_mknod, path, mode, dev);
@@ -843,7 +843,7 @@ pid_t setsid(void)
 static __attribute__((unused))
 int sys_symlink(const char *old, const char *new)
 {
-#ifdef __NR_symlinkat
+#if defined(__NR_symlinkat)
 	return my_syscall3(__NR_symlinkat, old, AT_FDCWD, new);
 #elif defined(__NR_symlink)
 	return my_syscall2(__NR_symlink, old, new);
@@ -900,7 +900,7 @@ int umount2(const char *path, int flags)
 static __attribute__((unused))
 int sys_unlink(const char *path)
 {
-#ifdef __NR_unlinkat
+#if defined(__NR_unlinkat)
 	return my_syscall3(__NR_unlinkat, AT_FDCWD, path, 0);
 #elif defined(__NR_unlink)
 	return my_syscall1(__NR_unlink, path);

-- 
2.39.5


