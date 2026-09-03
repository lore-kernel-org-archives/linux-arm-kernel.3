Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF0EC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GDB5X+axe54KvG6nqg5ihilrHRbcN4bSYldQrs86QOE=; b=HLL+vCljdjboGhvutWhoEvKYa9
	o+Wa/LOnrFCwydzC+hi0fz8cpY+Dehjpz4ZlGKtblel0zQDoe1vsp3iPTfS14DgO8qkzGrsnwW0jO
	+Ez1H/kgt0lfsVcsO8U1QS42J7I7nAVVMJyUTe7qHeUrvftc3dzzVb0exuaupY8tnCtGDzrEfO27Z
	6FcoQbJAXwCbfhvQdhXNo9AVX7h0ka2Ro4twLXpsDDJARSRh4uU3XoND4MgYvokrWQElK/9JLwawa
	fPuAGt+H3GUC6mP00hYA9maSE1684daWVSSktmY61Bdm5eywicLUnU1F4vKGQpkRAkZjBod83k+ft
	MlEQai3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Af-0000000HG7Q-0TAb;
	Thu, 03 Sep 2026 12:03:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Ad-0000000HG76-46V1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:03:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 093ED40D79;
	Thu,  3 Sep 2026 12:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2279F1F000E9;
	Thu,  3 Sep 2026 12:03:52 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] lib/crc: arm64: Fix const keyword in asm prototypes
Date: Thu,  3 Sep 2026 14:03:50 +0200
Message-ID: <1073b77747354d8d46d8804970acd80245e4c318.1788436846.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Commit d36cebe03c3ae4ea ("lib/crc32: improve support for arch-specific
overrides") corrected the position of the "const" keyword in the
arch-specific funcions, and replaced "unsigned char" by "u8" for
consistency.

Make the same change to the forward declarations for the asm
implementations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 lib/crc/arm64/crc32.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/crc/arm64/crc32.h b/lib/crc/arm64/crc32.h
index 1939a5dee4772972..332d9092ba2f3875 100644
--- a/lib/crc/arm64/crc32.h
+++ b/lib/crc/arm64/crc32.h
@@ -7,13 +7,13 @@
 // The minimum input length to consider the 4-way interleaved code path
 static const size_t min_len = 1024;
 
-asmlinkage u32 crc32_le_arm64(u32 crc, unsigned char const *p, size_t len);
-asmlinkage u32 crc32c_le_arm64(u32 crc, unsigned char const *p, size_t len);
-asmlinkage u32 crc32_be_arm64(u32 crc, unsigned char const *p, size_t len);
+asmlinkage u32 crc32_le_arm64(u32 crc, const u8 *p, size_t len);
+asmlinkage u32 crc32c_le_arm64(u32 crc, const u8 *p, size_t len);
+asmlinkage u32 crc32_be_arm64(u32 crc, const u8 *p, size_t len);
 
-asmlinkage u32 crc32_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
-asmlinkage u32 crc32c_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
-asmlinkage u32 crc32_be_arm64_4way(u32 crc, unsigned char const *p, size_t len);
+asmlinkage u32 crc32_le_arm64_4way(u32 crc, const u8 *p, size_t len);
+asmlinkage u32 crc32c_le_arm64_4way(u32 crc, const u8 *p, size_t len);
+asmlinkage u32 crc32_be_arm64_4way(u32 crc, const u8 *p, size_t len);
 
 static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
-- 
2.43.0


