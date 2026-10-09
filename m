Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85BCCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wN9BHkt86Y/qHrXCRuKCB1Rre2zJtJsy9zYh9NyiYs0=; b=x/TvIyyNwmNJszdUMS1XMPrWdo
	mDUcJyEXB3EoL1wwkCAXgxaVqMcgrzgcTXjVVK25lbeDQOrBT3QEZW2FsUdpeHlX4sGOr6QxueiDU
	YxMyD+lb+naNkbn8s1R6z0zB1E0BIiUWuvFZWroM9DVL4tqhUklNsi9dM4RStjUnm9j9LSQPylWp9
	/Mab3gJGINZHt+Nys5gqN4ifAdu7QqTpQmHRNdfwa0WYIJUBcwbBv76gmxiEFp1USy81ihrPmRaZ9
	Ti2yp7diddZaAYC42qFET8lJUGEAPVjbPAqbtLZqKhVBcV1gvmDXQUO/6ur7tCgfr5q4NtqSgR28a
	PImp9gPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA7V-00000006LKt-48oj;
	Fri, 09 Oct 2026 12:54:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA7T-00000006LK8-2ej3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:54:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDBEC60098;
	Fri,  9 Oct 2026 12:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A811F00893;
	Fri,  9 Oct 2026 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791550478;
	bh=wN9BHkt86Y/qHrXCRuKCB1Rre2zJtJsy9zYh9NyiYs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k0TYGnHlpxTrTLdzCPG5DNTnffxT+6cnt/m7A0CJJ70Ad8A+Lt4gbwzsYt+YCY4Ej
	 qaXwzJdtT21dBAGvz2KiZ8iv5VcRzCa0QQRVIWhAeFqa/HdOBMUnyfJChqxea27Y6L
	 NudVqgsDKePcEPPKcWdG7pdC2YcLAmeLN+UuwhDCdEhdqCX6kCocJyRuNdHsOWi8TO
	 D+l9ikOCvt8+xWLOzl8GhzKbAzApxUZIjyLmcIl207FEJLBY0oXCA8ByvtM5SUCRyn
	 KjE2Js9OnMcMZYdk8SWVE8vEX2DFuQt4/lug70IpG3vaR4vNYxqRBn3uAoJIuvLOQo
	 yqA6PemeJuCkw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>,
	stable@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 1/2] lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state
Date: Fri,  9 Oct 2026 14:53:53 +0200
Message-ID: <20261009125354.315476-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009125354.315476-1-ebiggers@kernel.org>
References: <20261009125354.315476-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>

When poly1305_blocks_neon() resumes from a base 2^26 accumulator and the
next update contains an odd number of full 16-byte blocks, it processes
one leading block through poly1305_mult() so that the remaining NEON
work has an even block count.  That requires converting the accumulator
to the base 2^64 form used by poly1305_mult().  The final ADC of that
conversion stores the carry into d2, but the following accumulation and
poly1305_mult() use h2.  If the conversion carries across bit 128, the
carry is dropped and the emitted tag is wrong.

This was introduced by Cryptogams commit 03dc4adf91c8
("arm/poly1305-armv*.pl: optimize branches."), which removed the
reduction that consumed d2 shortly before Linux imported the code.
OpenSSL's copy did not take that change.

The carry is possible because the NEON code stores the accumulator [h0,
h1, h2, h3, h4] in a lazily reduced, redundant base 2^26 form: its final
carry chain leaves h0, h2, h3 < 2^26, but h1 and h4 may slightly exceed
2^26 - 1.  For example, the reachable state

  h0 = 4
  h1 = 2^26
  h2 = 2^26 - 1
  h3 = 2^26 - 1
  h4 = 2^24 - 1

represents 2^128 + 4, so the conversion must produce the base 2^64 limbs
h0 = 4, h1 = 0, h2 = 1.  The low 64-bit word sums to 2^64 + 4 and the
middle 64-bit word (including the carry from the low word) sums to 2^64,
so both carry out.  However, the carry out of the middle word goes to
d2, leaving h2 = 0 and the value 4 instead of 2^128 + 4.

Given the above bounds, a carry across bit 128 happens exactly when
h1 >= 2^26, h2 = h3 = 2^26 - 1, and h4 mod 2^24 = 2^24 - 1.

Store the carry into h2, matching the other base 2^26 to base 2^64
conversions in poly1305_blocks() and poly1305_emit().

This bug causes an incorrect tag to be emitted.  However, this is
unlikely to happen in practice where Poly1305 is used with a random key,
since the random key tends to distribute the accumulator values
throughout their valid range.  There isn't an obvious way for an
attacker without knowledge of the r_key to cause [h0, h1, h2, h3, h4] to
land on the precise values where this bug occurs.

Fixes: f569ca164751 ("crypto: arm64/poly1305 - incorporate OpenSSL/CRYPTOGAMS NEON implementation")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
[EB: Rewrote the commit message to more clearly describe the bug and
 its impact, and removed a lot of pointless LLM-generated text.]
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm64/poly1305-armv8.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crypto/arm64/poly1305-armv8.pl b/lib/crypto/arm64/poly1305-armv8.pl
index f1930c6b55ce..234398ff6b60 100644
--- a/lib/crypto/arm64/poly1305-armv8.pl
+++ b/lib/crypto/arm64/poly1305-armv8.pl
@@ -375,7 +375,7 @@ poly1305_blocks_neon:
 	adc	$h1,$h1,xzr
 	lsr	$h2,x14,#24
 	adds	$h1,$h1,x14,lsl#40
-	adc	$d2,$h2,xzr		// can be partially reduced...
+	adc	$h2,$h2,xzr		// preserve carry into top limb
 
 	ldp	$d0,$d1,[$inp],#16	// load input
 	sub	$len,$len,#16
-- 
2.56.0


