Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16BFC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwQdpGO5V3CPOgrnb2NRsGwjwQZWnzlGvHbQpClskgY=; b=12KlXakWDbEftzzMOVmvM0ZQOm
	os8UG1A+xxtp7GbtusH+2/QPdv/VWzgQLp6LQYHioM6NoPptTiSqISo5S4y9J3BfFumOCCZeadAYf
	fIaLpuSmbtzjH+RWJXliiCY6MuuEcA8HGbzQULrK1CAuCHtb/xu8a8rJ+Kn1tASkvdDvAguPjYLWp
	eXDS8AQkoh35chg/H3rwAjjUce0ca0yga7WYB99lYGuX9DZ7a+bsNmEv9jfjSGGoxPQUveYlUfP1Q
	LbCjYmB0JU6sb//fZ5FVShthqdF72tigBR1J6pHjmi05/vI4ctGygpWs2sEaY0Ox/LzMPRVNgW1Ud
	+oQPPAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZAr-00000006uNB-2rOm;
	Mon, 07 Sep 2026 13:14:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZAq-00000006uMZ-00p2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:14:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08C841476;
	Mon,  7 Sep 2026 06:14:05 -0700 (PDT)
Received: from [10.57.7.12] (unknown [10.57.7.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4818F3F7D8;
	Mon,  7 Sep 2026 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788786848; bh=XWLt2OmFnj478hxlI5SLGUXw2C8SjtcuYR3m957GDEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DlIReHo4IXFAsHTh3mJ60nbj3okusPpJbvnauJK1CVeqYxdGOUmmuK3cOSzJsIJ+g
	 JWMitI4SSa4Cph7NPhgFStdu3qr3E1rg4bg1AweLFBfEvTJ+IfjrcZYlVKsqgol1Zx
	 HRqnqGsUEu7yqoUCUgbhZsitwnWZSzdz7tvB72d8=
Message-ID: <99baf0a9-e9e8-49c5-a550-78c10a3ef702@arm.com>
Date: Mon, 7 Sep 2026 15:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_061412_092341_4056A326 
X-CRM114-Status: GOOD (  17.93  )
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

Hi Ben,

thanks for having a look!

On 9/7/26 14:59, Ben Horgan wrote:
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

For Yin Li's RFC patch [06/15], I was looking around to find the proper 
type for cache-id, and stumbled upon this.

> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks!

Cheers,
Andre

> 
> Thanks,
> 
> Ben
> 
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 9d223057953ab..a5e661eff86d7 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>   /* Find the L3 cache that has affinity with this CPU */
>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>   {
>> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +
>> +	if (cache_id < 0)
>> +		return -ENOENT;
>>   
>>   	lockdep_assert_cpus_held();
>>   
> 


