Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B641075261
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 06:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33KTucnLU+VJdkf+Koy62bkJyMfrD+/Fe3LqzQr7h5I=; b=wbqughMP00JMDT9bfywexhj0XO
	AMNKKo5RgoMj/ZUshEV+zLdBAOMg1HNrVnCec+mApLB11Z5vEAPOmKrMRgPG7TZW8ByZkkcU4tRqN
	VQP2DosZqNVHg91SpL9wr5YqDe46o2uN8cqMcAdtEuF/WXlIImbb4vTsjCdx9QTjkhX2bwd8lDlHw
	GFsOYYC5mIhCEpfc9+MPSE4s+sLtlGCW/fKvGhLPJPYH12E9TBFILU93vFEwWMGj86NcB2AuA/qm6
	mKWEDVkopc4U+xrSN0uP88dkoFxmfxRv070UxDm14xddHafKK2gmVKMoEDRcRfV+ndwqZFr/D/wIq
	oT2kSJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36kb-0000000A1XQ-3ztg;
	Thu, 19 Mar 2026 06:20:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36j5-00000009zp0-1fA5;
	Thu, 19 Mar 2026 06:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 064BF44720;
	Thu, 19 Mar 2026 06:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78620C2BCB3;
	Thu, 19 Mar 2026 06:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773901162;
	bh=mTRLUTdGzhcdizBLZYtXG0wi5TCm65S4qlvgr+wYUYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qUjaGrt7RFDnbK+cIlqFbgJnk6RjjiIP4nOUXjksgVsooOttsP6ts10f9DTl8O1LL
	 fltmBuZVfF4AgTiJWgwJpoljMMtZvb1kGG1F8wwoAvdwrtEKtC+mdAi2Ie7ox16kJ0
	 aPxVeBkcYFwJLXZB2NkYHm93FvphnZNvhSEZ1qO6kngwuTmb64LuUjgHg3brwwDaVz
	 rvUSK30xdWlSDu5/JM8w8gPwvKmXljbiOQiOhp7P9c5k91Qe88X67tUuicrNsDvd7e
	 X9JHCcVGW72qMY4IPT8WssLvoWtjXoBYf8FZoAx4HmznfMi6YdscUdMDOR1zRH+lfJ
	 cMpc+5cqAOd/A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 17/19] lib/crypto: gf128mul: Remove unused 4k_lle functions
Date: Wed, 18 Mar 2026 23:17:18 -0700
Message-ID: <20260319061723.1140720-18-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319061723.1140720-1-ebiggers@kernel.org>
References: <20260319061723.1140720-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_231923_855546_B7E2AB44 
X-CRM114-Status: GOOD (  18.81  )
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

Remove the 4k_lle multiplication functions and the associated
gf128mul_table_le data table.  Their only user was the generic
implementation of GHASH, which has now been changed to use a different
implementation based on standard integer multiplication.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/gf128mul.h | 17 ++-------
 lib/crypto/gf128mul.c     | 73 +--------------------------------------
 2 files changed, 4 insertions(+), 86 deletions(-)

diff --git a/include/crypto/gf128mul.h b/include/crypto/gf128mul.h
index b0853f7cada0..6ed2a8351902 100644
--- a/include/crypto/gf128mul.h
+++ b/include/crypto/gf128mul.h
@@ -213,29 +213,18 @@ static inline void gf128mul_x_ble(le128 *r, const le128 *x)
 
 	r->a = cpu_to_le64((a << 1) | (b >> 63));
 	r->b = cpu_to_le64((b << 1) ^ _tt);
 }
 
-/* 4k table optimization */
-
-struct gf128mul_4k {
-	be128 t[256];
-};
-
-struct gf128mul_4k *gf128mul_init_4k_lle(const be128 *g);
-void gf128mul_4k_lle(be128 *a, const struct gf128mul_4k *t);
 void gf128mul_x8_ble(le128 *r, const le128 *x);
-static inline void gf128mul_free_4k(struct gf128mul_4k *t)
-{
-	kfree_sensitive(t);
-}
-
 
 /* 64k table optimization, implemented for bbe */
 
 struct gf128mul_64k {
-	struct gf128mul_4k *t[16];
+	struct {
+		be128 t[256];
+	} *t[16];
 };
 
 /* First initialize with the constant factor with which you
  * want to multiply and then call gf128mul_64k_bbe with the other
  * factor in the first argument, and the table in the second.
diff --git a/lib/crypto/gf128mul.c b/lib/crypto/gf128mul.c
index e5a727b15f07..7ebf07ce1168 100644
--- a/lib/crypto/gf128mul.c
+++ b/lib/crypto/gf128mul.c
@@ -125,31 +125,13 @@
 	(i & 0x20 ? 0x3840 : 0) ^ (i & 0x10 ? 0x1c20 : 0) ^ \
 	(i & 0x08 ? 0x0e10 : 0) ^ (i & 0x04 ? 0x0708 : 0) ^ \
 	(i & 0x02 ? 0x0384 : 0) ^ (i & 0x01 ? 0x01c2 : 0) \
 )
 
-static const u16 gf128mul_table_le[256] = gf128mul_dat(xda_le);
 static const u16 gf128mul_table_be[256] = gf128mul_dat(xda_be);
 
-/*
- * The following functions multiply a field element by x^8 in
- * the polynomial field representation.  They use 64-bit word operations
- * to gain speed but compensate for machine endianness and hence work
- * correctly on both styles of machine.
- */
-
-static void gf128mul_x8_lle(be128 *x)
-{
-	u64 a = be64_to_cpu(x->a);
-	u64 b = be64_to_cpu(x->b);
-	u64 _tt = gf128mul_table_le[b & 0xff];
-
-	x->b = cpu_to_be64((b >> 8) | (a << 56));
-	x->a = cpu_to_be64((a >> 8) ^ (_tt << 48));
-}
-
-/* time invariant version of gf128mul_x8_lle */
+/* A table-less implementation of multiplying by x^8 */
 static void gf128mul_x8_lle_ti(be128 *x)
 {
 	u64 a = be64_to_cpu(x->a);
 	u64 b = be64_to_cpu(x->b);
 	u64 _tt = xda_le(b & 0xff); /* avoid table lookup */
@@ -303,60 +285,7 @@ void gf128mul_64k_bbe(be128 *a, const struct gf128mul_64k *t)
 		be128_xor(r, r, &t->t[i]->t[ap[15 - i]]);
 	*a = *r;
 }
 EXPORT_SYMBOL(gf128mul_64k_bbe);
 
-/*      This version uses 4k bytes of table space.
-    A 16 byte buffer has to be multiplied by a 16 byte key
-    value in GF(2^128).  If we consider a GF(2^128) value in a
-    single byte, we can construct a table of the 256 16 byte
-    values that result from the 256 values of this byte.
-    This requires 4096 bytes. If we take the highest byte in
-    the buffer and use this table to get the result, we then
-    have to multiply by x^120 to get the final value. For the
-    next highest byte the result has to be multiplied by x^112
-    and so on. But we can do this by accumulating the result
-    in an accumulator starting with the result for the top
-    byte.  We repeatedly multiply the accumulator value by
-    x^8 and then add in (i.e. xor) the 16 bytes of the next
-    lower byte in the buffer, stopping when we reach the
-    lowest byte. This requires a 4096 byte table.
-*/
-struct gf128mul_4k *gf128mul_init_4k_lle(const be128 *g)
-{
-	struct gf128mul_4k *t;
-	int j, k;
-
-	t = kzalloc_obj(*t);
-	if (!t)
-		goto out;
-
-	t->t[128] = *g;
-	for (j = 64; j > 0; j >>= 1)
-		gf128mul_x_lle(&t->t[j], &t->t[j+j]);
-
-	for (j = 2; j < 256; j += j)
-		for (k = 1; k < j; ++k)
-			be128_xor(&t->t[j + k], &t->t[j], &t->t[k]);
-
-out:
-	return t;
-}
-EXPORT_SYMBOL(gf128mul_init_4k_lle);
-
-void gf128mul_4k_lle(be128 *a, const struct gf128mul_4k *t)
-{
-	u8 *ap = (u8 *)a;
-	be128 r[1];
-	int i = 15;
-
-	*r = t->t[ap[15]];
-	while (i--) {
-		gf128mul_x8_lle(r);
-		be128_xor(r, r, &t->t[ap[i]]);
-	}
-	*a = *r;
-}
-EXPORT_SYMBOL(gf128mul_4k_lle);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Functions for multiplying elements of GF(2^128)");
-- 
2.53.0


