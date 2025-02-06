Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D31C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=; b=lD2+jMDqQWV0+CXE86wSYiCSbA
	YeyifskMyG1d68fqczJnEKpjW6e8UXkKnzWuowgefA7eQ5ThKFATF3lV4yP4Yz9EmdSoN66CW+29T
	EqSGcxUrgVjrerezXAI+kh32EvFEdS5nZFG6hPokuU49vE3+dQEesLvDUw4jQiQRgThWkZ+JFlnQB
	oWN6WL+xwbNQwSnVrCRFufcIigB6DctTyKl9hoeeCFz1S5yj/0lQzV78gYRnVapSgkK6KgtnERCye
	HEKkWOpI8hzTuw/+GZBaTQDYlDpCEC5CP765lhqh4pq1Oei2grD8AwKjqU4uSp/kn1p6MAneUJ9Af
	W6fSeDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwL3-00000005aSn-4912;
	Thu, 06 Feb 2025 07:30:17 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEO-00000005Xyw-0trZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fa0f222530so331511a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826604; x=1739431404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=vZmutt9f54VoYaUnb3MkhrTtoGHbCz/DmqO3QhMJc9yhhPkhuLJZr2Vy/QheIzuKOS
         cEajGZdghij8YpDVj0Jmp0uZb6otZ3pSLUHg+sE3/Fx9s72eGdmDHO8iNLTbfBsmxbtA
         I+HCnDlqvKvfhV7y7c+HjxKBWksaiyEOeQ8Fu8noPUYL++yjhWjGecgWJGBM4dFOpuFg
         9AG/W9NVo5Dlh96IS6I2b5jnXmzK6L+kVpesXYShphg1K+upLAq6idWEjSLDxcFRTqdM
         LBR9UdiozZGX6iOIcFaQpQSI8XgYNVRnYSaoIrQHVRh865PEO3rNEdHdW/UwQi+3zGzq
         20/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826604; x=1739431404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=MzYEN15dJYjvIpeAdWajYpMZrZsC54gmYzSV/puVQWSbYAEXXfSFhZzzPBv08rwPRj
         8A/JDF3wkltZcSdVpTSf8XiFha8RaEPnI7kwgFkfyEUqCpQ+3q8MmOsJMtJnXK9KNJ/C
         38lIp9liLUaUFn2TacTfehL2ej/VA/+Bt2U898oOKTrB2873kq6Q+KWb17pjbXRei4ld
         xTOXyfk+xaK8rY0/R3c/yw65ZtGCHRhwGYCquMpW7n12jFDTGd0D0ajeJLwKGMAYxw0Y
         UZaifiAnRT/8HezO2QAh3oMEOq9OJtBcjOsx83iT05dTuh7lpM9RFW1HiLdK+902E+zZ
         DZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR2CcrQcrl1gfcAtKU3cHDpQSM1WuEZzuqfdKFjPO83cDEBRrO0xUYR24jjvSo1ixNV/iYxP/1jjFBmBb59T3h@lists.infradead.org
X-Gm-Message-State: AOJu0Ywac784kxudED5IHFQuCTTWKH1KDBAs8WpEr4GpiJqU9NMvoaU0
	5ooPnsOz6THkIz7y+Lfllhykjx1TsBpkWIXwP5a/8YSsHWO9wkIfdZAUZZ9bGiU=
X-Gm-Gg: ASbGncuhIvQGpv8/cCrM4znheKbbFnvTvggwznzmOvNpL4Hk/ZNi3e45otT20yvJDAl
	DW1XTi3Eo+aYyoCxvfv06Svx27de1G/MUT1GjCNst2FA/OkcagFyz4bt4FnaMVuMT2M8FMAgcpi
	smSBTByO57Pbu2gUvzj78NJqm7wklhFsXaOuUH28WAZTSLX1MBGLlGZ4oh4gGY519mdI4gaO1LV
	7WtFOtFDCGA0YS/rY8HYbn2GQQCmGcO+VuSHz1jTYYP+XHMtG25kqmH5IpicxYEoVC/veekvPZS
	EH2hG3nrePlp+tJqAneuRE2qqecK
X-Google-Smtp-Source: AGHT+IG32go+lZuwjCgg/zbLptZ9A9o5+Wocjk0VyZkgS2Pr3FK1vOOJ1tss0czCWnqvvWKX+hfRsQ==
X-Received: by 2002:a17:90b:4c4b:b0:2ee:aed6:9ec2 with SMTP id 98e67ed59e1d1-2f9e075fa50mr10140486a91.14.1738826603728;
        Wed, 05 Feb 2025 23:23:23 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:23 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:10 -0800
Subject: [PATCH v4 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-5-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232324_327410_F7583E11 
X-CRM114-Status: GOOD (  12.74  )
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
2.43.0


