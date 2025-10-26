Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BA8CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vxh7/YKj7ExAj/pKg0vV3MeLEu8y/caG0c7bA9QRZm0=; b=QTb+47/TokTFtxdq3gZuixQhnC
	PoKOkNK7IkX8PbMOkSCiSB91j51n7wibO/9JHjTLqjY1T+yKJsqTHgIgpgsOcuWW1xthy5jmedGbY
	uPwYAElqUJsFc4dNA9DSs5hTHljDWAbwOt/NvQxU6pUOaOJFRvFMspalwPE9BsgDkWG8zirOBPoSX
	E+QuGGEFyXbFnXeMC1OFkiCoP9jwTpyeWs3wsV02rRW5251C3O6clmAaCsaAQbL30DMYJxirlaZyl
	gYzv2lI/dchg1lAyrXDkAQcGPB2zrDYPdmyt5YA3vC8c0UZuo0GPJ7IHr5XLr+OJp7ySTusG3UWCJ
	2b+BgieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCthS-0000000C3Ol-1DMP;
	Sun, 26 Oct 2025 05:53:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgj-0000000C2ma-0n9Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 05:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D97BB44B70;
	Sun, 26 Oct 2025 05:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68413C116C6;
	Sun, 26 Oct 2025 05:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761457988;
	bh=tK4ZwtbvVT+WWMAoNFlch+KJGW1l/8qhroTz/lgXZ+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VjCjZuVIcC04piSCOr/VPr+Acxc4Jbc9WzwyZjZsuZyijzdgb4V2ePe38orck/ib4
	 0QDKFZgHjokI7bVMZWsYUuc5osS8lr1CTrTtc4tVumVXTGVy2QFbBft1mQwlkFKYwj
	 EyuYZXpOpVH7tKFGUGFf9wvRiuQibbsFoeFc5THM2DijB77in3MrMLNRpya/Bj0PuX
	 ZDj47k4Sy1BRg1Z5kQEmwrVqxi6F4NHEQldxYeGterWeNg57gMojOcKASpAW3uDvEs
	 Zz7xK6V/lReCdjwRzMavc+tLiIDxETdLKM7iZYd/rjCBbR6EKISWx5mn73nHurZXcE
	 S5wYHNmhhtH5g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/15] lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest functions
Date: Sat, 25 Oct 2025 22:50:29 -0700
Message-ID: <20251026055032.1413733-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251026055032.1413733-1-ebiggers@kernel.org>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_225309_312982_093B5361 
X-CRM114-Status: GOOD (  14.75  )
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

Some z/Architecture processors can compute a SHA-3 digest in a single
instruction.  Use this capability to implement the sha3_224(),
sha3_256(), sha3_384(), and sha3_512() library functions.

Note that the performance improvement is likely to be relatively small
and be noticeable primarily on short messages, as the actual Keccak
permutation is already accelerated via the implementations of
sha3_absorb_blocks() and sha3_keccakf().  Nevertheless,
arch/s390/crypto/ takes advantage of the "do the full SHA-3" capability,
and it was requested that lib/crypto/ do so as well for parity with it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/s390/sha3.h | 67 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/lib/crypto/s390/sha3.h b/lib/crypto/s390/sha3.h
index 668e53da93d2c..85471404775a3 100644
--- a/lib/crypto/s390/sha3.h
+++ b/lib/crypto/s390/sha3.h
@@ -6,10 +6,11 @@
  */
 #include <asm/cpacf.h>
 #include <linux/cpufeature.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha3);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha3_init_optim);
 
 static void sha3_absorb_blocks(struct sha3_state *state, const u8 *data,
 			       size_t nblocks, size_t block_size)
 {
 	if (static_branch_likely(&have_sha3)) {
@@ -58,10 +59,65 @@ static void sha3_keccakf(struct sha3_state *state)
 	} else {
 		sha3_keccakf_generic(state);
 	}
 }
 
+static inline bool s390_sha3(int func, const u8 *in, size_t in_len,
+			     u8 *out, size_t out_len)
+{
+	struct sha3_state state;
+
+	if (!static_branch_likely(&have_sha3))
+		return false;
+
+	if (static_branch_likely(&have_sha3_init_optim))
+		func |= CPACF_KLMD_NIP | CPACF_KLMD_DUFOP;
+	else
+		memset(&state, 0, sizeof(state));
+
+	cpacf_klmd(func, &state, in, in_len);
+
+	if (static_branch_likely(&have_sha3_init_optim))
+		kmsan_unpoison_memory(&state, out_len);
+
+	memcpy(out, &state, out_len);
+	memzero_explicit(&state, sizeof(state));
+	return true;
+}
+
+#define sha3_224_arch sha3_224_arch
+static bool sha3_224_arch(const u8 *in, size_t in_len,
+			  u8 out[SHA3_224_DIGEST_SIZE])
+{
+	return s390_sha3(CPACF_KLMD_SHA3_224, in, in_len,
+			 out, SHA3_224_DIGEST_SIZE);
+}
+
+#define sha3_256_arch sha3_256_arch
+static bool sha3_256_arch(const u8 *in, size_t in_len,
+			  u8 out[SHA3_256_DIGEST_SIZE])
+{
+	return s390_sha3(CPACF_KLMD_SHA3_256, in, in_len,
+			 out, SHA3_256_DIGEST_SIZE);
+}
+
+#define sha3_384_arch sha3_384_arch
+static bool sha3_384_arch(const u8 *in, size_t in_len,
+			  u8 out[SHA3_384_DIGEST_SIZE])
+{
+	return s390_sha3(CPACF_KLMD_SHA3_384, in, in_len,
+			 out, SHA3_384_DIGEST_SIZE);
+}
+
+#define sha3_512_arch sha3_512_arch
+static bool sha3_512_arch(const u8 *in, size_t in_len,
+			  u8 out[SHA3_512_DIGEST_SIZE])
+{
+	return s390_sha3(CPACF_KLMD_SHA3_512, in, in_len,
+			 out, SHA3_512_DIGEST_SIZE);
+}
+
 #define sha3_mod_init_arch sha3_mod_init_arch
 static void sha3_mod_init_arch(void)
 {
 	int num_present = 0;
 	int num_possible = 0;
@@ -77,12 +133,19 @@ static void sha3_mod_init_arch(void)
 	({ num_present += !!cpacf_query_func(opcode, func); num_possible++; })
 	QUERY(CPACF_KIMD, CPACF_KIMD_SHA3_224);
 	QUERY(CPACF_KIMD, CPACF_KIMD_SHA3_256);
 	QUERY(CPACF_KIMD, CPACF_KIMD_SHA3_384);
 	QUERY(CPACF_KIMD, CPACF_KIMD_SHA3_512);
+	QUERY(CPACF_KLMD, CPACF_KLMD_SHA3_224);
+	QUERY(CPACF_KLMD, CPACF_KLMD_SHA3_256);
+	QUERY(CPACF_KLMD, CPACF_KLMD_SHA3_384);
+	QUERY(CPACF_KLMD, CPACF_KLMD_SHA3_512);
 #undef QUERY
 
-	if (num_present == num_possible)
+	if (num_present == num_possible) {
 		static_branch_enable(&have_sha3);
-	else if (num_present != 0)
+		if (test_facility(86))
+			static_branch_enable(&have_sha3_init_optim);
+	} else if (num_present != 0) {
 		pr_warn("Unsupported combination of SHA-3 facilities\n");
+	}
 }
-- 
2.51.1.dirty


