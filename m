Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FF6C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3TZi5CKzXd7qV7K15RmdAj+4hy/DgAQ7FbOeHCe4d4=; b=PJ8nzuwqcewOSjO4sk+xJsvx70
	sLhGXo42raAL7X/bvz3ND48Yq1Nj9kZ5vD0bPnrJFbfHn475AqNOuhGOoCmX5W0GlukkpxMq3FSkf
	8iYACf/saRU59SDA9RiogzzlsnPzSDFF1diVFejfINsFwAxQXeSsb0y6lThPevSgsHLoWa49AHEN/
	ZkDPMXZibjOb9S3onfCtGd1m08f2x43T3j/AWyCG5XEiYsdpwFaXZrXbvZ0iJLicPTrL8RuP1S6g0
	Z/doH5T1YpGUDjCkAlOPsr/n+vLsEsqe8Rht1+9SPw2C8AuXCkRbEH8G+h/T7vHwZEAb6eRYaWzJj
	K0bEb11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZxD-0000000EmNo-2ChV;
	Fri, 18 Sep 2026 14:52:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zx5-0000000EmJG-2dwa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:52:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF2C54133B;
	Fri, 18 Sep 2026 14:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509911F000FF;
	Fri, 18 Sep 2026 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743153;
	bh=A3TZi5CKzXd7qV7K15RmdAj+4hy/DgAQ7FbOeHCe4d4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C6eccFTK1TzkLv+IwJj3BAZkFXAojLyMM0VVHMvQoBG3uRJqGy0kYPRlmfE/vW4h0
	 nUctiwoTiPz9URBoNgLbB3KgguomBkP6ZbfCAFNGVdmHYLVSln9tQs2ssrQMZIi5tf
	 TkRXB+tie+uwsGU8dkeZsT+WDOLoww5mv+MMTenuiLh9GMldcAVU++Xy9Vjci99CsD
	 Iny1KfzF6yKiejmmn8S7MExeFN734FirIeYDzu8uZXAsty/PHn8crmnq2KmPdKrOQi
	 6W5Nic32mzs1dkQw4LaJZFhZC94bMEXz+6fATg/qvpOuZrP4FibpghjA4oxXCokHoE
	 NlFf7aBMbUcOw==
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
Subject: [PATCH v3 03/13] arm64: crypto: Assume a little-endian kernel
Date: Fri, 18 Sep 2026 15:52:05 +0100
Message-ID: <20260918145217.1669-4-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog


