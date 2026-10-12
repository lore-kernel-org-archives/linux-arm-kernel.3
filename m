Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DEBCA9EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DHJIcex1DOOwfb7wBziSnUdRK7Fg3z4DgEh1GWrSF5s=; b=ga2FAum9XVY+Gi3ADAufWiEgIL
	bodCjPGKUsraoodFpz0r0CQZjZ2TdRmN9r+rG9clCvYyWidzxxXVlfNSu7mfQoFbu9SAc7za5OlgV
	2Vxt06X87qjWG6HLgBFkTZSNm8UwtmaThrKrISCbT0ypMgWCUyQO4kMOx5xcyMQFr4mxxuI5iMjEq
	KJrYr2a+WU8ayr9ba6f8gg5sVaLboZ2Ycpsl4cxFibr1H/Af3uRxCwmo/7r53NfCoo0Iv6hmGXGHy
	PqAIDw/SNN0t4NHef2QxvscApOOX8uzvBbQc5Ot7hC9tetPAFd2aJQfOgzxks2al8Sgdq4Y4DLHo0
	6rQLMRiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNcE-0000000BXjB-3nmO;
	Mon, 12 Oct 2026 21:31:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNcD-0000000BXhy-3nBt;
	Mon, 12 Oct 2026 21:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DBE3601E4;
	Mon, 12 Oct 2026 21:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABEFEC2BCC7;
	Mon, 12 Oct 2026 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791840684;
	bh=xNIifAwkZ3zfHyHYKd9B57SvHI2QibtziT5cigfmjhE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kXTm5pdnCy3IRjdn9Lr12jz98+/eex9QJtstCfUSYlJHekV9PAotzWYRlaDp1ikc0
	 /+QLlWc7IApI+g9CaTM6bbxwnbcRmfertsYOh+CNiSB71CSk3KF/R3BdElLQ41na5z
	 399+jXniHhXK6gv+cc5eMYcKqhlJTS6qNoo+ZuLrbI0VxcSKTVJy/e50Bz0nu//eeS
	 HraYUEv4UcaAX1isZU1hofX019h1Wz8Dy8LvzVYn7ntOjrDTJpQooNhZ6Hy0Ii6xFr
	 j98SlqzXNWHCNX+cCLSbJC/xzfUe1JRYlnRLKRcmzFM/i4mc0401RBIrFJBHz+RjCD
	 6T44uA7yH9mNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FEDCA9ED0;
	Mon, 12 Oct 2026 21:31:24 +0000 (UTC)
From: Vladimir Kukharenko via B4 Relay <devnull+vladimir.genproof.com@kernel.org>
Subject: [PATCH 0/5] lib/crypto: Handle large lengths in poly1305 and
 chacha20poly1305
Date: Mon, 12 Oct 2026 21:31:17 +0000
Message-Id: <20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKZRzWoC/yXMQQqDMBBA0avIrDsQoyjtVUoXThzjFImSiaKId
 2/aLt/i/xOUo7DCozgh8iYqc8gobwW4sQueUfpssMY2pTF3nIRcPJY0Y+2FcOLg06joqr5tLNW
 WTAc5XiIPsv/Gz9ffutKbXfre4Lo+98koOXoAAAA=
X-Change-ID: 20261009-libcrypto-4gib-lengths-c3d762b42b0a
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Vladimir Kukharenko <vladimir@genproof.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791840683; l=2752;
 i=vladimir@genproof.com; s=20261012; h=from:subject:message-id;
 bh=xNIifAwkZ3zfHyHYKd9B57SvHI2QibtziT5cigfmjhE=;
 b=B2tj45pTmtk9anofHBHKuIunQaJ4YIVf6sAPMRE6NnR+PqTO4gXf5G7YQ6HSQ3nbZwUk52mc6
 urC1etknsSRDRB63j1A5Z3xo93zQm9w3fAKY4uadRO3N3ROLIrvq1nr
X-Developer-Key: i=vladimir@genproof.com; a=ed25519;
 pk=EqOzBSKBgFn7ExzKj5f9T8u+1yTrGVlLBwf3fj/sdHM=
X-Endpoint-Received: by B4 Relay for vladimir@genproof.com/20261012 with
 auth_id=1169
X-Original-From: Vladimir Kukharenko <vladimir@genproof.com>
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
Reply-To: vladimir@genproof.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series makes the Poly1305 and ChaCha20-Poly1305 library code handle
large lengths:

- poly1305_update() can write past its 16-byte buffer if it holds a
  partial block and nbytes >= 2^32 - desc->buflen.
- The chacha20poly1305 functions use only the low 32 bits of their
  size_t message and associated data lengths.
- On 64-bit MIPS and RISC-V, the poly1305 assembly reads past its input
  for lengths of 2 GiB or more: these ABIs sign-extend its u32 length
  argument, and the assembly uses all 64 bits.  arm64 has the same
  prototype mismatch, with no known failure.

Patches 1-3 fix the assembly prototypes, one architecture per patch.
The assembly already treats the length as 64-bit, so they declare it as
size_t, as commit f3d6cb3dc039 ("lib/crypto: x86/sha1: Migrate
optimized code into library") did for the x86 SHA-1 assembly.
Patches 4 and 5 make poly1305_update() and chacha_crypt() take size_t
lengths.  The patches apply independently, except that on 64-bit MIPS
and RISC-V patch 4 relies on patches 1 and 2 for inputs of 2 GiB or more.

No in-tree caller passes inputs this large (WireGuard passes at most one
packet, big_key at most 1 MiB), so I consider these ABI robustness
improvements rather than fixes and have not added Fixes or Cc stable tags.

I tested with the lib/crypto KUnit suite on UML, x86_64, i386, arm64,
riscv64 and mips64, with a temporary 2 GiB KUnit test on arm64, riscv64
and mips64 (it oopses on riscv64 and mips64 without patches 1 and 2), and
in userspace against OpenSSL for inputs above 4 GiB.

I found the bugs fixed by patches 4 and 5 while writing Coq/VST proofs of
this code with LLM agents, and an LLM review of patch 4 found the one
fixed by patches 1-3.  I used an LLM-based assistant to write the patches
and descriptions, and reviewed its work.

---
Vladimir Kukharenko (5):
      lib/crypto: riscv/poly1305: Fix 32-bit length treated as 64-bit
      lib/crypto: mips/poly1305: Fix 32-bit length treated as 64-bit
      lib/crypto: arm64/poly1305: Fix 32-bit length treated as 64-bit
      lib/crypto: poly1305: Take a size_t length in poly1305_update()
      lib/crypto: chacha: Take a size_t length in chacha_crypt()

 include/crypto/chacha.h     |  4 ++--
 include/crypto/poly1305.h   |  2 +-
 lib/crypto/arm64/poly1305.h |  4 ++--
 lib/crypto/chacha.c         | 15 ++++++++++++++-
 lib/crypto/mips/poly1305.h  |  2 +-
 lib/crypto/poly1305.c       | 14 +++++++-------
 lib/crypto/riscv/poly1305.h |  2 +-
 7 files changed, 28 insertions(+), 15 deletions(-)
---
base-commit: 6a50ce0af5c91fd665d65d357af8ae55db1df7d0
change-id: 20261009-libcrypto-4gib-lengths-c3d762b42b0a

Best regards,
--  
Vladimir Kukharenko <vladimir@genproof.com>



