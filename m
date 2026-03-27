Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9DF10F2847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1+9DRDuOTkiiVZ8OfhdcauUMKcSR4YZMlwj46JbxzQ=; b=lFwHI+ZAPcSiS4FhyQNx/tO2H4
	Xc+gWC8OmcFsVqNlc6ad7PPlqSARVB4qhCmq5zgptRvyRuHC2rKgcqWtqUCkJaimy9EWORauZ407x
	nsKvVwmc7ruDG8vJv1SwZUaCuiRW63dF5wSHSvyFXKobW9nQeEnqDEjeEtsrBA0WimrmKY401qCj2
	yGhE0h+XJyY+p1RzXG35kbtEudfQTbGIOgwwhmCiTwqe6SaIcKcyGQvuvalJL315XGICrqvfJp0v3
	5PDAbIbnpQ3O12lto4wPiTFyT2e9aCyPdrO5DuWUxwnXnxPporfpMTpjEF5wpcOYFmcSv9TUMnPIz
	NtJSMyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69PM-00000007iZx-3U90;
	Fri, 27 Mar 2026 15:47:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69PK-00000007iZK-05sq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:47:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF10135ED;
	Fri, 27 Mar 2026 08:47:25 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48F6E3F99C;
	Fri, 27 Mar 2026 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774626451; bh=X+3+AnOssHDazi9g/p8EvP6xLsFCtm8xeHGfvj9w+ew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ccT3LPqWPIHequPX0aJVRhONLhEgDh6xPgPQ7DidSlEcSKoB1b9criJFo+XTkxWqv
	 nFBdNh81RjxKCy+zKuGy+CR7JvEFs1txeCUkQLMemmJsDHPkHdJD+ZRhysbPVscjXV
	 SnQ4hd/wZhi4OAWYPSdZdwC4IcGeDrGrx8MF6vqU=
Message-ID: <e8da73a5-93ac-4cbc-84dd-01efbddd5716@arm.com>
Date: Fri, 27 Mar 2026 15:47:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/40] arm_mpam: resctrl: Add support for 'MB' resource
To: Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-26-ben.horgan@arm.com>
 <3ae3356d-a901-4b71-90df-557d468e4785@redhat.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <3ae3356d-a901-4b71-90df-557d468e4785@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084735_202990_3C0C7C01 
X-CRM114-Status: GOOD (  20.70  )
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

Hi Gavin,

On 23/03/2026 23:09, Gavin Shan wrote:
> On 3/14/26 12:46 AM, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl supports 'MB', as a percentage throttling of traffic from the
>> L3. This is the control that mba_sc uses, so ideally the class chosen
>> should be as close as possible to the counters used for mbm_total. If there
>> is a single L3, it's the last cache, and the topology of the memory matches
>> then the traffic at the memory controller will be equivalent to that at
>> egress of the L3. If these conditions are met allow the memory class to
>> back MB.
>>
>> MB's percentage control should be backed either with the fixed point
>> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
>> bitmaps is not used as its tricky to pick which bits to use to avoid
>> contention, and may be possible to expose this as something other than a
>> percentage in the future.

> One comment below and it deserves to be addressed if we have another respin:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks!


>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 93c8a9608ed4..cad65cf7d12d 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -317,6 +344,166 @@ static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)

>> +/*
>> + * Test if the traffic for a class matches that at egress from the L3. For
>> + * MSC at memory controllers this is only possible if there is a single L3
>> + * as otherwise the counters at the memory can include bandwidth from the
>> + * non-local L3.
>> + */
>> +static bool traffic_matches_l3(struct mpam_class *class)
>> +{
>> +    int err, cpu;
>> +
>> +    lockdep_assert_cpus_held();
>> +
>> +    if (class->type == MPAM_CLASS_CACHE && class->level == 3)
>> +        return true;
>> +
>> +    if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
>> +        pr_debug("class %u is a different cache from L3\n", class->level);
>> +        return false;
>> +    }
>> +
>> +    if (class->type != MPAM_CLASS_MEMORY) {
>> +        pr_debug("class %u is neither of type cache or memory\n", class->level);
>> +        return false;
>> +    }
>> +
> 
> We bail if the calss isn't MPAM_CLASS_MEMORY here ...
> 
>> +    cpumask_var_t __free(free_cpumask_var) tmp_cpumask = CPUMASK_VAR_NULL;
>> +    if (!alloc_cpumask_var(&tmp_cpumask, GFP_KERNEL)) {
>> +        pr_debug("cpumask allocation failed\n");
>> +        return false;
>> +    }
>> +
>> +    if (class->type != MPAM_CLASS_MEMORY) {
>> +        pr_debug("class %u is neither of type cache or memory\n",
>> +             class->level);
>> +        return false;
>> +    }
>> +
> 
> Duplicated check here as the previous one. So this check can be dropped.

Heh, that looks like a rebase conflict! Thanks for spotting it.

Fixed locally.


James

