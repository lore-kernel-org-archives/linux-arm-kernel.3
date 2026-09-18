Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A0EC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCnnNwKBB0XRywr/Vc3O/6cLu3sgQ2JLHYFPLu8h1J0=; b=ew7WjfD1lMFo5XkosUcJTduqo7
	afti2WImVSe3k23ks8ZW0nuNi8dZpd8k+Aw2zy0ofETZ+VhrhncAQiyTblVRkaAYs/nAzalx0kKsS
	6p7rbui6CJSugk+r00z0tUDKX6nEYdAHbVgEhd92yhvswGdp3v5KzBrx9iDeOd+SX6bMIyornwo08
	sVqtzzAGd4pvUww4Y160flbw4dDgGXKn2P95nWSWGLxVfhx7/hY09aMIuWDp16EXW2bM7J0i7Sp9R
	blSB2QDdkkgJMCSzx5DINWLXz8q0B0flRpbb0U0y5NweOMnhQ9dVoNeMKisP94UJAxQVBdnfHHDNF
	AgpD9xfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZxZ-0000000Emh3-18ej;
	Fri, 18 Sep 2026 14:53:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZxH-0000000EmRs-0oUP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:52:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75B2B6053B;
	Fri, 18 Sep 2026 14:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8F81F000FF;
	Fri, 18 Sep 2026 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743166;
	bh=VCnnNwKBB0XRywr/Vc3O/6cLu3sgQ2JLHYFPLu8h1J0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WRftyuq/RmmC6cW0sRd0VLBJO62mJpS2v4GqQofsAPdZ+sjjCvWVYKjzupCjiQPKq
	 WEYXsmk8XlD+njTl+5J1ak/3mYADK6GHDIvesxTC3D2lKpLS09z5z9sXa14G7ogXuN
	 qOLRW8ttF/vNboxZLtAuDojS3MUrwEHrAO36b5Q+eFq6clx/ly5L1T9olPK8Trx0iO
	 VjB0QpjfoLmTQWf8cCcvcOVkBLSUN/dUMI6GElmdR0SbSijEO+FRYT5tBNaUpU2rT1
	 wNA66bH3tduO9jo/rnDU4JoMlNXg7cEevFEsi8a1Pzd9HTjBf2gMkUzH4fShkwxePH
	 OdJJaJm8j9m7A==
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
Subject: [PATCH v3 07/13] arm64: vdso32: Always build compat vDSO object as little-endian
Date: Fri, 18 Sep 2026 15:52:09 +0100
Message-ID: <20260918145217.1669-8-will@kernel.org>
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

Big-endian support on arm64 depends on BROKEN. In preparation for
removing the dead code altogether, remove support for building a
big-endian 32-bit vDSO.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/vdso32/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index bea3675fa668..00efdc5d2354 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -45,11 +45,7 @@ endif
 # From arm Makefile
 VDSO_CAFLAGS += $(call cc32-option,-fno-dwarf2-cfi-asm)
 VDSO_CAFLAGS += -mabi=aapcs-linux -mfloat-abi=soft
-ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
-VDSO_CAFLAGS += -mbig-endian
-else
 VDSO_CAFLAGS += -mlittle-endian
-endif
 
 # From arm vDSO Makefile
 VDSO_CAFLAGS += -fPIC -fno-builtin -fno-stack-protector
-- 
2.55.0.1082.g2b9226bbc0-goog


