Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97755C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6cER3ficNDF4FhcfcYO1N7q4wJKI5SWkwqRzuLuAeM=; b=WKo0rk7/KYQouBoWY1/crZjeWh
	k0qLkueAkZXVEvKAJrtRHlsaQ58S7662viUagHm/SsMmyQZDX4lsodk+R7HknQhQp1uaO/MlnZwEe
	6WaekHqxb8K4lsjnhJRr7PyeOHQL1dFfJdfL6hEt0fPRB8i1Z5SXYDDQNeKepDTTTJXkIjQgdrGTz
	4h+scpwQsAf+HjuoO3BKCfI7UQVlQ9qsPhzABp0ZjBrRw6VP/tchb4NpVOYgQLbotmpyCTBNQLGoJ
	9EBoQpuAuDcxr5UJa6lB6JG3Ry6dDMc87/YQwdspG/AI0t7XT4ifPFKfykB4UK9ZTbSLSk6zJRVJG
	a+6ziEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcpi-0000000Fnbg-3zBT;
	Thu, 29 May 2025 12:58:06 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcIe-0000000FiwE-2ORr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:23:57 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TCNmcb3516960;
	Thu, 29 May 2025 07:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748521428;
	bh=t6cER3ficNDF4FhcfcYO1N7q4wJKI5SWkwqRzuLuAeM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XWTLZMYWWFxT/mYUd2ZX48f7/r7RmX7tip+47bt6JQcGFi1zglwp/Zh3ir8ayywkP
	 GpE/ARyRWvCj0LePc/WpKJ0+gi+Ww6G4+F3KN5KhtUFYZqqu6nw0DqrjdvPOPc5uk9
	 V/1fbn/XThiX3Qe6G39d0mvrWcEvsQodZSCja+7w=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TCNm7c2164812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 07:23:48 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 07:23:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 07:23:48 -0500
Received: from [172.24.18.242] (lt9560gk3.dhcp.ti.com [172.24.18.242])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TCNhtB1577009;
	Thu, 29 May 2025 07:23:44 -0500
Message-ID: <c9cd4687-0959-4e1f-8a44-a34b74da43a7@ti.com>
Date: Thu, 29 May 2025 17:53:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix swapped TX stats for MII
 interfaces.
To: Simon Horman <horms@kernel.org>
CC: <saikrishnag@marvell.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250527121325.479334-1-m-malladi@ti.com>
 <20250528161250.GE1484967@horms.kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250528161250.GE1484967@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_052356_776111_CA2256AF 
X-CRM114-Status: GOOD (  18.03  )
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

Hi Simon,

On 5/28/2025 9:42 PM, Simon Horman wrote:
> On Tue, May 27, 2025 at 05:43:25PM +0530, Meghana Malladi wrote:
>> In MII mode, Tx lines are swapped for port0 and port1, which means
>> Tx port0 receives data from PRU1 and the Tx port1 receives data from
>> PRU0. This is an expected hardware behavior and reading the Tx stats
>> needs to be handled accordingly in the driver. Update the driver to
>> read Tx stats from the PRU1 for port0 and PRU0 for port1.
>>
>> Fixes: c1e10d5dc7a1 ("net: ti: icssg-prueth: Add ICSSG Stats")
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
>> ---
>>   drivers/net/ethernet/ti/icssg/icssg_stats.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/net/ethernet/ti/icssg/icssg_stats.c
>> index 6f0edae38ea2..0b77930b2f08 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
>> @@ -29,6 +29,10 @@ void emac_update_hardware_stats(struct prueth_emac *emac)
>>   	spin_lock(&prueth->stats_lock);
>>   
>>   	for (i = 0; i < ARRAY_SIZE(icssg_all_miig_stats); i++) {
> 
> Hi Meghana,
> 
> Perhaps it would be nice to include a comment here.
> 

That makes sense, sure will do that.

>> +		if (emac->phy_if == PHY_INTERFACE_MODE_MII &&
>> +		    icssg_all_miig_stats[i].offset >= ICSSG_TX_PACKET_OFFSET &&
>> +		    icssg_all_miig_stats[i].offset <= ICSSG_TX_BYTE_OFFSET)
>> +			base = stats_base[slice ^ 1];
>>   		regmap_read(prueth->miig_rt,
>>   			    base + icssg_all_miig_stats[i].offset,
>>   			    &val);
>>
>> base-commit: 32374234ab0101881e7d0c6a8ef7ebce566c46c9
>> -- 
>> 2.43.0
>>
>>

-- 
Thanks,
Meghana Malladi


