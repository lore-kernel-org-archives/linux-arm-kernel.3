Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D138C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mrMIkTEe6NxNBfmJmR1XKICEvWgZ9tUVZlETsQZaOc=; b=L7yAsWscnyiaaF/xmf1N4Xq83o
	TFMLEB/q84JmaOr6WPKjBqbxdUtAsvZtIjtwrr6JZkV2uCKbYOo+iNlMH+sZFqmxOyKY5aziksbPr
	7KhUSc92Hmhhn6sQiaSLQkt/Ol+WZkF+XMu5cNGlqnnlcBc7qqQPt+lMBOd2sZRUiFcMM1ps7ArxU
	v1qzCIkft/N4qejeNDIt7y6sOrg9vVFMR87QyZPCf2uv9Jly5QlLWc7ug8dgh+U3rfi9PkmaTiTtD
	JIoJQrJUZwcrykWnTzvgLTOE0DCwFhLIHTphrg4HcqHW7O9lS5pET/PaF8eBLCOKsbymzNaeMq2OA
	5HjyfPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq0B-0000000A2rP-2FT2;
	Tue, 14 Jan 2025 23:07:15 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpri-00000009zs7-1Zcw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21644aca3a0so133714215ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895510; x=1737500310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mrMIkTEe6NxNBfmJmR1XKICEvWgZ9tUVZlETsQZaOc=;
        b=UHBW/4ouU2GIhAFqiYMl8UaVRS4Qg5q1P0or7ey9Ju/wBzS8yoI+JA1MSq4FEX8969
         BEFgp7qjU5SzTEI1BFLHXKxzsBeHdBNWfcyUhw4YwK3oPwciKuJwuEv5wjf7keUiTRd5
         2sK3n2U52WeJ+wcZ/i80ZLSERx81wMmARDgpDSd+qIu8GTxrWy65qTpEv1XFgdqLh3VN
         iws84/qXFBYr3QW1jf60fncQmxkAxwr8M4Dd61XGmvtWZHmESqu+u8mx4f/743/KHD5z
         PDpqyTfNvZQgsl9QoDpvm4oMLoJOlIa50xnxlm7Wo1z43JzLsi+hQCu/SzMiZTc6E75X
         nwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895510; x=1737500310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mrMIkTEe6NxNBfmJmR1XKICEvWgZ9tUVZlETsQZaOc=;
        b=ahajcuircXWnMGzXI1W4eM/kscBqg0RMcbsULN/td5OeVtyXsIhDqikWzsXhqJiyIR
         Az+j6p9YDqAHoL7cIQtjQ888ih5EVPJ7R3cjGoJiHWpzjSho9lZdAbKXF6zW9fK9AYfB
         OsgpjKECzs16/q7kpLYKHzVoZuGWJu5CoBWO51knY9WVtSJq+VYzs8gJGUD4citqocHa
         tx4j+oRRqDFQMgXWsJ+rLHBsxqLsd4mfN/fMiILDVODuurYiPViE+hcIDbEO6ObEz/x+
         8IJ5qDsUP5eVzEUQ+8ZexxSbvgL6UacSyvVcFL2nhinxuzgJehfxG7Zozktcotr5B4CS
         IyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw+Iww05yEynGiNebosSiW9Rlygja521ANEzwUPI+DA/ySLNy/J7RZFguKdutsFcutk5gpqqkTg8bTABdg3y6V@lists.infradead.org
X-Gm-Message-State: AOJu0YyPrsO7T7X/L5jID2LVXl1WXXZu0YUOzfLyrYSMceozKAyUWtM1
	6SAFXLF0zjtQN7ArLapQz/vanUOZQwkDpGtW9Z5Zu9oI24EFaPU2FnIJTXJZJ0M=
X-Gm-Gg: ASbGncvdNlr1jUBUae393yJoZSNGYrQEtQ4VV5Ravfs+ochRM4ygOwGl4IF5dcidSqq
	2S3NeHbBH3yNG4HyiMLCUeoL8+nfGij/Upv5W2pNQBnSakGAI+RApNDVu8LZgPGXhhAE8WgJEji
	Xf/s9fDql+OfvSLZ0lQZLOph2Ca/+Pf11d1EeBa/7dnTL1EwrWDvWxhouaqHqdvjJrBerHoPRRw
	guw2QDXVsI+kF9Fb7wUPUGabKdwVtrwHAup3GdMmubgpMAhYpNhKEqw8UQajpYmXxFg5g==
X-Google-Smtp-Source: AGHT+IHxXDdAHPYokpxm47ueo2TdVOG0GfdEc0qqp9YuFJCqGs1f9K+cpyt7QXfGQGsnfIi5G6wVOw==
X-Received: by 2002:a17:902:e544:b0:216:50c6:6b47 with SMTP id d9443c01a7336-21a8400038bmr426908115ad.46.1736895509814;
        Tue, 14 Jan 2025 14:58:29 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:32 -0800
Subject: [PATCH v2 07/21] RISC-V: Add Ssccfg ISA extension definition and
 parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250114-counter_delegation-v2-7-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_145830_426113_B2087C8B 
X-CRM114-Status: GOOD (  11.37  )
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

Ssccfg (‘Ss’ for Privileged architecture and Supervisor-level
extension, ‘ccfg’ for Counter Configuration) provides access to
delegated counters and new supervisor-level state.

This patch just enables the definitions and enable parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 3d6e706fc5b2..2f5ef1dee7ac 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -102,6 +102,8 @@
 #define RISCV_ISA_EXT_SVADU		93
 #define RISCV_ISA_EXT_SSCSRIND		94
 #define RISCV_ISA_EXT_SMCSRIND		95
+#define RISCV_ISA_EXT_SSCCFG            96
+#define RISCV_ISA_EXT_SMCDELEG          97
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d3259b640115..b584aa2d5bc3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -390,12 +390,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
+	__RISCV_ISA_EXT_DATA(ssccfg, RISCV_ISA_EXT_SSCCFG),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),

-- 
2.34.1


