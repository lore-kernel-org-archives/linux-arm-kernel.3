Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D3C55838
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=po07o5l5QWKcUpTBA8x1BoyVyCQ99VWLuvatS1Gyqg4=; b=LLuccAUf5nnoQHRPLCkik4FiD7
	pCLTWJY+Rkvuy28tNPFZeKgP5tDsGGXdTZy7i7qs2EKK5eC9Engjpfnuc5tOFKhxug5/eFqOXRAmv
	5vBi8XbaLYFROs8j47qoGelLPIPcdbtK165U6+bFldnreM3MeQGGtLZ6NjwTzKpbaUcvtSFApA/Xf
	WTwMLQyZ9HtziE3u4pNNLQkBtXEx9aHvC1ix6uJ7G85ZTKbZg0fGsjUlnBYpnSI3d1rL+4WcwBeQH
	RxGEhzYizdjbJE+riilTuTUNFBVWjMHUN0y0LpGzu+6lB+nDqGj97THnwhCz9ubvLa9/Qjx1jcg0G
	RZCAjdww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPf4-00000002z2x-2XvR;
	Wed, 05 Aug 2026 00:39:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPf3-00000002z2X-0smD;
	Wed, 05 Aug 2026 00:39:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A54A743700;
	Wed,  5 Aug 2026 00:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460181F000E9;
	Wed,  5 Aug 2026 00:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785890348;
	bh=po07o5l5QWKcUpTBA8x1BoyVyCQ99VWLuvatS1Gyqg4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=CHNwopjtbJpoJ+QoDPRhEa4mF8x5nHrdx4VEtFzOqDqCSTQwLUZIGI0PnQrfC6l27
	 PzarS6jDKA5kO+K/lFdnQNd1DsaywRON8+cu+RVPFvuCkMCcz9XF7zn9Dqv56FHSw9
	 bdQqi+uOkHZSoeI0pN1ZG59FXTUeq6A+qzammhGn7lzaUawutCRuqKsBd7iAhsPWkf
	 1tTKLgW164I6yUXtqvgfaKoXpvkJ/s8t7E1lflGfnuUTVxVgC4PSpZMjyz1nmrqiDH
	 cH7daKKXg/YiuiMEmOYyCFHgsXGLPqhZGnCsNB0tElpDNIsjD0GkVo+YHMpvM/cz6o
	 heBmCeJAg7Lzg==
Date: Tue, 4 Aug 2026 18:39:04 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
In-Reply-To: <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
Message-ID: <1b20aa77-0f0f-08c7-9439-972983adf709@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Atish Patra <atishp@rivosinc.com>
> 
> The indirect CSR requires multiple instructions to read/write CSR.
> Add a few helper functions for ease of usage.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks.  These macros seem better implemented as static inline functions.  
That also nicely aligns the code with what you write in the patch 
description.

Also, I renamed this file to change the abbreviation "ind" to "indirect", 
along the lines of this feedback here:

   https://lore.kernel.org/linux-riscv/CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com/

This case is even worse since there are already uses of "csr_index" in 
the codebase, so it's even more unclear what "ind" is supposed to mean.

Updated patch follows.  Please let me know if you have any objections,


- Paul

From: Atish Patra <atishp@rivosinc.com>

RISC-V: Define indirect CSR access helpers

The indirect CSR requires multiple instructions to read/write CSR.
Add a few helper functions for ease of usage.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Link: https://patch.msgid.link/20260701-counter_delegation-v8-5-7909f863a645@meta.com
[pjw@kernel.org: expand "ind" abbreviation; use static inline functions rather than macros]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/csr_indirect.h | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 arch/riscv/include/asm/csr_indirect.h

diff --git a/arch/riscv/include/asm/csr_indirect.h b/arch/riscv/include/asm/csr_indirect.h
new file mode 100644
index 000000000000..3cd6a9059455
--- /dev/null
+++ b/arch/riscv/include/asm/csr_indirect.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_RISCV_CSR_INDIRECT_H
+#define _ASM_RISCV_CSR_INDIRECT_H
+
+#include <linux/types.h>
+#include <linux/irqflags.h>
+
+#include <asm/csr.h>
+
+static inline unsigned long csr_indirect_read(u16 iregcsr, u32 iselbase, u32 iseloff)
+{
+	unsigned long __value = 0;
+	unsigned long __flags;
+
+	local_irq_save(__flags);
+	csr_write(CSR_ISELECT, iselbase + iseloff);
+	__value = csr_read(iregcsr);
+	local_irq_restore(__flags);
+
+	return __value;
+}
+
+static inline void csr_indirect_write(u16 iregcsr, u32 iselbase, u32 iseloff, unsigned long value)
+{
+	unsigned long __flags;
+
+	local_irq_save(__flags);
+	csr_write(CSR_ISELECT, iselbase + iseloff);
+	csr_write(iregcsr, (value));
+	local_irq_restore(__flags);
+}
+
+static inline unsigned long csr_indirect_warl(u16 iregcsr, u32 iselbase, u32 iseloff,
+					      unsigned long warl_val)
+{
+	unsigned long __old_val = 0, __value = 0;
+	unsigned long __flags;
+
+	local_irq_save(__flags);
+	csr_write(CSR_ISELECT, iselbase + iseloff);
+	__old_val = csr_read(iregcsr);
+	csr_write(iregcsr, warl_val);
+	__value = csr_read(iregcsr);
+	csr_write(iregcsr, __old_val);
+	local_irq_restore(__flags);
+
+	return __value;
+}
+
+#endif
-- 
2.53.0



