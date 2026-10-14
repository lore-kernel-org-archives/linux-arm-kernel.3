Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806A5CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jhe7eZQZFQgn9dtfO2FFpyi1BEJY38i0MQYvqTHTFpM=; b=OA+KD+SkM0CM0BL1GLUzrkkDja
	H8bsf0YiTe5H1trZ0stpDKtMEuDgcd7rLi+O2KYir8n65BgGc5G6Ukk3obLSiDdsildnR0ktpMXjp
	TlO4f/l64puF46+3sM5rHhl6Jc8A4ARd8UPLChfU6zD9xsPr/9cQK58HiPUGr3PWtxNJjQZB0U5cm
	q+fAZbfBLIZbNcdcpISao4+kqjxtJEerq+oBU5sT1bd8GYYjTssiXHRi00QMRcO1diDeaBYMhq2XA
	tyLtCV6vJxRs2Rn9HZm2SOOIKYywB+IpE9v3KTnBoWOokxOjOAjdLPRa3CtVATS2Aq7tdlamSv30E
	chL8x9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0so-0000000FqHm-1YYl;
	Wed, 14 Oct 2026 15:27:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0sm-0000000FqHU-1vAM;
	Wed, 14 Oct 2026 15:27:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4B5C40872;
	Wed, 14 Oct 2026 15:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC461F000C4;
	Wed, 14 Oct 2026 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791991627;
	bh=Jhe7eZQZFQgn9dtfO2FFpyi1BEJY38i0MQYvqTHTFpM=;
	h=From:To:Cc:Subject:Date;
	b=XgD0sNsBZjV98IVJzmM5dernI5JLraTdtY6aqVoS4XjK6yi1Sls31aGGcm8bvbrDJ
	 zhtIuFug7MsdhvlKV5N4frCM6GYy6Iut0R/6HaOgu+MROsbuXihmnjYBOdjcetSjDi
	 0WR/+ssn4lA2G/VgsBIZHOI+lDc1KTXvSrUzu2R1ShvDApL7ZO/8bZaTAfFriu2hBs
	 5/6C/jtucS6dxBVCYjdj+iz97xqYfbzO7a+1khrZgUMCtg+UJfCjNNJM1QT8VPXYuj
	 MgOeyZeog+X4Yyxdz/pd1uSNmqgClKx2aR/e7j1OhxbW+hpkIpgpO6wSGvr/Im6Vsc
	 fx9wyurc92Rbg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kukharenko <vladimir@genproof.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/2] lib/crypto: Use size_t lengths for Poly1305 and ChaCha
Date: Wed, 14 Oct 2026 17:26:02 +0200
Message-ID: <20261014152604.323310-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.56.0
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

This series upgrades the Poly1305 and ChaCha functions to use size_t
lengths, matching the rest of the crypto library.

It also fixes the (not currently reached) handling of lengths above
S32_MAX bytes, and (not currently known to matter in practice) the
assembly functions depending on unspecified high register bits.

This more comprehensively addresses the issues identified in
https://lore.kernel.org/r/20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com

This series is targeting libcrypto-next.

Eric Biggers (2):
  lib/crypto: poly1305: Use size_t length
  lib/crypto: chacha: Use size_t length

 include/crypto/chacha.h                |  6 ++--
 include/crypto/internal/poly1305.h     |  4 +--
 include/crypto/poly1305.h              |  4 +--
 lib/crypto/arm/chacha-scalar-core.S    |  2 +-
 lib/crypto/arm/chacha.h                | 14 ++++-----
 lib/crypto/arm/poly1305.h              |  8 +++---
 lib/crypto/arm64/chacha.h              | 10 +++----
 lib/crypto/arm64/poly1305.h            |  6 ++--
 lib/crypto/chacha.c                    |  8 +++---
 lib/crypto/mips/chacha.h               |  5 ++--
 lib/crypto/mips/poly1305.h             |  2 +-
 lib/crypto/poly1305-donna32.c          |  2 +-
 lib/crypto/poly1305-donna64.c          |  2 +-
 lib/crypto/poly1305.c                  | 10 +++----
 lib/crypto/powerpc/chacha-p10le-8x.S   |  2 +-
 lib/crypto/powerpc/chacha.h            | 10 +++----
 lib/crypto/powerpc/poly1305-p10le_64.S | 23 ++++++++-------
 lib/crypto/powerpc/poly1305.h          |  8 ++++--
 lib/crypto/riscv/chacha.h              |  6 ++--
 lib/crypto/riscv/poly1305.h            |  2 +-
 lib/crypto/s390/chacha.h               |  2 +-
 lib/crypto/x86/chacha.h                | 40 +++++++++++++-------------
 lib/crypto/x86/poly1305.h              |  4 +--
 23 files changed, 91 insertions(+), 89 deletions(-)


base-commit: 40f47fa10a1d19c74f48a13d97b2eb19d5fb938d
-- 
2.56.0


