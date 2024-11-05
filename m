Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E463D31768
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6N2VBOA9rFVK0/GkkoRg7xkFe5ZWEmXf+9rCp3hK2ew=; b=FlVP/DLaSwX496vbIfwqZ3yu0C
	Mq5r1wS3yFfa2BpfEsSL8zoMIK9o64mSfLG54GYqhOslvE0+lqQQ1DpbkKBsXl3tv1X4aCTaG91j0
	JqJyJdONROdhJuuoizB0bLglmvk+/G2XOMWh9VyPn/PnpB49X8EgYPJzVSTF/abCW1FBwlve7MaWn
	3Af9u2QT/ciCreCwB6ReGgE8S6LzB4/AQ971cAXNJEllusenxFUmHqLwP86YkkDztaeRu19BPBnnp
	n4pb3FXOmVPo3Q4/jXcKwCLjmWK0jnYeOxFlzw7yaqRs4fyYlmjutCjPVQiKeri2Hd7tc2S7EQEyr
	tJILEwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MnW-000000007N5-2YUi;
	Tue, 05 Nov 2024 16:52:54 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MCA-000000000MF-1UGW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:14:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4316655b2f1so39952335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 08:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730823257; x=1731428057; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6N2VBOA9rFVK0/GkkoRg7xkFe5ZWEmXf+9rCp3hK2ew=;
        b=0Pz4ubJ8Kr3r+fnbSKhh1H/lACQ921OLmr3EIF4qa/eLcSxaWXAGY6Y8UnaBbNy0lF
         O+qsPihG4cD6WLmwwj7KsCi1eaGL8xpsO5/p7PrvFpt8x30+BdP+1vz7LtETTk4CyQeL
         3yFa/cnzpx0r5Ha1FcwC84jGIXOZ4RiKPRQaFP13ddhVGG7KXywkc0Ex8AG+lloseELG
         rMjh1DBhO1ipsVgcwdcJSqaIxiJw7RYIUk9TxHKdSuRIUOFgv/VL2u2eOO0zv92QdoG0
         Bowira47Z00Zqv3+LznSR0mc8K8RmHNC6yTm+RSHPCogve7SK/K3Gry/y7jwBEBTQIkr
         xQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823257; x=1731428057;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6N2VBOA9rFVK0/GkkoRg7xkFe5ZWEmXf+9rCp3hK2ew=;
        b=MgWdlnshI0E1h+gV8kZD8W6+Yuugr3xpr5XzSt0C/sPOh6lq6irzpvOWrcOoKyp08v
         AhkXxgeXc7x+GcibVNOBi7VWpjnsmOdrwCkNRyZbK1i/V4qYb9BwcEve5DjjQYbBv3Fv
         e2ed3M/iYMTzIdgS/onCwLxuBuP6H3b/lL0cpp1irr8t8NFKjw+3bjIGtQfdwPwhmdE6
         BPyFbQNs221Rt73qasj5heT6BKK00q/IrzwiXwguDYteviDGmmq62rk01z+y8mcFYIwW
         dELSNLGcRF8JxtTfRRJVwGM3JJ0SICmY1cSpFlCcHM6IbW/PBKCM7jS+aDYanSG8Cygj
         tG4g==
X-Gm-Message-State: AOJu0Ywt8+yri52YsCb1TMdM6eLGR+Oifx/5GRgc7ImRa50+mGNenbGA
	cpPjFIzTyIrohm4klslDY07D3j2BbbR7Mshqx7a/POrgoqJ+60PPKRhNkBMva26ykHr3QQ==
X-Google-Smtp-Source: AGHT+IE1eGkHlmoaTOuZHS5yxUb+zHYCL/xdGqZApRlfh1/UEprDAnMdWsqBst7cBf+cLypOHteKNsFR
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a7b:ce8b:0:b0:42c:ae30:fc33 with SMTP id
 5b1f17b1804b1-4327b7fcdc4mr378795e9.4.1730823256859; Tue, 05 Nov 2024
 08:14:16 -0800 (PST)
Date: Tue,  5 Nov 2024 17:09:04 +0100
In-Reply-To: <20241105160859.1459261-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241105160859.1459261-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=ardb@kernel.org;
 h=from:subject; bh=AKN1MPIUQxwxJZBx0Ms0cbfUdj7H9BFpnNX0+RF49+Q=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3LWSl0q66lZ/662TXljbc3tB3cpZ1md1SgeJnF7gcV7
 kpXJl3tKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPZlMTwP1qsR+bTg3cWmeZ3
 100Pv3aS6c5lwZVFc+cydibuvKl57hXDP90Dv1ScRJ4vyVG8d6rs+/tLiuqt3RJqnQ3+J9elpz3 azAYA
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105160859.1459261-12-ardb+git@google.com>
Subject: [PATCH v2 4/6] crypto: arm/crct10dif - Use existing mov_l macro
 instead of __adrl
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, keescook@chromium.org, 
	Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081418_425442_D0A84B72 
X-CRM114-Status: GOOD (  10.19  )
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

Reviewed-by: Eric Biggers <ebiggers@google.com>
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
2.47.0.199.ga7371fff76-goog


