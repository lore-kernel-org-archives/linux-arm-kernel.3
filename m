Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBF3D5CCB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phTv5B2Casy1c04Du6nyaEdOpRJOIvyA92Y2v6DnGFA=; b=qxQx9ieWvKXxttaZZGkcHaj9+L
	ptweqevkWJJhoZ0BjHvApVfYsRi+wkBfOUusN7K66PFTkjXG8390arbb8WzOXJLj+0X4V0p2L2tnD
	RUKuZcQpTfA3x5s1HdeE83EmpL1ac10pBbYqwqUdlDvnxqdl49QAEhf48q8VDSRLwZAJ8R0PN8CbI
	y0OBxwhG83qN8mnv87Kx62/DIXoCNa8q+e1WFkMQeMqN7FPDTpwyK4PUi6qXBzk32eG2wIESQsscq
	Lt2bEsXT9mVlOeLZJrSsIpjMuwniT6WX1LA4G1xwnyjfewAmR5LqBC2xjxfr6i//2bkk5T36EMRcR
	JG5B13BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVS4t-000000051QA-1Cfs;
	Tue, 16 Dec 2025 10:14:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVS4r-000000051Pj-0yZB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 10:14:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65716FEC;
	Tue, 16 Dec 2025 02:14:35 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43D923F694;
	Tue, 16 Dec 2025 02:14:39 -0800 (PST)
Message-ID: <fc7ca984-544d-4aea-a644-0d9390f8469b@arm.com>
Date: Tue, 16 Dec 2025 10:14:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/38] arm_mpam: resctrl: Pick the caches we will use
 as resctrl resources
From: Ben Horgan <ben.horgan@arm.com>
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-9-james.morse@arm.com>
 <c0139cdf-9263-4051-938d-cb86233399b0@arm.com>
Content-Language: en-US
In-Reply-To: <c0139cdf-9263-4051-938d-cb86233399b0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_021445_323005_B53FE78C 
X-CRM114-Status: GOOD (  16.97  )
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

On 12/9/25 15:57, Ben Horgan wrote:
> Hi James,
> 
> On 12/5/25 21:58, James Morse wrote:
>> Systems with MPAM support may have a variety of control types at any
>> point of their system layout. We can only expose certain types of
>> control, and only if they exist at particular locations.
>>
>> Start with the well-know caches. These have to be depth 2 or 3
>> and support MPAM's cache portion bitmap controls, with a number
>> of portions fewer than resctrl's limit.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 91 +++++++++++++++++++++++++++++++++-
>>  1 file changed, 89 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 320cebbd37ce..ceaf11af4fc1 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -60,10 +60,96 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
>>  	return &mpam_resctrl_controls[l].resctrl_res;
>>  }
>>  
>> +static bool cache_has_usable_cpor(struct mpam_class *class)
>> +{
>> +	struct mpam_props *cprops = &class->props;
>> +
>> +	if (!mpam_has_feature(mpam_feat_cpor_part, cprops))
>> +		return false;
>> +
>> +	/* resctrl uses u32 for all bitmap configurations */
>> +	return (class->props.cpbm_wd <= 32);
>> +}
> 
> cpbm_wd > 32 is not support properly in mpam_devices.c (e.g. reset and
> config value are limited to 32 bits.) and so we should consider just not
> adding the feature to the class in that case.

I'll keep this as is because the value still needs to be reset correctly
by mpam_devices.c even if it is not usable by resctrl.

> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben


