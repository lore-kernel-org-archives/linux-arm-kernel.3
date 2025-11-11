Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01285CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SsR099kR0cP5eTT+Qig+tknKJWd0v+Y3iJTtJ9lH2rA=; b=btuJPizD6kmo/g3xSGDsVdUfxW
	D60CBkFJkupf58391ozdxIrdPj0b826JlSLbiQcKp8RmTylauzPvDRSsehsP5uytkZdH+q7ErvlMc
	Nhwq0+N0prFQXsJGk9cl/t19kp/PV6nNaaepuV8I3jUw85QpL7RH4LPHCN1OzUT5xf+xaJZbg+9+6
	+qwT6Clc1nb/42/KAfAlms3MPxWNYJEXCTKpBwwpa6wdocFnTIrSNHkT/RYV9boBUMCDvMFn6qaf4
	ClZ2WA/kzpYGewLpGJ5+T9xd65E1HUC+XXc9x/kCM3M4nWhUFW1BtnO8dimTdUT07ywFlsneK6tQ4
	gvC4+pMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1Q-00000007kC5-0YzK;
	Tue, 11 Nov 2025 20:31:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1J-00000007kB0-1REe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:31:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAAF943EBF;
	Tue, 11 Nov 2025 20:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1DFC4CEF5;
	Tue, 11 Nov 2025 20:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762893074;
	bh=ADQaa9sHdyu7ZOrKR4J4rnxR26WrlTbpv0rZh7Rvzs4=;
	h=From:To:Cc:Subject:Date:From;
	b=Mu73vyL98SfZbW0XLaL1lLDHzfv7CD2IRJog7hFqXanRFkE3u144BBpJ02Kq6DbZl
	 rcko2K3NWUxAJceXeZOLHAQ1Gg+RMtOsNrPrAIANiZYy9Bo+PBpvSLnBdxWXf0mKpr
	 CRpS6prtnd23Fm15F2aHyqe3gAYn2fJs4dS02MaliAdNz+2oL/9MiMq47YOqY9zMsF
	 zgPrAwGd/hObzqyDmK6vhyZmi9hfrbLgDJpi86KhYBmE1qt9GR5RFhDJrjYcuxmltE
	 BPlMEhYvxYOlb8Bxemv2UL/Cgfroe4VoMYWD8TvTS/RbS7091gjInmzPsAnKEHQDmi
	 I4BEWVVp0U06Q==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 6.17] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Date: Tue, 11 Nov 2025 12:29:23 -0800
Message-ID: <20251111202923.242700-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_123117_426411_760AC688 
X-CRM114-Status: GOOD (  11.96  )
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
index 1e5f3cdf691c..a00ab9265280 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
 config CRYPTO_CURVE25519_NEON
 	tristate
-	depends on KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
 	select CRYPTO_KPP
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help

base-commit: 7660ce69123ea73b22930fcf20d995ad310049ef
-- 
2.51.2


