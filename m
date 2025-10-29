Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10E1CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 02:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8IHS5hbKcNzc4xX1pj2JUqHqgY0jEt1+7hP5OgmCMs=; b=CXRzQ3agbTks+m
	DrKD+v7rNc/e+7TascWNMo7pXBT5OnbzoFaxqK0yeYHIuDp3ZcVRZ4qcEvKdZ3BaJ/oZqIAoaW1wO
	NfeuI1vnRi2kLkZMqEOeeoUbuX0aUdJgjgtEDTLRfnVYOYXRWijcg2kUmDbZJSwPnHL/fSR9nD9fA
	1t63lY3DkGM2AvEW7IIEM35g/Ofokd6r26ypy5kKCS62PFgvxPm7qiTNDODO9w7ec1g7q6dKaFAE/
	L1CqDKtnh5usqFRWjtRq38XeqGxYS0CCdC5ZfJPrUov9gKTx/xYHtGQiAwQWelpbolIDSLiEqzKM7
	4DVYwmv3Wn9+Zwhl1Lsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvyi-0000000Gyto-1xP9;
	Wed, 29 Oct 2025 02:32:00 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvyg-0000000Gyt6-3ovH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 02:32:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7a27c67cdc4so5360681b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 19:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761705118; x=1762309918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8IHS5hbKcNzc4xX1pj2JUqHqgY0jEt1+7hP5OgmCMs=;
        b=A8w9YEvzVGDyYWE4jjTUn4UeKxFT3suOwpb9kxmBLiNcq4QvdiJOEJcezIvS35XV5O
         thG2pu0nKK9xOEEuJCC+cww2ylRBWHdzHIs4AvaFP785Cm1Y6uMgGFhEQ+bKo3Q9f6Cq
         N3tp6qiR+j+ai9vNTXd75LYef8UomLOIs7KCrzg5OT4Boj7dOnbEROvGC1mYT41uJiLG
         5KrhjQR2ww4SA9tsqhKPp1mQWyYEFUMpmqrSY1OKrIqtzHeM/TbDp837BNyQ6aAK7x/4
         R0p4U+cHuGJhJlanT4zpLucuGVPap/COwWXvZhR5zt9onxxgu0FbXLwlaqduTJ7Mwhz5
         upuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761705118; x=1762309918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8IHS5hbKcNzc4xX1pj2JUqHqgY0jEt1+7hP5OgmCMs=;
        b=YLu15KyEagXRDbU0LJuB81XvWbBspeWftBTGxA9IqxbhqlyoiZND+gXo7HW/wa2sEN
         TWs3E5AfYIQbmGxi9Piq42QIcjGnrubPrQoeQptZwhjxm7pR6QbOpHjb4JxtTd2/tIia
         cXanX0YB/qROo4ilkn0nwdDcQuThfORd/1XX2+K7zBilc6EbvYUObjKn1i1/bErenbFr
         YW+pvI9YQ3H6sKKe/6Jdn57XFnAH2sGgCM24VRk30xQNxSKeezdF/92i0DkTuQXO6N+g
         LdoeijaFtH7PTWsp+ig6jfPbvtFY39pSBGXll7U6A2Wm5Ehnn+rJq3YpjNekHsaJHruw
         81eA==
X-Forwarded-Encrypted: i=1; AJvYcCVn4Ww3VbBLPJkmz99FSFMDaRpIaAcZq8+EntJKHP/tJT64GVRjADcCochKPWSZ5GvAwWEgcETD+orgytncku19@lists.infradead.org
X-Gm-Message-State: AOJu0YytMH7RWNo6ozG4UwBtAsSCPEVp1lkcAulHYd/Zs0HS9FNVIhOS
	hK4Xb1jqHb/ZN5mZBzCXWPvJyQ0nfYYZ4MOLslJjJdFvUf+XIScKJp9qYONJ1Q==
X-Gm-Gg: ASbGncv3xKhgrFsebKq7oHDMuzebZJR7ob0IuJy00+QepcKElNX6ocJoZm/zTzCh2b7
	cPIIwPexLdMUgTSNuQOa/x2hhewd+unJjVBZ+pRP/TRpbtihmkaB4vPX35+HGCYb7WBA1wXhpLA
	IQwZbq0NuK+r6OiAUF+Tm0P7pszoRM/ohjtnoIZc+vuR5p4VRYbbFxgVCGSa6WDn3WXqvTUCWJ5
	JMhIeW86J0vcwnkPyXrJ9/JudnWo94mlwJC1/SniB5KW3yqcD7eQSKYBK5DT7FyHdU6D0E7vJOd
	Vt/yARs3YCDVf8VAY43sETCRqc6c/QIehMrV84ZeDcMHKzxObqKJSn85AyrwbGJ7h8KLcR5EaxX
	r/DM20wn6C3VBu8fgNH+11C0ik7LU/Dbme/Dybj9ws79VAbQmfQAelG8kYL1YqbNm+tF/SGoqLI
	iVmJ7gMiApIy+i8/4jOiUeTevAKO7e3gkLDKkVA2VbbQVErsSlNn++74A/jQ==
X-Google-Smtp-Source: AGHT+IG+neopqqpPz8pE4OPY5Yo0pVr1dn6PvUKKBu7rSRz5cLkoZ3c+NU5U1HLhCN7SM0Z/zmD0cg==
X-Received: by 2002:a05:6a20:3ca7:b0:344:97a7:8c60 with SMTP id adf61e73a8af0-34651b39327mr1494729637.17.1761705117917;
        Tue, 28 Oct 2025 19:31:57 -0700 (PDT)
Received: from localhost.localdomain ([47.72.128.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81a4afsm13649518a91.19.2025.10.28.19.31.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Oct 2025 19:31:57 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 1/5] arm64: Provide dcache_by_myline_op_nosync helper
Date: Wed, 29 Oct 2025 10:31:11 +0800
Message-Id: <20251029023115.22809-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251029023115.22809-1-21cnbao@gmail.com>
References: <20251029023115.22809-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_193158_957927_7350FBA0 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, iommu@lists.linux.dev, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>, linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
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
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 arch/arm64/include/asm/assembler.h | 79 ++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 23be85d93348..115196ce4800 100644
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
- * 	domain:		domain used in dsb instruciton
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
+ * 	domain:		domain used in dsb instruciton
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


