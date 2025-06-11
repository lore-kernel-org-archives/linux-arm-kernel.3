Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A1EC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 03:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6L5kLiMXVSLesfMswCHaMgooGTQlEM//lxdnBmxha8=; b=iFpaQNeG/p9aQRshXBhZ556gJ5
	Dk1H18foCnkmZ3rtI31doXwfYje89S1z+9C+2AHkd9QC/bHjUJQZkba5lC94O4R4JOO8hCPLIy32s
	iZhvSuVcw0/YjTgMfvsg1J+KnarG90bI7RW4zWFdmouV0dGJRqyWPbWrR+7FsiImw5VXeIrf5FtU1
	yctjSn5gJ1leCnZrDtGzxJsfruCEJRdf1qxYdRaghMlnJb8NtYBy0bbeMyygo6gIdKoYY8upi7q8e
	QnG1MEH0NfVjPF+9LhUAa/S5oGhvEBmbAyeki0IuTvzDNfx+HQkEMGOSR1Yhhla6SsASx+NIE4wmH
	Zec2heuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPC4I-00000008jUT-0AIE;
	Wed, 11 Jun 2025 03:24:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAxT-00000008cNv-3boc;
	Wed, 11 Jun 2025 02:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89B865C58D7;
	Wed, 11 Jun 2025 02:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C4BC4CEF5;
	Wed, 11 Jun 2025 02:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607975;
	bh=VjWSxk5rTs8+2YM7TLECuuSPNRzmvS+Q0pNNnwsrogA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PszQ96pbYZGKnEs0HNc9JVgtTPdRXqHfZiholh1Lrl6KG0nU/bEhzCLeuGaJzXEyv
	 xYis4SIZ8EKhSzUL5Eipysmh9VNU6LRnswFmYQbcThAx+pHzRTQaRN9Y8bCqBi07iG
	 hLPUZblCbsroMPDzWbjZDaghLqqwkv3/KM2RyblH1zjlDh89v9Icbw/Lz615XwZWXl
	 Px2hER0r9yV9PyvvgPVjk6U7JatTo1JpGhRcd9AbIuldbBL1FTIme7DvenSzaA8o1W
	 LmC2MV/s4kaJe9uAqXZBLM8yfekmfgsdo9J3ub9lBMAhSoeWZIhL0aGoClnRNKynd1
	 OJ9mKE5+J+vYg==
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
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 06/16] crypto: riscv/sha512 - stop depending on sha512_generic_block_fn
Date: Tue, 10 Jun 2025 19:09:13 -0700
Message-ID: <20250611020923.1482701-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611020923.1482701-1-ebiggers@kernel.org>
References: <20250611020923.1482701-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_191255_940274_9ADF45F4 
X-CRM114-Status: GOOD (  13.64  )
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


