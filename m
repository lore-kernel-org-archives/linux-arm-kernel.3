Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C92C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKzrU6gdVJiJLYXn68VZtIh2xNVLST+lv2iClQsbPYk=; b=Z61L/4QpqQcIuIR8+FGkIDbK5/
	ENPr962BjK+t6NfUIIAcJRDs8flOCvELpoHKDpF6fTkMEJim1Hm37wBAcirIX/vmQesnh/pYihixq
	6n/Xtaxm6k33NteFdCkxb0TgAdBZtjkAgJzwbELojO0f6TnDJQ4X3HOdkYXc0/VgWX8tfh/DueZY5
	ArI//a++QOy18kIA+n/n2ospZD/DgeOqL+V3zdeB4XAFb36UjfO120x2vJAej2bHniXHE7QpfdKuE
	HiTAGu7/7M+JM0lDjcVvz2PMljn4QFkXaR3K9WJSJxV2ve/RrENIShPUn+hLgVb8OVZ5Y/PgAGErv
	yybp7vGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rza-000000072vQ-01vh;
	Mon, 28 Apr 2025 17:10:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rrl-000000070sZ-0wpc;
	Mon, 28 Apr 2025 17:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7D7A4AAB3;
	Mon, 28 Apr 2025 17:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737D5C4CEF2;
	Mon, 28 Apr 2025 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859720;
	bh=WGUG3mTzhoDhli2YpBvT7Wh87yi92KthyKex4Ih+eYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R4lo9OBtV1cajdxreoVKsMWdUvS6ZbyO08N/F8VPM7gCjd4vR29sCJ6hr+gsAz5sV
	 /PsXwkP+M3rZJ1TDwQNaE0aEMelACb4s9S+KbbNmpiYX8UiyOjoozEWfhD09JDOZu+
	 x/SJkloWktFlYpZjkRJX9AIJbC1zJzJj+z2oCK+M9nZLvkVSf48G9lnXlrGrV0uQug
	 1k03Xh4jH0fkYF41PZm+nkzeR8JhPi/OIZVa5O0ePLaxiWaCo8FJrhxJm5FvTZ2LBl
	 rhTM8PIU0kCLWQEmTvEPDD6lPp5XrwrJn6ldRIfBEJVhhwso8J2oM3uHywynAvoKeb
	 QkQs8cjXuMjsw==
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
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v4 03/13] crypto: arm64/sha256 - remove obsolete chunking logic
Date: Mon, 28 Apr 2025 10:00:28 -0700
Message-ID: <20250428170040.423825-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428170040.423825-1-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_100201_292062_6558E140 
X-CRM114-Status: GOOD (  11.64  )
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

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
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


