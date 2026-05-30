Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672B4CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFTi6Phf8WKLD7q/mNNfxoLqb45y5zUq92DGVlbSmFg=; b=Gh0Ed+9zlL7IalZ59zxy5/UFms
	Izm/Bo7RUvcrJ6QhFvPiiBnklrFcnz2TGoxrAYy2SdpTY6IACvCkzP2r7W4ccNOQ9f4dFuG/6xXwg
	ubgBAZQ4++pL5Gpxq0dgVV89hoP+O5uWqJnco8yMaCBSbtuh2sn5tY99Ar9qNj3V2kc6jUkFmI8Ej
	d2V+9PfiQB7dK6XcJ7joytJ0eziCzXLWJbYy0OeIfRY5RY0xYhb9PnKSFvrksN/kHzhz6NOE0DpeS
	EvYIXBggsTQWMlQMqnEHrdaiYWdSK4jw4Poo1uVof8RV2yNSagSffbozuQvVN29AQ7UOKtkNVLKUs
	fPt2BReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTQHO-000000092wq-0X9k;
	Sat, 30 May 2026 20:27:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTQHL-000000092vn-2Sj9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 20:27:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DFE5435EF;
	Sat, 30 May 2026 20:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9461F00893;
	Sat, 30 May 2026 20:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780172850;
	bh=wFTi6Phf8WKLD7q/mNNfxoLqb45y5zUq92DGVlbSmFg=;
	h=From:To:Cc:Subject:Date;
	b=C+DRcYR9EJkOTLmYNwqj2iirQ34NpDmY2nKz9KonGffvKz2FcEIlf0jkkO7aU9YVb
	 /gcwwGq7ZmaoPCFCVh4qHo3116Bj3LkS6y3GdRd/xte5SbvDIC1hZuPCZqgpVsem8e
	 b3UIIT6E1BZkkl4SCE0rNYSnvWukD+TgPLqCHrkm5hRD1A5WXUzHLxGEOaBN0ACYL+
	 xjlbcti0jBI4V3qMrdjdMk9fzoWnNPMU+lj+TlI5PAxlUwv8wsmtYF8VgXCcH6SFT7
	 2t8kmYEsZRjOCvr0s75Q0vdPgs7d857qwse+1MBzlHKScIjylRVCnwoHTJMGCh0p4S
	 fIS+eISfyFMbg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Olivia Mackall <olivia@selenic.com>,
	Weili Qian <qianweili@huawei.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/2] HiSilicon TRNG fix and simplification
Date: Sat, 30 May 2026 13:26:22 -0700
Message-ID: <20260530202624.20768-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_132731_653095_2773B664 
X-CRM114-Status: UNSURE (   9.57  )
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

This series fixes and greatly simplifies the HiSilicon TRNG driver by
removing the gratuitous crypto_rng interface, leaving just hwrng which
is the one that actually matters.

Note that this mirrors similar changes in other drivers such as qcom-rng
(https://lore.kernel.org/r/20260530020332.143058-1-ebiggers@kernel.org)

Eric Biggers (2):
  crypto: hisi-trng - Remove crypto_rng interface
  hwrng: hisi-trng - Move hisi-trng into drivers/char/hw_random/

 MAINTAINERS                            |   2 +-
 arch/arm64/configs/defconfig           |   2 +-
 drivers/char/hw_random/Kconfig         |  10 +
 drivers/char/hw_random/Makefile        |   1 +
 drivers/char/hw_random/hisi-trng-v2.c  |  98 +++++++
 drivers/crypto/hisilicon/Kconfig       |   8 -
 drivers/crypto/hisilicon/Makefile      |   1 -
 drivers/crypto/hisilicon/trng/Makefile |   2 -
 drivers/crypto/hisilicon/trng/trng.c   | 390 -------------------------
 9 files changed, 111 insertions(+), 403 deletions(-)
 create mode 100644 drivers/char/hw_random/hisi-trng-v2.c
 delete mode 100644 drivers/crypto/hisilicon/trng/Makefile
 delete mode 100644 drivers/crypto/hisilicon/trng/trng.c


base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
prerequisite-patch-id: 07e982b663ac3f8312ca524f6b91b5b38661df5e
prerequisite-patch-id: 72064361a8f36e015ab0b7e1fa4d364b40d90506
prerequisite-patch-id: 8978b8e0db7f47935e5f6f0aff14a97f55d3073c
prerequisite-patch-id: 6aa0e3e93a008279d71e535a3d0cf48643f55e19
-- 
2.54.0


