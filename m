Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85BDD31765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PYWCpA35ebymISdfvrACDJD2IIeB/JqSCaz3DRtnXQ=; b=0q4nfrJ/m+HTB3RrR4DjkC6Y44
	0Q9KgFXwuxHJqVx5zjF/8ed8o1QbT20wPcloCxYTLViDFm3grrPO5IUFkLPiKALV+rLbm5NROmwbY
	GMg6xFoLkAjg8KwDEsCkiBsp0brdnJZmaH8EW2CDGbH2fst8X7ZAOk4wVwCoVihQwMU//2ms5eoWe
	DI9e86afQA9oqjTXsmx5KnZu0ZToJm8kKgYsw/OFqNVpQ7p7/DVzEfb4D3LbAsIaMk+SO9nEYCw8z
	wV/DaM3mWlwMXoiXWR7GveYQxACFCd4cOTqSQFSaVeMz+S5Vn36hSCw6CxHsE1kyfi3kXwCLKKrOh
	GQcpO0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MiO-000000006Qf-1VAR;
	Tue, 05 Nov 2024 16:47:36 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MC3-000000000J6-3ieJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:14:13 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e38fabff35so99513617b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 08:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730823249; x=1731428049; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PYWCpA35ebymISdfvrACDJD2IIeB/JqSCaz3DRtnXQ=;
        b=Ckcz134PgSBYAtlk4/stRmll++EjGf2c/BQztLahI1CT5x1tyEjqHzX+/fMIikyF21
         HIUC3lGZM2e0/Q9UPjejJazaZ68Ln3KVL2/RgfNAWguXfZnDDZ9sPAZXsymQCGGLNB+1
         S4fSoVwH1qS/xWzErXE5mxbHCJz+MZtPAvMzfLpiHR6PFvtRD6fdUf8heWAzNSfEk71C
         jUWn51T5m817YUKVQU596AhH8+d+qNRY9iVkRrwf4M04/7NpoPolzNnM0rxEEutyerzu
         EA33uNtLzpkHrO1ZYnlmEuqb9O//3Mq6tTt5BS8Vvi0IqhDwv89hNj2zi92L5N6U2ryl
         wlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823249; x=1731428049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PYWCpA35ebymISdfvrACDJD2IIeB/JqSCaz3DRtnXQ=;
        b=GnAk3y9oZ7r+LnTJreqnGg7+s9+a+WkvnEaJPC+UcUF//pCi/1FptLnvhKt35cd+w3
         +htsFHrsMQrUZ0c42SvlrmVRcKli6vHL887qnuji3RCXqfEvJxiG9FuoVN89SUVE3Zhe
         S9Bb97UdYiLCkj7WRhbQuJYQS0zDv0zIOqLIcOmzaANxE6zgyVm7GZolVVxjkJ+o1yJe
         wrDmEqnWW312EOQXsG9Td67ru9jWaHPPgRodanh4+rZV4Mj01DJfyuPdM5A/TXJYv3N4
         7XV7wkw0SghLzf4oMDgyY5dY+AXgfqo0AJjaBGxtJKYIZVHh5VVMrHopeU/xYmTcCZTH
         BSQg==
X-Gm-Message-State: AOJu0YzyaVtFvrGz0oyT3SCBTTzWN2nWaeWkiGWIOciCghHM4Ek8bGRK
	Pxos/zyALepI43NstPuCdgiu+f2dS0cDhxdbSEyTAyKeRibchC0yCYLiR6pwAlfhEhXrzQ==
X-Google-Smtp-Source: AGHT+IGLaooYqrcyk3qUe0TX4eujCqm8wQrES8XgTDSUNFOoXaBLxJAERPmv+9udro0XiVT+bvrfoocD
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:308a:b0:6e9:f188:8638 with SMTP id
 00721157ae682-6e9f1888858mr13489617b3.7.1730823249265; Tue, 05 Nov 2024
 08:14:09 -0800 (PST)
Date: Tue,  5 Nov 2024 17:09:01 +0100
In-Reply-To: <20241105160859.1459261-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241105160859.1459261-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089; i=ardb@kernel.org;
 h=from:subject; bh=vU4XBM4NBrhTx0MFUyTDlm+FeMA4aQ6+vOJf2f1XAjY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3LWTZuc35KvKbt0ZzF2/csPfPldd0h8z4dyc13ZyvG3
 1jsusmyo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExEw4Thf9m8JKvMxNdXr5//
 uvm3Wd2xdscbMaVFr8vfFv8xWF55rJzhr/Ds5SV1nD8c7zLaG/PcENjJu3I3003jytPOj2ufRfv 68wAA
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105160859.1459261-9-ardb+git@google.com>
Subject: [PATCH v2 1/6] crypto: arm64/crct10dif - Remove obsolete chunking logic
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, keescook@chromium.org, 
	Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081411_966664_8869A44D 
X-CRM114-Status: GOOD (  13.57  )
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

From: Ard Biesheuvel <ardb@kernel.org>

This is a partial revert of commit fc754c024a343b, which moved the logic
into C code which ensures that kernel mode NEON code does not hog the
CPU for too long.

This is no longer needed now that kernel mode NEON no longer disables
preemption, so we can drop this.

Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/crct10dif-ce-glue.c | 30 ++++----------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/crypto/crct10dif-ce-glue.c b/arch/arm64/crypto/crct10dif-ce-glue.c
index 606d25c559ed..7b05094a0480 100644
--- a/arch/arm64/crypto/crct10dif-ce-glue.c
+++ b/arch/arm64/crypto/crct10dif-ce-glue.c
@@ -37,18 +37,9 @@ static int crct10dif_update_pmull_p8(struct shash_desc *desc, const u8 *data,
 	u16 *crc = shash_desc_ctx(desc);
 
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
-		do {
-			unsigned int chunk = length;
-
-			if (chunk > SZ_4K + CRC_T10DIF_PMULL_CHUNK_SIZE)
-				chunk = SZ_4K;
-
-			kernel_neon_begin();
-			*crc = crc_t10dif_pmull_p8(*crc, data, chunk);
-			kernel_neon_end();
-			data += chunk;
-			length -= chunk;
-		} while (length);
+		kernel_neon_begin();
+		*crc = crc_t10dif_pmull_p8(*crc, data, length);
+		kernel_neon_end();
 	} else {
 		*crc = crc_t10dif_generic(*crc, data, length);
 	}
@@ -62,18 +53,9 @@ static int crct10dif_update_pmull_p64(struct shash_desc *desc, const u8 *data,
 	u16 *crc = shash_desc_ctx(desc);
 
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
-		do {
-			unsigned int chunk = length;
-
-			if (chunk > SZ_4K + CRC_T10DIF_PMULL_CHUNK_SIZE)
-				chunk = SZ_4K;
-
-			kernel_neon_begin();
-			*crc = crc_t10dif_pmull_p64(*crc, data, chunk);
-			kernel_neon_end();
-			data += chunk;
-			length -= chunk;
-		} while (length);
+		kernel_neon_begin();
+		*crc = crc_t10dif_pmull_p64(*crc, data, length);
+		kernel_neon_end();
 	} else {
 		*crc = crc_t10dif_generic(*crc, data, length);
 	}
-- 
2.47.0.199.ga7371fff76-goog


