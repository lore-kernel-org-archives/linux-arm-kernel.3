Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB85BCD6E71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKvYg5pgTZExlUl8Ur2G/6w/CWPEUCScsjClnTcUuRY=; b=pRPydZma1sr0cSnjbVC1fZiy7I
	rz9Nv6FrYad8+Bg0mKHhEYxu/7i2qV3VNsArLn+Z34tDybbzkP0miau5ZoYJZn5YipceWhyGdqlJV
	dORnvJgT9tbQ3Pu7ncojoKQNokYrMHx31qDlg1rGuW2PNo2vUiiHosvTDv4wjVHa38Gn9gnZZxjVX
	tODGFWXhft1afocZeVBuMmimsYrqOmp6/nwa8E7UQvHuLQK0yVIsHY4eEIFZbH25aUWEvnrkW9j7r
	EtJ09hO7PazVTGXsIne7uik5G1AA5mPbzTKyrL6wb3e99rWhP4NctkLfgzN/aSpbXaCkpryPau5sB
	zj+9XTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYFA-0000000Abl8-2O0O;
	Thu, 13 Nov 2025 14:24:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYF7-0000000Abkd-1vuy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 14:24:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9C0912FC;
	Thu, 13 Nov 2025 06:23:59 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A8CD3F5A1;
	Thu, 13 Nov 2025 06:24:02 -0800 (PST)
Message-ID: <633d5c15-ffe1-4b52-a6aa-9a2c54e5fb98@arm.com>
Date: Thu, 13 Nov 2025 14:24:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/33] ACPI / MPAM: Parse the MPAM table
To: Fenghua Yu <fenghuay@nvidia.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-10-ben.horgan@arm.com>
 <498b5814-28fb-4b5d-91a8-1aab02f3f5d6@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <498b5814-28fb-4b5d-91a8-1aab02f3f5d6@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_062409_557852_A84953CB 
X-CRM114-Status: GOOD (  13.35  )
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

Hi Fenghua,

On 11/13/25 02:33, Fenghua Yu wrote:
> Hi, Ben and James,
> 
> On 11/7/25 04:34, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
> 
> [SNIP]
> 
>> +static int acpi_mpam_parse_resource(struct mpam_msc *msc,
>> +                    struct acpi_mpam_resource_node *res)
>> +{
>> +    int level, nid;
>> +    u32 cache_id;
>> +
>> +    switch (res->locator_type) {
>> +    case ACPI_MPAM_LOCATION_TYPE_PROCESSOR_CACHE:
>> +        cache_id = res->locator.cache_locator.cache_reference;
>> +        level = find_acpi_cache_level_from_id(cache_id);
>> +        if (level <= 0) {
>> +            pr_err_once("Bad level (%d) for cache with id %u\n",
>> level, cache_id);
>> +            return -EINVAL;
>> +        }
>> +        return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_CACHE,
>> +                       level, cache_id);
>> +    case ACPI_MPAM_LOCATION_TYPE_MEMORY:
>> +        nid = pxm_to_node(res->locator.memory_locator.proximity_domain);
>> +        if (nid == NUMA_NO_NODE) {
>> +            pr_debug("Bad proxmity domain %lld, using node 0 instead\n",
>> +                 res->locator.memory_locator.proximity_domain);
>> +            nid = 0;
>> +        }
>> +        return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_MEMORY,
>> +                       255, nid);
> 
> nit.
> 
> Seems "255" is an ad-hoc value which won't be used for memory type?
> The "class_id" in mpam_ris_create() is confused: it may be level for
> cache or it may be 255 for memory.
> 
> To be clearer, maybe it's better to define and enum for class_id?
> Something like:
> enum mpam_class_id {
>     CLASS_ID_LEVEL_1 = 1,
>     CLASS_ID_LEVEL_2,
>     CLASS_ID_LEVEL_3,
>     CLASS_ID_NOT_USED = 255  <--- for memory type
> };

I've added a new define, MPAM_CLASS_ID_DEFAULT, which can be used for
memory and anything else that only needs one class_id.

> 
> Thanks.
> 
> -Fenghua

-- 
Thanks,

Ben


