Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8207D58CCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiLXe3K01kFt9krWwBcSE2ZH8UWbsrjQMi5Rak0Yy4w=; b=LJpofPvBHyYI2rWXtMafL5jN6D
	4erOnu5Ulxg3quNwRZwwTUs0ZcUZS/L9cC+bVg/yVhCP7/l45AWbDp0aj9N2JFwzPL6cWHc92ycHm
	nCGCL+zl6hyWQC1rNFeUE8Bg7AoxFTR4T6bf/g0PdEd1cJtYTKi3p8hykYGj/E5/lyZKSFIeUVv3w
	jIQ2EHpRCjIT+xyXa2V4AslBzNIsva8DlCg7+C3UDDKV34SS0yZcqwcKASxzaZ9KfRkjW61ywSrpw
	RI56v3ZNtXDxNVdRGuX+KM/fEsa1prOJXqhonnHKIWCZwlHoic9jWQ0ltsccZhP/UvK0mDUU0fne+
	u5zveQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mKT-0000000HaKA-1onH;
	Mon, 23 Mar 2026 20:56:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mKR-0000000HaK4-34WX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 20:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KiLXe3K01kFt9krWwBcSE2ZH8UWbsrjQMi5Rak0Yy4w=; b=CduG2fTz9w9JLXbNwp2wbWW2o1
	X2zB7T9OOkYmML3/go/f9GEyMVZxIxvaVy0YIWbINz//x1R5xclZHkANz28LvnDEIQpFh0IrbE5RZ
	h8XJ5XYP2bcQwDjuvf5cdTdLdZaM1KAvXi9uUYy0JDqAK/YWUBK9GOm6Ch7V9HHyswARSlaIYj3yw
	BGyL9drp6pgwztKvIILTqYgxuVHrP6NoV2ISx1mUKnwT5b/NOnOwClb3CWHTN6Boac85IBx4upcYo
	9S/6Hb5WMJ/Ve+hUYManaOKiTqQFYf9FPUTdDq3JTUfuIsYmoKMkLq+wQbiyBfvJ8qIIJzDn9x978
	mSg8N5fQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mDx-00000002a5j-26Rj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 20:56:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 745ED14BF;
	Mon, 23 Mar 2026 13:49:42 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 790B53F73B;
	Mon, 23 Mar 2026 13:49:43 -0700 (PDT)
Message-ID: <6c3b506e-8cc4-45ad-a801-326886c694c4@arm.com>
Date: Mon, 23 Mar 2026 20:49:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Juan Yescas <jyescas@google.com>, kernel-team@android.com
References: <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <67b32e90-1f60-4bf5-b534-b4a901d5a796@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <67b32e90-1f60-4bf5-b534-b4a901d5a796@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_205242_116519_F44FF110 
X-CRM114-Status: GOOD (  32.04  )
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

On 23/03/2026 5:18 pm, Tudor Ambarus wrote:
> Hi, Robin,
> 
> On 2/28/25 5:46 PM, Robin Murphy wrote:
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index a3b45b84f42b..1cec7074367a 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -414,9 +414,21 @@ static int iommu_init_device(struct device *dev)
>>   	if (!dev_iommu_get(dev))
>>   		return -ENOMEM;
>>   	/*
>> -	 * For FDT-based systems and ACPI IORT/VIOT, drivers register IOMMU
>> -	 * instances with non-NULL fwnodes, and client devices should have been
>> -	 * identified with a fwspec by this point. Otherwise, we can currently
>> +	 * For FDT-based systems and ACPI IORT/VIOT, the common firmware parsing
>> +	 * is buried in the bus dma_configure path. Properly unpicking that is
>> +	 * still a big job, so for now just invoke the whole thing. The device
>> +	 * already having a driver bound means dma_configure has already run and
>> +	 * either found no IOMMU to wait for, or we're in its replay call right
>> +	 * now, so either way there's no point calling it again.
>> +	 */
>> +	if (!dev->driver && dev->bus->dma_configure) {
>> +		mutex_unlock(&iommu_probe_device_lock);
>> +		dev->bus->dma_configure(dev);
>> +		mutex_lock(&iommu_probe_device_lock);
>> +	}
> 
> I was chasing the "something fishy" dev_WARN on a 6.19+ downstream
> android kernel and while looking at the IOMMU code I couldn't help
> myself and ask whether we shall prevent concurrent execution of
> dma_configure().
> 
> It seems to me that while the IOMMU subsystem is executing
> dma_configure(), the deferred probe workqueue can concurrently pick up
> the same device, enter really_probe(), set dev->driver, and execute
> dma_configure(). Is it worth protecting against this?

Yes, it's certainly still possible to hit a false-positive if thread A 
in iommu_device_register()->bus_iommu_probe() races against thread B 
attempting to bind, simply because thread B can set dev->driver long 
before it gets to any point where ends up serialising on 
iommu_probe_device_lock again, so thread A can observe that even while 
it is doing the IOMMU probe in the "correct" context. Other than the 
warning though, it's still functionally OK even if the "wrong" thread 
does end up finishing the probe, at least after 0c8e9c148e29 ("iommu: 
Avoid introducing more races").

> I can try to prove it if needed, using a downstream iommu driver (sigh).
> 
> Thanks!
> ta
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index e61927b4d41f..5f0c1a8064b5 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -461,9 +461,19 @@ static int iommu_init_device(struct device *dev)
>           * already having a driver bound means dma_configure has already run and
>           * found no IOMMU to wait for, so there's no point calling it again.
>           */
> -       if (!dev->iommu->fwspec && !dev->driver && dev->bus->dma_configure) {
> +       if (!dev->iommu->fwspec && !READ_ONCE(dev->driver) &&
> +           dev->bus->dma_configure) {
>                  mutex_unlock(&iommu_probe_device_lock);
> -               dev->bus->dma_configure(dev);
> +
> +               /*
> +                * Serialize with really_probe(). Recheck dev->driver in case a
> +                * driver bound while we were waiting for the lock.
> +                */
> +               device_lock(dev);
> +               if (!dev->driver)
> +                       dev->bus->dma_configure(dev);
> +               device_unlock(dev);

Much as I can't wait to get rid of iommu_probe_device_lock, the main 
reason we still can't rely on device_lock() at the moment is not 
actually the remaining sketchy replay-dependers per the comment in 
__iommu_probe_device(), but more fundamentally that for most IOMMU 
drivers this will deadlock in that same 
iommu_device_register()->bus_iommu_probe() path, when the bus walk 
happens to stumble across the IOMMU device itself, which of course is 
already locked as it's still in the middle of its own driver bind. I 
couldn't see an easy, clean and reliable way to get around that, so that 
can got kicked down the road in order to get the "call of_xlate in the 
right order and make iommu_device_register() actually work" basics 
landed (and start shaking out all these other problems...)

Thanks,
Robin.

> +
>                  mutex_lock(&iommu_probe_device_lock);
>                  /* If another instance finished the job for us, skip it */
>                  if (!dev->iommu || dev->iommu_group)
> (END)


