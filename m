Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F88E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts7bXD1SAvy7yjkG5t1YQWq2nxMEKMpiw1Mf7wcCWvg=; b=2AeCAbcVOGjnM7PzKOztUdbiDX
	Tx/VXJL1KZeI+pqkVEPaqIZP0hoc71dxqzObMmisbeDSh3hTaCgNisdfKBK6BtrzMFDqyxgOTeBwu
	4i46MZCR1h2OqoVYwePF69FyNUYNs5C1WR2O3DFlnIJaztaWPfUe3U0h+5XDubbbrj3sBavnj1vm0
	ugCECvZ5RQNbkY8q3/8O6peYS1CkKCZJuQQnFHF6U3GmKHgDDQsWT88mJZp0t0J1J1omOGRQOwITd
	I7iaAqXpme3GAympNS9Q0/Cg8jYOpuznN/pocMhb27tHwT2O6DiVtExaF79/ts3I1JKh+2ljybQLP
	n/CvUohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXit-00000004CW1-39GT;
	Fri, 20 Dec 2024 07:46:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXhj-00000004COm-3zb4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 07:45:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YDztw14Y3zXp8G;
	Fri, 20 Dec 2024 15:43:52 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 970C814010D;
	Fri, 20 Dec 2024 15:45:37 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Dec 2024 15:45:36 +0800
Message-ID: <b6fe1fdb-5c28-9a2e-c000-12b26a6222b7@huawei.com>
Date: Fri, 20 Dec 2024 15:45:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 5/5] arm_mpam:
 Adapting the closid/rmid matching determination functions
To: Dave Martin <Dave.Martin@arm.com>
CC: <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<xiexiuqi@huawei.com>, "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <20241207092136.2488426-6-zengheng4@huawei.com>
 <Z1sNHFhpYlPvVANC@e133380.arm.com>
Content-Language: en-US
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <Z1sNHFhpYlPvVANC@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_234548_333222_5953BA22 
X-CRM114-Status: GOOD (  26.79  )
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



On 2024/12/13 0:19, Dave Martin wrote:
> Hi,
> 
> On Sat, Dec 07, 2024 at 05:21:36PM +0800, Zeng Heng wrote:
>> According to the previous patches, add the inverse functions for the
>> closid/rmid conversion functions to serve as the conversion functions for
>> reqpartid/pmg. And adapt the matching determination functions
>> resctrl_arch_match_closid() and resctrl_arch_match_rmid() by the inverse
>> functions.
>>
>> For the same reason, when updating the (req)PARTID/PMG pair for a task,
>> the new conversion functions also are used for adaptation.
>>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> ---
>>   arch/arm64/include/asm/mpam.h              |  6 ++-
>>   drivers/platform/arm64/mpam/mpam_resctrl.c | 63 +++++++++++++++-------
>>   2 files changed, 47 insertions(+), 22 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
>> index e5f385767174..9fc095530671 100644
>> --- a/arch/arm64/include/asm/mpam.h
>> +++ b/arch/arm64/include/asm/mpam.h
>> @@ -93,6 +93,8 @@ static inline u64 mpam_get_regval(struct task_struct *tsk)
>>   #endif
>>   }
>>   
>> +u32 rmid2pmg(u32 rmid);
>> +
>>   static inline void resctrl_arch_set_rmid(struct task_struct *tsk, u32 rmid)
>>   {
>>   #ifdef CONFIG_ARM64_MPAM
>> @@ -100,8 +102,8 @@ static inline void resctrl_arch_set_rmid(struct task_struct *tsk, u32 rmid)
>>   
>>   	regval &= ~MPAM1_EL1_PMG_D;
>>   	regval &= ~MPAM1_EL1_PMG_I;
>> -	regval |= FIELD_PREP(MPAM1_EL1_PMG_D, rmid);
>> -	regval |= FIELD_PREP(MPAM1_EL1_PMG_I, rmid);
>> +	regval |= FIELD_PREP(MPAM1_EL1_PMG_D, rmid2pmg(rmid));
>> +	regval |= FIELD_PREP(MPAM1_EL1_PMG_I, rmid2pmg(rmid));
> 
> Note, this function does not seem to be used; I added a patch in my
> series [1] to get rid of it instead of converting it.
> 

At that time, I was still hesitating whether to directly delete that 
function. Yes, I will skip the adaptation of this function.

>>   
>>   	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
>>   #endif
>> diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
> 
> [...]
> 
>>   void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
>>   {
>> -	BUG_ON(closid > U16_MAX);
>> -	BUG_ON(rmid > U8_MAX);
>> +	u32 reqpartid = closid_rmid2reqpartid(closid, rmid);
>> +	u32 pmg = rmid2pmg(rmid);
>> +	u32 partid_d, partid_i;
>> +
>> +	BUG_ON(reqpartid > U16_MAX);
>> +	BUG_ON(pmg > U8_MAX);
>>   
>>   	if (!cdp_enabled) {
>> -		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
>> +		mpam_set_cpu_defaults(cpu, reqpartid, reqpartid, pmg, pmg);
>>   	} else {
>>   		/*
>>   		 * When CDP is enabled, resctrl halves the closid range and we
>>   		 * use odd/even partid for one closid.
>>   		 */
>> -		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
>> -		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
>> +		partid_d = resctrl_get_config_index(reqpartid, CDP_DATA);
>> +		partid_i = resctrl_get_config_index(reqpartid, CDP_CODE);
>>   
>> -		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
>> +		mpam_set_cpu_defaults(cpu, partid_d, partid_i, pmg, pmg);
> 
> Prior to this patch, will the PARTID and/or PMG programmed for a
> control group be different from the PARTID and/or PMG used to program
> the MSCs?
> 
> If so, those changes probably need to be in the same patch.
> 

Thanks to point it out. It's reasonable to put setting PARTID/PMG 
operations together with the closid/rmid pair remapping.

> 
>> @@ -289,41 +307,46 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
> 
> [...]
> 
>>   /* The task's pmg is not unique, the partid must be considered too */
>>   bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
>>   {
>>   	u64 regval = mpam_get_regval(tsk);
>> -	u32 tsk_closid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
>> -	u32 tsk_rmid = FIELD_GET(MPAM1_EL1_PMG_D, regval);
>> +	u32 tsk_pmg = FIELD_GET(MPAM1_EL1_PMG_D, regval);
>> +	u32 tsk_partid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
>>   
>>   	if (cdp_enabled)
>> -		tsk_closid >>= 1;
>> +		tsk_partid >>= 1;
>>   
>> -	return (tsk_closid == closid) && (tsk_rmid == rmid);
>> +	return (reqpartid2closid(tsk_partid) == closid) &&
>> +	       (reqpartid_pmg2rmid(tsk_partid, tsk_pmg) == rmid);
> 
> Do we actually need the reverse mappings here?
> 
> It doesn't really matter which ID namespace is used for the
> comparison, so in my version of this I converted the passed-in closid
> and rmid to PARTID / PMG form and then compared those with tsk's
> values.
> 
> (But if I've missed some subtlety here, please let me know!)
> 

Yes, we actually don't need the reverse mappings, and reuse the
closid_rmid2reqpartid() and rmid2pmg() to finish the comparison.

Best regards,
Zeng Heng

