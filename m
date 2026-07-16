Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B287C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dFlkQo3JHSJqKPJBz8QEEEFt1JZGq/FMQLeEVGbMzk=; b=dAUs82bdu1D+Z2
	1S18scDxrfcBOEWilc+WWvIkZA/tZoO01Cm3DHimDY66jpxHwP3MZzoJSqf9vJosHKkNCK4ls8w0j
	zGgQ0frOCT+sSZA18aZyAcNVKVtHDKi6gdNjHZZX+dZnlLARxzcJAm2objzVtZVu/Yb4dQs3gzHL3
	8lIpgcNFmZlUoNHUyc8YY1YQb3x4+OuTVucDFGButlXfI1+306rLMm9OQnxw1wQBW6pHcM9z/uFM4
	acr5zznSMEtWbyCYgYkMKNCjNzebikopBUhdpYzeBV0xzmPh5WlNlJipNdowmeqXNJGFcntQDls0n
	GFLhu1WT4NOGZOMvu8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIMO-0000000GrFO-3j9L;
	Thu, 16 Jul 2026 09:26:28 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIML-0000000GrE0-3jNU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:26:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6dFlkQo3JHSJqKPJBz8QEEEFt1JZGq/FMQLeEVGbMzk=;
	b=LvKNpb+cJZy/uB0uDEIR1W/ouRwWlstAsbYPhXKktNA0NFaJsle9tdaGNOoMvqni5e+DI3l5Q
	aAvr1IX7BriiPuYcaIQJWUJ1CWxMt/7Aep83sq1jIR7SGqKCWppM7QIZu7Pb1RBQFG9UXmnSNI4
	6iLol8fci8+gwwRLu4t1QhQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4h16qm42vMzcb0m;
	Thu, 16 Jul 2026 17:16:52 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 61BA04057F;
	Thu, 16 Jul 2026 17:26:10 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jul 2026 17:26:09 +0800
Message-ID: <314bb956-e69a-4421-aa6a-36efebd73dc7@huawei.com>
Date: Thu, 16 Jul 2026 17:26:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 31/36] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-32-vladimir.murzin@arm.com>
 <88a31062-f898-474f-b3a6-1a0b8586d5e3@huawei.com>
 <63cb9447-a219-4115-a6ed-c69aeaa45535@arm.com>
 <9fe11e2f-4f03-4d8b-ad9d-fea584431c9c@huawei.com>
 <b25ffc41-c4c0-4a72-bac6-fb7c0abf8e64@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <b25ffc41-c4c0-4a72-bac6-fb7c0abf8e64@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_022626_407662_6366234F 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/15/2026 10:08 PM, Vladimir Murzin wrote:
> On 7/15/26 13:07, Jinjie Ruan wrote:
>>> FEAT_NMI
>>>
>>>   We can distinguish between an NMI and an IRQ on exception
>>>   entry. Thus, for an IRQ, we can immediately drop to NOIRQ_CONTEXT
>>>   before passing control to the IRQ handler, allowing NMIs to preempt
>>>   the IRQ handler. This corresponds to case 2 of the pNMI flow above.
>>>
>> I think this is not quite correct. When entering the __el1_irq()
>> function, if only system_uses_nmi() is true, it does not necessarily
>> mean it is NOIRQ_CONTEXT.
>>
>> I believe the unmasking of allint, or NOIRQ_CONTEXT, should be delayed
>> until gic_handle_irq() actually before we processes the interrupt as
>> gic_unmask_pnmis() do it. At this point, it is still NONMI_CONTEXT to
>> keep  hardware NMI masked as isr_el1.IS is not set.
> 
> It looks like your LLM needs the additional context from the
> "[RFC PATCH 36/36] irqchip/gic-v3: Implement FEAT_GICv3_NMI support".

Not LLM, but based on my understanding of Mark's previous code. The last
patch has not been reviewed yet.

> 
> With that context, it should recognise that NMIs and IRQs take
> separate handling paths and use separate hardware state, so they do
> not interfere with each other. As a result, IRQ handling only needs to
> mask IRQs. In other words, there is no need to delay entering
> NOIRQ_CONTEXT until reaching the GIC.

Thank you for the reminder, I will take a closer look.

> 
> Cheers
> Vladimir
> 
> 
> 


