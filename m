Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E705C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQeACK7MBBr+bEhH9clyj4oNsLZFzMKWfZ1UCxHMLKI=; b=LssrAuXnBsC4SR4sEaXqsUQBbF
	O10zkJF5WVAaDdjdw8XZKc4F+VpWxT+3aDj3uwLc+uP0p629sHY+m8GyvNse1Ql4LopZvBYIdsnQ0
	SlQM3cZ46M7Gguh9sqcGIVbngWuoxp4f3HY8+lHfHmpl4j79SEAiihBrz78D53+9HH6bxdDn97LgD
	uDBPpqRYU1LYLA/Nsjhd4mUMA0TDcEeFLLAWAsJCiTBOkZ5FJKFufYXHjN8o7Fu5m4TegzigaiCAi
	I5YPPYDPEVCaaMOGqPswOtDq8boZC7B7qDrfZJky1KL+ALhnOjkhoLfDAyeW4tDYcffqN946aTw8e
	rAlX2BgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HHr-0000000EMxn-2hzQ;
	Fri, 11 Apr 2025 16:31:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HFU-0000000EMZZ-1HCw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 16:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HQeACK7MBBr+bEhH9clyj4oNsLZFzMKWfZ1UCxHMLKI=; b=GQYggffNNg8CiCjVExt9m5jopx
	JpOF/SAGO6s1fqBM+S71yxLkN9lheZJ/0UqlY1sn9eGONFjQjzrRj3i01i6gPWUtmPGNBjJie1J59
	Ul0BZz/37Y/SHN2bF94l71h1CYha4y/5NM441tCVhzUW9B4zi7o4m0HAkZg5Ov0xwbI97OGx93VPS
	musxHCEcTfxCw4xNvicKe2WVqWEv8taV1tJCgBlX2e6Teiw+iCzzb9zHx0c5WdDC4nzZrbOTpqvsw
	RL2pyuG3FgTTlIHuTGM/r1SGxq5iPVGWdoR9xJKX764ek7rBLTDeKGDgoV0eQanxS+1s4M5y9DVrK
	jZg5bgAA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3HFQ-000000093bG-2k6u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 16:28:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE9F4106F;
	Fri, 11 Apr 2025 09:28:52 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C25B43F694;
	Fri, 11 Apr 2025 09:28:51 -0700 (PDT)
Message-ID: <ab75a444-22a1-47f5-b3c0-253660395b5a@arm.com>
Date: Fri, 11 Apr 2025 17:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: dynamically allocate selftest
 device struct
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc: Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Rob Clark <robdclark@chromium.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250411125423.1411061-1-arnd@kernel.org>
 <60c980c1-16b6-460e-89a4-203e9f0cbf3b@arm.com>
 <9c010a5d-a2a7-4002-9411-58009c1a21c8@app.fastmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <9c010a5d-a2a7-4002-9411-58009c1a21c8@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_172856_983736_3838CED1 
X-CRM114-Status: GOOD (  18.92  )
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

On 11/04/2025 2:44 pm, Arnd Bergmann wrote:
> On Fri, Apr 11, 2025, at 15:19, Robin Murphy wrote:
>> On 11/04/2025 1:54 pm, Arnd Bergmann wrote:
>>> @@ -1433,15 +1434,17 @@ static int __init arm_lpae_do_selftests(void)
>>>    	};
>>>    
>>>    	int i, j, k, pass = 0, fail = 0;
>>> -	struct device dev;
>>
>> Could we not simply make this static? Per the comment it's only here to
>> serve a NUMA node lookup buried deep in the pagetable allocator (TBH my
>> first thought was to just put an int on the stack and contrive a pointer
>> as the inverse of dev_to_node(), but I decided that would probably be
>> too contentious...)
> 
> A static device would work here, but that has other (small)
> downsides:
> 
>   - static devices are discouraged for any real purpose because
>     of the problematic lifetime rules. I think Greg would still
>     want to eliminate these entirely.
> 
>   - there is slightly more memory usage: the __init function
>     gets eliminated after boot, while a static allocation says
>     around. It could perhaps be made __initdata.
> 
>   - If we ever need anything beyond the NUMA node from it, the
>     dynamic allocation is probably close enough to make that
>     work.
> 
>>> +	struct platform_device *pdev;
>>>    	struct io_pgtable_cfg cfg = {
>>>    		.tlb = &dummy_tlb_ops,
>>>    		.coherent_walk = true,
>>> -		.iommu_dev = &dev,
>>>    	};
>>>    
>>> -	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
>>> -	set_dev_node(&dev, NUMA_NO_NODE);
>>> +	pdev = platform_device_alloc("io-pgtable-test", 0);
>>
>> Otherwise, this would seem to be another perfect case for the new
>> faux_device.
> 
> Good point, that is clearly better than platform_device in this
> case. Shall I send a new version with that?

Sure, I'm happy to consciously err on the side of caution and 
robustness, just making sure :)

Thanks,
Robin.

