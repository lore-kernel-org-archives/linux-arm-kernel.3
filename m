Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC457FC72C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4orJb2U7jo77rJOM/60B2idHYzibFtexOIXEJjzLmY=; b=jxARhGpAFGlFEetrvchrQ85eZC
	t8rQny7FQ/Y9cvSpu5xp7Tvvb9UAcMZLaHWJMn8A2gwT38VR0y8V13hF4zfSlMgi1tGThckmGWkYH
	otaZsbbkraykL90Hr+bI6jTXvVzNsBqsN2dB63uGzwSuLj82fXowtHHjimnnVtdKG98RXco4N0JDn
	/q25Agr5JGCAr6rcvENG99xopJ58LhlFNf42ijRg+w65U/gVgxxmc6r3Rgt8nWJnjdwpC1DxGEMH2
	AVOS1CJL1kJw+NLMRutcW1lRgPXfRuvp6PjCkLm4NwNX62gW2G+yyJtDEo2GRFfVT0i9EOhTeqdAA
	eg6ggjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZIu-0000000G9lF-2agJ;
	Mon, 23 Mar 2026 07:02:24 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZIt-0000000G9jb-03ST;
	Mon, 23 Mar 2026 07:02:23 +0000
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
Subject: [PATCH 2/3] fs: pass on FTRUNCATE_* flags to do_truncate
Date: Mon, 23 Mar 2026 08:01:45 +0100
Message-ID: <20260323070205.2939118-3-hch@lst.de>
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

Pass the flags one level down to replace the somewhat confusing small
argument, and clean up do_truncate as a result.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/internal.h       |  2 +-
 fs/open.c           | 22 ++++++++++------------
 io_uring/truncate.c |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index 2663823e273a..52e4c354e7a4 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -198,7 +198,7 @@ extern struct open_how build_open_how(int flags, umode_t mode);
 extern int build_open_flags(const struct open_how *how, struct open_flags *op);
 struct file *file_close_fd_locked(struct files_struct *files, unsigned fd);
 
-int do_ftruncate(struct file *file, loff_t length, int small);
+int do_ftruncate(struct file *file, loff_t length, unsigned int flags);
 int chmod_common(const struct path *path, umode_t mode);
 int do_fchownat(int dfd, const char __user *filename, uid_t user, gid_t group,
 		int flag);
diff --git a/fs/open.c b/fs/open.c
index 412d0d6fbaa7..181c1597e73c 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -161,23 +161,21 @@ COMPAT_SYSCALL_DEFINE2(truncate, const char __user *, path, compat_off_t, length
 }
 #endif
 
-int do_ftruncate(struct file *file, loff_t length, int small)
+int do_ftruncate(struct file *file, loff_t length, unsigned int flags)
 {
-	struct inode *inode;
-	struct dentry *dentry;
+	struct dentry *dentry = file->f_path.dentry;
+	struct inode *inode = dentry->d_inode;
 	int error;
 
-	/* explicitly opened as large or we are on 64-bit box */
-	if (file->f_flags & O_LARGEFILE)
-		small = 0;
-
-	dentry = file->f_path.dentry;
-	inode = dentry->d_inode;
 	if (!S_ISREG(inode->i_mode) || !(file->f_mode & FMODE_WRITE))
 		return -EINVAL;
 
-	/* Cannot ftruncate over 2^31 bytes without large file support */
-	if (small && length > MAX_NON_LFS)
+	/*
+	 * Cannot ftruncate over 2^31 bytes without large file support, either
+	 * through opening with O_LARGEFILE or by using ftruncate64().
+	 */
+	if (length > MAX_NON_LFS &&
+	    !(file->f_flags & O_LARGEFILE) && !(flags & FTRUNCATE_LFS))
 		return -EINVAL;
 
 	/* Check IS_APPEND on real upper inode */
@@ -205,7 +203,7 @@ int ksys_ftruncate(unsigned int fd, loff_t length, unsigned int flags)
 	if (fd_empty(f))
 		return -EBADF;
 
-	return do_ftruncate(fd_file(f), length, !(flags & FTRUNCATE_LFS));
+	return do_ftruncate(fd_file(f), length, flags);
 }
 
 SYSCALL_DEFINE2(ftruncate, unsigned int, fd, off_t, length)
diff --git a/io_uring/truncate.c b/io_uring/truncate.c
index 487baf23b44e..c88d8bd8d20e 100644
--- a/io_uring/truncate.c
+++ b/io_uring/truncate.c
@@ -41,7 +41,7 @@ int io_ftruncate(struct io_kiocb *req, unsigned int issue_flags)
 
 	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
 
-	ret = do_ftruncate(req->file, ft->len, 1);
+	ret = do_ftruncate(req->file, ft->len, 0);
 
 	io_req_set_res(req, ret, 0);
 	return IOU_COMPLETE;
-- 
2.47.3


