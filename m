Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D284C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U79nRxJWxS7DKB7kDuFGsd1GyBq9C6MjL8/QS2N6Amo=; b=h4XYMnUhGaThRH
	Dc15N4XmL2A2IpJmRybrYk+pqa7F62ozhmrmv5rjKuNxwUx8SUjILlqzbJt9sazRHpkTNG5GBDBGf
	xk6/TugyepCkAluP4eab5F8jLGDsmBDy1oCuyhSItfzNabZ+Yn0AyXhM8B9VvP3xeXuT89oC02D2r
	f5pEee18wWy/kWPlUVdOo8A/UHpFF3iPDd5FfPNB2Q4/qkvW8aFmLWSZrKoYnJOiv3/Aa9QUZvljp
	euWGh2r6Wrsjr8C3UfNp+6SwkR23WLw/WoTCwhiCHGRTnTKbujb9s1oEaXNTHM4fwmgx4gDcAT9hu
	mwXf65cIDib5daKBMfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbiw-0000000BoH6-0mLW;
	Tue, 14 Jul 2026 11:54:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbiu-0000000BoGB-0OgT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:54:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B4A9497;
	Tue, 14 Jul 2026 04:54:47 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE6903F93E;
	Tue, 14 Jul 2026 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784030091; bh=SQoYU+eujA1QCawFdEGbZcrTK52nyXfi8WTwOYTqqVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uPF/9ojaWpVNrbQ/YedzXp9Gk5lgwZB5UZsqP1g4q5fFnsbeuGr6lPvJVvz6RCxVI
	 +yTLkiCusZNhz4jlbP9f26a2JQPYcyaB1smVH9KddtmXd/3xpc2js14+ZlSPalMim4
	 c9dipgHfNF7+/M3DN9558ypqrH/CyK/yvUDc8MEQ=
Message-ID: <9d46bdd3-e012-48a1-a3a4-737eb3f90cc5@arm.com>
Date: Tue, 14 Jul 2026 12:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/36] arm64: interrupts: introduce interrupt masking
 helpers for entry code
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-12-vladimir.murzin@arm.com>
 <06c7765e-221f-42be-a26b-c3a4298a6bdb@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <06c7765e-221f-42be-a26b-c3a4298a6bdb@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045452_180056_CE8C1E44 
X-CRM114-Status: GOOD (  10.81  )
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

On 7/10/26 10:19, Jinjie Ruan wrote:
>> diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
>> new file mode 100644
>> index 000000000000..6ce60d1519e8
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/interrupts/common_flags.h
>> @@ -0,0 +1,197 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2025 Arm Ltd.
>> + */
>> +#ifndef __ASM_INTERRUPTS_COMMON_FLAGS_H
>> +#define __ASM_INTERRUPTS_COMMON_FLAGS_H
>> +
>> +#include <asm/arch_gicv3.h>
>> +#include <asm/bug.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/ptrace.h>
>> +#include <asm/sysreg.h>
>> +#include <asm/irqflags.h>
>> +
>> +#define DAIF_PROCCTX		0
>> +#define DAIF_PROCCTX_NOIRQ	(PSR_I_BIT | PSR_F_BIT)
>> +#define DAIF_ERRCTX		(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
>> +#define DAIF_MASK		(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
>> +
>> +/*
>> + * Exception context mapping
>> + *
>> + * pseudo-NMI
>> + *
>> + * CRITICAL -> DAIF + IRQON  (corresponds to the state on exception entry)
>> + * ERROR    ->  AIF + IRQON
>> + * NONMI    ->   IF + IRQON
>> + * NOIRQ    ->    0 + IRQOFF
>> + * PROCESS  ->    0 + IRQON
>> + *
>> + * Otherwise
>> + *
>> + * CRITICAL -> DAIF           (corresponds to the state on exception entry)
>> + * ERROR    ->  AIF
>> + * NONMI    ->   IF
>> + * NOIRQ    ->   IF
>> + * PROCESS  ->    0
> without the allint of FEAT_NMI, the NONMI here is meaningless.
> 

We still have NONMI for the pNMI context and we better document that
NONMI is equivalent to NOIRQ on systems that do not implement any form
of NMI.

> With allint, maybe:
> 
> + * CRITICAL -> ALLINT + DAIF           (corresponds to the state on
> exception entry)
> + * ERROR    ->  ALLINT + AIF
> + * NONMI    ->  ALLINT + IF
> + * NOIRQ    ->   IF
> + * PROCESS  ->    0
> 

This is correct, but belong to future patch...

Cheers
Vladimir

