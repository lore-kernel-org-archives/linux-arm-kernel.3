Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76602E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 06:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=; b=yzMZMKeKUvAc/hkVim1vaUlRnJ
	adDL3vVy0+epVbmTFNJHUanzwzu8EMWsblCTd5edlp0YYTQEa4KQ9s9wzsn7yhuK8fR8hg4KZNcNP
	ylXpfDcfyZ4u6v2K3+vNKAFmALB4cBfH3GW8+G1YC4FXxAB0MXyGvTXPi1OXvhG5VWLDMBmnEw9NS
	WsgAmXB8nzikuhW1DIDeXIfy0ajiYKfUJspKuHTyduOi080M9uRwF+4cwiYreQW7zRD47p7OUnDXr
	tTHOVVLkGcFGspDfd7AiraifeOJCceZF1K478MfeWIFOXZSfFJBkcsSPv3+OAXjnr7q2GU5rLckKh
	rAssePbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnSp-0000000FhiX-1KDc;
	Wed, 18 Dec 2024 06:23:19 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnQj-0000000Fh9r-3P9V;
	Wed, 18 Dec 2024 06:21:10 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-725f2f79ed9so4884264b3a.2;
        Tue, 17 Dec 2024 22:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502869; x=1735107669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=kcqFkAn6kvYMWwP2I5Kr+NG5AcbO3wq3HoyP9++fEkg/1/mSqPLT3iC65BZmjlXZR4
         /XxID359Ss7DQ5eOykl1K3g8TTCW3XgQ6Bb6VP8JlP2TJ+rgq+pjkHqo47xYPLTUT3D7
         wJqa94BAm+lq+Xoo9gy+B7QoxervxvRYmz8hQStzIXRKZng6DcGJXlHCCUlQ7hNvEaNM
         FPqBSKPdvL4cTgO0S4+tS0BK9LUfK/bptmV8uKd4mtFm6YJ8T8f1y1rb0dCdiMoMdZrn
         b9+B1H1BytZONH/aQxfUgBzMH4MEloYvHjuvKbDeoPUnhpP9xgVtlEiRVTeLBo/tmzFB
         4mkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502869; x=1735107669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvYxXwvEnjyqSBQUdMwEVvz9hfO5O8pSiGSR6Ept2V0=;
        b=ZrmfNuYYlb8zSpfALjsv6PI2NNgDiyajLP47EVEb1NUiGN9SvQQRUdAi6fPxks52LP
         A3IUCgHc24293ojPudR05UOw0pTmYECF0s7Ug0iGn5JCoueb48vTGJP0VlC/bQaZGVtU
         nCSn2609Dyrq9RXSQUFweN3GKYFBmnkqjDtDD2vEDYgyH+4RWJm4Ds8rGIxZLmySIz/C
         VXhXFsNKBK43Hf4jfgalKWFX4nabnlpaETYycq8pbvLVmQC/r47qS6GB0CGFVwyX4tEI
         oMGB8i2tcq46nRYPBOt2u0MQ79vV2A2rPKXf5b9t16f1pM1pVdkmPjBmX0GIE1YR4RX1
         U7Gw==
X-Forwarded-Encrypted: i=1; AJvYcCULLva9CY1PaKQJSUKLdmgNWjaU+dnygUI86J9pWh1yR/HETU1MY/mdJr2ZQB7VcWuefKV6zv7XaYdsWOc=@lists.infradead.org, AJvYcCWCbG34aLHL0b5VH5TIIh+2kfDv8pEXXSH0mWSW2snZcMkwG+zgyJ9uu9NCcjpIvVVQPbsSdZ1M1m+QgAatbPKc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+CIi8BPLKtV4JeDmrNPa4BCxqDOUqcup8L14Ce6HHds252Cki
	RC9tkLXakqViyUzxLRM4PbYZLYzcAF+K0eHzKv5tbsDEX4kI7Q2f
X-Gm-Gg: ASbGncsz3HLBwjwDHf422ByUavXz4epb4FpA2TlufjAGuIRfyM7rGdRAurq68xPFo2E
	VFL4pIduoN5CxSAr6z+hIpy4k/ACcTx2fXJvVD/xKfly8yE2xUJuKKLKJuwcCNsDvAlK4Un7cnW
	EUgm0R9piYO3vuzFNBCgpIlI55XEqEyEr9igDCrXOtA3PH+Ees7R8r8zYUzlMrgNMJNVM/loHmN
	1j+SBw6wzVXVjoykznWbMaMNjpcchNwwV8LzxFebqWN37Mqfz+jTzQFwnLGJjILOrGcVjiNXkk1
	Z7rs9CG1kXQ8Gc8rvw==
X-Google-Smtp-Source: AGHT+IH3lAAsImJoXUaublLviIawcjfOTs7NtBTxEZSyuiwkLzPj5BCveefFa5Kl5C1+gqt2KTHhiQ==
X-Received: by 2002:a05:6a00:130e:b0:725:f4c6:6b71 with SMTP id d2e1a72fcca58-72a8d2a0d11mr3266430b3a.20.1734502868748;
        Tue, 17 Dec 2024 22:21:08 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:08 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
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
	catalin.marinas@arm.com,
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
Subject: [PATCH v2 1/5] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:05 +0900
Message-ID: <20241218062009.2402650-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_222109_851005_03A1A60E 
X-CRM114-Status: UNSURE (   8.65  )
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

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/x86/include/asm/bug.h | 51 ++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index 806649c7f23d..71df68e2a731 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -28,45 +28,42 @@
 #ifdef CONFIG_GENERIC_BUG
 
 #ifdef CONFIG_X86_32
-# define __BUG_REL(val)	".long " __stringify(val)
+# define __BUG_REL(val)	".long " val
 #else
-# define __BUG_REL(val)	".long " __stringify(val) " - ."
+# define __BUG_REL(val)	".long " val " - ."
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_ENTRY(file, line, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
+	"\t.word " line        "\t# bug_entry::line\n"			\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#else
+#define __BUG_ENTRY(file, ine, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#endif
+
+#define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
+	"1:\t" ins "\n"							\
+	".pushsection __bug_table,\"aw\"\n"				\
+	__BUG_ENTRY(file, line, flags)					\
+	"\t.org 2b + " size "\n"					\
+	".popsection\n"							\
+	extra
 
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
-		     ".popsection\n"					\
-		     extra						\
+	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
+					   "%c1", "%c2", "%c3", extra)	\
 		     : : "i" (__FILE__), "i" (__LINE__),		\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
 
-#else /* !CONFIG_DEBUG_BUGVERBOSE */
-
-#define _BUG_FLAGS(ins, flags, extra)					\
-do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c1\n"					\
-		     ".popsection\n"					\
-		     extra						\
-		     : : "i" (flags),					\
-			 "i" (sizeof(struct bug_entry)));		\
-} while (0)
-
-#endif /* CONFIG_DEBUG_BUGVERBOSE */
+#define ARCH_WARN_ASM(file, line, flags, size)				\
+	_BUG_FLAGS_ASM(ASM_UD2, file, line, flags, size, "")
 
 #else
 
-- 
2.43.0


