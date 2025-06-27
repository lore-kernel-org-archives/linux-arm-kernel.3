Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD985C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4h3r20TGGfCH/nRJJMJwKQv6mVY2xAUTDIcuQJzD2zA=; b=u98GOOVtFSpmX1RkzUyuiWDhws
	sLYtOzpJgYHMhid58qaut72YbFXzZNh2GPrMBvo2c0j89HhUyAiPuUA/VJ5cSnw4PhMsfm5LNCQ3d
	w+RDYUCAYZKVu+TqqNioww/XvUBouJreEpNl/4jqmMHhVU5fRRxyHB866hYFA78ft4f9HYOsycaJm
	E05y01wSabrNZw1Y0BvmhCg9/XhPkNoj7mlGsOkdLUOaxIwF56RXPD3VUH4AWejZbeQHIOc1hH4kA
	zUiInX20lp3oiGuULTq2psD7zKFEq22dnGRfjGx+r+4l50tYQrilQ/sXsF46TVicxgnzjiEeSAe0b
	iYbnHYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVD8H-0000000FRAb-3YiH;
	Fri, 27 Jun 2025 17:45:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC69-0000000FIsb-1XcO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:38:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C74072910;
	Fri, 27 Jun 2025 09:38:25 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FCBD3F58B;
	Fri, 27 Jun 2025 09:38:41 -0700 (PDT)
Message-ID: <88e4005e-64d3-4019-939f-5c0c656666ca@arm.com>
Date: Fri, 27 Jun 2025 17:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] cacheinfo: Add helper to find the cache size from
 cpu+level
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <20250613130356.8080-6-james.morse@arm.com>
 <20250617172808.00005c14@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250617172808.00005c14@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_093845_451318_3D35FA59 
X-CRM114-Status: GOOD (  18.52  )
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

Hi Jonathan,

On 17/06/2025 17:28, Jonathan Cameron wrote:
> On Fri, 13 Jun 2025 13:03:56 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> The MPAM driver needs to know the size of a cache associated with a
>> particular CPU. The DT/ACPI agnostic way of doing this is to ask cacheinfo.
>>
>> Add a helper to do this.

>> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
>> index 9c959caf8af8..3f1b6b2e25b5 100644
>> --- a/include/linux/cacheinfo.h
>> +++ b/include/linux/cacheinfo.h
>> @@ -148,6 +148,26 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
>>  	return ci ? ci->id : -1;
>>  }
>>  
>> +/*
>> + * Get the size of the cache associated with @cpu at level @level.
>> + * cpuhp lock must be held.

> To me kernel-doc would be appropriate.  Particularly the return 0 thing.
> However there isn't any for existing cacheinfo interfaces so maybe
> fair enough to 'follow local style' on that.

Documentation should be the direction of travel right? I'll change this.


>> + */
>> +static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
>> +{
>> +	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(cpu);
>> +	int i;
>> +
>> +	if (!ci->info_list)
>> +		return 0;
>> +
>> +	for (i = 0; i < ci->num_leaves; i++) {
>> +		if (ci->info_list[i].level == level)
>> +			return ci->info_list[i].size;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> Why not
> 
> static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
> {
> 	struct cpu_cachinfo *ci = get_cpu_cacheinfo_level(cpu, lev);
> 
> 	return ci ? ci->size; 0;
> }
> 
> Like existing get_cpu_cacheinfo_id()?

I've been dragging this around for years. Fixed.


Thanks!

James

