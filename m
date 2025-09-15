Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F3ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LZMG3VFVJY+CX6t4GoIdo98p1wtM4Sf83rNN5wLR7nU=; b=3Bz3sDhxxi6NJaVbc01YHpbvF1
	oI0sp3jDajao9KfeArO/nMaH43CTliuORyTeCxAwwUvxFjUIn++PbzmA0GaD8E/ocXrQZoYLPeNRa
	lcGdrqtKu49HGH69NDPTqra8y8d846XsFX5RINDtq+0xp1nn53tul9Rwk8xrxTeL+4DoEcca9+fGU
	8y0jEE+L+5Aq48BwIBDa6pxdPmmpKnKZxIYpF0wbGJozXDkSmVCqCx/TilZgxR8jiBOlhRnCj6oBh
	hg+Outvn0WjTmRSPrxDibXkIkJIoPVdoEGsfKHNjF0kc6359mTGb++Iq/v6X1SXVfEeSwbVUL58Jo
	iJPfFRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBlS-000000053o2-21c5;
	Mon, 15 Sep 2025 16:09:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBlQ-000000053nE-31Fx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:09:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA39C60231;
	Mon, 15 Sep 2025 16:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B2DC4CEF1;
	Mon, 15 Sep 2025 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757952551;
	bh=2kwD057UDVqZKek/SB4FkUZbEOXrXs53qNd/kRtu9fI=;
	h=From:To:Cc:Subject:Date:From;
	b=A1eJrgHSDSoCFgRMCcpY1lhPLcxXCBJbstJDNVMAHCDPETpIIFCEhyuIZ3XMhzlSg
	 SzuOXgNl0q+HTBftEyyTm1KFQA9QuLp1xkWKicOFvhD5C5qynGI8PGhBe/1Vvhtzfh
	 eN5t7Vh93GEkq8280+VaE98UhxN2VOmGeje+PNyB+eKvchw9Xf/tkSN9okVMXRQoWq
	 xj3OWyTAew62N8YUndxfOhlkHK9HMH8aeKubZpVtr0G/nxFRZizt6uTiKlyGLqGHfZ
	 HLc07DPkIC7zXndV+80NYS6lgQVRnO6vJJE6gwLVFfFnitlaWd3GbOou0Ew2nW+GCF
	 Ipu7HjzCJNskA==
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
Subject: [PATCH v2 0/6] Optimize fsverity using 2-way interleaved SHA-256 hashing
Date: Mon, 15 Sep 2025 11:08:13 -0500
Message-ID: <20250915160819.140019-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.0
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256_finup_2x-v2

This series adds support for 2-way interleaved SHA-256 hashing to
lib/crypto/, implements it for arm64 and x86_64, and makes fsverity use
it.  This significantly improves fsverity performance on many CPUs.

Later patches will make dm-verity use this optimization as well.

Changed in v2:
- Made the new arm64 assembly compatible with CONFIG_CPU_BIG_ENDIAN=y.
- Omitted sha256_finup_2x() from pre-boot environments.
- Made alloc_guarded_buf() assert that the allocation succeeded.
- Minor tweaks to comments and whitespace.

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
 include/crypto/sha2.h           |  28 +++
 lib/crypto/arm64/sha256-ce.S    | 284 +++++++++++++++++++++++-
 lib/crypto/arm64/sha256.h       |  37 ++++
 lib/crypto/sha256.c             |  71 +++++-
 lib/crypto/tests/sha256_kunit.c | 184 ++++++++++++++++
 lib/crypto/x86/sha256-ni-asm.S  | 368 ++++++++++++++++++++++++++++++++
 lib/crypto/x86/sha256.h         |  39 ++++
 11 files changed, 1147 insertions(+), 56 deletions(-)

base-commit: 54e7bb6ade8acd3fb1c486c9f3e2c0dfdc18f84e
-- 
2.51.0


