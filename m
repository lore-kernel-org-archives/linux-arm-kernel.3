Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC739C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 00:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=; b=1Ws2J4jSRNcmFKVPoSn0AneAcg
	apSXP3D31k4kFosIwPnUoUQvXvzIBIuS9cTNY/CfHNaKnwvxfh0kBLHopcDAalzUMYOtnOQFACEG/
	jn7CcfebsFCTscvUwn87WElZRa5oPvxQbL9eGeLO9VntsZQa60bqupj7TrBH7/IKeJNwKICT5ewb+
	Pc3OhBLs/taCsx352TY7xJPBoSGMvxy+e6Fw0qn59g82/U8Ok23DbGhybHm/fyrxa2pFy5VdWtNqe
	ldm3KPceEz+1DR92KS3yZmBJZMCpVCARTQZ3NuwMZqJu/bAOiAemXys6ZwXKP6xrL7NpZ7UzxCccG
	ogcufsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXr69-0000000ABSr-2hr0;
	Wed, 15 Jan 2025 00:17:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprb-00000009zlh-03A2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-215770613dbso73958775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895502; x=1737500302; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=;
        b=TFp0Zn9PvbZ8anZKpaqnVEj6P/CL/N+u8ZvfxVAGUh/mb++rHfAYcFwfaL3iMO7oGq
         J29VcOkQZfeHkAdvLOixfN7U/J87VHDg6g0xxIiTzsOKFo5CcGLfZAXny9+7wtJDms6c
         QnJbNv28VawQwOLgLMjW1gHOGp4IEtYlHAC0IkU290C1v6CnDd8QTlUi5t04oqm9v9G+
         +voEQQ/Jb5JcQdku7Wg8DPFX+ohlAzHwPyXjqfZ6iurVk8BF6H4zC0QPYBYC1L0HHvim
         rudxNk8HW4uaE0SLzcoiWMgrCAg9fj7V139kkM5Y9iHAuPWeMz0Z+mFfdLQ2YCdPW+jg
         ms1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895502; x=1737500302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=;
        b=v7xVkk+oMk/Zrha0rYck0CwNcqYYh3gA13z8lee6D4SCMuO39eIWeE845+VLrm9Qjn
         hHrEY3e5FwE4nFpFmex1CBLsjwSrANbDO+icXdGlyP0ttbfaw970xyglRrrPBaJuEe9+
         QxKjFpFx+keNeQfePbS1YKbdWgIiiOb87rWzzmQj4BHeJcwKc7xJSrDQuw5DhfB/+agl
         oawwj5K1EjGNa9AnUzxbT84hRxa9M6tUyPHd3BBMj2dm/T+TBTPSyEGUZXZs2OHhnU+s
         riOc68fwCCMr8Un8k4MurlWWxphmqZ0KyFwFaLIzK5MDDspE0EIooT5obSUqxZp7eZrt
         wGMg==
X-Forwarded-Encrypted: i=1; AJvYcCUH2T9gB9NyyP6cJZ5ljA+SGeXOkOOxggFgZiTaEM6UDt+33P8PP9PQ8KV435Z6ktk5H6WKEy26gGzdZLk6eU7T@lists.infradead.org
X-Gm-Message-State: AOJu0Yw49aakXUOpW6ZJ0BgR3zjLyNx4Be46mVvVhV0PyhPfibskoArP
	UYa+8bHh682idsXGsyyvP84kAMwVdfzFMoYIxYJ9IiP21GinZUGM0Ti9KHwh76U=
X-Gm-Gg: ASbGncstAMQbyzPzCVoYIZf463NLEZ2rZ2hH6CyvxjJQpdwssxzR9SXCIdmrqlOb0n8
	S2tvdAj5rw+14Rhb5MYmWgJR8Pmc0vfYPV2s5Fv0pon3w6DtI+/Jfug/bmsY90ac1bKg1qY01Kh
	bHV006HQQSBF3pt50gq4bOubkFMBjCAGCim6PmPvERl3xR/TbER/4SXpDexeyOXr8qPUcR48gHC
	9FwYhmy8ueKD17/n1LQAI8S0o1NqAR/kyEHltAkOnelNnU6wVyG8Kh1z4nORmcoJ36ccA==
X-Google-Smtp-Source: AGHT+IH1ltU/mRUuewPYEws/WbJoOFmxt2kzpsU09c76uR3HaGq/wIEXCgpsEq3E5r1Kj+FsLU8f4Q==
X-Received: by 2002:a17:902:dad1:b0:21a:8716:fa97 with SMTP id d9443c01a7336-21a87264051mr357793715ad.13.1736895502516;
        Tue, 14 Jan 2025 14:58:22 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:22 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:28 -0800
Subject: [PATCH v2 03/21] RISC-V: Add Sxcsrind ISA extension definition and
 parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-counter_delegation-v2-3-8ba74cdb851b@rivosinc.com>
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
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145823_083949_1FCB9740 
X-CRM114-Status: GOOD (  12.45  )
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
index c0916ed318c2..d3259b640115 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -393,7 +393,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
+	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),

-- 
2.34.1


