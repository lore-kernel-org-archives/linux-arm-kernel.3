Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C3BC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNiDOpzl6VVeJNgjlyJ9nrrgFT7wIm7QDa1NpBXt1X8=; b=SEUSVtCgcr9AFIHzIBnTaDr1yA
	hJtPwo/sYNE70hQo7A30jWF5HHFOZuW2m/ZW0qq5OXSo4KzIv2GGZDqXC36bLi46ZKnwGAw38SDbp
	XY4dfGWMSJ8ylsPUvO8DGY+05OzUj7l7qClkJf0BQyeyvK5yLaBARq27GKk+4wQArx4rbD69Qzext
	mbfy0Vw99RpG7mgCXL4SUq+EurBwJt2B9fBpw/CdyOQVm6dNcmIvZIBQbTeUhiPxsIBsksFRKGr0P
	D2bjzyEzbaG1ZMAmUMmlsPNiBSNV+QdBO48qUURpXlgDjr8/lr82sp6ODKrQdlFxLDzMSfPrN/vjB
	Z0AwgwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt6g-0000000Br0J-03iY;
	Thu, 27 Mar 2025 19:41:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1U-0000000BpTq-3zzl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:22 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so2208629a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104175; x=1743708975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNiDOpzl6VVeJNgjlyJ9nrrgFT7wIm7QDa1NpBXt1X8=;
        b=U9KuN5eOMxktPxQHIMrMJlE3JUjzd/DFXyphmpGgnJAq372GGhHnceaa3fzYMVvaeI
         +QTDfRt1P57589CO3BWqmFO15vS4tyxcxkTHGjaODWTDIp0G0SwDGjelxef/iguO1t2y
         U1oUKbA3CgnIVVED9+NL3TkFLrKRQqMhwe0tRCUdNMZ6s8xKJL35Z3qFxSizA4PSZNzx
         9MI4mTQPZAwj7vQMyOVKZbFgVkcmjmsFtOWajB1Tr1XKUxPO+Us4+uhBj92CNW2yQma8
         5pUvc5v2so28uN9KtUgn0EeXezQSQlXt15BaJ8XbM62wdUHxFgTG6E6+CgsxsPfIQfVx
         mmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104175; x=1743708975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNiDOpzl6VVeJNgjlyJ9nrrgFT7wIm7QDa1NpBXt1X8=;
        b=nzNdzxAVe4BR+ix1AyC2+tq66wX1l9GTRHfAzveBRObumNLzUXT+K1ot2wCFLmal8S
         xcQMSQjllab4NoGScSRyf2O/ipFGuSgpvovZsfVYXE3SsY1+sNVdwRFcIK4CB4eVIuRw
         YCrvRBC4xbeVGE5TsaY8mIDFpnhEqPnH1EN4N1UEj3CLvWPc3iFwhB4bRBjW1fbN6M/B
         5h0DqsdDpKpGgGcFs5PIu75fCfm196k9I6ad3v4C1xpOzWZHTalSUNRuZpAyFR6vU+mn
         gZvrO182HpZDGOvnOSxGPERKv0rkTypxyYnGk1eIIWh+547qoUVvsv49k53br63z9K0f
         Ua0A==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9bT3Q97RKjePwBiKkJcfHfPg2DTV2KRhpmm036YWHLQuxr5b3Mbg0jc1bc8o/9gBK6yjlroZt9/q1Pi9I9WK@lists.infradead.org
X-Gm-Message-State: AOJu0YxLlEe0zyPjzIjMN9KLIXPey8fBi8p7U3VON5TiJP+vVlSw8Lfi
	JFWf9NtGWbLtrvw3EjvLqvof1N4SFFjriFYVaQMrKhmPfn/wt9cIqTB0FQW4vyinS/eLGA0z1vx
	7
X-Gm-Gg: ASbGncvZmlu0anMUMEhKPcpv8gY32ljadjG+So/l9lrpLeNkULYZqfzjKBeK2gETT7U
	dIfVzB0R41b9JYj4EVGFMDj7rUnYi+gHXbAsLsl8qDeKhKxc7kLXyOQgkMIDVjZDqyFx91RcTto
	LaRPewmryajJq226+VO7km3tF/7krG0m7gYMOAfhRbrztZsO6fOg63KxNFDX1L2J51z1gpdyXQ3
	0U2c9OgHcLroomEvS/WjZZLxaaTFoUuqFTUU8w/yyThnXwklRUb4O97tZYE8t5gh5gxS9j/i+6s
	sit2byqfcnQdQOASdETZs2KqdDPK1eAo/QcG/JIBHHEdrQEnHuDN478aLg==
X-Google-Smtp-Source: AGHT+IE+y9OOA1EBKtpBON1MPRGyOf1+3dniyWNGs1euEGYpPv+8H/XM0XTNXU8WsHLC0qF7ObKE3w==
X-Received: by 2002:a17:90a:d44f:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-303a7d6a7ffmr7665632a91.10.1743104174834;
        Thu, 27 Mar 2025 12:36:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:43 -0700
Subject: [PATCH v5 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-counter_delegation-v5-2-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123617_041159_4419E686 
X-CRM114-Status: GOOD (  10.43  )
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
Reviewed-by: Clément Léger <cleger@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 6fed42e37705..bce56a83c384 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -333,6 +333,12 @@
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
@@ -380,6 +386,14 @@
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
@@ -422,6 +436,12 @@
 /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_MISELECT		0x350
 #define CSR_MIREG		0x351
+/* Machine-Level Window to Indirectly Accessed Registers (Sxcsrind) */
+#define CSR_MIREG2		0x352
+#define CSR_MIREG3		0x353
+#define CSR_MIREG4		0x355
+#define CSR_MIREG5		0x356
+#define CSR_MIREG6		0x357
 
 /* Machine-Level Interrupts (AIA) */
 #define CSR_MTOPEI		0x35c
@@ -467,6 +487,11 @@
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
@@ -492,6 +517,11 @@
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


