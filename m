Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BB6C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XblQenTKByh/WGlZH2USqfcjNnapXaWnf6Z4EXI3wtQ=; b=B47iav0LMwQyNQZDSB0AJ3YT4i
	jAJbHmU7FS/SNsh9TNMaK8dqZmQUZ5Fk5R0HY8rwcfCUeL350jG4eJmWfhY6Ua0qpYEYPK3u0iN/x
	WmQQvSE/eB6rFjFzn0tjOakzwnbfGPFLqONbK877bIqXwjrM6XFxoxKxGvE4+swhRqPJJiAsKu4I5
	HdTNLwhcii1C3wqPwq9f1RiR86Mg4kTPAkPFDjQDxO935JigsC0oQfw4QS6e5IrMy9xqKRaCG0Yh6
	yjYgN0LDxgVzaftgOEGENCnkz1LJbZeOf/jHkAjWHaufH9nhviGr8Ud8nnMLbnMbLYGH76zkKO0Qp
	WddJARTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZxD-0000000EmOA-2gY6;
	Fri, 18 Sep 2026 14:52:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zx7-0000000EmKE-2mtn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:52:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EA2F6022B;
	Fri, 18 Sep 2026 14:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587BE1F008A0;
	Fri, 18 Sep 2026 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743156;
	bh=XblQenTKByh/WGlZH2USqfcjNnapXaWnf6Z4EXI3wtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b+52cop3YZH5UiioN4mykAtd7GAYdP1gg7A1+I1DkCOR6Wzfp6pVg/9DnVfK5BWkd
	 MIxGD2s62ynD6/dfDS6TBK0qyfI6R+m53keA6qwCnN9gQC83C8iIXO4NyZhpjbHI7j
	 8bBXDuKd8dkfYo9g8qiPX5CCURrzTybQNKO73aemVKFOjn55ffYgScPQufL6exCy91
	 FX7xaTgp/1/7ObEN15pa22al/WZigADNVVPQwoxpk0xIlX6Wy+bMb+571Rab9uPBpz
	 06N4Ti0SRJF7elpp5JrRd16UZvhWy7Gy41ma1XRFVX0K1aHZ17fnbFERUW99vxKqEf
	 9uVXoSO89MCqw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 04/13] arm64: lib: Assume a little-endian kernel in custom library routines
Date: Fri, 18 Sep 2026 15:52:06 +0100
Message-ID: <20260918145217.1669-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
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

Commit 5276ea17a23c ("lib/crc: arm64: Assume a little-endian kernel")
removed all usage of the CPU_LE()/CPU_BE() macros from the arm64 CRC
assembly now that big-endian support depends on BROKEN.

Do the same for the rest of the custom arm64 library code, as well as
removing all usage of the '__LITTLE_ENDIAN' macro.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/lib/csum.c   | 17 -----------------
 arch/arm64/lib/memchr.S |  2 +-
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/arm64/lib/csum.c b/arch/arm64/lib/csum.c
index 2432683e48a6..75db718e5b6a 100644
--- a/arch/arm64/lib/csum.c
+++ b/arch/arm64/lib/csum.c
@@ -47,11 +47,7 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	 */
 	shift = offset * 8;
 	data = *ptr++;
-#ifdef __LITTLE_ENDIAN
 	data = (data >> shift) << shift;
-#else
-	data = (data << shift) >> shift;
-#endif
 
 	/*
 	 * Body: straightforward aligned loads from here on (the paired loads
@@ -94,13 +90,8 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 		len -= 16;
 		ptr += 2;
 
-#ifdef __LITTLE_ENDIAN
 		data = tmp >> 64;
 		sum64 = accumulate(sum64, tmp);
-#else
-		data = tmp;
-		sum64 = accumulate(sum64, tmp >> 64);
-#endif
 	}
 	if (len > 0) {
 		sum64 = accumulate(sum64, data);
@@ -112,11 +103,7 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	 * preserving odd/even alignment.
 	 */
 	shift = len * -8;
-#ifdef __LITTLE_ENDIAN
 	data = (data << shift) >> shift;
-#else
-	data = (data >> shift) << shift;
-#endif
 	sum64 = accumulate(sum64, data);
 
 	/* Finally, folding */
@@ -140,11 +127,7 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	dst = *(const __uint128_t *)daddr->s6_addr;
 
 	sum += (__force u32)htonl(len);
-#ifdef __LITTLE_ENDIAN
 	sum += (u32)proto << 24;
-#else
-	sum += proto;
-#endif
 	src += (src >> 64) | (src << 64);
 	dst += (dst >> 64) | (dst << 64);
 
diff --git a/arch/arm64/lib/memchr.S b/arch/arm64/lib/memchr.S
index 37a9f2a4f7f4..b14b27cb8419 100644
--- a/arch/arm64/lib/memchr.S
+++ b/arch/arm64/lib/memchr.S
@@ -63,7 +63,7 @@ L(byte_loop):
 	sub	srcin, srcin, #1
 	ret
 L(found_word):
-CPU_LE(	rev	tmp, tmp)
+	rev	tmp, tmp
 	clz	tmp, tmp
 	sub	tmp, tmp, #64
 	add	result, srcin, tmp, asr #3
-- 
2.55.0.1082.g2b9226bbc0-goog


