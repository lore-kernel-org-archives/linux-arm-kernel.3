Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA620D74951
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 05:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NkbhnSjmQqWyentKViHSvnUd2t4Anb4J6Vl3+26IzI=; b=0/J6kL64Gfpt+4
	tToXt2UGZsF8JQoNppC2iCUJhwmXkGJ/zSAg9eTIaAnD8XK1pHR9xF6/kp67TrtkdCGieC3KcwWj6
	zvZUJOHt0PnBhenlPZmC7AlB9CEbnJ7Md4tdclqwtQUmDVHOeR5jEtJb1GDtpbi0/8+B2SX859pqr
	KkMfcrQiaK+7DNxr/gWQDvgp+jBgcaCv8ifiq5B0rmEnCsu/o5ZM9zKauaUU4sHvgMgLu743rH7GT
	5XZraZDBxWwdKmDvQ5cHWgRfgcHBeqwqW9LSp04rKc5A+pGBNgYgwOZT7JJNlIs0EojArFKs48Diz
	MIyzH0OUE8D9rSnykckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTB2-00000009eaT-1jqA;
	Fri, 19 Dec 2025 05:37:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTAz-00000009ea1-45Af
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 05:37:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29f30233d8aso18453945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 21:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122636; x=1766727436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NkbhnSjmQqWyentKViHSvnUd2t4Anb4J6Vl3+26IzI=;
        b=M5KXDpGKDaUEj0J0BI0g6c/LruYhZgU45E3tlZAj9dxBoidPo7j8jcA/U5GpUmRflW
         iKN1bl/snmSn6Yfu4sLgLG0RtmUFkXuORvn678VcfRaBmopGAqhU6ChG+C5nFzTGrQPg
         zmf2YTwluvHHRdSfQREn7fQ1qXct6xGM2g2TukuXW4Gs2TwZk65SZTqmL4nd5g9qCRNu
         M4ZOvoxqYZ8j6DBmSXQkEQdygXvF+j0aI30fb2m1VaTqdBYtFjsYQTjqSsOoeRR8IpA+
         arEjC4OUmpMA0mJedP3Pkfjw17FOrZQNGlmHTOFSvjeyleranCxQEuWXGiErCdIQCULl
         W1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122636; x=1766727436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NkbhnSjmQqWyentKViHSvnUd2t4Anb4J6Vl3+26IzI=;
        b=pklWczL88H8BNylcJFrfkT9XWRCBdd+GMow2UKSmpNz9VsKPJWafi5UTHxdgwEeiIs
         N5SahtbyGgCkTaQTWmz9X+18EEIMWSMpl+u6dNWVEyljVNtl6VsHPHkoy9YBNPmCbRMt
         lPCMkJZKiJZK0gjzkwQPw4I7QgARlqptolsRwkNbklPxXyTp87eltR0K7iFaRhDf/ypi
         bkmx/1l6hradodAMxTBSwjjIAayy4zpEM1nEFkCoSP55ke6vw1zf0J78UFudifi280iF
         XdO09Ua8VSVdhZcIEm/zUSK285dkX+EGh/377zYqwWfeO/1sEzKs3IxsLtC8k78mbIeo
         yxLA==
X-Forwarded-Encrypted: i=1; AJvYcCXpARgfxEAZekvIHS+on9ba3tLtyqNEy7MaygQCiL4I3DXWNhOQrQxDdpElca7mYSMbxVLA/cZGwEFx4+LGQHk9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8vZ9jEReep6StqFvsRYPq2JZdamsLzuhh1UNHWr4edvskuGPE
	b2m8YOGbD2kXbAmzIFnIsVBKi5NB9NHaSYUidaMhR7pZVvUqpHVJNN4e
X-Gm-Gg: AY/fxX7Xs+uVUBtn6PhW3WDaoMKTzbMOZvc93826Xl6/eLmOX79rHUF2mvlK616LRGz
	HnCn7wuPSfEUIqKXYDHluCsa8K7tR89NgNGMAqBiqQ5fDT9ctEQmJdliqGDk/nX/lX8AdEr4v8p
	rY5rokWDMyfDwkPLzbnNvcV3EN8CCYx+Qntc8//SIc5lYkhKJytqwwdAMYNCT8N4CaJq8fp6ksJ
	4tq+HvvXgg5fWcw5eP6i6gOOb4ELQRuvQ9iKskqSmxQpQElfOvp5vHLQGysW7MtU7mszIlOcc8p
	GIxYqdIhneskguu4YZap9kQmKpfNa2qDPEaFjJc8moVomPcfDqkqG0KZpKA0wuIZZH15Qc5XhDw
	wS+/tZgiJAowj/a7/W0s+v7GiNkDao9+Kgc/ZEyaIgZT2N83aaDEBRSwyXPbU9ORlXUdKK7Hnec
	9KSaBBmxfU9Kia+X6QtcjqblwZ+M1JuA==
X-Google-Smtp-Source: AGHT+IFcyO2/N6WJqTTUC8Xpz+F+HK73QiRxiWGBBRL+WIr6e3loB6zfy831gEjAtlMYHTHv9HUDPQ==
X-Received: by 2002:a17:903:2290:b0:2a1:3cd9:a739 with SMTP id d9443c01a7336-2a2f2830ba1mr17129295ad.43.1766122636315;
        Thu, 18 Dec 2025 21:37:16 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d895sm9930215ad.54.2025.12.18.21.37.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Dec 2025 21:37:15 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH 1/6] arm64: Provide dcache_by_myline_op_nosync helper
Date: Fri, 19 Dec 2025 13:36:53 +0800
Message-Id: <20251219053658.84978-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251219053658.84978-1-21cnbao@gmail.com>
References: <20251219053658.84978-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_213718_021751_D7519916 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <v-songbaohua@oppo.com>

dcache_by_myline_op ensures completion of the data cache operations for a
region, while dcache_by_myline_op_nosync only issues them without waiting.
This enables deferred synchronization so completion for multiple regions
can be handled together later.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 arch/arm64/include/asm/assembler.h | 79 ++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index f0ca7196f6fa..7d84a9ca7880 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -366,22 +366,7 @@ alternative_else
 alternative_endif
 	.endm
 
-/*
- * Macro to perform a data cache maintenance for the interval
- * [start, end) with dcache line size explicitly provided.
- *
- * 	op:		operation passed to dc instruction
- * 	domain:		domain used in dsb instruction
- * 	start:          starting virtual address of the region
- * 	end:            end virtual address of the region
- *	linesz:		dcache line size
- * 	fixup:		optional label to branch to on user fault
- * 	Corrupts:       start, end, tmp
- */
-	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
-	sub	\tmp, \linesz, #1
-	bic	\start, \start, \tmp
-.Ldcache_op\@:
+	.macro __dcache_op_line op, start
 	.ifc	\op, cvau
 	__dcache_op_workaround_clean_cache \op, \start
 	.else
@@ -399,14 +384,54 @@ alternative_endif
 	.endif
 	.endif
 	.endif
-	add	\start, \start, \linesz
-	cmp	\start, \end
-	b.lo	.Ldcache_op\@
-	dsb	\domain
+	.endm
+
+/*
+ * Macro to perform a data cache maintenance for the interval
+ * [start, end) with dcache line size explicitly provided.
+ *
+ * 	op:		operation passed to dc instruction
+ * 	domain:		domain used in dsb instruction
+ * 	start:          starting virtual address of the region
+ * 	end:            end virtual address of the region
+ *	linesz:		dcache line size
+ * 	fixup:		optional label to branch to on user fault
+ * 	Corrupts:       start, end, tmp
+ */
+	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
+	sub	\tmp, \linesz, #1
+	bic	\start, \start, \tmp
+.Ldcache_op\@:
+	__dcache_op_line \op, \start
+	add     \start, \start, \linesz
+	cmp     \start, \end
+	b.lo    .Ldcache_op\@
 
+	dsb	\domain
 	_cond_uaccess_extable .Ldcache_op\@, \fixup
 	.endm
 
+/*
+ * Macro to perform a data cache maintenance for the interval
+ * [start, end) with dcache line size explicitly provided.
+ * It won't wait for the completion of the dc operation.
+ *
+ * 	op:		operation passed to dc instruction
+ * 	start:          starting virtual address of the region
+ * 	end:            end virtual address of the region
+ *	linesz:		dcache line size
+ * 	Corrupts:       start, end, tmp
+ */
+	.macro dcache_by_myline_op_nosync op, start, end, linesz, tmp
+	sub	\tmp, \linesz, #1
+	bic	\start, \start, \tmp
+.Ldcache_op\@:
+	__dcache_op_line \op, \start
+	add     \start, \start, \linesz
+	cmp     \start, \end
+	b.lo    .Ldcache_op\@
+	.endm
+
 /*
  * Macro to perform a data cache maintenance for the interval
  * [start, end)
@@ -423,6 +448,20 @@ alternative_endif
 	dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fixup
 	.endm
 
+/*
+ * Macro to perform a data cache maintenance for the interval
+ * [start, end). It won’t wait for the dc operation to complete.
+ *
+ * 	op:		operation passed to dc instruction
+ * 	start:          starting virtual address of the region
+ * 	end:            end virtual address of the region
+ * 	Corrupts:       start, end, tmp1, tmp2
+ */
+	.macro dcache_by_line_op_nosync op, start, end, tmp1, tmp2
+	dcache_line_size \tmp1, \tmp2
+	dcache_by_myline_op_nosync \op, \start, \end, \tmp1, \tmp2
+	.endm
+
 /*
  * Macro to perform an instruction cache maintenance for the interval
  * [start, end)
-- 
2.39.3 (Apple Git-146)


