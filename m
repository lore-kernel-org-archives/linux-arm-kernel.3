Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68888CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gfsXVx+/8n9oPrKU+lyRhGLVz9mpk44PSRn01hrAC0=; b=i821cNKKj+frXcCXoT+u3DBqTw
	rbvXCWMQ8R8DIVMwehz7YbEUprT2jW3Y+QxWEtbqma5pSJNnz4q9k1zXT8B66RE3zUbHZ9uiZs7jO
	U8r6KsVSAJr32AmvFXJ76E0rnXOLXP7drCcWB7WItas+WvO8PgFYHfBQj9/GwrNIkWU7tkvdzB3Wz
	dEMiZv8vczXGIvfE563rpZYTt7QRe9tnnUUTKkbB1vKksl3tnhczNxDtzj0l2J8/OuhyqeDuBzJcy
	fglQMPTxgJfKBos9bN6wWEQqwAeM9IfbQKJfJNvMWxZ6gq3i5LTqgeawI86OEKno5GYlohqLB8xmT
	T9BRErQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7t6-000000017qD-3MPv;
	Tue, 06 Oct 2026 16:19:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7t4-000000017pB-1Xzk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:19:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42FE9143D;
	Tue,  6 Oct 2026 09:19:24 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2730B3F66F;
	Tue,  6 Oct 2026 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791303567; bh=XNv7I0MkTwHx+tdM3j/fp7moNAcgOO1BV5Xs65yK//M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u6IGDAwbX+uzfksBglkc459aOBENYG3WKamYJZ2EUmHMu5c2qyLb2JfJki+0kRs5y
	 w2i0OHp7bOzXi8oRnzEcPBhVMGQV0kYHt0qyv0g59LHLeeIvgLzCYZFal4GzYagEoB
	 o0DQvByaa1Bs3yoLzwzcvNh+k7oPl3/SBX12MkiQ=
Message-ID: <d1720b63-65bf-4019-bc19-1852555f7993@arm.com>
Date: Tue, 6 Oct 2026 17:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
 linux-watchdog@vger.kernel.org
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arZDwutoadki7tiZ@ashevche-desk.local> <arZNL9BnTGK0Klwc@red-moon>
 <arZS4vwxps01dGb7@ashevche-desk.local> <arqSqcoWAkhy-8do@red-moon>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <arqSqcoWAkhy-8do@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_091930_586671_50789079 
X-CRM114-Status: GOOD (  31.08  )
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

On 28/09/2026 5:15 pm, Lorenzo Pieralisi wrote:
> On Fri, Sep 25, 2026 at 01:54:26PM +0300, Andy Shevchenko wrote:
>> On Fri, Sep 25, 2026 at 12:30:07PM +0200, Lorenzo Pieralisi wrote:
>>> On Fri, Sep 25, 2026 at 12:49:54PM +0300, Andy Shevchenko wrote:
>>>> On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:
>>
>> ...
>>
>>>>> +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
>>>>> +						  const char *propname,
>>>>> +						  unsigned int index, u32 *value)
>>>>> +{
>>>>> +	u32 *values;
>>>>> +	int ret, count;
>>>>> +
>>>>> +	count = fwnode_property_count_u32(fwnode, propname);
>>>>> +	if (count < 0)
>>>>> +		return count;
>>>>> +
>>>>> +	if (index >= count)
>>>>> +		return -ENOENT;
>>>>> +
>>>>> +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
>>>>> +	if (!values)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
>>>>> +	if (!ret)
>>>>> +		*value = values[index];
>>>>
>>>> Use standard pattern, id est
>>>>
>>>> 	if (ret)
>>>> 		...
>>>>
>>>>> +	kfree(values);
>>>>
>>>> You want to use __free()
>>>>
>>>>> +	return ret;
>>>>> +}
>>>>
>>>> I believe the whole approach is suboptimal, if you wish get indexed value (but why?)
>>>
>>> Why what (that's what the irq_get() interface requires ?) I agree it is
>>> suboptimal - the whole point of the series is an RFC on using properties
>>> to store GSI number/flags, then how to read them we will optimize it
I>>> when/if we agree that's the approach to be taken.
>>
>> Why to have indexed APIs. The callers usually do not want a single item from an
>> array, they want all of them or a big pile (exception is the array of strings,
>> but we have matching functions for that).
>>
>> As per approach, this patch is against device property and I don't think we are
>> going to agree on the approach taken in *this* patch.
> 
> Coming back to this, what is needed here is a way to stash the GSI number,
> flags and name in stardard storage (like OF nodes IRQ properties, ACPI objects
> _CRS, etc).
> 
> To give you some background, I thought about adding an array of:
> 
> GSI [number, flags, name]
> 
> to the ACPI static fwnode itself. Then basically the irq_get() API has got
> all the information it needs from the primary fwnode; while doing that I
> thought that this might have been a bit like reinventing software nodes
> (granted, software node properties are ways more general that what I suggest
> above and I don't expect any other property to be ever added to static fwnodes)
> that's why I put together the series as it is, precisely to understand what's
> best.
> 
> When you say "against device property", what do you mean precisely ?
> 
> I suppose you mean that this approach goes against software node properties
> usage guidelines ?
> 
> Anyway, again, it is just to provide some context, we are talking about
> a bunch of platform devices, it is nice to have a generic solution but
> it has to be simple enough too given its scope, I understand very well
> your concern with this approach as-is - it is there to find a way
> forward together and show what the problem is.

I guess software node properties look inviting in theory since they're a 
ready-made mechanism for effectively attaching arbitrary data to a 
fwnode, however looking at patches 6-7 and the amount of boilerplate 
involved in the reality, I'm inclined to think that a dedicated 
structure for static nodes is probably the best and most efficient 
compromise here. The redundancy argument rather falls apart once we end 
up creating copies of those contentiously-made-up property name strings 
for every node, especially given that any one of those alone is probably 
already more than the amount of actual data we need per node...

Perhaps the "purest" option might be to just store a function pointer in 
the fwnode wrapper for each static table type to provide its own 
internal irq_get() callback, so not stashing intermediate GSI data at 
all, but I suspect that might end up being more work overall.

Cheers,
Robin.

> 
> Thanks,
> Lorenzo
> 
>>>> it needs to be retrieved as that in the guts of ACPI. Allocating memory for the whole
>>>> array to retrieve a single element is simply wrong.
>>
>> ...
>>
>>>>> +#define ACPI_IRQ_PROP_GSI		"linux,acpi-gsi"
>>>>> +#define ACPI_IRQ_PROP_GSI_TRIGGER	"linux,acpi-gsi-trigger"
>>>>> +#define ACPI_IRQ_PROP_GSI_POLARITY	"linux,acpi-gsi-polarity"
>>>>
>>>> Oh... This sounds like a big ugly hack.
>>>
>>> That does not help much I am afraid.
>>>
>>> What's a ugly hack ? Property names ? Using properties for this purpose ?
>>
>> Yes, properties started with "linux," for some core functionality.
>> Yes, using properties for this also doesn't sound right. I think the problem
>> here is in the table specifications or somewhere that deep. That's why we
>> ended up in this series.
>>
>>> Again, it is an RFC for this specific reason and I mentioned that in the
>>> cover letter, thank you for your inputs.
>>
>> And here we have a discussion started :-)
>>
>> P.S. Looks like I was too quick to jump into this thread. I will wait for
>> others to share their view on all this.
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
>>
>>


