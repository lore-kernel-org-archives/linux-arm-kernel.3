Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4659FD49793
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 01:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGcRzCrfNcjXr071QAMUMfztbHofCETxSPS/uaj2zh8=; b=u8eiwc3UyiIF/USdnMx/lpJn9u
	Mo/GHgSN6jLHC7riyv1ku0EyYMZVohVz91qXHdxroy7s4K6/d8SbpzaFtA/5Xpau0ry8HMgZv4/0D
	GCJjfnPT5Bnm0E2FV0vD+g/ecUDtYKP6ryE4biwYVPa3qr+VgEvbZqam4H5C/8UuSVrjZbV2SLcZz
	X5MVQ3TsEcuYRVTgEIoYHhwvHDQiG/gsCm79JnG7aRmrLxrcjpQxwHiiXzrpPqm1isFoY7wUPC2Nw
	kupl6AgQMS9ZK8ZlIkfqKKiQvDN/WDCpLiVX1q8u++fv63Ci898AXksyiZEWK1H3kl6IsKn29568P
	UDAAbGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvCo-00000004iRx-3JpH;
	Mon, 02 Dec 2024 01:26:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHuwW-00000004dmc-2rGf;
	Mon, 02 Dec 2024 01:09:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CEFFA4014C;
	Mon,  2 Dec 2024 01:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC18C4CEDA;
	Mon,  2 Dec 2024 01:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101779;
	bh=AmpykIxi5EHXCZZNUOYjzbitPtJlUSmwFTjzmFllNZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K40uJjgdaSpQxJxjTf1Ty3dtyvE9ghcp5WA0mrzPbzI6dBtelzWFq9m4kTVTYkEag
	 xqooP0n960OKVJDDNkhqcGKf1xSdwtx00AQvQi52CEOi+76exklxSjT1zIRyDRjMJ4
	 xdUQnYKFZVqTy00scmIUmlzD+nPxKFubjD/a4OOTm9bes7qEpV0ZJ4CcMc2g0rP6cL
	 ECr4tXwMcfuVHDeCV6ovAJOS46oKpbfiaTBiYXB48bjz6cVSmv5F1NwDDZ8nauGonF
	 6F90chiPDbnnhkW4zXZ2u/Wv5VBpn+2C4fXtZz/Ks+5ZYfx51AN/JYUQkXlqM/9gRn
	 G5+jBDjogLuSw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v4 18/19] f2fs: switch to using the crc32 library
Date: Sun,  1 Dec 2024 17:08:43 -0800
Message-ID: <20241202010844.144356-19-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_170940_899200_080C19DA 
X-CRM114-Status: GOOD (  15.90  )
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

From: Eric Biggers <ebiggers@google.com>

Now that the crc32() library function takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Chao Yu <chao@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/Kconfig |  3 +--
 fs/f2fs/f2fs.h  | 20 +-------------------
 fs/f2fs/super.c | 15 ---------------
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 68a1e23e1557..5916a02fb46d 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -2,12 +2,11 @@
 config F2FS_FS
 	tristate "F2FS filesystem support"
 	depends on BLOCK
 	select BUFFER_HEAD
 	select NLS
-	select CRYPTO
-	select CRYPTO_CRC32
+	select CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
 	select FS_IOMAP
 	select LZ4_COMPRESS if F2FS_FS_LZ4
 	select LZ4_DECOMPRESS if F2FS_FS_LZ4
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6f2cbf4c5740..fd7e9cb6f893 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -22,11 +22,10 @@
 #include <linux/bio.h>
 #include <linux/blkdev.h>
 #include <linux/quotaops.h>
 #include <linux/part_stat.h>
 #include <linux/rw_hint.h>
-#include <crypto/hash.h>
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
 
 struct pagevec;
@@ -1766,13 +1765,10 @@ struct f2fs_sb_info {
 
 	/* For write statistics */
 	u64 sectors_written_start;
 	u64 kbytes_written;
 
-	/* Reference to checksum algorithm driver via cryptoapi */
-	struct crypto_shash *s_chksum_driver;
-
 	/* Precomputed FS UUID checksum for seeding other checksums */
 	__u32 s_chksum_seed;
 
 	struct workqueue_struct *post_read_wq;	/* post read workqueue */
 
@@ -1946,25 +1942,11 @@ static inline unsigned int f2fs_time_to_wait(struct f2fs_sb_info *sbi,
  * Inline functions
  */
 static inline u32 __f2fs_crc32(struct f2fs_sb_info *sbi, u32 crc,
 			      const void *address, unsigned int length)
 {
-	struct {
-		struct shash_desc shash;
-		char ctx[4];
-	} desc;
-	int err;
-
-	BUG_ON(crypto_shash_descsize(sbi->s_chksum_driver) != sizeof(desc.ctx));
-
-	desc.shash.tfm = sbi->s_chksum_driver;
-	*(u32 *)desc.ctx = crc;
-
-	err = crypto_shash_update(&desc.shash, address, length);
-	BUG_ON(err);
-
-	return *(u32 *)desc.ctx;
+	return crc32(crc, address, length);
 }
 
 static inline u32 f2fs_crc32(struct f2fs_sb_info *sbi, const void *address,
 			   unsigned int length)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fc7d463dee15..19b67828ae32 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1692,12 +1692,10 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_destroy_post_read_wq(sbi);
 
 	kvfree(sbi->ckpt);
 
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->raw_super);
 
 	f2fs_destroy_page_array_cache(sbi);
 	f2fs_destroy_xattr_caches(sbi);
 #ifdef CONFIG_QUOTA
@@ -4464,19 +4462,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		INIT_LIST_HEAD(&sbi->inode_list[i]);
 		spin_lock_init(&sbi->inode_lock[i]);
 	}
 	mutex_init(&sbi->flush_lock);
 
-	/* Load the checksum driver */
-	sbi->s_chksum_driver = crypto_alloc_shash("crc32", 0, 0);
-	if (IS_ERR(sbi->s_chksum_driver)) {
-		f2fs_err(sbi, "Cannot load crc32 driver.");
-		err = PTR_ERR(sbi->s_chksum_driver);
-		sbi->s_chksum_driver = NULL;
-		goto free_sbi;
-	}
-
 	/* set a block size */
 	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
 		f2fs_err(sbi, "unable to set blocksize");
 		goto free_sbi;
 	}
@@ -4917,12 +4906,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	kvfree(options);
 free_sb_buf:
 	kfree(raw_super);
 free_sbi:
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi);
 	sb->s_fs_info = NULL;
 
 	/* give only one another chance */
 	if (retry_cnt > 0 && skip_recovery) {
@@ -5125,7 +5112,5 @@ module_init(init_f2fs_fs)
 module_exit(exit_f2fs_fs)
 
 MODULE_AUTHOR("Samsung Electronics's Praesto Team");
 MODULE_DESCRIPTION("Flash Friendly File System");
 MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32");
-
-- 
2.47.1


