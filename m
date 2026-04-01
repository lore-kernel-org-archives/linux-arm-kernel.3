Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3789310F930F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fvambGlnatimuA5QcWp4VX9eoY1YbogQ7lSORsG2C+U=; b=odwVL9SwdtE6m93e8QKhlLpcaH
	jHiWSwhVbhbJd2IP+qS+1eS5W9ScNBSLWUlLYOci4hAq5VAYiUl4Zt2siGG5whdek2CSo3qBo2iOX
	7M2zTM9soex6dVSeEaIZJ2w7J7v2nrX2BUd9Gdhoto2bXZY0+e2CFveRRRbUSa02e9O6Mec8bVM1u
	RbcTRTwOAi5Pqq8bTg5PzhqllZnCk3UWYtTmEDIwfejI1DWBvi38mKyZpIIyzDETUDgGr3amxzhqr
	8X0cZWw4wI3orfgMoqBqt0H7wyg3wOGO32nsNkVFL8sR2UCuMgfQI9XnfjQkr8bzPTjx7g35ScEcw
	AW6DKd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7f-0000000DiBk-0geb;
	Wed, 01 Apr 2026 00:07:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7d-0000000DiAk-3gkv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCED8600C4;
	Wed,  1 Apr 2026 00:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F62C19423;
	Wed,  1 Apr 2026 00:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002068;
	bh=8Wk+kFZc7waXaSJYEDxUWXjaoxO2Oov/KreukESiZx4=;
	h=From:To:Cc:Subject:Date:From;
	b=JKccItLGonJH94enETWtGvP+7Klm94Wx+xVq6BFbRvITQ2tuq30dxzZHrbqp8QDjV
	 c09IurE9gRIlpp//Af/aO2fpUznFYNc7MdxdENK4GNv6QLbWP6+7rIQ3/Q6thZzN06
	 QGk9SC6huu5X38URLd4a5tapogBPffk8JNbSQ3cc/NMnoh/oksvMD63POwbzk13peq
	 L6DNZb+diqu+AU+PMN4jaF0J64Ke+8uMZVYG5aia3OFYy/rXblOatq/ByIRA/8FrXA
	 2qLIyAhtYpqlrmvXAPmqcy49wiuzJdhygT+C1nzTc1Py60t6OIxy8G20wsKpKQ2uHA
	 vzmJ2PzyXL9zA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/9] lib/crypto: arm64: Remove obsolete chunking logic
Date: Tue, 31 Mar 2026 17:05:39 -0700
Message-ID: <20260401000548.133151-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Since commit aefbab8e77eb ("arm64: fpsimd: Preserve/restore kernel mode
NEON at context switch"), kernel-mode NEON sections have been
preemptible on arm64.  And since commit 7dadeaa6e851 ("sched: Further
restrict the preemption modes"), voluntary preemption is no longer
supported on arm64 either.  Therefore, there's no longer any need to
limit the length of kernel-mode NEON sections on arm64.

This series simplifies the code in lib/crypto/arm64/ accordingly by
using longer kernel-mode NEON sections instead of multiple shorter ones.

This series is targeting libcrypto-next.

Eric Biggers (9):
  lib/crypto: arm64/aes: Remove obsolete chunking logic
  lib/crypto: arm64/chacha: Remove obsolete chunking logic
  lib/crypto: arm64/gf128hash: Remove obsolete chunking logic
  lib/crypto: arm64/poly1305: Remove obsolete chunking logic
  lib/crypto: arm64/sha1: Remove obsolete chunking logic
  lib/crypto: arm64/sha256: Remove obsolete chunking logic
  lib/crypto: arm64/sha512: Remove obsolete chunking logic
  lib/crypto: arm64/sha3: Remove obsolete chunking logic
  arm64: fpsimd: Remove obsolete cond_yield macro

 arch/arm64/crypto/aes-ce-ccm-glue.c | 13 ++++-------
 arch/arm64/include/asm/assembler.h  | 22 ------------------
 include/crypto/aes.h                |  6 ++---
 lib/crypto/arm64/aes-modes.S        |  8 +++----
 lib/crypto/arm64/aes.h              | 35 +++++++++++------------------
 lib/crypto/arm64/chacha.h           | 16 ++++---------
 lib/crypto/arm64/gf128hash.h        | 24 ++++----------------
 lib/crypto/arm64/poly1305.h         | 14 ++++--------
 lib/crypto/arm64/sha1-ce-core.S     | 14 +++++-------
 lib/crypto/arm64/sha1.h             | 15 ++++---------
 lib/crypto/arm64/sha256-ce.S        | 14 +++++-------
 lib/crypto/arm64/sha256.h           | 29 +++++++-----------------
 lib/crypto/arm64/sha3-ce-core.S     |  8 +++----
 lib/crypto/arm64/sha3.h             | 15 ++++---------
 lib/crypto/arm64/sha512-ce-core.S   | 12 +++++-----
 lib/crypto/arm64/sha512.h           | 15 ++++---------
 16 files changed, 73 insertions(+), 187 deletions(-)


base-commit: 7ac21b4032e5b9b8a6a312b6f1d54f4ba24d1c16
-- 
2.53.0


