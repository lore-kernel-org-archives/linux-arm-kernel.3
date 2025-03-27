Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9561EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 21:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU6+swbjNie6iv0e0xu8zQCGmiznni+/eNGoYv30rIw=; b=2Arq4/by8HN31Xx/VV/QAnqQAE
	UMgOGqp1T1BOynpe4OSIBDLPkXNM0WRDLuuS0Xy3ANhynMnxqRhZU8MVV5mMvEGAckLt6zKZcZrVU
	TaX6I3EenPMFZN8Roobk7IatqYWTtIpoExUevuP+2AGwGetk+taeKUgInLWLJd+D15+vUYHFvFgmp
	+3qFy6AoKlmI4ONpa3e55CQTxFNnbi7CJQBJCJXLZJfYJ5I2+NoSfBSPrqjQDv+uBl9xE5y25mOOx
	xGR1Jzvg2DPxKFxcSmtII61qGWyTly18L3FFlTAAIsR35sF/kGP/4GNS8yKC0J/5PBVZZ2g54t4Xb
	aZVUS5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txuTA-0000000C2Q7-2POn;
	Thu, 27 Mar 2025 21:08:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1k-0000000Bphs-2oBG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Mar 2025 19:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fU6+swbjNie6iv0e0xu8zQCGmiznni+/eNGoYv30rIw=; b=R2TtaZp8auJcsi/gbGWQoBd90a
	EO41+HFCKfVE5AJVyngJQssakOs/urbvhgdObUTrn595jYXbdLVDSnqp5MvEJr1dvAvkNVhgiCxUU
	LosDXr2v3r+liziqTk35vxCJQf3PAgMmWK7VNnDdPJ0S+qVWN0mwJQW8vlkWSyvbqpCmKPUofskQ1
	W+e+vTvrKAfZNlUxqPzqyJyMy01CxNILpN4WA14+N/eMD6lWokurO3nQmLboqUEPDwdsr+S374/3Y
	FmwTGjZlYbh6hBKfGyNad8CJUjkwNPBz5Kz3VIJmS8hQn8diCt6GU8NZZF54EY27A/Emt+/DzHjX2
	/EavJa9w==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1h-000000061aI-1X12
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:31 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-30384072398so1844992a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104186; x=1743708986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU6+swbjNie6iv0e0xu8zQCGmiznni+/eNGoYv30rIw=;
        b=ve/ve+TQyaOHZstd+j3+yFbVcWijJ0F4vw05Bat+mtEbVFSu1BGBKMF6r1zSmtFxvU
         oNeLGN9GQ6se8KniSpJKurYDHyjT/AEMGt3o5YPe7dEuQEj2jr3E9JtWg3Y1yZpWU2G1
         VYzmQli+gChYqKbuA5Pexrg49nQv9tzZYpQiVufNU7ucMm946Ci6C8fqp+i9VRkS0i3g
         4eI5txGfhTr+is/RXemNcf3hnKgaFeebtPNC1zF4tayoFAF8GYO2wfW0l5enve+eSxUM
         HMN9Pz+JDgd/0tzplw7FctuYahkFS60vv5FOQS5olSW6V0hXRkS2x9EsDoA1aJNH+mhe
         jR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104186; x=1743708986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fU6+swbjNie6iv0e0xu8zQCGmiznni+/eNGoYv30rIw=;
        b=snUAIO7UPLEHQ5S6jvcIk096AliDtluvlrXv21gIvdWYNyJ3KnwJjx8wNX09WY2ZBw
         Jpg8GZK82MmzgyR4oUH0VB5o7rqo/JMsigzscel/t7nwH8ofzxA2pYuJlx3Tcy7U913U
         lzGn1mXCO5te/IpsG137tLNRm9GkoS4aVyYILMkFrZ8EyHsmb3R1gxsrihxZ3epsHN/G
         GetIwwl77iBA4zv9xwEVGn87hens9EvYTzUfvNw+aKgE5TxGbhhvH0Mvhlw1r3HCx9iB
         WHy5eySGNG8TQT9FK2/3QLHgpaaV0bPlmcTAiMbhXyMQVgwd4NDQKEK+iMm6kwXjkIiZ
         jPWg==
X-Forwarded-Encrypted: i=1; AJvYcCWY9zUjEeGFDCgI8oWJpS8+nFrRzrM6CF7EkthaxKOFzJqsTB/vc3PCQXDK6nKUORGeAxeGogQQ+9F5qU5EvAVH@lists.infradead.org
X-Gm-Message-State: AOJu0YznCmGnHddXVqxNKnoIk6MYttMYpmoEfyq/YPW3ML9KDdcIyVB1
	vhemlcdJ4NBMBU0oRZ0+8b+uAmq9zHuggnUKAAn8iaITmzgv0EG323vdSMjAqrY=
X-Gm-Gg: ASbGncuNwvBPNKEE1H0cywtwThnk9XZRRaLHE8nv+usmR2HeiGLANaf5sboFttonDWa
	VdY4FfeoTks6GCPIVRF7plGbcEHZDP/LLL8X8DCppZRkNSanKwk5DfLeH7DZQkAlEvsWcUSbKJh
	tacb7GSuKF9N78bTiR6oEPgXCINxQN1WwBgsjBcO1s3Og+GviyBYp9nWMEHFJ4jX5llicnfc3WJ
	VF0nlH+udtUUtWVw2OW0pEqvhHGMrAJU48NmH4qU0HX6VLvWX5w0SjlM1HhtcF4IZ0UuKy+B4Cl
	O69U0n1vZ5APzlrf7sHDidB93hBTo04z0RcXTPEsjrQH4ZgSusJVAFTp5g==
X-Google-Smtp-Source: AGHT+IG6W5JCnq2W/DPMkiUqQh7RSB5vMs9zmrYMV01msf9VIMSJa0JuflPjxBxsdjfYbz9YgA1nag==
X-Received: by 2002:a17:90b:2ed0:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-303a7d66291mr7527766a91.8.1743104186345;
        Thu, 27 Mar 2025 12:36:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:50 -0700
Subject: [PATCH v5 09/21] RISC-V: Add Ssccfg/Smcdeleg ISA extension
 definition and parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-counter_delegation-v5-9-1ee538468d1b@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_193629_653240_5B79B008 
X-CRM114-Status: GOOD (  13.70  )
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

Smcdeleg extension allows the M-mode to delegate selected counters
to S-mode so that it can access those counters and correpsonding
hpmevent CSRs without M-mode.

Ssccfg (‘Ss’ for Privileged architecture and Supervisor-level
extension, ‘ccfg’ for Counter Configuration) provides access to
delegated counters and new supervisor-level state.

This patch just enables these definitions and enable parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h |  2 ++
 arch/riscv/kernel/cpufeature.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b4eddcb57842..fa5e01bcb990 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -103,6 +103,8 @@
 #define RISCV_ISA_EXT_SSCSRIND		94
 #define RISCV_ISA_EXT_SMCSRIND		95
 #define RISCV_ISA_EXT_SMCNTRPMF         96
+#define RISCV_ISA_EXT_SSCCFG            97
+#define RISCV_ISA_EXT_SMCDELEG          98
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e3e40cfe7967..f72552adb257 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -150,6 +150,27 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_smcdeleg_validate(const struct riscv_isa_ext_data *data,
+				       const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSCSRIND) &&
+	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZIHPM) &&
+	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZICNTR))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
+static int riscv_ext_ssccfg_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	if (!riscv_ext_smcdeleg_validate(data, isa_bitmap) &&
+	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SMCDELEG))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static const unsigned int riscv_zk_bundled_exts[] = {
 	RISCV_ISA_EXT_ZBKB,
 	RISCV_ISA_EXT_ZBKC,
@@ -394,12 +415,15 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA_VALIDATE(smcdeleg, RISCV_ISA_EXT_SMCDELEG,
+				      riscv_ext_smcdeleg_validate),
 	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv_ext_ssccfg_validate),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),

-- 
2.43.0


