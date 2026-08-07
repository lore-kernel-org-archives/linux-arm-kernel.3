Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D17C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqjTdDbfAh81cihgLeXPIFth2NV89FgMITLQIuRe9nw=; b=qoAMRJ9nSraz71emcVNq4Bn3p8
	1gvMp6SQSVha0mceGP1WPLP80nlsP6N2A/glPmpr337ZxYr7nENPAeI90fO9JSGCU+tpOtApDdRIl
	5CjcbPPZ/i1ZcJmhLMEBlYeF9HLPai8IDr6/AQxNf1MzW90M0S2aLZuA6dKcGrwNWkhCyqKDFGSgZ
	lDPZiggQyBp3aaL6iuJMhcx8DF5x3+bMAQYK9ZxbKEm7HqFwqRwz4Hm5/GWs/ba2Rh0sBsveNh/iE
	ls1bnRUIAQRmzt22fDBHFLYZTqdkcqo3zLdBF4CNqM1voooJ509ewEh0MaCP0AW1BHMYCSjM+H6OH
	cfDUlJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJgR-000000080w5-2kzx;
	Fri, 07 Aug 2026 12:28:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsJgO-000000080vk-3WMy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 12:28:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA56114BF;
	Fri,  7 Aug 2026 05:28:11 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CDE03F9A2;
	Fri,  7 Aug 2026 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786105695; bh=6I4SWIAHsSLH8KOaJRz3ORSo2/3f+1ZbrQYVMUe05WE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=giEkdCNvg29n4UFNIBEcgyDl89ydQCejdL0QICGX3S0WkH9tgY8tqNR3z0jqnEHlt
	 9C0LM6OAQ0bk64o0rGQbXmJq/aH+8rDl8f6FYgNSy4EMXTdcBJC3qnwTxFaxrJIgsD
	 vH3cvWNuJTrNzw1l/1GhTbOFvklkps/OTgexXU9Y=
Message-ID: <4d64e4aa-91ac-4df6-af52-31983517eaf5@arm.com>
Date: Fri, 7 Aug 2026 13:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 45/45] irqchip/gic-v5: Add NMI support for IPIs
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 will@kernel.org, catalin.marinas@arm.com, ruanjinjie@huawei.com,
 liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-46-vladimir.murzin@arm.com>
 <861pcab5gf.wl-maz@kernel.org> <5a78805e-ce2b-4571-a162-9e713f4c0678@arm.com>
 <86y0ei9p0c.wl-maz@kernel.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <86y0ei9p0c.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_052817_004192_59A76660 
X-CRM114-Status: GOOD (  13.50  )
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

On 8/7/26 11:57, Marc Zyngier wrote:
> On Fri, 07 Aug 2026 11:42:12 +0100,
> Vladimir Murzin <vladimir.murzin@arm.com> wrote:
>> On 8/7/26 11:17, Marc Zyngier wrote:
>>> On Mon, 27 Jul 2026 17:34:53 +0100,
>>> Vladimir Murzin <vladimir.murzin@arm.com> wrote:
>>>> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
>>>> index 7eb07e3bdb4c..0091bb5f7662 100644
>>>> --- a/kernel/irq/manage.c
>>>> +++ b/kernel/irq/manage.c
>>>> @@ -1370,9 +1370,14 @@ static bool irq_supports_nmi(struct irq_desc *desc)
>>>>  	struct irq_data *d = irq_desc_get_irq_data(desc);
>>>>  
>>>>  #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
>>>> -	/* Only IRQs directly managed by the root irqchip can be set as NMI */
>>>> -	if (d->parent_data)
>>>> -		return false;
>>>> +	struct irq_data *data;
>>>> +	/*
>>>> +	 * Only IRQs directly managed by the root irqchip can be set
>>>> +	 * as NMI unless we inherit NMI from parent
>>>> +	 */
>>>> +	for (data = d->parent_data; data; data = data->parent_data)
>>>> +		if (!(data->chip && data->chip->flags & IRQCHIP_SUPPORTS_NMI))
>>>> +			return false;
>>> Maybe we should just trust the local irqchip to do the right
>>> thing. After all, the core code shouldn't be in the business of
>>> sanitising broken irqchip drivers advertising random crap.
>>>
>> That is indeed bit I was not really sure about, if we decide that we
>> can trust local irqchip then I assume we just drop the check?
> Yup. Drop the CONFIG_IRQ_DOMAIN_HIERARCHY hack, and only consider the
> local information.
> 

Got it! Thanks!

Vladimir

> Thanks,
> 
> 	M.
> 
> -- Without deviation from the norm, progress is not possible.
> 


