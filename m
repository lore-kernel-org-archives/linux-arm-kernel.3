Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B54BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jEaYEVzjt3yKFEUjA3mSdxHjzs+ekk92pc880MhBaw=; b=YBW+qyKf8R6T7XMUkx2fu9xKZp
	j/2GaukhSFuhETJX5YrVtN+8Cf5dwuSbXIYJZn+qPTlfDJbMD4VRgZm4lmC1cX9Q+lVgdyQl4R2lw
	/MrXtsPYG+jZ8xHAo8KLUOIcASeihcqBP74inXojBCzk6wZeCNHA8qiaJCSPwbufZE8R9UGTfb9vN
	UEk9gIAzgrks2iWpi/M94AZBmM6SPqfPo0wN6mA4xXWYpHsLZaCzKbkMvTdAAigGbvqDoyl/XkkSl
	nj8oqkVgxfwbIKIBFbwWtlgSrYXzmdQEpCnp8uSzve0eHXwKMnYn9+bwZwr/6g2Aag+xQJkYCRozy
	KTLPFpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwMP-00000005b2C-2mH7;
	Thu, 06 Feb 2025 07:31:41 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEQ-00000005Y0T-0bDO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f3c119fe6so3452755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826605; x=1739431405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jEaYEVzjt3yKFEUjA3mSdxHjzs+ekk92pc880MhBaw=;
        b=aYwR7zKrgKnDm91al2EfnhvrOlsOJFd7Pr+usjUIFS7D4sz8js2aiCTyp2mkkQcfJF
         Kb30e58qc/9/u66Ni9fmXVDTJQs2fmtTO91rvJ5WxwavrmMK5Qe/Xhr7pGObblYkHQWU
         y8sHwJtMMyCDz4iqwMifwQ38bgx42JUOSmfQic/QtVHh41vu7jcpFd4xYDL/sTJ/gkXl
         kTWUA5Gh5q4y3NcPIPsrXm3LHCZK199QFVeCgA+/OEyFFEeb4PwHLF2yiloQmrqYfPCe
         fg1qn2kivbhY+oB9+xeTMtT9JKK4llItZ3VSUOEPXFFbdW/qbZGebDrOA8nHsZ6n9SWX
         tAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826605; x=1739431405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jEaYEVzjt3yKFEUjA3mSdxHjzs+ekk92pc880MhBaw=;
        b=CVHvGXSTinGOcB68mFXRS1YkgTGWAlGuad61mtMHpRz9UVXqDueQ7jf02F+VQ21ve5
         Mfk+3fSVjUgiIcMgh+5kC2U9pQOG2Ib18vs1hC9oajnQdSH2zaSJ6BOgYS2F5a76fxHq
         5sXAIY8suZ9wDnSsOAwAs31Y7GKpzl8nlmLc3ZIBPj0R02+BjjwwyM9Pn/sBkolehOxT
         PaE1LaukPbEqgxmsZwYX4c8HDl9trcMP6cEDdWecNaxCHkZ3gEgKWN8JWItcW47zTxdX
         oiDd6Nedvq18ZBT/ziHbd5eTdoZUWZCYAL+zNMxB6Ri4Dg5m6B6DefWO6ZVUwg+OIx/B
         JlGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnI4pCy5bmBqj+LJVeag91rR9SiqRcUDRjZsRSk5G/1o2G4DrUIxlIjGWc++73gtvbTB7HsfBSqTANtjv6/Wfa@lists.infradead.org
X-Gm-Message-State: AOJu0YxqP3l1GgbYeMkRJ0jjAvDLVAJni/RHOaRJ2pRqdfW+R1KIpTaZ
	EnQXvk7CPWkdovTZ7AzPLU3+R4Y84Y+h75cqqu7mzHb3FziLwqGzvwBKUL4DG7E=
X-Gm-Gg: ASbGncvAALDtiZ6MJN4lzWX/Der0VLYRb75yrjxass9lKqU34feRfcVwIqvlFckKKkL
	CVrKkds1xCmodMr+v4AhicsgT6gavVPMsjaVp5n0fpu2m4L7KK0N0N2s0GlC8EXxfSbAEQwbjEd
	fqRi1o4Aq3LuBCS9ap2wcHIoe6VGA2RHw+4i7qqfmHdSAbG46p3tXT4RumkxHcVuNukpsQH3y0D
	jvbKXNBZ3tvexaQ+2qg9YufYJf57AaFk3d0a0Uvrg6L6ATR6WQZTwh3bAnHcIwileB9w010Zrex
	C59Xdd5d/GAN3G448wAki0S3KWl5
X-Google-Smtp-Source: AGHT+IHzp0J+mwXj/o4qdyn5Yi/oH9R23yiqLBnusAGlaJls5faLTlCjx6NHAGuTvmvHDO4dBQO+Rg==
X-Received: by 2002:a17:903:2f92:b0:215:b190:de6 with SMTP id d9443c01a7336-21f17e2c950mr98353905ad.3.1738826605265;
        Wed, 05 Feb 2025 23:23:25 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:25 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:11 -0800
Subject: [PATCH v4 06/21] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-6-835cfa88e3b1@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232326_230106_31445283 
X-CRM114-Status: GOOD (  12.87  )
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

Smcntrpmf extension allows M-mode to enable privilege mode filtering
for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
only available only in Ssccfg only Smcntrpmf is present.

That's why, kernel needs to detect presence of Smcntrpmf extension and
enable privilege mode filtering for cycle/instret counters.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 3d6e706fc5b2..b4eddcb57842 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -102,6 +102,7 @@
 #define RISCV_ISA_EXT_SVADU		93
 #define RISCV_ISA_EXT_SSCSRIND		94
 #define RISCV_ISA_EXT_SMCSRIND		95
+#define RISCV_ISA_EXT_SMCNTRPMF         96
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c6da81aa48aa..8f225c9c3055 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -390,6 +390,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),

-- 
2.43.0


