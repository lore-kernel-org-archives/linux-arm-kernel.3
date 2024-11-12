Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B4AD41D71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpwOasLTNVyfbMQfZUeCUaJpf2akxr+PlTXQ9gkq8Vc=; b=1u+amR0hjSujR1qYz6p4b4NGb9
	Wbj6pBcrhRu4zDVs6Gu5bMf0WNZXj2svhrygTQCf1ltDbobnUOnrZdcnqCCMbXt+Q6K71Se10bZGN
	kDHeKVxB0LbEWjQRN5Lzo00iN2Ew/q2TGh/7AP1BsXV+kUUZV98a5V7b/uZHBjdGkwmbrZ54e01w8
	kDPXTYpSuEWckCKPytN1Wr7pT2+O3/pevxb8h35uZOA0UZRy/D1vpoz2FD12DycdeOB0ODDD9Yd/4
	Cpv0nwParzZIek/Fs8MzzrsebwkuP0XUszNM0ecvkXm1fuErcXDb4NjY2rNdFrG7pkvwSSZ+KJypv
	Wd/Fnwsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAms2-00000002l1l-3Ii8;
	Tue, 12 Nov 2024 09:07:34 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmqD-00000002kks-1Iro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:05:43 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AC9554p034817;
	Tue, 12 Nov 2024 03:05:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731402305;
	bh=QpwOasLTNVyfbMQfZUeCUaJpf2akxr+PlTXQ9gkq8Vc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L6GVNo83Zj3PECMkOR/yawBo1Hixy3y0w4uRhzEKPQmW6kNdAT0q9efJ+iZFtFh+P
	 LUJd0o3t2DiUzw5S/ZCb+qrPxlmRRV/egl4hk4Pao7je+dZy++5qGP4Qmg5rgCB43m
	 LDKzOLYIIwlj0KPO8+Boo5rbgIoiBkKWE5JJ749Q=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AC955DS003156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Nov 2024 03:05:05 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Nov 2024 03:05:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Nov 2024 03:05:05 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AC950BE010639;
	Tue, 12 Nov 2024 03:05:00 -0600
Message-ID: <db77a358-a4d3-444e-971e-aa348ad8c8b7@ti.com>
Date: Tue, 12 Nov 2024 14:34:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] net: ti: icssg-prueth: Fix clearing of
 IEP_CMP_CFG registers during iep_init
To: Roger Quadros <rogerq@kernel.org>, <vigneshr@ti.com>,
        <m-karicheri2@ti.com>, <jan.kiszka@siemens.com>,
        <javier.carrasco.cruz@gmail.com>, <jacob.e.keller@intel.com>,
        <horms@kernel.org>, <diogo.ivo@siemens.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <danishanwar@ti.com>
References: <20241106074040.3361730-1-m-malladi@ti.com>
 <20241106074040.3361730-3-m-malladi@ti.com>
 <f28bf97c-783d-489c-9549-0dd0f576497e@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <f28bf97c-783d-489c-9549-0dd0f576497e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_010541_860702_074BA2FF 
X-CRM114-Status: GOOD (  30.34  )
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


On 11/11/24 19:23, Roger Quadros wrote:
> Hi,
> 
> On 06/11/2024 09:40, Meghana Malladi wrote:
>> When ICSSG interfaces are brought down and brought up again, the
>> pru cores are shut down and booted again, flushing out all the memories
>> and start again in a clean state. Hence it is expected that the
>> IEP_CMP_CFG register needs to be flushed during iep_init() to ensure
>> that the existing residual configuration doesn't cause any unusual
>> behavior. If the register is not cleared, existing IEP_CMP_CFG set for
>> CMP1 will result in SYNC0_OUT signal based on the SYNC_OUT register values.
>>
>> After bringing the interface up, calling PPS enable doesn't work as
>> the driver believes PPS is already enabled, (iep->pps_enabled is not
>> cleared during interface bring down) and driver  will just return true
>> even though there is no signal. Fix this by setting the iep->pps_enable
>> and iep->perout_enable flags to false during the link down.
>>
>> Fixes: c1e0230eeaab ("net: ti: icss-iep: Add IEP driver")
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>>   drivers/net/ethernet/ti/icssg/icss_iep.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> index 5d6d1cf78e93..03abc25ced12 100644
>> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> @@ -195,6 +195,12 @@ static void icss_iep_enable_shadow_mode(struct icss_iep *iep)
>>   
>>   	icss_iep_disable(iep);
>>   
>> +	/* clear compare config */
>> +	for (cmp = IEP_MIN_CMP; cmp < IEP_MAX_CMP; cmp++) {
>> +		regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
>> +				   IEP_CMP_CFG_CMP_EN(cmp), 0);
>> +	}
>> +
> 
> A bit later we are clearing compare status. Can clearing CMP be done in same for loop?
> 

Yes it can be done in the same loop, I will update that.

>>   	/* disable shadow mode */
>>   	regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
>>   			   IEP_CMP_CFG_SHADOW_EN, 0);
>> @@ -778,6 +784,10 @@ int icss_iep_exit(struct icss_iep *iep)
>>   		ptp_clock_unregister(iep->ptp_clock);
>>   		iep->ptp_clock = NULL;
>>   	}
>> +
>> +	iep->pps_enabled = false;
>> +	iep->perout_enabled = false;
>> +
> 
> But how do you keep things in sync with user space?
> User might have enabled PPS or PEROUT and then put SLICE0 interface down.
> Then if SLICE0 is brought up should PPS/PEROUT keep working like before?

No, why? Because either both SLICE0 and SLICE1 run when atleast one 
interface is up and both SLICE0 and SLICE1 are stopped when both the 
interfaces are brought down. So when SLICE0 is brought down, SLICE1 is 
also brought down. Next time you bring an interface up, it is a fresh 
boot for both SLICE1 and SLICE0. In this case, just like how we register 
for ptp clock (this is handled by the driver in icss_iep_init(),
pps also needs to be enabled (this has to be done by the user).

> We did call ptp_clock_unregister() so it should unregister the PPS as well.
> What I'm not sure is if it calls the ptp->enable() hook to disable the PPS/PEROUT.
> 
> If yes then that should take care of the flags as well.
> 

No, ptp_clock_unregister() doesn't unregister PPS.

> If not then you need to call the relevant hooks explicitly but just after
> ptp_clock_unregister().
> e.g.
> 	if (iep->pps_enabled)
> 		icss_iep_pps_enable(iep, false);
> 	else if (iep->perout_enabled)
> 		icss_iep_perout_enable(iep, NULL, false);
> 

This doesn't work because if pps_enabled is already true, it goes to 
icss_iep_pps_enable(), but inside it checks if pps_enabled is true, if 
so it returns 0, without acutally enabling pps. Which is why we need to 
set pps_enable and perout_enable to false.

> But this means that user has to again setup PPS/PEROUT.	
> 

So yes, this is the expected behavior for user to setup PPS/PEROUT after 
bringing up an interface. To clarify when user needs to again setup PPS:

1. eth1 and eth2 are up, and one interface is brought down -> PPS/PEROUT 
will be working the same
2. No interface is up, and one interface is brought up -> PPS/PEROUT 
needs to be enabled

>>   	icss_iep_disable(iep);
>>   
>>   	return 0;
> 

