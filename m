Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCCDC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/aatG9xeq1PJrzz8GhMwerq64hjkacWtLJ3rJGHBR0=; b=CaPcCJWxtvnc1pcc9XfKKu9CYW
	4wdKgwk95DeAALKrOlXlh2Kee/9GiIhmkrA5ES+ltYdWgOoXO+UuHx8DbPbaAy3NmRA9/OfoywQPv
	M5RT9TpUHrElNfu5s8JyeuZsLMtywITeqQu046xoWPuVvr6EMgq06JuaJzVd5cdlxKunMgbfmb92M
	xxcaRaj9fQFNbhDaQ2PbfHKX1zsKK+KYP7R3y3HeRFuDIv0/DJ9RyYaspkCdnQripLEaIWyaEery0
	Nhtrj9JNWyx6UR7sQJWt4njWyGN86QMnxZe+SHGJLUCF2VhlX36Qa7XxiSPoaSr2URotBkN6/kGzV
	SNkHhDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFe7-00000007LAX-3Aql;
	Fri, 07 Aug 2026 08:09:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFe6-00000007L9Y-17WO;
	Fri, 07 Aug 2026 08:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z/aatG9xeq1PJrzz8GhMwerq64hjkacWtLJ3rJGHBR0=; b=Hbk0wGFMQ3nnbbT13meYOXyhao
	fV/nbV/eLguiEfeNVJzjoGT6SrIXRCF5SqUp6BRLguLiFHgCyJ4hdUOzGcHYej4u7WUuRY0577Ukw
	Pr6JpxhkE0J+F2qXDLTpzojMf9hRK3iDHV/oqqCCcdrq3PoTXqqyRI4dETkO2bLGV+N1nKG+ADfmm
	CKcQEDkubVaiQMYhZWXP9ncAA9N24IadqCkwumPjvplxwNZPu+p5maRuviILK1A2GpR49OB6gDGqH
	DyWISS8/rCDxctKjsSpjGFoIB3QUUUe7i21KyrrukRhiGzA/MRKvNPu5jgOxXP9MocxAkVKxdvSD2
	sjVTA2kA==;
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFe3-0000000CAae-0MOp;
	Fri, 07 Aug 2026 08:09:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/aatG9xeq1PJrzz8GhMwerq64hjkacWtLJ3rJGHBR0=;
	b=PUHal4RD0h2MF1ycbehNZsMgPk5LWMXgH/wVZHIiTvG15dOtOrgXOFXMqFIoG9DNbkhe53
	ZV3KAhrCCA5wyoPnJmf3OYMn3TefEP2fvqGUvBiu/sY6rj7oQss3Eda25f+S7LMI+hmGFU
	53antfsmj1oHf+AjhymEY1+Ofs1MKBc=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:00 -0700
Subject: [PATCH v9 05/20] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-counter_delegation-v9-5-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_090935_341868_AF396EFC 
X-CRM114-Status: GOOD (  12.44  )
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
Add a few helper macros for ease of usage.

These have to be macros rather than functions. csr_read()/csr_write()
stringify their CSR argument into the inline asm template via
__ASM_STR(), so the CSR number must be a literal token; passing it as a
function parameter emits "csrr %0, iregcsr", which the assembler rejects
with "unknown CSR `iregcsr'". The stringification happens in the
preprocessor, before inlining or constant propagation, so it cannot be
worked around by forcing inlining or by only ever passing constants -
gcc 12, gcc 16 and clang 22 all reject it alike. Underneath, csrr/csrw
encode the CSR as a 12-bit immediate and RISC-V has no register-indirect
form, which is also why asm/csr.h keeps every one of its accessors as a
macro.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Link: https://patch.msgid.link/20260701-counter_delegation-v8-5-7909f863a645@meta.com
[pjw@kernel.org: expand "ind" abbreviation]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/csr_indirect.h | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/include/asm/csr_indirect.h b/arch/riscv/include/asm/csr_indirect.h
new file mode 100644
index 000000000000..0f558fac8f5f
--- /dev/null
+++ b/arch/riscv/include/asm/csr_indirect.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_RISCV_CSR_INDIRECT_H
+#define _ASM_RISCV_CSR_INDIRECT_H
+
+#include <linux/irqflags.h>
+
+#include <asm/csr.h>
+
+/*
+ * These have to be macros rather than functions: csr_read()/csr_write()
+ * stringify their CSR argument into the inline asm template via __ASM_STR(),
+ * so the CSR number must be a literal token at preprocessing time. Passing it
+ * as a function parameter emits "csrr %0, iregcsr", which no assembler can
+ * resolve. RISC-V has no register-indirect form of csrr/csrw - the CSR is a
+ * 12-bit immediate - so the sireg CSR selecting the indirect window cannot
+ * itself be a variable.
+ */
+#define csr_indirect_read(iregcsr, iselbase, iseloff) ({		\
+	unsigned long __value = 0;				\
+	unsigned long __flags;					\
+	local_irq_save(__flags);				\
+	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
+	__value = csr_read(iregcsr);				\
+	local_irq_restore(__flags);				\
+	__value;						\
+})
+
+#define csr_indirect_write(iregcsr, iselbase, iseloff, value) ({	\
+	unsigned long __flags;					\
+	local_irq_save(__flags);				\
+	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
+	csr_write(iregcsr, (value));				\
+	local_irq_restore(__flags);				\
+})
+
+#define csr_indirect_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
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


