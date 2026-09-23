Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C70C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0Se02YeDAJH43OchRK0L/XH/O2H0efa7oLAb8qjiuc=; b=j5tnLi2A2C3Ku8Q7Kzll6nQ13j
	iEaluDViPgCDs+XE+RakRMeWSV9wwWLiVoaoNswcRN/x8zqR05XFQUogKtHraYcl4J5635kdprMu8
	RP4q5lbC1EUk15ZJu0orV7tfA8eqZHUIOZJmWlSOJ1heo7ECqoqAFbNU+ucIF/MC3R4PP9yZrl2+Y
	hWZHwCkAXikmv27AmSnTUEGaJH5DZ3I0rmFtxtYs0aSqZ2K7zHCazTIrFpglrDcJ/nCbYOO/ieHip
	Nq19tS3VHiWhU8Io6SDeypNTdQdNixzSt02d08leCdIOL8PyCRUTDu0QfmJ/1fN0PhFResMNxXDwW
	6BgZpvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nal-00000008U5N-1e7g;
	Wed, 23 Sep 2026 14:04:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Naj-00000008U4U-45fv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:04:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E3AC4338B;
	Wed, 23 Sep 2026 14:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF0A1F000FF;
	Wed, 23 Sep 2026 14:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172297;
	bh=w0Se02YeDAJH43OchRK0L/XH/O2H0efa7oLAb8qjiuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NDHUNGZQcjLQDu+GWHpF6i13kkjb0AdrLTJg1t3JjzoPX99wh7QrR/k0pAoEnRFze
	 N+vbmJsO9UoxKh6hGwOmMcGgPIKIKaSCztnVgNjeum67Fm7eYeiyM6lJa5gMWya2Q7
	 h43ONiniWRzi2/zRBhT3g2EbPCifsQLiokTRKwEqcVcCrZx56E9KQEWBZ7OBAlTlq4
	 qUEumvh2qieLHANYSAsa6Jyo06Rkem6ram47p7yhph07LOxaS/PiCG1hkBPS7gms29
	 +ahPZYufin9ILT0XJSg1MJHiY2CzrTYnLWrJ0o8lZnibS2AwJsexWd9zMZzqmW3/hb
	 RIKLez5gOaWUw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v13 4/8] arm64: realm: Move Realm memory encryption ops to RSI code
Date: Wed, 23 Sep 2026 19:34:01 +0530
Message-ID: <20260923140405.1111554-5-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
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

Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
registration with the RSI initialization code instead of pageattr.c, which
only needs to provide the low-level page-attribute transition helper.

Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
the Realm-specific encrypt/decrypt callbacks and warning policy.

No functional changes in this patch.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/mem_encrypt.h |  3 +--
 arch/arm64/mm/pageattr.c             | 38 +---------------------------
 drivers/firmware/arm_rmm/rsi.c       | 34 +++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index f03b9d7b83b4..ef8b8463e52b 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -16,8 +16,7 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
 int set_memory_decrypted(unsigned long addr, int numpages);
-
-int realm_register_memory_enc_ops(void);
+int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt);
 
 static inline bool force_dma_unencrypted(struct device *dev)
 {
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..14b2a3801f40 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -275,9 +275,7 @@ int set_direct_map_default_noflush(struct page *page)
 				 PAGE_SIZE, set_mask, clear_mask);
 }
 
-static int __set_memory_enc_dec(unsigned long addr,
-				int numpages,
-				bool encrypt)
+int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt)
 {
 	unsigned long set_prot = 0, clear_prot = 0;
 	phys_addr_t start, end;
@@ -321,40 +319,6 @@ static int __set_memory_enc_dec(unsigned long addr,
 				      __pgprot(PTE_PRESENT_INVALID));
 }
 
-static int realm_set_memory_encrypted(unsigned long addr, int numpages)
-{
-	int ret = __set_memory_enc_dec(addr, numpages, true);
-
-	/*
-	 * If the request to change state fails, then the only sensible cause
-	 * of action for the caller is to leak the memory
-	 */
-	WARN(ret, "Failed to encrypt memory, %d pages will be leaked",
-	     numpages);
-
-	return ret;
-}
-
-static int realm_set_memory_decrypted(unsigned long addr, int numpages)
-{
-	int ret = __set_memory_enc_dec(addr, numpages, false);
-
-	WARN(ret, "Failed to decrypt memory, %d pages will be leaked",
-	     numpages);
-
-	return ret;
-}
-
-static const struct arm64_mem_crypt_ops realm_crypt_ops = {
-	.encrypt = realm_set_memory_encrypted,
-	.decrypt = realm_set_memory_decrypted,
-};
-
-int realm_register_memory_enc_ops(void)
-{
-	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
-}
-
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 {
 	unsigned long addr = (unsigned long)page_address(page);
diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
index 8e716f1c1e31..ada139d0e344 100644
--- a/drivers/firmware/arm_rmm/rsi.c
+++ b/drivers/firmware/arm_rmm/rsi.c
@@ -127,6 +127,40 @@ static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
 	return 0;
 }
 
+static int realm_set_memory_encrypted(unsigned long addr, int numpages)
+{
+	int ret = __set_memory_enc_dec(addr, numpages, true);
+
+	/*
+	 * If the request to change state fails, then the only sensible cause
+	 * of action for the caller is to leak the memory
+	 */
+	WARN(ret, "Failed to encrypt memory, %d pages will be leaked",
+	     numpages);
+
+	return ret;
+}
+
+static int realm_set_memory_decrypted(unsigned long addr, int numpages)
+{
+	int ret = __set_memory_enc_dec(addr, numpages, false);
+
+	WARN(ret, "Failed to decrypt memory, %d pages will be leaked",
+	     numpages);
+
+	return ret;
+}
+
+static const struct arm64_mem_crypt_ops realm_crypt_ops = {
+	.encrypt = realm_set_memory_encrypted,
+	.decrypt = realm_set_memory_decrypted,
+};
+
+static int realm_register_memory_enc_ops(void)
+{
+	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
+}
+
 void __init arm64_rsi_init(void)
 {
 	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
-- 
2.43.0


