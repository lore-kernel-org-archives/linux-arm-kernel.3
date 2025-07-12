Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C37C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2MGdzYvcst5IMa/Q4V1TYN4Ms7TUXjTRtBPro8Troo=; b=Ju0i8TOxtX9IDF59DcjOl+6cc6
	q0vnfZ5BuLtW6Gz6oVR/pfvatE3B83gWqEuh5Hro5JGFcteRgmthBbhtWUmsntR6A04NEP75slx6G
	J6h0m4AUc8wQRlszFuYxiudwys8TH3MEQlPDonPwXL9PXI8SQ4NKoVDGWDPdrTrk9wjvv88PHLE+M
	Ow5AULQ0Mw4C7LhJudKrfmeOVdv6yf4uzonzalbmrMkTCd4mP4/EbkOr7ejzmjSF591pYkPe3790g
	wxLzPcDGy7cvR9T4B59CL2a43ww3jYkLF2KmJZ/eLR5Adct2y6F5stKnNlIkCmmx+d/Ig5htD0BBq
	psbdW9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uak96-0000000HB24-1CZN;
	Sun, 13 Jul 2025 00:00:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajby-0000000H7eG-0e4t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C70E61127;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DD0C4CEEF;
	Sat, 12 Jul 2025 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362789;
	bh=RedRxFFHKVy5vtVyY+MZJNiBk1oOHQ1I/68b2H+lbA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TruHvLVHxzmKSDlYw1X7RzNkw2reqbswxSziZxBysLXETgCfeJYJssRnoaL1nzchi
	 mi9LuEPvy1/hCsL7g5ruwnoqxWESCQwA0R6D++X5zLp+a1AP/SYpw+WEAZjvmFQX6i
	 m5sZe95u3ReCd2zA9v1HzPEzPx2HWU3ceCbr7feHlOPjPGB1S+Avh8UHhOh6Qd9t+q
	 9f4qhYO4xgQ30f+8sg3fvb3SJc4mvuEfy5lY9MGKg3uEMndll+YQh3+Gn88Rkq4xXy
	 9QbE4KXhY4FA2wx4Y5mO4lq71JIx2mLl3fKyCGcWwCY0X/KHwZI+dqmIh49OgDsD95
	 5DEcBVAIH3xUw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 19/26] tee: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:10 -0700
Message-ID: <20250712232329.818226-20-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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

Use the SHA-1 library functions instead of crypto_shash.  This is
simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/tee/Kconfig    |  3 +--
 drivers/tee/tee_core.c | 55 +++++++-----------------------------------
 2 files changed, 10 insertions(+), 48 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 61b507c187801..a84767940fbfc 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -1,12 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Generic Trusted Execution Environment Configuration
 menuconfig TEE
 	tristate "Trusted Execution Environment support"
 	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD
-	select CRYPTO
-	select CRYPTO_SHA1
+	select CRYPTO_LIB_SHA1
 	select DMA_SHARED_BUFFER
 	select GENERIC_ALLOCATOR
 	help
 	  This implements a generic interface towards a Trusted Execution
 	  Environment (TEE).
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index acc7998758ad8..4c82a171bff20 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -12,11 +12,10 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
-#include <crypto/hash.h>
 #include <crypto/sha1.h>
 #include "tee_private.h"
 
 #define TEE_NUM_DEVICES	32
 
@@ -140,72 +139,36 @@ static int tee_release(struct inode *inode, struct file *filp)
  * UUIDv5 is specific in RFC 4122.
  *
  * This implements section (for SHA-1):
  * 4.3.  Algorithm for Creating a Name-Based UUID
  */
-static int uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
-		   size_t size)
+static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+		    size_t size)
 {
+	struct sha1_ctx ctx;
 	unsigned char hash[SHA1_DIGEST_SIZE];
-	struct crypto_shash *shash = NULL;
-	struct shash_desc *desc = NULL;
-	int rc;
-
-	shash = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(shash)) {
-		rc = PTR_ERR(shash);
-		pr_err("shash(sha1) allocation failed\n");
-		return rc;
-	}
-
-	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(shash),
-		       GFP_KERNEL);
-	if (!desc) {
-		rc = -ENOMEM;
-		goto out_free_shash;
-	}
-
-	desc->tfm = shash;
 
-	rc = crypto_shash_init(desc);
-	if (rc < 0)
-		goto out_free_desc;
-
-	rc = crypto_shash_update(desc, (const u8 *)ns, sizeof(*ns));
-	if (rc < 0)
-		goto out_free_desc;
-
-	rc = crypto_shash_update(desc, (const u8 *)name, size);
-	if (rc < 0)
-		goto out_free_desc;
-
-	rc = crypto_shash_final(desc, hash);
-	if (rc < 0)
-		goto out_free_desc;
+	sha1_init(&ctx);
+	sha1_update(&ctx, (const u8 *)ns, sizeof(*ns));
+	sha1_update(&ctx, (const u8 *)name, size);
+	sha1_final(&ctx, hash);
 
 	memcpy(uuid->b, hash, UUID_SIZE);
 
 	/* Tag for version 5 */
 	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
 	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
-
-out_free_desc:
-	kfree(desc);
-
-out_free_shash:
-	crypto_free_shash(shash);
-	return rc;
 }
 
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
 {
 	gid_t ns_grp = (gid_t)-1;
 	kgid_t grp = INVALID_GID;
 	char *name = NULL;
 	int name_len;
-	int rc;
+	int rc = 0;
 
 	if (connection_method == TEE_IOCTL_LOGIN_PUBLIC ||
 	    connection_method == TEE_IOCTL_LOGIN_REE_KERNEL) {
 		/* Nil UUID to be passed to TEE environment */
 		uuid_copy(uuid, &uuid_null);
@@ -258,11 +221,11 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 	default:
 		rc = -EINVAL;
 		goto out_free_name;
 	}
 
-	rc = uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
+	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
 out_free_name:
 	kfree(name);
 
 	return rc;
 }
-- 
2.50.1


