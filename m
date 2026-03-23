Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EDAD58CDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo+hJi6UycCRcr/98mKLuq4pm1gn//akJmcNAXefkcE=; b=DFEsGj5n2ShjmpW69Ih2kSdaR1
	vZ8/hQyaqNQwJn1BoaNaFVYSkqCwJAJy8M4+Rb8IWN6xpZ5zSMHy4/kVAFTreYB3w+Gif6tQ4WDhL
	ZG+BMcP5EmZ9H/z6U3K1YggxwjPGK+QhD9WG3GqnrzGRysoYC8FlzSw2h3G0s25RZsKaNnHDDPuRC
	GvWnWnyYzsp/+l90X8XqlNJbCDuh8k2Qq2DYa7J6SxAktmqxWJn7XQmPI00bYoE+LDe6+XkEndfhq
	Cd9X0x/K5Yw/a9AAygkRRj+J9TvOsAVYWCybNUMLdlYbR0/mKmVfj6lMRkQtCHsxOoeu3zBQUH9xn
	IljyFurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZIp-0000000G9jl-1JOj;
	Mon, 23 Mar 2026 07:02:19 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZIn-0000000G9io-0IQy;
	Mon, 23 Mar 2026 07:02:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH 1/3] fs: fix archiecture-specific compat_ftruncate64
Date: Mon, 23 Mar 2026 08:01:44 +0100
Message-ID: <20260323070205.2939118-2-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323070205.2939118-1-hch@lst.de>
References: <20260323070205.2939118-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The "small" argument to do_sys_ftruncate indicates if > 32-bit size
should be reject, but all the arch-specific compat ftruncate64
implementations get this wrong.  Merge do_sys_ftruncate and
ksys_ftruncate, replace the integer as boolean small flag with a
descriptive one about LFS semantics, and use it correctly in the
architecture-specific ftruncate64 implementations.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 3dd681d944f6 ("arm64: 32-bit (compat) applications support")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/kernel/sys32.c       |  2 +-
 arch/mips/kernel/linux32.c      |  2 +-
 arch/parisc/kernel/sys_parisc.c |  4 ++--
 arch/powerpc/kernel/sys_ppc32.c |  2 +-
 arch/sparc/kernel/sys_sparc32.c |  2 +-
 arch/x86/kernel/sys_ia32.c      |  3 ++-
 fs/internal.h                   |  1 -
 fs/open.c                       | 12 ++++++------
 include/linux/syscalls.h        |  8 ++------
 9 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kernel/sys32.c b/arch/arm64/kernel/sys32.c
index 96bcfb907443..12a948f3a504 100644
--- a/arch/arm64/kernel/sys32.c
+++ b/arch/arm64/kernel/sys32.c
@@ -89,7 +89,7 @@ COMPAT_SYSCALL_DEFINE4(aarch32_truncate64, const char __user *, pathname,
 COMPAT_SYSCALL_DEFINE4(aarch32_ftruncate64, unsigned int, fd, u32, __pad,
 		       arg_u32p(length))
 {
-	return ksys_ftruncate(fd, arg_u64(length));
+	return ksys_ftruncate(fd, arg_u64(length), FTRUNCATE_LFS);
 }
 
 COMPAT_SYSCALL_DEFINE5(aarch32_readahead, int, fd, u32, __pad,
diff --git a/arch/mips/kernel/linux32.c b/arch/mips/kernel/linux32.c
index a0c0a7a654e9..fe9a787db569 100644
--- a/arch/mips/kernel/linux32.c
+++ b/arch/mips/kernel/linux32.c
@@ -60,7 +60,7 @@ SYSCALL_DEFINE4(32_truncate64, const char __user *, path,
 SYSCALL_DEFINE4(32_ftruncate64, unsigned long, fd, unsigned long, __dummy,
 	unsigned long, a2, unsigned long, a3)
 {
-	return ksys_ftruncate(fd, merge_64(a2, a3));
+	return ksys_ftruncate(fd, merge_64(a2, a3), FTRUNCATE_LFS);
 }
 
 SYSCALL_DEFINE5(32_llseek, unsigned int, fd, unsigned int, offset_high,
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index b2cdbb8a12b1..fcb0d8069139 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -216,7 +216,7 @@ asmlinkage long parisc_truncate64(const char __user * path,
 asmlinkage long parisc_ftruncate64(unsigned int fd,
 					unsigned int high, unsigned int low)
 {
-	return ksys_ftruncate(fd, (long)high << 32 | low);
+	return ksys_ftruncate(fd, (long)high << 32 | low, FTRUNCATE_LFS);
 }
 
 /* stubs for the benefit of the syscall_table since truncate64 and truncate 
@@ -227,7 +227,7 @@ asmlinkage long sys_truncate64(const char __user * path, unsigned long length)
 }
 asmlinkage long sys_ftruncate64(unsigned int fd, unsigned long length)
 {
-	return ksys_ftruncate(fd, length);
+	return ksys_ftruncate(fd, length, FTRUNCATE_LFS);
 }
 asmlinkage long sys_fcntl64(unsigned int fd, unsigned int cmd, unsigned long arg)
 {
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index d451a8229223..03fa487f2614 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -101,7 +101,7 @@ PPC32_SYSCALL_DEFINE4(ppc_ftruncate64,
 		       unsigned int, fd, u32, reg4,
 		       unsigned long, len1, unsigned long, len2)
 {
-	return ksys_ftruncate(fd, merge_64(len1, len2));
+	return ksys_ftruncate(fd, merge_64(len1, len2), FTRUNCATE_LFS);
 }
 
 PPC32_SYSCALL_DEFINE6(ppc32_fadvise64,
diff --git a/arch/sparc/kernel/sys_sparc32.c b/arch/sparc/kernel/sys_sparc32.c
index f84a02ab6bf9..04432b82b9e3 100644
--- a/arch/sparc/kernel/sys_sparc32.c
+++ b/arch/sparc/kernel/sys_sparc32.c
@@ -58,7 +58,7 @@ COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, path, u32, high, u32, lo
 
 COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd, u32, high, u32, low)
 {
-	return ksys_ftruncate(fd, ((u64)high << 32) | low);
+	return ksys_ftruncate(fd, ((u64)high << 32) | low, FTRUNCATE_LFS);
 }
 
 static int cp_compat_stat64(struct kstat *stat,
diff --git a/arch/x86/kernel/sys_ia32.c b/arch/x86/kernel/sys_ia32.c
index 6cf65397d225..610a1c2f4519 100644
--- a/arch/x86/kernel/sys_ia32.c
+++ b/arch/x86/kernel/sys_ia32.c
@@ -61,7 +61,8 @@ SYSCALL_DEFINE3(ia32_truncate64, const char __user *, filename,
 SYSCALL_DEFINE3(ia32_ftruncate64, unsigned int, fd,
 		unsigned long, offset_low, unsigned long, offset_high)
 {
-	return ksys_ftruncate(fd, ((loff_t) offset_high << 32) | offset_low);
+	return ksys_ftruncate(fd, ((loff_t) offset_high << 32) | offset_low,
+			FTRUNCATE_LFS);
 }
 
 /* warning: next two assume little endian */
diff --git a/fs/internal.h b/fs/internal.h
index cbc384a1aa09..2663823e273a 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -199,7 +199,6 @@ extern int build_open_flags(const struct open_how *how, struct open_flags *op);
 struct file *file_close_fd_locked(struct files_struct *files, unsigned fd);
 
 int do_ftruncate(struct file *file, loff_t length, int small);
-int do_sys_ftruncate(unsigned int fd, loff_t length, int small);
 int chmod_common(const struct path *path, umode_t mode);
 int do_fchownat(int dfd, const char __user *filename, uid_t user, gid_t group,
 		int flag);
diff --git a/fs/open.c b/fs/open.c
index 91f1139591ab..412d0d6fbaa7 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -197,7 +197,7 @@ int do_ftruncate(struct file *file, loff_t length, int small)
 				   ATTR_MTIME | ATTR_CTIME, file);
 }
 
-int do_sys_ftruncate(unsigned int fd, loff_t length, int small)
+int ksys_ftruncate(unsigned int fd, loff_t length, unsigned int flags)
 {
 	if (length < 0)
 		return -EINVAL;
@@ -205,18 +205,18 @@ int do_sys_ftruncate(unsigned int fd, loff_t length, int small)
 	if (fd_empty(f))
 		return -EBADF;
 
-	return do_ftruncate(fd_file(f), length, small);
+	return do_ftruncate(fd_file(f), length, !(flags & FTRUNCATE_LFS));
 }
 
 SYSCALL_DEFINE2(ftruncate, unsigned int, fd, off_t, length)
 {
-	return do_sys_ftruncate(fd, length, 1);
+	return ksys_ftruncate(fd, length, 0);
 }
 
 #ifdef CONFIG_COMPAT
 COMPAT_SYSCALL_DEFINE2(ftruncate, unsigned int, fd, compat_off_t, length)
 {
-	return do_sys_ftruncate(fd, length, 1);
+	return ksys_ftruncate(fd, length, 0);
 }
 #endif
 
@@ -229,7 +229,7 @@ SYSCALL_DEFINE2(truncate64, const char __user *, path, loff_t, length)
 
 SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
 {
-	return do_sys_ftruncate(fd, length, 0);
+	return ksys_ftruncate(fd, length, FTRUNCATE_LFS);
 }
 #endif /* BITS_PER_LONG == 32 */
 
@@ -245,7 +245,7 @@ COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, pathname,
 COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd,
 		       compat_arg_u64_dual(length))
 {
-	return ksys_ftruncate(fd, compat_arg_u64_glue(length));
+	return ksys_ftruncate(fd, compat_arg_u64_glue(length), FTRUNCATE_LFS);
 }
 #endif
 
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 02bd6ddb6278..8787b3511c86 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1283,12 +1283,8 @@ static inline long ksys_lchown(const char __user *filename, uid_t user,
 			     AT_SYMLINK_NOFOLLOW);
 }
 
-int do_sys_ftruncate(unsigned int fd, loff_t length, int small);
-
-static inline long ksys_ftruncate(unsigned int fd, loff_t length)
-{
-	return do_sys_ftruncate(fd, length, 1);
-}
+#define FTRUNCATE_LFS	(1u << 0)	/* allow truncating > 32-bit */
+int ksys_ftruncate(unsigned int fd, loff_t length, unsigned int flags);
 
 int do_sys_truncate(const char __user *pathname, loff_t length);
 
-- 
2.47.3


