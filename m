Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D816C71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6L5kLiMXVSLesfMswCHaMgooGTQlEM//lxdnBmxha8=; b=l5Hk4LLACmYqXiZcQPU59yiRo0
	G6QqByOPSJLQz6U6nbpl1yR21oGLDmCvuq5epHbsb+/VsyG6SbfDFzGxyIjI/udNFdBv8+zycLhXI
	BkdQXK5++LvjmQPfmkwc27e9ekwaJNtndgqyQsaDN6piV9JgXcHkQb8+bJ7nAh0Y6jO+lIkspuVhe
	ihWvb/RFWyCgMMPKBxoHEq29c59NQUblPSINFzUw0OMsN/SPiReWgU5zEAAFwJMjH6WHd7egEYYU6
	gpa2UMmf/IzNZ/hmwHdwaBZ6mQ3ia8/Pd7PHl/yFEfR5soB9pAsbrpoh7dyI6Cqvus7Y/0cokPCNH
	Zd6zU1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzeo-00000003A7f-3x8e;
	Mon, 16 Jun 2025 02:33:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyrE-000000035c5-38kj;
	Mon, 16 Jun 2025 01:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 257BC61166;
	Mon, 16 Jun 2025 01:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1247C4CEE3;
	Mon, 16 Jun 2025 01:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750038116;
	bh=VjWSxk5rTs8+2YM7TLECuuSPNRzmvS+Q0pNNnwsrogA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CiAuMb9d7mmtKBMUulKV3/UTe5RZysm0JpnYZwLbGs6jV1P3vUsg5o4uOvygNJ/83
	 dw8cGEoVj0DmZI9hYag3R+CAxJcA9AuGaqIVz0NniqY6pBFfuV90Uo3oD6AqMSVP+O
	 gtRJMEHLyKGkWOtG5D2LGkmD/Y0eG86FpYsP2c+kHCB798QeWbyZ9zzpyRkTsOZxoV
	 f3UdKrKe7v87n2RfFmdWq7ltSp89FkpaGRMGcHgIN4h2EGbvBa2yW1rdFYeNp0V7XR
	 0uT+daSuOyX27OcrSxK+kTYbtQqFbMJ0qyufcc0dCs5bgP3nn8oqvNYeOjq15wrM19
	 hV/0ribyGmzUQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 06/17] crypto: riscv/sha512 - stop depending on sha512_generic_block_fn
Date: Sun, 15 Jun 2025 18:40:08 -0700
Message-ID: <20250616014019.415791-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>
References: <20250616014019.415791-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

sha512_generic_block_fn() will no longer be available when the SHA-512
support in the old-school crypto API is changed to just wrap the SHA-512
library.  Replace the use of sha512_generic_block_fn() in
sha512-riscv64-glue.c with temporary code that uses the library's
__sha512_update().  This is just a temporary workaround to keep the
kernel building and functional at each commit; this code gets superseded
when the RISC-V optimized SHA-512 is migrated to lib/crypto/ anyway.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/crypto/Kconfig               | 1 +
 arch/riscv/crypto/sha512-riscv64-glue.c | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index cd9b776602f89..53e4e1eacf554 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -29,10 +29,11 @@ config CRYPTO_GHASH_RISCV64
 	  - Zvkg vector crypto extension
 
 config CRYPTO_SHA512_RISCV64
 	tristate "Hash functions: SHA-384 and SHA-512"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	select CRYPTO_LIB_SHA512
 	select CRYPTO_SHA512
 	help
 	  SHA-384 and SHA-512 secure hash algorithm (FIPS 180)
 
 	  Architecture: riscv64 using:
diff --git a/arch/riscv/crypto/sha512-riscv64-glue.c b/arch/riscv/crypto/sha512-riscv64-glue.c
index 4634fca78ae24..b3dbc71de07b0 100644
--- a/arch/riscv/crypto/sha512-riscv64-glue.c
+++ b/arch/riscv/crypto/sha512-riscv64-glue.c
@@ -36,11 +36,17 @@ static void sha512_block(struct sha512_state *state, const u8 *data,
 	if (crypto_simd_usable()) {
 		kernel_vector_begin();
 		sha512_transform_zvknhb_zvkb(state, data, num_blocks);
 		kernel_vector_end();
 	} else {
-		sha512_generic_block_fn(state, data, num_blocks);
+		struct __sha512_ctx ctx = {};
+
+		static_assert(sizeof(ctx.state) == sizeof(state->state));
+		memcpy(&ctx.state, state->state, sizeof(ctx.state));
+		__sha512_update(&ctx, data,
+				(size_t)num_blocks * SHA512_BLOCK_SIZE);
+		memcpy(state->state, &ctx.state, sizeof(state->state));
 	}
 }
 
 static int riscv64_sha512_update(struct shash_desc *desc, const u8 *data,
 				 unsigned int len)
-- 
2.49.0


