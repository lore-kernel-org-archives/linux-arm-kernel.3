Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAD0CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 23:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BSm7+9obmG5jbl4zUsz2vn1Ux2AYCmW+t/2b5Rog8JE=; b=Zn1BivgwcwXIr8t/CiYebdRWZl
	egiVY9nsZosM4HXk/iMzrYd1IPKnYy8gSd1PD4KVbdrX2AWZ1Ktcg+6IIovNFt5Z8x1CHpTujagZ5
	NIYui+HsMq94O6m0qtubPvI4LR8PXB6TXaFZBR1Yi4M5Vkrvpg9VjqVIPFeR0FpQ4H5KsJza+VnR/
	GdyMD/Dl3hpYEZtHwH+hUp/cWkOCa8Ni0Wbh4nsZGIjxiji0L1vAvIrL3NgXuV4owLMGhPBl1JyAm
	pjaK8uqhXILZ31Bvw9HGognYL0jtrN33KWUXurUJhCCRjNzxnDC2NqyM9gb7E5/w6Ib92fQ5fhKpC
	emkJrgzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw7Zc-0000000Ar6Q-1Tvf;
	Tue, 09 Sep 2025 23:16:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw7Zb-0000000Ar5B-0JLx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 23:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59A77601F8;
	Tue,  9 Sep 2025 23:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46D4C4CEF4;
	Tue,  9 Sep 2025 23:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757459786;
	bh=uqkl7Px7tQkx+fKrwIt2Uqmlnhb6p4SSaE3Pe0nxwhI=;
	h=From:To:Cc:Subject:Date:From;
	b=ouJB0jh0FsjExT9I3J6SGM16P/1zDElKVGEkWy8viHBigYezpQt/NFUeHoVk15zVy
	 MQ3Vz53cyyffdBkfqLDiZV0Vq/Rhjzfg4b3FBwRF6EZByTA8wuY0UCgDRO7NYVckdB
	 /AohO5bq8KC3gVGqRR0BbGDJ7Bjl5KtpwksKSVftjo8WpNQzXZR/aBV5l3nBSDHREV
	 Y2+tH+nssP2ITuV92napcx+6pUTfETyumICjwQNdKhrQQi85+25BQNz6XK+sL8i5sL
	 xtj791CElTpczOpWDMJs8ofKmNRaZWdNL0vxI59JDLoldHQabq4hHy3FpAupdo2ItH
	 dVZKl5tzVfOxA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/6] Optimize fsverity using 2-way interleaved SHA-256 hashing
Date: Tue,  9 Sep 2025 16:13:20 -0700
Message-ID: <20250909231326.1074672-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
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

This series is targeting libcrypto-next.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256_finup_2x-v1

This series adds support for 2-way interleaved SHA-256 hashing to
lib/crypto/, implements it for arm64 and x86_64, and makes fsverity use
it.  This significantly improves fsverity performance on many CPUs.

Later patches will make dm-verity use this optimization as well.

Eric Biggers (6):
  lib/crypto: sha256: Add support for 2-way interleaved hashing
  lib/crypto: arm64/sha256: Add support for 2-way interleaved hashing
  lib/crypto: x86/sha256: Add support for 2-way interleaved hashing
  lib/crypto: tests: Add tests and benchmark for sha256_finup_2x()
  fsverity: Remove inode parameter from fsverity_hash_block()
  fsverity: Use 2-way interleaved SHA-256 hashing when supported

 fs/verity/enable.c              |  12 +-
 fs/verity/fsverity_private.h    |   2 +-
 fs/verity/hash_algs.c           |   3 +-
 fs/verity/verify.c              | 175 ++++++++++++---
 include/crypto/sha2.h           |  24 +++
 lib/crypto/arm64/sha256-ce.S    | 281 +++++++++++++++++++++++-
 lib/crypto/arm64/sha256.h       |  37 ++++
 lib/crypto/sha256.c             |  66 +++++-
 lib/crypto/tests/sha256_kunit.c | 184 ++++++++++++++++
 lib/crypto/x86/sha256-ni-asm.S  | 368 ++++++++++++++++++++++++++++++++
 lib/crypto/x86/sha256.h         |  39 ++++
 11 files changed, 1136 insertions(+), 55 deletions(-)


base-commit: 54e7bb6ade8acd3fb1c486c9f3e2c0dfdc18f84e
-- 
2.50.1


