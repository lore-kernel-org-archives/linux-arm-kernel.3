Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A7FD49792
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 01:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip5zHEkyUM7h2o++LoVpmSBFQRoTeMqChUEBfs6fBoU=; b=lYpGxsuZh91cZ8LzAu6mflZhzG
	whFxNYPlP3dIcUdf4583Qg5DAoVgtmMPzGW3fv4Lqyw8FW0BhojbRS6i+2SLIQBqBx/6xjWjhjmCK
	RXFbG00Sfk2WuoVcWs1ENxUQ58Qxe4DekyvReU4S8zSqm4MYWQzGi4ytqAnqi7Lt5c0sN4EBv4oSh
	wSwwKqH8w6vRVbUZ8bdz3NjJJ9RbjhZhrnri2oDc8zg9xB5VD7kfav7GhhKFAAjb0wrsiMPvlsM75
	g3tpIauy68Oer2uA3DKzHLvoVXZOBqeiSBB7a3RGc5JuDPlWLP4N6m//Nnq+i7BiJwjposNDCGgKy
	zMfLqTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvIY-00000004jDg-1reG;
	Mon, 02 Dec 2024 01:32:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHv7y-00000004hL0-2c6b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 01:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50C83A40C2E;
	Mon,  2 Dec 2024 01:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE92C4CEDC;
	Mon,  2 Dec 2024 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102489;
	bh=DVKfdgkx+XQWnXd7S0Vc0JfNUBLYmfwnEAvdzQ4yAyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FPlVWXqSkitqAzqYhZ2GDIeWs0qQ4N6kOao+XaK539fPu2WgSyqqKAjXzyRSCKiMX
	 R13j+UAzuSqDFtPj+ykjxZQz1L+UsaMOfvu3G71McAVWhdhIQqB3n3uIcm49B2yzWE
	 KUiPwbMfHNoK0U+ELSx7KLDkI+zYee5SkLXeyvDt09tJ0ws8Hs4l43ZR0SqxdqsVUl
	 gJ9xelTxBnb8hVsnIkdqC/f+hh8QPGKTZNL4OW3GpUkjmdm49wxSoH2+7nURPOGn7w
	 UY2axe7+UxRgGKpP7d4l3/h2ybImQnMDusQrrVdCZT3NoGyY1bsgPNj/3uz031TdD0
	 3gCbpKqNl/1kA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 02/12] lib/crc-t10dif: add support for arch overrides
Date: Sun,  1 Dec 2024 17:20:46 -0800
Message-ID: <20241202012056.209768-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202012056.209768-1-ebiggers@kernel.org>
References: <20241202012056.209768-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_172130_793530_AB0FEA60 
X-CRM114-Status: GOOD (  13.53  )
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

From: Eric Biggers <ebiggers@google.com>

Following what was done for CRC32, add support for architecture-specific
override of the CRC-T10DIF library.  This will allow the CRC-T10DIF
library functions to access architecture-optimized code directly.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/crc-t10dif.h | 12 ++++++++++++
 lib/Kconfig                | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/linux/crc-t10dif.h b/include/linux/crc-t10dif.h
index 206ba2305483..16787c1cee21 100644
--- a/include/linux/crc-t10dif.h
+++ b/include/linux/crc-t10dif.h
@@ -5,18 +5,30 @@
 #include <linux/types.h>
 
 #define CRC_T10DIF_DIGEST_SIZE 2
 #define CRC_T10DIF_BLOCK_SIZE 1
 
+u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len);
 u16 crc_t10dif_generic(u16 crc, const u8 *p, size_t len);
 
 static inline u16 crc_t10dif_update(u16 crc, const u8 *p, size_t len)
 {
+	if (IS_ENABLED(CONFIG_CRC_T10DIF_ARCH))
+		return crc_t10dif_arch(crc, p, len);
 	return crc_t10dif_generic(crc, p, len);
 }
 
 static inline u16 crc_t10dif(const u8 *p, size_t len)
 {
 	return crc_t10dif_update(0, p, len);
 }
 
+#if IS_ENABLED(CONFIG_CRC_T10DIF_ARCH)
+bool crc_t10dif_is_optimized(void);
+#else
+static inline bool crc_t10dif_is_optimized(void)
+{
+	return false;
+}
+#endif
+
 #endif
diff --git a/lib/Kconfig b/lib/Kconfig
index be59f7cdf448..e52a38d8d783 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -159,10 +159,42 @@ config CRC_T10DIF
 	help
 	  This option is only needed if a module that's not in the
 	  kernel tree needs to calculate CRC checks for use with the
 	  SCSI data integrity subsystem.
 
+config ARCH_HAS_CRC_T10DIF
+	bool
+
+choice
+	prompt "CRC-T10DIF implementation"
+	depends on CRC_T10DIF
+	default CRC_T10DIF_IMPL_ARCH if ARCH_HAS_CRC_T10DIF
+	default CRC_T10DIF_IMPL_GENERIC if !ARCH_HAS_CRC_T10DIF
+	help
+	  This option allows you to override the default choice of CRC-T10DIF
+	  implementation.
+
+config CRC_T10DIF_IMPL_ARCH
+	bool "Architecture-optimized" if ARCH_HAS_CRC_T10DIF
+	help
+	  Use the optimized implementation of CRC-T10DIF for the selected
+	  architecture.  It is recommended to keep this enabled, as it can
+	  greatly improve CRC-T10DIF performance.
+
+config CRC_T10DIF_IMPL_GENERIC
+	bool "Generic implementation"
+	help
+	  Use the generic table-based implementation of CRC-T10DIF.  Selecting
+	  this will reduce code size slightly but can greatly reduce CRC-T10DIF
+	  performance.
+
+endchoice
+
+config CRC_T10DIF_ARCH
+	tristate
+	default CRC_T10DIF if CRC_T10DIF_IMPL_ARCH
+
 config CRC64_ROCKSOFT
 	tristate "CRC calculation for the Rocksoft model CRC64"
 	select CRC64
 	select CRYPTO
 	select CRYPTO_CRC64_ROCKSOFT
-- 
2.47.1


