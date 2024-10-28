Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF1BD3E2BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mW4N9RcBemcG+LSxm4j7sDWA+GX7u+7PH3vPvZyT3dE=; b=o+0e/51Is5jbeOIi7d/DwXDcte
	UxwsDIe+WuTdPfYgkBFHdRiAYYXr8H64uQBRtU00GCZAvNmjxBarYllRFOMLYn1evTuTfgoaYqswv
	3KgfbkulON0ZrBp/oOb4IYdovH3vRXN0813XCl5vh83CFdRSUWFYx3YXfdnQoNwIlOGWnjJRzEfZ6
	HQgxlAjaNAP0uFOPMvjnfW3iVDRkHeAUzbPLdyFTc6m3Vp+SqBgqKYBQyhCx038TQGlUVUfQgpx1P
	JtXAyxp/7I2/F3359IufA4HLQ6m0UnUaYH8Q3Q7LS5fLzrN1TIy+c7UFFwtCRoycZBxQ0Uw/03G/2
	q45N451Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VCz-0000000Byh8-2bYv;
	Mon, 28 Oct 2024 19:15:21 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5V0i-0000000Bw1D-3tRO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:02:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43163a40ee0so35547645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 12:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730142158; x=1730746958; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mW4N9RcBemcG+LSxm4j7sDWA+GX7u+7PH3vPvZyT3dE=;
        b=CSxYB6j1nj8zL+MTJPXJk+H1Ln6tWHcWJWCYZ8msMT0i3Vkpofu3LAQ3MIIh8tOVCC
         SrvFEwEj9fyOzFbP7gSoFlbwMP5zG9D324S2YfW+1B1phdSQA7ZpjDfyjuHSHB7BT7zB
         TxeR8J+MyWEdebLuOu2qG7QN0Xy1eTI5FNrW+LUh26qcHajnYEnWDUIp6oJkTElz16Wd
         VAC/MuqrZpc2DPMSqbgTjJRwIgIEp3BCN6OeNsg6MAEEDrEPxVy8fiMwDHSjiVffItLp
         EovObT8Kp4saFcdCEgEnnivF0GojKROBNjVSivBAfZOGTZ4JPyMELdIyt6/ScYAy5VHt
         0dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142158; x=1730746958;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mW4N9RcBemcG+LSxm4j7sDWA+GX7u+7PH3vPvZyT3dE=;
        b=BukBbJGbPaw0+KsbHOgPyAEPxDDiz9bcduepg0GCccyHjgMDKtkb+az949IrVIVx75
         eOtbNtXHBgeWMWHRjAw9G41UflQiTutevV/ZiVFQaIbxNAw08gtX1uamKaqGlwaZKGpl
         oC3O6II/OYEyvnXIdsLw73BNQ1Md9Ai2itI7+LfuV8NuKypmLbp/sqDHur74Yu3smxad
         W6y7Ps8R35xKO+4Pjxqhll5n4kINToF5QRjbQZedPpbrEfJFPyrvfdh7W5Sh8S0mQbFI
         IAvZ3st5Gt1VtIxAoNbL8U0GEcyHGge+G/S5nbpcTU//hGZa6F4KOwRmNyyecBhn77sq
         s0jw==
X-Gm-Message-State: AOJu0YxR6tL6pbhs9vXkwP256HMKZS+4qtau3aXnHWNbtVIuxinXyAHb
	yvghNbAxRsVJdOu9RCkyp4qkjY3TPI5X1/RmXigWnaeX+vGZPUDMCBiffafC2XYmPddfbA==
X-Google-Smtp-Source: AGHT+IG4LbMrWCrTV5C1ezOwLSzp6ulJZwcKc6XgeUCOiB+YpT02bX0ZVvYmPcxlEno86XBHwdx9cESK
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:796:b0:42c:8875:95da with SMTP id
 5b1f17b1804b1-4319ad7daecmr188275e9.7.1730142158545; Mon, 28 Oct 2024
 12:02:38 -0700 (PDT)
Date: Mon, 28 Oct 2024 20:02:12 +0100
In-Reply-To: <20241028190207.1394367-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241028190207.1394367-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638; i=ardb@kernel.org;
 h=from:subject; bh=6LxElQtkWbCdfRpyCBv0NKZQB6OtvRTpcDbX0wXSeRA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3+/lbNS/dteh45mPsbnXd5Eqx08v5DZ1+DmNAkE1eTM
 vXJThUdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCK7LjL8lel4z3zW4avv1eRf
 q933aYcd/ly+e1d634dOYdmZM19bhDL8sztomR+5vNBptpr3D4kVGzf++/oke/K9ul1lh8/ZRvB 3cQMA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241028190207.1394367-12-ardb+git@google.com>
Subject: [PATCH 4/6] crypto: arm/crct10dif - Use existing mov_l macro instead
 of __adrl
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, keescook@chromium.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_120240_994455_CCE501F6 
X-CRM114-Status: UNSURE (   9.78  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/crypto/crct10dif-ce-core.S | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm/crypto/crct10dif-ce-core.S b/arch/arm/crypto/crct10dif-ce-core.S
index 46c02c518a30..4dac32e020de 100644
--- a/arch/arm/crypto/crct10dif-ce-core.S
+++ b/arch/arm/crypto/crct10dif-ce-core.S
@@ -144,11 +144,6 @@ CPU_LE(	vrev64.8	q12, q12	)
 	veor.8		\dst_reg, \dst_reg, \src_reg
 	.endm
 
-	.macro		__adrl, out, sym
-	movw		\out, #:lower16:\sym
-	movt		\out, #:upper16:\sym
-	.endm
-
 //
 // u16 crc_t10dif_pmull(u16 init_crc, const u8 *buf, size_t len);
 //
@@ -160,7 +155,7 @@ ENTRY(crc_t10dif_pmull)
 	cmp		len, #256
 	blt		.Lless_than_256_bytes
 
-	__adrl		fold_consts_ptr, .Lfold_across_128_bytes_consts
+	mov_l		fold_consts_ptr, .Lfold_across_128_bytes_consts
 
 	// Load the first 128 data bytes.  Byte swapping is necessary to make
 	// the bit order match the polynomial coefficient order.
@@ -262,7 +257,7 @@ CPU_LE(	vrev64.8	q0, q0	)
 	vswp		q0l, q0h
 
 	// q1 = high order part of second chunk: q7 left-shifted by 'len' bytes.
-	__adrl		r3, .Lbyteshift_table + 16
+	mov_l		r3, .Lbyteshift_table + 16
 	sub		r3, r3, len
 	vld1.8		{q2}, [r3]
 	vtbl.8		q1l, {q7l-q7h}, q2l
@@ -324,7 +319,7 @@ CPU_LE(	vrev64.8	q0, q0	)
 .Lless_than_256_bytes:
 	// Checksumming a buffer of length 16...255 bytes
 
-	__adrl		fold_consts_ptr, .Lfold_across_16_bytes_consts
+	mov_l		fold_consts_ptr, .Lfold_across_16_bytes_consts
 
 	// Load the first 16 data bytes.
 	vld1.64		{q7}, [buf]!
-- 
2.47.0.163.g1226f6d8fa-goog


