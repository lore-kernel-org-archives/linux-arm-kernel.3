Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A66C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrCX0Ti81C+Hj7BQSUz+xSZkyEBawt04a27wa3CMR0I=; b=YCA3XFj8Rnmtvqhc6E4KVC7s3s
	OTmHJuOPsIsz/VMjCZ8JJFFxP0SObZvmej9ykQpWejODtrvf/rMZk1uaYYpY7+o5cS4NtY40/ZbXY
	OxztTquHEfgVJb/BmND+nAcNHs9e750LEkmFmTkb5rfbORD+retbwuT5gv8uKuyFsoNFz4KE7Xlzb
	7yMqhmtd4BkdbUCKRwZhq081rF0xw7suE/lWrfkwnOubL6DuCwVqP+kgONigii2ciOj8EUeGQqN+h
	ae09smzRwnpOZ7ROkuJkn5ydGhE/DeBSQe60i7B45Vgn0D1IoSW5WaBOuMLoyowmS4mYkHSpadiYF
	BxNmU90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZxZ-0000000EmhA-1U8h;
	Fri, 18 Sep 2026 14:53:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZxK-0000000EmUp-0SKd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:52:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CCA36053D;
	Fri, 18 Sep 2026 14:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10541F0089A;
	Fri, 18 Sep 2026 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743169;
	bh=GrCX0Ti81C+Hj7BQSUz+xSZkyEBawt04a27wa3CMR0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jPQ+3eDyMb1tGAyKTnqkOK0d5jdyAmFqtpGBFAcbieLdNArtPmnDyQSbvyrgFD5Lf
	 UbDpYnyeLdPl/2xXf1/jaQVVUq8tr84uiaq5z+RlQFzve283UrWne6MIir3b7Adj6O
	 nuMkt+/okgIva3YEYH95Sgu46BGc9iF6zYPqlZp2PNoYlXrnKjRCCC2WuqqpxD7ng+
	 wKidpV95DH12OBKZ1yLNbx6Y/ug0kd/4OzMSSQj48mD/+x2SASOY/NV1tuEBOZWd9X
	 NztHacHhd4Ym4E8VZ8eqqqBairuZU/0vXhAVmdSH8H/imojDwUzV7U8eoSw0WsI25H
	 eT/Qz71aMquiw==
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
Subject: [PATCH v3 08/13] KVM: arm64: Remove support for a big-endian hypervisor object
Date: Fri, 18 Sep 2026 15:52:10 +0100
Message-ID: <20260918145217.1669-9-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog


