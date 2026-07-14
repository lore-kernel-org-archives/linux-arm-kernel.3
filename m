Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71378C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f04zRx0CTGKLkupF/92VICf1nMZWiWuY2SXMkDD4wDY=; b=p6bjGN8P/LBOxhNe1lo0aHk+Oy
	Stq8ADETB9nmvW92mSti109UfiYge5p8RRCpBbeo2HZrQ7WUa9g18kppPPeX6TviJOOwcbPTwXWyb
	ekAoGaTF8xF4wU6s6HPb8aJom3D85irXzTdjk7lPiBdyRZMLgEC5GSEPRLn0sX7Y2NIxSuyAip0ju
	qDtuVL2aZ84XY+SOFGlKsfys728T0teB8OQEHP/JugXS3g3bkm78p09FMBpuIF2F9wJHGWOwpRmKN
	TJOKRVVRBUuC+dPXiZv2naGozp0ebvSGcuj2WR9x1ZRDwAldEZtVLnx8uZ6tnd4ebKr2SaJ6YjA/J
	juUjTyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcWv-0000000BzVE-0rU6;
	Tue, 14 Jul 2026 12:46:33 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcWq-0000000BzTf-1z2h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:46:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=f04zRx0CTGKLkupF/92VICf1nMZWiWuY2SXMkDD4wDY=;
	b=BX3wJr1+wMXRQ2XVuSriDFTVOT0uZK85eWm5b72vbsxPX2Bd20urJ690G+nrkob/cZxmweAwW
	s/7E45VJJBX3yjfnWHsyRLQ0MkzmtNAmzreENsQjpq5gQso7z0E3w8hSlRNb6LFvI0KIb4uLPhK
	7l7FowQJw7Rqy/geyQa6EKk=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gzzNC0RY2zpStQ;
	Tue, 14 Jul 2026 20:37:31 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2284F40537;
	Tue, 14 Jul 2026 20:46:22 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 20:46:21 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 20:46:21 +0800
Message-ID: <3a045470-2cf3-41c3-90f2-bc3e8ad2d0a9@huawei.com>
Date: Tue, 14 Jul 2026 20:46:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/36] arm64: process: Use helper to check exception
 state
To: Jinjie Ruan <ruanjinjie@huawei.com>, Vladimir Murzin
	<vladimir.murzin@arm.com>, <linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-14-vladimir.murzin@arm.com>
 <656764bf-f62f-4380-a8dc-96055d4972f5@huawei.com>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <656764bf-f62f-4380-a8dc-96055d4972f5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_054628_841185_9B7C6A2C 
X-CRM114-Status: GOOD (  11.27  )
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

在 2026/7/10 18:00, Jinjie Ruan 写道:
> 
> 
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> debug_switch_state() explicitly checks the hardware exception state
>> for both the pseudo-NMI and non-NMI paths. The expected state matches
>> the NOIRQ_CONTEXT exception context introduced alongside the exception
>> masking helpers and state checkers.
>>
>> Use the helper instead of open-coding these checks.
>>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/kernel/process.c | 21 ++-------------------
>>  1 file changed, 2 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
>> index 033643cd4e5e..ddda8d7aee24 100644
>> --- a/arch/arm64/kernel/process.c
>> +++ b/arch/arm64/kernel/process.c
>> @@ -51,6 +51,7 @@
>>  #include <asm/exec.h>
>>  #include <asm/fpsimd.h>
>>  #include <asm/gcs.h>
>> +#include <asm/interrupts/common_flags.h>
>>  #include <asm/mmu_context.h>
>>  #include <asm/mpam.h>
>>  #include <asm/mte.h>
>> @@ -738,25 +739,7 @@ void update_sctlr_el1(u64 sctlr)
>>  
>>  static inline void debug_switch_state(void)
>>  {
>> -	if (system_uses_irq_prio_masking()) {
>> -		unsigned long daif_expected = 0;
>> -		unsigned long daif_actual = read_sysreg(daif);
>> -		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
>> -		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
>> -
>> -		WARN_ONCE(daif_actual != daif_expected ||
>> -			  pmr_actual != pmr_expected,
>> -			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
>> -			  daif_actual, pmr_actual,
>> -			  daif_expected, pmr_expected);
>> -	} else {
>> -		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
>> -		unsigned long daif_actual = read_sysreg(daif);
>> -
>> -		WARN_ONCE(daif_actual != daif_expected,
>> -			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
>> -			  daif_actual, daif_expected);
>> -	}
>> +	arm64_debug_exc_context(NOIRQ_CONTEXT);
> 
> 
> With CONFIG_DEBUG_IRQFLAGS，we can avoid the overhead of this check.

Hmm, CONFIG_DEBUG_IRQFLAGS has been checked in arm64_debug_exc_context().

> 
> LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
>>  }
>>  
>>  /*
> 
> 


-- 
BR
Liao, Chang

