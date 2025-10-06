Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA52CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIaRfty0fgGTgthQnmfH5a6bDL038pQdk3gJqh/+eKY=; b=pz6c2esrRVPhHT8dN3uxwk/mmC
	IuQPQMMPKsG6+w6Uj1OJA3W0cwoDL+67wbNeKj8KKI1SdBwxzH80B/9tZD4rVcaTqlLnEmHBsUT/s
	ZBcTpysLJrONp7lsackgc8oZG5Nid9pDyLJjelcTUo4cMmp1ZYtdl7XWemtchozSBcATeJ6MI8yM0
	MAFQkyaWSDnwF044z7HjYPu2flOveKEh/OZOIZxuXGRB08jzHispzmz2CJNUX/GzN5S/UfWoVcCEH
	kJEILGzTgz38tOn4tv0rj0NFW3dghifThHXCFQ3pwKccrE6Av0EnHgLYBM1+vTqkBvTMiIHR3we0r
	N5GOVJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5meW-00000000EO4-0aDT;
	Mon, 06 Oct 2025 14:57:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5meT-00000000ENJ-2Mhh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 14:57:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B292E1515;
	Mon,  6 Oct 2025 07:57:14 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB30B3F66E;
	Mon,  6 Oct 2025 07:57:17 -0700 (PDT)
Message-ID: <2e5d3b5e-0d76-4594-8a65-9baa635cfcd8@arm.com>
Date: Mon, 6 Oct 2025 15:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/29] arm_mpam: Add helpers to allocate monitors
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-23-james.morse@arm.com>
 <20250912141123.000068e2@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912141123.000068e2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_075725_651216_8FA3722F 
X-CRM114-Status: GOOD (  12.35  )
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

On 12/09/2025 14:11, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:43:02 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> MPAM's MSC support a number of monitors, each of which supports
>> bandwidth counters, or cache-storage-utilisation counters. To use
>> a counter, a monitor needs to be configured. Add helpers to allocate
>> and free CSU or MBWU monitors.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> One minor requested change inline that will probably otherwise get picked
> up by someone's cleanup script
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!


>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 326ba9114d70..81c4c2bfea3d 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h

>> +static inline int mpam_alloc_mbwu_mon(struct mpam_class *class)
>> +{
>> +	struct mpam_props *cprops = &class->props;
>> +
>> +	if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
>> +		return -EOPNOTSUPP;
>> +
>> +	return ida_alloc_range(&class->ida_mbwu_mon, 0,
>> +			       cprops->num_mbwu_mon - 1, GFP_KERNEL);
> 
> ida_alloc_max() - which is just a wrapper that sets the minimum to 0
> but none the less perhaps conveys things slightly better.

Sure - I didn't spot that when I did this.


Thanks,

James

