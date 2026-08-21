Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A6FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svrkl7S7iW29vLFPOFeVrOgHl2Uapy8YjCWRsO38exw=; b=J10TacaraZlrgGpDFlVxI7bBL2
	27x9ycLZyMiaZ9A1C9EpRrC2/wPTCjqrVjTTowFqHmM5c6JoEE2BW6L4uD96Eh3YJgNGH1UrxIafQ
	fNNj3tcS/9AvkUP4BsBZCO9sQSDvCLdsu3CragBnGeNkI4Z1ugpPQHJ07ZtE4J9Cy3Ceo4jlhQSTq
	ZAjNJ6yd1keIEshsRbSUO+u4UHecUgOB5MKsookHgD34m75/SthnSdbmYRSUdMjh3i8Vscbdnc9BH
	ZshTh0GKkdbKal0fEbdkVEwdcC6sRAM39gACtWkYGw1J3pCPB+pLNQHXI5P4R1Px3f86rSdofOG/G
	hD21QmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMIm-0000000D4nl-0ktY;
	Fri, 21 Aug 2026 10:16:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMIj-0000000D4n9-2Ked
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:16:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47706153B;
	Fri, 21 Aug 2026 03:16:34 -0700 (PDT)
Received: from [10.57.68.59] (unknown [10.57.68.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89A983F66F;
	Fri, 21 Aug 2026 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787307398; bh=sFCFlEExnP3PXa6B2gCVLcY1KD5AafNyN2cgYQUnS8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROWwYbryhfqPsFORVquTVysABvodxyPbK6GGjB1mTf8R80YeqWXLkb4+fEzPUdO8V
	 vSxDwBwpCWReT0WI69axF8DuJYltXv8/TQKivK7iuGuGOBRDaWzEZPzuoeloydDB/v
	 3huQ5Nqj71DF3kHM1uY+g1qovHFt2XUwgi1vEPBE=
Message-ID: <f1778585-97ca-453a-b221-f281b7a70822@arm.com>
Date: Fri, 21 Aug 2026 11:16:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 39/45] arm64: smp: Fall back to IRQ when IPI NMI
 request fails
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-40-vladimir.murzin@arm.com>
 <3f27e2d0-8f5d-4d0c-8945-a4fa84327f7a@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <3f27e2d0-8f5d-4d0c-8945-a4fa84327f7a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_031641_686649_1999BEEF 
X-CRM114-Status: GOOD (  16.18  )
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

On 8/13/26 10:23, Jinjie Ruan wrote:
> 
> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>> Existing IPI setup logic relies on ipi_should_be_nmi() to decide
>> whether to request an NMI (if supported) or an ordinary IRQ. If NMI is
>> not supported, using an ordinary IRQ is acceptable.
>>
>> FEAT_NMI requires complementary support in the interrupt
>> controller. If FEAT_NMI is present but interrupt controller support is
>> absent, request_percpu_nmi() can fail.
>>
>> One way to prevent this would be to extend ipi_should_be_nmi() to also
>> check for interrupt controller support. However, since falling back to
>> an ordinary IRQ is acceptable, treat ipi_should_be_nmi() as a hint
>> instead. Whether an IPI is actually registered as an NMI is determined
>> by the success or failure of request_percpu_nmi(). If the request
>> fails, fall back to request_irq().
>>
>> Track which IPIs were actually registered as NMIs and use that state
>> in the per-CPU enable and disable paths. This avoids calling the
>> percpu NMI helpers for an IPI that fell back to regular IRQ handling.
>>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> 
> Should we replace ipi_should_be_nmi() with test_bit(ipi,
> get_ipi_nmi_bitmap(cpu) in smp_send_stop()?
> 

Right. We can do something like

@@ -1312,7 +1328,7 @@ void smp_send_stop(void)
         * If CPUs are still online, try an NMI. There's no excuse for this to
         * be slow, so we only give them an extra 10 ms to respond.
         */
-       if (num_other_online_cpus() && ipi_should_be_nmi(IPI_CPU_STOP_NMI)) {
+       if (num_other_online_cpus() && ipi_is_nmi(smp_processor_id(), IPI_CPU_STOP_NMI)) {
                smp_rmb();
                cpumask_copy(&mask, cpu_online_mask);
                cpumask_clear_cpu(smp_processor_id(), &mask);

where 

+#define ipi_is_nmi(__cpu, __ipi) test_bit(__ipi, get_ipi_nmi_bitmap(__cpu))

can be used in other places to simpify the code 

> irq_desc_get_irq(get_ipi_desc(cpu, ipi)) has been used more than 3
> times, can we define a new macro for use?
> 
> git grep "irq_desc_get_irq(get_ipi_desc(cpu, ipi))"
> arch/arm64/kernel/smp.c:
> enable_nmi(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> arch/arm64/kernel/smp.c:
> enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> arch/arm64/kernel/smp.c:
> disable_nmi_nosync(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> arch/arm64/kernel/smp.c:
> disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
> 
> 

I assume you did grep after full series applied, since
irq_desc_get_irq(get_ipi_desc(cpu, ipi)) comes from LPI flow.

Anyway, we can easily avoid some duplication and get usage
of irq_desc_get_irq(get_ipi_desc(cpu, ipi)) back to two

$ git grep "irq_desc_get_irq(get_ipi_desc(cpu, ipi))"
arch/arm64/kernel/smp.c:        int irq = irq_desc_get_irq(get_ipi_desc(cpu, ipi));
arch/arm64/kernel/smp.c:        int irq = irq_desc_get_irq(get_ipi_desc(cpu, ipi));

Cheers
Vladimir


