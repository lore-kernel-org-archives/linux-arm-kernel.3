Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A92E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxfKG65dTTWELGQSY1XBUvmc4ww6DrMBB5fk3tB2Lpw=; b=4PankEF5hTmF9OMB74om9AwpUM
	zop3A//cGgn1u4oi60ZJpcdSVG9BylwZ2hz2CmMCg4f0byBbA4ZIRRGKiSVwLW8yKeW4CMqla59rL
	JLLUIPQ0/TISKEbZGLwXxa/Bxt3TBp0UN4hbjJU3WqKnz1hfyy7TK6l32Pe1XCrom5DPZ1SRG6EDA
	VF2lqVlEb6fjGUkj3+wWalZUkkrnXOqr/Y1WqXkjQ2R8OTc9QiMTUCck8fMhqY5UCKi92PM45aa0y
	SAWQu5cymX2PvjtqZVxTUwkfS2uEGfzc9h3VZ15uVIXGSPPTaNZCo6ApBVrv8oJIo/ZAsRDPbdwiG
	vTJex0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpvH-0000000A1OD-2Cju;
	Tue, 14 Jan 2025 23:02:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprZ-00000009zkY-2Rsv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21634338cfdso100824085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895501; x=1737500301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxfKG65dTTWELGQSY1XBUvmc4ww6DrMBB5fk3tB2Lpw=;
        b=eKomhOKXC0X0PxDcx0XDbCeQkjlycL0kuSEliqEOQqVaL1gh/94ABIpKyVaBvL4LUn
         waFSWYDGiEZEJVPxdqZqrknAU9RcP1z+0wkb9TDciCT9aj9jyxToQ+PwnDdKllyK5rsJ
         rK0SmTQA66n/DKaUik7UqK/9mwIQvrbWlyCw/bDxoBqSk5pVnQz6xZHax2uXViVWhZpu
         hBo0+FtZ5b9gjJwrV0mhN2nQz/NBcfCf1CbWREg+7z3n9TWifReNR1vqFxjIPAuUfxkf
         jS58xz83HitSuMOgL4sWNVVu7Eq9M8P4qfst60enuSEeFTU9ovI8Bqs9mGgzTb8S6hPQ
         4oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895501; x=1737500301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxfKG65dTTWELGQSY1XBUvmc4ww6DrMBB5fk3tB2Lpw=;
        b=wXX70dVAwKUsRgvoap80diaJlwO/AMqvd1FdsQJxDMmgHrOL5r4sqS8QhzpLr4LIRL
         ro/B8jrogEACfCrnCNOsviZH8aEOZnWkvqLXVnrpflmTDJrkEPV3wzLzw2P+bjK5tNWf
         QxaosjBSaZmbMs6s9TL2De/sXL+uUNBoTRFZnnELm9w1NMq6/HeSDIiR5Lsbvavl/wMp
         YvlYRJHhRArD0MoDY4/muJ5ZUFPjMoO0rfrbGycrOFqpRuNXIpiToIXUUH6qMQPcA5wX
         mYYRSei+osZS7RUEcYG9fX94zQWp9o3z2lsrFJHcPScxaMnY8DeRb+TU0yCgJ9WKh9Ok
         1bzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOw8Ug5a5zztY/WnoeMYEIiPlOES2SXqWg3SHoKvqAZtpnIinrdI4PyhN4EKcaroBpZw9Rx28FiEkI1BNXaM9c@lists.infradead.org
X-Gm-Message-State: AOJu0YxkNy10L3vtlwVAMlXK9vAcAGNa8QnPMYHRI0m/v0wbKmQEcKSB
	MaxBeTfqBg90/NKIc8vZ4XNUIbBwQeGG5fmnTpjqxrb299xVGTow2DGvl44bdds=
X-Gm-Gg: ASbGncuDkHQXGI8Aj+yeb+bY2MwPi6ObhqniHOlnV1pJpY1GyK7xv64kKE3wR+G43Mh
	qa0G+AcjArDjUVA500Inlok0Sxijd6Jq2hS6q4eX9i0Qes3G+ITMnV8GSG0jOq2nPx6wIglkpZe
	i/UV7EROrp8sjpTJjWPrb/esMfUmQYVKQsWsfh8Hh/Co+zBZ/Da1nqZGA12HkifmmPwBUmA3Rlh
	f7VqOgoV2nM7RcvKFQTeVKPRPEf+Gftoo6qoZgEolCoR9BV29CZTQSATEyH2xyZ3/cvxQ==
X-Google-Smtp-Source: AGHT+IEFzn+BQGP9HoY9wlfnVhVEePoikrfOCZH8FHyJCqYtdMpQEJ0WBuydKODT01yP3q133TXafQ==
X-Received: by 2002:a17:903:191:b0:215:a964:e680 with SMTP id d9443c01a7336-21a83f65330mr394967985ad.25.1736895500674;
        Tue, 14 Jan 2025 14:58:20 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:20 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:27 -0800
Subject: [PATCH v2 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-counter_delegation-v2-2-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145821_642370_FD1D307C 
X-CRM114-Status: GOOD (  11.39  )
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds definitions of new CSRs and bits defined in Sxcsrind ISA
extension. These CSR enables indirect accesses mechanism to access
any CSRs in M-, S-, and VS-mode. The range of the select values
and ireg will be define by the ISA extension using Sxcsrind extension.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 37bdea65bbd8..2ad2d492e6b4 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -318,6 +318,12 @@
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151
+/* Supervisor-Level Window to Indirectly Accessed Registers (Sxcsrind) */
+#define CSR_SIREG2		0x152
+#define CSR_SIREG3		0x153
+#define CSR_SIREG4		0x155
+#define CSR_SIREG5		0x156
+#define CSR_SIREG6		0x157
 
 /* Supervisor-Level Interrupts (AIA) */
 #define CSR_STOPEI		0x15c
@@ -365,6 +371,14 @@
 /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
 #define CSR_VSISELECT		0x250
 #define CSR_VSIREG		0x251
+/*
+ * VS-Level Window to Indirectly Accessed Registers (H-extension with Sxcsrind)
+ */
+#define CSR_VSIREG2		0x252
+#define CSR_VSIREG3		0x253
+#define CSR_VSIREG4		0x255
+#define CSR_VSIREG5		0x256
+#define CSR_VISREG6		0x257
 
 /* VS-Level Interrupts (H-extension with AIA) */
 #define CSR_VSTOPEI		0x25c
@@ -407,6 +421,12 @@
 /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_MISELECT		0x350
 #define CSR_MIREG		0x351
+/* Machine-Level Window to Indrecitly Accessed Registers (Sxcsrind) */
+#define CSR_MIREG2		0x352
+#define CSR_MIREG3		0x353
+#define CSR_MIREG4		0x355
+#define CSR_MIREG5		0x356
+#define CSR_MIREG6		0x357
 
 /* Machine-Level Interrupts (AIA) */
 #define CSR_MTOPEI		0x35c
@@ -452,6 +472,11 @@
 # define CSR_IEH		CSR_MIEH
 # define CSR_ISELECT	CSR_MISELECT
 # define CSR_IREG	CSR_MIREG
+# define CSR_IREG2	CSR_MIREG2
+# define CSR_IREG3	CSR_MIREG3
+# define CSR_IREG4	CSR_MIREG4
+# define CSR_IREG5	CSR_MIREG5
+# define CSR_IREG6	CSR_MIREG6
 # define CSR_IPH		CSR_MIPH
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
@@ -477,6 +502,11 @@
 # define CSR_IEH		CSR_SIEH
 # define CSR_ISELECT	CSR_SISELECT
 # define CSR_IREG	CSR_SIREG
+# define CSR_IREG2	CSR_SIREG2
+# define CSR_IREG3	CSR_SIREG3
+# define CSR_IREG4	CSR_SIREG4
+# define CSR_IREG5	CSR_SIREG5
+# define CSR_IREG6	CSR_SIREG6
 # define CSR_IPH		CSR_SIPH
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI

-- 
2.34.1


