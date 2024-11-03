Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9355D11197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 23:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRcBZoCQqGyQ0W5yMS5aiWl2KEVthf2kKul/c6sg/D0=; b=sZOqxszDWuawRb5hv0NRsqKeLM
	WKZW4K91UFFMixwSXLDvfjW8aDFibWgCD2ZCQM87tL2XwN8hndkm7LUi6NTB7jSMz4xcEhlL4J3xo
	T54a0DKGMlNKDiyUIrd91h/LLNl60y+tkC4uemr7CxMf7/WfZ6qq4MIdKDEA0pv/hi/qL/DKwNE1M
	/wMnUUTZExfv9XN4m77D2XIdXR5x+ukJ7f7QkwDTg/cZNgp0IsfF+O8FstkslM9xPZ+i5tjJttkLN
	Kwaf6W5Yu6TQyjw60Uocn+pejYUAJPWE1eiSYIjQBU8VwM1n5NCOZEiwRL5Pjhkl/+olcrxlayyPq
	L/+BpkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7jdR-0000000CDfA-0bDy;
	Sun, 03 Nov 2024 23:03:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7j9R-0000000C8WX-3ZMb;
	Sun, 03 Nov 2024 22:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KRcBZoCQqGyQ0W5yMS5aiWl2KEVthf2kKul/c6sg/D0=; b=Fin1pQq5Hq0AuN7IFjhesWsX4i
	c5eK3Wp9AbAaSH40RI4fUQQ/j4PinbrSuBRP0ZhxE3CmRDDPMCJXj/Pt3tc5wCpHFBD04+vbqUQqs
	/KT6lToNQ1sWnazJtJWJ2YPa06N/IHkR9mgnnsMgShh9yZ0spfcrhbiO/Uov79m2Wi73oLK/Kd8VK
	3eXntnl6iR9ptGFdWO2sZOsKfRJRo2sB46PsgdaWrrUvg4pwYX2wEVlV0ZNI5ZuUmfwAkPoMyeE+x
	IQZ7GnKDkl3jSRS+ckX3/eyJj1isk4OGHV+To/s/TaqFSZeHG1MJ4Zcis9oZ5KO44pLSAlmfAKXrx
	QF8jlDfQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7j9N-00000000WBb-2J5b;
	Sun, 03 Nov 2024 22:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5970CA41F20;
	Sun,  3 Nov 2024 22:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD84C4CED4;
	Sun,  3 Nov 2024 22:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730673152;
	bh=ltl2dzTFUaa7H2aG4AJgeKEj/9DuYykUjD6SD30TiWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rD284UMdniBNvOArttrl83MnmXpyNh/nlcC9K5Mm8gjSj26HUT3Ffziql0jIddtV1
	 xYPXQVBEULCOjAKWHI6hxZEby09LiQAqmJQOZ+2SeubZyJt2ePAgcqq22PnnkBfdLl
	 iGO7KlATTICQP9q0iuNiW/jY9amA+V+pVQXLwF5M9Px9C/dR3p1nksEL0y3UncKxCw
	 MWnsyaP5fCmbPQQeasYezXe0FndmKpf/9Xjv4kNUqGvlEda1E0lLqwdglMDaXbGiMz
	 MBBh+epoSvd6NFLssQi/HYX1EI7ZgicEprfte/z93BzVdbXPatTcmXXYI1TbltQc5u
	 2Gb3LHgTHi+YA==
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
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 15/18] ext4: switch to using the crc32c library
Date: Sun,  3 Nov 2024 14:31:51 -0800
Message-ID: <20241103223154.136127-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_223250_581654_FD42119E 
X-CRM114-Status: GOOD (  15.26  )
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

Now that the crc32c() library function directly takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32c().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/Kconfig |  3 +--
 fs/ext4/ext4.h  | 25 +++----------------------
 fs/ext4/super.c | 15 ---------------
 3 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
index e20d59221fc0..c9ca41d91a6c 100644
--- a/fs/ext4/Kconfig
+++ b/fs/ext4/Kconfig
@@ -29,12 +29,11 @@ config EXT3_FS_SECURITY
 config EXT4_FS
 	tristate "The Extended 4 (ext4) filesystem"
 	select BUFFER_HEAD
 	select JBD2
 	select CRC16
-	select CRYPTO
-	select CRYPTO_CRC32C
+	select CRC32
 	select FS_IOMAP
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
 	help
 	  This is the next generation of the ext3 filesystem.
 
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 44b0d418143c..99aa512a7de1 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -31,11 +31,11 @@
 #include <linux/wait.h>
 #include <linux/sched/signal.h>
 #include <linux/blockgroup_lock.h>
 #include <linux/percpu_counter.h>
 #include <linux/ratelimit.h>
-#include <crypto/hash.h>
+#include <linux/crc32c.h>
 #include <linux/falloc.h>
 #include <linux/percpu-rwsem.h>
 #include <linux/fiemap.h>
 #ifdef __KERNEL__
 #include <linux/compat.h>
@@ -1660,13 +1660,10 @@ struct ext4_sb_info {
 	struct task_struct *s_mmp_tsk;
 
 	/* record the last minlen when FITRIM is called. */
 	unsigned long s_last_trim_minblks;
 
-	/* Reference to checksum algorithm driver via cryptoapi */
-	struct crypto_shash *s_chksum_driver;
-
 	/* Precomputed FS UUID checksum for seeding other checksums */
 	__u32 s_csum_seed;
 
 	/* Reclaim extents from extent status tree */
 	struct shrinker *s_es_shrinker;
@@ -2465,23 +2462,11 @@ static inline __le16 ext4_rec_len_to_disk(unsigned len, unsigned blocksize)
 #define DX_HASH_LAST 			DX_HASH_SIPHASH
 
 static inline u32 ext4_chksum(struct ext4_sb_info *sbi, u32 crc,
 			      const void *address, unsigned int length)
 {
-	struct {
-		struct shash_desc shash;
-		char ctx[4];
-	} desc;
-
-	BUG_ON(crypto_shash_descsize(sbi->s_chksum_driver)!=sizeof(desc.ctx));
-
-	desc.shash.tfm = sbi->s_chksum_driver;
-	*(u32 *)desc.ctx = crc;
-
-	BUG_ON(crypto_shash_update(&desc.shash, address, length));
-
-	return *(u32 *)desc.ctx;
+	return crc32c(crc, address, length);
 }
 
 #ifdef __KERNEL__
 
 /* hash info structure used by the directory hash */
@@ -3278,15 +3263,11 @@ extern void ext4_group_desc_csum_set(struct super_block *sb, __u32 group,
 extern int ext4_register_li_request(struct super_block *sb,
 				    ext4_group_t first_not_zeroed);
 
 static inline int ext4_has_metadata_csum(struct super_block *sb)
 {
-	WARN_ON_ONCE(ext4_has_feature_metadata_csum(sb) &&
-		     !EXT4_SB(sb)->s_chksum_driver);
-
-	return ext4_has_feature_metadata_csum(sb) &&
-	       (EXT4_SB(sb)->s_chksum_driver != NULL);
+	return ext4_has_feature_metadata_csum(sb);
 }
 
 static inline int ext4_has_group_desc_csum(struct super_block *sb)
 {
 	return ext4_has_feature_gdt_csum(sb) || ext4_has_metadata_csum(sb);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 16a4ce704460..1a821093cc0d 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1371,12 +1371,10 @@ static void ext4_put_super(struct super_block *sb)
 	 * Now that we are completely done shutting down the
 	 * superblock, we need to actually destroy the kobject.
 	 */
 	kobject_put(&sbi->s_kobj);
 	wait_for_completion(&sbi->s_kobj_unregister);
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->s_blockgroup_lock);
 	fs_put_dax(sbi->s_daxdev, NULL);
 	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
@@ -4586,19 +4584,10 @@ static int ext4_init_metadata_csum(struct super_block *sb, struct ext4_super_blo
 		return -EINVAL;
 	}
 	ext4_setup_csum_trigger(sb, EXT4_JTR_ORPHAN_FILE,
 				ext4_orphan_file_block_trigger);
 
-	/* Load the checksum driver */
-	sbi->s_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
-	if (IS_ERR(sbi->s_chksum_driver)) {
-		int ret = PTR_ERR(sbi->s_chksum_driver);
-		ext4_msg(sb, KERN_ERR, "Cannot load crc32c driver.");
-		sbi->s_chksum_driver = NULL;
-		return ret;
-	}
-
 	/* Check superblock checksum */
 	if (!ext4_superblock_csum_verify(sb, es)) {
 		ext4_msg(sb, KERN_ERR, "VFS: Found ext4 filesystem with "
 			 "invalid superblock checksum.  Run e2fsck?");
 		return -EFSBADCRC;
@@ -5638,13 +5627,10 @@ failed_mount8: __maybe_unused
 	flush_work(&sbi->s_sb_upd_work);
 	ext4_stop_mmpd(sbi);
 	del_timer_sync(&sbi->s_err_report);
 	ext4_group_desc_free(sbi);
 failed_mount:
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
-
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
 #endif
 
 #ifdef CONFIG_QUOTA
@@ -7433,8 +7419,7 @@ static void __exit ext4_exit_fs(void)
 }
 
 MODULE_AUTHOR("Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others");
 MODULE_DESCRIPTION("Fourth Extended Filesystem");
 MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32c");
 module_init(ext4_init_fs)
 module_exit(ext4_exit_fs)
-- 
2.47.0


