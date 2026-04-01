Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78272D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCRyd9qleOZMVIjgK7RhQpHFpKKn7hN1W8j3Towy8nQ=; b=H/lt70QeeS2MCo9xwXlCGNEVG1
	z/oxwg7zryylM/i9YJW6Yk1Mdx/VlX39bh7JikCr9+0iev5EFsZvQ38yiZWIQ2NpxjXKB6BofzQmc
	A1Fcf6Aq2xAP61FBoghdn6VpvHQZeYnp/27+qcOtpliUiwKdWuffvRZVS5SjItvrqysKJOjdCrT79
	Fsd+MI69p+PPElL72OoxDRPxiRv4sAW9P2baCR7GpOE2nnCogju01EWSyR6kB0OAfD51z3rdHmCXC
	G76Eb3MV+vFXYkY+O89ZwL55nG8V7Hj7O3LVM+GCPuk2zaCYBVadHMzGZ7zhEG3AQdvgdO0A5vYan
	kxNxwjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5L-0000000EiiO-1g61;
	Wed, 01 Apr 2026 11:50:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5K-0000000Eih9-33Fv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 11:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yCRyd9qleOZMVIjgK7RhQpHFpKKn7hN1W8j3Towy8nQ=; b=pe+EiyqlkLGIn2oJXVJQD76wVJ
	duv08useazM9k5qlrxLKYIfc2EhF5xMATlg+AvdOyvavW2lOPIv5RgbLcrlFg4+u289k2Utx6/ftM
	grMadwtZ3dqtyEhy6fqQ5g3pJpiPMIOxBlQQG4sW+n0vfNC9iRLRelC+gwFTBgeQLOuK5sQ/gitXt
	i+9xBPMtT62seig8/ucm1kLtlRkiu2szcNDK6zaVg7WSxSFFFySgRI+FkpjasnOEqbAOYcQpL5zbP
	EAvUeWm3rZTchV+S0iylPhgPugzx22Hxajyxlt5PfY9wm18CbD+GmO0v+xcR/S1geftgQ2l1BFqo3
	z83XmiFw==;
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5G-00000000FKj-2y69
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:50:09 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8cb40149037so749905985a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775044204; x=1775649004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCRyd9qleOZMVIjgK7RhQpHFpKKn7hN1W8j3Towy8nQ=;
        b=vMT6m49iSG7OANyIv1b2OAYKUc5jOjXOYP+hNoBjgzfDIukASaRRBRrTxmJOmfHUTS
         5Rt8MO/iEbKMmR3hSP6HEaQevo7qe13JX3CHfUM+vus+ySEhVnIUccaURaEAKglc7Kev
         nfkrXCQMxyeKvdHx8WP6auelgdLXYD4LvHL030LAHOZ46T8ys7IDF6r+g/UH8QPzhGLu
         jrflqARnXpJpJh5bpoCdbQd5lRwqnnJzBM/Ob9V4GvNZePl5CH0HPkHt24zuwATBv4zX
         bwHXG2EbWz0Y9aL0YNoq/q3ruMA8mJ9yQ913NrnsUoi9lE07yWYxP9TkiPo+TFMbDnN7
         fd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775044204; x=1775649004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCRyd9qleOZMVIjgK7RhQpHFpKKn7hN1W8j3Towy8nQ=;
        b=J84v0u4I/I+7yRdZgqgilwpJxLKZJmLTCHyIS1o9Yl2ehdTZQsRVcwYAN/f8R1X1Uh
         waly262yXeD1Bewtv0KcfVQi5pSzjGzHlwcgst6h1Sz64b0kSPmgZi6Y1DWJm94rFNc0
         RWQLoMMQq8kS3Wp4+62wXwQntJDgKub1yc+u3xzzDKJ1bBWxkrxoF8j61mr/nLpNKjJj
         CLFB6PzyoApeJTI4w07VlzSo8sHUZnnXbO4XEI83FmcxwtB/p7Ezp5L1nSbF8DWohVCO
         jUnTmcAZ07f6bj/c4LTOj7TPcZgc0ZeQ002BaPWOZKSTA+jLEaxQI7GIBch/NXmZQK3n
         +QnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaonwtltg3rqzFLKJKPOqObsjtrgH3qKws/XNhUkmlNJWzQQ+i/b3anj70JxzS7aJqQqiGWOmHm7uGVIq4M2ow@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrb6hYtXkSLlcY2eBWprj7YcvQRRTEmXfhB0NdIZa1vI62mlR1
	NPFCg9hJ1UYSUDZbs4r9lvJFElG70RWJHv8lUOJWRG1w0Fui+rL/AoPtwrcfJJruzyY=
X-Gm-Gg: ATEYQzw7YnEqSf64Wldfo15uSilitviEnwGaGfBswUZLiiGWARQUfhN50TT0E3zk5Wb
	RMyZJizmhJZ8vmcfMBIhYFut8oRJit70B9rlb95lJELq8bbhESIsANFfriijDyjBs8ied1cYBI9
	DsULYup35z0oKldw9AsRcw490OUzEDKomPqhwFmkN0b5Wqpe5GtXab+rkrTn4TN870uH+ftyeSv
	Yf+Gl5hJpe89m1SORK/PtwAu0B9twph/Mez/nnCUEBdZWppWw4PiEyAg6Xd81C70aakfEDmvQ7A
	paHvM2wm7TbZYexIKYJZGta9jQ1T6H9XS+nqeE8er/oD8lq2ZwKGcSjgGB4JvmrwIrRKjTKyXV8
	hNqhhisqRUQdhDQx+cVQl8tMcnAcyzvjB6MfDYm4u2hh3zXfjXZe8Wf34iq6A01eEI8f4GBGSZH
	nafUuEGag3KJKNkFOJKyaS5XyXK8GaMAQ=
X-Received: by 2002:a05:620a:6910:b0:8cd:b90f:fc16 with SMTP id af79cd13be357-8d1b5c6bf23mr447046685a.68.1775044203818;
        Wed, 01 Apr 2026 04:50:03 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027db4770sm1309221285a.0.2026.04.01.04.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:50:03 -0700 (PDT)
Message-ID: <e011f298-cec4-4c6e-94e8-ce533642a3f8@linaro.org>
Date: Wed, 1 Apr 2026 14:49:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Robin Murphy <robin.murphy@arm.com>,
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
 <6c3b506e-8cc4-45ad-a801-326886c694c4@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6c3b506e-8cc4-45ad-a801-326886c694c4@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125006_909905_13B40B13 
X-CRM114-Status: GOOD (  31.41  )
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

Hi, Robin,

Thanks a lot for the educative answers!
And sorry for the late reply, I got sidetracked.

On 3/23/26 10:49 PM, Robin Murphy wrote:
> On 23/03/2026 5:18 pm, Tudor Ambarus wrote:
>> Hi, Robin,
>>
>> On 2/28/25 5:46 PM, Robin Murphy wrote:
>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>> index a3b45b84f42b..1cec7074367a 100644
>>> --- a/drivers/iommu/iommu.c
>>> +++ b/drivers/iommu/iommu.c
>>> @@ -414,9 +414,21 @@ static int iommu_init_device(struct device *dev)
>>>       if (!dev_iommu_get(dev))
>>>           return -ENOMEM;
>>>       /*
>>> -     * For FDT-based systems and ACPI IORT/VIOT, drivers register IOMMU
>>> -     * instances with non-NULL fwnodes, and client devices should have been
>>> -     * identified with a fwspec by this point. Otherwise, we can currently
>>> +     * For FDT-based systems and ACPI IORT/VIOT, the common firmware parsing
>>> +     * is buried in the bus dma_configure path. Properly unpicking that is
>>> +     * still a big job, so for now just invoke the whole thing. The device
>>> +     * already having a driver bound means dma_configure has already run and
>>> +     * either found no IOMMU to wait for, or we're in its replay call right
>>> +     * now, so either way there's no point calling it again.
>>> +     */
>>> +    if (!dev->driver && dev->bus->dma_configure) {
>>> +        mutex_unlock(&iommu_probe_device_lock);
>>> +        dev->bus->dma_configure(dev);
>>> +        mutex_lock(&iommu_probe_device_lock);
>>> +    }
>>
>> I was chasing the "something fishy" dev_WARN on a 6.19+ downstream
>> android kernel and while looking at the IOMMU code I couldn't help
>> myself and ask whether we shall prevent concurrent execution of
>> dma_configure().
>>
>> It seems to me that while the IOMMU subsystem is executing
>> dma_configure(), the deferred probe workqueue can concurrently pick up
>> the same device, enter really_probe(), set dev->driver, and execute
>> dma_configure(). Is it worth protecting against this?
> 
> Yes, it's certainly still possible to hit a false-positive if thread A in iommu_device_register()->bus_iommu_probe() races against thread B attempting to bind, simply because thread B can set dev->driver long before it gets to any point where ends up serialising on iommu_probe_device_lock again, so thread A can observe that even while it is doing the IOMMU probe in the "correct" context. Other than the warning though, it's still functionally OK even if the "wrong" thread does end up finishing the probe, at least after 0c8e9c148e29 ("iommu: Avoid introducing more races").

I confirm I have 0c8e9c148e29 ("iommu: Avoid introducing more races") in
my tree.

If the concurrent execution is functionally safe and the dev->driver
check is a known source of false positives during async probing, do you
think it would worth switching the dev_WARN to dev_info? I'm thinking
dev_WARN is a bit harsh, as it can disrupt CI pipelines that halt on
warnings.

>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index e61927b4d41f..5f0c1a8064b5 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -461,9 +461,19 @@ static int iommu_init_device(struct device *dev)
>>           * already having a driver bound means dma_configure has already run and
>>           * found no IOMMU to wait for, so there's no point calling it again.
>>           */
>> -       if (!dev->iommu->fwspec && !dev->driver && dev->bus->dma_configure) {
>> +       if (!dev->iommu->fwspec && !READ_ONCE(dev->driver) &&
>> +           dev->bus->dma_configure) {
>>                  mutex_unlock(&iommu_probe_device_lock);
>> -               dev->bus->dma_configure(dev);
>> +
>> +               /*
>> +                * Serialize with really_probe(). Recheck dev->driver in case a
>> +                * driver bound while we were waiting for the lock.
>> +                */
>> +               device_lock(dev);
>> +               if (!dev->driver)
>> +                       dev->bus->dma_configure(dev);
>> +               device_unlock(dev);
> 
> Much as I can't wait to get rid of iommu_probe_device_lock, the main reason we still can't rely on device_lock() at the moment is not actually the remaining sketchy replay-dependers per the comment in __iommu_probe_device(), but more fundamentally that for most IOMMU drivers this will deadlock in that same iommu_device_register()->bus_iommu_probe() path, when the bus walk happens to stumble across the IOMMU device itself, which of course is already locked as it's still in the middle of its own driver bind. I couldn't see an easy, clean and reliable way to get around that, so that can got kicked down the road in order to get the "call of_xlate in the right order and make iommu_device_register() actually work" basics landed (and start shaking out all these other problems...)
> 

Thank you for the detailed explanation. Between the self-deadlock on
the IOMMU device itself, and the fact that a non-blocking
device_trylock() would be unsafe (as it could fail due to a simple sysfs
read, permanently orphaning the device from the bus walk), it's clear
there is no clean locking fix for this TOCTOU window right now.

Thanks,
ta

