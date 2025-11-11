Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B160CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4uJ2KWoH7hRkbuzlty8vRN8S3jibYNZfKfT0tHIn+eQ=; b=sUzVyLZmGowI5d6pFP4CdaTJqD
	kwQShbaZa0l+e5HHK+2h17fZ7eGCTXlfOpZn3LCX2lyiGfCIxi6LvBbzj5TTyuukXDUHBKIXmSOL5
	thqaJhnJki3ekNg/7onfRras7rbr2EdIFEngrnoMb6mUpZm0Wv9UOcmrS4OLu9KS0ixoe2YoV0IHP
	VVWfLS8kaYQK6nvYFEx9LAy1FfcQSAsPLBDHX7+OSzlTyK0RKPNHQr9qqhLy1yxB3hsKYOQeYfiWh
	3dp8qshYf5ORwH3DzEEPL1IanhYMQH4KTVtwcOkh41izY6B/8f6gVcZG4rgyHliXtk19+tHu9uORL
	HREKwpiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1U-00000007kDB-35Rg;
	Tue, 11 Nov 2025 20:31:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1S-00000007kCO-2KP2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A64E560208;
	Tue, 11 Nov 2025 20:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B71FC19423;
	Tue, 11 Nov 2025 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762893085;
	bh=bly4iXqvvGSqP2zva08xAO/t5sO1S1gbYfphuK+S/ec=;
	h=From:To:Cc:Subject:Date:From;
	b=ei7Q/qk0R0mmpdaOxiO3omdVfpWKYUMSjz5LUacfFhMM4mJi7kpe4amn5MQNPXTYn
	 xDaWtx+TZ7FTiEbS5s28IyebSi0KIqcjcCEhn6D9UalV2ZDeKuJqeZpyek7LZrAdso
	 H8ZeX5f7x1Lxtkq6B03W0ujoGflYSLIoKGzmcwHAsGXz9gnFCQFgIoKoh64ynFI6H5
	 fnSv0FRuXlyqjjUraqoVYsOQrnafWbkzomlznPpv19I9LWJ6Hv0a+ycAee6z4T+/tC
	 upqyryOTt1yQThRueHua0AVcrCJugln5ZKjZrBt1GbnqlopRmNOvAsGpDynWyYO4IA
	 W1KtPPbosVFug==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 6.1] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Date: Tue, 11 Nov 2025 12:29:44 -0800
Message-ID: <20251111202944.242946-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
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

commit 44e8241c51f762aafa50ed116da68fd6ecdcc954 upstream.

On big endian arm kernels, the arm optimized Curve25519 code produces
incorrect outputs and fails the Curve25519 test.  This has been true
ever since this code was added.

It seems that hardly anyone (or even no one?) actually uses big endian
arm kernels.  But as long as they're ostensibly supported, we should
disable this code on them so that it's not accidentally used.

Note: for future-proofing, use !CPU_BIG_ENDIAN instead of
CPU_LITTLE_ENDIAN.  Both of these are arch-specific options that could
get removed in the future if big endian support gets dropped.

Fixes: d8f1308a025f ("crypto: arm/curve25519 - wire up NEON implementation")
Cc: stable@vger.kernel.org
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/r/20251104054906.716914-1-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 3858c4d4cb98..f6323b84631f 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
 config CRYPTO_CURVE25519_NEON
 	tristate "Public key crypto: Curve25519 (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 

base-commit: f6e38ae624cf7eb96fb444a8ca2d07caa8d9c8fe
-- 
2.51.2


