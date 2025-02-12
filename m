Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650E5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zZ9QyVTjFHeljpWjnJ1XysTaaZ34jbamMvBc3DoPeKU=; b=mhbjQZC+S8CilNMiYH9dUxY+Mi
	tMQ7Tc1e/yNMT8L13gL1hJKKs03TCJ+y/WujcqRDRZescizMQtEtrdl9bgx2vc9hWgjCWX12/F3hh
	H/c/HyOGW/kD00emaeChwzLm1h8lvb+QQwl2ExqP0vqyQj/h9+1NW3UG1b6sozeqozWgmkKti6NuR
	8kwAjO4/sU48dCPlOjTira/4+G2nDNQYUcCPPvXNt71MGYGJGVLl/z0oJQV2avP9v1zzXFVxTgXk6
	BBgmEEBkdiOOEgjwJOB030MhagSFuGnY4vCVN64db4mOwYfWxdGIqeRUf8tCUUaFF2KVmw6Hh98PV
	SU0UsR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFK5-0000000814x-1vrh;
	Wed, 12 Feb 2025 16:10:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEyK-00000007v6a-255i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 128F55C5C4C;
	Wed, 12 Feb 2025 15:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE85C4CEDF;
	Wed, 12 Feb 2025 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739375299;
	bh=jGTcO7uOKoo9Sew7/PnGEbprmSHHDRcuUgN9YyNsgpk=;
	h=From:To:Cc:Subject:Date:From;
	b=LpKfe7nhCwi7G2IBXWHGfrifPCjdBtpx5STvudjspOxexJrzMWCekZRcSy+b9Vbp+
	 q23nMNet1qLz58BEZ7ZJD8Od5x3hBDTSM3JPm7qU44xp3eGoyc8iDo8CdUcyssUwv7
	 ucT4r7Gg/OrMxzjjmuKXivISpXYBEXztV/dyfH5UdVJmNLRpjs2QZFPCXKxPg/2m73
	 xaoF0NsbIXnwxVpu9Gejxt/KRvD6osrOClBaVLbZMUK3VuGKQtBnT+vx7JNinCz6ks
	 qTQj4l3I4sNeubtfDCs5JH0CeW6fK+HH1wJC3P4sDY2e7e90cBJ+tkB6i1nnKWrFL1
	 WIc/dou+/Dh1w==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: linux-crypto@vger.kernel.org,
	dm-devel@lists.linux.dev,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer hashing
Date: Wed, 12 Feb 2025 07:47:11 -0800
Message-ID: <20250212154718.44255-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074820_622625_107C057E 
X-CRM114-Status: GOOD (  19.44  )
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

[ This patchset keeps getting rejected by Herbert, who prefers a
  complex, buggy, and slow alternative that shoehorns CPU-based hashing
  into the asynchronous hash API which is designed for off-CPU offload:
  https://lore.kernel.org/linux-crypto/cover.1730021644.git.herbert@gondor.apana.org.au/
  This patchset is a much better way to do it though, and I've already
  been maintaining it downstream as it would not be reasonable to go the
  asynchronous hash route instead.  Let me know if there are any
  objections to me taking this patchset through the fsverity tree, or at
  least patches 1-5 as the dm-verity patches could go in separately. ]

[ This patchset applies to v6.14-rc2 ]

On many modern CPUs, it is possible to compute the SHA-256 hash of two
equal-length messages in about the same time as a single message, if all
the instructions are interleaved.  This is because each SHA-256 (and
also most other cryptographic hash functions) is inherently serialized
and therefore can't always take advantage of the CPU's full throughput.

An earlier attempt to support multibuffer hashing in Linux was based
around the ahash API.  That approach had some major issues, as does the
alternative ahash-based approach proposed by Herbert (e.g. see my
responses at
https://lore.kernel.org/linux-crypto/20240610164258.GA3269@sol.localdomain/
and
https://lore.kernel.org/linux-crypto/20241028190045.GA1408@sol.localdomain/,
and the other discussion on v4
https://lore.kernel.org/linux-crypto/20240603183731.108986-1-ebiggers@kernel.org/T/#t)
This patchset instead takes a much simpler approach of just adding a
synchronous API for hashing equal-length messages.

This works well for dm-verity and fsverity, which use Merkle trees and
therefore hash large numbers of equal-length messages.

This patchset is organized as follows:

- Patch 1-2 add crypto_shash_finup_mb() and tests for it.
- Patch 3-4 implement finup_mb on x86_64 and arm64, using an
  interleaving factor of 2.
- Patch 5 adds multibuffer hashing support to fsverity.
- Patch 6-7 add multibuffer hashing support to dm-verity.

This patchset increases raw SHA-256 hashing throughput by up to 98%,
depending on the CPU (see patches for per-CPU results).  The throughput
of cold-cache reads from dm-verity and fsverity increases by around 35%.

Changed in v8:
  - Rebased onto v6.14-rc2 and updated cover letter.

Changed in v7:
  - Rebased onto v6.12-rc1 and dropped patches that were upstreamed.
  - Added performance results for more CPUs.

Changed in v6:
  - All patches: added Reviewed-by and Acked-by tags
  - "crypto: testmgr - add tests for finup_mb": Whitespace fix
  - "crypto: testmgr - generate power-of-2 lengths more often":
    Fixed undefined behavior
  - "fsverity: improve performance by using multibuffer hashing":
    Simplified a comment
  - "dm-verity: reduce scope of real and wanted digests":
    Fixed mention of nonexistent function in commit message
  - "dm-verity: improve performance by using multibuffer hashing":
    Two small optimizations, and simplified a comment

Changed in v5:
  - Reworked the dm-verity patches again.  Split the preparation work
    into separate patches, fixed two bugs, and added some new cleanups.
  - Other small cleanups

Changed in v4:
  - Reorganized the fsverity and dm-verity code to have a unified code
    path for single-block vs. multi-block processing.  For data blocks
    they now use only crypto_shash_finup_mb().

Changed in v3:
  - Change API from finup2x to finup_mb.  It now takes arrays of data
    buffer and output buffers, avoiding hardcoding 2x in the API.

Changed in v2:
  - Rebase onto cryptodev/master
  - Add more comments to assembly
  - Reorganize some of the assembly slightly
  - Fix the claimed throughput improvement on arm64
  - Fix incorrect kunmap order in fs/verity/verify.c
  - Adjust testmgr generation logic slightly
  - Explicitly check for INT_MAX before casting unsigned int to int
  - Mention SHA3 based parallel hashes
  - Mention AVX512-based approach

Eric Biggers (7):
  crypto: shash - add support for finup_mb
  crypto: testmgr - add tests for finup_mb
  crypto: x86/sha256-ni - add support for finup_mb
  crypto: arm64/sha256-ce - add support for finup_mb
  fsverity: improve performance by using multibuffer hashing
  dm-verity: reduce scope of real and wanted digests
  dm-verity: improve performance by using multibuffer hashing

 arch/arm64/crypto/sha2-ce-core.S    | 281 ++++++++++++++++++++-
 arch/arm64/crypto/sha2-ce-glue.c    |  40 +++
 arch/x86/crypto/sha256_ni_asm.S     | 368 ++++++++++++++++++++++++++++
 arch/x86/crypto/sha256_ssse3_glue.c |  39 +++
 crypto/shash.c                      |  58 +++++
 crypto/testmgr.c                    |  73 +++++-
 drivers/md/dm-verity-fec.c          |  19 +-
 drivers/md/dm-verity-fec.h          |   5 +-
 drivers/md/dm-verity-target.c       | 192 +++++++++++----
 drivers/md/dm-verity.h              |  34 +--
 fs/verity/fsverity_private.h        |   7 +
 fs/verity/hash_algs.c               |   8 +-
 fs/verity/verify.c                  | 169 ++++++++++---
 include/crypto/hash.h               |  52 +++-
 14 files changed, 1224 insertions(+), 121 deletions(-)


base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.48.1


