Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF590D6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hDreSK7p9XUyleP0haRlGmgTrkG2kGfguBQ8amp4EDc=; b=LdyHYOZFzqhfU6pz0QpoGBKzJy
	l/zo5v+9uEnMJtFEsP80/SOMfjn8shKvuQ13XiG1bBSsM4LloGwXHPI5qrFC596/VwG7TXCG6tQJz
	VcO+QQLX6cgLSYG6T8+PV7zout/BAJ7X4z95BVZ9LRe1Ks2wgVCcwfUlM5SSQTBpVYm/2433USOR2
	385OJa8h+8iDBWrD5exClfq6wEOulodIieodpMqkq6HYPePov1Zwe0Rvpp7JSid5vn68UJAMCJwlm
	KEU5Oe4m9MZT+uzoMrOy7hwagVufLZ2tvfLUxRJDg+bDuSkUXXoUBV+EhrDzkicm/rTESkzCIhT7A
	8XUqcaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKL-000000092h9-44C6;
	Thu, 18 Dec 2025 19:06:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKK-000000092gt-2EaR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:06:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D7C9600AC;
	Thu, 18 Dec 2025 19:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CE2C4CEFB;
	Thu, 18 Dec 2025 19:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766084775;
	bh=hcPZnrm8YPqK45k98pFrwJEZ6Doc8/FaNbmeUK/pRcs=;
	h=Date:From:To:Cc:Subject:From;
	b=OmfKrH3sdzJSRkoXJ83lIbxEEMpI6kqcJN5wTqrQCjc8uVBzAFXNvdaY2k/5B8wRD
	 8m7kisIx5Shmacsr1hm2rcWM17HR55lMyEyhLyIWTv0xYtBj9O6siyRJaz/csdGpg6
	 X5JvayyvvvE5/vZd/zCDjEaM6BsHDbz64oLnyaz/dr1nDW/s6vIMMOQKh3Lg6v26OF
	 APPJGQ45a46r8pjFrxYH+CX8SmgvstwEYFV+VMWV3IeMXYph7o0WY3mHouwnGZZElL
	 mEuKn/LCsdq/8EyHMfThGZK+gqeLvLnmWv2O3+ckjrjFa58dhRBZN8yHVc4KLHn4iV
	 pIt8OgedhaW8Q==
Date: Thu, 18 Dec 2025 11:06:06 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>
Subject: [GIT PULL] Crypto library fixes for v6.19-rc2
Message-ID: <20251218190606.GB21380@sol>
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-fixes-for-linus

for you to fetch changes up to 5a0b1882506858b12cc77f0e2439a5f3c5052761:

  lib/crypto: riscv: Add poly1305-core.S to .gitignore (2025-12-14 10:18:22 -0800)

----------------------------------------------------------------

 - Fix a performance issue with the scoped_ksimd() macro (new in 6.19)
   where it unnecessarily initialized the entire fpsimd state.

 - Add a missing gitignore entry for a generated file added in 6.18.

----------------------------------------------------------------
Ard Biesheuvel (1):
      arm64/simd: Avoid pointless clearing of FP/SIMD buffer

Charles Mirabile (1):
      lib/crypto: riscv: Add poly1305-core.S to .gitignore

 arch/arm64/include/asm/simd.h | 9 ++++++++-
 lib/crypto/riscv/.gitignore   | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 lib/crypto/riscv/.gitignore

