Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FA8FC72A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wlkrm0myB9P5DBDaclzihXCLak0GcKolkRDqx8ZruQ0=; b=zcgjT0VPKp9TwFW9Vo89aLf87t
	nirK45/jERBv4bCNM1xBSG5TtN+UwmLieNuNx7DOOO2qadY21GijhzHOYWyc0d6weabilownBOX5X
	YBZZXQT8OBhnAqVnCByYoiGmAV01s8OY6WWIUvuDAgDbg8MUaH85te0Jf7TrIIEDEMzSj0sjjfKs+
	eVfoQifTIBQg2CoVzn/f9Z74PZcvrDDdVKbEmKlV+8pERV/xm/6owVQRH9AAy1iuBYhJkoNd6v8hA
	1VXXFVSr8wq+C19H2FVdQhzxeZayAEfNBTvSAtEW1iSVgUF6XJY2QBsZVYVzgNmOsYygBTIf+ItuA
	ecMdEcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZJ0-0000000G9ng-48Rw;
	Mon, 23 Mar 2026 07:02:30 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZIz-0000000G9lB-1wml;
	Mon, 23 Mar 2026 07:02:30 +0000
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
Subject: [PATCH 3/3] fs: remove do_sys_truncate
Date: Mon, 23 Mar 2026 08:01:46 +0100
Message-ID: <20260323070205.2939118-4-hch@lst.de>
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

do_sys_truncate ist only used to implement ksys_truncate and the native
truncate syscalls.  Merge do_sys_truncate into ksys_truncate and return
int from it as it only returns 0 or negative errnos.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/open.c                | 8 ++++----
 include/linux/syscalls.h | 8 +-------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index 181c1597e73c..681d405bc61e 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -126,7 +126,7 @@ int vfs_truncate(const struct path *path, loff_t length)
 }
 EXPORT_SYMBOL_GPL(vfs_truncate);
 
-int do_sys_truncate(const char __user *pathname, loff_t length)
+int ksys_truncate(const char __user *pathname, loff_t length)
 {
 	unsigned int lookup_flags = LOOKUP_FOLLOW;
 	struct path path;
@@ -151,13 +151,13 @@ int do_sys_truncate(const char __user *pathname, loff_t length)
 
 SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
 {
-	return do_sys_truncate(path, length);
+	return ksys_truncate(path, length);
 }
 
 #ifdef CONFIG_COMPAT
 COMPAT_SYSCALL_DEFINE2(truncate, const char __user *, path, compat_off_t, length)
 {
-	return do_sys_truncate(path, length);
+	return ksys_truncate(path, length);
 }
 #endif
 
@@ -222,7 +222,7 @@ COMPAT_SYSCALL_DEFINE2(ftruncate, unsigned int, fd, compat_off_t, length)
 #if BITS_PER_LONG == 32
 SYSCALL_DEFINE2(truncate64, const char __user *, path, loff_t, length)
 {
-	return do_sys_truncate(path, length);
+	return ksys_truncate(path, length);
 }
 
 SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 8787b3511c86..f5639d5ac331 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1285,13 +1285,7 @@ static inline long ksys_lchown(const char __user *filename, uid_t user,
 
 #define FTRUNCATE_LFS	(1u << 0)	/* allow truncating > 32-bit */
 int ksys_ftruncate(unsigned int fd, loff_t length, unsigned int flags);
-
-int do_sys_truncate(const char __user *pathname, loff_t length);
-
-static inline long ksys_truncate(const char __user *pathname, loff_t length)
-{
-	return do_sys_truncate(pathname, length);
-}
+int ksys_truncate(const char __user *pathname, loff_t length);
 
 static inline unsigned int ksys_personality(unsigned int personality)
 {
-- 
2.47.3


