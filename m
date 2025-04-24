Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B582C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 00:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOQ2mFTnrJdrV2RsZTbpPy4bcWl6SKGQirtlmhVtn60=; b=lf3isfHGTAp7NV80EkrPxy8NcO
	RacLYeRymnTWY9GImkuR+vgK/tlITR1/ezzXyrHVa91UymnlPvJ7r3rFjiZemF+0n9KMmhJ76w9bT
	bbm0lL6fLjdAe3cLTfoOVb3cFt1gvG1ckVGGfUGz3ScPyWmCeF5YBR5KbO/itHS59UrzSCwEbYe7y
	hhMk3JuIzeKaJes3Ag0e3/8pHaBnt5lWdtbAJxkSOppaxORZQ0zghp7nAWb8SJRa4+4OXVA52k5yN
	AT4pgGZ3cfruWkvU30LhmMWTOgRibxTmxaeOp1a1DUAplo6UKVMz8oUXczHmlK2VtrOFDVAbyO/Aw
	sBTZk/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kQd-0000000COdL-1pbQ;
	Thu, 24 Apr 2025 00:26:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kMk-0000000CNV7-2jQw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 00:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2B2368457;
	Thu, 24 Apr 2025 00:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7537C4CEEF;
	Thu, 24 Apr 2025 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454177;
	bh=ZFBOXAIbORWsFAkzzgFaWt+AYhGJY5943TVvjBEK2bI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EZFdXsDNHKDVjYnFQcjwii87znh/fjcZYuk8V0+Dilis2HhxXx5CUtgSKZ8IIhVJY
	 uC4QZdK4HYKw+UdierpVnbqCT9PnW2AHOK0qjhITnQQ6HbRWqKY9+lVEnfUMoW/pQI
	 VcxJj1XLtYkfjcP1TKjYXDDOwVzx27aq6ui14XTc5el7CuZ3ltvh5vxjRhtmEnlHfU
	 sozbTANfyT9UNJhMA8vB/sk61/Z8le4TuYgx3kgj4SRGHo6Mij4yQZK42dQASUypxE
	 kI9LQfRwMoLgojv4Km69eD4kAOuH7ZHsbQbibujuJFHHQZuB5UM0QikYsgdEEKK6uU
	 Af2BDEoPXC6pw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 2/7] arm64/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:33 -0700
Message-ID: <20250424002038.179114-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
References: <20250424002038.179114-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

The use of the term "glue" in filenames is a Crypto API-ism that rarely
shows up elsewhere in lib/ or arch/*/lib/.  I think adopting it there
was a mistake.  The library just uses standard functions, so the amount
of code that could be considered "glue" is quite small.  And while often
the C functions just wrap the assembly functions, there are also cases
like crc32c_arch() in arch/x86/lib/crc32-glue.c that blur the line by
in-lining the actual implementation into the C function.  That's not
"glue code", but rather the actual code.

Therefore, let's drop "glue" from the filenames and instead use e.g.
crc32.c instead of crc32-glue.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/Makefile                            | 4 ++--
 arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c} | 0
 arch/arm64/lib/{crc32.S => crc32-core.S}           | 0
 arch/arm64/lib/{crc32-glue.c => crc32.c}           | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/arm64/lib/{crc32.S => crc32-core.S} (100%)
 rename arch/arm64/lib/{crc32-glue.c => crc32.c} (100%)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 4d49dff721a84..d97e290619bc5 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -12,14 +12,14 @@ CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-arm64.o
-crc32-arm64-y := crc32.o crc32-glue.o
+crc32-arm64-y := crc32.o crc32-core.o
 
 obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-arm64.o
-crc-t10dif-arm64-y := crc-t10dif-glue.o crc-t10dif-core.o
+crc-t10dif-arm64-y := crc-t10dif.o crc-t10dif-core.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_ARM64_MTE) += mte.o
 
diff --git a/arch/arm64/lib/crc-t10dif-glue.c b/arch/arm64/lib/crc-t10dif.c
similarity index 100%
rename from arch/arm64/lib/crc-t10dif-glue.c
rename to arch/arm64/lib/crc-t10dif.c
diff --git a/arch/arm64/lib/crc32.S b/arch/arm64/lib/crc32-core.S
similarity index 100%
rename from arch/arm64/lib/crc32.S
rename to arch/arm64/lib/crc32-core.S
diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32.c
similarity index 100%
rename from arch/arm64/lib/crc32-glue.c
rename to arch/arm64/lib/crc32.c
-- 
2.49.0


