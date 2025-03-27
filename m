Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457D1C36011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwDPeMXJfPX+eaLbjuVCFPuV2SZpHciR7qaWH3I9ArU=; b=P68JSfjXHHZbhaEnPLCa3r8Uqa
	g/XJt47ZVR61kMNqb4jiL9PbFSeC9XKoOFcybqAL8W8rzcaSuv8m3qvGvjntPXorgmke9ivcRRajk
	CP/CKuOuHM72vEjbsxWPaBj4nEk+wMGXisecMy7ze3ggsGNwKjqQAjykys3uX9fFg7A49aOwPAEYy
	dyXGlmw6Z8NV60WvT9oo/TmHbQxCNcXe0MFU0/kzyNVAyLxxJB/616fgvayzBlGYkhQOzti0oDoLw
	l0WwgNhsBm1uAMGiXxcFvMsKz1kYr1i07krogjjN8a7qm9kctbi13AdAHx3mVjsp7rT7HExPRvziz
	s1mzIBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt8O-0000000BrSa-3JR1;
	Thu, 27 Mar 2025 19:43:24 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1V-0000000BpUO-0STX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:22 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-301e05b90caso2386764a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104176; x=1743708976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwDPeMXJfPX+eaLbjuVCFPuV2SZpHciR7qaWH3I9ArU=;
        b=dn46TYXrBpfqwTNS+5IX7rvf8x7GGj2YN92Gx5z3rCw0wqJBJgA4ErBThBv/xW9KZT
         G6lIktsbMEcPu/Uy+upErULbDLLSYn+9TFmxrJ8mpkry6U1w8H1Brc4w2KoN+Me0lxQ0
         prfeIDbVVOfRGQHx4vaHiiFCKQRtI28yMxAcKtnLV2nEzC32TFqoahO7F4vsAq1er6oZ
         Va6Kl6TCcM6HMWapQpsGzp0j0EzXQUn7FzcoJdhJk008tmwbHPLqsAJyGBJJT70iyF4v
         9Yr7wc0DQ52PC8CD5QEzIxtx9bYcMakx1fDbX2mguUpTBDMMrKwIqlU7J2594UHqrfOc
         640Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104176; x=1743708976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwDPeMXJfPX+eaLbjuVCFPuV2SZpHciR7qaWH3I9ArU=;
        b=j+GaiY+gxCzzePfONENALhNJyj9rusTcjIs9MNnz+h2/bu3/wh9Rw+VODZzoF/mn7U
         SWwW1o4ikWdBalBIQtxi5YvB7Zn1Y7jskIpSE9J5mW32iHVHTlWZJ5oz3hO5PH6I2Api
         KGE86eJCiNLJ4Qa+8ciIwmKOhU9Z2olXRPO6w4vO6wiHpUXGn5HxEn6O8qu8GxV3VtYG
         MATQzxv5PhYmTZ0L7OVE/a93v9GMHFvAbJWlhnzMl11+PwkkgAknCpAgjRZEFCXOWwc3
         A//HUFtAzkL1Vt05OgUMJdM7tBqIFUkyuqJ3zcGzaHyGNTwd5Jsoa4ddDjPIcvtVroEl
         qJkg==
X-Forwarded-Encrypted: i=1; AJvYcCUr8Bw+c++LfJ2QVxeeKi5Da+vJmruVO6BBtYf0w6G/1swniaU0MaZxRaCR+AUSjuKoI82owbKpTPOOGra6Ewmm@lists.infradead.org
X-Gm-Message-State: AOJu0YyK0FASqyZcixQ4MlPgLCiuQ7PVXweU1o4tlL8QrFb100yTq07F
	5Octer6N/DCaK9SumTv85irdF4ERO2US+7klT/TR2MxQiExzdquIVtZ3RpxhBKA=
X-Gm-Gg: ASbGncv477f5Vixqb1pY5krFr8HYIIAFprZqICk89mf1Zjnt1dXqFaVVk0hS9yfKmBn
	/DrTEEkb8dSC2T8PzgnycTjT9P3YtqtWjxqIxKmLAt+1tu8cE3A/yrILTU41hwiiBb5PH3iIGhA
	QJPp1PajwrqwUnMpWV1qkqJnfhXg9BSeMd5Mz4kCrFVraJnmhMSkuWiMtZ4ulM8fWHXboYad0By
	bcy/oCt7fVJcQwL9ebzJKfcwN8BbfG5/bTuFM1kbxbtibfJFJcslR+Bebr+Z6qqjF0Thgu3U4DX
	8nFjBENDwxJ0y3nV9399mCn7CmT0QQZ+sHrDiWEluPJMiVdTwT5WEiBAb24RpmLFLRFN
X-Google-Smtp-Source: AGHT+IGz75Wx8Bt7QWuszatV2VM9mkY8/YUQoqlctkJAiAm8Pl5r9TqAJ39Hb6cqblaB+y3PgjrXrw==
X-Received: by 2002:a17:90b:38c4:b0:2ee:9b2c:3253 with SMTP id 98e67ed59e1d1-303a9192f68mr5197278a91.30.1743104176455;
        Thu, 27 Mar 2025 12:36:16 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:16 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:44 -0700
Subject: [PATCH v5 03/21] RISC-V: Add Sxcsrind ISA extension definition and
 parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-3-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123617_189436_E3F505D7 
X-CRM114-Status: GOOD (  12.42  )
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

The S[m|s]csrind extension extends the indirect CSR access mechanism
defined in Smaia/Ssaia extensions.

This patch just enables the definition and parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 869da082252a..3d6e706fc5b2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -100,6 +100,8 @@
 #define RISCV_ISA_EXT_ZICCRSE		91
 #define RISCV_ISA_EXT_SVADE		92
 #define RISCV_ISA_EXT_SVADU		93
+#define RISCV_ISA_EXT_SSCSRIND		94
+#define RISCV_ISA_EXT_SMCSRIND		95
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -109,9 +111,12 @@
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 40ac72e407b6..eddbab038301 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -394,11 +394,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),

-- 
2.43.0


