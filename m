Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C11FC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sn8BpMssSvvurki76bvPAsXXKeoGRKsVHzy1bYbUjUQ=; b=pZg1QlOJlaJv5kCtSeXJgEiCxY
	Hkx5uV++EKrJFynuLLTDk7Oe0ZTBgZrhAzEVNXoHwLH9/DFmb+mRPxOvYVElStcCoRCLPwfD2ry/2
	OfBg5yeDl3/bEqFsYfofYca0cZi6F7R/EhYu7EGgcWci6wEZlwPE7PAkWO7M+kyQ9h4Ow/9pIyK52
	qgzcd0sD821uz6htmpl+XXyXqpqqWn/savnaAmsPaYnu+wX4shM4kTmswvCb9dT+4IPnfnvrtAheJ
	imGxrL1oEGmiHHxKqRsTUDh7zXP/4e0prtGANSiYBi8AFqqj1lNas4KvHGCFrwXl7o7F6UMAGZY0C
	lqwpYXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZTc-00000001cOP-10fj;
	Sat, 26 Apr 2025 06:57:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZO2-00000001aZZ-02El;
	Sat, 26 Apr 2025 06:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 589675C290D;
	Sat, 26 Apr 2025 06:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB467C4CEEB;
	Sat, 26 Apr 2025 06:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745650301;
	bh=tT7xHizMSeBb7KvPb+oh3/Ig96zej6yrrgzCapsgU4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lcsr7CT6H9XpOvDDW/C83SMoazZN1PRVMrqjz50cIA8jvmCUTp4hbSP/O3xWDYddd
	 YZ0Ca/KBHzX6l/dLL8hxBuVetdDeZw6hpcDAZ35cOMN09OfSLYS0ycv+SBXsap2x9T
	 nYa388Rpg9JgkkRno5+iBFIWegN8KKu5pmrB5RAANFCP2wNWIJ8cg4uo4UGSC1YmXX
	 3PyA35KurVu6MUW3T2QiEAViSJb9VVp4oVLGMgGOqouczpABo7xEpnV5PbcofFOcyJ
	 SrKpi4wF6nF6wj1xAmeQyg10nxHDcqBjKLSEqqQyHj2PlfzO/+3AwSUvpeth2rtySI
	 75WbMMZSzlWhA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 03/13] crypto: arm64/sha256 - remove obsolete chunking logic
Date: Fri, 25 Apr 2025 23:50:29 -0700
Message-ID: <20250426065041.1551914-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
References: <20250426065041.1551914-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_235142_088826_74677624 
X-CRM114-Status: GOOD (  11.44  )
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

Since kernel-mode NEON sections are now preemptible on arm64, there is
no longer any need to limit the length of them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/sha256-glue.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/sha256-glue.c b/arch/arm64/crypto/sha256-glue.c
index 26f9fdfae87bf..d63ea82e1374e 100644
--- a/arch/arm64/crypto/sha256-glue.c
+++ b/arch/arm64/crypto/sha256-glue.c
@@ -84,27 +84,12 @@ static struct shash_alg algs[] = { {
 } };
 
 static int sha256_update_neon(struct shash_desc *desc, const u8 *data,
 			      unsigned int len)
 {
-	do {
-		unsigned int chunk = len;
-
-		/*
-		 * Don't hog the CPU for the entire time it takes to process all
-		 * input when running on a preemptible kernel, but process the
-		 * data block by block instead.
-		 */
-		if (IS_ENABLED(CONFIG_PREEMPTION))
-			chunk = SHA256_BLOCK_SIZE;
-
-		chunk -= sha256_base_do_update_blocks(desc, data, chunk,
-						      sha256_neon_transform);
-		data += chunk;
-		len -= chunk;
-	} while (len >= SHA256_BLOCK_SIZE);
-	return len;
+	return sha256_base_do_update_blocks(desc, data, len,
+					    sha256_neon_transform);
 }
 
 static int sha256_finup_neon(struct shash_desc *desc, const u8 *data,
 			     unsigned int len, u8 *out)
 {
-- 
2.49.0


