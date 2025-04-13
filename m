Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CEAC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 05:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dxNG1C6BKTk+JwpAc0vXAIATHvUqCHfYjRvMQl1234=; b=bwa25n14oKEyi9j9ztGkOZpZno
	xh3S2jnZy0UISg/mGTbPt9r7YJG8vyH6flBaNkMQGXKY3EK5iRbnr0uprwTfQ1FFr1V/AhsN2rU2u
	2Sq9dXVoOKw3cGGx9mvX+tOqYBCKFmqoEicZVKJfzm9bXPBg7UbNAQPlutosViNvdi30CVnraN1/4
	aBH44i4M9ZaYhoeuuJvNn5Ki9CsdWJIAQlAXllHcRJtdslknRJ3NwlmlaEfM1b+SE4l0hFL+GYC81
	7OXM+Z+iMFqPJEr5cwFHNnPTa/hBe/Lw/S30lB8qXL4BOAvS4Lq66TV8AsbknIx9fWvz0VxwfcTlY
	1BJR5tCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3pdb-0000000GpEB-08GV;
	Sun, 13 Apr 2025 05:12:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3pNg-0000000Gnio-31qZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 04:55:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 802F84A377;
	Sun, 13 Apr 2025 04:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED062C4CEE5;
	Sun, 13 Apr 2025 04:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520144;
	bh=Pjh4oxagSvmSLpMze4F+AJtO3zI0zTnD0Z/7n/bgK3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VPbt2eYHx4ya3q///NGVA+AfQZlakY1oxpGQeb7fGWngp5KXaZC77Br8qfTNiMxOF
	 a0yRZBbFGdP0Ge1p6UvtaE6HpdagU5RcBH8PHsYZznsnc2E+5GSoTGtWjUf5BOZ38d
	 xl2D4cTxo/C6gD3zEbMcY7RGKWgmJvMhxQeyfrpqf8TkMCykFbw0CDhQ/NqWpVSvKr
	 whrKmS6Y3bYwNpgL8SBOl/zDxkVdM8YcH0r540WTf3WAXoTLcnZtbXa6mDy47x6n5t
	 TXob2tBZQ8oVEVJrwPDVxV28rDMGu4vb5MvlT5HCoNUlqboVAlJNnupjCvQN8jVi1+
	 TFmIPLUmM5/Hg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 8/9] crypto: x86/poly1305 - don't select CRYPTO_LIB_POLY1305_GENERIC
Date: Sat, 12 Apr 2025 21:54:20 -0700
Message-ID: <20250413045421.55100-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_215544_818072_0F40DFE7 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

From: Eric Biggers <ebiggers@google.com>

The x86 Poly1305 code never falls back to the generic code, so selecting
CRYPTO_LIB_POLY1305_GENERIC is unnecessary.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 31804dacf9a4..a25765186ba3 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -397,11 +397,10 @@ config CRYPTO_POLYVAL_CLMUL_NI
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
 config CRYPTO_POLY1305_X86_64
 	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_LIB_POLY1305_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_SHA1_SSSE3
 	tristate "Hash functions: SHA-1 (SSSE3/AVX/AVX2/SHA-NI)"
-- 
2.49.0


