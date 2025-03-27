Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A82C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 22:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=; b=jOl4+7/OBufOqpd5IlfFFIZn4L
	PHr3eAV2IaXLKgeiH8jb/L0DIBGx7fXgsSpuLY70yl9I1LnjRkIhF+OYfR5ye6pjxkuROnOpphZNa
	OjzyctAPpnvZ8sJo7bshqz06KN07CZFwzYKhlIEC6s0ND1tZkjO7cno+WnbknDBvSf/5/8pIehw2r
	5ijHzbq/YRCpENgxJC46miiUoTIlXRlW1ODPzPO7QHpQHnM4RDRssPYLvQW886EfuBZGiVkDM5INi
	5jJNNUJ/oWff5Guxqd9Z/pb/bVLCUd23u8YFY7lye3sfUs8t7i/xOvtzx0y2MyVDCxSbFaHbif1LY
	qRD18t9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txvPE-0000000C7ZK-3xLh;
	Thu, 27 Mar 2025 22:08:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1i-0000000Bpg2-3KqZ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Mar 2025 19:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=; b=OKB98wzARiM/DuAAAccclCtw/D
	zlNOtIye3yUCbqpZ7y7FVir5iuFAVzd9dPXr4jPom2HvrJcJym+SHOVPYld1V5Zhy57i8Gm79IpXR
	uZSTp1nF0vHsbTM8m7rcWGY/BkZCMBLt1BVyQRXa/G+kUdXB/pECTSucYXzHn2rSybJZtp30FtgBQ
	CQPohQE1GH6kWMingezaT4UWyLKcoMXq0dvZTa7IqlTtRJJWBNUWWEd9G3b5DOeE880e5WWrxLz2t
	7yQHPYlfP34vDnEyk96vEiWs0OinFWBQTbaVg4x4+qiygt4beiWtUNrpy6AzC9MiV6N7UfqVNfLdD
	1JdiO/Fg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1c-000000061Z5-2sJV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-223fb0f619dso31071775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104180; x=1743708980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=WqaO09dzopwtBwzm74EUFgPm1VUqcyiBpaowUVFqZj7s8BKRy5NRjpsEwaqVs4uJ0z
         eHNFxfZFxS6zVM8e/1YMK3q1gGShosbDmYMkoD2Jf679PFfVgD+SL76PU/py0rsOhD2P
         OtJH3IwibQRcGGZpzedEmlJlyZQpdibekcF3i8C3mf82YJvd3UpTH0m5UFQKWfLaEiYR
         SZOFIYfolyE5FZ8a63iixz3yO7foSXEwPMU5DujISgFft4hb5G/QdvrgIZPj0dcsCRld
         VRFeoEIT89MclMHzlljnYzFJ4kxzEWdwj59jFMBq53E4Y32G+w0Q3+j9S4mZbSgUxzuB
         8rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104180; x=1743708980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=k+0xWGXVjKfxdSPnvkmuN9RHq8uBjVg/OlZNqjZAAQ+S21EwKCScr83RLAqpfsO7uv
         HbetbOJHEt3z99JOo2Av0UjMh+hmLNSOH6DuqTjI6R0yPTX9+jlOvRheKzx5Tjk5eRZq
         FJ0awq4EmFvFehbf3v+xfaOSHe2rAVCycHGPJSlcZ6FCHC81QgbhGvJICokLVjJo+deG
         SHHRcy7/3fiwd0RoENRBsypByvfd+C33+SnGGCCcQbWnqKvZEXposONu+7qz7+QwVg74
         SibpNRftsF+8Ur0Rs0stlGdeoGOdNTMx8yHyIs+znYehlyH92irtqHf+Akpg4cWI1ANS
         2Rjw==
X-Forwarded-Encrypted: i=1; AJvYcCXycoMnpb0I1aYJ80s2geM/xrcHK1/VIB+GIvW1kPm+c7/Xm6QNDI7lCb/eKNyF9/wG4n8D/ytJJU15zOO4VrBf@lists.infradead.org
X-Gm-Message-State: AOJu0YzSMSKVYQ9fXTBiLSnj35lZi2PYFU3vQpE7ALCGpPoC/cvgeKc8
	QG9ZPAZdWHcQrxzuFK3Bges1qEo1l+GglxB44H65jzrpqqMfdsliniYaFPJLq0w=
X-Gm-Gg: ASbGnctxtRDgKQ6I4MZp2lmXyErMp/40oLGSNm7QQe9CnEk65P2AfJ3pichUDgkBp7g
	NybbP+dxz8G6heivd8+SORRCAO4czLYbuV9fgNaQnJheB7mBOnwLw6GYJ6Id97Nh1tE60IBrATH
	mDhG8T7F30YjDb5bgyxaBsRiuLoXQmon60/SJZjyROITNEL/wv34r38H7wVIfQUQgBVf5X8iBB8
	YMZvR/FwyafY2DKmsG79tnweUozZoNFlzJYscqjP8s0XzewRvBxPXOpn7rINX0OXKb+983CXgj6
	H4phc7L92FE2rqIhV84FBamI8C9KaOiwVc8WgwDLfWQyeLvcRz7qBkNPLA==
X-Google-Smtp-Source: AGHT+IHpWwO+ALT63AnEQfROc0MsU9HJIU94/2wnOwykaqK6qJLji7kuLw7H0FVEp+QuB62Asb9xXA==
X-Received: by 2002:a17:90b:5827:b0:2fe:a336:fe65 with SMTP id 98e67ed59e1d1-303a7d64066mr7195102a91.10.1743104179797;
        Thu, 27 Mar 2025 12:36:19 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:19 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:46 -0700
Subject: [PATCH v5 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-5-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_193625_112582_A2C2795C 
X-CRM114-Status: GOOD (  12.46  )
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


