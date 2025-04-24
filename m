Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937B7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUHdaNcJ1mmIgeNktxS5JRu9AOIFIH8kJkRkB76L/uM=; b=P3aQUQyAg5DlA7gecJiYXYor8Q
	EVdU1SMXCTjRWvX4eHjjhbSoRpYw/CvJrR4jvGBz5cYW1Ut1P8C5bkyiySIytPDhnc7giJsJ6iHX6
	xs4kGAUfDXk6XHQjRIsdNv4UVnGpyQjDhtmIiwTIsO4Vz9u3MslDYuxNwAE1vx1WfoNT0qS8d7Sm+
	VXj1q4nIeQ4tEdfQ0Ox9Q1onTr6cSU/J/j+tsFZlUl8YrgS6ZS5y7XAS34dD2ZqdGEKRHg0OjTorm
	op7VhfgxX4XTnWhCwSjzNKXNDqv1nzIHperM8XU8TFLhxcOknGMfF+xgK0x66ekwlU5ZusXchzq9L
	Gc/DRtkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z4Z-0000000EcC3-2QJD;
	Thu, 24 Apr 2025 16:05:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7x6L-0000000EIeF-1KIz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 13:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bUHdaNcJ1mmIgeNktxS5JRu9AOIFIH8kJkRkB76L/uM=; b=nmch2TSFQsOX989rT7WfbUldYw
	+IVRXeJQdb3VfKf4j/9tVt75/t/x0FzpKGsLrWmGotjhEVm/st/d0A9L3YHV1xcKRaFs94WWrxkbc
	z4/ASZjY33C66NTA1tt76esChd38hCin/9cMKGysnmgEeHYavgl+IF4gukj4xcOvqVqliW2t0ug26
	qRroooH3CnzP3beqLLXTA7QEVXDXV4rt+jYRl5oVIUrIfz+HPytAEkahF0WcMEcEzskAL2aclXJuq
	zIPenIM4pLPcU53TTMyE1sn91XMWbkBJ3OBgjoVESYD0R6jXr3nRnSHh3mcFSUTXGiZtjviEJhAyI
	kAfXNLWQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7x6H-0000000Bp0x-3OTD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 13:58:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B13781063;
	Thu, 24 Apr 2025 06:58:41 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AB5A3F66E;
	Thu, 24 Apr 2025 06:58:41 -0700 (PDT)
Message-ID: <f55869ea-0a96-4cef-b394-7c6bf0359617@arm.com>
Date: Thu, 24 Apr 2025 14:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Johan Hovold <johan@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, Charan Teja Kalla <quic_charante@quicinc.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <Z_jMiC1uj_MJpKVj@hovoldconsulting.com>
 <50a06ba8-0a99-40d2-8601-778ebf451f6a@arm.com>
 <Z_52heGno2Y5M6uF@hovoldconsulting.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z_52heGno2Y5M6uF@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_145850_226837_321B879E 
X-CRM114-Status: GOOD (  32.55  )
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

On 15/04/2025 4:08 pm, Johan Hovold wrote:
> On Mon, Apr 14, 2025 at 04:37:59PM +0100, Robin Murphy wrote:
>> On 2025-04-11 9:02 am, Johan Hovold wrote:
>>> On Fri, Feb 28, 2025 at 03:46:33PM +0000, Robin Murphy wrote:
> 
>>>> @@ -155,7 +155,12 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
>>>>    		dev_iommu_free(dev);
>>>>    	mutex_unlock(&iommu_probe_device_lock);
>>>>    
>>>> -	if (!err && dev->bus)
>>>> +	/*
>>>> +	 * If we're not on the iommu_probe_device() path (as indicated by the
>>>> +	 * initial dev->iommu) then try to simulate it. This should no longer
>>>> +	 * happen unless of_dma_configure() is being misused outside bus code.
>>>> +	 */
>>>
>>> This assumption does not hold as there is nothing preventing iommu
>>> driver probe from racing with a client driver probe.
>>
>> Not sure I follow - *this* assumption is that if we arrived here with
>> dev->iommu already allocated then __iommu_probe_device() is already in
>> progress for this device, either in the current callchain or on another
>> thread, and so we can (and should) skip calling into it again. There's
>> no ambiguity about that.
> 
> I was referring to the this "should no longer happen unless
> of_dma_configure() is being misused outside bus code" claim, which
> appears to be false given the splat below.

That's not an assumption so much as a statement of intent. And really 
it's the other way round anyway, as a reminder that this replay call is 
only still here (unlike in the ACPI path) because there *is* still 
plenty of sketchy usage of of_dma_configure() which I'm wary of breaking.
>>>> +	if (!err && dev->bus && !dev_iommu_present)
>>>>    		err = iommu_probe_device(dev);
>>>>    
>>>>    	if (err && err != -EPROBE_DEFER)
>>>
>>> I hit the (now moved) dev_WARN() on the ThinkPad T14s where the GPU SMMU
>>> is probed late due to a clock dependency and can end up probing in
>>> parallel with the GPU driver.
>>
>> And what *should* happen is that the GPU driver probe waits for the
>> IOMMU driver probe to finish. Do you have fw_devlink enabled?
> 
> Yes, but you shouldn't rely on devlinks for correctness.
> 
> That said it does seem like something is not working as you think it is
> here, and indeed the iommu supplier link is not created until SMMUv2
> probe_device() (see arm_smmu_probe_device()).
> 
> So client devices can start to be probed (bus dma_configure() is called)
> before their iommu is ready also with devlinks enabled (and I do see
> this happen on every boot).

I didn't mean the explicit power management links created by the SMMU 
driver itself, I meant the fwnode links created automatically by 
fw_devlink_link_device() at device_add() time, which infer a 
supplier-consumer relationship from the "iommus" DT property, wherein 
device_links_check_suppliers() would then defer the GPU driver probe 
until the SMMU driver probe has completed successfully probing and 
called device_links_driver_bound().

Except it turns out that "iommus" is one of the optional properties 
which are only linked that way under "fw_devlink=strict", so that 
explains that, fair enough.
>>> [    3.805282] arm-smmu 3da0000.iommu: probing hardware configuration...
> 
>>> [    3.829042] platform 3d6a000.gmu: Adding to iommu group 8
>>>
>>> [    3.992050] ------------[ cut here ]------------
>>> [    3.993045] adreno 3d00000.gpu: late IOMMU probe at driver bind, something fishy here!
>>> [    3.994058] WARNING: CPU: 9 PID: 343 at drivers/iommu/iommu.c:579 __iommu_probe_device+0x2b0/0x4ac
>>>
>>> [    4.003272] CPU: 9 UID: 0 PID: 343 Comm: kworker/u50:2 Not tainted 6.15.0-rc1 #109 PREEMPT
>>> [    4.003276] Hardware name: LENOVO 21N2ZC5PUS/21N2ZC5PUS, BIOS N42ET83W (2.13 ) 10/04/2024
>>>
>>> [    4.025943] Call trace:
>>> [    4.025945]  __iommu_probe_device+0x2b0/0x4ac (P)
>>> [    4.030453]  iommu_probe_device+0x38/0x7c
>>> [    4.030455]  of_iommu_configure+0x188/0x26c
>>> [    4.030457]  of_dma_configure_id+0xcc/0x300
>>> [    4.030460]  platform_dma_configure+0x74/0xac
>>> [    4.030462]  really_probe+0x74/0x38c
>>
>> Indeed this is exactly what is *not* supposed to be happening - does
>> this patch help at all?
>>
>> https://lore.kernel.org/linux-iommu/09d901ad11b3a410fbb6e27f7d04ad4609c3fe4a.1741706365.git.robin.murphy@arm.com/
> 
> I've only seen that splat once so far so I don't have a reliable
> reproducer.
> 
> But AFAICS that patch won't help help here where we appear to have iommu
> probe racing with bus dma_configure() called from really_probe() for the
> client device.

Well, tightening up __iommu_probe_device() would stand to slightly 
reduce the window in general while bus_set_iommu() is running. However 
you're right that this is a different race from the ones implicated 
there. I have now managed to provoke it on my Juno board with 
"driver_async_probe=*" (which does also require that patch for other 
reasons), and I think I've got a reasonable fix which I shall finish 
writing up and send shortly. Thanks for helping me nail this one down!

Cheers,
Robin.

