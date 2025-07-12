Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142EAC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zx0KRsr6Z94mFqcy8f/S8MW+ZSAXG2w2PHmp+/LpmB8=; b=OYaYFL09TZAJn+kamAIMXSj0Xe
	q0yR5k6fKaX01PA8ci2tLZeMJ+BvY0HXQyKZVKjmXbe7IXt/XqGCc9683I7E7WUsho6ubAj0vvoAm
	PB4QBZGJAiRZkPtWipEUFV5VuZ1EeGfdHDsVTXJPTlpxLA2TiQNLkYCWQ8d3EjzFg7y4A7U56bU5I
	pKTvQ5gWSwmmClbBtD+6bnEuS8wTneGeOU6ViCaQBHmOuII3zWzhKq57W/+HU20KueBRxWpVw4ODF
	nJDDxlTnZcoamGsb928ST7vdwgJSdRuXP15vPQQj+4D1rGXug1y4P9jAdLnTJtCYS/rOlpMX/+hD5
	NLu/e7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakUR-0000000HCNC-446U;
	Sun, 13 Jul 2025 00:22:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajbz-0000000H7fU-12p6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C44DE5C5586;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D7EC4CEF7;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362790;
	bh=CDCYvw9FzfgzLkUqSoVUscxv3AohvreIQRjFCF8Awe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPqiN3o3F2CcnU/lSiSEcezOvpLqcfESj5gdIyQXIgp9TcpJNc4+SEOkjA/C+spGj
	 Zfst73HKBkJ3RTDUfFDKvQl7Mmw5pFdQYEglIXAhZC+EODLHKRSiXTX9qIZsb0r+6+
	 1IfmLcXJraIBl0WHAvq6RVh9qLNWkjfrS6B3lhzdE9bVdL3PclsJIcFWKGGHADQexc
	 oT0UaUvZGa0iS8nC0/6k8yEYGLRNGqkkHiXlesa3+yHAYn4wA3zfIhdu47yh0jD44S
	 7YhcfQhrICpQD72yjxbbQ4I94wj4xoa+kWSTHNjoYKh6ovpvEJkyWDNQRcS909kSeF
	 7YLhXtd85zZdA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 22/26] nfc: s3fwrn5: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:13 -0700
Message-ID: <20250712232329.818226-23-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_162631_441990_9A2B2160 
X-CRM114-Status: GOOD (  12.40  )
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

Use the SHA-1 library instead of crypto_shash.  This is simpler and
faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/nfc/s3fwrn5/Kconfig    |  3 +--
 drivers/nfc/s3fwrn5/firmware.c | 17 +----------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/Kconfig b/drivers/nfc/s3fwrn5/Kconfig
index 8a6b1a79de253..96386b73fa2b6 100644
--- a/drivers/nfc/s3fwrn5/Kconfig
+++ b/drivers/nfc/s3fwrn5/Kconfig
@@ -1,10 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config NFC_S3FWRN5
 	tristate
-	select CRYPTO
-	select CRYPTO_HASH
+	select CRYPTO_LIB_SHA1
 	help
 	  Core driver for Samsung S3FWRN5 NFC chip. Contains core utilities
 	  of chip. It's intended to be used by PHYs to avoid duplicating lots
 	  of common code.
 
diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 781cdbcac104c..64d61b2a715ae 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -6,11 +6,10 @@
  * Robert Baldyga <r.baldyga@samsung.com>
  */
 
 #include <linux/completion.h>
 #include <linux/firmware.h>
-#include <crypto/hash.h>
 #include <crypto/sha1.h>
 
 #include "s3fwrn5.h"
 #include "firmware.h"
 
@@ -409,31 +408,17 @@ bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 version
 int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 {
 	struct device *dev = &fw_info->ndev->nfc_dev->dev;
 	struct s3fwrn5_fw_image *fw = &fw_info->fw;
 	u8 hash_data[SHA1_DIGEST_SIZE];
-	struct crypto_shash *tfm;
 	u32 image_size, off;
 	int ret;
 
 	image_size = fw_info->sector_size * fw->image_sectors;
 
 	/* Compute SHA of firmware data */
-
-	tfm = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(tfm)) {
-		dev_err(dev, "Cannot allocate shash (code=%pe)\n", tfm);
-		return PTR_ERR(tfm);
-	}
-
-	ret = crypto_shash_tfm_digest(tfm, fw->image, image_size, hash_data);
-
-	crypto_free_shash(tfm);
-	if (ret) {
-		dev_err(dev, "Cannot compute hash (code=%d)\n", ret);
-		return ret;
-	}
+	sha1(fw->image, image_size, hash_data);
 
 	/* Firmware update process */
 
 	dev_info(dev, "Firmware update: %s\n", fw_info->fw_name);
 
-- 
2.50.1


