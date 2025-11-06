Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DA7CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eZfhW+AhFjLuOC5Y0bX40bmkfZhsNmypZdZ6HyneyOc=; b=JB8sFVcg0VSiNwPypis5Wbaump
	viV4W7b/uNGbYX61gbBy8MmW3mzjuYQtPxn75OcSkAGi+f2b9xDDicM3ls+2GyDvKRDcVnVyfC9Ja
	jyZBltVfTcsKGAlnBmf1b+pS56g+1XEqNI5LK99uCiOG1f+bQFhBOe3j7ldyj645oiHbwFZLUcXUa
	pUuK+lsWQRIcxVVxUNr1uahgFH00Jt2GlWifmHubC4fBK/EmOkZUGlTrFZUANS0anWxfefU4yoxaT
	aULA1FpnFKm9aOiL/eSbf3O2JyEC6sH3dPysBd6aL4X3xCCK6etr/FbvxqBmX4lSsgqqzGfdxi7Ov
	z5hmT7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6e5-0000000GDY0-1mvH;
	Thu, 06 Nov 2025 20:31:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6e3-0000000GDXq-1kJH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 20:31:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 105796022D;
	Thu,  6 Nov 2025 20:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C32C4CEF7;
	Thu,  6 Nov 2025 20:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762461105;
	bh=u/7TfbAlHuJ2UDT7ZAW9n8gHWzWOegJ6HHMiLpeGAv0=;
	h=Date:From:To:Cc:Subject:From;
	b=pK+B+mb3bIOm2SGfBcujpuyWAHsLgGD4gDiEL+R/1nwPkZgAM134lr//7+l8y9i0c
	 /MQoYetfY1mYJPrwkcI3yn9lUz4zyECmrbQZ3+2q5VEApE/+MA5D/DflwoRR5awkQw
	 e8XOq65sVKlOVXEofEQ1XiGqh+uBsDIe36ddNYksVHnwN4OGIF6WXFLwaicTjCbIwt
	 SQVY6MdEy3yQ5CYm7l8NBeHcqyBW6qao2FFSFvEDfuZa7ceUHmTE1M8KWBX/OUFMeQ
	 hx96Z9Y5HUwgPrFE+pdReSJ3CB7TcwQ748Fas8/jU+KeGI8exBfAD80awcy+aNt/Zm
	 ZC/WqwONBoF/w==
Date: Thu, 6 Nov 2025 12:31:36 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [GIT PULL] Crypto library fixes for v6.18-rc5
Message-ID: <20251106203136.GB7015@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The following changes since commit 1af424b15401d2be789c4dc2279889514e7c5c94:

  lib/crypto: poly1305: Restore dependency of arch code on !KMSAN (2025-10-22 10:52:10 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-for-linus

for you to fetch changes up to 44e8241c51f762aafa50ed116da68fd6ecdcc954:

  lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN (2025-11-04 09:36:22 -0800)

----------------------------------------------------------------

Two Curve25519 related fixes:

- Re-enable KASAN support on curve25519-hacl64.c with gcc.

- Disable the arm optimized Curve25519 code on CONFIG_CPU_BIG_ENDIAN=y
  kernels. It has always been broken in that configuration.

----------------------------------------------------------------
Eric Biggers (1):
      lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN

Nathan Chancellor (1):
      lib/crypto: curve25519-hacl64: Fix older clang KASAN workaround for GCC

 lib/crypto/Kconfig  | 2 +-
 lib/crypto/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

