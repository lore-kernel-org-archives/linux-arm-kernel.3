Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15C6C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCXigeeWTrQIReJtJOpqtuS2wbvv8dq2DBtYSLrukBQ=; b=TTucW91xL5LS3tvmXhnfQ0I/j7
	Y9tneq3+iZ58YnTPq9fjouwBMezm39nSKq9E2QmxLVHQzkB9z3EGow2J1BB7D8Ew80fYykWAoeQYR
	Nduk0hstPdoOK19SzjvBXc4UfdWkBWjzrA9qtXEXMVM3y0Wlqly8crYYLiZKTQAZbXLcnvYr4AaE9
	dxHyWwZd00r4+z7DBAtrylBcRc+r57rX2xWv4zk0iUcT9q27fSUUry3vjIJngQ2TwZKqFIwG3Xh/o
	JV8lMb7Zirn0C0DDedaipu8uowKmqzi+OggdKquNIkJbOUoJOgyDguoJ3UOY2oSus9RI8CyUJtPRK
	HTs7ma5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakIY-0000000HBkV-0qdp;
	Sun, 13 Jul 2025 00:10:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajbw-0000000H7XR-0eek
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 042415C5570;
	Sat, 12 Jul 2025 23:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791B6C4CEEF;
	Sat, 12 Jul 2025 23:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362787;
	bh=0uuH9SjZ8K8+ACPJuo2m4qDOTTccNZS9uJItjIz8lEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dH9DsS2Xw3covYFWQE+Ugk+mBSxQ6BXP2pO4QGhLwVyEe44kLlMwoYGDWYEj3LbYU
	 gNdRwNL79zti3WDAQqGT1htMpRbssnwYwxtC6lzR2Z7iMnN/nb5/eKFRmZfAYAyb7V
	 n+j/QkLGWP4ObgYdRFiUCOqHz+h6ker+Ij6lHGSukFAD+bse5ep9FHfZvIUfPLxf24
	 EWrvdOPariUuQs9pPs+WP2TbaKFCh/iYI+jCyHvElw1B3YGPSTjJIys9WkZcYN0Qv9
	 x4K/cOgDkQB3FhwoiAqugSoucfjpSWvoeIMRrzhIV5GFjQ7fRsJv6EFguXNtbqYWBp
	 h+kGyp8qif+ZQ==
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
Subject: [PATCH 16/26] bpf: Use sha1() instead of sha1_transform() in bpf_prog_calc_tag()
Date: Sat, 12 Jul 2025 16:23:07 -0700
Message-ID: <20250712232329.818226-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_162628_290122_AABD600D 
X-CRM114-Status: GOOD (  14.86  )
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

Now that there's a proper SHA-1 library API, just use that instead of
the low-level SHA-1 compression function.  This eliminates the need for
bpf_prog_calc_tag() to implement the SHA-1 padding itself.  No
functional change.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/linux/filter.h |  6 ------
 kernel/bpf/core.c      | 49 +++++++-----------------------------------
 2 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/include/linux/filter.h b/include/linux/filter.h
index f5cf4d35d83e9..3aa33e904a4ed 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -995,16 +995,10 @@ void bpf_prog_change_xdp(struct bpf_prog *prev_prog, struct bpf_prog *prog);
 static inline u32 bpf_prog_insn_size(const struct bpf_prog *prog)
 {
 	return prog->len * sizeof(struct bpf_insn);
 }
 
-static inline u32 bpf_prog_tag_scratch_size(const struct bpf_prog *prog)
-{
-	return round_up(bpf_prog_insn_size(prog) +
-			sizeof(__be64) + 1, SHA1_BLOCK_SIZE);
-}
-
 static inline unsigned int bpf_prog_size(unsigned int proglen)
 {
 	return max(sizeof(struct bpf_prog),
 		   offsetof(struct bpf_prog, insns[proglen]));
 }
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index dae281a1286d5..a1b727ffa4548 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -287,32 +287,23 @@ void __bpf_prog_free(struct bpf_prog *fp)
 	vfree(fp);
 }
 
 int bpf_prog_calc_tag(struct bpf_prog *fp)
 {
-	const u32 bits_offset = SHA1_BLOCK_SIZE - sizeof(__be64);
-	u32 raw_size = bpf_prog_tag_scratch_size(fp);
-	u32 digest[SHA1_DIGEST_WORDS];
-	u32 ws[SHA1_WORKSPACE_WORDS];
-	u32 i, bsize, psize, blocks;
+	size_t size = bpf_prog_insn_size(fp);
+	u8 digest[SHA1_DIGEST_SIZE];
 	struct bpf_insn *dst;
 	bool was_ld_map;
-	u8 *raw, *todo;
-	__be32 *result;
-	__be64 *bits;
+	u32 i;
 
-	raw = vmalloc(raw_size);
-	if (!raw)
+	dst = vmalloc(size);
+	if (!dst)
 		return -ENOMEM;
 
-	sha1_init_raw(digest);
-	memset(ws, 0, sizeof(ws));
-
 	/* We need to take out the map fd for the digest calculation
 	 * since they are unstable from user space side.
 	 */
-	dst = (void *)raw;
 	for (i = 0, was_ld_map = false; i < fp->len; i++) {
 		dst[i] = fp->insnsi[i];
 		if (!was_ld_map &&
 		    dst[i].code == (BPF_LD | BPF_IMM | BPF_DW) &&
 		    (dst[i].src_reg == BPF_PSEUDO_MAP_FD ||
@@ -328,37 +319,13 @@ int bpf_prog_calc_tag(struct bpf_prog *fp)
 			dst[i].imm = 0;
 		} else {
 			was_ld_map = false;
 		}
 	}
-
-	psize = bpf_prog_insn_size(fp);
-	memset(&raw[psize], 0, raw_size - psize);
-	raw[psize++] = 0x80;
-
-	bsize  = round_up(psize, SHA1_BLOCK_SIZE);
-	blocks = bsize / SHA1_BLOCK_SIZE;
-	todo   = raw;
-	if (bsize - psize >= sizeof(__be64)) {
-		bits = (__be64 *)(todo + bsize - sizeof(__be64));
-	} else {
-		bits = (__be64 *)(todo + bsize + bits_offset);
-		blocks++;
-	}
-	*bits = cpu_to_be64((psize - 1) << 3);
-
-	while (blocks--) {
-		sha1_transform(digest, todo, ws);
-		todo += SHA1_BLOCK_SIZE;
-	}
-
-	result = (__force __be32 *)digest;
-	for (i = 0; i < SHA1_DIGEST_WORDS; i++)
-		result[i] = cpu_to_be32(digest[i]);
-	memcpy(fp->tag, result, sizeof(fp->tag));
-
-	vfree(raw);
+	sha1((const u8 *)dst, size, digest);
+	memcpy(fp->tag, digest, sizeof(fp->tag));
+	vfree(dst);
 	return 0;
 }
 
 static int bpf_adj_delta_to_imm(struct bpf_insn *insn, u32 pos, s32 end_old,
 				s32 end_new, s32 curr, const bool probe_pass)
-- 
2.50.1


