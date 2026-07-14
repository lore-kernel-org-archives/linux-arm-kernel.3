Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D345CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3orutuILwRxJkzm4PhzhNuMAgsfDaQM+1YuVDENJtP4=; b=NpmX3EOTTriXy2
	q0+4cSOtivI9jGl+C5V5XoayE6iMvGWaDXIomdM2EPZboQZ3GjXNBnMLRPkN80IekRIVhW994co+O
	tzfrunRiKp5YlDYqK6smyWTfk+kFfrj6GtVxw4GNB4IOW5kS1actVtlrmW/tweogii7aCP9jarL6q
	1nkLQ6p9Jo7U4V/rXVpDq2685hbfKupPHRr/U7dX7Bx8lriuQ/6bK0ip3iQ+guPsVAJP9KcPWlQF1
	luCY56ROC7nH4aEJOkT290WxfKq0oGCuIXPgc1feROSuRXv9/0Exorpc4eMYbKigXPn9tVFY/F7Yc
	W12wxuQpi2+u4+dPMz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcd4-0000000C0Ku-24Be;
	Tue, 14 Jul 2026 12:52:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcd1-0000000C0KY-2C1P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:52:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B87F1477;
	Tue, 14 Jul 2026 05:52:46 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D155E3F7B4;
	Tue, 14 Jul 2026 05:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784033570; bh=sM8pVSeteBvnbHPTXsBE4LWJOBsl11V1VqmaJW9v5EQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lLoAzSIj8JjfI7RWiN4shGIG+XXfipBo7258vGr/MHS/GQf+YGeFWZV7XcgLnLaWp
	 7yKUf3cEiVMjUi0JIQLZdjwXIOUI5yNv1lGoUm+7Mygv4BvrvJG2s0wbqx90tKlrZc
	 EVXBpYPnQiGlOxdTdgOkHyujwmLTGJVknTDsjN6U=
Message-ID: <e767a435-b653-4cf1-b0a5-aba362f9d179@arm.com>
Date: Tue, 14 Jul 2026 13:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/36] arm64: interrupts: introduce generic interrupt
 masking helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-15-vladimir.murzin@arm.com>
 <33e6094d-e433-4406-8fef-0feff8f05bcb@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <33e6094d-e433-4406-8fef-0feff8f05bcb@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055251_617763_EA06860C 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/13/26 09:43, Jinjie Ruan wrote:
>> diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
>> new file mode 100644
>> index 000000000000..66ee03f7ab68
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/interrupts/masking.h
>> @@ -0,0 +1,101 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2025 Arm Ltd.
>> + */
>> +#ifndef __ASM_INTERRUPTS_MASKING_H
>> +#define __ASM_INTERRUPTS_MASKING_H
>> +
>> +#include <asm/arch_gicv3.h>
>> +#include <asm/bug.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/interrupts/common_flags.h>
>> +#include <asm/ptrace.h>
>> +
>> +typedef struct arm64_exc_hwstates {
>> +	arm64_exc_hwstate_t saved;
>> +	arm64_exc_hwstate_t expected;
>> +} arm64_exc_hwstates_t;
>> +
>> +#ifdef CONFIG_DEBUG_IRQFLAGS
>> +/* Make sure the CPU init/tear down masking functions are only used once. */
>> +static DEFINE_PER_CPU(bool, irqs_masks_cpu_init_done);
>> +static DEFINE_PER_CPU(bool, irqs_masks_cpu_final_done);
>> +#endif
>> +
>> +static inline
>> +arm64_exc_hwstates_t local_all_irqs_save_mask(arm64_exc_context_t new)
> I think the name "all irqs" is inappropriate, because it also masks
> DEBUG exceptions and SERROR exceptions, which are not irqs.
> 
> Maybe local_exceptions_save_mask()?

Make sense. I'll fix that in next iteration.

Cheers
Vladimir

