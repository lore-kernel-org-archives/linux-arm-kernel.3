Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4277C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=; b=SiNWM5xiPiDokaBM/Z87ImCtl5
	1d40Vjt1G5An8F0sxmYAVmgdpCzDqqVWE/ZB0JPb3TkoVOhIo23oTYavZ29nYwCRPsw1Gn1KPzcDQ
	dKXpFbZNfOZJw9n+bexMkOv8TvuLLkazi1TPh+Xw5zhvhYBuRsYqLJzXvHXQw9F6e5ZGmpXI8ZzG8
	/M7nGBvpHkRYhYo9aXum40S3nxzPwxiJ05uJhPwXujs0g/cuKEghVwMVW0Cv5r8YxzDQIfcpHJWbu
	NNRno8tHA88KGWsWWkTuBtbwhkCfprXx7Q7qFbYxIBGO4aKGkJniMTXHuYaoJ6oul+qgHcpl2bmKk
	0V5fbd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnVe-00000007x4Y-3n3B;
	Wed, 05 Mar 2025 12:05:58 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmdv-00000007oUC-2CQl;
	Wed, 05 Mar 2025 11:10:28 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2feae794508so9671424a91.0;
        Wed, 05 Mar 2025 03:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741173026; x=1741777826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=JQF1YHrXEo1ASbDRsoZZ27ee2Byuk5hlJT/40F1fX8jX6JRjif2ocCw+H/FH8ZQVVT
         Yxb46I5og8R7q73i0Ohul03AU4ypaMAE6P5fVc81nMF71Xhz0KNPIj6fBoTuy6sjHosH
         ecb1dqsrPykSwU5wNENU/fPpiq+Pzq5lImYVUMkFFq7v28tSQVSqr4RYwO/8S0V2pg/q
         FYShdakkNfq420cwW0Wm4Ew2WwrjZty3hSBihrL07186WQiWOIqo8005MjQDSwu9Vxty
         rQQm1Xn+3CQDLXSFfJlYaZLJ9Cp8qD+9UGYFGQLAeUYfSxCk4FVf3rurpiiHHH19fO+P
         i2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173026; x=1741777826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=gdcY4EM5hprwRwR3cmCv/VVJYosfrRPrDeAuq4epv0gb61P0fm5sYxOQYFqSpZegvQ
         5V96qbXYwUb7L20tqRC54hG8KGn0wmMgsZJ2Yrx23sdfFzF78ZxMka7PnTJJWAnHDf3s
         6+iIbKrlh9OR6thdCFVrlz3QbX8gloC5WdbQw1PB+kdriPhoBHkigpnrr3HV+faeOTFO
         d6r5bSPqj0PiYxuCr013uwxMjkVAhbkZlhoJ3dvUvJaI7iiXqTgUj6t0xPIzE0T0zJso
         1pCPnK/UUDvoJ2Jds6occgHMiJc8YIEJwgrl50sVHxwjY/SXJ5SZKX4OCwrJp0QT5tPx
         jjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCULEEX6drL8DEEhPhE7shircgG6rXUAS7uD1/q6CEHaQ2Zlcd7qVczxZa/WVTvgfTvheZizqYpkSNTijQ8=@lists.infradead.org, AJvYcCUNYUr0lycsgX//f7LZuIeoN8natg800vyWfrRRyTQ3UZg171POAh0+TQRa/Qo0fQVxgJNgDe1eu+0Yu64iDkiv@lists.infradead.org
X-Gm-Message-State: AOJu0YxKCMzcWeNk/XNuJvTNdrwcruLEPAbXY8bbT06V+p3S9L6EK0/8
	gF7v/bKYq9NL1af4K2LnSeJo/z1KdKk+P6bxsBTOtMRRXTLEjjjZ
X-Gm-Gg: ASbGnctAp43NWvgeqsYwZ62Gj/IQlNLIinnM7SX/fXnOIl/nbvEQz+zDi6wT35r8T2I
	rqmYY2SvIfWtUItStPT2RkfiELkDw7DErF+FgIqNeC1HuLmgnX8amgrq1LvLY5zAF/bIIFQLMBQ
	5Mw7wVxAG/EJD0FSoC4GHB12MAArYZym+5/PoEoeQthdqXdVjwWGG3UX8qi7U8EHva+a+5hekxz
	yiujoDawnC89W4oojLlw7uBCthCTiui0DMMc5wNhIjJO1t/QUDb/KgZ5DLVMIeOTgI3x3FfZGNc
	xd/Sk5hCIh8yrx2rLeV++5K5El11VlzHSrhBhTeApPOgTvR65joKgC/lnYGaUCchTOxQpMsDo7E
	iGUwwLSV1gzYJB71lvOmqSw==
X-Google-Smtp-Source: AGHT+IHP0xBykbnwKXKfbmIat/96KZep+usQi4KEOXfaQ1XfgMnIYfTVt4U0//4lVI6PNsYEyT+Ccw==
X-Received: by 2002:a17:90b:1d45:b0:2f5:63a:449c with SMTP id 98e67ed59e1d1-2ff49840804mr4412875a91.28.1741173026565;
        Wed, 05 Mar 2025 03:10:26 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7737a5sm1060925a91.13.2025.03.05.03.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:10:26 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v4 3/4] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  5 Mar 2025 20:08:13 +0900
Message-ID: <20250305110814.272792-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305110814.272792-1-fujita.tomonori@gmail.com>
References: <20250305110814.272792-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_031027_624556_3AABFE2E 
X-CRM114-Status: UNSURE (   9.23  )
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

Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
Rust to avoid the duplication.

No functional changes.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/arm64/include/asm/asm-bug.h | 33 ++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..a5f13801b784 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -21,16 +21,21 @@
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY_START				\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+
+#define __BUG_ENTRY_END					\
 		.align 2;				\
 		.popsection;				\
 	14471:
+
+#define __BUG_ENTRY(flags)				\
+		__BUG_ENTRY_START			\
+_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+		.short flags;				\
+		__BUG_ENTRY_END
 #else
 #define __BUG_ENTRY(flags)
 #endif
@@ -41,4 +46,24 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
 #define ASM_BUG()	ASM_BUG_FLAGS(0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)		\
+		__stringify(__BUG_ENTRY_START)		\
+		__BUG_LOCATION_STRING(file, line)	\
+		".short " flags ";"			\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+	__BUG_ENTRY_STRING(file, line, flags)		\
+	__stringify(brk BUG_BRK_IMM)
+
+#define ARCH_WARN_REACHABLE
+
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0


