Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5916C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 18:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sTAkkOXoUZtDmdZllwQgnidVESbbjyPtWfKwf5z0Fy4=; b=ZWX1zcyqZZmqd8ptJ3g3sSeldE
	zNgg7C/v58cOAxmax4uRFnj7uf5XKg97tzeCbNLH3jqewVUdzUc1fUO6Ums9T/OqixkXmlspYEk9e
	PxEWfzp7YMiqtxLZJzpNZcDm8iUIR7eqh/VxvHRIlZejRPtC9qBx7zM/g6RK12Q4pE1206PeMLXSI
	hUMSnrTfuje/aHK+8s2hc6yXzfsqUE13V+l2LE/rw6/n13KcA85LLktZma8lmqexPK+po6+5cA/U7
	yVO7KulGt8ER7OmBMnPjxCGF3qItHLywxNxhQVP1nTFHQVWPIIRgozliLbuDe0JLZnHQLrq+TrWB8
	CUIOHVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0RU-00000008Gc5-1bPz;
	Mon, 05 May 2025 18:21:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0PU-00000008GDM-2SSD;
	Mon, 05 May 2025 18:19:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8BE8BA4C65C;
	Mon,  5 May 2025 18:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9282EC4CEE4;
	Mon,  5 May 2025 18:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746469162;
	bh=pbhM6rLT2xsCdlCwZPtBBqUWZLiG5jVy62L9rIqPZ4I=;
	h=From:To:Cc:Subject:Date:From;
	b=mzytHTPCELw1tkhhvQDNh8uKIRJjgJDj3AlNf+4JofNJtTifEWR30wCTuxKIyu0me
	 QN+7I66DbuHlus5hisqRBjCEh2nK1WKef2WDYjS12LNJWbiAHOoXEY/+frhhJOs497
	 DCqrG5f1RXOBfUBx8+nMklnWQucJNibqQ22tBCji4XqbKfMSc39BF+4s67mQ7nL4kI
	 ES2QJJScttT2ogYASeUY34JaWu7woaOruNgPT2l94Bb2iZ748DXJiKnUnv4ffYgrr7
	 fKbP2C5npdC7BsQnHGZcHBIpVQfg6boJRuZvJnlqJ5+xRXN2IfkemruT37Sw+qDPKy
	 x14IyErqCxSbg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH 0/4] crypto: lib/chacha - improve type safety
Date: Mon,  5 May 2025 11:18:20 -0700
Message-ID: <20250505181824.647138-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_111924_692602_82555A08 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

This series can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git chacha-prototypes-v1

This series improves type safety and clarity in the ChaCha functions by
strongly typing the state array and adding explicit array bounds for
other fixed-length arrays.  No functional changes.

Eric Biggers (4):
  crypto: lib/chacha - strongly type the ChaCha state
  crypto: lib/chacha - use struct assignment to copy state
  crypto: lib/chacha - add strongly-typed state zeroization
  crypto: lib/chacha - add array bounds to function prototypes

 arch/arm/lib/crypto/chacha-glue.c             | 34 ++++----
 arch/arm/lib/crypto/chacha-scalar-core.S      |  5 +-
 arch/arm64/lib/crypto/chacha-neon-glue.c      | 27 ++++---
 arch/mips/lib/crypto/chacha-glue.c            |  6 +-
 arch/powerpc/lib/crypto/chacha-p10-glue.c     | 17 ++--
 arch/powerpc/lib/crypto/chacha-p10le-8x.S     |  6 +-
 arch/riscv/lib/crypto/chacha-riscv64-glue.c   |  9 ++-
 arch/riscv/lib/crypto/chacha-riscv64-zvkb.S   | 10 +--
 arch/s390/lib/crypto/chacha-glue.c            | 13 +--
 arch/x86/lib/crypto/chacha_glue.c             | 62 ++++++++------
 crypto/chacha.c                               | 20 ++---
 drivers/char/random.c                         | 41 +++++-----
 fs/bcachefs/checksum.c                        | 18 ++---
 include/crypto/chacha.h                       | 80 ++++++++++++-------
 lib/crypto/chacha.c                           | 40 +++++-----
 lib/crypto/chacha20poly1305-selftest.c        |  8 +-
 lib/crypto/chacha20poly1305.c                 | 53 ++++++------
 lib/crypto/libchacha.c                        |  2 +-
 .../crypto/chacha20-s390/test-cipher.c        | 10 +--
 19 files changed, 253 insertions(+), 208 deletions(-)


base-commit: 64745a9ca890ed60d78162ec511e1983e1946d73
-- 
2.49.0


