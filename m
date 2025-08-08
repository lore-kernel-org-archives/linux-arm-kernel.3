Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31D5C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oco9Lqy31tHyV7vYm9EMZfS/Cny6ugcWJqo/ePg++Yg=; b=Y10mtxQMxHCbx35YHLPYRcRhWQ
	/oya2kaqaHD8zHFJ9qjiO9Z7+wwRo5HorqE0f4k4+RXnPZuLlqGa+VXaTkRSSqc9VosKOAv5/SPcD
	xIM1Nq6mU9tYp8QUUZa9qrEl+yt5WY4RfDly4GYshCJhwIA0g7aNrAfuVduTO3MEM9R2xbxbBF7V6
	UV+z7oO5VoOcxq/xzvWSKINwz18GbpWc293aNeZjMPjklTDLyCwgFIY0bV7bEsqiEODbtPgwGvsMy
	h+QKjwp08Kduf+qwie8SibQoehtlCnoWjPIOIubJ17XFZY4VAwhtrcuk+nsGp1W+h+LgKAUA/x1Mr
	D70Z8vPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukO6P-000000031ue-1xvt;
	Fri, 08 Aug 2025 14:29:49 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukO3t-000000031lu-0hOh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 14:27:14 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578ChToB031404;
	Fri, 8 Aug 2025 16:26:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Oco9Lqy31tHyV7vYm9EMZfS/Cny6ugcWJqo/ePg++Yg=; b=m2HPk+PTL9L3Zo/M
	nqrHHWFKO+hj/hwRdCvESXSVU8Bz/8i7tk6r9cmyCsW6lV+6slkqlH5iHQtB9MLm
	7QLfg3WmKi5YQmE5aaxhnCu+wHDNdVaTiy88uPO6rE5eqM4PQ9XeUcTUwGiOnE2b
	bueuzoLYsAdgYZg7HmW9Z0QxhEeXNzrFzFK+OiExjaYGdbjJYoMRZmShBjKg7WVX
	EL9CcF6Jn3vOhMRX9zYi1EoH3BGlmJRiOGp09JL5mTz4MbuJsXGwRtldm0rwu8T5
	aV2l/cFqgZ7ikh+amMJe0I97NnlPDAKZNaM+1kTtSD1bWV0CCJh4vyEfJNWod1O3
	Gpu5fQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48bpx0ckrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 16:26:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7079A4004A;
	Fri,  8 Aug 2025 16:26:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 412B4723BA4;
	Fri,  8 Aug 2025 16:25:40 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 16:25:39 +0200
Message-ID: <07664947-9c4c-49d5-b69e-324091320bf4@foss.st.com>
Date: Fri, 8 Aug 2025 16:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH] irqchip: gic-v2m: Handle multiple MSI base IRQ
 mis-alignment
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <mani@kernel.org>
References: <20250807114759.3966195-1-christian.bruel@foss.st.com>
 <8634a39hg3.wl-maz@kernel.org>
Content-Language: en-US
In-Reply-To: <8634a39hg3.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_072713_499445_C08EF76D 
X-CRM114-Status: GOOD (  30.27  )
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



On 8/7/25 19:20, Marc Zyngier wrote:
> On Thu, 07 Aug 2025 12:47:58 +0100,
> Christian Bruel <christian.bruel@foss.st.com> wrote:
>>
>> The PCI Local Bus Specification (section 6.8.3.4 in Rev 3) allows modifying
>> the low-order bits of the MSI Message Data to encode the interrupt number.
>> However, the base SPI used for allocation may not be aligned to the
>> requested number of irqs.
>>
>> For instance, on STM32MP25 with an initial MSI_TYPER base SPI of 0x16A,
>> allocating a multiple MSI of size 8 with the first two slots reserved, the
>> offset returned is 8, resulting in an MSI DATA base of 0x172.
>> This causes the endpoint device to send a wrong interrupt number:
>>
>> 1st MSI = 0x172 | 0x0 = 0x172
>> 2nd MSI = 0x172 | 0x1 = 0x173
>> 3rd MSI = 0x172 | 0x2 = 0x172 wrongly triggers the 1st MSI
>>
>> The alignment offset can be computed in the gicv2m driver:
>> replacing bitmap_find_free_region() with bitmap_find_next_zero_area_off()
>> to accommodate the required alignment.
> 
> Well, that's only telling half of the story. We get there because the
> SPI range has been allocated in a pretty dumb manner (the starting SPI
> is not a multiple of 32). Pretty damning if you're considering PCI.

Not ideal, agree, but, afaik, alignment is not required to be aligned:

In ARM Base System Architecture Platform Design Document 1.2
"Base SPI number, bits [25:16]
Returns the IMPLEMENTATION DEFINED ID of the lowest SPI assigned to the 
frame. SPI ID values must be in the range 32 to 1020"

> 
>>
>> Without this fix, the workaround is to force the alignment in the DT
>> within the MSI range (if 32 MSIs are mapped from 362 to 393):
>> arm,msi-base-spi = <368>
>> arm,msi-num-spis = <26>
>> with the effect of reducing the number of available MSIs.
> 
> This doesn't really belong here. But the example is pretty wrong
> anyway, because what you need for PCI is the low 5 bits to be clear,
> so that you can allocate 32 MSIs. So your range would start at 384,
> and... oh wait...

For this platform, we never allocate 32 Multiple MSI as the Multiple 
Message CAP is hw defined with 4 (16 Vectors)

OK, I remove the w/a from the log.

> 
>>
>> Change-Id: I316a580755cd1b1684929d2540295f4a45f0532d
> 
> Neither does this.

Urgh

> 
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>> ---
>>   drivers/irqchip/irq-gic-v2m.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
>> index 24ef5af569fe..21a14d15e7a9 100644
>> --- a/drivers/irqchip/irq-gic-v2m.c
>> +++ b/drivers/irqchip/irq-gic-v2m.c
>> @@ -153,14 +153,18 @@ static int gicv2m_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>>   {
>>   	msi_alloc_info_t *info = args;
>>   	struct v2m_data *v2m = NULL, *tmp;
>> -	int hwirq, offset, i, err = 0;
>> +	int hwirq, i, err = 0;
>> +	unsigned long align_mask = (1 << get_count_order(nr_irqs)) - 1;
> 
> Use BIT().

Dropped, we can use nr_irq -1. nr_irqs is a powerof2.

> 
>> +	unsigned long align_off, offset;
>>   
>>   	spin_lock(&v2m_lock);
>>   	list_for_each_entry(tmp, &v2m_nodes, entry) {
>> -		offset = bitmap_find_free_region(tmp->bm, tmp->nr_spis,
>> -						 get_count_order(nr_irqs));
>> -		if (offset >= 0) {
>> +		align_off = tmp->spi_start & info->desc->pci.msi_attrib.multiple;
> 
> Err, no. MSIs are not just PCI only, and there is no reason why you
> should go and rummage into these data structures. That's none of an
> irqchip's business. The correct way to go about this is to consider
> nr_irqs, because that's what you are trying to align for.

OK. Alignment on the max size is too restrictive

> 
> But I really don't get how you compute that offset. 'multiple' is the
> number of bits required to encode the number of vectors. How does this
> work?

Damned, I used multiple as a mask. lets rewrite and use nr_irqs instead, 
as you commented

align_off = basespi - align_down(basespi, nr_irqs)
align_mask = nr_irqs - 1

in the example:

basespi = 0x16A, nr_irqs = 8
align_off = 0x16A-(0X16A & ~7) = 2

bitmap_find_next_zero_area_off() returns the vector at offset 6, which 
allocates the multiple MSI at 0x170, basespi + offset, aligned according 
to the mask

> 
>> +		offset = bitmap_find_next_zero_area_off(tmp->bm, tmp->nr_spis, 0,
>> +							nr_irqs, align_mask, align_off);
>> +		if (offset < tmp->nr_spis) {
>>   			v2m = tmp;
>> +			bitmap_set(v2m->bm, offset, nr_irqs);
>>   			break;
>>   		}
>>   	}
> 
> 	M.
> 

thank you,

Christian


