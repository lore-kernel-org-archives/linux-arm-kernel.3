Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8C7C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qOoA3LVJAeCTkVPfMbm4Vm9pRsN9xHcsiNmubFd1nM=; b=aCNvYJcgA9/edhVO6qTF0QD+KP
	lSecjXjG75ueKnfUvKM+lYfA2/tu+9u2CwgWIs1XInwLh5yy9YX6o3nUEKaNQQPp0fnwdmUFts3VZ
	ULXCeQgVXgPykfKBtu6LxXrDhOK3glZ5SFHzFvRhDGpAp+ujjQTHtULYIqn9ctGyAwp/vl+KkysHi
	YC8ILRVn2cykqhTT9Y5os0UfbCRNWU5ejhOp0fu0qdEtzVKr0TiZ6dgI4erGVREZ0MN49AvhGA0wt
	re7AEwQy+4+0K7DerkENhGDIPOeNBFCpfjMoJuE/V5XI2sIPWAKfFGlulRBmMxVrOKN9FNXMJMu5h
	ODQCMrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxXT-000000068XU-2wB1;
	Wed, 02 Apr 2025 12:49:51 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxM6-000000066Oc-0Ox1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:38:07 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532CbN0f3241854
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 07:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743597443;
	bh=4qOoA3LVJAeCTkVPfMbm4Vm9pRsN9xHcsiNmubFd1nM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gDeoq9iu0w5moioITpXaWzK1YWwZkMwmmrVhnKQM60yYkUx9zFlXdUoaRrIxuyxu3
	 0876/n+IAnhhIimjd/X49IGjjUrJI6o8G7PgO1bG3dvYdb7f1qXxe2mE+yFca+Nd9p
	 4qa2UqZOzY1pOof5+dgSWzCV+YknEskwRNCJ363U=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532CbNrc019560
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 07:37:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 07:37:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 07:37:22 -0500
Received: from [172.24.17.211] (lt9560gk3.dhcp.ti.com [172.24.17.211])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532CbGDp101576;
	Wed, 2 Apr 2025 07:37:17 -0500
Message-ID: <b0a099a6-33b2-49f9-9af7-580c60b98f55@ti.com>
Date: Wed, 2 Apr 2025 18:07:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] net: ti: icss-iep: Fix possible NULL pointer
 dereference for perout request
To: Roger Quadros <rogerq@kernel.org>, <dan.carpenter@linaro.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <namcao@linutronix.de>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>,
        <jacob.e.keller@intel.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <danishanwar@ti.com>
References: <20250328102403.2626974-1-m-malladi@ti.com>
 <20250328102403.2626974-4-m-malladi@ti.com>
 <0fb67fc2-4915-49af-aa20-8bdc9bed4226@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <0fb67fc2-4915-49af-aa20-8bdc9bed4226@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_053806_299938_02ACBBEC 
X-CRM114-Status: GOOD (  21.87  )
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



On 4/2/2025 5:58 PM, Roger Quadros wrote:
> Meghana,
> 
> On 28/03/2025 12:24, Meghana Malladi wrote:
>> ICSS IEP driver has flags to check if perout or pps has been enabled
>> at any given point of time. Whenever there is request to enable or
>> disable the signal, the driver first checks its enabled or disabled
>> and acts accordingly.
>>
>> After bringing the interface down and up, calling PPS/perout enable
>> doesn't work as the driver believes PPS is already enabled,
> 
> How? aren't we calling icss_iep_pps_enable(iep, false)?
> wouldn't this disable the IEP and clear the iep->pps_enabled flag?
> 

The whole purpose of calling icss_iep_pps_enable(iep, false) is to clear 
iep->pps_enabled flag, because if this flag is not cleared it hinders 
generating new pps signal (with the newly loaded firmware) once any of 
the interfaces are up (check icss_iep_perout_enable()), so instead of 
calling icss_iep_pps_enable(iep, false) I am just clearing the 
iep->pps_enabled flag.

> And, what if you brought 2 interfaces of the same ICSS instances up
> but put only 1 interface down and up?
> 

Then the flag need not be disabled if only one interface is brought down 
because the IEP is still alive and all the IEP configuration (including 
pps/perout) is still valid.

please refer for more details: 
https://lore.kernel.org/all/20241211135941.1800240-1-m-malladi@ti.com/

>> (iep->pps_enabled is not cleared during interface bring down)
>> and driver will just return true even though there is no signal.
>> Fix this by setting pps and perout flags to false instead of
>> disabling perout to avoid possible null pointer dereference.
>>
>> Fixes: 9b115361248d ("net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init")
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/all/7b1c7c36-363a-4085-b26c-4f210bee1df6@stanley.mountain/
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>>
>> Changes from v2(v3-v2):
>> - Add Reported-by tag and link to the bug reported by Dan Carpenter <dan.carpenter@linaro.org>
>> - drop calling icss_iep_perout_enable() for disabling perout and set perout to false instead
>>
>>   drivers/net/ethernet/ti/icssg/icss_iep.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> index b4a34c57b7b4..b70e4c482d74 100644
>> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> @@ -820,9 +820,9 @@ int icss_iep_exit(struct icss_iep *iep)
>>   	icss_iep_disable(iep);
>>   
>>   	if (iep->pps_enabled)
>> -		icss_iep_pps_enable(iep, false);
>> +		iep->pps_enabled = false;
>>   	else if (iep->perout_enabled)
>> -		icss_iep_perout_enable(iep, NULL, false);
>> +		iep->perout_enabled = false;
>>   
>>   	return 0;
>>   }
> 


