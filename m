Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6020CC79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TT541hKGyh+ei1aXxPgKteRsVAhuovdnfEyfNk8AuJ8=; b=4x/vbjNYN4F5GI+cUn9Lzg/LWQ
	fhgBJr50S0wfJJr09qCTLVBjXTsj/NYa+4Ob7+Rqx4hj12V7DlXdJjljgCari+vSjrFlb0X3dXK+K
	KgsZr7ebUWNCFQnrAAmsTnh6sKqD9f4IVKXK95ypClni84g0MO7UrLp+1MXHhp0MTjz9Vt8Pcmm5W
	JghUgqWNcQf5C3S+XXodiLa6cPdVOEUa/R6BsBmpJnfapK1cxt9MZDaBWF8l9W5/rjEbvhdqm40CP
	36IKvfy6+5LVeDkPcjr3Y8lLN6//wmO8Bz3J54VLuI9dzZb1hBRCoT4/KWPpS56njxVZr8FiyHxM0
	SJ49Bqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cLz-00000007Jy2-1QEa;
	Mon, 07 Sep 2026 16:37:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cLx-00000007Jwv-1RK3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:37:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDAF740048;
	Mon,  7 Sep 2026 16:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741AB1F00A3F;
	Mon,  7 Sep 2026 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799072;
	bh=TT541hKGyh+ei1aXxPgKteRsVAhuovdnfEyfNk8AuJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cfkjQWhp9Hr9trinJOMrZTL8kUPE4qIulRsdrA4igFxnzqInJt+5iW+OpPvKgJBoB
	 OekcjCsmQ9ccOtiN0NPAiceILkd9AKrGYbvs1xX/ozYD9k6fWRjgBbsuC2+CMPTQJ5
	 BGxYRWzqLcSUohijRdEOHuRcAhqb+iQ5hqX52Eo9IY96wy3lFaZoNcUJce8e9XXTWE
	 JBizLBq88E/m1CDX+svpmxjBO2+6uDJMpGLKKgECUFeQFbu97upkgHEa02Zomev47E
	 /hiyc+tueHfPwLoCHo2YNAlowdQFrUPafjPEosSN2BkXq8dXmLcHCgBlPvci3xEKiG
	 9XOjp93rj/kWw==
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
Subject: [PATCH v2 04/14] arm64: lib: Assume a little-endian kernel in custom library routines
Date: Mon,  7 Sep 2026 17:37:15 +0100
Message-ID: <20260907163726.17104-5-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog


