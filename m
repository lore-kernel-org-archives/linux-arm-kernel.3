Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C573BD68BFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 00:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nulWKMnEXoWZUMSUrZco9XdRO+pd5CWpNIFDDWv+NDk=; b=CODUFIALI84Edw/znGhi8TUDIP
	tbOjTFVmG41CMqtQuPN2QlFwHQ/CETlSkmXEBTRhzX1Yc1IL/gf7nrE3ItfOnCjWeGxrUC3JjBLTs
	6rxLvq5N4q2EOyOzL4Co8ytJSocTObbLeIZRHDbycpdyk4+aeJdyjpIzW2eLxXBs645Rov5UMbbIS
	ea6T5uDxeCMmjxVzuNm9oR40dviSwUE1mWISO8F0uO3T97XNn4FYi5PGwOEqmKJiTt62QW1LlQ/5/
	FiBxtNlP6B3gw6V4Qmtz8SLmX5FeCcFjcBqrUC8UZxabVP9GMdz0eGBEuhYGIr8IFNXPpy9N+4ImF
	CKTshPkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCT7n-00000006auV-3Rn3;
	Sun, 17 Nov 2024 00:26:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCT51-00000006Zr4-3nGv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 00:23:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 173A3A40C01;
	Sun, 17 Nov 2024 00:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC2CC4CEDB;
	Sun, 17 Nov 2024 00:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731803034;
	bh=SOmKtc1U+Cth3ARmtiU8OIUv0APQu6lfcmWi1oOE0T4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ae3xjGCtOs/y/2IA9+TlSWBoIoshQQNPXgr0SgZ3f/r3v0tK6ppp+TNKKkk5FhMaW
	 fzhPJxnAGNYoXtldO4TD34DmtPZGZJVe6afCKZa77lMI67XEvqDcdJsy/eOf4UQzu+
	 UWMfcIvzW7ZZUSkslybJsRHzXpnJ9NwfZeU9Hl8H24dX7fea6Wx8fkBvKzt0IJevAp
	 +Oa1FxY9qXH1f+iivqzfVTgaHpriJPKUjS8BHISYZq/3g2CZr3mrS7oCMW9kzxxkPJ
	 jiuDIbfYJj5EPXDpkPR8PqnoUcYxPOZMjuZXUqo2eVxc9uVn3W3IGA73Qbdf+fCtM+
	 kIcqazZYknmnw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 02/11] lib/crc-t10dif: add support for arch overrides
Date: Sat, 16 Nov 2024 16:22:35 -0800
Message-ID: <20241117002244.105200-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
References: <20241117002244.105200-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_162356_143104_73F39B51 
X-CRM114-Status: GOOD (  13.19  )
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
index eb6c7a023be9..b84aa06ade30 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -147,10 +147,42 @@ config CRC_T10DIF
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
2.47.0


