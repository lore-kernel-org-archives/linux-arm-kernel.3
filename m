Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C608CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 19:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WN5vnPFviUeFL5NXDKTxF5DmYlONBZ8T8/DEkRn0fw8=; b=AE27R6OetsiR4WcQG70dfxz9Xp
	lYnUg5SQx/pguYKAkMoNeZkY02NRw+B7qRCq6k1qRmNilshL5dig6B2Ybnt5i/eUKMFIbQPuvBMJ6
	Jw+Gxa8uy7r8Ggsvoashyl+kjX/P9oGBSLWmymYJ1hBl0nbWv9x6BJqtGU1XgkGyhuHyO15m0wfPj
	0zpY1+FygOMx8UM8zQRfRSIaA/x0tNSb43gFeCaed/LZXlpk7C/2HDQv9afwuNP14qz1QOc/n1ABy
	JQeZoxeN48OzjHk67Ma9ohQvPU9YXKO+pabF9ccsfqBzQ6c3MiWbHjrNeRUz0R75Z2//w1wsUeIWz
	cJ8TGHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTlkV-00000009qgR-3IPX;
	Sun, 31 May 2026 19:23:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTlkU-00000009qfj-2Tby
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 19:23:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 93CB7601FE;
	Sun, 31 May 2026 19:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D711F00893;
	Sun, 31 May 2026 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780255381;
	bh=WN5vnPFviUeFL5NXDKTxF5DmYlONBZ8T8/DEkRn0fw8=;
	h=From:To:Cc:Subject:Date;
	b=dws3z4c5ikBkfSFjo03lEPKwSoWHgcPAbhf9k5unktZ3mh+aPsy4L9BZpZ0dwksA8
	 XHAPpNzc0rXNaelTshQnFrU6Wuumrraa3dFfyDfWD+/cJ+CbCJcPMfFaqlAskJel0X
	 cVqQpMiqosVafTcv/drCo37ZULK0CNZn8dEQHkPyO4L5CWPGtEoB4aAmaHVGWtrtHK
	 yILr4yvSAw0u0BC0CnAzZABaTdS+HORKE9/DUY8HMcdOZv0+o5uvyl5oEHh002aEtL
	 rYfUY97EFov4bwIHdZEfpOTu6+OS+S8nsG9G6iQrDLozVYPZM3Kz/9+WCOGOU0XXN7
	 6X0C7V24/pnRQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-kernel@vger.kernel.org,
	Mounika Botcha <mounika.botcha@amd.com>,
	Harsh Jain <h.jain@amd.com>,
	Olivia Mackall <olivia@selenic.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/4] Xilinx TRNG fix and simplification
Date: Sun, 31 May 2026 12:17:34 -0700
Message-ID: <20260531191738.55843-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
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

This series fixes and greatly simplifies the Xilinx TRNG driver by:

- Removing the gratuitous crypto_rng interface, leaving just hwrng which
  is the one that actually matters.

- Replacing the really complicated AES based entropy extraction
  algorithm with a much simpler one.

Note that this mirrors similar changes in other drivers.

Eric Biggers (4):
  crypto: xilinx-trng - Remove crypto_rng interface
  crypto: xilinx-trng - Fix return value of xtrng_hwrng_trng_read()
  crypto: xilinx-trng - Replace crypto_drbg_ctr_df() with HMAC-SHA512
  hwrng: xilinx - Move xilinx-rng into drivers/char/hw_random/

 MAINTAINERS                                   |   2 +-
 arch/arm64/configs/defconfig                  |   2 +-
 crypto/Kconfig                                |   5 -
 crypto/Makefile                               |   2 -
 crypto/df_sp80090a.c                          | 222 ------------------
 drivers/char/hw_random/Kconfig                |  11 +
 drivers/char/hw_random/Makefile               |   1 +
 .../xilinx => char/hw_random}/xilinx-trng.c   | 134 ++---------
 drivers/crypto/Kconfig                        |  13 -
 drivers/crypto/xilinx/Makefile                |   1 -
 include/crypto/df_sp80090a.h                  |  53 -----
 11 files changed, 37 insertions(+), 409 deletions(-)
 delete mode 100644 crypto/df_sp80090a.c
 rename drivers/{crypto/xilinx => char/hw_random}/xilinx-trng.c (75%)
 delete mode 100644 include/crypto/df_sp80090a.h


base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
prerequisite-patch-id: 07e982b663ac3f8312ca524f6b91b5b38661df5e
prerequisite-patch-id: 72064361a8f36e015ab0b7e1fa4d364b40d90506
prerequisite-patch-id: 8978b8e0db7f47935e5f6f0aff14a97f55d3073c
prerequisite-patch-id: 6aa0e3e93a008279d71e535a3d0cf48643f55e19
-- 
2.54.0


