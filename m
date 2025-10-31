Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9115CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E137w2jyBQdKQzJ2QNCPA5foha+2UsFo+5XbWLAP07E=; b=aDpDSEOdkRn5n4ReMl0YZFvnhK
	6qVJ2aF1KBIWX1MgXowR4m0vbZ4dHCUue8Spfzk46ZS6FryhgtK3H7mo8Xn4m2GQugubJsCc/8DnU
	rzpBvIOhEQc1T3ZXGNc5LNjQni3RP4KsyesqBPCR8i88nhJX9Hbk2tNQOSfOZcaf1rkhV2zsVR0cT
	QNvApUw2gzzUZwga46+2GiYTgbidu1FEkA3qn+P0L/xfHkaVSGHoDF9JdVl/IsnHAgEHmAIu6v6W4
	tn49hmZ5v8UnvVf49m+YwPvOaFyXusD/OrL2CkOxdgy+yy/otZj4x4rwVO4oe8R9pOsPkwaJC/kan
	Pi1wdhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZ3-00000005vnr-31CM;
	Fri, 31 Oct 2025 10:41:01 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY7-00000005vDx-1iip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:40:04 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso11620955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907201; x=1762512001; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E137w2jyBQdKQzJ2QNCPA5foha+2UsFo+5XbWLAP07E=;
        b=bhHfcLmqVujI7j/4OH6NvLMwsWErK3OMeyHOoAk0iZsCCP+Q72kYKeqs9iFc693LLP
         uomSrmKLR/U1mzspZaj9yXGF0c6wo/6G42UK45raETB8k/kUJ9C3oVllUhHgvpmA1E5+
         7x/6l/np8kbzSNjrmQklnf2yATuejEkSumQ0hck8IZ0yCCXOd5fvzQ95Az2PdovRiWV/
         aZZYQCVi1bW3Y/Id2LTRrEXQtBsPGvTU43OjEFxkPhcep+4J2PVqMR0nepicwscZcHLi
         y83uQpzsLH/asw9Oq3SGONrcZk5B+EAH5o74fVleYW2hoYrlJmBTxCuQm31/DH1s7F5d
         YoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907201; x=1762512001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E137w2jyBQdKQzJ2QNCPA5foha+2UsFo+5XbWLAP07E=;
        b=p8oEYT9KYbOGTaMLvv/CoNu0EDWivvMGgeKqcXejrEmOpXx0pVb85kUMxEY/lyeGnz
         6OrEd1bxWTppSlMUDYB6bqs1u416aCc+CoG4L+0ilUp9C8lXGESTBPkObBOuELyUIMbu
         6PzBkqCKXL/aQoBYIWFQKALmV2F2qachVRA+ymha+SeOzF7563GeBcJMxJpgXsfPSH4u
         vSj6qOMOBGNNpsr/V7aL8ZyEtgCb7xADUbVlofH5DJHyY+/gk9SHwxltOFvC4YFypff2
         nI/36JX4sVOzWiO9iv1twjJIIeZ22lUUkK7NvqXeSF9WGfDCg0cUBDuumCdcpqz5fewE
         LnRg==
X-Gm-Message-State: AOJu0YyvwQvnU0PxHTQEtTY9ELm5N9WLbtfvUAP7QyKv6BC8w6HoncoW
	Bqo8TWjWy+LSIF8W1wWQPDxcm3NwYMAMMcCmrDx73w4u6wQZncfdrYhaysafTxSU8iHt4wS1cA7
	CNJEK317WVQHW6jMY2mkBZSmgggb3//kT5eEKrVLaQqRJde+5IGb3GOUDzOUmF9f5GfqZsbgWl3
	gP8eQNNxfhEGVgxJAukFrxvHrmIZiBmEplf4kp9QFdnxiu
X-Google-Smtp-Source: AGHT+IGSC7lpglLVQXDhc+qETrFDrUbREN63HeHWglrMlVHBvofBu6xBm//uDsp9EQNcouOaMC5P8NO+
X-Received: from wmbgx15.prod.google.com ([2002:a05:600c:858f:b0:477:e0a:f99e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:35cc:b0:475:d8f3:71c1
 with SMTP id 5b1f17b1804b1-477308be6f1mr25615455e9.27.1761907201250; Fri, 31
 Oct 2025 03:40:01 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:15 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235; i=ardb@kernel.org;
 h=from:subject; bh=BmcyRj2En4D2bqTYOu3u59S/hVwg5l7rSd12ZpuUTBI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4i3DFR/fNq1Xakt8FWTJdOhpvVsDwyGJ7E3WhxY8W
 eL7YfO/jlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjAREXVGhnVfdl04dOv5V9/U
 g4f3qN4+xbZ6/aX0qa92dd2dOcdIdd4bRoYprzoDmf2F1r7MzJdLrtM6/3EWn+/hW98LH/u82rz 40ixWAA==
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-39-ardb+git@google.com>
Subject: [PATCH v4 16/21] crypto/arm64: sm3 - Switch to 'ksimd' scoped guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034003_503025_A2ECC383 
X-CRM114-Status: GOOD (  12.37  )
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

Switch to the more abstract 'scoped_ksimd()' API, which will be modified
in a future patch to transparently allocate a kernel mode FP/SIMD state
buffer on the stack, so that kernel mode FP/SIMD code remains
preemptible in principe, but without the memory overhead that adds 528
bytes to the size of struct task_struct.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/sm3-ce-glue.c   | 15 ++++++++-------
 arch/arm64/crypto/sm3-neon-glue.c | 16 ++++++----------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/sm3-ce-glue.c b/arch/arm64/crypto/sm3-ce-glue.c
index eac6f5fa0abe..24c1fcfae072 100644
--- a/arch/arm64/crypto/sm3-ce-glue.c
+++ b/arch/arm64/crypto/sm3-ce-glue.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
-#include <asm/neon.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sm3.h>
 #include <crypto/sm3_base.h>
@@ -13,6 +12,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+#include <asm/simd.h>
+
 MODULE_DESCRIPTION("SM3 secure hash using ARMv8 Crypto Extensions");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
@@ -25,18 +26,18 @@ static int sm3_ce_update(struct shash_desc *desc, const u8 *data,
 {
 	int remain;
 
-	kernel_neon_begin();
-	remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
-	kernel_neon_end();
+	scoped_ksimd() {
+		remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
+	}
 	return remain;
 }
 
 static int sm3_ce_finup(struct shash_desc *desc, const u8 *data,
 			unsigned int len, u8 *out)
 {
-	kernel_neon_begin();
-	sm3_base_do_finup(desc, data, len, sm3_ce_transform);
-	kernel_neon_end();
+	scoped_ksimd() {
+		sm3_base_do_finup(desc, data, len, sm3_ce_transform);
+	}
 	return sm3_base_finish(desc, out);
 }
 
diff --git a/arch/arm64/crypto/sm3-neon-glue.c b/arch/arm64/crypto/sm3-neon-glue.c
index 6c4611a503a3..15f30cc24f32 100644
--- a/arch/arm64/crypto/sm3-neon-glue.c
+++ b/arch/arm64/crypto/sm3-neon-glue.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2022 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  */
 
-#include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sm3.h>
 #include <crypto/sm3_base.h>
@@ -20,20 +20,16 @@ asmlinkage void sm3_neon_transform(struct sm3_state *sst, u8 const *src,
 static int sm3_neon_update(struct shash_desc *desc, const u8 *data,
 			   unsigned int len)
 {
-	int remain;
-
-	kernel_neon_begin();
-	remain = sm3_base_do_update_blocks(desc, data, len, sm3_neon_transform);
-	kernel_neon_end();
-	return remain;
+	scoped_ksimd()
+		return sm3_base_do_update_blocks(desc, data, len,
+						 sm3_neon_transform);
 }
 
 static int sm3_neon_finup(struct shash_desc *desc, const u8 *data,
 			  unsigned int len, u8 *out)
 {
-	kernel_neon_begin();
-	sm3_base_do_finup(desc, data, len, sm3_neon_transform);
-	kernel_neon_end();
+	scoped_ksimd()
+		sm3_base_do_finup(desc, data, len, sm3_neon_transform);
 	return sm3_base_finish(desc, out);
 }
 
-- 
2.51.1.930.gacf6e81ea2-goog


