Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A115C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7dqPj/4OqgIxw+lFGbLNi9FTj66PFQpLla1/LzexBE=; b=X+z38NmDCCXSginkx7fLqEY9WK
	LJSJhR01B4CfxgMVBsLFWDPBmZwQ03dbXkKGJE0vvHCarqi4Q/okXm/yH7rzFe4zew2Pqlf9KTBGo
	msajGQe/FiM/YNnSqkBlmnYsoIHNaPZJAzZ7FHBa1sfCgHV5mIFxgD/ILeCTNcPQsbMGsHrZcbWAw
	pptLFtF8blA9rTsF7LqyiFtekkWhgPY+6IJrfia1qyrqK/Vljpg4Q0YT9jAh1LRIpkAR9zAWad6xQ
	KAStBgZ2H8gErqzvbtrnSTfgskc7Wk5b+VoxY/6xiBnCIopE5hTqL+dET1uqC5/jQjBggdTN0NKuD
	oYB+8klQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIGf1-00000002bmp-3MGJ;
	Fri, 23 May 2025 00:53:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFIx-00000002RsE-1VUi
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 23:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=H7dqPj/4OqgIxw+lFGbLNi9FTj66PFQpLla1/LzexBE=; b=X6emFsNSMgHZ3dOJgHy9T9cS6g
	Prj+5Qn7i9kRD35PjqlrZWzYcJ89yD7z/lDCnPZzGmSf3DeRWZ1NKn8Cc58z1RPTeMs11k7FSMXmD
	HTzYGjONSX7vJmo1qMu+auU3pnW8Oj+yvMi1rIIlRCJ2bKrod1e561NGcZD5YvnTYdDdW3mLc6R6w
	8kVOQAp0Bm/dJLos/rfNlXkbdz2wM2uJxsE9Yfroa15nUbpfCFJWv0uoo84iaQudN+cacNpHgM6RP
	Hb42djHiCOpOn7gjQPAsg4jfkv9tD6JsarL5HVg8E7/QBH3eZG5oriOF2sw0MxpV5pvevCWWtKpYX
	EvyHlaug==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFIs-0000000161H-0I6u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:26:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso108079875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956379; x=1748561179; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7dqPj/4OqgIxw+lFGbLNi9FTj66PFQpLla1/LzexBE=;
        b=w18R5RREeazDkk2D8wYqqqZmE7dbcyE0lFDK8IFnVQ23euGoeoRcbLgO5nRXpY21qI
         E/2GcXaN+6fkorJQ6S4/PE6sZ6Us0x5EOqESuuhEM8JED3a54AC27p2hI+cm77EiaPBM
         HE6gFx+dmk4j9wSffVonjW1VaGq5CwYdfvI/n2nMOvkOkwtujJjWiqp/W0UtC4Lo/z8Z
         UxrGm6B5Jw7uMlu8jZzK5R3wFJHC5LF0FYzW6uzWvUc4UkQGDEj1r4rGuD18qYY5j1GP
         ijT2XZFQ4vJWbMnCedU+NiirmOX4Mivm8ECrLL8OceZiRtzfO64dQzK8B2KIrBA247It
         oyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956379; x=1748561179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7dqPj/4OqgIxw+lFGbLNi9FTj66PFQpLla1/LzexBE=;
        b=F9ykNK30rivZbH/m83IlFbxR7+OO+1PZ0nXA+qjv5Qecu6JlYkLFzbrb/OeoP8CrQ0
         +q8BteZnRQj9ajhfBS9q8Dlqoj0rFV3PJpzs+oQhzBOum7OtfeKAObkXtEL70JKm2bWv
         WhR47YHpduX9eymrv04d+aGRfUXdXgQ+dLV3HxJd4cwbSQ3De9Q0Z0DgzkzmgayGd+sX
         6qHZxeFz9Bu07VDFwoDg7BxpqPvD5SgOZ0Ql5eDncCJTcMjDPaWoxyP1PmduFbknTgi0
         oV9+ZJBBhr+sNFw6fswVJG/mwjfvEdLFcsQKs9HuhAUpGjbOFISkLiwEVgkBoDJshSro
         6PeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYHwaP5CW3m5RBapeu142gu4PI8rvBnBxrD8rf43SHdwzwwL+whUZoOEca1837Ra1jpCbDRSYSxmlOmPJcnU2R@lists.infradead.org
X-Gm-Message-State: AOJu0YwFjlFIGUOZFUR2yGGyPDZSYKcbrCqr/lPp8+X4V3EbfcVjYw64
	Ev1fLYEXdv5w4jkoJcRO2D4x7Ayb9E5hgGB+7IJ3yv3R8zmbX+P1d2DZasZ5h/vfuwo=
X-Gm-Gg: ASbGncuhWaGGqyHDh4F08X+hxZzsG/K5uG/eOsHHG17KmbnM8IR4xUMoMZpY5lkJYdu
	wse+QOS0wie6zN1h3PsWVgOGFxonW0POBzSGuItWkRkvpcgd/ixSqRvDjYH50QOFIBdA08Oaanz
	KYAcfbPQC4HWDiG2Km0oxsFaBeqpz8AcPCD7zF5QajB1bxYF6+6mRPlDNcDCq99frCFkL93QvFU
	64jhmore2PAjnMZxIyZhnejNyNC3UVZ5mYQIwxLnPNtR52ulCnnsD1ZTi+UQb4+zxSWSebz+7ib
	HPU8zBDb0hD+dL7yXLmFXXi2jKEcjOo3daeWQXx6byqG4oqNEnaycA==
X-Google-Smtp-Source: AGHT+IFXXmQbzS5vqDGu4y4TwQnk0EiK4CC5C6meSlb8RPETRBYPhp8qkAqi3TzGPklrLZOBPgJ0mA==
X-Received: by 2002:a05:600c:64c6:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-44b6d1d44aemr7930635e9.10.1747956379233;
        Thu, 22 May 2025 16:26:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:19 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 23 May 2025 00:25:09 +0100
Subject: [PATCH v3 3/7] riscv: Add Control Transfer Records extension
 parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-b4-ctr_upstream_v3-v3-3-ad355304ba1c@rivosinc.com>
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=2624;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=gvU0uMFD6Kovn+U10/vBvR06A23qjRw3z0F47+AnYRQ=;
 b=pyfnCvhX86bz9z1y3qjxlNR2g5lGOH2Tq7LR0ghQj5QSvYJrDGwpQ/jbb4U4sW1BvShvZvEdX
 QqJA4YOOC0EDUOV9duD2meq3fYPM1ise96t5o6riam+ED3WjJWGTHfg
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_002622_626371_7E67712D 
X-CRM114-Status: GOOD (  12.05  )
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

Adding CTR extension in ISA extension map to lookup for extension
availability.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index fa5e01bcb990ec26a2681916be6f9b27262a0add..9b88dfd0e53c7070793ec71d363f8cd46ea43b92 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -105,6 +105,8 @@
 #define RISCV_ISA_EXT_SMCNTRPMF         96
 #define RISCV_ISA_EXT_SSCCFG            97
 #define RISCV_ISA_EXT_SMCDELEG          98
+#define RISCV_ISA_EXT_SMCTR             99
+#define RISCV_ISA_EXT_SSCTR             100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -115,11 +117,13 @@
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SMCTR
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SSCTR
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f72552adb257681c35a9f94ad5bbf7165fb93945..7fcbde89e4b9ee55b30b27f5b93e33dbe8f9ce58 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -419,6 +419,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 				      riscv_ext_smcdeleg_validate),
 	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
+	__RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
@@ -426,6 +427,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv_ext_ssccfg_validate),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
+	__RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),

-- 
2.43.0


