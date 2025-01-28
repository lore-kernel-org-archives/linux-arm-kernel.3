Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD73C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 05:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxfKG65dTTWELGQSY1XBUvmc4ww6DrMBB5fk3tB2Lpw=; b=RKoyCPkIN0NNk83013Rda/+3B5
	kWI1SfpwnMzMwbsiSGRQ6UbYtp3X78cdy/r3bYBGgefdhMrk5nABy7RlbUMKXH1c2eGeiQR5ChRTB
	MSOf27RKB9jvVN8eCiMWauA6TNozXM0ieXNVOfiYNaqvrRg48ordG/6PcJHu7cuCiu76I30GOKwFS
	wYHXGMd+daqlftIiRVejvx1oCo0mFMVZfsrs7ma57Bf2/cUip1c2f5cgFCCpoqdE0ifK0bds/imOW
	slYgeiNODCAqmHf2Y/N6eAt7aRGGweKothGl9BeIFXpn3kbrgJ19Nt9lx85S9RnXiVkD0TLNxQLHi
	jAkunwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdlX-000000045pp-0aIR;
	Tue, 28 Jan 2025 05:03:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhZ-000000044Jp-2jKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 04:59:57 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso6874669a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 20:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040393; x=1738645193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxfKG65dTTWELGQSY1XBUvmc4ww6DrMBB5fk3tB2Lpw=;
        b=Yq3AqBUfNLKFNVT3lypt61S4EdhwvTfZ55N2DukmN72wh/ElsshCYHnQpi5PrSxXK7
         uCiE7TFWPTyBkMHwruZ5DcBiLnoVF8v41JCYYlckpk3R/ejYcRKST+Ml/lYLrqel1pq0
         Dus47LwTdbtQ5D1q3ed5Ch6VWaeR13eIISpwVHGc9Zw5wscysXd8V1yuS3/Pe2qPbGlH
         lz3FMBBHBsbt5kVMKoigLIQ+pYAgeKl8nlwNsOa3/1SNl9eSBKcQLBYZxDjkJ+gVgf+N
         hrY+rH6c+iedWAIF6MYX2zPpLOzWdgmC5zNTjkhyAvqn9hhx/aiOwNOLfSZ6MFDg0BW/
         sK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040393; x=1738645193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxfKG65dTTWELGQSY1XBUvmc4ww6DrMBB5fk3tB2Lpw=;
        b=ZNfiJT0OLRLwyg9VW4qHqiGvwKy1n3w7rizAslKntnlpZCuzyYhdA9YlHqN2ESMj1b
         EghFvFA2EflYOhMvLyHjFZ37lKRZfCmJwmoKnYqGO4MRZfLmsgjKwFy3ppNuJ2he+IN0
         1iT3fNkzBR5nvrId8TRmZzKdn5FgG4FcGqEIUqHUj2ppbTeWQMgmU1DEDsmFf78/bhMO
         avxUv2L2nhConONKBvYfcU7P6C7nh5wml9pjoRd7BOCi8H3lDK75npCysL3UWQhfK92e
         YH/Wtb++i0vUxCO1ITCNi5NOohUm/NvDJHyMGaz6o9qMdFQLi3fjb3YxdQx23UbmxecB
         zFZA==
X-Forwarded-Encrypted: i=1; AJvYcCXWyl+r8d9lXtXthHm0CQJCnRFG8nAY+TPGtwe6YqmCFEGvWlf6ifX2zqnmftbizVdE0ish2k0Q1WMORbRFpVDn@lists.infradead.org
X-Gm-Message-State: AOJu0YyiRdKFoC0gfxbsUKSrDS8iBk7VoYwyZ14bteVqAbHvmEJTOjF+
	xexK/ObqXbCd3kZiV423XiRAOAcmdBCnP8lPaZKCsRmwv0J+VvmUcURXT+FDn5I=
X-Gm-Gg: ASbGncv3a7ROF/Ekt54WdzWXAQ4cP69llNJNq9kOLSXBcJT8boKyNdPf3xq1Tv/HZ55
	JC/mJkco16B4rs/ACPtIenKxRoDuv7Wl8q1cmkVEO4P9XvNWratCBvV7efYr6omhAVSabeSgU9/
	qwu7FEvZmqR1R81068pfpGINY5KAoRWpdyg65ipEHN7gX9y6Dvjiicz3Psi0mijHMeCrMnc/ICs
	EDPpquEcCHU3rcNSYT5JQQQ2be7YHdQsh3JCzfhSpy9rJzbXxoRvB4ouXF/tcR4kuCVWZNlTPmr
	1Q6nSlNp75m0GOPcm/5Cndjrsz12Ul8lS7SNUYE=
X-Google-Smtp-Source: AGHT+IESukFvE4jgQHaD3G8e0OnXfuu3U2xg6/y3jZ2pizirle7LkpWlYPqExckDpakmelWJ9tr/CQ==
X-Received: by 2002:a17:90b:4d04:b0:2ee:8619:210b with SMTP id 98e67ed59e1d1-2f782d97e04mr58425837a91.29.1738040392749;
        Mon, 27 Jan 2025 20:59:52 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 20:59:52 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:43 -0800
Subject: [PATCH v3 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-2-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_205953_724115_9701FEB4 
X-CRM114-Status: GOOD (  11.57  )
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


