Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EB2D78761
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLoZ/QRBdRpQopl0eWL0Nb/0i5kiw1kck8BDKzqWIzE=; b=4dcW0i95Pd8k8RxBL8nEkKND6B
	VzI+YtBYvU1+wDaprih42Rjv5EfOJmOJWTe27EIpSQiH8TpDzuuQkOfefv+q4xmPVJ4rjMY7gvJaP
	ds0HKaSp3Vme6vBRsRuRpJzvLIjHJu12qIKIIfw2jG2bm66dbQ8plfbhYJl1iFgjRoCamPO6uvimP
	znmyTLUkLqRA2gEOAP4twnSPDkmnBbIHRDtuQCEBYRZA+S1HAUUeoKdTBClwP4UzbOFYuzg521Zxa
	1/Wz41AmyUYqgb0oakxJp+TX2JGXP//wTKYFlCt+4Or5p0J4gAEKjttQ4k4Z8qz3/ezEyXo2UAeFN
	kdpgr7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZQC-0000000AGu5-3G1Z;
	Fri, 19 Dec 2025 12:17:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZQA-0000000AGtY-0vfl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:17:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B8B3FEC;
	Fri, 19 Dec 2025 04:17:13 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 484113F5CA;
	Fri, 19 Dec 2025 04:17:17 -0800 (PST)
Message-ID: <7100e3a7-4f08-4156-bf0b-6598570abecd@arm.com>
Date: Fri, 19 Dec 2025 12:17:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/38] arm_mpam: resctrl: Add boilerplate cpuhp and
 domain allocation
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Gavin Shan <gshan@redhat.com>,
 rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-8-james.morse@arm.com>
 <20251218113014.00002691@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251218113014.00002691@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041722_309116_5ED54C22 
X-CRM114-Status: GOOD (  20.49  )
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

On 12/18/25 11:30, Jonathan Cameron wrote:
> On Fri, 5 Dec 2025 21:58:30 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> resctrl has its own data structures to describe its resources. We
>> can't use these directly as we play tricks with the 'MBA' resource,
>> picking the MPAM controls or monitors that best apply. We may export
>> the same component as both L3 and MBA.
>>
>> Add mpam_resctrl_exports[] as the array of class->resctrl mappings we
>> are exporting, and add the cpuhp hooks that allocated and free the
>> resctrl domain structures.
>>
>> While we're here, plumb in a few other obvious things.
>>
>> CONFIG_ARM_CPU_RESCTRL is used to allow this code to be built
>> even though it can't yet be linked against resctrl.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
> Hi,
> 
> A few code flow related comments. Fairly trivial stuff but I think
> some parts of this can be made more readable / maintainable with
> minor reorganization.
> 
> Jonathan
> 
> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 2996ad93fc3e..efaf7633bc35 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
> ...
> 
>> @@ -2516,6 +2522,12 @@ static void mpam_enable_once(void)
>>  	mutex_unlock(&mpam_list_lock);
>>  	cpus_read_unlock();
>>  
>> +	if (!err) {
>> +		err = mpam_resctrl_setup();
>> +		if (err)
>> +			pr_err("Failed to initialise resctrl: %d\n", err);
>> +	}
>> +
>>  	if (err) {
>>  		mpam_disable_reason = "Failed to enable.";
>>  		schedule_work(&mpam_broken_work);
> 
> I'd be tempted to move this to an error handling block via a goto
> making this bit
> 	if (err)
> 		goto err_disable_mpam;
> 
> 	err = mpam_resctrl_setup();
> 	if (err) {
> 		pr_err();
> 		goto err_dsiable_mpam;
> 	}
> 
> Up to you though. Personally I like all my good paths as straight line
> code with the errors handled in if (err) as that consistency really helps
> readability.  
> 

I'll leave this one as is. It looks like James tried hard to avoid a goto.

Thanks,

Ben


