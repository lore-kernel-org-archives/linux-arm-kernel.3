Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFC9C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3JIgNKPC6ybCnerbwPJX2RD18vyVuXpIXPctA84TMY=; b=2VaLwBKJsXwn8bczfwXr94o7K9
	YMBqY+hmR2jHIMniO0m/gKuzXCl9oLnEUGBlb1KnKfX+f4xydEf6jm6dK/0VCtIHXrdtGdy8oBeAl
	F2LV0FVXPw+IxC1Q20cIXJ/DfI+5zAQ9kGtqKgPfmBb5T8XMrW6sbDGGxCJ2EWHGYBFr2KRewbntD
	4WdSAw3HUAfNHzz9s9ut7wR/BNvzDAcBMhYTf+pvaQUiyvX+YB6B/sk0NoOwHjxuTg77AcZaGXnNm
	z6dDMbaq4P4qH2ikOBtKZlLwLljZzno4Q52R4EEalhRPhL/OYgPu20iCXUPrnvJArqnjq77u1rNzi
	0gg3hy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mGf-00000008tJN-0yMK;
	Wed, 16 Sep 2026 09:49:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mGc-00000008tIN-0dSj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:49:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB8041516;
	Wed, 16 Sep 2026 02:49:18 -0700 (PDT)
Received: from [10.2.212.8] (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 445E73F86F;
	Wed, 16 Sep 2026 02:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789552162; bh=KuO14YuSIMliHThLNP9CFnL/2L6g8T7HPTMoBngDAQQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ARyNLCNZkGUYpKmy5uBK9NEea7T0DnlON4jVwojrWrqR+y2L8389NX9ZkBoDdHaH7
	 SDH1ldmrUffCGGg/ci8ztuMCsrDMA+f1d32D5ipJKsuFnkU+sgU8NvKUyv7fpshSKm
	 EKjwNkN9yrL/JG7dZahf5u/oa2a8XSSY8QGckcW4=
Message-ID: <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
Date: Wed, 16 Sep 2026 10:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
From: Ben Horgan <ben.horgan@arm.com>
To: Andre Przywara <andre.przywara@arm.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Content-Language: en-US
In-Reply-To: <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_024926_257911_957EDD89 
X-CRM114-Status: GOOD (  18.83  )
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

Hi Andre,

On 07/09/2026 13:59, Ben Horgan wrote:
> Hi Andre,
> 
> On 02/09/2026 15:37, Andre Przywara wrote:
>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>> error value.
>>
>> Check the returned value for this error condition, before passing the
>> value on to other code, which would hide the negative number in some high
>> value in the unsigned type.
>>
>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> This looks good to me. Out of interest what led you to find this?
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

I seem to have been a bit hasty here.

Sashiko points out at [1] that 0xFFFFFFFF is the only value we were previously considering invalid
and that the value coming from dt or acpi can provid other valid values that would after this patch
be considered invalid.

[1] https://sashiko.dev/#/patchset/20260902143757.3469690-1-andre.przywara%40arm.com

Thanks,

Ben>
> Thanks,
> 
> Ben
> 
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 9d223057953ab..a5e661eff86d7 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>  /* Find the L3 cache that has affinity with this CPU */
>>  static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>  {
>> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +
>> +	if (cache_id < 0)
>> +		return -ENOENT;
>>  
>>  	lockdep_assert_cpus_held();
>>  
> 
> 


