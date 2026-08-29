Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4FDC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 03:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sTtGb2mob8IhHEmaTINENeOaALkF5ic/TejpRBGBD0=; b=iW67hEDkH5NBqlquOAKQIBu+vQ
	1/9jB7bbUrYNRrhVVkNG+hiVwfQJULHPK/UCcZWZFnguEDTBQFLYkVXvxigUce39XkqzE0v0jZs2y
	yXFnAI96dkp+kh3kVERyI/4RwtiGveT+gBX/xtGKQNxLCSn9jEmOM5HkLrojqELhnMjDJPMnawv7/
	MzdABUhyxu+qg+cLKAJB+hIyKY19aVPqYNULL25+ehiPVwYXXDcpLnFWWZSvqIY1vcOVi/PVib+u1
	8q4+xK6WumMrngiYibb0UpSFIuu6B3rvVcM+oIctQKYHFzWag0HEsiRAi8f6FijJKnBLOaLmd4RGx
	OeG7bNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0A1o-00000006gp5-2CIb;
	Sat, 29 Aug 2026 03:46:48 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0A1l-00000006go6-2Vho
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 03:46:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2sTtGb2mob8IhHEmaTINENeOaALkF5ic/TejpRBGBD0=;
	b=isZbEhZZysoJ++Zc12Ge3WKctXy1ixlYW2c8OEjSz6tAj065nu/RRqdajQVQ+drE2Nc92j+4/
	Pqca1cmq7VGYbkTIOxuzPYpl8MqcPSaY9En9VbL66c82DyvfrL0CRcNZCXJizFDh0HA4xm4axL1
	2zhiPLUAdj+V03l28/6KcCw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hX19Q0Gjkz1T4K6;
	Sat, 29 Aug 2026 11:35:22 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 93CC040538;
	Sat, 29 Aug 2026 11:46:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 29 Aug 2026 11:46:37 +0800
Message-ID: <3338d826-b941-4fe9-a65d-9c2838205e5a@huawei.com>
Date: Sat, 29 Aug 2026 11:46:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 39/45] arm64: smp: Fall back to IRQ when IPI NMI
 request fails
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-40-vladimir.murzin@arm.com>
 <3f27e2d0-8f5d-4d0c-8945-a4fa84327f7a@huawei.com>
 <f1778585-97ca-453a-b221-f281b7a70822@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <f1778585-97ca-453a-b221-f281b7a70822@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_204646_248147_3B1E40C9 
X-CRM114-Status: GOOD (  17.56  )
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



在 2026/8/21 18:16, Vladimir Murzin 写道:
> On 8/13/26 10:23, Jinjie Ruan wrote:
>>
>> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>>> Existing IPI setup logic relies on ipi_should_be_nmi() to decide
>>> whether to request an NMI (if supported) or an ordinary IRQ. If NMI is
>>> not supported, using an ordinary IRQ is acceptable.
>>>
>>> FEAT_NMI requires complementary support in the interrupt
>>> controller. If FEAT_NMI is present but interrupt controller support is
>>> absent, request_percpu_nmi() can fail.
>>>
>>> One way to prevent this would be to extend ipi_should_be_nmi() to also
>>> check for interrupt controller support. However, since falling back to
>>> an ordinary IRQ is acceptable, treat ipi_should_be_nmi() as a hint
>>> instead. Whether an IPI is actually registered as an NMI is determined
>>> by the success or failure of request_percpu_nmi(). If the request
>>> fails, fall back to request_irq().
>>>
>>> Track which IPIs were actually registered as NMIs and use that state
>>> in the per-CPU enable and disable paths. This avoids calling the
>>> percpu NMI helpers for an IPI that fell back to regular IRQ handling.
>>>
>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>
>> Should we replace ipi_should_be_nmi() with test_bit(ipi,
>> get_ipi_nmi_bitmap(cpu) in smp_send_stop()?
>>
> 
> Right. We can do something like
> 
> @@ -1312,7 +1328,7 @@ void smp_send_stop(void)
>          * If CPUs are still online, try an NMI. There's no excuse for this to
>          * be slow, so we only give them an extra 10 ms to respond.
>          */
> -       if (num_other_online_cpus() && ipi_should_be_nmi(IPI_CPU_STOP_NMI)) {
> +       if (num_other_online_cpus() && ipi_is_nmi(smp_processor_id(), IPI_CPU_STOP_NMI)) {
>                 smp_rmb();
>                 cpumask_copy(&mask, cpu_online_mask);
>                 cpumask_clear_cpu(smp_processor_id(), &mask);
> 
> where 
> 
> +#define ipi_is_nmi(__cpu, __ipi) test_bit(__ipi, get_ipi_nmi_bitmap(__cpu))
> 
> can be used in other places to simpify the code 

Agree.

> 
>> irq_desc_get_irq(get_ipi_desc(cpu, ipi)) has been used more than 3
>> times, can we define a new macro for use?
>>
>> git grep "irq_desc_get_irq(get_ipi_desc(cpu, ipi))"
>> arch/arm64/kernel/smp.c:
>> enable_nmi(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
>> arch/arm64/kernel/smp.c:
>> enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
>> arch/arm64/kernel/smp.c:
>> disable_nmi_nosync(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
>> arch/arm64/kernel/smp.c:
>> disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
>>
>>
> 
> I assume you did grep after full series applied, since
> irq_desc_get_irq(get_ipi_desc(cpu, ipi)) comes from LPI flow.
> 
> Anyway, we can easily avoid some duplication and get usage
> of irq_desc_get_irq(get_ipi_desc(cpu, ipi)) back to two

Anyway, it is always good to avoid repetition.

> 
> $ git grep "irq_desc_get_irq(get_ipi_desc(cpu, ipi))"
> arch/arm64/kernel/smp.c:        int irq = irq_desc_get_irq(get_ipi_desc(cpu, ipi));
> arch/arm64/kernel/smp.c:        int irq = irq_desc_get_irq(get_ipi_desc(cpu, ipi));
> 
> Cheers
> Vladimir
> 
> 


