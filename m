Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE391C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 00:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5HA6vTPIAExrshpJRpmOnHG9iQpeFKL/ljG+c8yMR8=; b=VyLuC5uPJTgJIjtHJRAw/YIHGt
	rwPKpgZvfw3WofJClAE07Mwh7OEiOEdoTbE6ZaCZYwEkpqzUJJf9Zil3CFq5dVq9LLDQKu8+B+SCT
	PWz7Cx7C1nuTMoigA0cCCSL01nJl4rk6vawCvRxnIUPjVeotG4dDZRUJbhJmwbBdLTZDb1tqRWKYQ
	OFvXXA4KQXlfMvN3TroMgmOkKjTcK4ZaDTOD4/2nHDizQqZjwqUhxbd9fhWsobFhEQlPuIQuyB9vk
	gh8FBaNUMpO6TNiF7aM77PAxzqfvmRrUeWUXLBZ4J49w5aYrmxlwIpmCU2M4HtJsW4Qa/r29NxuwA
	yyqO81RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kOj-0000000CODA-330B;
	Thu, 24 Apr 2025 00:25:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kMk-0000000CNUz-2Ipn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 00:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7620368454;
	Thu, 24 Apr 2025 00:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA2FC4CEEA;
	Thu, 24 Apr 2025 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454177;
	bh=f6qY7h7/z9HFPXtJ7uW93vPk+oRSFTdF1XATrLujF94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGtI6i60jfi/bxvrBjyZrkl3TkhvNSEysxPTGOz6UaGM8gmkSGMzhgzvxG6cSkx4I
	 IER76oYErtjvm57HPR+kvW4xbDJY3gBBtmDAx3GbteOA3X5bCfJxtdP4oWnIZg35eb
	 ovQ/1UKOZtrxFP2oaMWLLDIslp1XyosmGQAIniINOznzhAYu0wZVXys0xwjT8MpXdy
	 Xdx5pA713zOdUR53LMD0F1zwNlgTgL3FxLkHZftpvofB3xxaT0ftBfE4rME11I7H5n
	 6Kw8/d9POrLBi/0pSDx7/rhvpLc1AerJedNLcZgzxHya15q4HPa0TOx+9SfRxzrYO/
	 58NCLhKBn8IdQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 1/7] arm/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:32 -0700
Message-ID: <20250424002038.179114-2-ebiggers@kernel.org>
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
 arch/arm/lib/Makefile                            | 4 ++--
 arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c} | 0
 arch/arm/lib/{crc32-glue.c => crc32.c}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/arm/lib/{crc32-glue.c => crc32.c} (100%)

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 007874320937d..d05dd672bcd9c 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -45,9 +45,9 @@ ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
 endif
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-arm.o
-crc32-arm-y := crc32-glue.o crc32-core.o
+crc32-arm-y := crc32.o crc32-core.o
 
 obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-arm.o
-crc-t10dif-arm-y := crc-t10dif-glue.o crc-t10dif-core.o
+crc-t10dif-arm-y := crc-t10dif.o crc-t10dif-core.o
diff --git a/arch/arm/lib/crc-t10dif-glue.c b/arch/arm/lib/crc-t10dif.c
similarity index 100%
rename from arch/arm/lib/crc-t10dif-glue.c
rename to arch/arm/lib/crc-t10dif.c
diff --git a/arch/arm/lib/crc32-glue.c b/arch/arm/lib/crc32.c
similarity index 100%
rename from arch/arm/lib/crc32-glue.c
rename to arch/arm/lib/crc32.c
-- 
2.49.0


