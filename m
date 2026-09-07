Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2220CC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cW6vuPa9TzUzmzyF3037nhED0lin8odzpcp8o8tSD7Q=; b=Pf9UWqnZ9TYoRHjYfFNpAaxL76
	N9r9s9ATyarMMEtf1vVGwhL1eQpazNSJTDItfYqP1QfrQzUAJ0/90Gn/4vvqVLk6LMdDXpyyR1QVd
	iwoDihFuxFC/oBKj0w7rRvr779y3ylOa2ArahAT60OOmQf3yeQxV1b33ofXR+rpW4foaSHpCmX9Pa
	ad4h4oT1/BrKt+fUFLIdXEOmG6+XmlmMX7IWtW2ADgXXexnXEkyP0isDop3yWiTezGUhVUjNnvOvD
	KPhBQPKFONt+Uavv+yjhhOxtyMGq0EUUQut7Gaf7LW57nQFl15QNJImNLyqYz7j8XhT9ABDsTV+3j
	mqlWU5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cMH-00000007KEN-0Vbr;
	Mon, 07 Sep 2026 16:38:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cMC-00000007KA1-24kP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:38:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBD60601FB;
	Mon,  7 Sep 2026 16:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F46D1F00A3D;
	Mon,  7 Sep 2026 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799087;
	bh=cW6vuPa9TzUzmzyF3037nhED0lin8odzpcp8o8tSD7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IHkUFoHAWoATMA9skBKckKJbiStepXVxgZlqQCyIApc8bvESREAz3EHmC8ixRVLIA
	 /5ddaccV3CJw9u9CAMQF9S0c3nglJ2Xjm6FzHoTAx3jRy9ljbsVhj1ahzn284lqe9P
	 BlcWMsBiCGq6JQ54fR1INvZp42VCQk8ebmWheedEH1C/WXQ+zSwEZneae0ZyXKsAm+
	 /9wqMcALM9ld9E4ZtZtWhEnMbVGAsMFCrHwsgd5gCAJ2MERzur3eTzxpG5H1vuzmzj
	 3igibfbDMp2YRH3rTve/RNHBPr0SReAPZ3eXY7/fXCZHy17r3Nvv3p17bXqToTEucv
	 sdG8qa9f02vQA==
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
Subject: [PATCH v2 09/14] KVM: arm64: Remove support for a big-endian hypervisor object
Date: Mon,  7 Sep 2026 17:37:20 +0100
Message-ID: <20260907163726.17104-10-will@kernel.org>
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

Big-endian support on arm64 depends on BROKEN. In preparation for
removing the dead code altogether, remove the support for generating
ELF relocations for a big-endian hypervisor object and drop the unused
big-endian spinlock definition from nVHE.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h |  4 ----
 arch/arm64/kvm/hyp/nvhe/gen-hyprel.c       | 16 ----------------
 2 files changed, 20 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
index 7c7ea8c55405..b6978f03e86a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/spinlock.h
@@ -20,11 +20,7 @@
 typedef union hyp_spinlock {
 	u32	__val;
 	struct {
-#ifdef __AARCH64EB__
-		u16 next, owner;
-#else
 		u16 owner, next;
-#endif
 	};
 } hyp_spinlock_t;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/gen-hyprel.c b/arch/arm64/kvm/hyp/nvhe/gen-hyprel.c
index b63f4e1c1033..99243e0fefb0 100644
--- a/arch/arm64/kvm/hyp/nvhe/gen-hyprel.c
+++ b/arch/arm64/kvm/hyp/nvhe/gen-hyprel.c
@@ -139,28 +139,12 @@ static struct {
 	const char	*sh_string;
 } elf;
 
-#if defined(CONFIG_CPU_LITTLE_ENDIAN)
-
 #define elf16toh(x)	le16toh(x)
 #define elf32toh(x)	le32toh(x)
 #define elf64toh(x)	le64toh(x)
 
 #define ELFENDIAN	ELFDATA2LSB
 
-#elif defined(CONFIG_CPU_BIG_ENDIAN)
-
-#define elf16toh(x)	be16toh(x)
-#define elf32toh(x)	be32toh(x)
-#define elf64toh(x)	be64toh(x)
-
-#define ELFENDIAN	ELFDATA2MSB
-
-#else
-
-#error PDP-endian sadly unsupported...
-
-#endif
-
 #define fatal_error(fmt, ...)						\
 	({								\
 		fprintf(stderr, "error: %s: " fmt "\n",			\
-- 
2.55.0.979.g7e5102b832-goog


