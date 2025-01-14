Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F78C02188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=; b=ZVlFf0DrBHpZuAxbFPnFL3OH8V
	lY17QcyNsvM4XGQuQaa68VSVvL/s4i4Ll/l1a5nXtkUf7SwGRcC/cS64iyOOYSD7uKrkO+1iaAa47
	4/lDaqDh064Mb8j/Gs45yb65T5zY/9pr0C5RbWifhf2wxXUo/bYYTmA0mhWHLuANQX6hSJ36CE88T
	Pa3VST48F9FOZdtzooMAtyr+VGdMlnS9ohfpBqF5a2jAiHYk5yVKbuw/LYMCIYBbIDioH1epulv8g
	h+S6RRTS+GdSn+rumKft5GidMqwttTxSQRMITXeEKUNF1PIoRc+8L/lzG+/q33dia1DyA328HQE9Q
	bnDqhZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXr6A-0000000ABTV-34qV;
	Wed, 15 Jan 2025 00:17:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprq-00000009zzw-3zPK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 22:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=; b=HmORDVxOmfy3+IRD7uyRRlIIsu
	1Keqfj+eZ4xxytzj0MVKrTnqH0PDEfVmvZeG7O0V95D12wM7zH9sgNF/e8ivD6Qd7NbCToFAciGWI
	fxWiQ2pQnKy5XNnjLi/ov2iRlseeeLWNDecdKE96Nzv+VlXPF6bdU5vvmpauruvvRhz+lOMIIB2Yh
	KskkifShDoxFhhmYUZPXPFlTnzkrLPRG3KRC9SHIWAVWfzdhkQyL8MSFkE5g+JI6+RKJhVSfCFx6O
	dx1+9gO54Nv8ypvrewoaYjfmmqybaucRttVZB6LSxVhcQeUMOf9KkA3YwXDC/2xyWKgq3+TPzTTYU
	zBOQwC3g==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpri-0000000Afoh-22AS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21675fd60feso134178415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895506; x=1737500306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=jKgh3h73U3ueJBE13exDcdzjWZ06tuQQ9lFkbVtonpgn+qNqxG+YoYdg5LeoibpJ0x
         dpZhcbAtUxasBitF4sCJCPEzLaxJbC+6epS3ktbbIzCQK1u7pljMA5ceEPbOtQ2c6F8E
         BlPzhGu4ESzidXswryvWM7dm2XzM7KfL5J9EoyL+01Pvarpz18FPFepObgEwNgRsb7Ef
         HQOOmv9XHwZuUC3rcCuIAH0Kjq583Uq5OdV8M8lm31rWwbdIWAVZkAlac+8YGOZTpo7F
         MTpNvtxCu6UUXGn1pMZfzl8LWdIey+z0b0PukDP5zP9MhWPL+h127Vb8s3ehYX0Fl+Zn
         MFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895506; x=1737500306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=PSov9Zzm63nLmK+AU2H4Kn+/fCJCMGVGC2tAJWNEONOM7k73ISU368k05JBWLJz+NG
         VTsKzv0nVDF4aGmL4NJYUrkhULq9ajku9dyeb28+FMlEt3yyl8XY0S2hahFUyvhur0se
         pUDCIuCNfHrTD7Nh3cGwNxhZvIRLIlUtU/ckcwNPLe0+xInmJhsqGbkKHsjSn1t/uTky
         QrTFg7EEzQvvVwcngFr+m+Ftw6lkUwPSCVIUHcALC3gF1hbytk5d9f04QqK008qzVphi
         DuiFVKINZz8roMJ0+qYjTjS1cFKl1slwyGUOC7SITl8ZaaJS4FG0/CnRCDamWmWvq9aw
         1gUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTnLTJg35yEIxiymxsa2clkCgGZh1i9tbCPZ2LozVrg8X+8kHPEmLNeFBbEbyUX0o4+CmVIjSgXGnrdm9S0Pwg@lists.infradead.org
X-Gm-Message-State: AOJu0YxQG8HNz1KdAaq32nsEgsU3TE8afUCyQQ+Qp5JD6rwAiER/Lcmy
	mC8yM/GXUFh6Gqn2x71R6CTOTKXRIw0qjS8rlqDWiqCguCO0jcn1DlboRGfIExk=
X-Gm-Gg: ASbGnctUxz16jN2VJrKbAO6MFkLYyz1c+4xoxDbWrVtDmwCkpRNPcEyMpQA5PNipAbx
	gx1afZPZhlF2OH4jJqcAb7WpHJdbc5N20Y11rGChHf4h0qip1US7rj6Pbuzm/R3TI0eNgnX8dE6
	5qDuuk3Mrvw0g+dlrWZLCxO6ef8LwFjwGixg3aQZ3uVDfyyOSRo6OGdjEpjtQ60TRzl+ERIzWI5
	hPGFRDXRsBG6tqqnddm7bvK3q2/HCtyDC3l4GkAGsujc02YfBWQBIdpAMFPD5h6OZwbEA==
X-Google-Smtp-Source: AGHT+IGcOgG1DqtPgRuq87OenfYeI7iqhHkrnix8fM+hMVbZ5ICFTggWxOV4+kwRFEcps2WSmP9bRg==
X-Received: by 2002:a17:902:f685:b0:216:7761:cc36 with SMTP id d9443c01a7336-21a83fe4b6fmr435625665ad.43.1736895506247;
        Tue, 14 Jan 2025 14:58:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:25 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:30 -0800
Subject: [PATCH v2 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-counter_delegation-v2-5-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_225831_223067_1750C30E 
X-CRM114-Status: GOOD (  12.91  )
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

The indriect CSR requires multiple instructions to read/write CSR.
Add a few helper functions for ease of usage.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr_ind.h | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
new file mode 100644
index 000000000000..d36e1e06ed2b
--- /dev/null
+++ b/arch/riscv/include/asm/csr_ind.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Rivos Inc.
+ */
+
+#ifndef _ASM_RISCV_CSR_IND_H
+#define _ASM_RISCV_CSR_IND_H
+
+#include <asm/csr.h>
+
+#define csr_ind_read(iregcsr, iselbase, iseloff) ({	\
+	unsigned long value = 0;			\
+	unsigned long flags;				\
+	local_irq_save(flags);				\
+	csr_write(CSR_ISELECT, iselbase + iseloff);	\
+	value = csr_read(iregcsr);			\
+	local_irq_restore(flags);			\
+	value;						\
+})
+
+#define csr_ind_write(iregcsr, iselbase, iseloff, value) ({	\
+	unsigned long flags;					\
+	local_irq_save(flags);					\
+	csr_write(CSR_ISELECT, iselbase + iseloff);		\
+	csr_write(iregcsr, value);				\
+	local_irq_restore(flags);				\
+})
+
+#define csr_ind_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
+	unsigned long old_val = 0, value = 0;			\
+	unsigned long flags;					\
+	local_irq_save(flags);					\
+	csr_write(CSR_ISELECT, iselbase + iseloff);		\
+	old_val = csr_read(iregcsr);				\
+	csr_write(iregcsr, warl_val);				\
+	value = csr_read(iregcsr);				\
+	csr_write(iregcsr, old_val);				\
+	local_irq_restore(flags);				\
+	value;							\
+})
+
+#endif

-- 
2.34.1


