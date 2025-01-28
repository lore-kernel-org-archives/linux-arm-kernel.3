Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C821AC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 05:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=; b=LqeIZCPrQZ0UlAwkp9Xq0Tekah
	MFuBSCVAgIJHady2BPKG3pZ4Kc/WIKlomWsQ0TEjlWjYNBaGZJNimygUDlyNCm2/U99KxyfDw6H06
	Bibw48Ss20PC4dtAjIOl6kRDRtRvuuRuL0BFeOwipBI2Fkl3OKRLk3JHTrNGDdpg3VlJr1UEEmFct
	TvPj/N09L4X+5ONj88Xci3ATDdLVYHjAkF0FnVCsj/a5b6w6qzf8gW9Uf4CEEK89X8WqGt7LbyZuI
	pXIVonpeNNFOsph9f1pVd9y9QmSVDFJFD/e5bBECmIer+SfxEfkxp4pDVqbiT3uzf7M6VP1NfeT4G
	dB/9bwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdpO-000000046yo-434F;
	Tue, 28 Jan 2025 05:07:58 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhe-000000044P7-1PB9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:00 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f44353649aso6915575a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 20:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040397; x=1738645197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=MIPwWr7c3LsYDiZlez8A2xfJMqgzrW7ReQAHMoKb/4mB/yv42KC+N6kpruKDGtUMBc
         qluNllWDBHnEEcgz1eWlMq4GFamJXbJwUQqS17sCBT3TOaRq7V8zyalQJK0gEnnZhokO
         2oPG5YKw6S7vVDJVENWr/ug/yqJTJSDeJ605xuXJLO5872C7w8qd9O8XFJSxhDZiVS/s
         Y9eICp+Ab/qRgERAHufx35TzJmS9XmhPqJb51jROzL8VLo9yTnA/o8akdPxJOdvDZZxs
         WG0WLKOH8Ekqc+dh13MR0zGFzIdYlEMjs379Fc2LTp2jX5qSd2UlK5rlV8gJl0mT+xo+
         n5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040397; x=1738645197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=D+GCIvXwm3pWMJPuQH8ZpOVqZZGwG9xnxyT2x94SyB2cZ0is/mK4S4CaweKLjbOjsW
         SxVUOaSPoeZF7kal4HhSF6wtM666fEhOj8f9dxwRM/9dfd9EYRgGpdtQt73PljPi2ILp
         bVrBjJIrc/5sHfIllh1UJ5xx6JsGg81lWDr2s2K8nhCEQbgHr2+45nhDETq2SLRj+Acj
         AUez6RM154WqqmF3ifDf5oZEuhrtXLi9EWMYuJsv4LPCtZDqlYOe+9vXTcfrjJwgq7+/
         slIuCvqabWXYemqVtGGBHfSD7g2U6pUcV6YvqMreID3mMKoqfbUXin7dq7kG8uT+eLID
         5Mng==
X-Forwarded-Encrypted: i=1; AJvYcCUgEVJZzadBlG17LQc3qBmkbSaZhg329CV5YGqkSw+LbOtv09kICgINWV2PAYJ3BwiRAU6yqxWtFqibwZqBimBm@lists.infradead.org
X-Gm-Message-State: AOJu0YyYHcCb0czOV0+D6oCDTkz8xGnpKLzwspvKQWs0OIB9o7eUrNCD
	mhAqOpuRgK7VRMQ2Z8KWZzL+f2U2iVK1P6czWRbSGAFVj0QzASOY10gU09Qoq1g=
X-Gm-Gg: ASbGncss8I3Qnm1nS/ZZUwRIIc9rA5L9ESMXg0XIQA32jZ4N/rvQNd6v1ctPsjXIe4x
	H4zWc23br2J2CC1+q7mIBh6Z/6WARCPLEj08lV4/Lr9A0+hKK8dQXaEvIci8YWRKIlFbUvlrrdD
	1v4uzGwgNjZoPm6PAB8FSzst33tp8dkRT7cPEuFufSz8csuAn0MUvz+wGLhiGb+lw6hUFZ2aOGr
	bNWcwLi7be3zcNcSUdVKs+dRS/vd/hkhukLk31jel5DMJb4O7twMYOTUkuhQMDHpOUj8pggvKGw
	tliqGGN+KSTD69VKKczuLUoKhvok
X-Google-Smtp-Source: AGHT+IEydkqGnMas9EixfltXBAZwEmzDNcAGB6aZaVaiRCrDSr5UAXUAKLQCmfBM6LnRIdbwcEstgw==
X-Received: by 2002:a17:90a:da8e:b0:2ea:5e0c:2847 with SMTP id 98e67ed59e1d1-2f782d37703mr53064728a91.22.1738040397475;
        Mon, 27 Jan 2025 20:59:57 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 20:59:57 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:46 -0800
Subject: [PATCH v3 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-5-64894d7e16d5@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_205958_368370_78F3B1F0 
X-CRM114-Status: GOOD (  13.05  )
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


