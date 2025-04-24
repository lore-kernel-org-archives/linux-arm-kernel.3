Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEA1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 00:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOhunbJeWZvAeePiPw3xwCzd9xnHT/WhPCzv+Hlhj4U=; b=Cq3HLq/7rqbiuXsPYpa4aWqHsN
	y/d4CBpso1zbZcV3eC3gJPZvle7+1aJfXMvSEp+KgXQT/CbxoXbFTFoZUJolaQpSyls31UtQvWeFs
	yLRAFPHoS6Ej+D1Lqo2UM26z64mG3pUsZy4wJUJUl2jeg6KKjxVm7cZKlvadAB2fs9F1ddYpQqzyN
	m7uThg5D1raNRMMBri+J2Sts1s8xSbQj+LDdXpUKFVjQhFBet2uQcbX8zZzYlZsgsS2yWJ1eBrO/y
	/6sO7+HNDZWuETGXN7R7AI8J4yOyTZ+OL1NV5W5ILvIfPRCP68DsLWpEee50Np6l8uvaSkOfrhEaw
	70+hWH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kWU-0000000CPSI-2RRy;
	Thu, 24 Apr 2025 00:33:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kMm-0000000CNWD-0Xjl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 00:23:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 330CF68463;
	Thu, 24 Apr 2025 00:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EE9C4CEED;
	Thu, 24 Apr 2025 00:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454179;
	bh=D5NU9FcmxKmWEA4XREu5in+DNWt9OzzrzEJU/bEgaCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N0PKp1HXIMY3OYdi0+QNxtbOKYvHDj+XNZMJxgb4MF3xoXe6ZeLHMKvvC4RZIH4qO
	 i0tZYXuMUm/aKFnMCifDJ/wwpNleHgIV1Krt4I9CKcqPodLMBXpV3eP7n8pXsK/Mo5
	 zOthyROTuyAqdflz4JtxNSzMN7JDq7D8AlG4vAUfudwlcthNpdpeWlaHLmDi33Kj4r
	 esMpwv9MLcyTyaOA2tyQG/ZzJHP/O11zZQwSpzAmqU/eveXzTAv387y9MiAmXhGlmz
	 LZ1FdafE124aAygI+K3XM7/X220w8EaFQiwxmQTWGBs/9WqQ4wO2h8UBUZkDSsLyrn
	 kEpPI/AJpkbXQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 6/7] sparc/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:37 -0700
Message-ID: <20250424002038.179114-7-ebiggers@kernel.org>
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
 arch/sparc/lib/Makefile                  | 2 +-
 arch/sparc/lib/{crc32_glue.c => crc32.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/sparc/lib/{crc32_glue.c => crc32.c} (97%)

diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index 5724d0f356eb5..ef8860eb3f3d1 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -52,6 +52,6 @@ lib-$(CONFIG_SPARC64) += mcount.o ipcsum.o xor.o hweight.o ffs.o
 
 obj-$(CONFIG_SPARC64) += iomap.o
 obj-$(CONFIG_SPARC32) += atomic32.o
 obj-$(CONFIG_SPARC64) += PeeCeeI.o
 obj-$(CONFIG_CRC32_ARCH) += crc32-sparc.o
-crc32-sparc-y := crc32_glue.o crc32c_asm.o
+crc32-sparc-y := crc32.o crc32c_asm.o
diff --git a/arch/sparc/lib/crc32_glue.c b/arch/sparc/lib/crc32.c
similarity index 97%
rename from arch/sparc/lib/crc32_glue.c
rename to arch/sparc/lib/crc32.c
index d34e7cc7e1a1e..428fd5588e936 100644
--- a/arch/sparc/lib/crc32_glue.c
+++ b/arch/sparc/lib/crc32.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Glue code for CRC32C optimized for sparc64 crypto opcodes.
+/* CRC32c (Castagnoli), sparc64 crc32c opcode accelerated
  *
  * This is based largely upon arch/x86/crypto/crc32c-intel.c
  *
  * Copyright (C) 2008 Intel Corporation
  * Authors: Austin Zhang <austin_zhang@linux.intel.com>
-- 
2.49.0


