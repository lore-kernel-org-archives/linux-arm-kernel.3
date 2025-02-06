Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63405C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJ5m0Zv/n9Oaz8jMiZ4dpuMO84fRe+qZfct3W6wk+oc=; b=LeeUjdn7Wh80PSgUuz3F+hlbQi
	oWBuBcH7krQ3+6HonGR1uH0rl+y6GiMDjVONOOXF9U2copwbMCX4h+DC09qkhcgx0iuGQ8PJ4fDUb
	pZkAW6LxG4lGCC0tef3PvjqqaymtRSk2H99bHrO8uihKHkEcn5yRibCYQtWSpz2y9JrXRU7TtMiZF
	DMs4QIyIRp9remRONLdmbKuuxE7WICzI/ReM0QXTVJmBMddsmdlGRYn7sxouRO6U5sm50tK4anNcx
	m1TX3owY3KM9PoUkc93uA8hRvh22pN8SagxpR1pAZjvUJ02R3mAZ/CdxfaE6RB7vent13bC1lhWye
	cLS0kHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwJj-00000005a38-0AWt;
	Thu, 06 Feb 2025 07:28:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEL-00000005XwK-1TQv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:26 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f9cd8ecbceso1072081a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826600; x=1739431400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJ5m0Zv/n9Oaz8jMiZ4dpuMO84fRe+qZfct3W6wk+oc=;
        b=XOuom2o7CejXTmtIgXTdp5A3J5IxCuaXql6z/EdhjPpp7ip1QRGSA5hn17UJRppWy0
         +VnR+85RIpsvSsJxMaHJWmluwxX9eIMoORwOmpu9+dY2aZPWIZObsujRefELkwr3gxml
         yKuyGHcC7Sr4eRZ1jiw9N+mFKFOV+FiIwPM+jzOtGQTcjN6OC/Izfy1IoIzmRDn/8VF9
         VhDS2NWThtgK2rWgvxaabnoPJaasYCOFlL+rRa/E4SHhyBy1uqF2beZGemGGz7nIaxgJ
         W7kPmDYesnjl9GMzdVGS2RUBHmhGabZYVBbP7aaE5638KA/mllvbqe2F4k9LLeoJ5TE6
         b1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826600; x=1739431400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ5m0Zv/n9Oaz8jMiZ4dpuMO84fRe+qZfct3W6wk+oc=;
        b=hcJsnD51wn2ov9TA0iM3vkocsT+gM6taxM1opwHuEjbnyUNAXSpXQRP6Tqyr7ekbHT
         hl5CO/HjodrlX6sCXt+fgPNoW8xTPvwKsuEx0ZVk6cdhjtk+O6kSa1SLBVTjlUvr4f0k
         BqPV7AopjyNXY017UkPo9aFenLHE0UGUaQnmcYnEoTjumfsh15tTl6FDdZ5s5lfYq9wU
         LPMW1qHbITC4i5XSrbN0vBb39Ka4evEuOhwb2y5A5nWFyJCoXlYvPY3DXpIGLvvHcV8B
         c7Ta86EnDCKfofI7RM23a5ABwXzNa/CfD0BE0hzEj7RT+8xU1uZwxzNDaAC6X1w0MIH8
         zihA==
X-Forwarded-Encrypted: i=1; AJvYcCWHzuVuWwDnvodtMB0hxZ3PJb32knEmWpJEiOufXDYImT/+7E6LA6oLjnaZNxBBXvyV43CRg74AyXrwLAtyjh1L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5FtNzXtxnTm9aebR/ye2RlYgS81nx6JVzh3SNYGVMHMXSVn92
	8AafuZkF43wor2jis3XBwDvpXiK1liwlPtv1CmyxgjQZzZBP/YYALjTpXweGOXY=
X-Gm-Gg: ASbGncvp61eKbgwOJMT4H2mON8ESdSbov5ECwzamf4Oa18h3KaQIwUtE9L+ID1fNXgf
	DaNuz9JwGjdUS+32CzXekXjcnpcjnlc/Kvdc5cXIMKNiMWJNHvrgTWgLsq8CX9iCM251l503YUq
	ZgSrnhCf3MhiAKUDt0YKBdHrg4NOSV4BEgITnppy+GwvIV2mfyNRhccCTdgfkvcsnL4XuhKchfq
	PCZfCb6m52loDB76JDuXQ7xZRG3MV2ZOTrecj6T2gqeB1/QdSoSZTdGr7cVx0wpe4ZQLazted1z
	/VsA+bYpGhNaZFQJDfaG0TxocWud
X-Google-Smtp-Source: AGHT+IF7N62GzT6UR79bVSug46033WXYgVAcquwI6oHxNyG08rwtx9LdnCcav0B0Haf/hbAqjbl9EQ==
X-Received: by 2002:a17:90a:12c3:b0:2fa:ba3:5451 with SMTP id 98e67ed59e1d1-2fa0ba37cd6mr1441805a91.35.1738826600432;
        Wed, 05 Feb 2025 23:23:20 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:20 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:08 -0800
Subject: [PATCH v4 03/21] RISC-V: Add Sxcsrind ISA extension definition and
 parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-3-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232321_467786_2C8D55EB 
X-CRM114-Status: GOOD (  12.64  )
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
index c0916ed318c2..c6da81aa48aa 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -390,11 +390,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
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


