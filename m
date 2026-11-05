Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730B8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2T9Wxcjg;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=qcMq0vmm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xmDWGutiin4uCx8kXq9+NVdqng5FIqT+d5iQkfyQ+W8=; b=2T9WxcjgaMDMv5
	tBcAC+zIKhRUhNEZq56Jlfk+pzF64Ary8GsbpbLJCjgK06XiJdSaAAGqhV2Fe++TQZtD7I+U9vTcn
	k7M4X+CfYjjtZFqQtF6Z5hq7ntyJljkNTi9aCMHB5+3IPXQyr+otUk19r4CarQ5vV800hz8iLVjqX
	eEEJx41MWPeofXBjp3srAtYuDUeVYSnq1OKKXOD62cFQOLLhpIhY3LaE/GMUYbwmZJlfcUB/AzXX6
	NAqHJ6K+WSP5Sm6v1/A+7VEoEY5cZN7uJxqtXmuYQhuZkQTrkJv6DNYT2St6vENucPr3WNFz0f6uP
	HlWxVWPksPhFfhpQQVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrhz-000000080gH-0gXs;
	Thu, 05 Nov 2026 07:16:27 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrhv-000000080fk-3N4Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 07:16:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xmDWGutiin4uCx8kXq9+NVdqng5FIqT+d5iQkfyQ+W8=;
	b=qcMq0vmmCG+QJ06/5tuCyDejH+9yDD2CBbqRmS3yCn7bs80aWley02L2N3S3jymkY6dVNZTl0
	eY9OZcUVoMN0yt45VCA0PDWf7LeBJ+jz9ewSY+sKYXs4siDGDsr21dnT3I8sFeaTOe8nIKeHVq/
	rGeLwyEATGTYaN2icQF11Rw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jKtrY68hyz1T4KC;
	Thu,  5 Nov 2026 15:15:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D2FA940538;
	Thu,  5 Nov 2026 15:16:18 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:16:18 +0800
Message-ID: <b2d59ec8-31f3-4454-9127-0cea58d27716@huawei.com>
Date: Thu, 5 Nov 2026 15:16:17 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Round the CDP RMID count down to whole CLOSIDs
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261104101622.563280-1-ruanjinjie@huawei.com>
 <45efa783-21b4-4f67-a0fd-c6772d5cb038@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <45efa783-21b4-4f67-a0fd-c6772d5cb038@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_231624_166435_2C7AAE12 
X-CRM114-Status: GOOD (  21.77  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/4 22:21, Ben Horgan 写道:
> Hi Jinjie,

Hi Ben,

> 
> For patches touching the glue between MPAM and resctrl, essentially mpam_resctrl.c, the prefix used
> is 'arm_mpam: resctrl' rather than just 'arm_mpam'.

The following will be done in this format.

> 
> On 04/11/2026 10:16, Jinjie Ruan wrote:
>> resctrl_arch_set_cdp_enabled() halves the whole RMID index space, while
>> the resctrl core halves the CLOSID count: schemata_list_add() divides a
>> CDP resource's schema by two, and closid_init() takes the smallest
>> across the schemata.
>>
>> When the PMG count and the CLOSID count are both odd, halving the
>> product counts RMIDs that belong to a CLOSID resctrl never allocates.
>> With 3 PMGs and 5 CLOSIDs MPAM reports 7 RMIDs, but the 2 CLOSIDs that
>> resctrl has times 3 PMGs only allow 6. The count is visible in
>> /sys/fs/resctrl/info/L3_MON/num_rmids, so userspace reads a value that
>> includes RMIDs no CLOSID can use; 
> 
> Good spot.
> 
> It occurs to me that 'num_rmids' is also too high on a monitor only system too as there is only one
> PARTID that can be used.  Can you see a clean way to fix this in one go?

I will have a try to fix both problems in a clean way, thank you very much.

> 
> Thanks,
> 
> Ben
> 
> RMID allocation itself is bounded by
>> the free list.
>>
>> Derive the number of RMID groups from the index space and halve that, so
>> the count follows resctrl_arch_system_num_rmid_idx().
>>
>> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.1.x
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Ben Horgan <ben.horgan@arm.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Fenghua Yu <fenghuay@nvidia.com>
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5468367776e2..d3f957162b68 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -217,10 +217,16 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  	cdp_enabled = enable;
>>  	mpam_resctrl_controls[rid].cdp_enabled = enable;
>>  
>> -	if (enable)
>> -		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
>> -	else
>> +	if (enable) {
>> +		u32 num_group;
>> +
>> +		/* Halve the number of RMID groups, keeping whole PMG rows. */
>> +		num_group = resctrl_arch_system_num_rmid_idx() /
>> +			    (mpam_pmg_max + 1);
>> +		l3->mon.num_rmid = (mpam_pmg_max + 1) * (num_group / 2);
>> +	} else {
>>  		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
>> +	}
>>  
>>  	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
>>  	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
> 

-- 
Best regards,
Jinjie


