Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3F5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=; b=3B/7PBsLA5MzKwfz5idmBOKSqv
	+0R5zPs9IHfOC35GE4y95ZmevnajZAYPsO0dnrAMDZ79Q/XGSvO+PAeUPIo03HdQwGCsIK2KkigwO
	GTJLmrERKuOvfI5i/IuYBQHLWKWKhTAsnQsxztY2nBgqNWiG4N/y6sfmKjP+Pf3xolH/XNJltDOqI
	lcTIQxgODcuvxI/QLczUxHnxXDibBKnASVaRKk6oRxltfQBJo/Mt3c65qeJpmZBOx12mBT7I4Vqyq
	hOcNUCFJPagwDcs7LE6rYVz03DTI3xjS6L6M+HkG6hYX32TQVIC54MS3bqXUbAlmCiVcdM75iVSjI
	ViX++Rhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnU4-00000007wgG-1wBR;
	Wed, 05 Mar 2025 12:04:20 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmdp-00000007oQz-08XI;
	Wed, 05 Mar 2025 11:10:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2fea47bcb51so13276435a91.2;
        Wed, 05 Mar 2025 03:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741173020; x=1741777820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=hBgbFLNytPY80MT3aeRvgVIJE41vf3Bup+177+xTWtUckfD5I0joxmZnyePWufAAoi
         ym8UEjSbhcTcqjejJb/Rz3oUyE6aTF4zawLt2bxlmQ2IP1F0viHnHs0coXK59FAy3Bkr
         Kg+fQ2TAhu3Zt8ODdIaTypCVz3j3vTyjGdQGmZH8Jhw2dsqENfnh8N/f4n5GevrlYSA/
         8fKIWKBLZtYuNV7UuCoUGfVsbHB76WAFAg6tDqgSfFAkyhxcDNkLlYveNOqoz8Nc7k5X
         nw3xHkX3yQWY54ECDTSekYD8KCJSzyMPMlASXNR0TT1Cv65+RAkC+zdvlSDT8fwsIRpO
         G7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173020; x=1741777820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=Xgt0jof96PAJI4Ih90UuurQs196TwdZ2crjNElAcnjcIgTBNjmJPccT7AnTSzLO64S
         VISFJHo6t2qDgBqRgiQHMByfJa3tc9b5EgNDKQtG06oiv+vzUQcW0VzLpdnVyK5N8kyM
         ogzwQ0mvlCFsipdzHWjJVeRsqfsOMrx/LYFfPQgPZ5gUm9PWLqUMUqwbIHczJMRKGW1Z
         BxM2iFTi7jPMYGVgaIW8twC8DZbEyDIPRc4CSUsyIzJmh3w3PX/nSAbv3gzxU3pZ/WTC
         6N3/MJCAX3FQRxgLy8pv14fC/WFI+oqDLuoi/aejT6FobH7ZkBByqeJKWoNnp6SD2k/8
         gmrA==
X-Forwarded-Encrypted: i=1; AJvYcCUt3hAOTMZdfe17AoMaz7HmXOqZLG6kzeELbi825pvRhBRR/dnZpT5WYzcixkUZKyuNsLyf0J2bqwQupm68MFDF@lists.infradead.org, AJvYcCW1P+tm3zTAF0TEOrMoAvFJ49c4Hg+9FRefmbNzWJTCWH6jqHitiKtm2lDWVvZJzwME5U78Jt6oyqteU4k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp1uzmqmny0moVrZx3U9edpo31letsY6gK/M4JiTlUjeQeZYu/
	DFgRB+ZN9nDeT8GcDQv3r2u99Z5YbOiz1TMGULFDMtI4TKGbwnpO
X-Gm-Gg: ASbGncvEba7sxWgjZaF7EHQ7UJmQCKp5bfrBHYcahihoD8rgEMl0diw2MBbeIbpSAM+
	di8smtgvSXJ4v15iWL+47ilYnmCgEU6/aJ/BmDobHnhujfrcM0TPRrUUZwWufuRBXDlXgri1K7k
	IeQ6wmMr2COsfP8zn4QldLPb0aVYvm9bGY1R1Kwa7hPrzbwQ/tq07pWFjGmxqIdWOfvYerq+y/K
	2IK/WSucwTPZzEmP4rRQYNREm0Ky96fq60f8sKZZv13HcesFtiYErOh0TpqSoqZoKJIrxCETaDB
	8BkCEF9OvpnUfrmEEXZOkjTav923sL16YOYuf7jALIhZ5KXEv4cz4+NHFu/aDm8isxktIYzKoZM
	hYGj2U9KVucObheb27fa1/w==
X-Google-Smtp-Source: AGHT+IH2eSO5dVRpZfQrO0mycl+1zvAZDwU3KlrIDKDzNpcS47TGnHWji2K5rHzupBDupL/ugdamUQ==
X-Received: by 2002:a17:90b:524f:b0:2fe:ba82:ca5 with SMTP id 98e67ed59e1d1-2ff497283aamr4865930a91.11.1741173020419;
        Wed, 05 Mar 2025 03:10:20 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7737a5sm1060925a91.13.2025.03.05.03.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:10:20 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
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
Subject: [PATCH v4 2/4] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  5 Mar 2025 20:08:12 +0900
Message-ID: <20250305110814.272792-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305110814.272792-1-fujita.tomonori@gmail.com>
References: <20250305110814.272792-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_031021_079619_E30EF136 
X-CRM114-Status: UNSURE (   9.13  )
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

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/riscv/include/asm/bug.h | 37 +++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..6ab13b56feb0 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -31,40 +31,45 @@ typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_ENTRY_FILE(file)	RISCV_INT " " file " - ."
 #else
 #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_ENTRY_FILE(file)	RISCV_PTR " " file
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define __BUG_ENTRY			\
+#define __BUG_ENTRY(file, line, flags)	\
 	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_ENTRY_FILE(file) "\n\t"	\
+	RISCV_SHORT " " line "\n\t"	\
+	RISCV_SHORT " " flags
 #else
-#define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+#define __BUG_ENTRY(file, line, flags)		\
+	__BUG_ENTRY_ADDR "\n\t"			\
+	RISCV_SHORT " " flags
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
-do {								\
-	__asm__ __volatile__ (					\
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
 		"1:\n\t"					\
 			"ebreak\n"				\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
-			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
-			".popsection"				\
+		__BUG_ENTRY(file, line, flags) "\n\t"		\
+			".org 2b + " size "\n\t"                \
+			".popsection\n"				\
+
+#define __BUG_FLAGS(flags)					\
+do {								\
+	__asm__ __volatile__ (					\
+		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
 		:						\
 		: "i" (__FILE__), "i" (__LINE__),		\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
+
 #else /* CONFIG_GENERIC_BUG */
 #define __BUG_FLAGS(flags) do {					\
 	__asm__ __volatile__ ("ebreak\n");			\
@@ -78,6 +83,8 @@ do {								\
 
 #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
 
+#define ARCH_WARN_REACHABLE
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0


