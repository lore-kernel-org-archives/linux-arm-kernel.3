Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 21:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NsCZd2inHqAf0yKoff0xHkh9GnpXvZWNXrZtp2y4ing=; b=EUELqG5SahNhAv8FqTSbBfJTAr
	KVLa58aSfuGrXdKAkOxz+cxVRmDn8Z9qDKKPRhhcPRWgHJyX7Hk/psWLmLvlx/+uiiO7vZWkabc17
	LEWtHDeyh3tLbJd/Z0LK0jefMxE9UWcJ7shrOcj02Bb3SrLh7dP24eX4DrUxPA3XNMZZBaYwthwwh
	PlCMXa426MSZmoEkRX3Ftf56y0wo9lz0d+orx4ToKdQt/xKH+orY2XZTcaR7XQvTZey73ombc7JxJ
	gseDn2XCQLJQ1f9DElyuS55OsRZpCC4ThAwvPZ8lhAOpHZd+keyTnfmhCDvKp++cPzd94SYStg5nJ
	BxD5xPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1L9-00000007kPs-1VTN;
	Sun, 12 Jul 2026 21:03:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1L7-00000007kPX-23Aa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 21:03:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA1AB4099A;
	Sun, 12 Jul 2026 21:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A33E1C2BCB7;
	Sun, 12 Jul 2026 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783890232;
	bh=EwpmvuLDSJe+PvdmUDmsI/3LRWiTL+fqy8/3bHV8lwU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=evl7KOnSfddybwbNyHhrtw+YhYOp0D5UjWVapRsF8CGZEfh0jnUjif5+KoJYk4CoS
	 lniF8An8f1WxTu35Vze8iUXeuloUkb4/69MHmDvRxdU9r6m33gq1WDovyXQgaZmR20
	 o5NZF5REx1kMFLqqLJMmKgn4oi5nqBTI3iQ5nHeW/+JGPbPQPX6FEniXNX8bnVTX8w
	 7SFU7axYoosRn7nQrNu2nnepd0/YX4ZZua2gjpaziFHU1RJ36eGFJZcGA5V4KXKpQD
	 HO6H5PikLbYHwhzfT8TXmnwmvoUODwIRKvakSvvml50JL73sfFtUxCfn27NrfUN6tE
	 OrBt+ltU/wY3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDEBC43458;
	Sun, 12 Jul 2026 21:03:52 +0000 (UTC)
From: Demi Marie Obenour via B4 Relay <devnull+demiobenour.gmail.com@kernel.org>
Date: Sun, 12 Jul 2026 17:03:47 -0400
Subject: [PATCH] drivers/crypto: Mark QCE as BROKEN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-qce-broken-v1-1-85e2bff17871@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mj3cLkVN2kovzs1DxdMwNjUwsz42RDk0QDJaCGgqLUtMwKsGHRsbW
 1AGU/NSRcAAAA
X-Change-ID: 20260712-qce-broken-6035863c14a0
To: Russell King <linux@armlinux.org.uk>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>
Cc: Eric Biggers <ebiggers@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783890232; l=3381;
 i=demiobenour@gmail.com; s=20250731; h=from:subject:message-id;
 bh=k+Q6SSK3eTUVW0/qFAAgRAvug1Z5DMEW0/J5hlhyk2I=;
 b=StJ2payYfWR0FwYTFzR6HC8De01jA9tRWE3JUXyX06tFBdgjgm0QitaWN+s7htiFHYIYQb1/z
 6XE+JD/Ey9xB7/cy/lUdZ5n50XDF9SgpToK/5bKdImteoHvPnq/Eyay
X-Developer-Key: i=demiobenour@gmail.com; a=ed25519;
 pk=4iGY+ynEKxIfs+fIUK9EzsvZ44yGE0GvXLeLTPKKPhI=
X-Endpoint-Received: by B4 Relay for demiobenour@gmail.com/20250731 with
 auth_id=473
X-Original-From: Demi Marie Obenour <demiobenour@gmail.com>
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
Reply-To: demiobenour@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Demi Marie Obenour <demiobenour@gmail.com>

This driver is harmful:

- It is much slower than the CPU [1] [2].
- It Has a history of bugs [2] [3].
- It does not have exclusive access to the hardware [4], causing races
  with the secure world.
- It register its implementations with too low a cra_priority for them
  to be actually used [5].

Therefore, disable it to ensure that nobody builds it into kernels they
intend to ship.

In the future, the driver will be used for processing restricted media
content.  However, the kernel does not currently support this.  Since
the driver will have future uses, allow building it if COMPILE_TEST is
enabled.

[1]: https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
[2]: https://lore.kernel.org/r/20250615031807.GA81869@sol/
[3]: https://lore.kernel.org/r/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com/
[4]: https://lore.kernel.org/r/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com/
[5]: https://lore.kernel.org/r/20260524204537.GB110177@quark/

Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 -
 arch/arm64/configs/defconfig        | 1 -
 drivers/crypto/Kconfig              | 6 +++++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 01e016752c4d425e59a1a499abb8df8845aa9833..13d85a0e8580000235b4dbf6d0911b4e09af199d 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1321,7 +1321,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 76ce07a08d5ac45bc4a4890c3f1aa7391de346fd..c624cdd122d144ad7e052f965c20c9bdcb3bd2e1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1940,7 +1940,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 03a8f7a1f75e878846dcf34da1265828949fbd9c..0189dfdcbbe11098ead0ea194293422a31d8fe65 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -528,13 +528,17 @@ source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
 	tristate "Qualcomm crypto engine accelerator"
-	depends on ARCH_QCOM || COMPILE_TEST
+	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This driver supports Qualcomm crypto engine accelerator
 	  hardware. To compile this driver as a module, choose M here. The
 	  module will be called qcrypto.
 
+	  This driver does not have exclusive access to the
+	  hardware, causing races with the secure world.  It
+	  is also slower than the CPU.
+
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool
 	depends on CRYPTO_DEV_QCE

---
base-commit: e264401ce4776a288524e5b87593d4d864147115
change-id: 20260712-qce-broken-6035863c14a0

Best regards,
-- 
Demi Marie Obenour <demiobenour@gmail.com>



