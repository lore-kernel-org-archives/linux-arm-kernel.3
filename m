Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A474C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9R0sEcrEcJj1+N/TVKuoWiSfW8zF14v2/MRWt/PM07E=; b=g05tT2lGArsKxPa1DaBGxCg//v
	bF3eV9Gk6Xg83XAKuDwzlSOrhEe1eN1gXVQNWoaTLRuDcSqJhcdl9jW5PXzUI5Y1Qudot2mAhqZVy
	//uZ2L7gveaDfEOXAwv0b+X5uZnVcOdEMkfJ3Khw2MHQ1tZLPUbL3cxm3rX03iIWrZ40NfnD2yVrv
	MthBJ41IJg+FKcKBAGeeF0uMExmowCuc6LfE+2iZ1S3CDHmeoSmhSJnR55i9PpeYNmkdM0ddaIURA
	jQiBHPNvjXUoVIoPgUbvOaLP11GAk30f5kB7MmG7SHOFKUzd6qmvkFq9zWldy4+tSRdlqN2poykfR
	xDl+kmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqbd-000000014AP-3clC;
	Wed, 01 Jul 2026 08:47:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqbd-0000000148k-1mAm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 08:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9R0sEcrEcJj1+N/TVKuoWiSfW8zF14v2/MRWt/PM07E=; b=j/OCdC8ckKnXka0N7B9PsGT/7u
	/eIO5WzlO47He9m9uoZkoktTyRbovd6SEiqJaRj4QmxuerQ0ZZCvx08JYRoL+8wSbriou7leiuNEn
	Fc6FOiklFwXqVXoPE6jRsJQDbIm9aOm80shpdcNX1R9lWyHy/x6nrYt9I3t+2PxbhpQVr+HfQPWi4
	ayDxpkZhU6M5JmGiAXgCxUXTNqU5u0FhrNKWac/wzT7au9jIBUhdLhLMc7vLNYjapvVbS2DVeGcDu
	rplUQZiZryG5RUnRQdqt1jr4scMySQ/EMwsagu63RUX7LKCWlcmWDdwptUNcyZrXUVJ/k1LMgT2+B
	Q4oBYwIA==;
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weqba-00000002WaK-1ANG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 08:47:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782895655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9R0sEcrEcJj1+N/TVKuoWiSfW8zF14v2/MRWt/PM07E=;
	b=whxuRCIui+TJwB1+Sa4xIs9mUoqTZUDV+0FRvAwvj3RGl+TXUMqEHEjtcCFoYzPB98RgfK
	wGgfRkTSwrnQlf35J0OXpQ2WwxHaowNGKWBDruK0qco4I/+4G3BeK02slgbk4pf77c56o+
	ms8djRlltf0qwxz+Cpr05F/3qno4/uY=
From: Atish Patra <atish.patra@linux.dev>
Date: Wed, 01 Jul 2026 01:46:53 -0700
Subject: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_094738_516287_A813BBBB 
X-CRM114-Status: GOOD (  10.95  )
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

From: Atish Patra <atishp@rivosinc.com>

The indirect CSR requires multiple instructions to read/write CSR.
Add a few helper functions for ease of usage.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr_ind.h | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
new file mode 100644
index 000000000000..1b15e358484d
--- /dev/null
+++ b/arch/riscv/include/asm/csr_ind.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_RISCV_CSR_IND_H
+#define _ASM_RISCV_CSR_IND_H
+
+#include <linux/irqflags.h>
+
+#include <asm/csr.h>
+
+#define csr_ind_read(iregcsr, iselbase, iseloff) ({		\
+	unsigned long __value = 0;				\
+	unsigned long __flags;					\
+	local_irq_save(__flags);				\
+	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
+	__value = csr_read(iregcsr);				\
+	local_irq_restore(__flags);				\
+	__value;						\
+})
+
+#define csr_ind_write(iregcsr, iselbase, iseloff, value) ({	\
+	unsigned long __flags;					\
+	local_irq_save(__flags);				\
+	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
+	csr_write(iregcsr, (value));				\
+	local_irq_restore(__flags);				\
+})
+
+#define csr_ind_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
+	unsigned long __old_val = 0, __value = 0;		\
+	unsigned long __flags;					\
+	local_irq_save(__flags);				\
+	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
+	__old_val = csr_read(iregcsr);				\
+	csr_write(iregcsr, (warl_val));				\
+	__value = csr_read(iregcsr);				\
+	csr_write(iregcsr, __old_val);				\
+	local_irq_restore(__flags);				\
+	__value;						\
+})
+
+#endif

-- 
2.53.0-Meta


