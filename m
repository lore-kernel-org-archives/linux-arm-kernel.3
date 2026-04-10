Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FDCF4484F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=nAtajafR3BGugPFTQaw0hsS1PwnKW5jZr3s/Jt7L67s=; b=dWf1kwNtZiC6XO
	UfELE3tPfQ4DW55tMi8NPG4o1Cqrzvve0r0S47GOxnpKzmUR5Kr2zJ6qdHnPshtzRMuXLsfhp24hl
	hZrFGhQGbapqoHnNZSWAnaxn3PLXOZpROrbW8o6lY+RUlcGDkj4ZDLGg59zLfQ3iTr0CO6iCpB/mg
	vxUD0s4Kforl4DzMgDUaO+SLVx/FYXmKKBy8aRVqF70lNaslXEYNS8mMZpEJ6Ab08ePAriQ8pmTDa
	WdPvYom3mkPHuYs90pnG7o4JD1Rur2s/J5TUGpkAAJV4jQ7vMjE5TguSlnvXxnG+8H/XCcVguSea5
	oKQMb61xPmEPPXAqdDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApq-0000000CAEy-19Nt;
	Fri, 10 Apr 2026 12:19:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApk-0000000CA61-0BwW;
	Fri, 10 Apr 2026 12:19:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E85B4415B;
	Fri, 10 Apr 2026 12:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D535C19421;
	Fri, 10 Apr 2026 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823575;
	bh=GB9a/XQKSHIwV9FYvefMOZoOdepkVaVbWcUyHQeAJMw=;
	h=Date:From:To:Cc:Subject:References:From;
	b=kdLSbwwLxIuQWDxnaQ43x3JS9cXZHSMpULEhhU8ID9ECY5jS+n7m20CMk0YroM4U5
	 D4FjOptptOJeolxHIofJ3rTeQ/ALPjLpvnJ7Qi7NqzIwHDqURUXi9DJGGx8dZS+lLk
	 JCAzGIYvaKballV64My3qHcmSE8ptIN1eu7xnjzlOO9PgVdkDRLJV0RvV58tiiKr4i
	 bv+wJwmXD1eqFR2U5N9wMLLyoNfqxlEArSV4W94QZ6qgCudbzRKlUn/CHtSVarPoCX
	 xb06JWRkDGSiFGx6qUkcv+KUlCb5xHLy85m3KWHYpSlfnAmYw64l8Tsoi4lMULg/pB
	 WwpH4H0qB6HQQ==
Date: Fri, 10 Apr 2026 14:19:31 +0200
Message-ID: <20260410120318.454577282@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 13/38] crypto: tcrypt: Replace get_cycles() with ktime_get()
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_051936_179463_3454D86A 
X-CRM114-Status: GOOD (  18.21  )
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

get_cycles() is the historical access to a fine grained time source, but it
is a suboptimal choice for two reasons:

   - get_cycles() is not guaranteed to be supported and functional on all
     systems/platforms. If not supported or not functional it returns 0,
     which makes benchmarking moot.

   - get_cycles() returns the raw counter value of whatever the
     architecture platform provides. The original x86 Time Stamp Counter
     (TSC) was despite its name tied to the actual CPU core frequency.
     That's not longer the case. So the counter value is only meaningful
     when the CPU operates at the same frequency as the TSC or the value is
     adjusted to the actual CPU frequency. Other architectures and
     platforms provide similar disjunct counters via get_cycles(), so the
     result is operations per BOGO-cycles, which is not really meaningful.

Use ktime_get() instead which provides nanosecond timestamps with the
granularity of the underlying hardware counter, which is not different to
the variety of get_cycles() implementations.

This provides at least understandable metrics, i.e. operations/nanoseconds,
and is available on all platforms. As with get_cycles() the result might
have to be put into relation with the CPU operating frequency, but that's
not any different.

This is part of a larger effort to remove get_cycles() usage from
non-architecture code.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org
---
 crypto/tcrypt.c |   84 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

--- a/crypto/tcrypt.c
+++ b/crypto/tcrypt.c
@@ -202,7 +202,7 @@ static int test_mb_aead_jiffies(struct t
 static int test_mb_aead_cycles(struct test_mb_aead_data *data, int enc,
 			       int blen, u32 num_mb)
 {
-	unsigned long cycles = 0;
+	unsigned long nsecs = 0;
 	int ret = 0;
 	int i;
 	int *rc;
@@ -220,20 +220,20 @@ static int test_mb_aead_cycles(struct te
 
 	/* The real thing. */
 	for (i = 0; i < 8; i++) {
-		cycles_t start, end;
+		ktime_t start, end;
 
-		start = get_cycles();
+		start = ktime_get();
 		ret = do_mult_aead_op(data, enc, num_mb, rc);
-		end = get_cycles();
+		end = ktime_get();
 
 		if (ret)
 			goto out;
 
-		cycles += end - start;
+		nsecs += (unsigned long)(end - start);
 	}
 
-	pr_cont("1 operation in %lu cycles (%d bytes)\n",
-		(cycles + 4) / (8 * num_mb), blen);
+	pr_cont("1 operation in %lu nsecs (%d bytes)\n",
+		nsecs / (8 * num_mb), blen);
 
 out:
 	kfree(rc);
@@ -475,7 +475,7 @@ static int test_aead_jiffies(struct aead
 
 static int test_aead_cycles(struct aead_request *req, int enc, int blen)
 {
-	unsigned long cycles = 0;
+	unsigned long nsecs = 0;
 	int ret = 0;
 	int i;
 
@@ -492,25 +492,24 @@ static int test_aead_cycles(struct aead_
 
 	/* The real thing. */
 	for (i = 0; i < 8; i++) {
-		cycles_t start, end;
+		ktime_t start, end;
 
-		start = get_cycles();
+		start = ktime_get();
 		if (enc)
 			ret = do_one_aead_op(req, crypto_aead_encrypt(req));
 		else
 			ret = do_one_aead_op(req, crypto_aead_decrypt(req));
-		end = get_cycles();
+		end = ktime_get();
 
 		if (ret)
 			goto out;
 
-		cycles += end - start;
+		nsecs += (unsigned long)(end - start);
 	}
 
 out:
 	if (ret == 0)
-		pr_cont("1 operation in %lu cycles (%d bytes)\n",
-			(cycles + 4) / 8, blen);
+		pr_cont("1 operation in %lu nsecs (%d bytes)\n", nsecs / 8, blen);
 
 	return ret;
 }
@@ -771,7 +770,7 @@ static int test_ahash_jiffies(struct aha
 static int test_ahash_cycles_digest(struct ahash_request *req, int blen,
 				    char *out)
 {
-	unsigned long cycles = 0;
+	unsigned long nsecs = 0;
 	int ret, i;
 
 	/* Warm-up run. */
@@ -783,25 +782,25 @@ static int test_ahash_cycles_digest(stru
 
 	/* The real thing. */
 	for (i = 0; i < 8; i++) {
-		cycles_t start, end;
+		ktime_t start, end;
 
-		start = get_cycles();
+		start = ktime_get();
 
 		ret = do_one_ahash_op(req, crypto_ahash_digest(req));
 		if (ret)
 			goto out;
 
-		end = get_cycles();
+		end = ktime_get();
 
-		cycles += end - start;
+		nsecs += (unsigned long)(end - start);
 	}
 
 out:
 	if (ret)
 		return ret;
 
-	pr_cont("%6lu cycles/operation, %4lu cycles/byte\n",
-		cycles / 8, cycles / (8 * blen));
+	pr_cont("%6lu nsecs/operation, %4lu nsecs/byte\n",
+		nsecs / 8, nsecs / (8 * blen));
 
 	return 0;
 }
@@ -809,7 +808,7 @@ static int test_ahash_cycles_digest(stru
 static int test_ahash_cycles(struct ahash_request *req, int blen,
 			     int plen, char *out)
 {
-	unsigned long cycles = 0;
+	unsigned long nsecs = 0;
 	int i, pcount, ret;
 
 	if (plen == blen)
@@ -832,9 +831,9 @@ static int test_ahash_cycles(struct ahas
 
 	/* The real thing. */
 	for (i = 0; i < 8; i++) {
-		cycles_t start, end;
+		ktime_t start, end;
 
-		start = get_cycles();
+		start = ktime_get();
 
 		ret = do_one_ahash_op(req, crypto_ahash_init(req));
 		if (ret)
@@ -848,17 +847,17 @@ static int test_ahash_cycles(struct ahas
 		if (ret)
 			goto out;
 
-		end = get_cycles();
+		end = ktime_get();
 
-		cycles += end - start;
+		nsecs += (unsigned long)(end - start);
 	}
 
 out:
 	if (ret)
 		return ret;
 
-	pr_cont("%6lu cycles/operation, %4lu cycles/byte\n",
-		cycles / 8, cycles / (8 * blen));
+	pr_cont("%6lu nsecs/operation, %4lu nsecs/byte\n",
+		nsecs / 8, nsecs / (8 * blen));
 
 	return 0;
 }
@@ -1019,7 +1018,7 @@ static int test_mb_acipher_jiffies(struc
 static int test_mb_acipher_cycles(struct test_mb_skcipher_data *data, int enc,
 			       int blen, u32 num_mb)
 {
-	unsigned long cycles = 0;
+	unsigned long nsecs = 0;
 	int ret = 0;
 	int i;
 	int *rc;
@@ -1037,20 +1036,20 @@ static int test_mb_acipher_cycles(struct
 
 	/* The real thing. */
 	for (i = 0; i < 8; i++) {
-		cycles_t start, end;
+		ktime_t start, end;
 
-		start = get_cycles();
+		start = ktime_get();
 		ret = do_mult_acipher_op(data, enc, num_mb, rc);
-		end = get_cycles();
+		end = ktime_get();
 
 		if (ret)
 			goto out;
 
-		cycles += end - start;
+		nsecs += (unsigned long)(end - start);
 	}
 
-	pr_cont("1 operation in %lu cycles (%d bytes)\n",
-		(cycles + 4) / (8 * num_mb), blen);
+	pr_cont("1 operation in %lu nsecs (%d bytes)\n",
+		nsecs / (8 * num_mb), blen);
 
 out:
 	kfree(rc);
@@ -1246,7 +1245,7 @@ static int test_acipher_jiffies(struct s
 static int test_acipher_cycles(struct skcipher_request *req, int enc,
 			       int blen)
 {
-	unsigned long cycles = 0;
+	unsigned long nsecs = 0;
 	int ret = 0;
 	int i;
 
@@ -1265,27 +1264,28 @@ static int test_acipher_cycles(struct sk
 
 	/* The real thing. */
 	for (i = 0; i < 8; i++) {
-		cycles_t start, end;
+		ktime_t start, end;
+
+		start = ktime_get();
 
-		start = get_cycles();
 		if (enc)
 			ret = do_one_acipher_op(req,
 						crypto_skcipher_encrypt(req));
 		else
 			ret = do_one_acipher_op(req,
 						crypto_skcipher_decrypt(req));
-		end = get_cycles();
+		end = ktime_get();
 
 		if (ret)
 			goto out;
 
-		cycles += end - start;
+		nsecs += (unsigned long)(end - start);
 	}
 
 out:
 	if (ret == 0)
-		pr_cont("1 operation in %lu cycles (%d bytes)\n",
-			(cycles + 4) / 8, blen);
+		pr_cont("1 operation in %lu nsecs (%d bytes)\n",
+			nsecs / 8, blen);
 
 	return ret;
 }


