Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B90CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 23:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/muUhc4Pnj/8wOhT7CLT11GRRfXQ88PqrS4wZHOEqeY=; b=JX3LyQ/KbZ6Uho1AVupIsWV73r
	M1IET1thmgSYzMV37eX1Gid7qK103ZQpb+yQWfFhFSxzWU/gWLUOC/ohy16BV6lm7CfVI8yVnA9+B
	PKlvH4bxei8zZOZhpAwCjc3g1X1AcIF6HCDzVDsT703wCAPFAqAJXxYdrn0p5SLqOUfkj/slTcRGF
	jfabLWIZNtkaBJ2a/9pm9CLYvZuiFzMUHPk+yw+pAgr3xGZ8zxhoHBg/Ivek4xeqyQtUjwXVMxUdj
	G6bjJB/rpJVno4TMsQZY3+MOiPYNXTh8HgxmzvEslWIhpXbORHkzv6WEnNoMS9ZoDWtO58AKBXiFp
	hDp2dBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw7Zh-0000000ArD0-3iAE;
	Tue, 09 Sep 2025 23:16:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw7Zc-0000000Ar71-2zoi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 23:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6894D44D68;
	Tue,  9 Sep 2025 23:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003D6C4CEFD;
	Tue,  9 Sep 2025 23:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757459788;
	bh=Wo2E3+6r1nAKVC9DS3YgQKzibRVbwi36i7wXqg9oQbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GAibJo01K5N7qAV7wLnPWYLzVTHDHe09AHiWUTOMsZK25vF4ZL3/qFgumBazcxyed
	 ji03Vg4Ba9iEkUNDPucu/ZesLovQ5G0qEs2HWCW48MNWlUpfdV8QfeRUM/d6+KAPeG
	 tx3P6fLMLUsLUcq8InH8yiH+FPjPoNSMMEzE1exDJ3Esu4xd8xPEpQMRKmkzEFioZx
	 0r4F6GpaiewdtNfQ7CzuWx0af4DFTnOZeRsvDCrS/jxr0VNWIiJAafOKKPyaSr+csz
	 35c6SM4sAxRp9t0mvfO9Ps3yclq5QmRNN0KVXleeLvBaFmSCgXgEZTdOpn8Y32ceXV
	 k9r26FiJoKU5Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 5/6] fsverity: Remove inode parameter from fsverity_hash_block()
Date: Tue,  9 Sep 2025 16:13:25 -0700
Message-ID: <20250909231326.1074672-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909231326.1074672-1-ebiggers@kernel.org>
References: <20250909231326.1074672-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_161628_810790_D8D4E6BB 
X-CRM114-Status: GOOD (  21.11  )
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

Due to the conversion from crypto_shash to the library API,
fsverity_hash_block() can no longer fail.  Therefore, the inode
parameter, which was used only to print an error message in the case of
a failure, is no longer necessary.  Remove it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/verity/enable.c           | 12 +++++-------
 fs/verity/fsverity_private.h |  2 +-
 fs/verity/hash_algs.c        |  3 +--
 fs/verity/verify.c           |  4 ++--
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 503268cf42962..f2f5b0471b6b2 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -17,12 +17,11 @@ struct block_buffer {
 	bool is_root_hash;
 	u8 *data;
 };
 
 /* Hash a block, writing the result to the next level's pending block buffer. */
-static int hash_one_block(struct inode *inode,
-			  const struct merkle_tree_params *params,
+static int hash_one_block(const struct merkle_tree_params *params,
 			  struct block_buffer *cur)
 {
 	struct block_buffer *next = cur + 1;
 
 	/*
@@ -34,12 +33,11 @@ static int hash_one_block(struct inode *inode,
 		return -EINVAL;
 
 	/* Zero-pad the block if it's shorter than the block size. */
 	memset(&cur->data[cur->filled], 0, params->block_size - cur->filled);
 
-	fsverity_hash_block(params, inode, cur->data,
-			    &next->data[next->filled]);
+	fsverity_hash_block(params, cur->data, &next->data[next->filled]);
 	next->filled += params->digest_size;
 	cur->filled = 0;
 	return 0;
 }
 
@@ -121,22 +119,22 @@ static int build_merkle_tree(struct file *filp,
 		if (bytes_read != buffers[-1].filled) {
 			err = -EINVAL;
 			fsverity_err(inode, "Short read of file data");
 			goto out;
 		}
-		err = hash_one_block(inode, params, &buffers[-1]);
+		err = hash_one_block(params, &buffers[-1]);
 		if (err)
 			goto out;
 		for (level = 0; level < num_levels; level++) {
 			if (buffers[level].filled + params->digest_size <=
 			    params->block_size) {
 				/* Next block at @level isn't full yet */
 				break;
 			}
 			/* Next block at @level is full */
 
-			err = hash_one_block(inode, params, &buffers[level]);
+			err = hash_one_block(params, &buffers[level]);
 			if (err)
 				goto out;
 			err = write_merkle_tree_block(inode,
 						      buffers[level].data,
 						      level_offset[level],
@@ -152,11 +150,11 @@ static int build_merkle_tree(struct file *filp,
 		cond_resched();
 	}
 	/* Finish all nonempty pending tree blocks. */
 	for (level = 0; level < num_levels; level++) {
 		if (buffers[level].filled != 0) {
-			err = hash_one_block(inode, params, &buffers[level]);
+			err = hash_one_block(params, &buffers[level]);
 			if (err)
 				goto out;
 			err = write_merkle_tree_block(inode,
 						      buffers[level].data,
 						      level_offset[level],
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 5fe854a5b9ad3..d0458877afea4 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -87,11 +87,11 @@ const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
 						      unsigned int num);
 union fsverity_hash_ctx *
 fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
 			    const u8 *salt, size_t salt_size);
 void fsverity_hash_block(const struct merkle_tree_params *params,
-			 const struct inode *inode, const void *data, u8 *out);
+			 const void *data, u8 *out);
 void fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
 			  const void *data, size_t size, u8 *out);
 void __init fsverity_check_hash_algs(void);
 
 /* init.c */
diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
index 9bb3c6344907e..de53e14c8aa78 100644
--- a/fs/verity/hash_algs.c
+++ b/fs/verity/hash_algs.c
@@ -92,19 +92,18 @@ fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
 }
 
 /**
  * fsverity_hash_block() - hash a single data or hash block
  * @params: the Merkle tree's parameters
- * @inode: inode for which the hashing is being done
  * @data: virtual address of a buffer containing the block to hash
  * @out: output digest, size 'params->digest_size' bytes
  *
  * Hash a single data or hash block.  The hash is salted if a salt is specified
  * in the Merkle tree parameters.
  */
 void fsverity_hash_block(const struct merkle_tree_params *params,
-			 const struct inode *inode, const void *data, u8 *out)
+			 const void *data, u8 *out)
 {
 	union fsverity_hash_ctx ctx;
 
 	if (!params->hashstate) {
 		fsverity_hash_buffer(params->hash_alg, data, params->block_size,
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index a1f00c3fd3b27..d7d5f65700b03 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -200,11 +200,11 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		struct page *hpage = hblocks[level - 1].page;
 		const void *haddr = hblocks[level - 1].addr;
 		unsigned long hblock_idx = hblocks[level - 1].index;
 		unsigned int hoffset = hblocks[level - 1].hoffset;
 
-		fsverity_hash_block(params, inode, haddr, real_hash);
+		fsverity_hash_block(params, haddr, real_hash);
 		if (memcmp(want_hash, real_hash, hsize) != 0)
 			goto corrupted;
 		/*
 		 * Mark the hash block as verified.  This must be atomic and
 		 * idempotent, as the same hash block might be verified by
@@ -219,11 +219,11 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		kunmap_local(haddr);
 		put_page(hpage);
 	}
 
 	/* Finally, verify the data block. */
-	fsverity_hash_block(params, inode, data, real_hash);
+	fsverity_hash_block(params, data, real_hash);
 	if (memcmp(want_hash, real_hash, hsize) != 0)
 		goto corrupted;
 	return true;
 
 corrupted:
-- 
2.50.1


