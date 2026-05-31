Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0053FCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drqfjg2nZ2DWxQu7emk2SfhIy7vMmsaoIWRnmhbe+wg=; b=pUNe9TB6ZrxsfMdghB781oWdP3
	BwhAcjGeW48crYuNPuUtntl5RpAFoimqYW1Yx7q6xasi2OEAmVLB1BO0VWXMtl+EIQUZyuTiwFUZM
	PaeROpnDqPXZhxtSEvQT1DFKljPxewADJEpgsglri5dmaE7C7iQWo7bAmnPXWQsCNOfPQA1XMcyhS
	OS6sxzE1HCvdw+GdMSiB45/3i8dNFCgdCuzWb5Fqtgnyv9J7FJ974qgGKskugzacyOmJ85Ui4Y2eo
	45S61Ia724pK/SEmMOHqsSYk1xBOLnog1LZElMq4LezJdXIvGfzzUX/seuYbauw3T3X5tdyhaYrgt
	L+q00/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTlkb-00000009qhq-05xn;
	Sun, 31 May 2026 19:23:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTlkV-00000009qgQ-2zSi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 19:23:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DA79601FF;
	Sun, 31 May 2026 19:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6F61F00893;
	Sun, 31 May 2026 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780255382;
	bh=drqfjg2nZ2DWxQu7emk2SfhIy7vMmsaoIWRnmhbe+wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ko/tba3HLKucRJKVb3n0g3z/DuDY3BwGUbsgQq5qmDji6k2rtknzK3v1XdF/n1ncS
	 KkLOlk1cBZV+gTSjYpH+VKue3FcrF8L5ehR4iWlPd2UFnyXlupEcQmCUIWBRfdZXpv
	 O72ubfn8Is/ge2oVoCQq3Z3qWroJcyMGYXfKivzsadsM2pnTWCh6DvUKVUKhVNRY8J
	 gqVdaHtXv/vRrzrqpBSpBP7Hc2gm2OOHfxjeKhR2wPlckbbjrtD1vWjs9NN7Cksj/p
	 vUH1W+E0f71DQNyNey/AjnAk7obXtDpgLEdXF8T74+bNJGE2WszX6UBRCt7WLPU7h6
	 oEg2cxsT681IA==
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
Subject: [PATCH 4/4] hwrng: xilinx - Move xilinx-rng into drivers/char/hw_random/
Date: Sun, 31 May 2026 12:17:38 -0700
Message-ID: <20260531191738.55843-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531191738.55843-1-ebiggers@kernel.org>
References: <20260531191738.55843-1-ebiggers@kernel.org>
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

Since this file just implements a hwrng driver, move it into
drivers/char/hw_random/.  Rename the kconfig option accordingly as well.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 MAINTAINERS                                          |  2 +-
 arch/arm64/configs/defconfig                         |  2 +-
 drivers/char/hw_random/Kconfig                       | 11 +++++++++++
 drivers/char/hw_random/Makefile                      |  1 +
 .../{crypto/xilinx => char/hw_random}/xilinx-trng.c  |  0
 drivers/crypto/Kconfig                               | 12 ------------
 drivers/crypto/xilinx/Makefile                       |  1 -
 7 files changed, 14 insertions(+), 15 deletions(-)
 rename drivers/{crypto/xilinx => char/hw_random}/xilinx-trng.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 882214b0e7db..a593e78c30fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29218,11 +29218,11 @@ F:	include/uapi/misc/xilinx_sdfec.h
 
 XILINX TRNG DRIVER
 M:	Mounika Botcha <mounika.botcha@amd.com>
 M:	Harsh Jain <h.jain@amd.com>
 S:	Maintained
-F:	drivers/crypto/xilinx/xilinx-trng.c
+F:	drivers/char/hw_random/xilinx-trng.c
 
 XILINX UARTLITE SERIAL DRIVER
 M:	Peter Korsgaard <jacmet@sunsite.dk>
 L:	linux-serial@vger.kernel.org
 S:	Maintained
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bb930cce7233..d8fb11e4c36d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -549,10 +549,11 @@ CONFIG_IPMI_HANDLER=m
 CONFIG_IPMI_DEVICE_INTERFACE=m
 CONFIG_IPMI_SI=m
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_HW_RANDOM_QCOM=m
+CONFIG_HW_RANDOM_XILINX=m
 CONFIG_TCG_TPM=y
 CONFIG_TCG_TIS=m
 CONFIG_TCG_TIS_SPI=m
 CONFIG_TCG_TIS_SPI_CR50=y
 CONFIG_TCG_TIS_I2C_CR50=m
@@ -1953,11 +1954,10 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
 CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
-CONFIG_CRYPTO_DEV_XILINX_TRNG=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
 CONFIG_CRYPTO_DEV_CCREE=m
 CONFIG_CRYPTO_DEV_HISI_SEC2=m
 CONFIG_CRYPTO_DEV_HISI_ZIP=m
diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 7102e03dcf0a..e0a53ba558a0 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -624,10 +624,21 @@ config HW_RANDOM_QCOM
 	  Generator hardware found on some Qualcomm SoCs.
 
 	  To compile this driver as a module, choose M here. The
 	  module will be called qcom-rng. If unsure, say N.
 
+config HW_RANDOM_XILINX
+	tristate "Support for Xilinx True Random Generator"
+	depends on ZYNQMP_FIRMWARE || COMPILE_TEST
+	select CRYPTO_LIB_SHA512
+	help
+	  Xilinx Versal SoC driver provides kernel-side support for True Random Number
+	  Generator and Pseudo random Number in CTR_DRBG mode as defined in NIST SP800-90A.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called xilinx-trng.
+
 endif # HW_RANDOM
 
 config UML_RANDOM
 	depends on UML
 	select HW_RANDOM
diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
index 605ba8df5a8f..470004ad841a 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -51,5 +51,6 @@ obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) += arm_smccc_trng.o
 obj-$(CONFIG_HW_RANDOM_CN10K) += cn10k-rng.o
 obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) += mpfs-rng.o
 obj-$(CONFIG_HW_RANDOM_ROCKCHIP) += rockchip-rng.o
 obj-$(CONFIG_HW_RANDOM_JH7110) += jh7110-trng.o
 obj-$(CONFIG_HW_RANDOM_QCOM) += qcom-rng.o
+obj-$(CONFIG_HW_RANDOM_XILINX) += xilinx-trng.o
diff --git a/drivers/crypto/xilinx/xilinx-trng.c b/drivers/char/hw_random/xilinx-trng.c
similarity index 100%
rename from drivers/crypto/xilinx/xilinx-trng.c
rename to drivers/char/hw_random/xilinx-trng.c
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index ad6427f08d4f..451d61b33143 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -704,22 +704,10 @@ config CRYPTO_DEV_TEGRA
 
 	help
 	  Select this to enable Tegra Security Engine which accelerates various
 	  AES encryption/decryption and HASH algorithms.
 
-config CRYPTO_DEV_XILINX_TRNG
-	tristate "Support for Xilinx True Random Generator"
-	depends on ZYNQMP_FIRMWARE || COMPILE_TEST
-	select CRYPTO_LIB_SHA512
-	select HW_RANDOM
-	help
-	  Xilinx Versal SoC driver provides kernel-side support for True Random Number
-	  Generator and Pseudo random Number in CTR_DRBG mode as defined in NIST SP800-90A.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called xilinx-trng.
-
 config CRYPTO_DEV_ZYNQMP_AES
 	tristate "Support for Xilinx ZynqMP AES hw accelerator"
 	depends on ZYNQMP_FIRMWARE || COMPILE_TEST
 	select CRYPTO_AES
 	select CRYPTO_ENGINE
diff --git a/drivers/crypto/xilinx/Makefile b/drivers/crypto/xilinx/Makefile
index 9b51636ef75e..730feff5b5f2 100644
--- a/drivers/crypto/xilinx/Makefile
+++ b/drivers/crypto/xilinx/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_CRYPTO_DEV_XILINX_TRNG) += xilinx-trng.o
 obj-$(CONFIG_CRYPTO_DEV_ZYNQMP_AES) += zynqmp-aes-gcm.o
 obj-$(CONFIG_CRYPTO_DEV_ZYNQMP_SHA3) += zynqmp-sha.o
-- 
2.54.0


