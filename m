Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35753C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mtm5lo+g8ZX2LiJ5ezp1zW6EHD2ya7LYJDCuds37EjM=; b=z0cRCc57mEAA33HbmiF892tlRp
	CttTB59FAokZ4xLH6pNG7NLfa+ImNeFav+02J83SnV+LmFDsgWJNhkersqCV/Ti/3MPw56Hpz8Z6h
	+eX0LyMPkCK8bvNh6oYiH7Mo1tvVLUCphYh897QWlx+iBjjNYTthsU/y4AeoMRD4NxD4FaDDImtUD
	N3vsH0O1TxoOHrGj0Cw5ry9F8JfKXnU9T9hYLZXbLTKxTcJQCY0mkKng6NSGjKFd3t80xiG15K8d0
	1AY8zvPOGhmltvdV4Qle7+4PXZN847062TpC4cfIDUQRlTFsDbdmJf3HaWaQZ62Vc+LSEkvqvesMZ
	+JXioN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakZD-0000000HCiG-1xUR;
	Sun, 13 Jul 2025 00:27:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajc0-0000000H7XR-1vDZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FA385C556E;
	Sat, 12 Jul 2025 23:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C7AC4CEF1;
	Sat, 12 Jul 2025 23:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362792;
	bh=oVRGZdE8JlbqTZ+/Vc8lJfxP7t8h25c1QhOzJeVqedA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zj8p+TOdVPu5lLHwjDdEJchVLZkO8F/qQjiyuD+eFQGiCyDQXvpReA3aDYR+mQdXN
	 KP5SpOK4fB3lqKTD1miviKDDEE0Rh1/t2wj68FTUNFC3sg/5fiECZziA+PJrcihbcg
	 EO2THy+IhzDgyjilv+vvjzNXCOgoFE/oeN39RE/9xR7cJuXS8JgPpnNegYYtrAHJn/
	 BP8LivY5YkQlIiBVMIrbibin415AHX10jV1s3KUYIvwDc/U1pvHnZVHEgqZskmXPls
	 60wYxMyihVBMQ31CfcCFnnUSBzCLxCm2+RHUrC7Fd2ORRkenalB5pgZEw3rJ9WKA4R
	 jV4MTcMcL6DBQ==
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
Subject: [PATCH 25/26] ipv6: Switch to higher-level SHA-1 functions
Date: Sat, 12 Jul 2025 16:23:16 -0700
Message-ID: <20250712232329.818226-26-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_162632_593800_0529E710 
X-CRM114-Status: GOOD (  14.66  )
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

There's now a proper SHA-1 API that follows the usual conventions for
hash function APIs: sha1_init(), sha1_update(), sha1_final(), sha1().
The only remaining user of the older low-level SHA-1 API,
sha1_init_raw() and sha1_transform(), is ipv6_generate_stable_address().
I'd like to remove this older API, which is too low-level.

Unfortunately, ipv6_generate_stable_address() does in fact skip the
SHA-1 finalization for some reason.  So the values it computes are not
standard SHA-1 values, and it sort of does want the low-level API.

Still, it's still possible to use the higher-level functions sha1_init()
and sha1_update() to get the same result, provided that the resulting
state is used directly, skipping sha1_final().

So, let's do that instead.  This will allow removing the low-level API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/ipv6/addrconf.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index d0e5b94c10af4..a4d47044f4557 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3336,12 +3336,11 @@ static bool ipv6_reserved_interfaceid(struct in6_addr address)
 static int ipv6_generate_stable_address(struct in6_addr *address,
 					u8 dad_count,
 					const struct inet6_dev *idev)
 {
 	static DEFINE_SPINLOCK(lock);
-	static __u32 digest[SHA1_DIGEST_WORDS];
-	static __u32 workspace[SHA1_WORKSPACE_WORDS];
+	static struct sha1_ctx sha_ctx;
 
 	static union {
 		char __data[SHA1_BLOCK_SIZE];
 		struct {
 			struct in6_addr secret;
@@ -3353,36 +3352,40 @@ static int ipv6_generate_stable_address(struct in6_addr *address,
 
 	struct in6_addr secret;
 	struct in6_addr temp;
 	struct net *net = dev_net(idev->dev);
 
-	BUILD_BUG_ON(sizeof(data.__data) != sizeof(data));
-
 	if (idev->cnf.stable_secret.initialized)
 		secret = idev->cnf.stable_secret.secret;
 	else if (net->ipv6.devconf_dflt->stable_secret.initialized)
 		secret = net->ipv6.devconf_dflt->stable_secret.secret;
 	else
 		return -1;
 
 retry:
 	spin_lock_bh(&lock);
 
-	sha1_init_raw(digest);
+	sha1_init(&sha_ctx);
+
 	memset(&data, 0, sizeof(data));
-	memset(workspace, 0, sizeof(workspace));
 	memcpy(data.hwaddr, idev->dev->perm_addr, idev->dev->addr_len);
 	data.prefix[0] = address->s6_addr32[0];
 	data.prefix[1] = address->s6_addr32[1];
 	data.secret = secret;
 	data.dad_count = dad_count;
+	sha1_update(&sha_ctx, (const u8 *)&data, sizeof(data));
 
-	sha1_transform(digest, data.__data, workspace);
-
+	/*
+	 * Note that the SHA-1 finalization is omitted here, and the digest is
+	 * pulled directly from the internal SHA-1 state (making it incompatible
+	 * with standard SHA-1).  Unusual, but technically okay since the data
+	 * length is fixed and is a multiple of the SHA-1 block size.
+	 */
+	static_assert(sizeof(data) % SHA1_BLOCK_SIZE == 0);
 	temp = *address;
-	temp.s6_addr32[2] = (__force __be32)digest[0];
-	temp.s6_addr32[3] = (__force __be32)digest[1];
+	temp.s6_addr32[2] = (__force __be32)sha_ctx.state.h[0];
+	temp.s6_addr32[3] = (__force __be32)sha_ctx.state.h[1];
 
 	spin_unlock_bh(&lock);
 
 	if (ipv6_reserved_interfaceid(temp)) {
 		dad_count++;
-- 
2.50.1


