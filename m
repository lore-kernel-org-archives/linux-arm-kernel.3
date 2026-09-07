Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E47DC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPrkfAXnyVR+sgg/nvBW0HnQu9CN1G6qPn9X/cZtdc8=; b=j3wS6mdTb/90L58XPzAqDmUqtM
	DfF+1zLXnZYXxAbKZOX8oO1eJMnG6YMS9/wvhpVoa7CguWgLiNMmsuUNIw+69Simltlk7zM0whM/2
	7YTAEIvpbV5ur0ACN+lqLC6ZIZ08fxf32WhyYP3d7W3Oac5uI3gOcPU48dXLyHP177Twx8K0iA71i
	QbDgExmWny0eqeUDdPN6uqkDGTqlWZME3dd3KSs7kBKgt06lWTjDTdC1R6oNw14rC/usdLRpRI2/3
	aZm+1ZZ8IJhAsmsfySpaNQTsyg6fdD/BiNY+JdgqVkrS6AuhflveD6TV7kX0CmkZDl3zVbxFjAROV
	8QKofx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cLw-00000007JwH-12ZV;
	Mon, 07 Sep 2026 16:37:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cLu-00000007JvM-3uIo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:37:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E967601FB;
	Mon,  7 Sep 2026 16:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E1A1F00A3D;
	Mon,  7 Sep 2026 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799069;
	bh=lPrkfAXnyVR+sgg/nvBW0HnQu9CN1G6qPn9X/cZtdc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JXq9/SeANohjjJelBr1h9+h1jcvGFIKikZivAEx270yKOhUq1H3cqMfDkTsf0xF0j
	 uB8g5B7q3bEGtOK6qxsJtM1MqL/lm6O3jNtwdwsALNunbWDtW8CWH2JV5RUfig/jje
	 g5ofEbvI1pH6RCZiHq/1jd0NoIx/krybQIRQtYC7KP/wjU7EXtaLQbticQphfmrVAh
	 EVzla3MToO4W228msz497wKYEGSgaaVDQPMvU/vHjVyKSq/LIUyiY+lko6MJq6NDtf
	 aVQmfHFkTS+iHHh4qHPBVe495I9qVjHJYrCqWeSOaAtryYoUa5N1bo6yq7pG9Ljg1e
	 nnfP3GkFPLm8w==
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
Subject: [PATCH v2 03/14] arm64: crypto: Assume a little-endian kernel
Date: Mon,  7 Sep 2026 17:37:14 +0100
Message-ID: <20260907163726.17104-4-will@kernel.org>
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

Do the same for the crypto assembly code.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/crypto/aes-ce-ccm-core.S    | 4 ++--
 arch/arm64/crypto/aes-neonbs-core.S    | 4 ++--
 arch/arm64/crypto/ghash-ce-core.S      | 6 +++---
 arch/arm64/crypto/sm4-ce-cipher-core.S | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/crypto/aes-ce-ccm-core.S b/arch/arm64/crypto/aes-ce-ccm-core.S
index f2624238fd95..c2e8f500da14 100644
--- a/arch/arm64/crypto/aes-ce-ccm-core.S
+++ b/arch/arm64/crypto/aes-ce-ccm-core.S
@@ -50,7 +50,7 @@
 	ld1	{v0.16b}, [x5]			/* load mac */
 	cbz	x2, ce_aes_ccm_final
 	ldr	x8, [x6, #8]			/* load lower ctr */
-CPU_LE(	rev	x8, x8			)	/* keep swabbed ctr in reg */
+	rev	x8, x8				/* keep swabbed ctr in reg */
 0:	/* outer loop */
 	ld1	{v1.8b}, [x6]			/* load upper ctr */
 	prfm	pldl1strm, [x1]
@@ -73,7 +73,7 @@ CPU_LE(	rev	x8, x8			)	/* keep swabbed ctr in reg */
 	eor	v0.16b, v0.16b, v2.16b		/* xor mac with pt ^ rk[last] */
 	st1	{v6.16b}, [x0], #16		/* write output block */
 	bne	0b
-CPU_LE(	rev	x8, x8			)
+	rev	x8, x8
 	str	x8, [x6, #8]			/* store lsb end of ctr (BE) */
 	cbnz	x7, ce_aes_ccm_final
 	st1	{v0.16b}, [x5]			/* store mac */
diff --git a/arch/arm64/crypto/aes-neonbs-core.S b/arch/arm64/crypto/aes-neonbs-core.S
index baf450717b24..ba1f981a5464 100644
--- a/arch/arm64/crypto/aes-neonbs-core.S
+++ b/arch/arm64/crypto/aes-neonbs-core.S
@@ -824,8 +824,8 @@ SYM_FUNC_START(aesbs_ctr_encrypt)
 	frame_push	0
 	ldp		x7, x8, [x5]
 	ld1		{v0.16b}, [x5]
-CPU_LE(	rev		x7, x7		)
-CPU_LE(	rev		x8, x8		)
+	rev		x7, x7
+	rev		x8, x8
 	adds		x8, x8, #1
 	adc		x7, x7, xzr
 
diff --git a/arch/arm64/crypto/ghash-ce-core.S b/arch/arm64/crypto/ghash-ce-core.S
index 33772d8fe6b5..ba350d57fc76 100644
--- a/arch/arm64/crypto/ghash-ce-core.S
+++ b/arch/arm64/crypto/ghash-ce-core.S
@@ -148,7 +148,7 @@ SYM_FUNC_START(pmull_ghash_update_p64)
 	sub		w0, w0, #1
 
 3:	/* multiply XL by SHASH in GF(2^128) */
-CPU_LE(	rev64		T1.16b, T1.16b	)
+	rev64		T1.16b, T1.16b
 
 	ext		T2.16b, XL.16b, XL.16b, #8
 	ext		IN1.16b, T1.16b, T1.16b, #8
@@ -272,7 +272,7 @@ SYM_FUNC_END(pmull_ghash_update_p64)
 	cbz		x0, 3f				// tag only?
 
 	ldr		w8, [x5, #12]			// load lower counter
-CPU_LE(	rev		w8, w8		)
+	rev		w8, w8
 
 0:	mov		w9, #4				// max blocks per round
 	add		x10, x0, #0xf
@@ -380,7 +380,7 @@ CPU_LE(	rev		w8, w8		)
 	ret
 
 5:
-CPU_LE(	rev		w8, w8		)
+	rev		w8, w8
 	str		w8, [x5, #12]			// store lower counter
 	st1		{XL.2d}, [x4]
 	b		4b
diff --git a/arch/arm64/crypto/sm4-ce-cipher-core.S b/arch/arm64/crypto/sm4-ce-cipher-core.S
index 4ac6cfbc5797..1682d727e097 100644
--- a/arch/arm64/crypto/sm4-ce-cipher-core.S
+++ b/arch/arm64/crypto/sm4-ce-cipher-core.S
@@ -18,7 +18,7 @@
 SYM_FUNC_START(sm4_ce_do_crypt)
 	ld1		{v8.4s}, [x2]
 	ld1		{v0.4s-v3.4s}, [x0], #64
-CPU_LE(	rev32		v8.16b, v8.16b		)
+	rev32		v8.16b, v8.16b
 	ld1		{v4.4s-v7.4s}, [x0]
 	sm4e		v8.4s, v0.4s
 	sm4e		v8.4s, v1.4s
@@ -30,7 +30,7 @@ CPU_LE(	rev32		v8.16b, v8.16b		)
 	sm4e		v8.4s, v7.4s
 	rev64		v8.4s, v8.4s
 	ext		v8.16b, v8.16b, v8.16b, #8
-CPU_LE(	rev32		v8.16b, v8.16b		)
+	rev32		v8.16b, v8.16b
 	st1		{v8.4s}, [x1]
 	ret
 SYM_FUNC_END(sm4_ce_do_crypt)
-- 
2.55.0.979.g7e5102b832-goog


