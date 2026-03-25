Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539C6109C032
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JZkJBuEw+EXbB73sF5OtJNh4qN6mpeSRAG7JyyK6cI=; b=IAPxYB+NLl7FvNAEkutHZBDYHi
	lWUB8DDJ0VwqZbo9RlYxsDKVaTWwjEr0lBzs2WdAeGWvysRc78nU35Zfc0ogcUNx50PQ7VzRcZhIb
	3JYv0UJ6N2OUt8zHeNNFr9Cm1ktMhssq6T5FHAGzxY0cn8puSCK+zw8Ol5M8p/mLBG/5n4BWJ+HNb
	baH+sRyfPOkN0qDjsTVpOQJg7ySuJ6I8QTyBeMZZwmRW/75OdAY4C2t/N7DyRRDqYnGfOWam4ztq4
	RJre40lUHDu0vlAI01Vm0tt2qxa+za8Dqv3p0u2KK8LVEqr/PCcTfZdjjdowY1GEZb9AYwFzIqqWj
	gCgdmz+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PjR-00000003jjh-0DJJ;
	Wed, 25 Mar 2026 15:01:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PjO-00000003jjI-28oR;
	Wed, 25 Mar 2026 15:01:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83BB71F02;
	Wed, 25 Mar 2026 08:01:04 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D6593F836;
	Wed, 25 Mar 2026 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774450870; bh=a7NQo/J5/P/f7hvVR9hFwmXxRr8gN1CEw3zHucCtG6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A77I9OvdXlmLDiJez4OCMEu8JDK+WdvvCxiw4WdyCjbqtkPbM/2taq6tqrEV7Ensx
	 HoTtVacINsb04xlQr5Gqblc/b9qoCkcn3FLboV5jbbjUkTf5rgQtPSlp2N5GvTg8mP
	 pByNNPT7pUL1bhsJ/rC+H4PMArqPLI55OfvwwePE=
Message-ID: <6cc25c83-6a5a-4785-9573-335371a94798@arm.com>
Date: Wed, 25 Mar 2026 15:01:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>,
 Grimmauld <grimmauld@grimmauld.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev,
 Lukas Wunner <lukas@wunner.de>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
 <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org>
 <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com> <acNgUoWWMCi1oLU4@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <acNgUoWWMCi1oLU4@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_080114_647207_1EEFF668 
X-CRM114-Status: GOOD (  35.98  )
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

On 25/03/2026 4:13 am, Dmitry Torokhov wrote:
> On Thu, Mar 12, 2026 at 12:48:36PM +0000, Robin Murphy wrote:
>> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
>>> On Wed Mar 11, 2026 at 1:28 PM CET, Manivannan Sadhasivam wrote:
>>>> On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
>>>>> On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
>>>>>> I have a contrary view here. If just a single driver or lib doesn't handle async
>>>>>> probe, it cannot just force other drivers to not take the advantage of async
>>>>>> probe. As I said above, enabling async probe easily saves a few hunderd ms or
>>>>>> even more if there are more than one Root Port or Root Complex in an SoC.
>>>>>
>>>>> Then the driver or lib has to be fixed / improved first or the driver core has
>>>>> to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is requested
>>>>> from an async path, etc.
>>>>>
>>>>> In any case, applying the patch and breaking things (knowingly?) doesn't seem
>>>>> like the correct approach.
>>>>>
>>>>>> I strongly agree with you here that the underlying issue should be fixed. But
>>>>>> the real impact to end users is not this splat, but not having the boot time
>>>>>> optimization that this patch brings in. As an end user, one would want their
>>>>>> systems to boot quickly and they wouldn't bother much about a harmless warning
>>>>>> splat appearing in the dmesg log.
>>>>>
>>>>> You mean quickly booting into a "harmless" potential deadlock condition the
>>>>> warning splat tries to make people aware of? :)
>>>>>
>>>>
>>>> Hmm, I overlooked the built-as-module part where the deadlock could be possible
>>>> as indicated by the comment about the WARN_ON_ONCE().
>>>>
>>>> But what is the path forward here? Do you want the phylib to fix the
>>>> request_module() call or fix the driver core instead?
>>>
>>> Here are a few thoughts.
>>>
>>> In general, I think the best would be to get rid of the (affected)
>>> PROBE_FORCE_SYNCHRONOUS cases.
>>>
>>> Now, I guess this can be pretty hard for a PCI controller driver, as you can't
>>> really predict what ends up being probed from you async context, i.e. it could
>>> even be some other bus controller and things could even propagate further.
>>>
>>> Not sure how big of a deal it is in practice though, there are not a lot of
>>> PROBE_FORCE_SYNCHRONOUS drivers (left), but note that specifying neither
>>> PROBE_FORCE_SYNCHRONOUS nor PROBE_PREFER_ASYNCHRONOUS currently results in
>>> synchronous by default.
>>>
>>> (Also, quite some other PCI controller drivers do set PROBE_PREFER_ASYNCHRONOUS
>>> and apparently got lucky with it.)
>>>
>>>   From a driver-core perspective I think we're rather limited on what we can do;
>>> we are already in async context at this point and can't magically go back to
>>> initcall context.
>>>
>>> So, the only thing I can think of is to kick off work on a workqueue, which in
>>> the end would be the same as the deferred probe handling.
>>
>> Hmm, in fact, isn't the deferred probe mechanism itself actually quite
>> appropriate? A suitable calling context isn't the most obvious "resource
>> provider" to wait for, but ultimately it's still a case of "we don't
>> have everything we need right now, but it's worth trying again soon".
>> I may have missed some subtleties, but my instinct is that it could
>> perhaps be as simple as something like this (completely untested).
>>
>> Cheers,
>> Robin.
>>
>> ----->8-----
>>
>> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
>> index bea8da5f8a3a..3c4a0207ae3f 100644
>> --- a/drivers/base/dd.c
>> +++ b/drivers/base/dd.c
>> @@ -954,6 +954,16 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
>>   	if (data->check_async && async_allowed != data->want_async)
>>   		return 0;
>> +	/*
>> +	 * Bus drivers may probe asynchronously, but be adding a child device
>> +	 * whose driver still wants a synchronous probe. In this case, just
>> +	 * defer it, to be triggered by the parent driver probe succeeding.
>> +	 */
>> +	if (!async_allowed && current_is_async()) {
>> +		driver_deferred_probe_add(dev);
>> +		return 0;
>> +	}
> 
> That means that you are kicking the majority devices (for now) into
> deferral path. I do not think this is optimal.

And probing drivers under conditions where they may go wrong or deadlock 
is better? I've not yet had a chance to actually test this myself to see 
the effect on timings, but whatever it might be, I can't imagine any 
*other* method of re-serialising child driver probes could be 
significantly better (or if it could be, that might represent some 
improvement we could make to the deferred probe mechanism in general 
anyway).

I have finally got a bit of time this afternoon to pick this up again, 
so I'll have a play and try to finish the write-up capturing all the 
reasoning so far (it's a long one...)

> Does phy really need to request modules synchronously (and on its own)?
> Why can't it rely on udev to load the modules and signal when phy
> devices are ready?

Getting hung up on what phylib does in this one particular case is 
rather missing the point. There is a reason that we're still not forcing 
async_probe on for everything by default. Many drivers will still not 
have been tested and validated to handle it correctly, and while the 
majority of latent issues will likely just be concurrency bugs which can 
be fixed with better locking or whatever, even then we should be 
encouraging developers to actively test and look for such bugs to make 
their drivers "async probe clean", rather than knowingly enabling bugs 
to surface in the wild as weird and subtle breakage on end-user systems.

However, I imagine there will always remain some small minority of 
PROBE_FORCE_SYNCHRONOUS drivers - either for niche legitimate technical 
reasons, or just legacy drivers where updating them would take more 
effort than it's worth - so the driver core surely needs the ability to 
not do the wrong thing itself. That doesn't even need to be "optimal", 
it just needs to be functionally correct.

Thanks,
Robin.

> 
> Seems like a deficiency on PHY subsystem that is stuck in times long
> past.
> 
> Thanks.
> 


