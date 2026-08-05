Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C31C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=db+v0NPIIndwhHMGIyL/nfOie4gWWsSLJbxQZ/GJglw=; b=Dn07CX6aa+9QgOO0HssLu9Qxir
	qYmrcq3v/HMC4MF42SMYHVYbBiqu76R26e7cm5uhlosqXOwMbScjj3icw8g3Ldizdk8ERt0wr6BZd
	+IPnNmG9gsgEawdBmd1QuDZaY0y72+CbAMqmXeg06WgpQ3U5j9y2uAXElQld3yFHdZWCJR3iDmzm5
	OxCaSGTE04LWq1OhgBw+DTmlrXcUBHV1Lw4gX+arSg8hlWzZFJEVibrB+mor2nlXufzUMEk1j6Jg+
	+q3XFOndw2INg2DfAaApGrsms/uP6xjCVEa6vEQVqC3MmTUlzGsYaIR4DtNS/2184un5i30HDGnqo
	G4qicYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWYE-00000003S7H-1eZb;
	Wed, 05 Aug 2026 08:00:34 +0000
Received: from mta1.migadu.com ([37.59.57.117] helo=out-171.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWYB-00000003S6g-2mAc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:00:33 +0000
Message-ID: <920aee80-5297-4d70-a1ea-616976db7f70@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785916819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=db+v0NPIIndwhHMGIyL/nfOie4gWWsSLJbxQZ/GJglw=;
	b=WcAGkTiLyA/FOQnCkP705/KPLwXshGh5+z9mBuv6t97IY7n5FtK+a0rGEXw9mvzc/LMO0t
	YkSKmqCCvu4J//sHlBq/n/KtKAvRPzLH6nDJx+IgjxuEj1IjBqbwH9T/kmrywRIdrcsyov
	lsStOIycl8jtq/nhm92s03Bq1YXmn/Q=
Date: Wed, 5 Aug 2026 00:59:45 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
To: Paul Walmsley <pjw@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
 <1b20aa77-0f0f-08c7-9439-972983adf709@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <1b20aa77-0f0f-08c7-9439-972983adf709@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010032_083831_C75CA79F 
X-CRM114-Status: GOOD (  28.23  )
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

On 8/4/26 5:39 PM, Paul Walmsley wrote:
> On Wed, 1 Jul 2026, Atish Patra wrote:
> 
>> From: Atish Patra <atishp@rivosinc.com>
>>
>> The indirect CSR requires multiple instructions to read/write CSR.
>> Add a few helper functions for ease of usage.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> 
> Thanks.  These macros seem better implemented as static inline functions.
> That also nicely aligns the code with what you write in the patch
> description.

I don't think inlining these macros in the following way will work 
because of the following reason. It won't build once anything calls it.

csr_read()/csr_write() stringify the CSR argument straight into the 
inline asm template:

#define csr_read(csr)                                         \
({                                                            \
       register unsigned long __v;                             \
       __asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)        \
                             : "=r" (__v) :                    \
                             : "memory");                      \
       __v;                                                    \
})

so the CSR operand has to be a literal token. With iregcsr as a function
parameter the template becomes "csrr %0, iregcsr", which will result in 
the following compilation error

Error: unknown CSR `iregcsr'

The patch description should be fixed to indicate that these are macros.>
> Also, I renamed this file to change the abbreviation "ind" to "indirect",
> along the lines of this feedback here:
> 
>     https://lore.kernel.org/linux-riscv/CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com/
> 
> This case is even worse since there are already uses of "csr_index" in
> the codebase, so it's even more unclear what "ind" is supposed to mean.
> 

Agreed on the expanding the abbreviation part and we should change it.

> Updated patch follows.  Please let me know if you have any objections,
> 
> 
> - Paul
> 
> From: Atish Patra <atishp@rivosinc.com>
> 
> RISC-V: Define indirect CSR access helpers
> 
> The indirect CSR requires multiple instructions to read/write CSR.
> Add a few helper functions for ease of usage.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Link: https://patch.msgid.link/20260701-counter_delegation-v8-5-7909f863a645@meta.com
> [pjw@kernel.org: expand "ind" abbreviation; use static inline functions rather than macros]
> Signed-off-by: Paul Walmsley <pjw@kernel.org>
> ---
>   arch/riscv/include/asm/csr_indirect.h | 51 +++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
>   create mode 100644 arch/riscv/include/asm/csr_indirect.h
> 
> diff --git a/arch/riscv/include/asm/csr_indirect.h b/arch/riscv/include/asm/csr_indirect.h
> new file mode 100644
> index 000000000000..3cd6a9059455
> --- /dev/null
> +++ b/arch/riscv/include/asm/csr_indirect.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _ASM_RISCV_CSR_INDIRECT_H
> +#define _ASM_RISCV_CSR_INDIRECT_H
> +
> +#include <linux/types.h>
> +#include <linux/irqflags.h>
> +
> +#include <asm/csr.h>
> +
> +static inline unsigned long csr_indirect_read(u16 iregcsr, u32 iselbase, u32 iseloff)
> +{
> +	unsigned long __value = 0;
> +	unsigned long __flags;
> +
> +	local_irq_save(__flags);
> +	csr_write(CSR_ISELECT, iselbase + iseloff);
> +	__value = csr_read(iregcsr);
> +	local_irq_restore(__flags);
> +
> +	return __value;
> +}
> +
> +static inline void csr_indirect_write(u16 iregcsr, u32 iselbase, u32 iseloff, unsigned long value)
> +{
> +	unsigned long __flags;
> +
> +	local_irq_save(__flags);
> +	csr_write(CSR_ISELECT, iselbase + iseloff);
> +	csr_write(iregcsr, (value));
> +	local_irq_restore(__flags);
> +}
> +
> +static inline unsigned long csr_indirect_warl(u16 iregcsr, u32 iselbase, u32 iseloff,
> +					      unsigned long warl_val)
> +{
> +	unsigned long __old_val = 0, __value = 0;
> +	unsigned long __flags;
> +
> +	local_irq_save(__flags);
> +	csr_write(CSR_ISELECT, iselbase + iseloff);
> +	__old_val = csr_read(iregcsr);
> +	csr_write(iregcsr, warl_val);
> +	__value = csr_read(iregcsr);
> +	csr_write(iregcsr, __old_val);
> +	local_irq_restore(__flags);
> +
> +	return __value;
> +}
> +
> +#endif


