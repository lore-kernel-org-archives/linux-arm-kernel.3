Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D6EE9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cq6JvtqekX9pexRDvV2sS0XG1YwOwqAN2sh5H5SDn3M=; b=RKTg3YXZUQIjGy7bg5QiDJczNq
	vHD6LXlsUM2T1CWeMf++IL8rKYOiygjPJmhJR+tzE21PHFMiXod7aXDVNjtP3mHT2kQVQtpcAMp9A
	LmZlYdMYf3lepijvJ7i8X/6H2h8KE3eB0ohfY5p/qExs6hfUZ2Wy3OW2rMorhGR1pAP2X6vAA0W9U
	rg1UCsJWqfuOuhYOWb/TPIYHCCXZPGBsB5B8LBfhL1zywyK0CA0Sv69KNR2UnrHrU1ksjh1Adxjq/
	vH5y2Uci7IhJOZL99qLbnYcE6f4cSFQFfDz2av7a4ROizpoYYSVcpS9FMqYptQI7cZTnQ/p4bE33N
	wZ4tN3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspE7-0000000ASQz-2Fp1;
	Wed, 18 Feb 2026 21:36:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspE4-0000000ASOq-2M20
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05AC761863;
	Wed, 18 Feb 2026 21:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3932CC2BC9E;
	Wed, 18 Feb 2026 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450611;
	bh=FLhIcGYigj/cYDh5+twKKz5F+F3mi/gUG7aJ/XLLfTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ROUaJ6P8UlCMN4JmpFGGTRSlivUcHoJGRc+eVoE6kP/DW5Y7YMNqs+roqftoa/gnV
	 ZwDlrMQ693KOcLjlRIMUfS1y7sKUTH1zO1nkVWuEMZY2k2/91AidpDrJw9bPtC3dmR
	 5Udw//bK+DsZUsShJM42cHcB/ciYFKBaq2P+7hNLQSW+D7AVPNldf1i7qhy3dpdD7f
	 gLSPjy1VBwRBR4kssZcgjCV6zH7OxxUqehvbY1cjcC50JWrcPh/ob9W6VyJ0qM73EB
	 cdLoS5E4mBCqNz6ShijoHyLhAfTFL7bE0hPtEeWfjDZw/Kdnkwl8XU9BjxHr6DAXvp
	 iH+hy7FYJaUYg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 03/15] crypto: arm64/aes - Fix 32-bit aes_mac_update() arg treated as 64-bit
Date: Wed, 18 Feb 2026 13:34:49 -0800
Message-ID: <20260218213501.136844-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218213501.136844-1-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
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

Since the 'enc_after' argument to neon_aes_mac_update() and
ce_aes_mac_update() has type 'int', it needs to be accessed using the
corresponding 32-bit register, not the 64-bit register.  The upper half
of the corresponding 64-bit register may contain garbage.

Fixes: 4860620da7e5 ("crypto: arm64/aes - add NEON/Crypto Extensions CBCMAC/CMAC/XCBC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/aes-modes.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/crypto/aes-modes.S b/arch/arm64/crypto/aes-modes.S
index 0e834a2c062c..e793478f37c1 100644
--- a/arch/arm64/crypto/aes-modes.S
+++ b/arch/arm64/crypto/aes-modes.S
@@ -836,11 +836,11 @@ AES_FUNC_START(aes_mac_update)
 	encrypt_block	v0, w2, x1, x7, w8
 	eor		v0.16b, v0.16b, v3.16b
 	encrypt_block	v0, w2, x1, x7, w8
 	eor		v0.16b, v0.16b, v4.16b
 	cmp		w3, wzr
-	csinv		x5, x6, xzr, eq
+	csinv		w5, w6, wzr, eq
 	cbz		w5, .Lmacout
 	encrypt_block	v0, w2, x1, x7, w8
 	st1		{v0.16b}, [x4]			/* return dg */
 	cond_yield	.Lmacout, x7, x8
 	b		.Lmacloop4x
@@ -850,11 +850,11 @@ AES_FUNC_START(aes_mac_update)
 	cbz		w3, .Lmacout
 	ld1		{v1.16b}, [x0], #16		/* get next pt block */
 	eor		v0.16b, v0.16b, v1.16b		/* ..and xor with dg */
 
 	subs		w3, w3, #1
-	csinv		x5, x6, xzr, eq
+	csinv		w5, w6, wzr, eq
 	cbz		w5, .Lmacout
 
 .Lmacenc:
 	encrypt_block	v0, w2, x1, x7, w8
 	b		.Lmacloop
-- 
2.53.0


