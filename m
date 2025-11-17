Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF372CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIXtQybxSOObCEANkLxpOssJZPOER5Nz0T8va9qLos8=; b=jj2DW1F2nz4OMiOBin5YQ0Gk/C
	+01Oz0VJnlStacG4Exty5OqRz6q69UoGg1V3lALsyFxN3tMPz/kE1SHEaAyOEtubZOPx4hwafAZwP
	vNvwe1R7fXUYE/9IFEdJ3aZ5aZhHLKtzNFwMUQPjYKjCcFcNvo4St0Qm9b6i+eyTtokqF1x4hWVyE
	wjYESuEVIeGLubbs9I4oLmjBVYXvc7wQFnjAbT/1QL7rs9a3bOL/4uHU53BGaqXo/Nr8wauMjRbsl
	1bTETwv3/5i0xMcpUn8fJ5H8fKpEfG8k5noMU8o7Oo96rV6JnzQl5/Vcksd9TclaEbp5zuhd7GFrv
	yRkC3wug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwLm-0000000FsN7-3UOS;
	Mon, 17 Nov 2025 10:20:46 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwLj-0000000FsMS-3kvu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 10:20:45 +0000
Message-ID: <dbedc671-167e-4eb9-8d2c-bf04258621d6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763374840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIXtQybxSOObCEANkLxpOssJZPOER5Nz0T8va9qLos8=;
	b=bmd/jr39XxeGfacfnjZjDUpDpZEnPZuMV86cEsNKb9P3bVoOZo+Wvis2sCQTk8JHKJV8Xr
	Tyx1kKDKUSzH7VOUUAGVfARLUCT4DZtoac28Lk4w+OuPE0spXK5QEia7EC7EgRqIXSy/BA
	SWW7MttnypbMEpLX73d55+1DmVYCWg4=
Date: Mon, 17 Nov 2025 18:20:27 +0800
MIME-Version: 1.0
Subject: Re: [PATCH V2] clocksource/drivers/rda: Add sched_clock_register for
 RDA8810PL SoC
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-kernel@vger.kernel.org, enlin.mu@unisoc.com
References: <20251107063347.3692-1-enlin.mu@linux.dev>
 <jdok5u7aryu6n6aleeox6cy5epkvxdrdnklxzo3kbuffhrifir@qdkvdk67o3lq>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "enlin.mu" <enlin.mu@linux.dev>
In-Reply-To: <jdok5u7aryu6n6aleeox6cy5epkvxdrdnklxzo3kbuffhrifir@qdkvdk67o3lq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_022044_377275_90B80542 
X-CRM114-Status: GOOD (  19.15  )
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



On 2025/11/17 17:36, Manivannan Sadhasivam wrote:
> On Fri, Nov 07, 2025 at 02:33:47PM +0800, Enlin Mu wrote:
>> From: Enlin Mu <enlin.mu@unisoc.com>
>>
>> The current system log timestamp accuracy is tick, which can not
>> meet the usage requirements and needs to reach nanoseconds.
> 
> Which 'usage requirement' you are referring here?
Hi Mani

When using this chip,the timestamp accuracy of the kernel log is tick,
which makes it difficult to analyze some system exceptions.
Therefore, it is neccessary to adujst the accuracy of the sched_clock 
function.

> 
>> Therefore, the sched_clock_register funciton needs to be add.
>>
>> Signed-off-by: Enlin Mu <enlin.mu@unisoc.com>
> 
> But I'm happy to see a patch from Unisoc for RDA Micro SoC :)
> 
> - Mani
> 
>> ---
>>   drivers/clocksource/timer-rda.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clocksource/timer-rda.c b/drivers/clocksource/timer-rda.c
>> index fd1199c189bf..0be8e05970e2 100644
>> --- a/drivers/clocksource/timer-rda.c
>> +++ b/drivers/clocksource/timer-rda.c
>> @@ -13,6 +13,7 @@
>>   
>>   #include <linux/init.h>
>>   #include <linux/interrupt.h>
>> +#include <linux/sched_clock.h>
>>   
>>   #include "timer-of.h"
>>   
>> @@ -153,7 +154,7 @@ static struct timer_of rda_ostimer_of = {
>>   	},
>>   };
>>   
>> -static u64 rda_hwtimer_read(struct clocksource *cs)
>> +static u64 rda_hwtimer_clocksource_read(void)
>>   {
>>   	void __iomem *base = timer_of_base(&rda_ostimer_of);
>>   	u32 lo, hi;
>> @@ -167,6 +168,11 @@ static u64 rda_hwtimer_read(struct clocksource *cs)
>>   	return ((u64)hi << 32) | lo;
>>   }
>>   
>> +static u64 rda_hwtimer_read(struct clocksource *cs)
>> +{
>> +	return rda_hwtimer_clocksource_read();
>> +}
>> +
>>   static struct clocksource rda_hwtimer_clocksource = {
>>   	.name           = "rda-timer",
>>   	.rating         = 400,
>> @@ -185,6 +191,7 @@ static int __init rda_timer_init(struct device_node *np)
>>   		return ret;
>>   
>>   	clocksource_register_hz(&rda_hwtimer_clocksource, rate);
>> +	sched_clock_register(rda_hwtimer_clocksource_read, 64, rate);
>>   
>>   	clockevents_config_and_register(&rda_ostimer_of.clkevt, rate,
>>   					0x2, UINT_MAX);
>> -- 
>> 2.39.5
>>
> 


