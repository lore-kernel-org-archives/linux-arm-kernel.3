Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3481BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpU79JAmkI/euhUSjfGzozskMgtqeVAFHucAlKFsR6c=; b=gqIyw7tcolNQj0rZD0AEM/KGud
	L4eodm+MYZlB8uOgTKkr+jA6S+hfpV8gFNlU+rBBzAtFyo0ldU0y0nTpRBZJWoI2thdeNlhdm3pG5
	7Pg+BnAuXjNfshH43c1UhCEXMNzBqjF/x8XMmlpqPaLoFMaURej7C2xZNGNrLo11i/GWKLW5Kv66/
	WG1ANDX44W2921dcRq+fJ+7F3/rDL9fYoiaGvZwcznKQ2+pQV+z2FcwScBFSoqjm7fGzF7OJVsr7K
	mIZufavVNZt65sWN0/ghXAj9trQF+lXycCbQNDfjsoZzhBvjLn7Cb+u45fKpqGUj3QmRwgTxjayBk
	tCjavpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwIO-00000005ZYp-0K7u;
	Thu, 06 Feb 2025 07:27:32 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEJ-00000005XuX-1U7d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:24 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f9da2a7004so816725a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826599; x=1739431399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpU79JAmkI/euhUSjfGzozskMgtqeVAFHucAlKFsR6c=;
        b=sn50xTzec3uGwtF43ZkIwEvB18tlDOmxe7hIscJxuuh9zeNBySgKj/YfvVp3/BmkrL
         01mpoZNxvdgxEabh2t8Z6NiI+stb05di3nWKFNJKq6Ha7mR0HxHKoTeewu9izpgPI7Q0
         eAN3kapm0gaY46OuPPzOPKtnnXvaJb28pmtSeLzo7rKMWnmPnmugNK34/VzUiMym+9Ea
         9PSRXFcf4l7Ke+u7g1WG/Ccmo6iHeP/64hBTXrgcDRIdebdGJaalzylJHXRwl6+hNmG0
         L2Y0W4V8dr8SS1aRgrlorlcwVGlgAowpNFXFNKqVf67zOQ8zqTDky+wjayPI0ZB/k0AP
         dLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826599; x=1739431399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpU79JAmkI/euhUSjfGzozskMgtqeVAFHucAlKFsR6c=;
        b=wu3bzXRJv/t5oD0KFTi1CysPUXzqTVDLGqOwFnISEZ4u8PkcmSW36ug3qOX/lixWtn
         5QmaNKnDvQGFUmFyMFkg8Q0jxC98u5Qi+4P3Tcbu0a+2vBZJEvSltAey1r2Q5O0j+kS5
         luMJ3wvaADjDLENTfwZ8D23JZbDMVuBnghOfewKDoZ9TRtjb2UGISDh+2sWjfv0QJM91
         HJzkVFQiMh7YRborg1hehgvaXWHz7115KsaQFqDlJ0Y8aO1KoXz7HH11Uu82RP8tfPQm
         vODGpr/YVixabnJpZf6M0uxncNGNh/L3EgwQw34dwqqir8PQ/0A7ngi3pb6oqIxIkayb
         aeSw==
X-Forwarded-Encrypted: i=1; AJvYcCU3qYyVgBPFnddjra+uiCL4gNqTvaZU9hECgsWfFzPMCWEf3NjzfmRM/i8qS9+Jna7Sp9m4XLrEEuowdxkEvbmV@lists.infradead.org
X-Gm-Message-State: AOJu0YyX+kdNKPzH/mfa7AF8L8gp+5C/xnj98h4RjHiS16tvE+HO8V7i
	Zjow8yC0duvGOwjaJHA9M+Pj6aTYH2uKqdSRobxWQCz2HUqE2kBcB+we7wVL3q4=
X-Gm-Gg: ASbGncuWfuVRN0/4BByLBmPLlZdpf4omcVJDtXL0s3srpaHwI045iN4824+0b5RuDxo
	ObRxslqgzGwphUL3joVomlwe5BTUpd4ahxjMJALPM+O2DSgXt7yYot0t222LxhmHRvpAU71fvWC
	4cEzccEf3K1AU/jJ5M94Uj4Jq6eLPowAuJAlhh43wz3uaTgXpz/P+4ARFqDmV/LLJHeAEMn8xjb
	4iky9fhcTPL5p84uxx8SoO2mucbP5K0kO6+ADCurTLjR8j1sTIbjH2kgu77mkYE8NGAgYiIXR9L
	/9NyutETDm6KS9zDXPy1WroSNqng
X-Google-Smtp-Source: AGHT+IESyqIBQACISlQQVueV5obgLnnWc+HDOijngEV9yfltfz+MqhbZ4NE+KJYEXiM6dtB0C1mfdQ==
X-Received: by 2002:a17:90b:3d91:b0:2ee:d824:b594 with SMTP id 98e67ed59e1d1-2f9e083cd43mr8885048a91.31.1738826598796;
        Wed, 05 Feb 2025 23:23:18 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:07 -0800
Subject: [PATCH v4 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232319_438526_39EC1D6F 
X-CRM114-Status: GOOD (  11.17  )
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
2.43.0


