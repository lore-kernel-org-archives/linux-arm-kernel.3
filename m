Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66033C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 23:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfGb++iyqZlDvhqlROnQtUURr27G9aCS+kWzxTx8Tu0=; b=PWwPk0ylDEtg+Q0AmmElYUUbmA
	WUBOaziqoo/b7yTwQDSGWYseQGmORPp6xgWsqS/38PHkL5tZC5FDaV1VIUrC2OzKdOJL0OUC3xYbG
	O4bt9APqC6PFCTDU8RCrBBF0dhsp87Z+dVklyFiTzoaK4pQW5Wi5zY6Bar9vIV9OCPk1bO1YHjeUp
	Xk1te9/0IRFtr5kwr/KuKZ7hCJhrhSIiD3y1KggdKPlbu41cYKLJYGEpjBZX4t4UocvbiPT2lkqHC
	7QdzUY+fVQIg6vusYTkFfZWvmObpwTptmFFdC8tl2P86qt50qnfCvCHkCP/3cIORXupS/79jkfXKj
	EJoPJixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajsY-0000000HAAb-3xYK;
	Sat, 12 Jul 2025 23:43:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajbr-0000000H7VS-0j3Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59078468EE;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19DEC4CEF8;
	Sat, 12 Jul 2025 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362781;
	bh=E22JI/nh2KoyIuwx+c+Le9v+4pE3ucXhZL4d/YBdz7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmmwf+fAlxfZeUlUdvV1RStLqLkPiW2zfJ2zBPrVlnr7L04CcfPF3I/ZY61mhxqzF
	 UmqYAUQ4svnDAjD64/qd2nbDs5VfdmZ+Wdl6axs+Pp2dBobCdfzKvfiUfyjWyV0Emu
	 bnFJy4JMfW/NLQp1h1EAuLTEdvJJVjXcMFnzNKc2usi851QxfTu1Eem5KjkNwGll5f
	 lgQrbXzEIq4c4ZedmXzCDpa9WeJNZgMl9S3h/6kVtOWN5EVdkv3MDG/a3Oum868UU6
	 SfJiyW/fELObXrfYbVzrJFLlz3eNbYdmWQXsdfzTPEmjVRv+y4B1yYLAvoaYPKAIou
	 1xYQp8kEh20rg==
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
Subject: [PATCH 02/26] lib/crypto: sha1: Rename sha1_init() to sha1_init_raw()
Date: Sat, 12 Jul 2025 16:22:53 -0700
Message-ID: <20250712232329.818226-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_162623_250611_B9ED33F1 
X-CRM114-Status: GOOD (  14.82  )
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

Rename the existing sha1_init() to sha1_init_raw(), since it conflicts
with the upcoming library function.  This will later be removed, but
this keeps the kernel building for the introduction of the library.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1.h | 2 +-
 kernel/bpf/core.c     | 2 +-
 lib/crypto/sha1.c     | 6 +++---
 net/ipv6/addrconf.c   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/crypto/sha1.h b/include/crypto/sha1.h
index f48230b1413c3..d853d3b931699 100644
--- a/include/crypto/sha1.h
+++ b/include/crypto/sha1.h
@@ -31,9 +31,9 @@ struct sha1_state {
  * You shouldn't be using SHA-1, and even if you *have* to use SHA-1, this isn't
  * the correct way to hash something with SHA-1 (use crypto_shash instead).
  */
 #define SHA1_DIGEST_WORDS	(SHA1_DIGEST_SIZE / 4)
 #define SHA1_WORKSPACE_WORDS	16
-void sha1_init(__u32 *buf);
+void sha1_init_raw(__u32 *buf);
 void sha1_transform(__u32 *digest, const char *data, __u32 *W);
 
 #endif /* _CRYPTO_SHA1_H */
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index c20babbf998f4..dae281a1286d5 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -302,11 +302,11 @@ int bpf_prog_calc_tag(struct bpf_prog *fp)
 
 	raw = vmalloc(raw_size);
 	if (!raw)
 		return -ENOMEM;
 
-	sha1_init(digest);
+	sha1_init_raw(digest);
 	memset(ws, 0, sizeof(ws));
 
 	/* We need to take out the map fd for the digest calculation
 	 * since they are unstable from user space side.
 	 */
diff --git a/lib/crypto/sha1.c b/lib/crypto/sha1.c
index 6d809c3088be3..813ad96daa25a 100644
--- a/lib/crypto/sha1.c
+++ b/lib/crypto/sha1.c
@@ -122,20 +122,20 @@ void sha1_transform(__u32 *digest, const char *data, __u32 *array)
 	digest[4] += E;
 }
 EXPORT_SYMBOL(sha1_transform);
 
 /**
- * sha1_init - initialize the vectors for a SHA1 digest
+ * sha1_init_raw - initialize the vectors for a SHA1 digest
  * @buf: vector to initialize
  */
-void sha1_init(__u32 *buf)
+void sha1_init_raw(__u32 *buf)
 {
 	buf[0] = 0x67452301;
 	buf[1] = 0xefcdab89;
 	buf[2] = 0x98badcfe;
 	buf[3] = 0x10325476;
 	buf[4] = 0xc3d2e1f0;
 }
-EXPORT_SYMBOL(sha1_init);
+EXPORT_SYMBOL(sha1_init_raw);
 
 MODULE_DESCRIPTION("SHA-1 Algorithm");
 MODULE_LICENSE("GPL");
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index ba2ec7c870ccb..d0e5b94c10af4 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3365,11 +3365,11 @@ static int ipv6_generate_stable_address(struct in6_addr *address,
 		return -1;
 
 retry:
 	spin_lock_bh(&lock);
 
-	sha1_init(digest);
+	sha1_init_raw(digest);
 	memset(&data, 0, sizeof(data));
 	memset(workspace, 0, sizeof(workspace));
 	memcpy(data.hwaddr, idev->dev->perm_addr, idev->dev->addr_len);
 	data.prefix[0] = address->s6_addr32[0];
 	data.prefix[1] = address->s6_addr32[1];
-- 
2.50.1


