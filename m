Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D37CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 22:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orrZV8BgljpRok2XNuKDuddPobJ4kJErV/0v8tbU/Sg=; b=rj3wJUWBYnBTsiJKTTH/jkNf8H
	i+h0eiHhke0dja5wLT+rh7TvqvMrZZNrE7ZvPRNtpXA/vd+/D5o4HLC+n4lq2NMtvVRzkAi1ZoVki
	t6j8z+xUW/I7nLxQ64mRuNPOBVtU7OTzx+KZE2BtOwZZrhYvLrClenGmvFpEbJDh9s7RitOCruP94
	r/2Ix+9DPKd9zCj2p27PFng3i8f82SA98TT87vzYx8ao5EhzGOJo9Zplvf922B14xR5HkBL35Gd0G
	J4MsxgUxvNK6XXNDLs3JTA1prf9A143oc7p/2iNX9lGhXt9bplnAurE5iHR3z8j+YBFUjvJPnkoTt
	G0Cb0B4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv1AS-00000008ZNj-0IQR;
	Sat, 06 Sep 2025 22:13:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0aq-00000008VDK-2Flg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:37:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4796544A89;
	Sat,  6 Sep 2025 21:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D6FC4CEE7;
	Sat,  6 Sep 2025 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194628;
	bh=JTwVCxO7VQKt0pRSCgeHeHvmX5quhsNXXzZV2f26Bs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eIjnKxH09OTN1s3TO5OkyZTYLxVqeC7VxU8nQKQBpGN/Fp3rPUrW0n+2bbZB8zzHO
	 AM3Jbi3sTFeW+TtxRT/DDlpUtp2nU3AsNxgqi3J9QOr95cH4ApNZisj4U8uyWcTX9J
	 oIUv1b9OFpCv+lF6lcDbX7MRLUeU9QQQf3jMAwVmuUuVNZ4nBBi2E9UrIgfPoWqKks
	 rp25asjGBdt0WoQPVjykGqKwMURs6fc94N8vFJE6fVqLvc6WjT4BBmwHtxgcDe8YcQ
	 6/frNrko95cghzRkUomIuPn5fGIpDZcwvymzk8m+EMawZ4vDT4WQb8PO0vmvXDURHL
	 twswbfGWpHfKw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 12/12] wireguard: kconfig: Simplify crypto kconfig selections
Date: Sat,  6 Sep 2025 14:35:23 -0700
Message-ID: <20250906213523.84915-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_143708_646171_1C8751DD 
X-CRM114-Status: GOOD (  10.85  )
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

Simplify the kconfig entry for WIREGUARD:

- Drop the selections of the arch-optimized ChaCha20, Poly1305, BLAKE2s,
  and Curve25519 code.  These options no longer exist, as lib/crypto/
  now enables the arch-optimized code automatically.

- Drop the selection of CRYPTO.  This was needed only to make the
  arch-optimized options visible.  lib/crypto/ now handles these options
  internally, without any dependency on CRYPTO.

- Drop the dependency on !KMSAN.  This was needed only to avoid
  selecting arch-optimized code that isn't compatible with KMSAN.
  lib/crypto/ now handles the !KMSAN dependencies internally.

- Add a selection of CRYPTO_LIB_UTILS, since WireGuard directly calls
  crypto_memneq().  This gets selected indirectly by
  CRYPTO_LIB_CURVE25519 and CRYPTO_LIB_CHACHA20POLY1305 anyway, but it's
  best to make this dependency explicit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/net/Kconfig | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index b29628d46be9b..ac12eaf11755d 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -74,28 +74,15 @@ config DUMMY
 
 config WIREGUARD
 	tristate "WireGuard secure network tunnel"
 	depends on NET && INET
 	depends on IPV6 || !IPV6
-	depends on !KMSAN # KMSAN doesn't support the crypto configs below
 	select NET_UDP_TUNNEL
 	select DST_CACHE
-	select CRYPTO
 	select CRYPTO_LIB_CURVE25519
 	select CRYPTO_LIB_CHACHA20POLY1305
-	select CRYPTO_CHACHA20_X86_64 if X86 && 64BIT
-	select CRYPTO_POLY1305_X86_64 if X86 && 64BIT
-	select CRYPTO_BLAKE2S_X86 if X86 && 64BIT
-	select CRYPTO_CURVE25519_X86 if X86 && 64BIT
-	select CRYPTO_CHACHA20_NEON if ARM || (ARM64 && KERNEL_MODE_NEON)
-	select CRYPTO_POLY1305_NEON if ARM64 && KERNEL_MODE_NEON
-	select CRYPTO_POLY1305_ARM if ARM
-	select CRYPTO_BLAKE2S_ARM if ARM
-	select CRYPTO_CURVE25519_NEON if ARM && KERNEL_MODE_NEON
-	select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
-	select CRYPTO_POLY1305_MIPS if MIPS
-	select CRYPTO_CHACHA_S390 if S390
+	select CRYPTO_LIB_UTILS
 	help
 	  WireGuard is a secure, fast, and easy to use replacement for IPSec
 	  that uses modern cryptography and clever networking tricks. It's
 	  designed to be fairly general purpose and abstract enough to fit most
 	  use cases, while at the same time remaining extremely simple to
-- 
2.50.1


