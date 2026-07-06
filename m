Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B46C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IO/QubD4dgUuEh8uDMk9gwKSkQqs0JS7PLrZUPxwMTk=; b=fIB+zB39Edzx71Jq9y+nGhbc9Y
	MMSt5i2h0qjQd1ghZqspb77wMnn/kaN0AjPKni36AVoHmjkZEcB9piwrtqwSN6atWQyePCFeWRS8t
	pAvAyQk8RhxTuLV0dWUBNpel6qpBicLJxkV5l3wQjModENeWUcRoxfRhD447nf4LSKQxr+QnfkAiX
	S+ApEidh77HCufODFP2v7gJpsHPQpFjmHjwXhBozvMF/S/kxEIy4ExE3jqDr9dsGwSqPLB6uqaeER
	OmoWrW5sM1yPDos0qtZY6ZaoisJJJnRaNuReqY4AnAkGZPvX7JuRtwf+TiW12v45HSPHYQZz/i8UK
	uQaTr1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjBp-0000000CY99-4B6t;
	Mon, 06 Jul 2026 13:16:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjBn-0000000CY8R-2f2C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:16:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0213128C7;
	Mon,  6 Jul 2026 06:16:40 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1E223F7B4;
	Mon,  6 Jul 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783343804; bh=mwN11MVLcsvBlXWF+rEa1fVZSi/RldKoZKTgPXtuR5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ct6L7tCXeBJgq6QVSdXCekpl52Qs9TtMSnHLuEzhNCU/M2zfF0d5pcsGqgH4fptJM
	 4DvDaHSXWTiu0iU5EzxzO3rJ4Dg2b/mIKCYWawenWMpKUwqnEon7qsCB/GHb6B5yJw
	 gP9TAnKzyg8Ili6nt8PWm08D4Eo/Q3tiDByn0K5g=
Message-ID: <aaf16d0a-75a2-43e4-be15-9dda8cf0aee4@arm.com>
Date: Mon, 6 Jul 2026 14:16:33 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jic23@kernel.org, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-3-ben.horgan@arm.com>
 <e8239a83-bdc7-4702-8f2d-8c639fcaea59@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <e8239a83-bdc7-4702-8f2d-8c639fcaea59@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_061647_765084_A3B9EC57 
X-CRM114-Status: GOOD (  23.64  )
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

On 7/3/26 06:30, Fenghua Yu wrote:
> Hi, Ben,
> 
> On 5/20/26 14:24, Ben Horgan wrote:
>> MPAM is able to emulate ABMC, i.e. mbm_event mode, by making memory
>> bandwidth monitors assignable. Rather than supporting the 'default'
>> mbm_assign_mode always use 'mbm_event' mode even if there are sufficient
>> memory bandwidth monitors. The per monitor event configuration is only
>> provided by resctrl when in 'mbm_event' mode and so only allowing
>> 'mbm_event' mode will make it easier to support per-monitor event
>> configuration for MPAM. For the moment, the only event supported is
>> mbm_total_event with no bandwidth type configuration. The
>> 'mbm_assign_mode'
>> file will still show 'default' when there is no support for memory
>> bandwidth monitoring.
>>
>> The monitors need to be allocated from the driver, and mapped to
>> whichever
>> control/monitor group resctrl wants to use them with.
>>
>> Add a second array to hold the monitor values indexed by resctrl's
>> cntr_id.
>>
>> When CDP is in use, two monitors are needed so the available number of
>> counters halves. Platforms with one monitor will have zero monitors when
>> CDP is in use.
>>
>> Co-developed-by: James Morse <james.morse@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> 
> Please check the following nit.
> 
>> ---
>> Changes since rfc v1:
>> abmc enabled even if enough counters
>> Helpers from dropped free running commits
>> carry on with zero counters if using cdp
>> set config bits
>> use kmalloc_objs
>> drop tags for rework
>> Configure mbm_cntr_configurable, mbm_cntr_assign_fixed
>>
>> Changes since rfc v2:
>> Don't set mon->assigned_counters to an error pointer
>> Fix mpam_resctrl_teardown_mon()
>> Remove free running check
>> Separate cleanup allocations, e.g. __free(), from the rest
>> Restrict scope on err in mpam_resctrl_monitor_init()
>>
>> Changes since v3:
>> Correct NULL check in mpam_resctrl_teardown_mon() (Shaopeng)
>> variable allocation ordering in mpam_resctrl_pick_domain_id() (Shaopeng)
>> Move mon.* assignments from mpam_resctrl_monitor_sync_abmc_vals()
>> to mpam_resctrl_monitor_init_abmc() counters (Sashiko)
>> use kvmalloc_obj() for allocations that may be big on some
>> platforms (Sashiko)
>> ---
>>   drivers/resctrl/mpam_internal.h |   6 +-
>>   drivers/resctrl/mpam_resctrl.c  | 139 +++++++++++++++++++++++++++++++-
>>   2 files changed, 141 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/
>> mpam_internal.h
>> index 1914aefdcba9..7a166b395b5a 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -411,7 +411,11 @@ struct mpam_resctrl_res {
>>   struct mpam_resctrl_mon {
>>       struct mpam_class    *class;
>>   -    /* per-class data that resctrl needs will live here */
>> +    /* Array of allocated MBWU monitors, indexed by (closid, rmid). */
>> +    int            *mbwu_idx_to_mon;
>> +
>> +    /* Array of assigned MBWU monitors, indexed by idx argument. */
> 
> Nit:
> 
> "idx argument" is unclear and confusing. The idx is actually cntr_id
> coming from resctrl.
> 
> Is it better s/index by idx argument/indexed by resctrl's cntr_id/?
> 
> You mentioned "indexed by resctrl's cntr_id" in the commit message
> already. I think it's clearer than simple "idx argument".

Sure, updated.

Thanks,

Ben

> 
>> +    int            *assigned_counters;
>>   };
>>  
> [SNIP]
> 
> Thanks.
> 
> -Fenghua


